----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:17 08/11/2008 
-- Design Name: 
-- Module Name:    and_delay - Behavioral 
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

entity and_delay is
    Port ( 
				reset_n : in STD_LOGIC;
				clk : in STD_LOGIC;
				we : in STD_LOGIC;
				data : in std_logic_vector(16 downto 0);
				sig_in : in  STD_LOGIC;
				sig_out : out  STD_LOGIC);
end and_delay;

architecture Behavioral of and_delay is
	signal sig_arr : std_logic_vector(255 downto 0);
	signal and_arr : std_logic_vector(255 downto 0);
	signal addrs_sig : integer range 255 downto 0;
begin
	sig_out <= sig_arr(addrs_sig);

	andProc: process(sig_in)
	begin	
		sig_arr(0) <= sig_in and and_arr(0);
		for i in 1 to 255 loop
			sig_arr(i) <= sig_arr(i-1) and and_arr(i);		
		end loop;	
	end process;
	
	selProc: process(reset_n,clk)
	begin	
		if reset_n = '0' then
			addrs_sig <= 0;
			and_arr <= (others => '1');
		elsif rising_edge(clk) and we = '1' then
			addrs_sig <= conv_integer(data(7 downto 0));		
			and_arr <= (others => '1');
			and_arr(conv_integer(data(15 downto 8))) <= data(16);
		end if;		
	end process;	
	


end Behavioral;

