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
-- Generated   : 09/28/15 12:30:19
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
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
		burst_start: out STD_LOGIC;
		burst_stop: out STD_LOGIC;
		ram_addr: out STD_LOGIC_VECTOR (63 downto 0);
		ram_en: out STD_LOGIC;
		ram_wren: out STD_LOGIC;
		rx_data_fifo_rden: out STD_LOGIC;
		Rx_FIFO_Reset: out STD_LOGIC;
		rx_info_fifo_rden: out STD_LOGIC;
		state_diag: out STD_LOGIC_VECTOR (0 to 5);
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
signal comm_reg: STD_LOGIC_VECTOR (2 downto 0);
signal crc_err: STD_LOGIC;
signal mem_loc_count_reg: STD_LOGIC_VECTOR (7 downto 0);
signal q_w_count_reg: STD_LOGIC_VECTOR (7 downto 0);
signal ram_addr_reg: STD_LOGIC_VECTOR (63 downto 0);

-- BINARY ENCODED state machine: Sreg0
attribute ENUM_ENCODING: string;
type Sreg0_type is (
    write_com_S9, write_com_S8, write_com_S10, read_com_S13, read_com_S14, read_com_S15, read_com_S16, read_com_S1, read_com_S18, write_com_S19,
    write_com_S11, write_com_S21, crcerr_S24, crcerr_S25, crcerr_S26, crcerr_S27, crcerr_S28, burst_strt_S30, burst_strt_S31, burst_strt_S33,
    burst_strt_S34, burst_stp_S36, burst_stp_S37, burst_stp_S38, burst_stp_S39, dec_comm, idle, illegal, return_st, get_comm, brst_wait,
    err_dec, ack, pro_comm
);
attribute ENUM_ENCODING of Sreg0_type: type is
	"000000 " &		-- write_com_S9
	"000001 " &		-- write_com_S8
	"000010 " &		-- write_com_S10
	"000011 " &		-- read_com_S13
	"000100 " &		-- read_com_S14
	"000101 " &		-- read_com_S15
	"000110 " &		-- read_com_S16
	"000111 " &		-- read_com_S1
	"001000 " &		-- read_com_S18
	"001001 " &		-- write_com_S19
	"001010 " &		-- write_com_S11
	"001011 " &		-- write_com_S21
	"001100 " &		-- crcerr_S24
	"001101 " &		-- crcerr_S25
	"001110 " &		-- crcerr_S26
	"001111 " &		-- crcerr_S27
	"010000 " &		-- crcerr_S28
	"010001 " &		-- burst_strt_S30
	"010010 " &		-- burst_strt_S31
	"010011 " &		-- burst_strt_S33
	"010100 " &		-- burst_strt_S34
	"010101 " &		-- burst_stp_S36
	"010110 " &		-- burst_stp_S37
	"010111 " &		-- burst_stp_S38
	"011000 " &		-- burst_stp_S39
	"011001 " &		-- dec_comm
	"011010 " &		-- idle
	"011011 " &		-- illegal
	"011100 " &		-- return_st
	"011101 " &		-- get_comm
	"011110 " &		-- brst_wait
	"011111 " &		-- err_dec
	"100000 " &		-- ack
	"100001" ;		-- pro_comm

signal Sreg0: Sreg0_type;

attribute STATE_VECTOR: string;
attribute STATE_VECTOR of RAM_COMM_DEC: architecture is "Sreg0";

begin

-- concurrent signals assignments

