----------------------------------------------------------------------------------
-- Company:    FNAL
-- Engineer: 	   	 Ryan Rivera
-- 
-- Create Date:    16:04:26 09/16/2013 
-- Design Name:    Calibration Controller
--						   
-- 	If not in calibration mode, pass through signals
--	If in calibration mode,	conduct handshaking with trigger and register writes					
--
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
								 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calibration_controller is
    Port ( mclk : in  STD_LOGIC;
           trigger_busy : in  STD_LOGIC;
           next_cal_trigger : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           psi_cmd_fifo_empty : in  STD_LOGIC;	 
           cal_en : in  STD_LOGIC;					
           error : out  STD_LOGIC;
           cal_ctrl_psi_cmd_fifo_empty : out  STD_LOGIC;
           cal_ctrl_sw_en_pulse : out  STD_LOGIC);
end calibration_controller;

architecture Behavioral of calibration_controller is

	signal cal_ctrl_allow_empty_sig : std_logic;	  		
	signal cal_ctrl_trig_sig : std_logic;	  
	signal cal_trigger_store : std_logic;	   		  
	
	signal reg_to_trigger_delay_cnt : STD_LOGIC_VECTOR(9 downto 0); 	-- count off before sending trigger after register fifo complete
																		-- to allow cmd serialization to ROC to finish
	
	signal error_sig : std_logic;	  
	signal latch_next_cal_trigger : std_logic;
begin							
	
	cal_ctrl_psi_cmd_fifo_empty <= psi_cmd_fifo_empty when cal_en = '0' or cal_ctrl_allow_empty_sig = '1' else '1';	 
	cal_ctrl_sw_en_pulse <= next_cal_trigger when cal_en = '0' else cal_ctrl_trig_sig;
	error <= error_sig;
	
	main: process(mclk)
	begin
		if rising_edge(mclk) then		 
			
			latch_next_cal_trigger <= next_cal_trigger;
										   
			cal_ctrl_allow_empty_sig <= '0';		 
			cal_ctrl_trig_sig <= '0';
			
			if reset = '1' or cal_en = '0' then		
				cal_trigger_store <= '0';		  	
				error_sig <= '0';	  
				reg_to_trigger_delay_cnt <= (others => '0');   -- 0 is idle
			elsif error_sig = '0' then	   --freeze activity on error
				if cal_en = '1' then
					--------------------------		 
												  
					--	If in calibration mode,	conduct handshaking with trigger and register writes
					--		Register Fifo Empty 	cal_ctrl_empty_sig
					--			- only allowed non-empty when trigger not busy and non-empty has priority over next trigger
					--		Next Trigger Run		cal_ctrl_trig_sig
					--			- only allowed when trigger not busy and register fifo empty		 
					--
					--
					---------
												 	   									
					-- handle new trigger received, is on MCLK domain so no need to double latch for rising edge
					if latch_next_cal_trigger = '0' and next_cal_trigger = '1' then 	 -- rising edge
						if cal_trigger_store = '1' then -- double store!! error
							error_sig <= '1';
						else
							cal_trigger_store <= '1'; -- store
						end if;						
					end if;
					
					
					-- handle reg cmd fifo empty, and trig starts
					if psi_cmd_fifo_empty = '0' then -- top priority is commands		
						
						if reg_to_trigger_delay_cnt > 0 then
							reg_to_trigger_delay_cnt <= (others => '1'); --(1=>'1', others => '0'); --(others => '1'); --reset trigger counter
						end if;
						
						if trigger_busy = '0' then
							cal_ctrl_allow_empty_sig <= '1';	-- allow commands if trigger is not active	
						end if;								   
						
					elsif cal_trigger_store = '1' and reg_to_trigger_delay_cnt = 0 then -- second priority, start counter if trigger in store and count idle								   
						
						-- allow trigger if no commands, and trigger not active	
					   	if trigger_busy = '0' and psi_cmd_fifo_empty = '1' then 	  	
							reg_to_trigger_delay_cnt <= (others => '1'); --(1=>'1', others => '0'); --(others => '1'); --start trigger counter	   
							cal_trigger_store <= '0';			-- clear trigger store 
						end if;											  
						
					elsif reg_to_trigger_delay_cnt > 0 then	-- output trigger after counts.. 0 is idle    
						
						reg_to_trigger_delay_cnt <= reg_to_trigger_delay_cnt - 1;
						if reg_to_trigger_delay_cnt = 1 then	   
						 	cal_ctrl_trig_sig <= '1';	 			 	 				 
						end if;									   
						
					end if;			  
					
					
					
					--------------------------		   
				end if;
			end if;
		end if;
	end process;
	

end Behavioral;

