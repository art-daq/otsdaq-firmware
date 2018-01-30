-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\addr_decode_NIM.vhd
-- Generated   : 04/26/16 09:35:21
-- From        : c:/NIM_Plus/AGP_2016/NIMPlus/NIMPlus/src/addr_decode_NIM.asf
-- By          : FSM2VHDL ver. 5.0.7.2
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity addr_decode_NIM is 
	port (
		addr: in STD_LOGIC_VECTOR (32 downto 0);
		clock: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		wr_en: in STD_LOGIC;
		blk_wr_en: out STD_LOGIC_VECTOR (7 downto 0));
end addr_decode_NIM;

architecture addr_decode_NIM_arch of addr_decode_NIM is

constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (addr, wr_en, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	blk_wr_en <= z_8;
	case Sreg0 is
		when S1 =>
			if wr_en = '0' then
				NextState_Sreg0 <= S1;
				blk_wr_en <= z_8;
			elsif wr_en = '1' and
				addr(32) = '1' and
				addr(31 downto 24) = z_8 and
				addr(23 downto 16) = z_8 and
				addr(15 downto 8) = z_8 then
				NextState_Sreg0 <= S2;
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
			end if;
		when S2 =>
			if wr_en = '1' and
				addr(32) = '1' and
				addr(31 downto 24) = z_8 and
				addr(23 downto 16) = z_8 and
				addr(15 downto 8) = z_8 then
				NextState_Sreg0 <= S2;
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
			elsif wr_en = '0' then
				NextState_Sreg0 <= S1;
				blk_wr_en <= z_8;
			end if;
--vhdl_cover_off
		when others =>
			null;
--vhdl_cover_on
	end case;
end process;

------------------------------------
-- Current State Logic (sequential)
------------------------------------
Sreg0_CurrentState: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_p = '1' then
			Sreg0 <= S1;
		else
			Sreg0 <= NextState_Sreg0;
		end if;
	end if;
end process;

end addr_decode_NIM_arch;
