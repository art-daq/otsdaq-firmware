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
																	  
entity External_Trigger_Handler is
    Port ( xclkToForward_0phase : in  STD_LOGIC;	 -- external clock, expect this to be PSI_clk0
			  xclkToForward_90phase : in  STD_LOGIC;	 -- external clock phase 90, expect this to be PSI_clk90
           ext_trig_line_in : in  STD_LOGIC;  -- "11100000..." is trigger (a long pulse) in 0phase interpretation
			  
           extTrigToForward_0phase : out STD_LOGIC; 	--phase aligned to 0phase
			  ext_trigger_90phase : out STD_LOGIC); --phase aligned to 90phase
end External_Trigger_Handler;

architecture Behavioral of External_Trigger_Handler is
	 	
	signal shift_reg  : std_logic_vector(3 downto 0); 
	signal ext_trigger_0phase_launch : std_logic := '0';
	signal ext_trigger_0phase_launch_latch90 : std_logic := '0';
	signal ext_trigger_0phase_launch_latch90_old : std_logic := '0';
	
	
	
	signal out_shift_reg  : std_logic_vector(2 downto 0);

begin
	 	 
	
	process(xclkToForward_0phase)
	begin
	
		if rising_edge(xclkToForward_0phase) then	
			
			--interpret input trigger
			shift_reg <= ext_trig_line_in & shift_reg(3 downto 1);
			
			ext_trigger_0phase_launch <= '0';
			if shift_reg = "1100" and ext_trig_line_in = '1' then  --TRIGGER found!!
				ext_trigger_0phase_launch <= '1'; 	  
			end if;
			
			
			
			--create 101 external trig forwarded signal to slaves		
			
			out_shift_reg <= out_shift_reg(1 downto 0) & ext_trigger_0phase_launch;
			
			extTrigToForward_0phase <= '0';
			if(out_shift_reg(0) = '1') then
				extTrigToForward_0phase <= '1';
			elsif(out_shift_reg(1) = '1') then
				extTrigToForward_0phase <= '0';
			elsif(out_shift_reg(2) = '1') then
				extTrigToForward_0phase <= '1';
			end if;
							
		end if;
		
	end process;
	
	
	--generate 90 phase trigger
	process(xclkToForward_90phase)
	begin
	
		if rising_edge(xclkToForward_0phase) then	
			ext_trigger_0phase_launch_latch90 <= ext_trigger_0phase_launch;
			ext_trigger_0phase_launch_latch90_old <= ext_trigger_0phase_launch_latch90;
			
			ext_trigger_90phase <= '0';
			if ext_trigger_0phase_launch_latch90_old = '0' and  --rising edge of launch sig
				ext_trigger_0phase_launch_latch90 = '1' then
				ext_trigger_90phase <= '1';
			end if;
			
		end if;
	
	end process;

end Behavioral;

