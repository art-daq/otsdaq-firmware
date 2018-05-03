----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:39:53 04/28/2009 
-- Design Name: 
-- Module Name:    PLAQ_ID_GEN - Behavioral 
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

entity PLAQ_ID_GEN is
    Port ( plaq_id0 : out  STD_LOGIC_VECTOR (2 downto 0);
				plaq_id1 : out  STD_LOGIC_VECTOR (2 downto 0);
				plaq_id2 : out  STD_LOGIC_VECTOR (2 downto 0);
           plaq_id3 : out  STD_LOGIC_VECTOR (2 downto 0));
end PLAQ_ID_GEN;

architecture Behavioral of PLAQ_ID_GEN is
begin
	plaq_id0 <= (others => '0');
	plaq_id1 <= (0 => '1', others => '0');
	plaq_id2 <= (1 => '1', others => '0');
	plaq_id3 <= (0 => '1', 1 => '1',others => '0');
end Behavioral;

