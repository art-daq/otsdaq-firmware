----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:18:49 10/22/2009 
-- Design Name: 
-- Module Name:    capture_token_full_err - Behavioral 
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

entity capture_token_full_err is
    Port ( fifo_full : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           err : out  STD_LOGIC);
end capture_token_full_err;

architecture Behavioral of capture_token_full_err is

begin

	process(clock)
	begin
	
		if rising_edge(clock) then
			if reset = '1' then
				err <= '0';
			elsif fifo_full = '1' then
				err <= '1';
			end if;		
		end if;
	
	end process;

end Behavioral;

