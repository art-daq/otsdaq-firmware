-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\CAPTAN_trig_0.vhd
-- Generated   : 08/08/08 16:52:33
-- From        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\src\CAPTAN_trig_0.asf
-- By          : FSM2VHDL ver. 5.0.0.9
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
use params_package.all;

entity captan_trig_0 is 
	port (
		clock_40_0: in STD_LOGIC;
		data_in: in STD_LOGIC_VECTOR (31 downto 0);
		reset_n: in STD_LOGIC;
		we: in STD_LOGIC;
		busy: out STD_LOGIC;
		trig_out: out STD_LOGIC);
end captan_trig_0;

architecture captan_trig_0 of CAPTAN_trig_0 is

constant base_val: STD_LOGIC_VECTOR (11 downto 0) := "000000010100";
constant one_12: STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
constant one_8: STD_LOGIC_VECTOR (7 downto 0) := "00000001";
constant three_8: STD_LOGIC_VECTOR (7 downto 0) := "00000011";
constant zero_12: STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
constant zero_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
-- diagram signals declarations
signal base_count: STD_LOGIC_VECTOR (11 downto 0);
signal burst_count: STD_LOGIC_VECTOR (7 downto 0);
signal burst_in: STD_LOGIC_VECTOR (7 downto 0);
signal cal_count: STD_LOGIC_VECTOR (7 downto 0);
signal cal_in: STD_LOGIC_VECTOR (7 downto 0);
signal count_down: STD_LOGIC_VECTOR (11 downto 0);
signal count_in: STD_LOGIC_VECTOR (11 downto 0);
signal mode: STD_LOGIC;
signal trig_in: STD_LOGIC_VECTOR (1 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S4, S5, S6, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S25, S24, S23, S26, S27, S3, S28,
    S7
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock_40_0)
begin
	if clock_40_0'event and clock_40_0 = '1' then
		if reset_n = '0' then	
			Sreg0 <= S27;
			-- Set default values for outputs, signals and variables
			-- ...
			trig_out <= '0';
			burst_count <= zero_8;
			base_count <= base_val;
			cal_count <= zero_8;
			busy <= '0';
			burst_in <= zero_8;
			cal_in <= zero_8;
			count_in <= zero_12;
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S1 =>
					count_down <= count_in;
					trig_out <= '0';
					burst_count <= burst_in;
					cal_count <= cal_in - three_8;
					busy <= '0';
					if mode = '0' and trig_in = "01" then	
						Sreg0 <= S13;
					elsif mode = '0' and trig_in /= "01" then	
						Sreg0 <= S7;
					elsif mode = '1' then	
						Sreg0 <= S2;
					end if;
				when S2 =>
					trig_out <= '0';
					base_count <= base_val;
					if count_down = zero_12 then	
						Sreg0 <= S4;
					elsif count_down /= zero_12 then	
						Sreg0 <= S3;
						count_down <= count_down - one_12;
					end if;
				when S4 =>
					trig_out <= '1';
					cal_count <= cal_in;
					Sreg0 <= S5;
				when S5 =>
					if trig_in = "01" then
					  trig_out <= '0';
					else
					  trig_out <= trig_in(1);
					end if;
					Sreg0 <= S6;
				when S6 =>
					if trig_in = "01" then
					  trig_out <= '0';
					else
					  trig_out <= trig_in(0);
					end if;
					if trig_in = "01" then	
						Sreg0 <= S23;
					elsif trig_in /= "01" then	
						Sreg0 <= S27;
					end if;
				when S8 =>
					trig_out <= '1';
					busy <= '1';
					Sreg0 <= S9;
				when S9 =>
					trig_out <= trig_in(1);
					count_down <= count_in;
					burst_count <= burst_count - one_8;
					base_count <= base_val;
					Sreg0 <= S10;
				when S10 =>
					trig_out <= trig_in(0);
					Sreg0 <= S11;
				when S11 =>
					trig_out <= '0';
					if count_down /= zero_12 then	
						Sreg0 <= S12;
						count_down <= count_down - one_12;
					elsif burst_count = zero_8
						and count_down = zero_12 then	
						Sreg0 <= S27;
					elsif burst_count /= zero_8
						and count_down = zero_12 then	
						Sreg0 <= S8;
					end if;
				when S12 =>
					if base_count /= zero_12 then	
						Sreg0 <= S12;
						base_count <= base_count - one_12;
					elsif base_count = zero_12 then	
						Sreg0 <= S11;
					end if;
				when S13 =>
					trig_out <= '0';
					count_down <= count_in;
					burst_count <= burst_in;
					Sreg0 <= S14;
				when S14 =>
					trig_out <= '1';
					busy <= '1';
					Sreg0 <= S15;
				when S15 =>
					trig_out <= '0';
					count_down <= count_in;
					burst_count <= burst_count - one_8;
					base_count <= base_val;
					cal_count <= cal_in;
					Sreg0 <= S16;
				when S16 =>
					trig_out <= '0';
					Sreg0 <= S17;
				when S17 =>
					trig_out <= '0';
					if cal_count /= zero_8 then	
						Sreg0 <= S17;
						cal_count <= cal_count - one_8;
					elsif cal_count = zero_8 then	
						Sreg0 <= S18;
					end if;
				when S18 =>
					trig_out <= '1';
					Sreg0 <= S19;
				when S19 =>
					trig_out <= '1';
					Sreg0 <= S20;
				when S20 =>
					trig_out <= '0';
					Sreg0 <= S21;
				when S21 =>
					trig_out <= '0';
					if burst_count = zero_8
						and count_down = zero_12 then	
						Sreg0 <= S27;
					elsif count_down /=  zero_12 then	
						Sreg0 <= S22;
						count_down <= count_down - one_12;
					elsif burst_count /= zero_8
						and count_down = zero_12 then	
						Sreg0 <= S14;
					end if;
				when S22 =>
					if base_count /= zero_12 then	
						Sreg0 <= S22;
						base_count <= base_count - one_12;
					elsif base_count = zero_12 then	
						Sreg0 <= S21;
					end if;
				when S25 =>
					trig_out <= '1';
					Sreg0 <= S26;
				when S24 =>
					trig_out <= '1';
					Sreg0 <= S25;
				when S23 =>
					trig_out <= '0';
					if cal_count /= zero_8 then	
						Sreg0 <= S23;
						cal_count <= cal_count - one_8;
					elsif cal_count = zero_8 then	
						Sreg0 <= S24;
					end if;
				when S26 =>
					trig_out <= '0';
					Sreg0 <= S27;
				when S27 =>
					trig_out <= '0';
					burst_count <= zero_8;
					base_count <= base_val;
					cal_count <= zero_8;
					busy <= '0';
					burst_in <= zero_8;
					cal_in <= zero_8;
					count_in <= zero_12;
					if we = '0' then	
						Sreg0 <= S27;
					elsif we = '1' then	
						Sreg0 <= S28;
						mode <= data_in(0);
						trig_in <= data_in(2 downto 1);
						burst_in <= data_in(10 downto 3);
						cal_in <= data_in(18 downto 11);
						count_in <= data_in(30 downto 19);
					end if;
				when S3 =>
					if base_count = zero_12 then	
						Sreg0 <= S2;
					elsif base_count /= zero_12 then	
						Sreg0 <= S3;
						base_count <= base_count - one_12;
					end if;
				when S28 =>
					if we = '0' then	
						Sreg0 <= S1;
					elsif we = '1' then	
						Sreg0 <= S28;
						mode <= data_in(0);
						trig_in <= data_in(2 downto 1);
						burst_in <= data_in(10 downto 3);
						cal_in <= data_in(18 downto 11);
						count_in <= data_in(30 downto 19);
					end if;
				when S7 =>
					trig_out <= '0';
					count_down <= count_in;
					burst_count <= burst_in;
					Sreg0 <= S8;
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end CAPTAN_trig_0;
