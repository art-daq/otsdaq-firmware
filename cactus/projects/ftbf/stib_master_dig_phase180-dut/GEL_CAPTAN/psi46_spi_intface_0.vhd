-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\psi46_spi_intface_0.vhd
-- Generated   : 08/02/08 09:41:15
-- From        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\src\psi46_spi_intface_0.asf
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

entity psi46_spi_intface_0 is 
	port (
		clock_40: in STD_LOGIC;
		clock_80: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		we: in STD_LOGIC;
		wr_data: in STD_LOGIC_VECTOR (31 downto 0);
		state_debug: out STD_LOGIC_VECTOR (7 downto 0);
		comm_err: out STD_LOGIC;
		data_out: out STD_LOGIC);
end psi46_spi_intface_0;

architecture psi46_spi_intface_0 of psi46_spi_intface_0 is

-- diagram signals declarations
signal wr_byte_0: STD_LOGIC_VECTOR (7 downto 0);
signal wr_byte_1: STD_LOGIC_VECTOR (7 downto 0);
signal wr_byte_2: STD_LOGIC_VECTOR (7 downto 0);
signal wr_byte_3: STD_LOGIC_VECTOR (7 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    idle, write_loop, stop_c, stop_1_2, stop_3, comm_byte_S3, comm_byte_S4, comm_byte_S5, comm_byte_S6, comm_byte_S7, comm_byte_S8, comm_byte_S9,
    comm_byte_S10, comm_byte_S11, comm_byte_S12, comm_byte_S13, comm_byte_S14, comm_byte_S15, comm_byte_S17, comm_byte_S18, comm_byte_S19,
    comm_byte_S20, comm_byte_S16, S21, S22, S23, S24, S25, S26, S27, S29, comm_ill, S28, byte_3_S30, byte_3_S31, byte_3_S32, byte_3_S33,
    byte_3_S34, byte_3_S35, byte_3_S36, byte_3_S37, byte_3_S38, byte_3_S39, byte_3_S40, byte_3_S42, byte_3_S43, byte_3_S44, byte_3_S45,
    byte_3_S46, byte_3_S47, byte_1_2_S63, byte_1_2_S62, byte_1_2_S61, byte_1_2_S60, byte_1_2_S64, byte_1_2_S49, byte_1_2_S56, byte_1_2_S48,
    byte_1_2_S53, byte_1_2_S51, byte_1_2_S50, byte_1_2_S55, byte_1_2_S54, byte_1_2_S59, byte_1_2_S58, byte_1_2_S57, byte_1_2_S52, byte_1_2_S1,
    byte_1_2_S65, comm_byte_S66, comm_byte_S67, byte_3_S68, byte_3_S69, byte_1_2_S70, byte_1_2_S71, byte_1_2_S72, byte_1_2_S73, byte_1_2_S74,
    byte_1_2_S75, byte_1_2_S76, byte_1_2_S77, byte_1_2_S78, byte_1_2_S79, byte_1_2_S80, byte_1_2_S81, byte_1_2_S82, byte_1_2_S83, byte_1_2_S84,
    byte_1_2_S85, byte_1_2_S86, byte_1_2_S87, byte_1_2_S88, byte_1_2_S89
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock_80)
begin
	if clock_80'event and clock_80 = '1' then
		if reset_n = '0' then	
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
			data_out <= '1';
			wr_byte_0 <= v_8_0;
			wr_byte_1 <= v_8_0;
			wr_byte_2 <= v_8_0;
			wr_byte_3 <= v_8_0;
			comm_err <= '0';
			
			state_debug <= (others => '0');
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when idle =>
					
					data_out <= '1';
					comm_err <= '0';
					
					if we = '1' then	
						Sreg0 <= write_loop;
					end if;
					
					state_debug <= x"01";
				when write_loop =>
					wr_byte_3 <= wr_data(31 downto 24);
					wr_byte_2 <= wr_data(23 downto 16);
					wr_byte_1 <= wr_data(15 downto 8);
					wr_byte_0 <= wr_data(7 downto 0);
						
					if we = '0' and 
						((wr_byte_0(3 downto 0) = "1000") or
						(wr_byte_0(3 downto 0) = "0100") or
						(wr_byte_0(3 downto 0) = "0010") or
						(wr_byte_0(3 downto 0) = "0001")) then	
						Sreg0 <= comm_byte_S3;
					elsif we = '0' then	
						Sreg0 <= comm_ill;
						comm_err <= '1';
					end if;
					
					state_debug <= x"02";
				when stop_c =>
					if wr_byte_0(3 downto 0) /= "0001" then	
						Sreg0 <= byte_1_2_S59;
					elsif wr_byte_0(3 downto 0) = "0001" then	
						Sreg0 <= S21;
					end if;
					
					state_debug <= x"03"; 
				when stop_1_2 =>
					if wr_byte_0(3 downto 0) = "1000" then	
						Sreg0 <= S24;
					elsif wr_byte_0(3 downto 0) /= "1000" then	
						Sreg0 <= byte_3_S42;
					end if;
					
					state_debug <= x"04";
				when stop_3 =>
					Sreg0 <= S27;
				when S21 =>
					Sreg0 <= S22;
					data_out <= '0';
				when S22 =>
					Sreg0 <= S23;
					data_out <= '1';
					-- stop
				when S23 =>
					Sreg0 <= idle;
				when S24 =>
					Sreg0 <= S25;
					data_out <= '0';
				when S25 =>
					Sreg0 <= S26;
					data_out <= '1';
					-- stop
				when S26 =>
					Sreg0 <= idle;
				when S27 =>
					Sreg0 <= S28;
					data_out <= '0';
				when S29 =>
					Sreg0 <= idle;
				when comm_ill =>
					Sreg0 <= idle;
				when S28 =>
					Sreg0 <= S29;
					data_out <= '1';
					-- stop
				when byte_1_2_S63 =>
					Sreg0 <= byte_1_2_S62;
				when byte_1_2_S62 =>
					Sreg0 <= byte_1_2_S61;
					data_out <= wr_byte_1(6);
				when byte_1_2_S61 =>
					Sreg0 <= byte_1_2_S60;
				when byte_1_2_S60 =>
					Sreg0 <= byte_1_2_S64;
					data_out <= wr_byte_1(5);
				when byte_1_2_S64 =>
					Sreg0 <= byte_1_2_S48;
				when byte_1_2_S49 =>
					Sreg0 <= byte_1_2_S56;
				when byte_1_2_S56 =>
					Sreg0 <= byte_1_2_S55;
					data_out <= wr_byte_1(2);
				when byte_1_2_S48 =>
					Sreg0 <= byte_1_2_S53;
					data_out <= wr_byte_1(4);
				when byte_1_2_S53 =>
					Sreg0 <= byte_1_2_S52;
				when byte_1_2_S51 =>
					Sreg0 <= byte_1_2_S50;
				when byte_1_2_S50 =>
					Sreg0 <= byte_1_2_S49;
					data_out <= wr_byte_1(3);
				when byte_1_2_S55 =>
					Sreg0 <= byte_1_2_S54;
				when byte_1_2_S54 =>
					Sreg0 <= byte_1_2_S58;
					data_out <= wr_byte_1(1);
				when byte_1_2_S59 =>
					Sreg0 <= byte_1_2_S63;
					data_out <= wr_byte_1(7);
				when byte_1_2_S58 =>
					Sreg0 <= byte_1_2_S57;
				when byte_1_2_S57 =>
					Sreg0 <= byte_1_2_S1;
					data_out <= wr_byte_1(0);
				when byte_1_2_S52 =>
					Sreg0 <= byte_1_2_S51;
					data_out <= not(wr_byte_1(4));
				when byte_1_2_S1 =>
					Sreg0 <= byte_1_2_S65;
				when byte_1_2_S65 =>
					Sreg0 <= byte_1_2_S70;
					data_out <= not(wr_byte_1(0));
				when byte_1_2_S70 =>
					Sreg0 <= byte_1_2_S71;
				when byte_1_2_S71 =>
					Sreg0 <= byte_1_2_S72;
					data_out <= wr_byte_2(7);
				when byte_1_2_S72 =>
					Sreg0 <= byte_1_2_S73;
				when byte_1_2_S73 =>
					Sreg0 <= byte_1_2_S74;
					data_out <= wr_byte_2(6);
				when byte_1_2_S74 =>
					Sreg0 <= byte_1_2_S75;
				when byte_1_2_S75 =>
					Sreg0 <= byte_1_2_S76;
					data_out <= wr_byte_2(5);
				when byte_1_2_S76 =>
					Sreg0 <= byte_1_2_S77;
				when byte_1_2_S77 =>
					Sreg0 <= byte_1_2_S78;
					data_out <= wr_byte_2(4);
				when byte_1_2_S78 =>
					Sreg0 <= byte_1_2_S79;
				when byte_1_2_S79 =>
					Sreg0 <= byte_1_2_S80;
					data_out <= not(wr_byte_2(4));
				when byte_1_2_S80 =>
					Sreg0 <= byte_1_2_S81;
				when byte_1_2_S81 =>
					Sreg0 <= byte_1_2_S82;
					data_out <= wr_byte_2(3);
				when byte_1_2_S82 =>
					Sreg0 <= byte_1_2_S83;
				when byte_1_2_S83 =>
					Sreg0 <= byte_1_2_S84;
					data_out <= wr_byte_2(2);
				when byte_1_2_S84 =>
					Sreg0 <= byte_1_2_S85;
				when byte_1_2_S85 =>
					Sreg0 <= byte_1_2_S86;
					data_out <= wr_byte_2(1);
				when byte_1_2_S86 =>
					Sreg0 <= byte_1_2_S87;
				when byte_1_2_S87 =>
					Sreg0 <= byte_1_2_S88;
					data_out <= wr_byte_2(0);
				when byte_1_2_S88 =>
					Sreg0 <= byte_1_2_S89;
				when byte_1_2_S89 =>
					Sreg0 <= stop_1_2;
					data_out <= not(wr_byte_2(0));
				when byte_3_S30 =>
					Sreg0 <= byte_3_S31;
					data_out <= wr_byte_3(4);
				when byte_3_S31 =>
					Sreg0 <= byte_3_S32;
				when byte_3_S32 =>
					Sreg0 <= byte_3_S33;
					data_out <= not(wr_byte_3(4));
				when byte_3_S33 =>
					Sreg0 <= byte_3_S34;
				when byte_3_S34 =>
					Sreg0 <= byte_3_S35;
					data_out <= wr_byte_3(3);
				when byte_3_S35 =>
					Sreg0 <= byte_3_S36;
				when byte_3_S36 =>
					Sreg0 <= byte_3_S37;
					data_out <= wr_byte_3(2);
				when byte_3_S37 =>
					Sreg0 <= byte_3_S38;
				when byte_3_S38 =>
					Sreg0 <= byte_3_S39;
					data_out <= wr_byte_3(1);
				when byte_3_S39 =>
					Sreg0 <= byte_3_S40;
				when byte_3_S40 =>
					Sreg0 <= byte_3_S68;
					data_out <= wr_byte_3(0);
				when byte_3_S42 =>
					Sreg0 <= byte_3_S43;
					data_out <= wr_byte_3(7);
				when byte_3_S43 =>
					Sreg0 <= byte_3_S44;
				when byte_3_S44 =>
					Sreg0 <= byte_3_S45;
					data_out <= wr_byte_3(6);
				when byte_3_S45 =>
					Sreg0 <= byte_3_S46;
				when byte_3_S46 =>
					Sreg0 <= byte_3_S47;
					data_out <= wr_byte_3(5);
				when byte_3_S47 =>
					Sreg0 <= byte_3_S30;
				when byte_3_S68 =>
					Sreg0 <= byte_3_S69;
				when byte_3_S69 =>
					Sreg0 <= stop_3;
					data_out <= not(wr_byte_3(0));
				when comm_byte_S3 =>
					if clock_40 = '0' then	
						Sreg0 <= comm_byte_S3;
						data_out <= '1';
					elsif clock_40 = '1' then	
						Sreg0 <= comm_byte_S4;
						data_out <= '0';
						-- start bit
					end if;
					
					state_debug <= x"05";
				when comm_byte_S4 =>
					Sreg0 <= comm_byte_S5;
					data_out <= wr_byte_0(7);
				when comm_byte_S5 =>
					Sreg0 <= comm_byte_S6;
				when comm_byte_S6 =>
					Sreg0 <= comm_byte_S7;
					data_out <= wr_byte_0(6);
				when comm_byte_S7 =>
					Sreg0 <= comm_byte_S8;
				when comm_byte_S8 =>
					Sreg0 <= comm_byte_S9;
					data_out <= wr_byte_0(5);
				when comm_byte_S9 =>
					Sreg0 <= comm_byte_S10;
				when comm_byte_S10 =>
					Sreg0 <= comm_byte_S11;
					data_out <= wr_byte_0(4);
				when comm_byte_S11 =>
					Sreg0 <= comm_byte_S12;
				when comm_byte_S12 =>
					Sreg0 <= comm_byte_S13;
					data_out <= not(wr_byte_0(4));
				when comm_byte_S13 =>
					Sreg0 <= comm_byte_S14;
				when comm_byte_S14 =>
					Sreg0 <= comm_byte_S15;
					data_out <= wr_byte_0(3);
				when comm_byte_S15 =>
					Sreg0 <= comm_byte_S16;
				when comm_byte_S17 =>
					Sreg0 <= comm_byte_S18;
				when comm_byte_S18 =>
					Sreg0 <= comm_byte_S19;
					data_out <= wr_byte_0(1);
				when comm_byte_S19 =>
					Sreg0 <= comm_byte_S20;
				when comm_byte_S20 =>
					Sreg0 <= comm_byte_S66;
					data_out <= wr_byte_0(0);
				when comm_byte_S16 =>
					Sreg0 <= comm_byte_S17;
					data_out <= wr_byte_0(2);
				when comm_byte_S66 =>
					Sreg0 <= comm_byte_S67;
				when comm_byte_S67 =>
					Sreg0 <= stop_c;
					data_out <= not(wr_byte_0(0));
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end psi46_spi_intface_0;
