----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	 Ryan Rivera
-- 
-- Create Date:    11/19/2009 
-- Design Name: 
-- Module Name:    Token Counter
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	For every sent token, inc token counter. For every sent trigger, inc trigger counter.
--					Counters are readable on Master Clock. Writeable on PSI_CLK90.
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
								  

entity Trigger_Counter_Block is
    Port ( 
			  master_clk : in  STD_LOGIC;
           psi_trigger : in  STD_LOGIC;	 
           reset : in  STD_LOGIC;
			  
			  timestamp : out  STD_LOGIC_VECTOR (12 downto 0);			  
           trigger_counter : out  STD_LOGIC_VECTOR (19 downto 0)); -- output is synchronous with master clk
end Trigger_Counter_Block;

architecture Behavioral of Trigger_Counter_Block is
  
signal trigger_counter_sig : STD_LOGIC_VECTOR (19 downto 0);	 
signal timestamp_sig : STD_LOGIC_VECTOR (28 downto 0);	 

signal trigger_latch1,trigger_latch2 : std_logic;

begin
	
	trigger_counter <= trigger_counter_sig;
	timestamp <= timestamp_sig(28 downto 16);  -- master clock has period 8ns. 29 bits should count ~4.3 seconds. 13 bits will give ~525 us resolution.
	
	------------------------------------------------
	master_domain: process(master_clk)
	begin
	
		if rising_edge(master_clk) then	   		
			
			trigger_latch1 <= psi_trigger;
			trigger_latch2 <= trigger_latch1;
			
			if reset = '1' then
				
				trigger_counter_sig <= (others => '1');
				timestamp_sig <= (others => '1');
				
			else
			
				timestamp_sig <= timestamp_sig + 1; -- continuous timestamp
				
				if trigger_latch2 = '0' and trigger_latch1 = '1' then -- rising edge of trigger				
					trigger_counter_sig <= trigger_counter_sig + 1;						
				end if;
				
			end if;

		end if;	   
		
	end process;
		

end Behavioral;

