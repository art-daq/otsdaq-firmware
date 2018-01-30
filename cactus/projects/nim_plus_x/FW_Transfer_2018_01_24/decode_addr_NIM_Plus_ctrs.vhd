-------------------------------------------------------------------------------
--
-- Title       : decode_addr_NIM_Plus
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\decode_addr_NIM_Plus_ctrs.vhd
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
--{entity {decode_addr_NIM_Plus_ctrs} architecture {decode_addr_NIM_Plus_ctrs}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decode_addr_NIM_Plus_ctrs is
	 port(
		 wr_en : in STD_LOGIC;
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 blk_wr_en : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end decode_addr_NIM_Plus_ctrs;

--}} End of automatically maintained section

architecture decode_addr_NIM_Plus_ctrs of decode_addr_NIM_Plus_ctrs is

constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin
	
	p1:	process(wr_en, addr)
		begin
			if wr_en = '0' then
				blk_wr_en <= z_8 & z_8 & z_8 & z_8;
			elsif wr_en = '1' and
				addr(31 downto 24) = z_8 and
				addr(23 downto 16) = "00000001" then				
				
				case addr(15 downto 0) is
						when "1000000000000000" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "00000001";
						when "1000000000000001" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "00000010";
						when "1000000000000010" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "00000100";
						when "1000000000000011" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "00001000";	   	-- veto counter address
						when "1000000000000100" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "00010000";		-- prescaler counter address 
						when "1000000000000101" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "00100000";
						when "1000000000000110" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "01000000";
						when "1000000000000111" =>
								blk_wr_en <= z_8 & z_8 & z_8 & "10000000";							
						
						when "1000000000001000" =>
								blk_wr_en <= z_8 & z_8 & "00000001" & z_8;			 -- sync section
						when "1000000000001001" =>
								blk_wr_en <= z_8 & z_8 & "00000010" & z_8;
						when "1000000000001010" =>
								blk_wr_en <= z_8 & z_8 & "00000100" & z_8;
						when "1000000000001011" =>
								blk_wr_en <= z_8 & z_8 & "00001000" & z_8;
						when "1000000000001100" =>
								blk_wr_en <= z_8 & z_8 & "00010000" & z_8;
						when "1000000000001101" =>
								blk_wr_en <= z_8 & z_8 & "00100000" & z_8;
						when "1000000000001110" =>
								blk_wr_en <= z_8 & z_8 & "01000000" & z_8;
						when "1000000000001111" =>
								blk_wr_en <= z_8 & z_8 & "10000000" & z_8;		
						
						
						when "1000000000010000" =>
								blk_wr_en <= z_8 & "00000001" & z_8 & z_8;
						when "1000000000010001" =>
								blk_wr_en <= z_8 & "00000010" & z_8 & z_8;
						when "1000000000010010" =>
								blk_wr_en <= z_8 & "00000100" & z_8 & z_8;
						when "1000000000010011" =>
								blk_wr_en <= z_8 & "00001000" & z_8 & z_8;
						when "1000000000010100" =>
								blk_wr_en <= z_8 & "00010000" & z_8 & z_8;
						when "1000000000010101" =>
								blk_wr_en <= z_8 & "00100000" & z_8 & z_8;
						when "1000000000010110" =>
								blk_wr_en <= z_8 & "01000000" & z_8 & z_8;
						when "1000000000010111" =>
							blk_wr_en <= z_8 & "10000000" & z_8 & z_8;		  

							
						when "1000000000011000" =>
								blk_wr_en <= "00000001" & z_8 & z_8 & z_8;
						when "1000000000011001" =>
								blk_wr_en <= "00000010" & z_8 & z_8 & z_8;
						when "1000000000011010" =>
								blk_wr_en <= "00000100" & z_8 & z_8 & z_8;
						when "1000000000011011" =>
								blk_wr_en <= "00001000" & z_8 & z_8 & z_8;
						when "1000000000011100" =>
								blk_wr_en <= "00010000" & z_8 & z_8 & z_8;
						when "1000000000011101" =>
								blk_wr_en <= "00100000" & z_8 & z_8 & z_8;
						when "1000000000011110" =>
								blk_wr_en <= "01000000" & z_8 & z_8 & z_8;
						when "1000000000011111" =>
								blk_wr_en <= "10000000" & z_8 & z_8 & z_8;						
											
						
						when others =>
								blk_wr_en <= z_8 & z_8 & z_8 & z_8;
				end case;
			else
				blk_wr_en <= z_8 & z_8 & z_8 & z_8;
				
			end if;		 
		end	process p1;
	 -- enter your statements here --

end decode_addr_NIM_Plus_ctrs;
