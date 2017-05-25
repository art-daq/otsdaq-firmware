-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : 
-- Author      : Fermi User
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- File        : D:\elewis\ots_interface\ots_interface\ots_interface\compile\ram_memory_test.vhd
-- Generated   : 05/16/17 10:56:21
-- From        : D:/elewis/ots_interface/ots_interface/ots_interface/src/ram_memory_test.asf
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


entity ram_memory_test is 
	port (
		data_out: in STD_LOGIC_VECTOR (3 downto 0);
		dv: in STD_LOGIC;
		FLASH_CLK: in STD_LOGIC;
		ready: in STD_LOGIC;
		reset_in: in STD_LOGIC;
		start_data: in STD_LOGIC;
		data_in: out STD_LOGIC_VECTOR (3 downto 0);
		mode: out STD_LOGIC_VECTOR (7 downto 0);
		received_data: out STD_LOGIC_VECTOR (63 downto 0);
		size: out STD_LOGIC_VECTOR (31 downto 0);
		start_addr: out STD_LOGIC_VECTOR (31 downto 0);
		start_command: out STD_LOGIC);
end ram_memory_test;

architecture ram_memory_test_arch of ram_memory_test is

-- diagram signals declarations
signal delay_counter: STD_LOGIC_VECTOR (7 downto 0);
signal delay_counter_Sreg0: INTEGER range 0 to 4;
signal received_data_sig: STD_LOGIC_VECTOR (63 downto 0);
signal size_counter: STD_LOGIC_VECTOR (7 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    write_data_a, write_data_b, D1_DS1, initiate, wait_on_dv, read_data1, S1, S2, S3, good_job, start, started, wait_on_data
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin

-- concurrent signals assignments

-- Diagram ACTION
received_data <= received_data_sig;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (FLASH_CLK)
begin
	if FLASH_CLK'event and FLASH_CLK = '0' then
		if reset_in = '1' then
			Sreg0 <= start;
			-- Set default values for outputs, signals and variables
			-- ...
			received_data_sig <= (others => '0');
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when write_data_a =>
					Sreg0 <= write_data_b;
				when write_data_b =>
					if unsigned(size_counter) = 0 then
						Sreg0 <= S3;
					else
						Sreg0 <= write_data_a;
						size_counter <= size_counter -1;
					end if;
				when initiate =>
					Sreg0 <= wait_on_dv;
				when wait_on_dv =>
					if dv = '1' then
						Sreg0 <= read_data1;
						received_data_sig <= received_data_sig(59 downto 0) & data_out;
					end if;
				when read_data1 =>
					if dv = '1' then
						Sreg0 <= read_data1;
						received_data_sig <= received_data_sig(59 downto 0) & data_out;
					elsif dv = '0' then
						Sreg0 <= good_job;
					end if;
				when S1 =>
					Sreg0 <= S2;
				when S2 =>
					Sreg0 <= started;
					size_counter <= x"04";
				when S3 =>
					if ready = '1' then
						Sreg0 <= D1_DS1;
						delay_counter_Sreg0 <= 4 - 1;
					end if;
				when start =>
					if ready = '1' then
						Sreg0 <= S1;
					end if;
				when started =>
					Sreg0 <= wait_on_data;
				when wait_on_data =>
					if start_data = '1' then
						Sreg0 <= write_data_a;
					end if;
				when D1_DS1 =>
					if delay_counter_Sreg0 = 0 then
						Sreg0 <= initiate;
						size_counter <= x"04";
					else
						Sreg0 <= D1_DS1;
						if delay_counter_Sreg0 /= 0 then delay_counter_Sreg0 <= delay_counter_Sreg0 - 1;
						end if;
					end if;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

-- signal assignment statements for combinatorial outputs
data_in_assignment:
data_in <= size_counter(3 downto 0) +6 when (Sreg0 = write_data_a) else
           size_counter(3 downto 0) + 4 when (Sreg0 = write_data_b and  not (unsigned(size_counter) = 0)) else
           size_counter(3 downto 0) + 4 when (Sreg0 = wait_on_data and start_data = '1') else
           size_counter(3 downto 0) + 4;

start_command_assignment:
start_command <= '0' when (Sreg0 = initiate) else
                 '1' when (Sreg0 = S2) else
                 '0' when (Sreg0 = started) else
                 '1' when (Sreg0 = D1_DS1 and delay_counter_Sreg0 = 0) else
                 '1';

start_addr_assignment:
start_addr <= x"CCCCCCCC" when (Sreg0 = S2) else
              x"33333333" when (Sreg0 = D1_DS1 and delay_counter_Sreg0 = 0) else
              x"33333333";

size_assignment:
size <= x"00000004" when (Sreg0 = S2) else
        x"00000004" when (Sreg0 = D1_DS1 and delay_counter_Sreg0 = 0) else
        x"00000004";

mode_assignment:
mode <= "00000001" when (Sreg0 = S2) else
        "00000000" when (Sreg0 = D1_DS1 and delay_counter_Sreg0 = 0) else
        "00000000";

end ram_memory_test_arch;
