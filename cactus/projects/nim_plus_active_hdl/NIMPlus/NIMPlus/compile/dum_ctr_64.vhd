-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\compile\dum_ctr_64.vhd
-- Generated   : 05/02/18 14:10:03
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\src\dum_ctr_64.asf
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

entity dum_ctr_64 is 
	port (
		ce: in STD_LOGIC;
		clk: in STD_LOGIC;
		sclr: in STD_LOGIC;
		q: out STD_LOGIC_VECTOR (63 downto 0));
end dum_ctr_64;

architecture dum_ctr_64_arch of dum_ctr_64 is

constant u_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
constant z_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
-- diagram signals declarations
signal q_reg: STD_LOGIC_VECTOR (63 downto 0);
signal u_64: STD_LOGIC_VECTOR (63 downto 0);
signal z_64: STD_LOGIC_VECTOR (63 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_q, next_q: STD_LOGIC_VECTOR (63 downto 0);
signal next_q_reg: STD_LOGIC_VECTOR (63 downto 0);
signal next_u_64: STD_LOGIC_VECTOR (63 downto 0);
signal next_z_64: STD_LOGIC_VECTOR (63 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (ce, int_q, q_reg, u_64, z_64, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_q_reg <= q_reg;
	next_q <= int_q;
	next_z_64 <= z_64;
	next_u_64 <= u_64;
	case Sreg0 is
		when S1 =>
			if ce = '1' then
				NextState_Sreg0 <= S2;
				next_q_reg <= q_reg + u_64;
				next_q <= q_reg;
			elsif ce <= '0' then
				NextState_Sreg0 <= S1;
				next_q <= q_reg;
			end if;
		when S2 =>
			if ce <= '0' then
				NextState_Sreg0 <= S1;
				next_q <= q_reg;
			elsif ce = '1' then
				NextState_Sreg0 <= S2;
				next_q_reg <= q_reg + u_64;
				next_q <= q_reg;
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
		if sclr = '1' then
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
		if sclr = '1' then
			q_reg <= z_64;
			z_64 <= z_16 & z_16 & z_16 & z_16;
			u_64 <= z_16 & z_16 & z_16 & u_16;
			int_q <= z_64;
		else
			q_reg <= next_q_reg;
			z_64 <= next_z_64;
			u_64 <= next_u_64;
			int_q <= next_q;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
q <= int_q;

end dum_ctr_64_arch;
