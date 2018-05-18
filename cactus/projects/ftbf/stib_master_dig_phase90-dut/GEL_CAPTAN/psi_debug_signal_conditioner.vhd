----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:03 03/26/2009 
-- Design Name: 
-- Module Name:    psi_debug_signal_conditioner - Behavioral 
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

entity psi_debug_signal_conditioner is
    Port ( re : in  STD_LOGIC;
           we : in  STD_LOGIC;
           reo : out  STD_LOGIC;
           weo : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end psi_debug_signal_conditioner;

architecture Behavioral of psi_debug_signal_conditioner is

	signal re_old : std_logic;
	signal we_old : std_logic;
	
begin

	process(clk)
	begin
		if rising_edge(clk) then
		
			re_old <= re;
			we_old <= we;
			
			weo <= '0';
			if we_old = '0' and we = '1' then
				weo <= '1';
			end if;
			
			reo <= '0';
			if re_old = '0' and re = '1' then
				reo <= '1';
			end if;
		
		end if;
		
	end process;


end Behavioral;

