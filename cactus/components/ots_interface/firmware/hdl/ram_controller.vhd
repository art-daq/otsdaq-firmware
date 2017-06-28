-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ots_interface
-- Author      : Ethan Lewis
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- File        : D:\elewis\ots_interface\ots_interface\ots_interface\compile\ram_controller.vhd
-- Generated   : 05/16/17 11:30:11
-- From        : D:/elewis/ots_interface/ots_interface/ots_interface/src/ram_controller.asf
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
library unisim; -- for xilinx IOBUF
use unisim.vcomponents.all;
entity ram_controller is 
	port (
		data_in: in STD_LOGIC_VECTOR (3 downto 0);
		FLASH_CLK: in STD_LOGIC;
		mode: in STD_LOGIC_VECTOR (7 downto 0);
		reset_in: in STD_LOGIC;
		size: in STD_LOGIC_VECTOR (31 downto 0);
		start_addr: in STD_LOGIC_VECTOR (0 to 31);
		start_command: in STD_LOGIC;
		write_fifo_prog_empty: in STD_LOGIC;
		chip_select: out STD_LOGIC;
		data_in_ready: out STD_LOGIC;
		data_out: out STD_LOGIC_VECTOR (3 downto 0);
		device_id: out STD_LOGIC_VECTOR (31 downto 0);
		dv: out STD_LOGIC;
		error: out STD_LOGIC;
		next_page: out STD_LOGIC;
		ready: out STD_LOGIC;
		reset: out STD_LOGIC;
		SCLK: out STD_LOGIC;
		io_0: inout STD_LOGIC;
		io_1: inout STD_LOGIC;
		io_2: inout STD_LOGIC;
		io_3: inout STD_LOGIC);
end ram_controller;

architecture ram_controller_arch of ram_controller is

