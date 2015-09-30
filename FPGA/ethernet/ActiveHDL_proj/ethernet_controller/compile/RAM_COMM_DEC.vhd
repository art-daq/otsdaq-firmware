-------------------------------------------------------------------------------
--
-- Title       : RAM_COMM_DEC
-- Design      : ethernet_controller
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : d:\Projects\otsdaq\PicoZed\ActiveHDL_proj\ethernet_controller\compile\RAM_COMM_DEC.vhd
-- Generated   : 09/30/15 16:33:19
-- From        : d:/Projects/otsdaq/PicoZed/ActiveHDL_proj/ethernet_controller/src/RAM_COMM_DEC.asf
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

entity RAM_COMM_DEC is 
	port (
		burst_done: in STD_LOGIC;
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		rx_data_fifo_rd_data: in STD_LOGIC_VECTOR (63 downto 0);
		rx_info_fifo_empty: in STD_LOGIC;
		rx_info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		tx_info_fifo_full: in STD_LOGIC;
		user_tx_qword_ready: in STD_LOGIC;
		burst_start: out STD_LOGIC;
		burst_stop: out STD_LOGIC;
		ram_addr: out STD_LOGIC_VECTOR (63 downto 0);
		ram_en: out STD_LOGIC;
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
end RAM_COMM_DEC;

architecture RAM_COMM_DEC of RAM_COMM_DEC is

-- diagram signals declarations
signal burst_active: STD_LOGIC;
signal burst_complete_flag: STD_LOGIC;
signal comm_reg: UNSIGNED (1 downto 0);
signal crc_err: STD_LOGIC;
signal mem_loc_count_reg: UNSIGNED (7 downto 0);
signal no_addrs_incr: STD_LOGIC;
signal q_w_count_reg: UNSIGNED (7 downto 0);
signal ram_addr_sig: UNSIGNED (63 downto 0);
signal ram_en_sig: STD_LOGIC;

-- BINARY ENCODED state machine: Sreg0
attribute ENUM_ENCODING: string;
type Sreg0_type is (
    write_com_S9, write_com_S8, read_com_S13, read_com_S14, read_com_S15, read_com_S1, read_com_S18, write_com_S11, crcerr_S26, burst_strt_S30,
    burst_strt_S31, burst_strt_S33, burst_strt_S34, burst_stp_S36, burst_stp_S37, burst_stp_S38, burst_stp_S39, dec_comm, idle, illegal,
    return_st, get_comm, brst_wait, err_dec, pro_comm, read_com_S40
);
attribute ENUM_ENCODING of Sreg0_type: type is
	"00000 " &		-- write_com_S9
	"00001 " &		-- write_com_S8
	"00010 " &		-- read_com_S13
	"00011 " &		-- read_com_S14
	"00100 " &		-- read_com_S15
	"00101 " &		-- read_com_S1
	"00110 " &		-- read_com_S18
	"00111 " &		-- write_com_S11
	"01000 " &		-- crcerr_S26
	"01001 " &		-- burst_strt_S30
	"01010 " &		-- burst_strt_S31
	"01011 " &		-- burst_strt_S33
	"01100 " &		-- burst_strt_S34
	"01101 " &		-- burst_stp_S36
	"01110 " &		-- burst_stp_S37
	"01111 " &		-- burst_stp_S38
	"10000 " &		-- burst_stp_S39
	"10001 " &		-- dec_comm
	"10010 " &		-- idle
	"10011 " &		-- illegal
	"10100 " &		-- return_st
	"10101 " &		-- get_comm
	"10110 " &		-- brst_wait
	"10111 " &		-- err_dec
	"11000 " &		-- pro_comm
	"11001" ;		-- read_com_S40

signal Sreg0: Sreg0_type;

attribute STATE_VECTOR: string;
attribute STATE_VECTOR of RAM_COMM_DEC: architecture is "Sreg0";

begin

-- concurrent signals assignments

-- Diagram ACTION
ram_en <= ram_en_sig;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock)
begin
	if clock'event and clock = '1' then
		if reset = '1' then
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
-- Initialize registers
			comm_reg <= (others => '0');
			q_w_count_reg <= (others => '0');
			mem_loc_count_reg <= (others => '0');
			burst_active <= '0';
			crc_err <= '0';
-- Initialize outputs
			tx_info_fifo_wr_data <= (others => '0');
			tx_info_fifo_wren <= '0';
			tx_data_fifo_wren <= '0';
