-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\reg_64.vhd
-- Generated   : 08/09/16 14:08:16
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\reg_64.asf
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
use nim_plus_package_1.all;
entity reg_64 is 
	port (
		clk: in STD_LOGIC;
		d: in STD_LOGIC_VECTOR (63 downto 0);
		reset_p: in STD_LOGIC;
		wr_en: in STD_LOGIC;
		q: out STD_LOGIC_VECTOR (63 downto 0));
end reg_64;

architecture reg_64_arch of reg_64 is

-- diagram signals declarations
signal d_reg: STD_LOGIC_VECTOR (63 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_q, next_q: STD_LOGIC_VECTOR (63 downto 0);
signal next_d_reg: STD_LOGIC_VECTOR (63 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (d, d_reg, int_q, wr_en, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_d_reg <= d_reg;
	next_q <= int_q;
	case Sreg0 is
		when S1 =>
			if wr_en = '0' then
				NextState_Sreg0 <= S1;
				next_q <= d_reg;
			elsif wr_en = '1' then
				NextState_Sreg0 <= S1;
				next_q <= d;
				next_d_reg <= d;
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
			d_reg <= z64;
			int_q <= z64;
		else
			d_reg <= next_d_reg;
			int_q <= next_q;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
q <= int_q;

end reg_64_arch;
