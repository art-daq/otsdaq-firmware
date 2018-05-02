----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:56 10/21/2009 
-- Design Name: 
-- Module Name:    First_In_Chain_Gen - Behavioral 
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

entity First_In_Chain_Gen is
    Port ( first_in_chain : out  STD_LOGIC_VECTOR (3 downto 0));
end First_In_Chain_Gen;

architecture Behavioral of First_In_Chain_Gen is

begin

	first_in_chain <= (0 => '1', others => '0');

end Behavioral;

