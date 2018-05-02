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
    Port ( debug_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           b_data_sel : in  STD_LOGIC;
           psi_data_out_sel : in  STD_LOGIC;
           pre_we0 : in  STD_LOGIC;
           pre_we1 : in  STD_LOGIC;
           we0 : out  STD_LOGIC;
           we1 : out  STD_LOGIC);
end plaq_enable_blk;

architecture Behavioral of plaq_enable_blk is

begin
	
	process(pre_we0,pre_we1,debug_sel,psi_data_out_sel)
	begin
		if debug_sel = "00" then
			we0 <= pre_we0;
			we1 <= pre_we1;
		else
			if psi_data_out_sel = '0' then
				we0 <= pre_we0;
				we1 <= '0';
			else
				we0 <= '0';
				we1 <= pre_we1;
			end if;	
		end if;
	end process;
	
end Behavioral;