-- Diagram ACTION
state_diag <= CONV_STD_LOGIC_VECTOR(Sreg0_type'POS(Sreg0),6);

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
			comm_reg <= v_3_0;
			q_w_count_reg <= v_8_0;
			mem_loc_count_reg <= v_8_0;
			burst_active <= '0';
			crc_err <= '0';
			ram_addr_reg <= v_64_0;
-- Initialize outputs
			tx_info_fifo_wr_data <= v_16_0;
			tx_info_fifo_wren <= '0';
			tx_data_fifo_wren <= '0';
-- mux controls
			tx_data_fifo_src_sel <= '0';
			tx_info_fifo_src_sel <= '0';
-- ram controls
			ram_addr <= v_64_0;
			ram_wren <= '0';
			ram_en <= '0';
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
					if comm_reg(1 downto 0) = 3 then
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
						rx_data_fifo_rden <= '1';
					elsif comm_reg(2) = '1' then
						Sreg0 <= ack;
						-- handle ACK info (no data for ACK)
						tx_info_fifo_wr_data(15 downto 8) <= (others => '0');
						tx_info_fifo_wr_data(7 downto 3) <= (others => '0');
						tx_info_fifo_wr_data(2 downto 0) <= comm_reg;
						tx_info_fifo_wren <= '1';
						-- write to tx info fifo
						-- definition of bits written to tx_info_fifo
						-- bits 15-8: quad word count (read data)
						-- bits 7-3: status (currently undefined)
						-- bits 2-0: return code (bit 2 is ack, 1:0 is command)
					else
						Sreg0 <= dec_comm;
					end if;
				when ack =>
					Sreg0 <= dec_comm;
					tx_info_fifo_wren <= '0';
					-- stop write to tx info fifo
				when pro_comm =>
					Sreg0 <= err_dec;
					comm_reg <= rx_info_fifo_rd_data(2 downto 0);
					-- Get the command code from
					-- the receive info fifo word
					q_w_count_reg <= rx_info_fifo_rd_data(15 downto 8);
					-- get the number of 8 byte quad words from
					-- the info fifo word
					crc_err <= rx_info_fifo_rd_data(3);
					-- get the crc error indicator
					mem_loc_count_reg <= v_8_0;
				when burst_stp_S36 =>
					Sreg0 <= burst_stp_S37;
					rx_data_fifo_rden <= '0';
				when burst_stp_S37 =>
					Sreg0 <= burst_stp_S39;
					ram_addr_reg <= rx_data_fifo_rd_data;
					-- obtain starting address
				when burst_stp_S38 =>
					Sreg0 <= burst_stp_S36;
					-- there is at least one quad word in the data fifo
					rx_data_fifo_rden <= '1';
				when burst_stp_S39 =>
					Sreg0 <= brst_wait;
					ram_addr <= ram_addr_reg;
				when read_com_S13 =>
					Sreg0 <= read_com_S16;
					ram_addr <= ram_addr_reg;
					ram_en <= '1';
					-- Enable the RAM
					ram_addr_reg <= ram_addr_reg + v_64_1;
					mem_loc_count_reg <= mem_loc_count_reg + v_8_1;
				when read_com_S14 =>
					Sreg0 <= read_com_S18;
					rx_data_fifo_rden <= '0';
				when read_com_S15 =>
					Sreg0 <= return_st;
					tx_info_fifo_wren <= '0';
					-- end write to tx info fifo
					tx_data_fifo_wren <= '0';
				when read_com_S16 =>
					if mem_loc_count_reg < q_w_count_reg then
						Sreg0 <= read_com_S16;
						ram_addr <= ram_addr_reg;
						ram_addr_reg <= ram_addr_reg + v_64_1;
						tx_data_fifo_wren <= '1';
						mem_loc_count_reg <= mem_loc_count_reg + v_8_1;
					elsif mem_loc_count_reg >= q_w_count_reg then
						Sreg0 <= read_com_S15;
						ram_en <= '0';
						-- no more accesses from RAM
						mem_loc_count_reg <= v_8_0;
						-- reset the memory location counter
						ram_addr <= ram_addr_reg;
						-- Reconsider the CRC error handling
						if (crc_err = '0') then
						  tx_data_fifo_wren <= '1';
						else
						  tx_data_fifo_wren <= '0';
						end if;
						-- stop writing to the tx data fifo
						-- need to write code to
						-- tx_info_fifo
						tx_info_fifo_wr_data(15 downto 8) <= q_w_count_reg;
						tx_info_fifo_wr_data(7 downto 0) <= v_8_0;
						-- This is a read command being responded to
						tx_info_fifo_wren <= '1';
						-- write to tx info fifo
						-- definition of bits written to tx_info_fifo
						-- bits 15-8: quad word count (read data)
						-- bits 7-3: status (currently undefined)
						-- bits 2-0: return code (always 000 from this block)
					end if;
				when read_com_S1 =>
					if q_w_count_reg /= v_5_0 then
						Sreg0 <= read_com_S14;
						-- there is at least one quad word in the data fifo
						rx_data_fifo_rden <= '1';
						Tx_FIFO_Reset <= '0';
						burst_complete_flag <= '0';
					elsif q_w_count_reg = v_5_0 then
						Sreg0 <= read_com_S15;
						tx_info_fifo_wr_data(15 downto 8) <= q_w_count_reg;
						tx_info_fifo_wr_data(7 downto 0) <= "00000" & "000";
						tx_info_fifo_wren <= '1';
						Tx_FIFO_Reset <= '0';
						burst_complete_flag <= '0';
					end if;
				when read_com_S18 =>
					Sreg0 <= read_com_S13;
					ram_addr_reg <= rx_data_fifo_rd_data;
					-- obtain starting address
				when burst_strt_S30 =>
					Sreg0 <= burst_strt_S34;
					ram_addr_reg <= rx_data_fifo_rd_data;
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
					ram_addr <= ram_addr_reg;
					burst_start <= '0';
				when write_com_S9 =>
					Sreg0 <= write_com_S10;
					ram_addr <= ram_addr_reg;
					-- starting address to RAM
					-- is asserted
					--ram_addr_reg <= ram_addr_reg + v_64_1;
					-- prepare the next address
					mem_loc_count_reg <= mem_loc_count_reg + v_8_1;
					rx_data_fifo_rden <= '1';
					-- set up the first word
				when write_com_S8 =>
					Sreg0 <= write_com_S19;
					rx_data_fifo_rden <= '0';
				when write_com_S10 =>
					if mem_loc_count_reg < q_w_count_reg then
						Sreg0 <= write_com_S10;
						ram_wren <= '1';
						ram_en <= '1';
						ram_addr <= ram_addr_reg;
						ram_addr_reg <= ram_addr_reg + v_64_1;
						rx_data_fifo_rden <= '1';
						mem_loc_count_reg <= mem_loc_count_reg + v_8_1;
					elsif mem_loc_count_reg = q_w_count_reg then
						Sreg0 <= write_com_S11;
						mem_loc_count_reg <= v_8_0;
						-- Turn off read accesses of the
						-- data FIFO
						rx_data_fifo_rden <= '0';
						ram_addr <= ram_addr_reg;
						ram_wren <= '1';
						ram_en <= '1';
					end if;
				when write_com_S19 =>
					Sreg0 <= write_com_S9;
					--rx_data_fifo_rden <= '0';
					ram_addr_reg <= rx_data_fifo_rd_data;
					-- starting address from FIFO data
					-- is latched
				when write_com_S11 =>
					Sreg0 <= write_com_S21;
					ram_wren <= '0';
					ram_en <= '0';
				when write_com_S21 =>
					Sreg0 <= return_st;
				when crcerr_S24 =>
					Sreg0 <= return_st;
				when crcerr_S25 =>
					Sreg0 <= crcerr_S28;
					mem_loc_count_reg <= mem_loc_count_reg + v_8_1;
					rx_data_fifo_rden <= '1';
				when crcerr_S26 =>
					Sreg0 <= crcerr_S25;
					rx_data_fifo_rden <= '0';
				when crcerr_S27 =>
					Sreg0 <= crcerr_S24;
					ram_wren <= '0';
					ram_en <= '0';
				when crcerr_S28 =>
					if mem_loc_count_reg = q_w_count_reg then
						Sreg0 <= crcerr_S27;
						mem_loc_count_reg <= v_8_0;
						rx_data_fifo_rden <= '0';
					elsif mem_loc_count_reg < q_w_count_reg then
						Sreg0 <= crcerr_S28;
						mem_loc_count_reg <= mem_loc_count_reg + v_8_1;
					end if;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end RAM_COMM_DEC;
