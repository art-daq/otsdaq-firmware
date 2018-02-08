----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:36 03/17/2009 
-- Design Name: 
-- Module Name:    gen_test_trigger - Behavioral 
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

entity gen_test_trigger is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rx_valid : in  STD_LOGIC;
           gen_trigger : out  STD_LOGIC);
end gen_test_trigger;

architecture Behavioral of gen_test_trigger is
	signal rx_valid_old :  STD_LOGIC;
	signal count : integer range 127 downto 0;
begin

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then 
				 count <= 0;
			else
				gen_trigger <= '0';
				rx_valid_old <= rx_valid;
				
				if rx_valid_old = '1' and rx_valid = '0' then
					count <= 127;
				end if;
				
				if count /= 0 then 
					count <= count - 1;
					if count = 1 then
						gen_trigger <= '1';
					end if;
				end if;
			
			end if;
		end if;
	end process;

end Behavioral;

