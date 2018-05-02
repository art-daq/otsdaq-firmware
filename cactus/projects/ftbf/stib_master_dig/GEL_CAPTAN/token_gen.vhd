----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:15 08/08/2008 
-- Design Name: 
-- Module Name:    token_gen - Behavioral 
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

entity token_gen is
    Port ( clock_40 : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           rep_count : in  STD_LOGIC_VECTOR(9 downto 0); -- clock edges between pulse repitions
			  we : in std_logic;
			  we_clk : in std_logic;
           token_out : out  STD_LOGIC);
end token_gen;

architecture Behavioral of token_gen is
signal counter : STD_LOGIC_VECTOR(9 downto 0);
signal rep_count_sig : STD_LOGIC_VECTOR(9 downto 0); --latch count
signal token_out_sig : std_logic;
begin
	
	token_out <= token_out_sig;
	
	process(clock_40,reset_n)
	begin
		if reset_n = '0' or rep_count_sig = "00" & x"00" then
			counter <= (others => '0');
			token_out_sig <= '0';
		elsif falling_edge(clock_40) then
			if counter = rep_count_sig then
				token_out_sig <= '1';
				counter <= (others => '0');
			else
				counter <= counter + 1;
			end if;
			
			if token_out_sig = '1' then
					token_out_sig <= '0';
			end if;		
		end if;	
	end process;
	
	process(we_clk,reset_n)
	begin
		if reset_n = '0' then
			rep_count_sig <= (others => '0');
		elsif we = '1' and rising_edge(we_clk) then
			rep_count_sig <= rep_count;
		end if;
	end process;

end Behavioral;

