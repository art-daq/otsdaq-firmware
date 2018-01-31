-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ssm
-- Author      : swu
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\SimpleStateMachine\ssm\compile\ssm.vhd
-- Generated   : 08/09/16 14:01:31
-- From        : c:\My_Designs\SimpleStateMachine\ssm\src\ssm.asf
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
use work.nim_plus_package_1.all;

entity ssm is 
	port (
		clk: in STD_LOGIC;
		pulse_in: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		pulse_count: out STD_LOGIC_VECTOR (63 downto 0));
end ssm;

architecture ssm_arch of ssm is

-- diagram signals declarations
signal count_reg: STD_LOGIC_VECTOR (63 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_pulse_count, next_pulse_count: STD_LOGIC_VECTOR (63 downto 0);
signal next_count_reg: STD_LOGIC_VECTOR (63 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (count_reg, int_pulse_count, pulse_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_count_reg <= count_reg;
	next_pulse_count <= int_pulse_count;
	case Sreg0 is
		when S1 =>
			if pulse_in='1' then
				NextState_Sreg0 <= S2;
				next_count_reg <= count_reg + u64;
			elsif pulse_in = '0' then
				NextState_Sreg0 <= S1;
			end if;
		when S2 =>
			if pulse_in = '1' then
				NextState_Sreg0 <= S2;
			elsif pulse_in = '0' then
				NextState_Sreg0 <= S1;
				next_pulse_count <= count_reg;
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
			count_reg <= z64;
			int_pulse_count <= z64;
		else
			count_reg <= next_count_reg;
			int_pulse_count <= next_pulse_count;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
pulse_count <= int_pulse_count;

end ssm_arch;
