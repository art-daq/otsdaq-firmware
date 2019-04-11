-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\compile\long_pulse.vhd
-- Generated   : 05/02/18 14:09:58
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\src\long_pulse.asf
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

entity long_pulse is 
	port (
		clk: in STD_LOGIC;
		ct_in: in STD_LOGIC_VECTOR (63 downto 0);
		phi: in STD_LOGIC_VECTOR (63 downto 0);
		rst_p: in STD_LOGIC;
		srout_in: in STD_LOGIC;
		ctr_rst: out STD_LOGIC;
		p_out: out STD_LOGIC);
end long_pulse;

architecture long_pulse_arch of long_pulse is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_ctr_rst, next_ctr_rst: STD_LOGIC;
signal int_p_out, next_p_out: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (ct_in, int_ctr_rst, int_p_out, phi, srout_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_p_out <= int_p_out;
	next_ctr_rst <= int_ctr_rst;
	case Sreg0 is
		when S1 =>
			if srout_in = '0' or phi(63) = '0' then
				NextState_Sreg0 <= S1;
				next_p_out <= '0';
				next_ctr_rst <= '0';
			elsif srout_in = '1' and phi(63) = '1' then
				NextState_Sreg0 <= S2;
				next_p_out <= '1';
				next_ctr_rst <= '0';
			end if;
		when S2 =>
			if ct_in(62 downto 0) >= phi(62 downto 0) then
				NextState_Sreg0 <= S3;
				next_p_out <= '0';
				next_ctr_rst <= '0';
			elsif ct_in(62 downto 0) < phi(62 downto 0) then
				NextState_Sreg0 <= S2;
				next_p_out <= '1';
				next_ctr_rst <= '0';
			end if;
		when S3 =>
			if srout_in = '1' then
				NextState_Sreg0 <= S3;
				next_p_out <= '0';
				next_ctr_rst <= '1';
			elsif srout_in = '0' then
				NextState_Sreg0 <= S1;
				next_p_out <= '0';
				next_ctr_rst <= '1';
			end if;
		when S4 =>
			NextState_Sreg0 <= S1;
			next_p_out <= '0';
			next_ctr_rst <= '0';
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
			Sreg0 <= S4;
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
			int_p_out <= '0';
			int_ctr_rst <= '1';
		else
			int_p_out <= next_p_out;
			int_ctr_rst <= next_ctr_rst;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
p_out <= int_p_out;
ctr_rst <= int_ctr_rst;

end long_pulse_arch;
