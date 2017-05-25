-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ots_interface
-- Author      : Fermi User
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- File        : D:\elewis\ots_interface\ots_interface\ots_interface\compile\ram_chip_simulator.vhd
-- Generated   : 05/16/17 10:56:38
-- From        : D:/elewis/ots_interface/ots_interface/ots_interface/src/ram_chip_simulator.asf
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

library unisim;
   use unisim.vcomponents.all;

entity RAM_chip_simulator is 
	port (
		chip_select: in STD_LOGIC;
		reset: in STD_LOGIC;
		SCLK: in STD_LOGIC;
		io_0: inout STD_LOGIC;
		io_1: inout STD_LOGIC;
		io_2: inout STD_LOGIC;
		io_3: inout STD_LOGIC);
end RAM_chip_simulator;

architecture RAM_chip_simulator_arch of RAM_chip_simulator is

-- diagram signals declarations
signal counter: STD_LOGIC_VECTOR (7 downto 0);
signal input_sig: STD_LOGIC;
signal io_in: STD_LOGIC_VECTOR (3 downto 0);
signal io_out: STD_LOGIC_VECTOR (3 downto 0);
signal test: STD_LOGIC;

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S6, S7, S8, S18, S10, S12, S13, S14, S15, S16, S17, S28, S19, S20, S21, S22, S23, S24, S25, S27, S9, S26, wait_for_cs_high
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin

-- concurrent signals assignments

-- Diagram ACTION
IOBUF_Inst0 : IOBUF
      port map (
         O     => io_in(0),              -- data from bidir bus
         IO    => io_0,              -- data on bidir bus
         I     => io_out(0),             -- data to bidir bus
         T     => input_sig);
         -- 3-state enable input, high=input, low=output
IOBUF_Inst1 : IOBUF
      port map (
         O     => io_in(1),              -- data from bidir bus
         IO    => io_1,              -- data on bidir bus
         I     => io_out(1),             -- data to bidir bus
         T     => input_sig);
         -- 3-state enable input, high=input, low=output
IOBUF_Inst2 : IOBUF
      port map (
         O     => io_in(2),              -- data from bidir bus
         IO    => io_2,              -- data on bidir bus
         I     => io_out(2),             -- data to bidir bus
         T     => input_sig);
         -- 3-state enable input, high=input, low=output
IOBUF_Inst3 : IOBUF
      port map (
         O     => io_in(3),              -- data from bidir bus
         IO    => io_3,              -- data on bidir bus
         I     => io_out(3),             -- data to bidir bus
         T     => input_sig);
         -- 3-state enable input, high=input, low=output

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (SCLK)
begin
	if SCLK'event and SCLK = '1' then
		if reset = '0' then
			Sreg0 <= S1;
			-- Set default values for outputs, signals and variables
			-- ...
			io_out <= (others =>'0');
			input_sig <= '1';
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S1 =>
					if io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S2;
					end if;
				when S2 =>
					if io_in(0) = '1' and chip_select = '0' then
						Sreg0 <= S3;
					elsif io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S12;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S3 =>
					if io_in(0) = '1' and chip_select = '0' then
						Sreg0 <= S4;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S4 =>
					if io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S5;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S5 =>
					if io_in(0) = '1' and chip_select = '0' then
						Sreg0 <= S6;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S6 =>
					if io_in(0)= '1' and chip_select = '0' then
						Sreg0 <= S7;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S7 =>
					if io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S8;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S8 =>
					if io_in(0) ='0' and chip_select = '0' then
						Sreg0 <= S9;
						counter <= (others => '0');
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S18 =>
					input_sig <= '0';
					io_out <= (others => '0');
					Sreg0 <= S21;
				when S10 =>
					if chip_select = '1' then
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					elsif chip_select = '0' then
						Sreg0 <= S19;
						io_out <= "1111";
					end if;
				when S12 =>
					if io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S13;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S13 =>
					if io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S14;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S14 =>
					if io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S15;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S15 =>
					if io_in(0)= '1' and chip_select = '0' then
						Sreg0 <= S16;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S16 =>
					if io_in(0) = '0' and chip_select = '0' then
						Sreg0 <= S17;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S17 =>
					if io_in(0) = '1' and chip_select = '0' then
						Sreg0 <= S18;
					else
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S28 =>
					Sreg0 <= S27;
				when S19 =>
					if chip_select ='1' then
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					elsif chip_select = '0' then
						Sreg0 <= S20;
						io_out <= "1001";
					end if;
				when S20 =>
					if chip_select = '1' then
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					elsif chip_select = '0' then
						Sreg0 <= S10;
						io_out <= "0000";
					end if;
				when S21 =>
					Sreg0 <= S22;
					io_out(0) <= '0';
					--err bit
				when S22 =>
					Sreg0 <= S23;
					io_out(0) <= '0';
				when S23 =>
					Sreg0 <= S24;
				when S24 =>
					Sreg0 <= S25;
				when S25 =>
					Sreg0 <= S26;
				when S27 =>
					Sreg0 <= wait_for_cs_high;
					input_sig <= '1';
				when S9 =>
					counter <= counter +1;
					if unsigned(counter) = 31 and chip_select = '0' then
						Sreg0 <= S10;
						counter <= (others => '0');
						input_sig <= '0';
					elsif chip_select = '1' then
						Sreg0 <= wait_for_cs_high;
						input_sig <= '1';
					end if;
				when S26 =>
					Sreg0 <= S28;
				when wait_for_cs_high =>
					if chip_select = '1' then
						Sreg0 <= S1;
						input_sig <= '1';
					end if;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end RAM_chip_simulator_arch;