-- mux controls
			tx_data_fifo_src_sel <= '0';
			tx_info_fifo_src_sel <= '0';
-- ram controls
			ram_addr_sig <= (others => '0');
			ram_wren <= '0';
			ram_en_sig <= '0';
			burst_start <= '0';
			burst_stop <= '0';
			rx_info_fifo_rden <= '0';
			rx_data_fifo_rden <= '0';
			Rx_FIFO_Reset <= '1';
			-- Reset FIFOs
			Tx_FIFO_Reset <= '1';
			burst_complete_flag <= '0';
			-- disable reset
			-- disable reset
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
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
						if (burst_complete_flag = '1') then
						  Tx_FIFO_Reset <= '1';
						end if;
					elsif comm_reg(1 downto 0) = 0 and burst_active = '0' then
						Sreg0 <= read_com_S1;
						if (burst_complete_flag = '1') then
						  Tx_FIFO_Reset <= '1';
						end if;
					elsif comm_reg(1 downto 0) = 1 then
						Sreg0 <= write_com_S8;
						rx_data_fifo_rden <= '1';
						-- read address qword
					else
						Sreg0 <= illegal;
						Rx_FIFO_Reset <= '1';
					end if;
				when idle =>
					Rx_FIFO_Reset <= '0';
					-- disable reset
					Tx_FIFO_Reset <= '0';
					-- disable reset
					if burst_done = '1' and
						burst_active = '1' then
						Sreg0 <= brst_wait;
					elsif rx_info_fifo_empty = '0' then
						Sreg0 <= get_comm;
						rx_info_fifo_rden <= '1';
					end if;
				when illegal =>
					Sreg0 <= return_st;
					Rx_FIFO_Reset <= '0';
				when return_st =>
					Sreg0 <= idle;
				when get_comm =>
					Sreg0 <= pro_comm;
					rx_info_fifo_rden <= '0';
				when brst_wait =>
					if burst_done = '1' then
						Sreg0 <= return_st;
						burst_active <= '0';
						burst_stop <= '0';
						-- Point FIFO muxes away from
						-- burst controller
						tx_data_fifo_src_sel <= '0';
						tx_info_fifo_src_sel <= '0';
						burst_complete_flag <= '1';
					end if;
				when err_dec =>
					if crc_err = '1' then
						Sreg0 <= crcerr_S26;
						tx_info_fifo_wren <= '0';
						-- stop write to tx info fifo
						Rx_FIFO_Reset <= '1';
					else
						Sreg0 <= dec_comm;
						tx_info_fifo_wren <= '0';
						-- stop write to tx info fifo
					end if;
				when pro_comm =>
					Sreg0 <= err_dec;
					comm_reg <= unsigned(rx_info_fifo_rd_data(1 downto 0));
					-- Get the command code from
					-- the receive info fifo word
					q_w_count_reg <= unsigned(rx_info_fifo_rd_data(15 downto 8));
					-- get the number of 8 byte quad words from
					-- the info fifo word
					crc_err <= rx_info_fifo_rd_data(7);
					-- get the crc error indicator
					no_addrs_incr <= rx_info_fifo_rd_data(3);
					-- get the no addr increment flag
					mem_loc_count_reg <= unsigned(rx_info_fifo_rd_data(15 downto 8));
					if (rx_info_fifo_rd_data(2) = '1' ) then --ACK
					-- handle ACK info (no data for ACK)
						tx_info_fifo_wr_data(15 downto 8) <= (others => '0');
						tx_info_fifo_wr_data(7 downto 0) <= rx_info_fifo_rd_data(7 downto 0);
						tx_info_fifo_wren <= '1';
						-- write to tx info fifo
					-- definition of bits written to tx_info_fifo
					-- bits 15-8: quad word count (read data)
					-- bit 7: crc err detected in received packet
					-- bits 6-4: (currently undefined)
					-- bits 3-0: op code
					-- (bit 3 is no address increment, bit 2 is ack, 1:0 is command)
					end if;
				when burst_stp_S36 =>
					Sreg0 <= burst_stp_S37;
					rx_data_fifo_rden <= '0';
				when burst_stp_S37 =>
					Sreg0 <= burst_stp_S39;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					-- obtain starting address
				when burst_stp_S38 =>
					Sreg0 <= burst_stp_S36;
					-- there is at least one quad word in the data fifo
					rx_data_fifo_rden <= '1';
				when burst_stp_S39 =>
					Sreg0 <= brst_wait;
				when read_com_S13 =>
					ram_en_sig <= '1';
					-- Enable the RAM
					if (user_tx_qword_ready = '1') then  -- only if user is ready take next data
						if (no_addrs_incr = '0') then
							ram_addr_sig <= ram_addr_sig + 1;
						end if;
						mem_loc_count_reg <= mem_loc_count_reg - 1;
					end if;
					-- write data into fifo 1 clock later if user's data is ready
					tx_data_fifo_wren <= user_tx_qword_ready and ram_en_sig;
					if mem_loc_count_reg = 1 then
						Sreg0 <= read_com_S40;
					end if;
				when read_com_S14 =>
					Sreg0 <= read_com_S18;
					rx_data_fifo_rden <= '0';
				when read_com_S15 =>
					Sreg0 <= return_st;
					tx_info_fifo_wren <= '0';
					-- end write to tx info fifo
					tx_data_fifo_wren <= '0';
				when read_com_S1 =>
					if q_w_count_reg = 0 then
						Sreg0 <= read_com_S15;
						tx_info_fifo_wr_data(15 downto 8) <= std_logic_vector(q_w_count_reg);
						tx_info_fifo_wr_data(7 downto 0) <= "00000" & "000";
						tx_info_fifo_wren <= '1';
						Tx_FIFO_Reset <= '0';
						burst_complete_flag <= '0';
					else
						Sreg0 <= read_com_S14;
						-- there is at least one quad word in the data fifo
						rx_data_fifo_rden <= '1';
						Tx_FIFO_Reset <= '0';
						burst_complete_flag <= '0';
					end if;
				when read_com_S18 =>
					Sreg0 <= read_com_S13;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					-- obtain starting address
				when read_com_S40 =>
					if user_tx_qword_ready = '1' then	--last read is ready
						Sreg0 <= read_com_S15;
						ram_en_sig <= '0';
						-- no more accesses from RAM
						mem_loc_count_reg <= (others => '0');
						-- reset the memory location counter
						tx_data_fifo_wren <= '1';
						-- writing last qword to the tx data fifo
						-- need to write code to
						-- tx_info_fifo
						tx_info_fifo_wr_data(15 downto 8) <= std_logic_vector(q_w_count_reg);
						tx_info_fifo_wr_data(7 downto 0) <= (others => '0');
						-- This is a read command being responded to
						tx_info_fifo_wren <= '1';
						-- write to tx info fifo
						-- definition of bits written to tx_info_fifo
						-- bits 15-8: quad word count (read data)
						-- bits 7-3: status (currently undefined)
						-- bits 2-0: return code (always 000 from this block)
					end if;
				when burst_strt_S30 =>
					Sreg0 <= burst_strt_S34;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					-- obtain starting address
				when burst_strt_S31 =>
					Sreg0 <= burst_strt_S30;
					rx_data_fifo_rden <= '0';
				when burst_strt_S33 =>
					Sreg0 <= burst_strt_S31;
					-- there is at least one quad word in the data fifo
					rx_data_fifo_rden <= '1';
					Tx_FIFO_Reset <= '0';
					burst_complete_flag <= '0';
				when burst_strt_S34 =>
					Sreg0 <= return_st;
					burst_start <= '0';
				when write_com_S9 =>
					if (no_addrs_incr = '0') then
						ram_addr_sig <= ram_addr_sig + 1;
					end if;
					ram_wren <= '1';
					rx_data_fifo_rden <= '1';
					mem_loc_count_reg <= mem_loc_count_reg - 1;
					if mem_loc_count_reg = 1 then
						Sreg0 <= write_com_S11;
						-- Turn off read accesses of the
						-- data FIFO
						-- but write last qword out
						rx_data_fifo_rden <= '0';
					end if;
				when write_com_S8 =>
					Sreg0 <= write_com_S9;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					--set base address
					rx_data_fifo_rden <= '1';
					--read first data qword
					ram_wren <= '1';
					mem_loc_count_reg <= mem_loc_count_reg - 1;
					if (mem_loc_count_reg = 1) then	 -- if sz = 1
						rx_data_fifo_rden <= '0';
						-- stop reading data qwords
					else							 -- else
						rx_data_fifo_rden <= '1';
						-- continue reading data qwords
					end if;
				when write_com_S11 =>
					Sreg0 <= return_st;
					ram_wren <= '0';
				when crcerr_S26 =>
					Sreg0 <= return_st;
					Rx_FIFO_Reset <= '0';
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

end RAM_COMM_DEC;
