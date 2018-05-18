----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:12:51 12/04/2009 
-- Design Name: 
-- Module Name:    clk_flipflops - Behavioral 
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

entity clk_flipflops is
    Port ( clk_8x : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           adc_clk : out  STD_LOGIC);
end clk_flipflops;

architecture Behavioral of clk_flipflops is

begin


end Behavioral;

