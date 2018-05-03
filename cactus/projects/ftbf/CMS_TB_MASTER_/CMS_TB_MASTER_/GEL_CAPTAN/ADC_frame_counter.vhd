																   ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:14 11/06/2008 
-- Design Name: 
-- Module Name:    ADC_frame_counter - Behavioral 
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

entity ADC_frame_counter is
    Port ( ADC_clk : in  STD_LOGIC;
           ADC_frame : in  STD_LOGIC;
           ADC_wen : out  STD_LOGIC);
end ADC_frame_counter;

architecture Behavioral of ADC_frame_counter is
signal ADC_old_frame1 : std_logic;	
signal ADC_old_frame2 : std_logic;	 
begin
	
	
	process(ADC_clk)
	begin
	
		if rising_edge(ADC_clk) then
			
			ADC_wen <= '0';
			
			ADC_old_frame1 <= ADC_frame;	
			ADC_old_frame2 <= ADC_old_frame1;				
						
			if ADC_old_frame2 = '0' and ADC_old_frame1 = '1' then -- rising frame edge
			
				ADC_wen <= '1';
				
			end if;		 				

		end if;
		
	end process;				


end Behavioral;

