-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\ver_code.vhd
-- Generated   : 05/02/18 14:15:17
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\ver_code.asf
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

entity ver_code is 
	port (
		clk: in STD_LOGIC;
		rst_p: in STD_LOGIC;
		v_num: out STD_LOGIC_VECTOR (31 downto 0));
end ver_code;

architecture ver_code_arch of ver_code is

constant day_n: STD_LOGIC_VECTOR (4 downto 0) := "11001";
constant month_n: STD_LOGIC_VECTOR (3 downto 0) := "0001";
constant proj: STD_LOGIC_VECTOR (7 downto 0) := "00000001";
constant spare: STD_LOGIC_VECTOR (5 downto 0) := "000000";
constant ver_n: STD_LOGIC_VECTOR (3 downto 0) := "0001";
constant year_n: STD_LOGIC_VECTOR (4 downto 0) := "10010";
constant z_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_v_num, next_v_num: STD_LOGIC_VECTOR (31 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (int_v_num, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_v_num <= int_v_num;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S1;
			next_v_num <= spare & proj & year_n & month_n & day_n & ver_n;
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
			int_v_num <= z_32;
		else
			int_v_num <= next_v_num;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
v_num <= int_v_num;

end ver_code_arch;
