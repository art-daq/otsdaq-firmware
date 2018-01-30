-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\trig_blk.vhd
-- Generated   : 04/05/16 10:06:13
-- From        : c:/NIM_Plus/AGP_2016/NIMPlus/NIMPlus/src/trig_blk.asf
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


entity trig_blk is 
	port (
		clk: in STD_LOGIC;
		dlay: in STD_LOGIC_VECTOR (7 downto 0);
		oe: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		s_in: in STD_LOGIC;
		wdth: in STD_LOGIC_VECTOR (7 downto 0);
		wr_blk: in STD_LOGIC;
		busy_n: out STD_LOGIC;
		s_out: out STD_LOGIC);
end trig_blk;

architecture trig_blk_arch of trig_blk is

constant w8: STD_LOGIC_VECTOR (7 downto 0) := "00000001";
constant z8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
-- diagram signals declarations
signal dlay_ct: STD_LOGIC_VECTOR (7 downto 0);
signal dlay_r: STD_LOGIC_VECTOR (7 downto 0);
signal wdth_ct: STD_LOGIC_VECTOR (7 downto 0);
signal wdth_r: STD_LOGIC_VECTOR (7 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S6
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_busy_n, next_busy_n: STD_LOGIC;
signal int_s_out, next_s_out: STD_LOGIC;
signal next_dlay_ct: STD_LOGIC_VECTOR (7 downto 0);
signal next_dlay_r: STD_LOGIC_VECTOR (7 downto 0);
signal next_wdth_ct: STD_LOGIC_VECTOR (7 downto 0);
signal next_wdth_r: STD_LOGIC_VECTOR (7 downto 0);

begin

-- concurrent signals assignments

-- Diagram ACTION

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (dlay, dlay_ct, dlay_r, int_busy_n, int_s_out, oe, s_in, wdth, wdth_ct, wdth_r, wr_blk, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_s_out <= int_s_out;
	next_dlay_r <= dlay_r;
	next_wdth_r <= wdth_r;
	next_busy_n <= int_busy_n;
	next_dlay_ct <= dlay_ct;
	next_wdth_ct <= wdth_ct;
	case Sreg0 is
		when S1 =>
			if oe = '0' then
				NextState_Sreg0 <= S2;
				next_s_out <= '0';
			elsif oe = '1' then
				NextState_Sreg0 <= S3;
				next_s_out <= '0';
				next_busy_n <= '1';
				next_dlay_ct <= dlay_r;
				next_wdth_ct <= wdth_r;
			end if;
		when S2 =>
			if oe = '0' and wr_blk = '0' then
				NextState_Sreg0 <= S2;
				next_s_out <= '0';
			elsif oe = '0' and wr_blk = '1' then
				NextState_Sreg0 <= S6;
				next_s_out <= '0';
				next_dlay_r <= dlay;
				next_wdth_r <= wdth;
			elsif oe = '1' then
				NextState_Sreg0 <= S1;
				next_s_out <= '0';
			end if;
		when S3 =>
			if oe = '1' and s_in = '0' then
				NextState_Sreg0 <= S3;
				next_s_out <= '0';
			elsif oe = '0' then
				NextState_Sreg0 <= S1;
				next_s_out <= '0';
				next_busy_n <= '1';
			elsif oe = '1' and s_in = '1' then
				NextState_Sreg0 <= S4;
			end if;
		when S4 =>
		-- Delay
		-- Counting

			if dlay_ct = z8 and wdth_ct > z8 then
				NextState_Sreg0 <= S5;
				next_s_out <= '1';
				next_wdth_ct <= wdth_ct - w8;
			elsif dlay_ct = z8 and 
				wdth_ct = z8 then
				NextState_Sreg0 <= S3;
				next_s_out <= '0';
				next_dlay_ct <= dlay_r;
				next_wdth_ct <= wdth_r;
			elsif dlay_ct > z8 then
				NextState_Sreg0 <= S4;
				next_dlay_ct <= dlay_ct  - w8;
				next_s_out <= '0';
			end if;
		when S5 =>
		-- Width 
		-- Counting

			if wdth_ct > z8 then
				NextState_Sreg0 <= S5;
				next_s_out <= '1';
				next_wdth_ct <= wdth_ct - w8;
			elsif wdth_ct = z8 then
				NextState_Sreg0 <= S3;
				next_s_out <= '0';
				next_dlay_ct <= dlay_r;
				next_wdth_ct <= wdth_r;
			end if;
		when S6 =>
			if oe = '1' then
				NextState_Sreg0 <= S1;
				next_s_out <= '0';
			elsif oe = '0' then
				NextState_Sreg0 <= S6;
				next_s_out <= '0';
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
			dlay_r <= z8;
			wdth_r <= z8;
			-- dlay_ct <= 		-- Initialization in the reset state or default value required!
			-- wdth_ct <= 		-- Initialization in the reset state or default value required!
			int_s_out <= '0';
			int_busy_n <= '1';
		else
			dlay_r <= next_dlay_r;
			wdth_r <= next_wdth_r;
			dlay_ct <= next_dlay_ct;
			wdth_ct <= next_wdth_ct;
			int_s_out <= next_s_out;
			int_busy_n <= next_busy_n;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
s_out <= int_s_out;
busy_n <= int_busy_n;

end trig_blk_arch;
