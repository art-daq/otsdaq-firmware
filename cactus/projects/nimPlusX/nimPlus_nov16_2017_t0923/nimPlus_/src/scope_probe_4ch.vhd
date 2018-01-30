-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\scope_probe_4ch.vhd
-- Generated   : 05/10/17 14:52:52
-- From        : U:/PREP/PREP_Modernization/Firmware_Backups/Aldec_Backups/One_Phase_Designs/AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase/NIMPlus/NIMPlus/src/scope_probe_4ch.asf
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

entity scope_probe_4ch is 
	port (
		clk: in STD_LOGIC;
		disable_p: in STD_LOGIC;
		rst_p: in STD_LOGIC;
		sig_in: in STD_LOGIC_VECTOR (3 downto 0);
		br_wr_out: out STD_LOGIC);
end scope_probe_4ch;

architecture scope_probe_4ch_arch of scope_probe_4ch is

-- diagram signals declarations
signal sig_old_r: STD_LOGIC_VECTOR (3 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_br_wr_out, next_br_wr_out: STD_LOGIC;
signal next_sig_old_r: STD_LOGIC_VECTOR (3 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (disable_p, int_br_wr_out, sig_in, sig_old_r, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_br_wr_out <= int_br_wr_out;
	next_sig_old_r <= sig_old_r;
	case Sreg0 is
		when S1 =>
			if disable_p = '1' then
				NextState_Sreg0 <= S2;
				next_br_wr_out <= '0';
				next_sig_old_r <= "0000";
			elsif disable_p = '0' then
				NextState_Sreg0 <= S1;
				if sig_in = sig_old_r then
				    next_br_wr_out <= '0';
				-- no change on inputs
				else
				    next_br_wr_out <= '1';
				end if;
			end if;
		when S2 =>
			if disable_p = '1' then
				NextState_Sreg0 <= S2;
				next_br_wr_out <= '0';
			elsif disable_p = '0' then
				NextState_Sreg0 <= S1;
				next_br_wr_out <= '0';
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
			sig_old_r <= "0000";
			int_br_wr_out <= '0';
		else
			sig_old_r <= next_sig_old_r;
			int_br_wr_out <= next_br_wr_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
br_wr_out <= int_br_wr_out;

end scope_probe_4ch_arch;
