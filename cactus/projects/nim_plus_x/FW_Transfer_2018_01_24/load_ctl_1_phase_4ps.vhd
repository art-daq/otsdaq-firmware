-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\load_ctl_1_phase_4ps.vhd
-- Generated   : 05/06/17 14:35:29
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\load_ctl_1_phase_4ps.asf
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

entity load_ctl_1_phase_4ps is 
	port (
		clk: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		v_ps_hold_in: in STD_LOGIC;
		load_out: out STD_LOGIC;
		ps_ld_ct: out STD_LOGIC);
end load_ctl_1_phase_4ps;

architecture load_ctl_1_phase_4ps_arch of load_ctl_1_phase_4ps is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    detectd, idle
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_load_out, next_load_out: STD_LOGIC;
signal int_ps_ld_ct, next_ps_ld_ct: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (int_load_out, int_ps_ld_ct, sig_in, v_ps_hold_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_load_out <= int_load_out;
	next_ps_ld_ct <= int_ps_ld_ct;
	case Sreg0 is
		when detectd =>
			if sig_in = '0' then
				NextState_Sreg0 <= idle;
				next_load_out <= '0';
				next_ps_ld_ct <= '0';
			elsif sig_in = '1' then
				NextState_Sreg0 <= detectd;
				next_load_out <= '0';
				next_ps_ld_ct <= '0';
			end if;
		when idle =>
			if sig_in = '0' then
				NextState_Sreg0 <= idle;
				next_load_out <= '0';
				next_ps_ld_ct <= '0';
			elsif sig_in = '1' then
				NextState_Sreg0 <= detectd;
				next_ps_ld_ct <= '1';
				if v_ps_hold_in = '0' then
						next_load_out <= '1';
				-- Output may proceed
				else
						next_load_out <= '0';
				-- Prescaler is holding the output
				end if;
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
			Sreg0 <= idle;
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
			int_load_out <= '0';
			int_ps_ld_ct <= '0';
		else
			int_load_out <= next_load_out;
			int_ps_ld_ct <= next_ps_ld_ct;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
load_out <= int_load_out;
ps_ld_ct <= int_ps_ld_ct;

end load_ctl_1_phase_4ps_arch;
