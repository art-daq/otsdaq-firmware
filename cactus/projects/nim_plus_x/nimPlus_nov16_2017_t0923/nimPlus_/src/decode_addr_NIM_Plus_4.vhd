-------------------------------------------------------------------------------
--
-- Title       : decode_addr_NIM_Plus_4
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\decode_addr_NIM_Plus_4.vhd
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
--{entity {decode_addr_NIM_Plus_4} architecture {decode_addr_NIM_Plus_4}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decode_addr_NIM_Plus_4 is
	 port(
		 wr_en : in STD_LOGIC;
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end decode_addr_NIM_Plus_4;

--}} End of automatically maintained section

architecture decode_addr_NIM_Plus_4 of decode_addr_NIM_Plus_4 is

constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin
	
	p1:	process(wr_en, addr)
		begin
			if wr_en = '0' then
				blk_wr_en <= z_8;
			elsif wr_en = '1' and
				addr(31 downto 24) = z_8 and
				addr(23 downto 16) = z_8 and
				addr(15 downto 11) = "00000" then
				
				case addr(10 downto 0) is
						when "10000000000" =>
								blk_wr_en <= "00000001";
						when "10000000001" =>
								blk_wr_en <= "00000010";
						when "10000000010" =>
								blk_wr_en <= "00000100";
						when "10000000011" =>
								blk_wr_en <= "00001000";
						when "10000000100" =>
								blk_wr_en <= "00010000";
						when "10000000101" =>
								blk_wr_en <= "00100000";
						when "10000000110" =>
								blk_wr_en <= "01000000";
						when "10000000111" =>
								blk_wr_en <= "10000000";
						when others =>
								blk_wr_en <= z_8;
				end case;
			else
				blk_wr_en <= z_8;	
			end if;		 
		end	process p1;
	 -- enter your statements here --

end decode_addr_NIM_Plus_4;
