-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\acc_sync.vhd
-- Generated   : 05/25/18 14:34:37
-- From        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\acc_sync.asf
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

entity acc_sync is 
	port (
		clk_13_25: in STD_LOGIC;
		clk_26_5: in STD_LOGIC;
		clk_in: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		release_p: out STD_LOGIC);
end acc_sync;

architecture acc_sync_arch of acc_sync is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S3, S1, S2
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_release_p, next_release_p: STD_LOGIC;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (clk_13_25, clk_26_5, int_release_p, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_release_p <= int_release_p;
	case Sreg0 is
		when S3 =>
			NextState_Sreg0 <= S1;
			next_release_p <= '0';
		when S1 =>
			if (clk_13_25 = '0') and (clk_26_5 = '0') then
				NextState_Sreg0 <= S2;
				next_release_p <= '0';
			end if;
		when S2 =>
			if (clk_13_25 = '1') then
				NextState_Sreg0 <= S3;
				next_release_p <= '1';
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
Sreg0_CurrentState: process (clk_in)
begin
	if clk_in'event and clk_in = '1' then
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
Sreg0_RegOutput: process (clk_in)
begin
	if clk_in'event and clk_in = '1' then
		if reset_p = '1' then
			int_release_p <= '0';
		else
			int_release_p <= next_release_p;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
release_p <= int_release_p;

end acc_sync_arch;
