----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:19:27 04/21/2009 
-- Design Name: 
-- Module Name:    psi_token_delay_blk - Behavioral 
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

entity psi_token_delay_blk is
    Port ( clk : in  STD_LOGIC;
           token : in  STD_LOGIC;
           token_delay : out  STD_LOGIC);
end psi_token_delay_blk;

architecture Behavioral of psi_token_delay_blk is
signal t1,t2,t3 : std_logic;
begin

	
	
	process(clk)
	begin
	
		if rising_edge(clk) then
			
			t1 <= token;
			t2 <= t1;
			t3 <= t2;
			token_delay <= t3;
			
		end if;
		
	
	end process;

end Behavioral;

