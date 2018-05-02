																													  									   														  ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:36 08/08/2008 
-- Design Name: 
-- Module Name:    token_trigger_controller - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity token_trigger_controller is
    Port ( 						  
		
		
		--parameters		
		trig_repetition_per : in STD_LOGIC_VECTOR(15 downto 0); 	-- clock edges between triggers
		inject_trig_gap : in STD_LOGIC_VECTOR(7 downto 0); 		-- clock edges between inject and trigger
		trig_token_gap : in STD_LOGIC_VECTOR(15 downto 0); 		-- clock edges between trigger and token
		num_of_triggers : in STD_LOGIC_VECTOR(7 downto 0); 		-- num of triggers to send per software enable pulse, 0 means free running	  
		is_ext_mode : in std_logic;	 							-- when in ext trigger mode, only generated item is token.	 
			--NOTE ADDED pass through of external trigger when in ext mode
		use_cal_inject : in std_logic;	 						-- includes calibration inject pulse.
		
		-- control
		sw_en_pulse : in std_logic;	
		param_we : in std_logic;
		
		ext_trigger : in std_logic;				
		
		-- outputs
		token : out std_logic;
		trigger : out std_logic;
		busy : out std_logic;
		
		error : out std_logic; -- must be reset to clear
		
		-- clock/reset
		master_clk : in std_logic;		
		psi_clk : in std_logic;
		rst : in std_logic
		);
end token_trigger_controller;

architecture Behavioral of token_trigger_controller is

-- paramter registers
signal trig_repetition_per_reg : STD_LOGIC_VECTOR(15 downto 0); 	-- clock edges between triggers
signal inject_trig_gap_reg : STD_LOGIC_VECTOR(15 downto 0); 		-- clock edges between inject and trigger
signal trig_token_gap_reg : STD_LOGIC_VECTOR(15 downto 0); 		-- clock edges between trigger and token
signal num_of_triggers_reg : STD_LOGIC_VECTOR(7 downto 0); 		-- num of triggers to send per software enable pulse, 0 means free running   
signal is_ext_mode_reg  : std_logic;	 							-- when in ext trigger mode, only generated item is token.	 
signal use_cal_inject_reg  : std_logic;							 -- includes calibration inject pulse.


signal shared_start  : std_logic;	   
signal shared_end  : std_logic;	  	   
signal shared_force_stop  : std_logic;

--main clk process
--signal shared_end_old : std_logic;
signal error_sig : std_logic;	   
signal shared_end_old  : std_logic; 
signal shared_end_old2  : std_logic; 

--psi process
signal is_running  : std_logic;
signal shared_start_old  : std_logic;  	
signal shared_start_old2  : std_logic; 
signal psi_counter : STD_LOGIC_VECTOR(15 downto 0);	
signal rep_counter : STD_LOGIC_VECTOR(7 downto 0);	
signal trig_sig  : std_logic;
signal inj_sig  : std_logic;		 

--token fifo delay of 2
signal token_delay_0  : std_logic; 
signal token_delay_1  : std_logic;  
		
begin
	
	error <= error_sig;		   
	trigger <= trig_sig or inj_sig;--when is_ext_mode_reg = '0' else ext_trigger;
	busy <= shared_start;
		
	main:process(psi_clk)
	begin		 
		if rising_edge(psi_clk) then 
			
			shared_start_old <= shared_start; 
			shared_start_old2 <= shared_start_old; 
			
			trig_sig <= '0';
			inj_sig <= '0';
			
			token_delay_0 <= '0';
			
			token_delay_1 <= token_delay_0;
			token <= token_delay_1;
			
			if rst = '1' then 	  
				
				is_running <= '0';
				shared_end <= '0';
				
			else
							  
				if shared_start_old2 = '0' and shared_start_old = '1' and shared_start = '1' then
					
					if num_of_triggers_reg = 0 then -- if continuous run then signal end so that future commands are not considered errors
						shared_end <= '1';
					end if;
					
					is_running <= '1';	 	   
					
					psi_counter <= (others => '0');
					rep_counter	<= (others => '0');	
					
					if is_ext_mode_reg = '1' then  
						psi_counter <= (others => '1');	 
					else
						psi_counter <= (others => '0');
					end if;
		
				elsif is_running = '1' then	  
					
					if shared_force_stop = '1' then 
				    	is_running <= '0';	  
						shared_end <= '1';
					end if;
					
					if is_ext_mode_reg = '0' then
						if psi_counter = trig_repetition_per_reg then
							psi_counter <= (others => '0');		 
							
							if num_of_triggers_reg /= 0 then
								if rep_counter = num_of_triggers_reg - 1 then  
									shared_end <= '1';	 
									is_running <= '0';
								else
									rep_counter <= rep_counter + 1;
								end if;							
							end if;
						else
							psi_counter <= psi_counter + 1;
						end if;	   	   
					else   -- external mode   	  
						
						if ext_trigger = '1' then  
							psi_counter <= (others => '0');	
						elsif psi_counter < x"FFFF" then --hold at FFFF in external mode.. do not wrap around
							psi_counter <= psi_counter + 1;
						end if;
						
						
					end if;
					
					if trig_repetition_per_reg /= 0 then 	 
						
							-- trigger pulse
						if psi_counter = inject_trig_gap_reg + 1 or psi_counter = inject_trig_gap_reg + 2 then
							trig_sig <= '1';
						end if;				 
								
							-- inject pulse	 
						if psi_counter = 0 and use_cal_inject_reg = '1' then
							inj_sig <= '1';
						end if;	
														
							-- token pulse				  
						if psi_counter = inject_trig_gap_reg + 3 + trig_token_gap_reg then
							token_delay_0 <= '1';
						end if;	 	   				
						
					end if;
					
				end if;
				
				if shared_end = '1' and shared_start_old2 = '1' and shared_start_old = '0' and shared_start = '0' then
					shared_end <= '0';
				end if;				  
				
			end if;	
			
		end if;			
	
	end process;		  
	
	
	program:process(master_clk) --programming process
	begin		 
		if rising_edge(master_clk) then		 
			
			shared_end_old <= shared_end; 
			shared_end_old2 <= shared_end_old;
			
			if rst = '1' then
				trig_repetition_per_reg <= (others => '0'); 
				inject_trig_gap_reg <= (others => '0'); 
				trig_token_gap_reg <= (others => '0'); 
				num_of_triggers_reg <= (others => '0'); 
				is_ext_mode_reg <= '0';	
				use_cal_inject_reg <= '0';		
				
				shared_start <= '0';	
				error_sig <= '0';	
				shared_force_stop <= '0';
				
			elsif error_sig = '0' then
				
				if param_we = '1' then
					trig_repetition_per_reg <=	trig_repetition_per;
					inject_trig_gap_reg <= x"00" & inject_trig_gap;
					trig_token_gap_reg <= trig_token_gap;
					num_of_triggers_reg <=  num_of_triggers;
					is_ext_mode_reg <= is_ext_mode;
					use_cal_inject_reg <= use_cal_inject;	 
					
					if is_running = '1' then
						shared_force_stop <= '1';
					end if;
				
				elsif sw_en_pulse = '1'then  
					
					shared_force_stop <= '0';
					
					if shared_start = '0' then
						shared_start <= '1';
					else
						error_sig <= '1';	 -- write occured too frequently
					end if;				
				
				end if;
				
				if shared_start = '1' and shared_end_old2 = '0' and shared_end_old = '1' and shared_end = '1' then
					
					shared_start <= '0';			
				
				end if;					
				
				
			end if;
		end if;
	end process;

end Behavioral;

