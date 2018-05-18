																   ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:14 11/06/2008 
-- Design Name: 
-- Module Name:    ADC_single_frame_counter - Behavioral 
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

entity ADC_single_frame_counter is
    Port ( ADC_clk : in  STD_LOGIC;
           ADC_frame : in  STD_LOGIC;
           rst_n : in STD_LOGIC;
           ADC_en : out  STD_LOGIC);
end ADC_single_frame_counter;

architecture Behavioral of ADC_single_frame_counter is
signal ADC_old_frame : std_logic;	
begin
	
	process(ADC_clk,rst_n)
	begin
		if rst_n = '0' then
			ADC_en <= '0';	 
			ADC_old_frame <= '1';
		elsif rising_edge(ADC_clk) then
			
			ADC_old_frame <= ADC_frame;	
			ADC_en <= '0';			
						
			if ADC_frame = '1' and ADC_old_frame = '0' then -- rising frame edge
					ADC_en <= '1';
			end if;		 
			
		end if;
		
	end process;	

end Behavioral;

