-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\clkd_b_fifo_mux.vhd
-- Generated   : 02/01/18 11:07:14
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\clkd_b_fifo_mux.asf
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

entity clkd_b_fifo_mux is 
	port (
		clk0: in STD_LOGIC;
		cwd0: in STD_LOGIC_VECTOR (31 downto 0);
		cwd1: in STD_LOGIC_VECTOR (31 downto 0);
		cwd2: in STD_LOGIC_VECTOR (31 downto 0);
		cwd3: in STD_LOGIC_VECTOR (31 downto 0);
		cwd4: in STD_LOGIC_VECTOR (31 downto 0);
		cwd5: in STD_LOGIC_VECTOR (31 downto 0);
		latched: in STD_LOGIC;
		restp: in STD_LOGIC;
		burst_w_out: out STD_LOGIC;
		out64: out STD_LOGIC_VECTOR (63 downto 0));
end clkd_b_fifo_mux;

architecture clkd_b_fifo_mux_arch of clkd_b_fifo_mux is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_burst_w_out, next_burst_w_out: STD_LOGIC;
signal int_out64, next_out64: STD_LOGIC_VECTOR (63 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (cwd0, cwd1, cwd2, cwd3, cwd4, cwd5, int_burst_w_out, int_out64, latched, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_burst_w_out <= int_burst_w_out;
	next_out64 <= int_out64;
	case Sreg0 is
		when S1 =>
			if latched = '1' then
				NextState_Sreg0 <= S2;
				next_burst_w_out <= '0';
			elsif latched = '0' then
				NextState_Sreg0 <= S1;
				next_burst_w_out <= '0';
			end if;
		when S2 =>
			NextState_Sreg0 <= S3;
			next_out64(63 downto 32) <= cwd1(31 downto 0);
			next_out64(31 downto 0) <= cwd0(31 downto 0);
			next_burst_w_out <= '1';
		when S3 =>
			NextState_Sreg0 <= S4;
			next_out64(63 downto 32) <= cwd3(31 downto 0);
			next_out64(31 downto 0) <= cwd2(31 downto 0);
			next_burst_w_out <= '1';
		when S4 =>
			NextState_Sreg0 <= S5;
			next_out64(63 downto 32) <= cwd5(31 downto 0);
			next_out64(31 downto 0) <= cwd4(31 downto 0);
			next_burst_w_out <= '1';
		when S5 =>
			NextState_Sreg0 <= S1;
			next_burst_w_out <= '0';
--vhdl_cover_off
		when others =>
			null;
--vhdl_cover_on
	end case;
end process;

------------------------------------
-- Current State Logic (sequential)
------------------------------------
Sreg0_CurrentState: process (clk0)
begin
	if clk0'event and clk0 = '1' then
		if restp = '1' then
			Sreg0 <= S1;
		else
			Sreg0 <= NextState_Sreg0;
		end if;
	end if;
end process;

------------------------------------
-- Registered Outputs Logic
------------------------------------
Sreg0_RegOutput: process (clk0)
begin
	if clk0'event and clk0 = '1' then
		if restp = '1' then
			int_burst_w_out <= '0';
			-- int_out64 <= 		-- Initialization in the reset state or default value required!
		else
			int_burst_w_out <= next_burst_w_out;
			int_out64 <= next_out64;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
burst_w_out <= int_burst_w_out;
out64 <= int_out64;

end clkd_b_fifo_mux_arch;
