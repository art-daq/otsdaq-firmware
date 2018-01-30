-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\load_controller_2_1_phase.vhd
-- Generated   : 04/18/17 12:05:40
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\load_controller_2_1_phase.asf
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

entity load_controller_2_1_phase is 
	port (
		clk: in STD_LOGIC;
		disable_ops: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		load_out: out STD_LOGIC);
end load_controller_2_1_phase;

architecture load_controller_2_1_phase_arch of load_controller_2_1_phase is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    detectd, idle
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_load_out, next_load_out: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (disable_ops, int_load_out, sig_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_load_out <= int_load_out;
	case Sreg0 is
		when detectd =>
			if sig_in = '0' then
				NextState_Sreg0 <= idle;
				next_load_out <= '0';
			elsif sig_in = '1' then
				NextState_Sreg0 <= detectd;
				next_load_out <= '0';
			end if;
		when idle =>
			if disable_ops = '1' or 
				sig_in = '0' then
				NextState_Sreg0 <= idle;
				next_load_out <= '0';
			elsif disable_ops = '0'
				and sig_in = '1' then
				NextState_Sreg0 <= detectd;
				next_load_out <= '1';
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
		else
			int_load_out <= next_load_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
load_out <= int_load_out;

end load_controller_2_1_phase_arch;
