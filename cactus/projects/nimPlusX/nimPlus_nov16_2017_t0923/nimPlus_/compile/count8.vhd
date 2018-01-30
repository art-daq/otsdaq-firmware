-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\count8.vhd
-- Generated   : 04/05/16 10:09:11
-- From        : c:/NIM_Plus/AGP_2016/NIMPlus/NIMPlus/src/count8.asf
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
use IEEE.numeric_std.all;


entity count8 is 
	port (
		c_en: in STD_LOGIC;
		clock: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		s_in: in STD_LOGIC;
		ct_out: out STD_LOGIC_VECTOR (7 downto 0));
end count8;

architecture count8_arch of count8 is

constant z8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
-- diagram signals declarations
signal ct_reg: INTEGER range 255 downto 0;

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_ct_out, next_ct_out: STD_LOGIC_VECTOR (7 downto 0);
signal next_ct_reg: INTEGER range 255 downto 0;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (c_en, ct_reg, int_ct_out, s_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_ct_out <= int_ct_out;
	next_ct_reg <= ct_reg;
	case Sreg0 is
		when S1 =>
			if s_in = '0' or c_en = '0' then
				NextState_Sreg0 <= S1;
				next_ct_out <= std_logic_vector(to_unsigned(ct_reg,8));
			elsif s_in = '1' and c_en = '1' then
				NextState_Sreg0 <= S2;
				next_ct_reg <= ct_reg + 1;
			end if;
		when S2 =>
			if s_in = '1' then
				NextState_Sreg0 <= S2;
				next_ct_out <= std_logic_vector(to_unsigned(ct_reg,8));
			elsif s_in = '0' then
				NextState_Sreg0 <= S1;
				next_ct_out <= std_logic_vector(to_unsigned(ct_reg,8));
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

------------------------------------
-- Registered Outputs Logic
------------------------------------
Sreg0_RegOutput: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_p = '1' then
			ct_reg <= 0;
			int_ct_out <= z8;
		else
			ct_reg <= next_ct_reg;
			int_ct_out <= next_ct_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
ct_out <= int_ct_out;

end count8_arch;
