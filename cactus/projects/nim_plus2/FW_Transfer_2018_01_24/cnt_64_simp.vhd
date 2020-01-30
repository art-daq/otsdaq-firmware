-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\cnt_64_simp.vhd
-- Generated   : 01/30/18 16:21:28
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\cnt_64_simp.asf
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

entity cnt_64_simp is 
	port (
		clk: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		out64: out STD_LOGIC_VECTOR (63 downto 0));
end cnt_64_simp;

architecture cnt_64_simp_arch of cnt_64_simp is

constant u_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
constant z_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
-- diagram signals declarations
signal inc64: STD_LOGIC_VECTOR (63 downto 0);
signal reg_64: STD_LOGIC_VECTOR (63 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_out64, next_out64: STD_LOGIC_VECTOR (63 downto 0);
signal next_inc64: STD_LOGIC_VECTOR (63 downto 0);
signal next_reg_64: STD_LOGIC_VECTOR (63 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (inc64, int_out64, reg_64, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_reg_64 <= reg_64;
	next_out64 <= int_out64;
	next_inc64 <= inc64;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S1;
			next_reg_64 <= reg_64 + inc64;
			next_out64 <= reg_64;
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
			reg_64 <= z_16 & z_16 & z_16 & z_16;
			inc64 <= z_16 & z_16 & z_16 & u_16;
			int_out64 <= z_16 & z_16 & z_16 & z_16;
		else
			reg_64 <= next_reg_64;
			inc64 <= next_inc64;
			int_out64 <= next_out64;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
out64 <= int_out64;

end cnt_64_simp_arch;
