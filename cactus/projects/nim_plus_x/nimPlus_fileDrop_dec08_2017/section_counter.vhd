-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_12_06_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\section_counter.vhd
-- Generated   : 12/06/17 11:55:46
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_12_06_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\section_counter.asf
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

entity section_counter is 
	port (
		clk: in STD_LOGIC;
		release_p: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sec_in: in STD_LOGIC_VECTOR (7 downto 0);
		sec_en: out STD_LOGIC);
end section_counter;

architecture section_counter_arch of section_counter is

constant max_sec: STD_LOGIC_VECTOR (5 downto 0) := "000111";
constant u_5: STD_LOGIC_VECTOR (5 downto 0) := "000001";
constant z_5: STD_LOGIC_VECTOR (5 downto 0) := "000000";
constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
-- diagram signals declarations
signal sec_cnt: STD_LOGIC_VECTOR (5 downto 0);
signal sec_reg: STD_LOGIC_VECTOR (7 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S11, S9, S10
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_sec_en, next_sec_en: STD_LOGIC;
signal next_sec_cnt: STD_LOGIC_VECTOR (5 downto 0);
signal next_sec_reg: STD_LOGIC_VECTOR (7 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (int_sec_en, release_p, sec_cnt, sec_in, sec_reg, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_sec_en <= int_sec_en;
	next_sec_cnt <= sec_cnt;
	next_sec_reg <= sec_reg;
	case Sreg0 is
		when S11 =>
			if sec_cnt = max_sec then
				NextState_Sreg0 <= S10;
				next_sec_en <= sec_reg(0);
				next_sec_cnt <= z_5;
			elsif sec_cnt < max_sec then
				NextState_Sreg0 <= S11;
				next_sec_en <= sec_reg(0);
				next_sec_reg(6 downto 0) <= sec_reg(7 downto 1);
				next_sec_reg(7) <= '0';
				next_sec_cnt <= sec_cnt + u_5;
			end if;
		when S9 =>
			if release_p = '1' then
				NextState_Sreg0 <= S11;
				next_sec_en <= sec_reg(0);
				next_sec_reg(6 downto 0) <= sec_reg(7 downto 1);
				next_sec_reg(7) <= '0';
				next_sec_cnt <= sec_cnt + u_5;
			elsif release_p = '0' then
				NextState_Sreg0 <= S9;
				next_sec_en <= '0';
				next_sec_cnt <= z_5;
				next_sec_reg <= sec_in;
			end if;
		when S10 =>
			NextState_Sreg0 <= S10;
			next_sec_en <= '0';
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
		if reset_p = '1' then
			Sreg0 <= S9;
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
		if reset_p = '1' then
			sec_cnt <= z_5;
			sec_reg <= z_8;
			int_sec_en <= '0';
		else
			sec_cnt <= next_sec_cnt;
			sec_reg <= next_sec_reg;
			int_sec_en <= next_sec_en;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
sec_en <= int_sec_en;

end section_counter_arch;
