-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\cntrs_2_b_fifo_jw121.vhd
-- Generated   : 01/25/18 15:58:26
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\cntrs_2_b_fifo_jw121.asf
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

entity cntrs_2_b_fifo_jw121 is 
	port (
		b_full_p: in STD_LOGIC;
		clk: in STD_LOGIC;
		ct_en: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		b_wr: out STD_LOGIC;
		fin_wr: out STD_LOGIC);
end cntrs_2_b_fifo_jw121;

architecture cntrs_2_b_fifo_jw121_arch of cntrs_2_b_fifo_jw121 is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S3
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_b_wr, next_b_wr: STD_LOGIC;
signal int_fin_wr, next_fin_wr: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (b_full_p, ct_en, int_b_wr, int_fin_wr, sig_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_b_wr <= int_b_wr;
	next_fin_wr <= int_fin_wr;
	case Sreg0 is
		when S1 =>
			if sig_in = '1' and
				ct_en = '1' and
				b_full_p = '0' then
				NextState_Sreg0 <= S3;
				next_b_wr <= '1';
				next_fin_wr <= '1';
			elsif sig_in = '0' or
				ct_en = '0' or
				b_full_p = '1' then
				NextState_Sreg0 <= S1;
				next_b_wr <= '0';
				next_fin_wr <= '0';
			end if;
		when S3 =>
			if sig_in = '1' and
				ct_en = '1' then
				NextState_Sreg0 <= S3;
				next_fin_wr <= '0';
				next_b_wr <= '0';
			elsif sig_in = '0' or
				ct_en = '0' then
				NextState_Sreg0 <= S1;
				next_fin_wr <= '0';
				next_b_wr <= '0';
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
		if reset_p = '1' then
			Sreg0 <= S1;
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
			int_b_wr <= '0';
			int_fin_wr <= '0';
		else
			int_b_wr <= next_b_wr;
			int_fin_wr <= next_fin_wr;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
b_wr <= int_b_wr;
fin_wr <= int_fin_wr;

end cntrs_2_b_fifo_jw121_arch;
