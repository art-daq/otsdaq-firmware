-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\compile\clkd_burst_mux_8_to_1.vhd
-- Generated   : 05/02/18 14:09:55
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\src\clkd_burst_mux_8_to_1.asf
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

entity clkd_burst_mux_8_to_1 is 
	port (
		burst_in: in STD_LOGIC_VECTOR (7 downto 0);
		burst_mux_sel: in STD_LOGIC_VECTOR (2 downto 0);
		clk0: in STD_LOGIC;
		rstp: in STD_LOGIC;
		sig0: in STD_LOGIC_VECTOR (63 downto 0);
		sig1: in STD_LOGIC_VECTOR (63 downto 0);
		sig2: in STD_LOGIC_VECTOR (63 downto 0);
		sig3: in STD_LOGIC_VECTOR (63 downto 0);
		sig4: in STD_LOGIC_VECTOR (63 downto 0);
		sig5: in STD_LOGIC_VECTOR (63 downto 0);
		sig6: in STD_LOGIC_VECTOR (63 downto 0);
		sig7: in STD_LOGIC_VECTOR (63 downto 0);
		b_read_out: out STD_LOGIC_VECTOR (63 downto 0);
		b_wr_out: out STD_LOGIC);
end clkd_burst_mux_8_to_1;

architecture clkd_burst_mux_8_to_1_arch of clkd_burst_mux_8_to_1 is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_b_read_out, next_b_read_out: STD_LOGIC_VECTOR (63 downto 0);
signal int_b_wr_out, next_b_wr_out: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (burst_in, burst_mux_sel, int_b_read_out, int_b_wr_out, sig0, sig1, sig2, sig3, sig4, sig5, sig6, sig7, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_b_wr_out <= int_b_wr_out;
	next_b_read_out <= int_b_read_out;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S1;
			case burst_mux_sel is
			  when "000" =>
					next_b_read_out <= sig0;
					next_b_wr_out <= burst_in(0);
			  when "001" =>
					next_b_read_out <= sig1;
					next_b_wr_out <= burst_in(1);
			  when "010" =>
					next_b_read_out <= sig2;
					next_b_wr_out <= burst_in(2);
			  when "011" =>
					next_b_read_out <= sig3;
					next_b_wr_out <= burst_in(3);
			  when "100" =>
					next_b_read_out <= sig4;
					next_b_wr_out <= burst_in(4);
			  when "101" =>
					next_b_read_out <= sig5;
					next_b_wr_out <= burst_in(5);
			  when "110" =>
					next_b_read_out <= sig6;
					next_b_wr_out <= burst_in(6);
			  when "111" =>
			 	 	next_b_read_out <= sig7;
					next_b_wr_out <= burst_in(7);
			  when others =>
					null;
					next_b_wr_out <= '0';
			end case;
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
		if rstp = '1' then
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
		if rstp = '1' then
			int_b_wr_out <= '0';
			-- int_b_read_out <= 		-- Initialization in the reset state or default value required!
		else
			int_b_wr_out <= next_b_wr_out;
			int_b_read_out <= next_b_read_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
b_wr_out <= int_b_wr_out;
b_read_out <= int_b_read_out;

end clkd_burst_mux_8_to_1_arch;
