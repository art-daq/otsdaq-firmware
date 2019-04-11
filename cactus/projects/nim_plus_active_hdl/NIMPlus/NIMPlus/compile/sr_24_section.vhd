-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\sr_24_section.vhd
-- Generated   : 05/29/18 14:58:56
-- From        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\sr_24_section.asf
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

entity sr_24_section is 
	port (
		clk: in STD_LOGIC;
		fs_sync_out: in STD_LOGIC_VECTOR (23 downto 0);
		release: in STD_LOGIC;
		rst_p: in STD_LOGIC;
		shft_out: out STD_LOGIC);
end sr_24_section;

architecture sr_24_section_arch of sr_24_section is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23, S24, S25
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_shft_out, next_shft_out: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (fs_sync_out, int_shft_out, release, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_shft_out <= int_shft_out;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S2;
			next_shft_out <= fs_sync_out(0);
		when S2 =>
			NextState_Sreg0 <= S3;
			next_shft_out <= fs_sync_out(1);
		when S3 =>
			NextState_Sreg0 <= S4;
			next_shft_out <= fs_sync_out(2);
		when S4 =>
			NextState_Sreg0 <= S5;
			next_shft_out <= fs_sync_out(3);
		when S5 =>
			NextState_Sreg0 <= S6;
			next_shft_out <= fs_sync_out(4);
		when S6 =>
			NextState_Sreg0 <= S7;
			next_shft_out <= fs_sync_out(5);
		when S7 =>
			NextState_Sreg0 <= S8;
			next_shft_out <= fs_sync_out(6);
		when S8 =>
			NextState_Sreg0 <= S9;
			next_shft_out <= fs_sync_out(7);
		when S9 =>
			NextState_Sreg0 <= S10;
			next_shft_out <= fs_sync_out(8);
		when S10 =>
			NextState_Sreg0 <= S11;
			next_shft_out <= fs_sync_out(9);
		when S11 =>
			NextState_Sreg0 <= S12;
			next_shft_out <= fs_sync_out(10);
		when S12 =>
			NextState_Sreg0 <= S13;
			next_shft_out <= fs_sync_out(11);
		when S13 =>
			NextState_Sreg0 <= S14;
			next_shft_out <= fs_sync_out(12);
		when S14 =>
			NextState_Sreg0 <= S15;
			next_shft_out <= fs_sync_out(13);
		when S15 =>
			NextState_Sreg0 <= S16;
			next_shft_out <= fs_sync_out(14);
		when S16 =>
			NextState_Sreg0 <= S17;
			next_shft_out <= fs_sync_out(15);
		when S17 =>
			NextState_Sreg0 <= S18;
			next_shft_out <= fs_sync_out(16);
		when S18 =>
			NextState_Sreg0 <= S19;
			next_shft_out <= fs_sync_out(17);
		when S19 =>
			NextState_Sreg0 <= S20;
			next_shft_out <= fs_sync_out(18);
		when S20 =>
			NextState_Sreg0 <= S21;
			next_shft_out <= fs_sync_out(19);
		when S21 =>
			NextState_Sreg0 <= S22;
			next_shft_out <= fs_sync_out(20);
		when S22 =>
			NextState_Sreg0 <= S23;
			next_shft_out <= fs_sync_out(21);
		when S23 =>
			NextState_Sreg0 <= S24;
			next_shft_out <= fs_sync_out(22);
		when S24 =>
			if release = '1' then
				NextState_Sreg0 <= S1;
				next_shft_out <= fs_sync_out(23);
			elsif release = '0' then
				NextState_Sreg0 <= S25;
				next_shft_out <= fs_sync_out(23);
			end if;
		when S25 =>
			if release = '0' then
				NextState_Sreg0 <= S25;
				next_shft_out <= '1';
			elsif release = '1' then
				NextState_Sreg0 <= S1;
				next_shft_out <= fs_sync_out(23);
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
Sreg0_CurrentState: process (clk)
begin
	if clk'event and clk = '1' then
		if rst_p = '1' then
			Sreg0 <= S25;
		else
			Sreg0 <= NextState_Sreg0;
		end if;
	end if;
end process;

------------------------------------
-- Registered Outputs Logic
------------------------------------
Sreg0_RegOutput: process (clk)
begin
	if clk'event and clk = '1' then
		if rst_p = '1' then
			int_shft_out <= '1';
		else
			int_shft_out <= next_shft_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
shft_out <= int_shft_out;

end sr_24_section_arch;
