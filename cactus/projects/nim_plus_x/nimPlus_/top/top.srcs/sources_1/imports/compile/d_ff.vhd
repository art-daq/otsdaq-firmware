-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\d_ff.vhd
-- Generated   : 08/25/16 16:44:55
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\d_ff.asf
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

entity d_ff is 
	port (
		clk: in STD_LOGIC;
		dl: in STD_LOGIC;
		rst_p: in STD_LOGIC;
		q: out STD_LOGIC);
end d_ff;

architecture d_ff of d_ff is

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
Sreg0_NextState: process (dl, int_q, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_q <= int_q;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S1;
			next_q <= dl;
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
		if rst_p = '1' then
			int_q <= '0';
		else
			int_q <= next_q;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
q <= int_q;

end d_ff;
