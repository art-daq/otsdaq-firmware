-------------------------------------------------------------------------------
--
-- Title       : TriggerBlock
-- Design      : Test Beam Master Station
-- Author      : Ryan Rivera
-- Company     : FNAL
-- Date 	   : 9/12/2011					  
-- 
-------------------------------------------------------------------------------

library IEEE;				
use IEEE.STD_LOGIC_1164.all;	
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;		
--use IEEE.NUMERIC_STD.ALL;				  


-- for 3 scintillators!

entity TriggerBlock is
	 port(
		 mclk : in STD_LOGIC;		 						-- master clk (used to extend scintillator pulses)
		 xclk : in STD_LOGIC;	 							-- external clk	 						 
		 rst : in STD_LOGIC;	 							-- reset	  
		 en : in STD_LOGIC;	 								-- trigger enable (used to throttle)	  
		 scin : in STD_LOGIC_VECTOR(2 downto 0);	   		-- 3 scintillators				
		 
		 --delay params written in master clock domain
		 we : in STD_LOGIC;	
		 master_clk_delay : in STD_LOGIC_VECTOR(3 downto 0);	   		-- master clock delay before FIFO 	    
		 psi_clk_delay : in STD_LOGIC_VECTOR(7 downto 0);	   		-- psi clock delay in FIFO		
		 													  													  
		 trig_fifo_ts : out STD_LOGIC_VECTOR(7 downto 0);	   		-- psi clock timestamp to FIFO			     
		 trig_fifo_we : out STD_LOGIC;	   							-- psi clock we to FIFO			
		 trig_fifo_empty : in STD_LOGIC;							--when not empty, there are trigger in FIFO			 
		 trig_fifo_read : in STD_LOGIC_VECTOR(7 downto 0); 			-- timestamp from FIFO	 		     
		 trig_fifo_re : out STD_LOGIC;	   							-- psi clock re to FIFO				

		 --for psi clk mark on trigger		      
		 trig_mask_en : in STD_LOGIC;								-- MCLK domain xclk mask enable
		 trig_mask_hi : in STD_LOGIC;							-- MCLK domain xclk mask out high 1 or low 1 portion of clock
		 
		 veto_duration : in STD_LOGIC_VECTOR(19 downto 0);	   		-- length of trigger rejection in xclk periods	
		 
		 busy : out STD_LOGIC;							    -- 1 if not responsive to triggers			
		 trig_out : out STD_LOGIC						  	-- trigger output (clocked to external clock: "101" - trigger)
	     );
end TriggerBlock;	   
																												 
architecture TriggerBlock of TriggerBlock is				   	  

	signal scin_sig,scin_mclk : STD_LOGIC_VECTOR(2 downto 0);	   			-- 3 scintillators
	signal scin_cnt_sig : STD_LOGIC_VECTOR(3*3-1 downto 0);	   -- count up to 5 for each scintillator to extend pulse by 40 ns	    									   
	signal read_state_sig : STD_LOGIC_VECTOR(2 downto 0);	   			-- read to fifo state  									     									   
	signal write_state_sig : STD_LOGIC_VECTOR(2 downto 0);	   			-- write to fifo states
	signal coinc,delay_coinc : STD_LOGIC; 					-- extended coincidence found (only accept long trigger pulses).. delay coinc goes to psi domain
	signal tmp_coinc : STD_LOGIC;				-- tmp real time coincidence	
	signal coinc_count : STD_LOGIC_VECTOR(3 downto 0);--integer range 0 to 15;		
	
	signal mask_trig_sig : STD_LOGIC;				-- tmp real time coincidence	 
	signal trig_fifo_we_sig : STD_LOGIC;				-- tmp real time coincidence	
																												 
	signal master_clk_delay_cnt : STD_LOGIC_VECTOR(3 downto 0);	   		-- master clock delay before FIFO 
	signal master_clk_delay_reg : STD_LOGIC_VECTOR(3 downto 0);	   		-- master clock delay before FIFO 	    
	signal psi_clk_delay_cnt : STD_LOGIC_VECTOR(7 downto 0);	   		-- psi clock delay in FIFO		    
	signal psi_clk_delay_reg : STD_LOGIC_VECTOR(7 downto 0);	   		-- psi clock delay in FIFO		
	
	
	signal veto_duration_sig : STD_LOGIC_VECTOR(19 downto 0);	   		-- psi clock delay in FIFO		
		