-- diagram signals declarations
signal addr_countdown: STD_LOGIC_VECTOR (4 downto 0);
signal addr_sig: STD_LOGIC_VECTOR (0 to 31);
signal already_erased: STD_LOGIC;
signal already_wrote: STD_LOGIC;
signal check_counter: STD_LOGIC_VECTOR (20 downto 0);
signal chip_select_sig: STD_LOGIC;
signal data_countdown: STD_LOGIC_VECTOR (31 downto 0);
signal data_in_ready_sig: STD_LOGIC;
signal device_id_sig: STD_LOGIC_VECTOR (31 downto 0);
signal dv_sig: STD_LOGIC;
signal error_sig: STD_LOGIC;
signal id_countdown: STD_LOGIC_VECTOR (4 downto 0);
signal inner_data_countdown: STD_LOGIC_VECTOR (7 downto 0);
signal io_in: STD_LOGIC_VECTOR (3 downto 0);
signal io_out: STD_LOGIC_VECTOR (3 downto 0);
signal ready_sig: STD_LOGIC;
signal receiving_from_ram: STD_LOGIC;
signal reset_sig: STD_LOGIC;
signal start_data_sig: STD_LOGIC;
signal write_in_progress_sig: STD_LOGIC;

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    configure_WREN0, configure_WREN1, configure_WREN2, configure_WREN3, configure_WREN4, configure_WREN5, configure_WREN6, configure_WREN7,
    configure_delay, configure_delay1, configure_delay2, configure_config0, configure_config1, configure_config2, configure_config3,
    configure_config4, configure_config5, configure_config6, configure_config7, configure_SRR1, configure_SRR2, configure_SRR3, configure_SRR4,
    configure_SRR5, configure_SRR6, configure_SRR7, configure_SRR0, configure_status0, configure_status1, configure_status2, configure_status3,
    configure_status4, configure_status5, configure_status6, configure_status7, send_command_Write_last_addr, send_command_Write_data_loop1,
    send_command_Write_data_loop, send_command_Write_delay, send_command_Write_scnd_last, send_command_Write_instr_w4, send_command_Write_instr_w3,
    send_command_Write_instr_w2, send_command_Write_instr_w1, send_command_Write_instr_w0, send_command_Write_instr_w7, send_command_Write_instr_w6,
    send_command_Write_instr_w5, send_command_check_instr8, send_command_check_instr13, send_command_check_instr12, send_command_check_instr11,
    send_command_check_instr10, send_command_check_instr9, send_command_check_P_ERR1, send_command_check_E_ERR1, send_command_check_BP5,
    send_command_check_BP4, send_command_check_BP3, send_command_check_WEL1, send_command_check_inst3, send_command_check_instr14,
    send_command_check_SRWD1, send_command_check_WIP1, send_command_auto_increment, send_command_read_id_id8, send_command_read_id_id9,
    send_command_read_id_id10, send_command_read_id_id11, send_command_read_id_id12, send_command_read_id_id13, send_command_read_id_id14,
    send_command_read_id_id15, send_command_read_id_id_delay3, send_command_read_id_read_id1, send_command_read_id_id_delay4, send_command_read_id_id_delay5,
    send_command_Erase_delay_e, send_command_delay, send_command_delay5, send_command_delay6, send_command_delay7, send_command_write_enable_WREN8,
    send_command_write_enable_WREN9, send_command_write_enable_WREN10, send_command_write_enable_WREN11, send_command_write_enable_WREN12,
    send_command_write_enable_WREN13, send_command_write_enable_WREN14, send_command_write_enable_delay3, send_command_write_enable_WREN15,
    send_command_delay4, send_command_Read_instr_r0, send_command_Read_instr_r1, send_command_Read_instr_r2, send_command_Read_instr_r3,
    send_command_Read_instr_r4, send_command_Read_instr_r5, send_command_Read_instr_r6, send_command_Read_instr_r7, send_command_Read_last_addr_bit,
    send_command_Read_read_four, send_command_Read_read_four1, send_command_Read_delay_r, send_command_Erase_instr_e0, send_command_Erase_instr_e1,
    send_command_Erase_instr_e2, send_command_Erase_instr_e3, send_command_Erase_instr_e4, send_command_Erase_instr_e5, send_command_Erase_instr_e6,
    send_command_Erase_instr_e7, send_command_Erase_last_bit, idle, first
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;



attribute mark_debug : string;
attribute mark_debug of chip_select_sig : signal is "true"; 
attribute mark_debug of io_out : signal is "true"; 
attribute mark_debug of io_in : signal is "true"; 
attribute mark_debug of receiving_from_ram : signal is "true"; 
attribute mark_debug of inner_data_countdown : signal is "true"; 
begin

-- concurrent signals assignments

-- Diagram ACTION
IOBUF_Inst0 : IOBUF
      port map (
         O     => io_in(0),              -- data from bidir bus
         IO    => io_0,              -- data on bidir bus
         I     => io_out(0),             -- data to bidir bus
         T     => receiving_from_ram);
         -- 3-state enable input, high=input, low=output
IOBUF_Inst1 : IOBUF
      port map (
         O     => io_in(1),              -- data from bidir bus
         IO    => io_1,              -- data on bidir bus
         I     => io_out(1),             -- data to bidir bus
         T     => receiving_from_ram);
         -- 3-state enable input, high=input, low=output
IOBUF_Inst2 : IOBUF
      port map (
         O     => io_in(2),              -- data from bidir bus
         IO    => io_2,              -- data on bidir bus
         I     => io_out(2),             -- data to bidir bus
         T     => receiving_from_ram);
         -- 3-state enable input, high=input, low=output
IOBUF_Inst3 : IOBUF
      port map (
         O     => io_in(3),              -- data from bidir bus
         IO    => io_3,              -- data on bidir bus
         I     => io_out(3),             -- data to bidir bus
         T     => receiving_from_ram);
         -- 3-state enable input, high=input, low=output
