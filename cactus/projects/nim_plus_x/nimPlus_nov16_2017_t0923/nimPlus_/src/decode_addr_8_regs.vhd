-------------------------------------------------------------------------------
--
-- Title       : decode_addr_8_regs
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\ddecode_addr_8_regs.vhd
-- Generated   : Thu Apr 28 12:51:32 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {decode_addr_8_regs} architecture {decode_addr_8_regs}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decode_addr_8_regs is
	 port(
		 wr_en : in STD_LOGIC;
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end decode_addr_8_regs;

--}} End of automatically maintained section

architecture decode_addr_8_regs of decode_addr_8_regs is

constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";


begin
	
--	p1:	process(wr_en, addr)
	p1:	process(wr_en)
		begin
			if wr_en = '0' then
				blk_wr_en <= z_8;  -- was z_8 now using t_8 for test
			elsif wr_en = '1' and
				addr(31 downto 24) = z_8 and
				addr(23 downto 16) = z_8 and
				addr(15 downto 8) = z_8 then
				
				case addr(7 downto 0) is
						when "00000000" =>
								blk_wr_en <= "00000001";
						when "00000001" =>
								blk_wr_en <= "00000010";
						when "00000010" =>
								blk_wr_en <= "00000100";
						when "00000011" =>
								blk_wr_en <= "00001000";
						when "00000100" =>
								blk_wr_en <= "00010000";
						when "00000101" =>
								blk_wr_en <= "00100000";
						when "00000110" =>
								blk_wr_en <= "01000000";
						when "00000111" =>
								blk_wr_en <= "10000000";
						when others =>
								blk_wr_en <= z_8;
				end case;
			else
				blk_wr_en <= z_8;
			end if;		 
		end	process p1;
	 -- enter your statements here --

end decode_addr_8_regs;