begin		
	
	trig_fifo_we <= trig_fifo_we_sig and mask_trig_sig; --apply mask
	
	--==========================================================================
	--find scintillator coincidence and save to fifo, then read out after psi_clk_delay_reg and create trigger pattern		 					  	
	process (xclk)
	begin
		if rising_edge(xclk) then	
			
			trig_fifo_we_sig <= '0';				
			trig_fifo_re <= '0';   
			trig_out <= '0';   
			
			if rst = '1' or en = '0' then 
				
				write_state_sig <= "011"; --init state so that coincidence resets	 
				read_state_sig <= "000"; --init to wait state	 
				busy <= '1';	   
				trig_fifo_ts <= (others => '0');	
				psi_clk_delay_cnt <= (others => '0');
				
			else	   	 			  				
				
				psi_clk_delay_cnt <= psi_clk_delay_cnt + 1;	   --free running
				
					--write to fifo (must be busy for longer than read fifo takes to run.. or else 2nd trig could be skipped due to delay being missed)
				if write_state_sig = "000" and delay_coinc = '1' then   --have trigger!! else stay in waiting state 
					trig_fifo_we_sig <= '1';		 									 --write trigger to FIFO
					busy <= '1';	
					trig_fifo_ts <= psi_clk_delay_cnt + psi_clk_delay_reg;
					write_state_sig <= "001";  
				elsif write_state_sig = "001" then --delay state
					write_state_sig <= "010"; 
					veto_duration_sig <= (others => '0');
				elsif write_state_sig = "010" then  --delay state	
					veto_duration_sig <= veto_duration_sig + 1;
					if veto_duration_sig = veto_duration then
						write_state_sig <= "011";  --move on after veto delay
					end if;
				elsif write_state_sig = "011" and delay_coinc = '0' then 		 -- reset state.. next state is waiting state for triggers	
					write_state_sig <= "000";		-- if no coinc, then has been unresponsive to triggers for 3 external clock periods			
					busy <= '0';
				end if;
																			  										
					--read from fifo
				if read_state_sig = "000" and trig_fifo_empty = '0' and trig_fifo_read = psi_clk_delay_cnt then --	have trigger after proper delay	  
					trig_fifo_re <= '1';
					read_state_sig <= "001";
					trig_out <= '1';   
				elsif read_state_sig = "001" then 
					read_state_sig <= "010"; 
				elsif read_state_sig = "010" then 			 
					trig_out <= '1';
					read_state_sig <= "011";  
				elsif read_state_sig = "011" then 		 -- reset state.. next state is waiting state for triggers	
					read_state_sig <= "000";		-- if not coming out of reset/disable, then has been unresponsive to triggers for 3 external clock periods	
				end if;
				
			end if;	
			
		end if;	 		
	end process;	 			
	
	--==========================================================================
	--extend scintillator signals  
	--assume mclk is much faster than external clock
	process (mclk)
	begin
		if rising_edge(mclk) then	
							
			scin_mclk(0) <= scin(0);
			scin_mclk(2 downto 1) <= (others => '1');
			scin_sig <= (others => '0'); 
			tmp_coinc <= '0';							
			
			if rst = '1' then 
				
				for i in 0 to 2 loop	
					scin_cnt_sig((i+1)*3-1 downto i*3) <= (others => '0');
				end loop;	
				coinc <= '0';		 
				coinc_count <= (others => '0'); 	  
				master_clk_delay_cnt <= (others => '0');   
				master_clk_delay_reg <= (others => '0'); 
				psi_clk_delay_reg <= (others => '0'); 	   
				mask_trig_sig <= '1'; --default to no mask
				
			else							 
					 
								  
				-- look for coincidence	  
				if scin_sig(0) = '1' and scin_sig(1) = '1' and scin_sig(2) = '1' then 
					tmp_coinc <= '1';	 
					if coinc_count < 10 then				-- look for a long pulse because of nim (>80ns)
						coinc_count <= coinc_count + 1;
					end if;
				else  
					coinc_count <= (others => '0'); 
				end if;									
									   
				
				--put master delay on coincidence
				if coinc = '1' then
				
					if master_clk_delay_cnt = master_clk_delay_reg then
						delay_coinc <= '1';	  
						master_clk_delay_cnt <= (others => '0');   
						coinc <= '0';
						
						if trig_mask_en = '1' and trig_mask_hi = xclk then	  --mask out trigger
							mask_trig_sig <= '0';
						end if;
						
					else
						master_clk_delay_cnt <= master_clk_delay_cnt + 1;
					end if;
					
				elsif coinc_count = 10 and delay_coinc = '0' then   	-- if real time coincidence lasts for 10 master clocks... and ready for next coinc
					coinc <= '1';	--there is a trigger!!															
				elsif (write_state_sig = "011" or en = '0') and tmp_coinc = '0' then -- reset coinc signal when xclk process is ready (and when there is no mclk domain tmp_coinc)
					delay_coinc <= '0';			 --ready for next coinc!!
					mask_trig_sig <= '1'; --default to no mask
				end if;		 
				
				
					
					
				--extend scintillator signals for coincidence
				for i in 0 to 2 loop	 	 	-- 3 scintillators
										
					if scin_mclk(i) = '1' then
						scin_cnt_sig((i+1)*3-1 downto i*3) <= "000";	-- set count for 5 clock (8ns * 5 = 40 ns) extension
						scin_sig(i) <= '1';		 
					elsif scin_cnt_sig((i+1)*3-1 downto i*3) /= "000" then
						scin_sig(i) <= '1';	
						scin_cnt_sig((i+1)*3-1 downto i*3) <= scin_cnt_sig((i+1)*3-1 downto i*3) - 1;
					end if;					
					
				end loop;			
				
				--latch params
				if we = '1' then
					master_clk_delay_reg <= master_clk_delay;
					psi_clk_delay_reg <= psi_clk_delay;
				end if;
				
			end if;
			
		end if;	 		
	end process;	 	

end TriggerBlock;