----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:20 05/04/2009 
-- Design Name: 
-- Module Name:    plaq_enable_blk - Behavioral 
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

entity plaq_enable_blk is
    Port ( 
				
			  b_mode_sel : in  STD_LOGIC_VECTOR (4 downto 0);
			  plaq_addr : in  STD_LOGIC_VECTOR (1 downto 0);
	 
           pre_we : in  STD_LOGIC;
           we : out  STD_LOGIC
			  );
end plaq_enable_blk;

architecture Behavioral of plaq_enable_blk is

begin

	-- if in data mode, allows all we to take place
	-- if in debug mode, only selected plaquette is allowed to write
	process(pre_we,b_mode_sel)
	begin
		if b_mode_sel(4 downto 2) = "001" then  --data mode
			we <= pre_we;
		else											--debug
			if b_mode_sel(1 downto 0) = plaq_addr then
				we <= pre_we;
			else
				we <= '0';
			end if;	
		end if;
	end process;
	
end Behavioral;

