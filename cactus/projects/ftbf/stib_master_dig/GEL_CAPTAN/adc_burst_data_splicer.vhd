----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:57 03/11/2009 
-- Design Name: 
-- Module Name:    adc_burst_data_splicer - Behavioral 
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

entity adc_burst_data_splicer is
    Port ( adc_data : in  STD_LOGIC_VECTOR (59 downto 0);
           data_label : in  STD_LOGIC_VECTOR (3 downto 0);
           dout : out  STD_LOGIC_VECTOR (63 downto 0));
end adc_burst_data_splicer;

architecture Behavioral of adc_burst_data_splicer is

begin

	dout <= adc_data & data_label;

end Behavioral;

