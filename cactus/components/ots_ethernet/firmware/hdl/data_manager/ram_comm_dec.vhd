-------------------------------------------------------------------------------
--
-- Title       : RAM_COMM_DEC
-- Design      : ethernet_controller
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : D:\Projects\otsdaq\OtS Ethernet MAC firmware\ActiveHDL_proj\ethernet_controller\compile\ram_comm_dec.vhd
-- Generated   : 12/13/15 13:03:32
-- From        : D:/Projects/otsdaq/OtS Ethernet MAC firmware/ActiveHDL_proj/ethernet_controller/src/ram_comm_dec.asf
-- By          : FSM2VHDL ver. 5.0.7.2
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.params_package.all;

entity ram_comm_dec is 
	port (
		burst_done: in STD_LOGIC;
		clock: in STD_LOGIC;
		crc_err_flag: in STD_LOGIC;
		reset: in STD_LOGIC;
		rx_data_fifo_full: in STD_LOGIC;
		rx_data_fifo_rd_data: in STD_LOGIC_VECTOR (63 downto 0);
		rx_info_fifo_empty: in STD_LOGIC;
		rx_info_fifo_full: in STD_LOGIC;
		rx_info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		tx_info_fifo_full: in STD_LOGIC;
		user_ready: in STD_LOGIC;
		user_rx_valid_out: in STD_LOGIC;
		burst_start: out STD_LOGIC;
		burst_stop: out STD_LOGIC;
		clear_crc_err_flag: out STD_LOGIC;
		ram_addr: out STD_LOGIC_VECTOR (63 downto 0);
		ram_rden: out STD_LOGIC;
		ram_wdata: out STD_LOGIC_VECTOR (63 downto 0);
		ram_wren: out STD_LOGIC;
		rx_data_fifo_rden: out STD_LOGIC;
		Rx_FIFO_Reset: out STD_LOGIC;
		rx_info_fifo_rden: out STD_LOGIC;
		tx_data_fifo_src_sel: out STD_LOGIC;
		tx_data_fifo_wren: out STD_LOGIC;
		Tx_FIFO_Reset: out STD_LOGIC;
		tx_info_fifo_src_sel: out STD_LOGIC;
		tx_info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		tx_info_fifo_wren: out STD_LOGIC);
end ram_comm_dec;

architecture arch of ram_comm_dec is

-- diagram signals declarations
signal burst_active: STD_LOGIC;
signal burst_complete_flag: STD_LOGIC;
signal comm_dec_ready: STD_LOGIC;
signal comm_reg: UNSIGNED (1 downto 0);
signal crc_err: STD_LOGIC;
signal first_write_qword: STD_LOGIC;
signal mem_loc_count_reg: UNSIGNED (7 downto 0);
signal no_addrs_incr: STD_LOGIC;
signal q_w_count_reg: UNSIGNED (7 downto 0);
signal ram_addr_sig: UNSIGNED (63 downto 0);
signal ram_rden_sig: STD_LOGIC;
signal ram_wren_sig: STD_LOGIC;
signal rx_data_fifo_full_flag: STD_LOGIC;
signal rx_data_fifo_rden_sig: STD_LOGIC;
signal rx_info_fifo_full_flag: STD_LOGIC;
signal rx_protocol_err_flag: STD_LOGIC;
signal user_ready_mask: STD_LOGIC;

