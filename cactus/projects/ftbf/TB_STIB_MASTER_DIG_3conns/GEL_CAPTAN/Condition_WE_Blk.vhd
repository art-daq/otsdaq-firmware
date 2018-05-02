----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:59 07/31/2008 
-- Design Name: 
-- Module Name:    Condition_WE_Blk - Behavioral 
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

entity Condition_WE_Blk is
    Port ( we_in : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  reset_n : in STD_LOGIC;
           we_out : out  STD_LOGIC);
end Condition_WE_Blk;

architecture Behavioral of Condition_WE_Blk is
signal we_sig : std_logic;
signal we_in_dly : std_logic;
begin
	we_out <= we_sig;
	process(clk,reset_n)
	begin
		if reset_n = '0' then
			we_sig <= '0';
		elsif rising_edge(clk) then
			we_in_dly <= we_in;
			if we_sig = '0' and we_in = '1' and we_in_dly = '0' then
				we_sig <= '1';
			elsif we_sig = '1' then -- condition we to be one pulse wide
				we_sig <= '0';				
			end if;
		end if;
	
	end process;

end Behavioral;

