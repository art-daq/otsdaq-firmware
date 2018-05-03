----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ryan Rivera
-- 
-- Create Date:    11:35:42 12/22/2011 
-- Design Name: 
-- Module Name:    fd_11 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fd_4 is
    Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
           CE : in  STD_LOGIC;
           C : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end fd_4;

architecture Behavioral of fd_4 is

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

