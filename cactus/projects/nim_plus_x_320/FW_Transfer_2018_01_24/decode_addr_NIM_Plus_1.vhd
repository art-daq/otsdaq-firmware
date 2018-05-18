-------------------------------------------------------------------------------
--
-- Title       : decode_addr_NIM_Plus_1
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\decode_addr_NIM_Plus_1.vhd
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
--{entity {decode_addr_NIM_Plus_1} architecture {decode_addr_NIM_Plus_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decode_addr_NIM_Plus_1 is
	 port(
		 wr_en : in STD_LOGIC;
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 blk_wr_en : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end decode_addr_NIM_Plus_1;

--}} End of automatically maintained section

architecture decode_addr_NIM_Plus_1 of decode_addr_NIM_Plus_1 is

constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin
	
	p1:	process(wr_en, addr)
		begin
			if wr_en = '0' then
				blk_wr_en <= z_8 & z_8;
			elsif wr_en = '1' and
				addr(31 downto 24) = z_8 and
				addr(23 downto 16) = z_8 and
				addr(15 downto 11) = "00000" then
				
				case addr(10 downto 0) is
						when "00100000000" =>
								blk_wr_en <= "0000000000000001";
						when "00100000001" =>
								blk_wr_en <= "0000000000000010";
						when "00100000010" =>
								blk_wr_en <= "0000000000000100";
						when "00100000011" =>
								blk_wr_en <= "0000000000001000";
						when "00100000100" =>
								blk_wr_en <= "0000000000010000";
						when "00100000101" =>
								blk_wr_en <= "0000000000100000";
						when "00100000110" =>
								blk_wr_en <= "0000000001000000";
						when "00100000111" =>
								blk_wr_en <= "0000000010000000";   
						
						when "00100001000" =>
								blk_wr_en <= "0000000100000000";
						when "00100001001" =>
								blk_wr_en <= "0000001000000000";
						when "00100001010" =>
								blk_wr_en <= "0000010000000000";
						when "00100001011" =>
								blk_wr_en <= "0000100000000000";
						when "00100001100" =>
								blk_wr_en <= "0001000000000000";
						when "00100001101" =>
								blk_wr_en <= "0010000000000000";
						when "00100001110" =>
								blk_wr_en <= "0100000000000000";
						when "00100001111" =>
								blk_wr_en <= "1000000000000000";
						when others =>
								blk_wr_en <= z_8 & z_8;
				end case; 
			else
				blk_wr_en <= z_8 & z_8;
			end if;		 
		end	process p1;
	 -- enter your statements here --

end decode_addr_NIM_Plus_1;
