-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\HGCAL_Veto_w_Rearm.vhd
-- Generated   : 04/13/17 11:27:36
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\HGCAL_Veto_w_Rearm.asf
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

entity HGCAL_Veto_w_Rearm is 
	port (
		clk: in STD_LOGIC;
		en_rearm: in STD_LOGIC;
		high_period: in STD_LOGIC_VECTOR (7 downto 0);
		reset_p: in STD_LOGIC;
		start_in: in STD_LOGIC;
		trig_out: out STD_LOGIC);
end HGCAL_Veto_w_Rearm;

architecture HGCAL_Veto_w_Rearm_arch of HGCAL_Veto_w_Rearm is

constant u_8: STD_LOGIC_VECTOR (7 downto 0) := "00000001";
constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
-- diagram signals declarations
signal high_per_r: STD_LOGIC_VECTOR (7 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_trig_out, next_trig_out: STD_LOGIC;
signal next_high_per_r: STD_LOGIC_VECTOR (7 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (en_rearm, high_per_r, high_period, int_trig_out, start_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_trig_out <= int_trig_out;
	next_high_per_r <= high_per_r;
	case Sreg0 is
		when S1 =>
			if start_in = '1' and en_rearm = '1' then
				NextState_Sreg0 <= S2;
				next_trig_out <= '1';
				next_high_per_r <= high_per_r + u_8;
			elsif start_in = '0' or en_rearm = '0' then
				NextState_Sreg0 <= S1;
				next_trig_out <= '0';
				next_high_per_r <= z_8;
			end if;
		when S2 =>
			if high_per_r = high_period then
				NextState_Sreg0 <= S3;
				next_trig_out <= '0';
			elsif high_per_r < high_period then
				NextState_Sreg0 <= S2;
				next_trig_out <= '1';
				next_high_per_r <= high_per_r + u_8;
			end if;
		when S3 =>
			if en_rearm = '0' then
				NextState_Sreg0 <= S1;
				next_trig_out <= '0';
				next_high_per_r <= z_8;
			elsif en_rearm = '1' then
				NextState_Sreg0 <= S3;
				next_trig_out <= '0';
				next_high_per_r <= z_8;
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
			-- high_per_r <= 		-- Initialization in the reset state or default value required!
			int_trig_out <= '0';
		else
			high_per_r <= next_high_per_r;
			int_trig_out <= next_trig_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
trig_out <= int_trig_out;

end HGCAL_Veto_w_Rearm_arch;
