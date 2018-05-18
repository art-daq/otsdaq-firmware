----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:30 11/20/2008 
-- Design Name: 
-- Module Name:    psi_reset_gen - Behavioral 
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

entity psi_reset_gen is
    Port ( clock_40 : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           gen_reset : in  STD_LOGIC;	 
		   we : in std_logic;
           we_clk : in  STD_LOGIC;
           psi_reset : out  STD_LOGIC);  
end psi_reset_gen;

architecture Behavioral of psi_reset_gen is
signal gen_reset_sig : std_logic;
signal reset_complete_sig : std_logic;
signal reset_sig : STD_LOGIC_VECTOR(2 downto 0);
begin
										   								 	
	psi_reset <= reset_sig(0) or reset_sig(1) or reset_sig(2);
	
	process(clock_40,reset_n)
	begin
		if reset_n = '0' then
			reset_complete_sig <= '0';
			reset_sig <= (others => '0');
		elsif falling_edge(clock_40) then		
		
			if gen_reset_sig = '1' then
				reset_sig(0) <= '1';
				reset_complete_sig <= '1';
			else
				reset_sig(2 downto 0) <= reset_sig(1 downto 0) & '0';
			end if;			
			
			if reset_complete_sig = '1' and gen_reset_sig = '0' then
				reset_complete_sig <= '0';
			end if;
		end if;	
	end process;

	process(we_clk,reset_n)
	begin
		if reset_n = '0' then
			gen_reset_sig  <= '0';
		elsif rising_edge(we_clk) then
			if we = '1' then
				gen_reset_sig <= gen_reset;
			elsif reset_complete_sig = '1' then
				gen_reset_sig <= '0';
			end if;
		end if;
	end process;
	
end Behavioral;

