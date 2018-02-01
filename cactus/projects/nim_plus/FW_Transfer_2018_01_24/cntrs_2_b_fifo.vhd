-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\cntrs_2_b_fifo.vhd
-- Generated   : 01/31/18 11:13:26
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\cntrs_2_b_fifo.asf
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

entity cntrs_2_b_fifo is 
	port (
		b_fifo_full_p: in STD_LOGIC;
		clk: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		b_wr: out STD_LOGIC;
		fin_wr: out STD_LOGIC;
		latch_sig: out STD_LOGIC;
		mux_dir: out STD_LOGIC_VECTOR (1 downto 0));
end cntrs_2_b_fifo;

architecture cntrs_2_b_fifo_arch of cntrs_2_b_fifo is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_b_wr, next_b_wr: STD_LOGIC;
signal int_fin_wr, next_fin_wr: STD_LOGIC;
signal int_latch_sig, next_latch_sig: STD_LOGIC;
signal int_mux_dir, next_mux_dir: STD_LOGIC_VECTOR (1 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (b_fifo_full_p, int_b_wr, int_fin_wr, int_latch_sig, int_mux_dir, sig_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_b_wr <= int_b_wr;
	next_mux_dir <= int_mux_dir;
	next_fin_wr <= int_fin_wr;
	next_latch_sig <= int_latch_sig;
	case Sreg0 is
		when S1 =>
			if sig_in = '1' and
				b_fifo_full_p = '0' then
				NextState_Sreg0 <= S5;
				next_b_wr <= '0';
				next_mux_dir <= "00";
				next_fin_wr <= '0';
				next_latch_sig <= '1';
			elsif sig_in = '0' or
				b_fifo_full_p = '1' then
				NextState_Sreg0 <= S1;
				next_b_wr <= '0';
				next_mux_dir <= "00";
				next_fin_wr <= '0';
				next_latch_sig <= '0';
			end if;
		when S2 =>
			NextState_Sreg0 <= S4;
			next_b_wr <= '1';
			next_mux_dir <= "01";
			next_fin_wr <= '0';
			next_latch_sig <= '0';
		when S3 =>
			if sig_in = '1' then
				NextState_Sreg0 <= S3;
				next_fin_wr <= '0';
				next_b_wr <= '0';
				next_mux_dir <= "00";
				next_latch_sig <= '0';
			elsif sig_in = '0' then
				NextState_Sreg0 <= S1;
				next_fin_wr <= '0';
				next_b_wr <= '0';
				next_mux_dir <= "00";
				next_latch_sig <= '0';
			end if;
		when S4 =>
			NextState_Sreg0 <= S3;
			next_b_wr <= '1';
			next_mux_dir <= "10";
			next_fin_wr <= '1';
			next_latch_sig <= '0';
		when S5 =>
			NextState_Sreg0 <= S2;
			next_b_wr <= '1';
			next_mux_dir <= "00";
			next_fin_wr <= '0';
			next_latch_sig <= '0';
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
			int_mux_dir <= "00";
			int_fin_wr <= '0';
			int_latch_sig <= '0';
		else
			int_b_wr <= next_b_wr;
			int_mux_dir <= next_mux_dir;
			int_fin_wr <= next_fin_wr;
			int_latch_sig <= next_latch_sig;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
b_wr <= int_b_wr;
mux_dir <= int_mux_dir;
fin_wr <= int_fin_wr;
latch_sig <= int_latch_sig;

end cntrs_2_b_fifo_arch;
