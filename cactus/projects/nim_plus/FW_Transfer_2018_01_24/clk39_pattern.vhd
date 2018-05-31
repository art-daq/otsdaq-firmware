-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\clk39_pattern.vhd
-- Generated   : 05/29/18 15:32:48
-- From        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\clk39_pattern.asf
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

entity clk39_pattern is 
	port (
		clk: in STD_LOGIC;
		d_in: in STD_LOGIC_VECTOR (2 downto 0);
		rst_p: in STD_LOGIC;
		pattern_out: out STD_LOGIC_VECTOR (7 downto 0));
end clk39_pattern;

architecture clk39_pattern_arch of clk39_pattern is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_pattern_out, next_pattern_out: STD_LOGIC_VECTOR (7 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (d_in, int_pattern_out, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_pattern_out <= int_pattern_out;
	case Sreg0 is
		when S1 =>
			NextState_Sreg0 <= S1;
			--case d_in(2 downto 0) is
			--  when "000" =>
			--    pattern_out <= "11110000";
			--  when "111" =>
			--    pattern_out <= "01111000";
			--  when "110" =>
			--    pattern_out <= "00111100";
			--  when "101" =>
			--    pattern_out <= "00011110";
			--  when "100" =>
			--    pattern_out <= "00001111";
			--  when "011" =>
			--    pattern_out <= "10000111";
			--  when "010" =>
			--    pattern_out <= "11000011";
			--  when "001" =>
			--    pattern_out <= "11100001";
			--  when others =>
			--    pattern_out <= "11110000";
			--end case;
			case d_in(2 downto 0) is
			    when "000" =>
			        next_pattern_out <= "11100001";
			    when "001" =>
			        next_pattern_out <= "11000011";
			    when "010" =>
			        next_pattern_out <= "10000111";
			    when "011" =>
			        next_pattern_out <= "00001111";
			    when "100" =>
			        next_pattern_out <= "00011110";
			    when "101" =>
			        next_pattern_out <= "00111100";
			    when "110" =>
			        next_pattern_out <= "01111000";
			    when "111" =>
			        next_pattern_out <= "11110000";
			    when others =>
			        next_pattern_out <= "11100001";
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
			int_pattern_out <= "11110000";
		else
			int_pattern_out <= next_pattern_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
pattern_out <= int_pattern_out;

end clk39_pattern_arch;
