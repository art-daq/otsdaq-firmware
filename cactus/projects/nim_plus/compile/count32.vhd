-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\count32.vhd
-- Generated   : 03/23/17 10:43:48
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\count32.asf
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

entity count32 is 
	port (
		clock: in STD_LOGIC;
		clr_count: in STD_LOGIC;
		cout_en_p: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		count_out: out STD_LOGIC_VECTOR (31 downto 0);
		ovrflow: out STD_LOGIC);
end count32;

architecture count32_arch of count32 is

constant max32: STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
constant u32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
constant z32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
-- diagram signals declarations
signal count_reg: STD_LOGIC_VECTOR (31 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_count_out, next_count_out: STD_LOGIC_VECTOR (31 downto 0);
signal int_ovrflow, next_ovrflow: STD_LOGIC;
signal next_count_reg: STD_LOGIC_VECTOR (31 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (clr_count, count_reg, cout_en_p, int_count_out, int_ovrflow, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_count_out <= int_count_out;
	next_count_reg <= count_reg;
	next_ovrflow <= int_ovrflow;
	case Sreg0 is
		when S1 =>
			if cout_en_p = '1' then
				NextState_Sreg0 <= S2;
				next_count_reg <= count_reg + u32;
				next_count_out <= count_reg;
			elsif cout_en_p = '0' then
				NextState_Sreg0 <= S1;
				next_count_out <= count_reg;
			end if;
		when S2 =>
			if cout_en_p = '1'	and count_reg < max32 then
				NextState_Sreg0 <= S2;
				next_count_reg <= count_reg + u32;
				next_count_out <= count_reg;
			elsif count_reg = max32 then
				NextState_Sreg0 <= S3;
				next_count_out <= count_reg;
				next_ovrflow <= '1';
			elsif cout_en_p = '0'	and count_reg < max32 then
				NextState_Sreg0 <= S1;
				next_count_out <= count_reg;
			end if;
		when S3 =>
			if clr_count = '0' then
				NextState_Sreg0 <= S3;
				next_count_out <= count_reg;
				next_ovrflow <= '1';
			elsif clr_count = '1' then
				NextState_Sreg0 <= S1;
				next_count_reg <= z32;
				next_count_out <= z32;
				next_ovrflow <= '0';
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
			count_reg <= z32;
			int_count_out <= z32;
			int_ovrflow <= '0';
		else
			count_reg <= next_count_reg;
			int_count_out <= next_count_out;
			int_ovrflow <= next_ovrflow;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
count_out <= int_count_out;
ovrflow <= int_ovrflow;

end count32_arch;
