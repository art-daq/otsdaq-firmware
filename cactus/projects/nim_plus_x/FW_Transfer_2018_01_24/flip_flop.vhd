-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\flip_flop.vhd
-- Generated   : 04/06/16 15:54:55
-- From        : c:/NIM_Plus/AGP_2016/NIMPlus/NIMPlus/src/flip_flop.asf
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

entity flip_flop is 
	port (
		clock: in STD_LOGIC;
		d: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		q: out STD_LOGIC);
end flip_flop;

architecture flip_flop_arch of flip_flop is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_q, next_q: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (d, int_q, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_q <= int_q;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S1;
			next_q <= d;
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
		if reset_n = '0' then
			Sreg0 <= S1;
		else
			Sreg0 <= NextState_Sreg0;
		end if;
	end if;
end process;

------------------------------------
-- Registered Outputs Logic
------------------------------------
Sreg0_RegOutput: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_n = '0' then
			int_q <= '0';
		else
			int_q <= next_q;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
q <= int_q;

end flip_flop_arch;
