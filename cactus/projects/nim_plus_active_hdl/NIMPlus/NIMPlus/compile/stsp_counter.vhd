-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\stsp_counter.vhd
-- Generated   : 05/02/18 14:15:06
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\stsp_counter.asf
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

entity stsp_counter is 
	port (
		clk: in STD_LOGIC;
		rst_p: in STD_LOGIC;
		stp: in STD_LOGIC;
		strt: in STD_LOGIC;
		count_out: out STD_LOGIC_VECTOR (31 downto 0);
		ovr: out STD_LOGIC);
end stsp_counter;

architecture stsp_counter_arch of stsp_counter is

constant count_max: STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
constant u_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
constant z_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
-- diagram signals declarations
signal count_out_r: STD_LOGIC_VECTOR (31 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_count_out, next_count_out: STD_LOGIC_VECTOR (31 downto 0);
signal int_ovr, next_ovr: STD_LOGIC;
signal next_count_out_r: STD_LOGIC_VECTOR (31 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (count_out_r, int_count_out, int_ovr, stp, strt, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_ovr <= int_ovr;
	next_count_out <= int_count_out;
	next_count_out_r <= count_out_r;
	case Sreg0 is
		when S1 =>
			if strt = '0' then
				NextState_Sreg0 <= S1;
				next_ovr <= '0';
				next_count_out <= z_32;
				next_count_out_r <= z_32;
			elsif strt = '1' then
				NextState_Sreg0 <= S2;
				next_ovr <= '0';
				next_count_out_r <= count_out_r + u_32;
				next_count_out <= count_out_r;
			end if;
		when S2 =>
			if stp = '0' and
				count_out_r < count_max then
				NextState_Sreg0 <= S2;
				next_ovr <= '0';
				next_count_out_r <= count_out_r + u_32;
				next_count_out <= count_out_r;
			elsif stp = '0' and
				count_out_r = count_max then
				NextState_Sreg0 <= S4;
				next_ovr <= '1';
				next_count_out <= count_out_r;
			elsif stp = '1' then
				NextState_Sreg0 <= S3;
				if (count_out_r = count_max) then
				    next_ovr <= '1';
				else
				    next_ovr <= '0';
				end if;
				next_count_out <= count_out_r;
			end if;
		when S3 =>
			NextState_Sreg0 <= S3;
			next_count_out <= count_out_r;
		when S4 =>
			NextState_Sreg0 <= S4;
			next_count_out <= count_out_r;
			next_ovr <= '1';
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
			count_out_r <= z_32;
			int_ovr <= '0';
			int_count_out <= z_32;
		else
			count_out_r <= next_count_out_r;
			int_ovr <= next_ovr;
			int_count_out <= next_count_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
ovr <= int_ovr;
count_out <= int_count_out;

end stsp_counter_arch;