-- BINARY ENCODED state machine: Sreg0
attribute ENUM_ENCODING: string;
type Sreg0_type is (
    write_com_S8, read_com_S13, read_com_S14, read_com_S15, read_com_S1, read_com_S18, burst_strt_S30, burst_strt_S31, burst_strt_S33,
    burst_strt_S34, burst_stp_S36, burst_stp_S37, burst_stp_S38, burst_stp_S39, write_com_S42, write_com_S40, write_com_S9, pro_comm,
    dec_comm, idle, return_st, get_comm, err_dec, brst_wait
);
attribute ENUM_ENCODING of Sreg0_type: type is
	"00000 " &		-- write_com_S8
	"00001 " &		-- read_com_S13
	"00010 " &		-- read_com_S14
	"00011 " &		-- read_com_S15
	"00100 " &		-- read_com_S1
	"00101 " &		-- read_com_S18
	"00110 " &		-- burst_strt_S30
	"00111 " &		-- burst_strt_S31
	"01000 " &		-- burst_strt_S33
	"01001 " &		-- burst_strt_S34
	"01010 " &		-- burst_stp_S36
	"01011 " &		-- burst_stp_S37
	"01100 " &		-- burst_stp_S38
	"01101 " &		-- burst_stp_S39
	"10111 " &		-- write_com_S42
	"10101 " &		-- write_com_S40
	"10110 " &		-- write_com_S9
	"01110 " &		-- pro_comm
	"01111 " &		-- dec_comm
	"10000 " &		-- idle
	"10001 " &		-- return_st
	"10010 " &		-- get_comm
	"10011 " &		-- err_dec
	"10100" ;		-- brst_wait

signal Sreg0: Sreg0_type;

attribute STATE_VECTOR: string;
attribute STATE_VECTOR of arch: architecture is "Sreg0";

begin

-- concurrent signals assignments

-- Diagram ACTION
ram_rden <= ram_rden_sig;
ram_wren <= ram_wren_sig;
rx_data_fifo_rden <= rx_data_fifo_rden_sig or (user_ready and user_ready_mask);
---- handle generating ready sig once a sufficient
---- time has passed since last received packet
---- to gaurantee crc err has been considered
----
---- also, handle generating rx fifo full flags
flag_handling_gen : for i in 0 to 0 generate
	signal tmp_cnt : unsigned(4 downto 0) := (others => '1');
	signal old_rx_v : std_logic;
	signal is_counting : std_logic := '0';
begin
	process(clock)
	begin
		if (rising_edge(clock)) then
			old_rx_v <= user_rx_valid_out;
			if (reset = '1') then
				tmp_cnt <= (others => '1');
				comm_dec_ready <= '1';
				rx_info_fifo_full_flag <= '0';
				rx_data_fifo_full_flag <= '0';
			else
				if (old_rx_v = '0' and user_rx_valid_out = '1') then
-- reset signal at start of receiving a packet
					comm_dec_ready <= '0';
					is_counting <= '0';
					tmp_cnt <= (others => '1');
				end if;
				if (old_rx_v = '1' and user_rx_valid_out = '0') then
					is_counting <= '1';
					-- start counting after packet rcv'd
				end if;
				if (tmp_cnt = 0) then	-- dont waiting for crc, let's go!
					comm_dec_ready <= '1';
				elsif (is_counting = '1') then	-- count down waiting for crc
					tmp_cnt <= tmp_cnt - 1;
				end if;
				if (rx_info_fifo_full = '1') then
					rx_info_fifo_full_flag <= '1';
					--hold full flag until reset!
				end if;
				if (rx_data_fifo_full = '1') then
					rx_data_fifo_full_flag <= '1';
					--hold full flag until reset!
				end if;
			end if;
		end if;
	end process;
end generate;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock)
begin
	if clock'event and clock = '1' then
		if reset = '1' then
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			tx_info_fifo_wren <= '0';
			Rx_FIFO_Reset <= '0';
			Tx_FIFO_Reset <= '0';
			clear_crc_err_flag <= '0';
-- Initialize registers
			comm_reg <= (others => '0');
			q_w_count_reg <= (others => '0');
			mem_loc_count_reg <= (others => '0');
			burst_active <= '0';
			crc_err <= '0';
			rx_protocol_err_flag <= '0';
			--indicates err in packets received (sz 0 read/write?!)
-- Initialize outputs
			tx_info_fifo_wr_data <= (others => '0');
			tx_info_fifo_wren <= '0';
			tx_data_fifo_wren <= '0';