chip_select <= chip_select_sig;
reset <= reset_sig;
device_id <= device_id_sig;
ready <= ready_sig;
data_in_ready <= data_in_ready_sig;
dv <= dv_sig;
error <= error_sig;
SCLK <= FLASH_CLK;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (FLASH_CLK)
begin
	if FLASH_CLK'event and FLASH_CLK = '0' then
		if reset_in='1' then
			Sreg0 <= first;
			-- Set default values for outputs, signals and variables
			-- ...
			receiving_from_ram <= '0';
			io_out <= (others => '0');
			reset_sig <= '0';
			chip_select_sig <= '1';
			start_data_sig <= '0';
			dv_sig <= '0';
			already_wrote <= '0';
			already_erased <= '0';
			error_sig <= '0';
			ready_sig <= '0';
			addr_countdown <= (others => '0');
			data_countdown <= (others => '0');
			device_id_sig <= (others => '0');
			id_countdown <= (others => '0');
			addr_sig <= (others => '0');
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when idle =>
					data_in_ready_sig <= '0';
					dv_sig <= '0';
					receiving_from_ram <= '0';
					already_erased <= '0';
					already_wrote <= '0';
					error_sig <= '0';
					ready_sig <= '1';
					if start_command = '1' then
						Sreg0 <= send_command_delay4;
						ready_sig <= '0';
						addr_sig <= start_addr;
					end if;
				when first =>
					Sreg0 <= configure_WREN0;
					reset_sig <= '1';
					chip_select_sig <= '0';
					io_out <= "1100";
					--WP# and HOLD# need to be high (they are active low)
				when send_command_auto_increment =>
					if unsigned(data_countdown(31 downto 8)) = 0 then
						inner_data_countdown <= data_countdown(7 downto 0);
					else
						inner_data_countdown <= (others => '1');
					end if;
					if mode(2) = '0' and (mode(0) = '1' or mode(1) = '1') then
						Sreg0 <= send_command_write_enable_WREN15;
						if ( unsigned(addr_sig(16 to 31)) = 0) then
							already_erased <= '0';
							already_wrote <= '0';
						end if;
						chip_select_sig <= '0';
						io_out(0) <= '0';
					elsif mode(2 downto 0) = "000" then
						Sreg0 <= send_command_Read_instr_r0;
						chip_select_sig <= '0';
						io_out(0) <= '0';
					end if;
				when send_command_delay =>
					Sreg0 <= send_command_delay5;
				when send_command_delay5 =>
					Sreg0 <= send_command_delay6;
				when send_command_delay6 =>
					Sreg0 <= send_command_delay7;
				when send_command_delay7 =>
					Sreg0 <= send_command_write_enable_WREN15;
					chip_select_sig <= '0';
					io_out(0) <= '0';
				when send_command_delay4 =>
					if mode(2 downto 0) = "100" then
						Sreg0 <= send_command_read_id_id8;
						chip_select_sig <= '0';
						io_out(0) <= '1';
						--data
						id_countdown <= (others => '0');
					elsif unsigned(size) = 0 then
						Sreg0 <= idle;
					else
						Sreg0 <= send_command_auto_increment;
						data_countdown <= size - 1;
					end if;
				when send_command_Read_instr_r0 =>
					Sreg0 <= send_command_Read_instr_r1;
					io_out(0) <= '1';
				when send_command_Read_instr_r1 =>
					Sreg0 <= send_command_Read_instr_r2;
				when send_command_Read_instr_r2 =>
					Sreg0 <= send_command_Read_instr_r3;
					io_out(0) <= '0';
				when send_command_Read_instr_r3 =>
					Sreg0 <= send_command_Read_instr_r4;
					io_out(0) <= '1';
				when send_command_Read_instr_r4 =>
					Sreg0 <= send_command_Read_instr_r5;
				when send_command_Read_instr_r5 =>
					Sreg0 <= send_command_Read_instr_r6;
					io_out(0) <= '0';
				when send_command_Read_instr_r6 =>
					Sreg0 <= send_command_Read_instr_r7;
					addr_countdown <= (others => '0');
				when send_command_Read_instr_r7 =>
					addr_countdown <= addr_countdown +1;
					io_out(0) <= addr_sig(conv_integer(addr_countdown));
					if unsigned(addr_countdown) = 31 then
						Sreg0 <= send_command_Read_last_addr_bit;
						io_out(0) <= addr_sig(31);
					end if;
				when send_command_Read_last_addr_bit =>
					Sreg0 <= send_command_Read_read_four;
					receiving_from_ram <= '1';
					dv_sig <= '1';
				when send_command_Read_read_four =>
					Sreg0 <= send_command_Read_read_four1;
				when send_command_Read_read_four1 =>
					if unsigned(inner_data_countdown) = 0 then
						Sreg0 <= send_command_Read_delay_r;
						dv_sig <= '0';
						chip_select_sig <= '1';
						receiving_from_ram <= '0';
					else
						Sreg0 <= send_command_Read_read_four;
						inner_data_countdown <= inner_data_countdown -1;
					end if;
				when send_command_Read_delay_r =>
					if (unsigned(data_countdown(31 downto 8)) = 0) and (error_sig = '1') then
						Sreg0 <= idle;
					elsif unsigned(data_countdown(31 downto 8)) = 0 then
						Sreg0 <= idle;
					else
						Sreg0 <= send_command_auto_increment;
						data_countdown <= data_countdown - 256;
						addr_sig <= addr_sig + 256;
					end if;
				when send_command_Erase_delay_e =>
					Sreg0 <= send_command_check_instr9;
					already_erased <= '1';
					chip_select_sig <= '0';
					receiving_from_ram <= '0';
					io_out(0) <= '0';
					check_counter <= (others => '0');
				when send_command_Erase_instr_e0 =>
					Sreg0 <= send_command_Erase_instr_e1;
				when send_command_Erase_instr_e1 =>
					Sreg0 <= send_command_Erase_instr_e2;
					io_out(0) <= '0';
				when send_command_Erase_instr_e2 =>
					Sreg0 <= send_command_Erase_instr_e3;
					io_out(0) <= '1';
				when send_command_Erase_instr_e3 =>
					Sreg0 <= send_command_Erase_instr_e4;
				when send_command_Erase_instr_e4 =>
					Sreg0 <= send_command_Erase_instr_e5;
				when send_command_Erase_instr_e5 =>
					Sreg0 <= send_command_Erase_instr_e6;
					io_out(0) <= '0';
				when send_command_Erase_instr_e6 =>
					Sreg0 <= send_command_Erase_instr_e7;
					addr_countdown <= (others => '0');
				when send_command_Erase_instr_e7 =>
					addr_countdown <= addr_countdown +1;
					io_out(0) <= addr_sig(conv_integer(addr_countdown));
					if unsigned(addr_countdown) = 31 then
						Sreg0 <= send_command_Erase_last_bit;
						io_out(0) <= addr_sig(31);
					end if;
				when send_command_Erase_last_bit =>
					Sreg0 <= send_command_Erase_delay_e;
					chip_select_sig <= '1';
				when send_command_check_instr8 =>
					Sreg0 <= send_command_check_inst3;
				when send_command_check_instr13 =>
					Sreg0 <= send_command_check_instr12;
					io_out(0) <= '1';
				when send_command_check_instr12 =>
					Sreg0 <= send_command_check_instr11;
					io_out(0) <= '0';
				when send_command_check_instr11 =>
					Sreg0 <= send_command_check_instr10;
					io_out(0) <= '1';
				when send_command_check_instr10 =>
					Sreg0 <= send_command_check_SRWD1;
					receiving_from_ram <= '1';
					check_counter <= check_counter +1;
				when send_command_check_instr9 =>
					Sreg0 <= send_command_check_instr8;
				when send_command_check_P_ERR1 =>
					Sreg0 <= send_command_check_E_ERR1;
					error_sig <= io_in(1) or error_sig;
					--will keep it high if was high before
				when send_command_check_E_ERR1 =>
					Sreg0 <= send_command_check_BP5;
					error_sig <= io_in(1) or error_sig;
					--will keep it high if was high before
				when send_command_check_BP5 =>
					Sreg0 <= send_command_check_BP4;
				when send_command_check_BP4 =>
					Sreg0 <= send_command_check_BP3;
				when send_command_check_BP3 =>
					Sreg0 <= send_command_check_WEL1;
				when send_command_check_WEL1 =>
					Sreg0 <= send_command_check_WIP1;
				when send_command_check_inst3 =>
					Sreg0 <= send_command_check_instr14;
				when send_command_check_instr14 =>
					Sreg0 <= send_command_check_instr13;
				when send_command_check_SRWD1 =>
					Sreg0 <= send_command_check_P_ERR1;
				when send_command_check_WIP1 =>
					if io_in(1)='1' then
						Sreg0 <= send_command_check_SRWD1;
						check_counter <= check_counter +1;
					elsif (io_in(1) = '0' or error_sig = '1') and (mode(1 downto 0)  = "11" and already_wrote = '0' and error_sig = '0') then
						Sreg0 <= send_command_delay;
						chip_select_sig <= '1';
						receiving_from_ram <= '0';
						already_erased <= '1';
					elsif ((io_in(1) = '0' or error_sig = '1') and (unsigned(data_countdown(31 downto 8)) = 0)) and (error_sig = '1') then
						Sreg0 <= idle;
						chip_select_sig <= '1';
						receiving_from_ram <= '0';
					elsif (io_in(1) = '0' or error_sig = '1') and (unsigned(data_countdown(31 downto 8)) = 0) then
						Sreg0 <= idle;
						chip_select_sig <= '1';
						receiving_from_ram <= '0';
					elsif io_in(1) = '0' or error_sig = '1' then
						Sreg0 <= send_command_auto_increment;
						chip_select_sig <= '1';
						receiving_from_ram <= '0';
						data_countdown <= data_countdown - 256;
						addr_sig <= addr_sig + 256;
					end if;
				when send_command_read_id_id8 =>
					Sreg0 <= send_command_read_id_id9;
					io_out(0) <= '0';
				when send_command_read_id_id9 =>
					Sreg0 <= send_command_read_id_id10;
				when send_command_read_id_id10 =>
					Sreg0 <= send_command_read_id_id11;
					io_out(0) <= '1';
				when send_command_read_id_id11 =>
					Sreg0 <= send_command_read_id_id12;
				when send_command_read_id_id12 =>
					Sreg0 <= send_command_read_id_id13;
				when send_command_read_id_id13 =>
					Sreg0 <= send_command_read_id_id14;
				when send_command_read_id_id14 =>
					Sreg0 <= send_command_read_id_id15;
				when send_command_read_id_id15 =>
					Sreg0 <= send_command_read_id_read_id1;
					receiving_from_ram <= '1';
				when send_command_read_id_id_delay3 =>
					Sreg0 <= send_command_read_id_id_delay4;
				when send_command_read_id_read_id1 =>
					if unsigned(id_countdown)=31 then
						Sreg0 <= send_command_read_id_id_delay3;
						chip_select_sig <= '1';
						receiving_from_ram <= '0';
					else
						Sreg0 <= send_command_read_id_read_id1;
						device_id_sig <= device_id_sig(30 downto 0) & io_in(1);
						id_countdown <= id_countdown +1;
					end if;
				when send_command_read_id_id_delay4 =>
					Sreg0 <= send_command_read_id_id_delay5;
				when send_command_read_id_id_delay5 =>
					if error_sig = '1' then
						Sreg0 <= idle;
					else
						Sreg0 <= idle;
					end if;
				when send_command_write_enable_WREN8 =>
					Sreg0 <= send_command_write_enable_WREN9;
				when send_command_write_enable_WREN9 =>
					Sreg0 <= send_command_write_enable_WREN10;
				when send_command_write_enable_WREN10 =>
					Sreg0 <= send_command_write_enable_WREN11;
				when send_command_write_enable_WREN11 =>
					Sreg0 <= send_command_write_enable_WREN12;
					io_out(0) <= '1';
				when send_command_write_enable_WREN12 =>
					Sreg0 <= send_command_write_enable_WREN13;
				when send_command_write_enable_WREN13 =>
					Sreg0 <= send_command_write_enable_WREN14;
					io_out(0) <= '0';
				when send_command_write_enable_WREN14 =>
					Sreg0 <= send_command_write_enable_delay3;
					chip_select_sig <= '1';
				when send_command_write_enable_delay3 =>
					if (mode(1 downto 0) = "01" or (mode(1 downto 0) = "11" and already_erased ='1' ))
						and (write_fifo_prog_empty = '0' or unsigned(data_countdown(31 downto 8)) = 0) then
						Sreg0 <= send_command_Write_instr_w0;
						chip_select_sig <= '0';
						io_out(0) <= '0';
					elsif mode(1 downto 0) ="10" or( mode(1 downto 0) = "11" and already_erased ='0') then
						Sreg0 <= send_command_Erase_instr_e0;
						chip_select_sig <= '0';
						io_out(0) <= '1';
					end if;
				when send_command_write_enable_WREN15 =>
					Sreg0 <= send_command_write_enable_WREN8;
				when send_command_Write_last_addr =>
					Sreg0 <= send_command_Write_data_loop;
					io_out <= data_in;
				when send_command_Write_data_loop1 =>
					if unsigned(inner_data_countdown) = 0 then
						Sreg0 <= send_command_Write_delay;
						chip_select_sig <= '1';
						data_in_ready_sig <= '0';
					else
						Sreg0 <= send_command_Write_data_loop;
						inner_data_countdown <= inner_data_countdown -1;
						if unsigned(inner_data_countdown) = 1 then
							data_in_ready_sig <= '0';
						end if;
						io_out <= data_in;
					end if;
				when send_command_Write_data_loop =>
					Sreg0 <= send_command_Write_data_loop1;
					io_out <= data_in;
				when send_command_Write_delay =>
					Sreg0 <= send_command_check_instr9;
					already_wrote <= '1';
					chip_select_sig <= '0';
					receiving_from_ram <= '0';
					io_out(0) <= '0';
					check_counter <= (others => '0');
				when send_command_Write_scnd_last =>
					Sreg0 <= send_command_Write_last_addr;
					io_out(0) <= addr_sig(31);
				when send_command_Write_instr_w4 =>
					Sreg0 <= send_command_Write_instr_w5;
					io_out(0) <= '1';
				when send_command_Write_instr_w3 =>
					Sreg0 <= send_command_Write_instr_w4;
					io_out(0) <= '0';
				when send_command_Write_instr_w2 =>
					Sreg0 <= send_command_Write_instr_w3;
				when send_command_Write_instr_w1 =>
					Sreg0 <= send_command_Write_instr_w2;
					io_out(0) <= '1';
				when send_command_Write_instr_w0 =>
					Sreg0 <= send_command_Write_instr_w1;
				when send_command_Write_instr_w7 =>
					addr_countdown <= addr_countdown +1;
					io_out(0) <= addr_sig(conv_integer(addr_countdown));
					if unsigned(addr_countdown) = 30 then
						Sreg0 <= send_command_Write_scnd_last;
						io_out(0) <= addr_sig(30);
						data_in_ready_sig <= '1';
					end if;
				when send_command_Write_instr_w6 =>
					Sreg0 <= send_command_Write_instr_w7;
					addr_countdown <= (others => '0');
				when send_command_Write_instr_w5 =>
					Sreg0 <= send_command_Write_instr_w6;
					io_out(0) <= '0';
				when configure_WREN0 =>
					Sreg0 <= configure_WREN1;
				when configure_WREN1 =>
					Sreg0 <= configure_WREN2;
				when configure_WREN2 =>
					Sreg0 <= configure_WREN3;
				when configure_WREN3 =>
					Sreg0 <= configure_WREN4;
				when configure_WREN4 =>
					Sreg0 <= configure_WREN5;
					io_out(0) <= '1';
				when configure_WREN5 =>
					Sreg0 <= configure_WREN6;
				when configure_WREN6 =>
					Sreg0 <= configure_WREN7;
					io_out(0) <= '0';
				when configure_WREN7 =>
					Sreg0 <= configure_delay;
					chip_select_sig <= '1';
				when configure_delay =>
					Sreg0 <= configure_delay1;
				when configure_delay1 =>
					Sreg0 <= configure_delay2;
				when configure_delay2 =>
					Sreg0 <= configure_SRR0;
					chip_select_sig <= '0';
					io_out(0) <= '0';
				when configure_config0 =>
					Sreg0 <= configure_config1;
				when configure_config1 =>
					Sreg0 <= configure_config2;
					io_out(0) <= '0';
				when configure_config2 =>
					Sreg0 <= configure_config3;
				when configure_config3 =>
					Sreg0 <= configure_config4;
				when configure_config4 =>
					Sreg0 <= configure_config5;
				when configure_config5 =>
					Sreg0 <= configure_config6;
					io_out(0) <= '1';
				when configure_config6 =>
					Sreg0 <= configure_config7;
					io_out(0) <= '0';
				when configure_config7 =>
					Sreg0 <= idle;
					chip_select_sig <= '1';
				when configure_SRR1 =>
					Sreg0 <= configure_SRR2;
				when configure_SRR2 =>
					Sreg0 <= configure_SRR3;
				when configure_SRR3 =>
					Sreg0 <= configure_SRR4;
				when configure_SRR4 =>
					Sreg0 <= configure_SRR5;
				when configure_SRR5 =>
					Sreg0 <= configure_SRR6;
				when configure_SRR6 =>
					Sreg0 <= configure_SRR7;
					io_out(0) <= '1';
				when configure_SRR7 =>
					Sreg0 <= configure_status0;
					io_out(0) <= '0';
				when configure_SRR0 =>
					Sreg0 <= configure_SRR1;
				when configure_status0 =>
					Sreg0 <= configure_status1;
				when configure_status1 =>
					Sreg0 <= configure_status2;
				when configure_status2 =>
					Sreg0 <= configure_status3;
				when configure_status3 =>
					Sreg0 <= configure_status4;
				when configure_status4 =>
					Sreg0 <= configure_status5;
				when configure_status5 =>
					Sreg0 <= configure_status6;
				when configure_status6 =>
					Sreg0 <= configure_status7;
				when configure_status7 =>
					Sreg0 <= configure_config0;
					io_out(0) <= '1';
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

-- signal assignment statements for combinatorial outputs
next_page_assignment:
next_page <= '0' when (Sreg0 = first) else
             '1' when (Sreg0 = send_command_Write_data_loop1 and unsigned(inner_data_countdown) = 0) else
             '0' when (Sreg0 = send_command_Write_delay) else
             '0';

data_out_assignment:
data_out <= io_in when (Sreg0 = send_command_Read_read_four) else
            io_in when (Sreg0 = send_command_Read_read_four1 and unsigned(inner_data_countdown) = 0) else
            io_in when (Sreg0 = send_command_Read_read_four1 and  not (unsigned(inner_data_countdown) = 0)) else
            io_in;

end ram_controller_arch;
