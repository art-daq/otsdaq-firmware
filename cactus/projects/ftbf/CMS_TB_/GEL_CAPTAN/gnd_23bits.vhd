----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:15 12/03/2009 
-- Design Name: 
-- Module Name:    gnd_23bits - Behavioral 
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

entity gnd_23bits is
    Port ( gnd0 : out  STD_LOGIC_VECTOR (6 downto 0);
           gnd1 : out  STD_LOGIC_VECTOR (15 downto 0));
end gnd_23bits;

architecture Behavioral of gnd_23bits is

begin
gnd0 <= (others =>'0');

gnd1 <= (others =>'0');
end Behavioral;


