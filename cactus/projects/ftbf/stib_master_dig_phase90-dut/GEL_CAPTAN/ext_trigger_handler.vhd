----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:57 05/21/2009 
-- Design Name: 
-- Module Name:    External_Trigger_Handler - Behavioral 
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

entity External_Trigger_Handler is
    Port ( ext_clk : in  STD_LOGIC;
           ext_trigger : in  STD_LOGIC;
           master_clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;			  
			  
           psi_clk : in  STD_LOGIC;
           psi_trigger : in  STD_LOGIC;
           psi_trig : out  STD_LOGIC;  -- condition trigger signal for chip, synchronous with psi clk
			  
           trig_num : out  STD_LOGIC_VECTOR (15 downto 0)); -- output is synchronous with master clk
end External_Trigger_Handler;

architecture Behavioral of External_Trigger_Handler is

--master domain signals:
signal reset_sync : std_logic;
signal increment_old,rst_count_old : std_logic;	   
signal trig_num_sig : STD_LOGIC_VECTOR (15 downto 0);

--external domain signals:
signal increment, rst_count : std_logic;
signal ext_trig_old1, ext_trig_old2, ext_trig_old3 : std_logic; --used as mask to locate reset_count and trigger commands
signal give_psi_trig : std_logic;

--psi domain signals:
signal give_psi_trig_old : std_logic; 	
signal rst_give_trig : std_logic; 	 	
signal psi_trig_sig : std_logic; 	

begin
	
	trig_num <= trig_num_sig;	 
	psi_trig <= psi_trig_sig;
	
	------------------------------------------------
	master_domain: process(master_clk)
	begin
	
		if rising_edge(master_clk) then
		
			increment_old <= increment;
			rst_count_old <= rst_count;
		
			if reset = '1' then
				trig_num_sig <= (others => '0');
				reset_sync <= '1';
			elsif reset_sync = '1' and increment = '0' and rst_count = '0' and give_psi_trig = '0' then -- wait for ext domain process to settle into known state
				reset_sync <= '0';
			else
				--main loop
					
				
				if rst_count = '1' and rst_count_old = '0' then --found rising edge
					trig_num_sig <= (others => '0');   
				elsif increment = '1' and increment_old = '0' then --found rising edge
					trig_num_sig <= trig_num_sig + 1;
				end if;
			end if;

		end if;
	
	end process;
	
	--NOTE: Assume ext clock is slower than master clk!
	------------------------------------------------
	ext_domain: process(ext_clk)
	begin
	
		if rising_edge(ext_clk) then
		
			ext_trig_old1 <= ext_trigger;
			ext_trig_old2 <= ext_trig_old1;
			ext_trig_old3 <= ext_trig_old2;
			
			if reset_sync = '1' then		  -- cant use normal reset signal here because external clock may not be running at startup
				rst_count <= '0';
				give_psi_trig <= '0';
			else
				--main loop
				
				if ext_trigger = '0' and ext_trig_old1 = '1' and ext_trig_old2 = '0' and ext_trig_old3 = '0' then -- TRIGGER COMMAND
					
					if rst_give_trig = '0' then	  -- if triggers come to fast, they will be skipped								
						give_psi_trig <= '1';
					end if;
					
				elsif ext_trigger = '0' and ext_trig_old1 = '1' and ext_trig_old2 = '1' and ext_trig_old3 = '0' then -- RESET COMMAND
				   rst_count <= '1';
				end if;
				
			end if;
			
			if give_psi_trig = '1' and rst_give_trig = '1' then -- reset give psi trigger signal
				give_psi_trig <= '0';
			end if;
			
				-- keep control signals to one clk width
			if rst_count = '1' then
				rst_count <= '0';
			end if;
		
		end if;
	
	end process;
	
	-- NOTE: Assume psi clk is slower than external clk
	------------------------------------------------
	psi_domain: process(psi_clk)
	begin
	
		if rising_edge(psi_clk) then
			
			give_psi_trig_old <= give_psi_trig;
			
			if reset = '1' then		   
				increment <= '0';
				psi_trig_sig <= '0'; 
				rst_give_trig <= '0';
			else
				-- main loop
				
				if give_psi_trig = '1' and give_psi_trig_old = '0' then -- found rising edge   
					psi_trig_sig <= '1';  
					rst_give_trig <= '1';	 
				end if;	
				
				if psi_trigger = '1' then  
					increment <= '1';	
				end if;			   
			
			end if;
			
				-- keep signals to one clk width
			if psi_trig_sig = '1' then
				psi_trig_sig <= '0';
			end if;	   
			if rst_give_trig = '1' then
				rst_give_trig <= '0';
			end if;							   
			if increment = '1' then
				increment <= '0';
			end if;
		end if;
		
	end process;

end Behavioral;

