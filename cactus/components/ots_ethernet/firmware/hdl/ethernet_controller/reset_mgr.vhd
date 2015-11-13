----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:20 08/16/2012 
-- Design Name: 
-- Module Name:    reset_mgr - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reset_mgr is
    Port ( slow_clk : in  STD_LOGIC;
           reset_start : in  STD_LOGIC;
           reset : out  STD_LOGIC);
end reset_mgr;

architecture Behavioral of reset_mgr is

	signal cnt : integer range 0 to 15 := 0;
	
begin

	process(slow_clk)
	begin
	
		if rising_edge(slow_clk) then
		
			reset <= '0';
			
			if cnt < 15 then -- currently reseting
					reset <= '1';
					cnt <= cnt + 1;
			elsif reset_start = '1' then
					cnt <= 0;			
					reset <= '1';
			end if;		
		
		end if;
		
	
	end process;

end Behavioral;

