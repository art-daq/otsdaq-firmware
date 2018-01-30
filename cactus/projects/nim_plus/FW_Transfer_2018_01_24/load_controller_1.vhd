-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\load_controller_1.vhd
-- Generated   : 04/11/16 17:04:45
-- From        : c:/NIM_Plus/AGP_2016/NIMPlus/NIMPlus/src/load_controller_1.asf
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

entity load_controller_1 is 
	port (
		clk: in STD_LOGIC;
		disable_ops: in STD_LOGIC;
		inhib_in: in STD_LOGIC_VECTOR (2 downto 0);
		load_cmd_in: in STD_LOGIC_VECTOR (3 downto 0);
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		wr_cmd: in STD_LOGIC;
		inhib_out: out STD_LOGIC;
		load_cmd_out: out STD_LOGIC_VECTOR (3 downto 0));
end load_controller_1;

architecture load_controller_1_arch of load_controller_1 is

constant z4: STD_LOGIC_VECTOR (3 downto 0) := "0000";
-- diagram signals declarations
signal load_cmd_reg: STD_LOGIC_VECTOR (3 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_inhib_out, next_inhib_out: STD_LOGIC;
signal int_load_cmd_out, next_load_cmd_out: STD_LOGIC_VECTOR (3 downto 0);
signal next_load_cmd_reg: STD_LOGIC_VECTOR (3 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (disable_ops, inhib_in, int_inhib_out, int_load_cmd_out, load_cmd_in, load_cmd_reg, sig_in, wr_cmd, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_load_cmd_reg <= load_cmd_reg;
	next_load_cmd_out <= int_load_cmd_out;
	next_inhib_out <= int_inhib_out;
	case Sreg0 is
		when S1 =>
			if disable_ops = '1' then
				NextState_Sreg0 <= S3;
			elsif inhib_in /= "000" 
				or sig_in /= '1' then
				NextState_Sreg0 <= S1;
				next_load_cmd_out <= z4;
			elsif inhib_in = "000" 
				and sig_in = '1' then
				NextState_Sreg0 <= S2;
				next_load_cmd_out <= load_cmd_reg;
				next_inhib_out <= '1';
			end if;
		when S2 =>
			NextState_Sreg0 <= S1;
			next_load_cmd_out <= z4;
			next_inhib_out <= '0';
		when S3 =>
			if disable_ops = '1' 
				and wr_cmd = '0' then
				NextState_Sreg0 <= S3;
			elsif disable_ops = '1' and wr_cmd = '1' then
				NextState_Sreg0 <= S3;
				next_load_cmd_reg <= load_cmd_in;
			elsif disable_ops = '0' then
				NextState_Sreg0 <= S1;
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
			load_cmd_reg <= z4;
			int_load_cmd_out <= z4;
			int_inhib_out <= '0';
		else
			load_cmd_reg <= next_load_cmd_reg;
			int_load_cmd_out <= next_load_cmd_out;
			int_inhib_out <= next_inhib_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
load_cmd_out <= int_load_cmd_out;
inhib_out <= int_inhib_out;

end load_controller_1_arch;
