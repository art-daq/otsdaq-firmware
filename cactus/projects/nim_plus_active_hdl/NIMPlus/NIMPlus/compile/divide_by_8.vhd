-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\divide_by_8.vhd
-- Generated   : 05/02/18 14:15:35
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\divide_by_8.asf
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

entity divide_by_8 is 
	port (
		clock: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sigout: out STD_LOGIC);
end divide_by_8;

architecture divide_by_8_arch of divide_by_8 is

-- diagram signals declarations
signal curr_count: STD_LOGIC_VECTOR (7 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_sigout, next_sigout: STD_LOGIC;
signal next_curr_count: STD_LOGIC_VECTOR (7 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (curr_count, int_sigout, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_sigout <= int_sigout;
	next_curr_count <= curr_count;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S2;
			next_sigout <= '1';
			next_curr_count <= curr_count + "00000001";
		when S2 =>
			if curr_count = "00000100" then
				NextState_Sreg0 <= S3;
				next_curr_count <= curr_count + "00000001";
				next_sigout <= '0';
			elsif curr_count < "00000100" then
				NextState_Sreg0 <= S2;
				next_curr_count <= curr_count + "00000001";
				next_sigout <= '1';
			end if;
		when S3 =>
			if curr_count < "00000111" then
				NextState_Sreg0 <= S3;
				next_curr_count <= curr_count + "00000001";
				next_sigout <= '0';
			elsif curr_count = "00000111" then
				NextState_Sreg0 <= S1;
				next_curr_count <= "00000000";
				next_sigout <= '0';
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
Sreg0_CurrentState: process (clock)
begin
	if clock'event and clock = '1' then
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
Sreg0_RegOutput: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_p = '1' then
			curr_count <= "00000000";
			int_sigout <= '0';
		else
			curr_count <= next_curr_count;
			int_sigout <= next_sigout;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
sigout <= int_sigout;

end divide_by_8_arch;
