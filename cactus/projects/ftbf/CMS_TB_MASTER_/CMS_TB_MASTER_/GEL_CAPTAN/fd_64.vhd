----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:42 12/22/2011 
-- Design Name: 
-- Module Name:    fd_64 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fd_64 is
    Port ( D : in  STD_LOGIC_VECTOR (63 downto 0);
           CE : in  STD_LOGIC;
           C : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (63 downto 0));
end fd_64;

architecture Behavioral of fd_64 is

begin

	process(C)
	begin
		if rising_edge(C) then
			if R = '1' then 
				Q <= (others => '0');
			elsif CE = '1' then
				Q <= D;
			end if;
		end if;
	end process;
	
end Behavioral;