-- mux controls
			tx_data_fifo_src_sel <= '0';
			tx_info_fifo_src_sel <= '0';
-- ram controls
			ram_wdata <= (others => '0');
			ram_addr_sig <= (others => '0');
			ram_wren_sig <= '0';
			ram_rden_sig <= '0';
			burst_start <= '0';
			burst_stop <= '0';
			rx_info_fifo_rden <= '0';
			rx_data_fifo_rden_sig <= '0';
			Rx_FIFO_Reset <= '1';
			-- Reset FIFOs
			Tx_FIFO_Reset <= '1';
			burst_complete_flag <= '0';
			no_addrs_incr <= '0';
			first_write_qword <= '0';
			user_ready_mask <= '0';
		else
			-- Set default values for outputs, signals and variables
			tx_info_fifo_wren <= '0';
			Rx_FIFO_Reset <= '0';
			Tx_FIFO_Reset <= '0';
			clear_crc_err_flag <= '0';
			case Sreg0 is
				when pro_comm =>
					Sreg0 <= err_dec;
					comm_reg <= unsigned(rx_info_fifo_rd_data(1 downto 0));
					-- Get the command code from
					-- the receive info fifo word
					q_w_count_reg <= unsigned(rx_info_fifo_rd_data(15 downto 8));
					-- get the number of 8 byte quad words from
					-- the info fifo word
					crc_err <= crc_err_flag;
					--rx_info_fifo_rd_data(7);
					-- get the crc error indicator
					no_addrs_incr <= rx_info_fifo_rd_data(3);
					-- get the no addr increment flag
					mem_loc_count_reg <= unsigned(rx_info_fifo_rd_data(15 downto 8));
					-- burst stop occurred previously.. now this is the next command
					-- so clear tx_fifo to start in reasonable place
					if (burst_complete_flag = '1') then
					  Tx_FIFO_Reset <= '1';
					end if;
					-- definition of bits written to tx_info_fifo
					-- bits 15-8: quad word count (read data)
					-- bit 7: crc err since last reset
					-- bit 6: crc err detected in received packet
					-- bit 5: rx fifo overflow since last reset
					-- bit 4: err detected in protocol since last reset
					-- bits 3-0: op code
					-- (bit 3 is no address increment, bit 2 is ack, 1:0 is command)
					tx_info_fifo_wr_data(7) <= rx_info_fifo_rd_data(7);
					tx_info_fifo_wr_data(6) <= crc_err_flag;
					tx_info_fifo_wr_data(5) <= rx_data_fifo_full_flag or rx_info_fifo_full_flag;
					tx_info_fifo_wr_data(4) <= rx_protocol_err_flag;
					if (rx_info_fifo_rd_data(2) = '1' or crc_err_flag = '1') then --ACK
					-- handle ACK info (no data for ACK)
						tx_info_fifo_wr_data(15 downto 8) <= (others => '0');
						tx_info_fifo_wr_data(3 downto 0) <= rx_info_fifo_rd_data(3 downto 0);
						tx_info_fifo_wren <= '1';
						-- write to tx info fifo
					end if;
				when dec_comm =>
					if comm_reg = 3 then
						Sreg0 <= burst_stp_S38;
						burst_stop <= '1';
					elsif comm_reg(1 downto 0) = 2 and burst_active = '0' then
						Sreg0 <= burst_strt_S33;
						burst_active <= '1';
						burst_start <= '1';
						-- Point FIFO muxes towards
						-- burst controller
						tx_data_fifo_src_sel <= '1';
						tx_info_fifo_src_sel <= '1';
					elsif comm_reg(1 downto 0) = 0 and burst_active = '0' then
						Sreg0 <= read_com_S1;
					elsif comm_reg(1 downto 0) = 1 then
						Sreg0 <= write_com_S8;
						rx_data_fifo_rden_sig <= '1';
						-- read address qword
					else
						Sreg0 <= return_st;
						Rx_FIFO_Reset <= '1';
					end if;
				when idle =>
					if burst_done = '1' and
						burst_active = '1' then
						Sreg0 <= brst_wait;
					elsif comm_dec_ready = '1' and rx_info_fifo_empty = '0' then
						Sreg0 <= get_comm;
						rx_info_fifo_rden <= '1';
					end if;
				when return_st =>
					Sreg0 <= idle;
				when get_comm =>
					Sreg0 <= pro_comm;
					rx_info_fifo_rden <= '0';
				when err_dec =>
					if crc_err = '1' then
						Sreg0 <= return_st;
						burst_complete_flag <= '0';
						Rx_FIFO_Reset <= '1';
						clear_crc_err_flag <= '1';
					else
						Sreg0 <= dec_comm;
						burst_complete_flag <= '0';
					end if;
				when brst_wait =>
					if burst_done = '1' then
						Sreg0 <= return_st;
						burst_active <= '0';
						burst_stop <= '0';
						-- Point FIFO muxes away from
						-- burst controller
						tx_data_fifo_src_sel <= '0';
						tx_info_fifo_src_sel <= '0';
						--force the next comm_dec operation to clear tx fifo
						burst_complete_flag <= '1';
					end if;
				when burst_stp_S36 =>
					Sreg0 <= burst_stp_S37;
					rx_data_fifo_rden_sig <= '0';
				when burst_stp_S37 =>
					Sreg0 <= burst_stp_S39;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					-- obtain starting address
				when burst_stp_S38 =>
					Sreg0 <= burst_stp_S36;
					-- there is at least one quad word in the data fifo
					-- because of the address quadword
					rx_data_fifo_rden_sig <= '1';
				when burst_stp_S39 =>
					Sreg0 <= brst_wait;
				when read_com_S13 =>
					if (mem_loc_count_reg = 1 and user_ready = '1') then
						ram_rden_sig <= '0';
						--done
					else
						ram_rden_sig <= '1';
						-- Enable the RAM
					end if;
					if (user_ready = '1') then  -- only if user is ready take next data
						if (no_addrs_incr = '0' and mem_loc_count_reg /= 1 ) then
							ram_addr_sig <= ram_addr_sig + 1;
						end if;
						mem_loc_count_reg <= mem_loc_count_reg - 1;
					end if;
					-- write data into fifo 1 clock later if user's data is ready
					tx_data_fifo_wren <= user_ready and ram_rden_sig;
					if mem_loc_count_reg = 1 and user_ready = '1' then	-- done with read
						Sreg0 <= read_com_S15;
						tx_info_fifo_wr_data(15 downto 8) <= std_logic_vector(q_w_count_reg);
						tx_info_fifo_wr_data(2 downto 0) <= (others => '0');
						tx_info_fifo_wren <= '1';
						-- definition of bits written to tx_info_fifo
						-- bits 15-8: quad word count (read data)
						-- bit 7: crc err detected in received packet
						-- bit 6: rx info fifo has been full since last reset
						-- bit 5: rx data fifo has been full since last reset
						-- bit 4: err detected in protocol since last reset
						-- bits 3-0: op code
						-- (bit 3 is no address increment, bit 2 is ack, 1:0 is command)
					end if;
				when read_com_S14 =>
					Sreg0 <= read_com_S18;
					rx_data_fifo_rden_sig <= '0';
				when read_com_S15 =>
					Sreg0 <= return_st;
					tx_data_fifo_wren <= '0';
				when read_com_S1 =>
					if q_w_count_reg = 0 then	-- err? there is no starting address
						Sreg0 <= read_com_S15;
						rx_protocol_err_flag <= '1';
						--err in protocol!
						Rx_FIFO_Reset <= '1';
						tx_info_fifo_wr_data(15 downto 8) <= std_logic_vector(q_w_count_reg);
						tx_info_fifo_wr_data(2 downto 0) <= (others => '0');
						tx_info_fifo_wren <= '1';
						-- definition of bits written to tx_info_fifo
						-- bits 15-8: quad word count (read data)
						-- bit 7: crc err detected in received packet
						-- bit 6: rx info fifo has been full since last reset
						-- bit 5: rx data fifo has been full since last reset
						-- bit 4: err detected in protocol since last reset
						-- bits 3-0: op code
						-- (bit 3 is no address increment, bit 2 is ack, 1:0 is command)
					else
						Sreg0 <= read_com_S14;
						-- there is at least one quad word in the data fifo
						rx_data_fifo_rden_sig <= '1';
					end if;
				when read_com_S18 =>
					Sreg0 <= read_com_S13;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					-- obtain starting address
					ram_rden_sig <= '1';
					-- enable ram read
				when burst_strt_S30 =>
					Sreg0 <= burst_strt_S34;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					-- obtain starting address
				when burst_strt_S31 =>
					Sreg0 <= burst_strt_S30;
					rx_data_fifo_rden_sig <= '0';
				when burst_strt_S33 =>
					Sreg0 <= burst_strt_S31;
					-- there is at least one quad word in the data fifo
					-- because of the address quadword
					rx_data_fifo_rden_sig <= '1';
				when burst_strt_S34 =>
					Sreg0 <= return_st;
					burst_start <= '0';
				when write_com_S8 =>
					if q_w_count_reg = 0 then	-- err? there is no starting address
						Sreg0 <= return_st;
						rx_protocol_err_flag <= '1';
						--err in protocol!
						Rx_FIFO_Reset <= '1';
						-- Turn off read accesses of the
						rx_data_fifo_rden_sig <= '0';
					else
						Sreg0 <= write_com_S40;
						first_write_qword <= '1';
						rx_data_fifo_rden_sig <= '1';
						--read first data qword
					end if;
				when write_com_S42 =>
					if user_ready = '1' then
						Sreg0 <= return_st;
						ram_wren_sig <= '0';
						--done with write
					end if;
				when write_com_S40 =>
					Sreg0 <= write_com_S9;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					--set base address
					if (mem_loc_count_reg = 1) then
					-- Turn off read accesses (done)
						rx_data_fifo_rden_sig <= '0';
					else
						user_ready_mask <= '1';
						-- allow user_ready to control rden of fifo
					end if;
					mem_loc_count_reg <= mem_loc_count_reg - 1;
				when write_com_S9 =>
					ram_wren_sig <= '1';
					-- flag for writing
					if (first_write_qword = '1') then
						first_write_qword <= '0';
					end if;
					if (first_write_qword = '1' or user_ready = '1') then
						ram_wdata <= rx_data_fifo_rd_data;
						--output next write data
					end if;
					rx_data_fifo_rden_sig <= '0';
					--let user ready control rden strobe
					if (mem_loc_count_reg = 1 and user_ready = '1') then
					-- Turn off read accesses (done)
						user_ready_mask <= '0';
						-- disallow user_ready to control rden of fifo
					--else
					-- read data out of fifo 1 clock later if user is ready
					--rx_data_fifo_rden_sig <= user_ready;
					-- data is assumed ready on next clock (1 clock fifo read)
					end if;
					--handle write address
					if (user_ready = '1' and no_addrs_incr = '0' and first_write_qword = '0') then
						ram_addr_sig <= ram_addr_sig + 1;
					end if;
					--handle tracking number of words left in fifo
					if (user_ready = '1' or first_write_qword = '1') then
						mem_loc_count_reg <= mem_loc_count_reg - 1;
					end if;
					if mem_loc_count_reg = 0 then
						Sreg0 <= write_com_S42;
						user_ready_mask <= '0';
						-- disallow user_ready to control rden of fifo
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
ram_addr_assignment:
ram_addr <= std_logic_vector(ram_addr_sig) when (Sreg0 = idle) else
            std_logic_vector(ram_addr_sig);

end arch;
