-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_04_30_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\veto_count.vhd
-- Generated   : 04/30/17 13:10:23
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_04_30_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\veto_count.asf
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

entity veto_count is 
	port (
		clk: in STD_LOGIC;
		count_in: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		veto_out_n: out STD_LOGIC);
end veto_count;

architecture veto_count_arch of veto_count is

constant u_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
constant z_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
-- diagram signals declarations
signal count_reg: STD_LOGIC_VECTOR (31 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_veto_out_n, next_veto_out_n: STD_LOGIC;
signal next_count_reg: STD_LOGIC_VECTOR (31 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (count_in, count_reg, int_veto_out_n, sig_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_count_reg <= count_reg;
	next_veto_out_n <= int_veto_out_n;
	case Sreg0 is
		when S1 =>
			if sig_in = '1' and count_in /= z_32 then
				NextState_Sreg0 <= S2;
				next_count_reg <= count_reg + u_32;
				next_veto_out_n <= '0';
			elsif sig_in = '0' or count_in = z_32 then
				NextState_Sreg0 <= S1;
				next_count_reg <= z_32;
				next_veto_out_n <= '1';
			end if;
		when S2 =>
			if count_reg = count_in then
				NextState_Sreg0 <= S1;
				next_count_reg <= z_32;
				next_veto_out_n <= '1';
			elsif count_reg /= count_in then
				NextState_Sreg0 <= S2;
				next_count_reg <= count_reg + u_32;
				next_veto_out_n <= '0';
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
			count_reg <= z_32;
			int_veto_out_n <= '1';
		else
			count_reg <= next_count_reg;
			int_veto_out_n <= next_veto_out_n;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
veto_out_n <= int_veto_out_n;

end veto_count_arch;
