-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\trig_sync.vhd
-- Generated   : 05/02/18 14:15:37
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\trig_sync.asf
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

entity trig_sync is 
	port (
		clk: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		trig_sec_in: in STD_LOGIC_VECTOR (7 downto 0);
		trig_sync_out: out STD_LOGIC);
end trig_sync;

architecture trig_sync_arch of trig_sync is

constant ts_max: STD_LOGIC_VECTOR (2 downto 0) := "111";
constant u_3: STD_LOGIC_VECTOR (2 downto 0) := "001";
constant z_3: STD_LOGIC_VECTOR (2 downto 0) := "000";
-- diagram signals declarations
signal Signal1: STD_LOGIC;
signal trig_sync_reg: STD_LOGIC_VECTOR (7 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S6, S7, S8, S9
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_trig_sync_out, next_trig_sync_out: STD_LOGIC;
signal next_Signal1: STD_LOGIC;
signal next_trig_sync_reg: STD_LOGIC_VECTOR (7 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (int_trig_sync_out, trig_sec_in, trig_sync_reg, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_trig_sync_out <= int_trig_sync_out;
	next_trig_sync_reg <= trig_sync_reg;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S2;
			next_trig_sync_out <= trig_sync_reg(0);
		when S2 =>
			NextState_Sreg0 <= S3;
			next_trig_sync_out <= trig_sync_reg(1);
		when S3 =>
			NextState_Sreg0 <= S4;
			next_trig_sync_out <= trig_sync_reg(2);
		when S4 =>
			NextState_Sreg0 <= S5;
			next_trig_sync_out <= trig_sync_reg(3);
		when S5 =>
			NextState_Sreg0 <= S6;
			next_trig_sync_out <= trig_sync_reg(4);
		when S6 =>
			NextState_Sreg0 <= S7;
			next_trig_sync_out <= trig_sync_reg(5);
		when S7 =>
			NextState_Sreg0 <= S8;
			next_trig_sync_out <= trig_sync_reg(6);
		when S8 =>
			NextState_Sreg0 <= S9;
			next_trig_sync_out <= trig_sync_reg(7);
		when S9 =>
			NextState_Sreg0 <= S2;
			next_trig_sync_out <= trig_sync_reg(0);
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
			trig_sync_reg <= trig_sec_in;
			int_trig_sync_out <= '0';
		else
			trig_sync_reg <= next_trig_sync_reg;
			int_trig_sync_out <= next_trig_sync_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
trig_sync_out <= int_trig_sync_out;

end trig_sync_arch;
