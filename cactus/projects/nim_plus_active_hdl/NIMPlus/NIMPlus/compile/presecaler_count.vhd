-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\presecaler_count.vhd
-- Generated   : 05/02/18 14:14:58
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\presecaler_count.asf
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

entity presecaler_count is 
	port (
		clk: in STD_LOGIC;
		count_in: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		ct_lsb: out STD_LOGIC;
		prescale_block_n: out STD_LOGIC);
end presecaler_count;

architecture presecaler_count_arch of presecaler_count is

constant u_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
constant z_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
-- diagram signals declarations
signal count_reg: STD_LOGIC_VECTOR (31 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S2, S3
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_ct_lsb, next_ct_lsb: STD_LOGIC;
signal int_prescale_block_n, next_prescale_block_n: STD_LOGIC;
signal next_count_reg: STD_LOGIC_VECTOR (31 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (count_in, count_reg, int_ct_lsb, int_prescale_block_n, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_count_reg <= count_reg;
	next_prescale_block_n <= int_prescale_block_n;
	next_ct_lsb <= int_ct_lsb;
	case Sreg0 is
		when S2 =>
			if count_reg = count_in then
				NextState_Sreg0 <= S3;
				next_count_reg <= z_32;
				next_prescale_block_n <= '1';
				next_ct_lsb <= count_reg(0);
			elsif count_reg /= count_in then
				NextState_Sreg0 <= S2;
				next_count_reg <= count_reg + u_32;
				next_prescale_block_n <= '0';
				next_ct_lsb <= count_reg(0);
			end if;
		when S3 =>
			if count_in = z_32 then
				NextState_Sreg0 <= S3;
				next_count_reg <= z_32;
				next_prescale_block_n <= '1';
				next_ct_lsb <= count_reg(0);
			elsif count_in /= z_32 then
				NextState_Sreg0 <= S2;
				next_count_reg <= count_reg + u_32;
				next_prescale_block_n <= '0';
				next_ct_lsb <= count_reg(0);
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
			Sreg0 <= S3;
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
			int_prescale_block_n <= '1';
			int_ct_lsb <= count_reg(0);
		else
			count_reg <= next_count_reg;
			int_prescale_block_n <= next_prescale_block_n;
			int_ct_lsb <= next_ct_lsb;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
prescale_block_n <= int_prescale_block_n;
ct_lsb <= int_ct_lsb;

end presecaler_count_arch;
