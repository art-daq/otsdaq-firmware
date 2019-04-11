-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\cnt32_v2.vhd
-- Generated   : 05/02/18 14:15:13
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\cnt32_v2.asf
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

entity cnt32_v2 is 
	port (
		clk: in STD_LOGIC;
		rst_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		cnt_out: out STD_LOGIC_VECTOR (31 downto 0));
end cnt32_v2;

architecture cnt32_v2_arch of cnt32_v2 is

constant max_32: STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
constant u_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
constant z_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
-- diagram signals declarations
signal cnt_out_r: STD_LOGIC_VECTOR (31 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S4, S1
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_cnt_out, next_cnt_out: STD_LOGIC_VECTOR (31 downto 0);
signal next_cnt_out_r: STD_LOGIC_VECTOR (31 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (cnt_out_r, int_cnt_out, sig_in, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_cnt_out_r <= cnt_out_r;
	next_cnt_out <= int_cnt_out;
	case Sreg0 is
		when S4 =>
			if sig_in = '0' then
				NextState_Sreg0 <= S4;
				next_cnt_out <= cnt_out_r;
			elsif sig_in = '1' then
				NextState_Sreg0 <= S1;
				if cnt_out_r = max_32 then
				    next_cnt_out_r <= z_32;
				else
				    next_cnt_out_r <= cnt_out_r + u_32;
				end if;
				next_cnt_out <= cnt_out_r;
			end if;
		when S1 =>
			if sig_in = '0' then
				NextState_Sreg0 <= S4;
			elsif sig_in = '1' then
				NextState_Sreg0 <= S1;
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
			Sreg0 <= S4;
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
			cnt_out_r <= z_32;
			int_cnt_out <= z_32;
		else
			cnt_out_r <= next_cnt_out_r;
			int_cnt_out <= next_cnt_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
cnt_out <= int_cnt_out;

end cnt32_v2_arch;
