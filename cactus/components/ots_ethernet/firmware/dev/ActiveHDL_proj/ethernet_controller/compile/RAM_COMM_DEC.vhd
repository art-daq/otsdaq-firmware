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
-- Generated   : 11/11/15 08:44:36
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

entity ram_comm_dec is 
	port (
		burst_done: in STD_LOGIC;
		clock: in STD_LOGIC;
		crc_err_flag: in STD_LOGIC;
		gec_user_rx_valid_out: in STD_LOGIC;
		reset: in STD_LOGIC;
		rx_data_fifo_full: in STD_LOGIC;
		rx_data_fifo_rd_data: in STD_LOGIC_VECTOR (63 downto 0);
		rx_info_fifo_empty: in STD_LOGIC;
		rx_info_fifo_full: in STD_LOGIC;
		rx_info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		tx_info_fifo_full: in STD_LOGIC;
		user_ready: in STD_LOGIC;
		burst_start: out STD_LOGIC;
		burst_stop: out STD_LOGIC;
		clear_crc_err_flag: out STD_LOGIC;
		ram_addr: out STD_LOGIC_VECTOR (63 downto 0);
		ram_rden: out STD_LOGIC;
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
signal mem_loc_count_reg: UNSIGNED (7 downto 0);
signal no_addrs_incr: STD_LOGIC;
signal q_w_count_reg: UNSIGNED (7 downto 0);
signal ram_addr_sig: UNSIGNED (63 downto 0);
signal ram_rden_sig: STD_LOGIC;
signal ram_wren_sig: STD_LOGIC;
signal rx_data_fifo_full_flag: STD_LOGIC;
signal rx_info_fifo_full_flag: STD_LOGIC;

-- BINARY ENCODED state machine: Sreg0
attribute ENUM_ENCODING: string;
type Sreg0_type is (
    write_com_S9, write_com_S8, read_com_S13, read_com_S14, read_com_S15, read_com_S1, read_com_S18, burst_strt_S30, burst_strt_S31,
    burst_strt_S33, burst_strt_S34, burst_stp_S36, burst_stp_S37, burst_stp_S38, burst_stp_S39, pro_comm, dec_comm, idle, return_st,
    get_comm, err_dec, brst_wait
);
attribute ENUM_ENCODING of Sreg0_type: type is
	"00000 " &		-- write_com_S9
	"00001 " &		-- write_com_S8
	"00010 " &		-- read_com_S13
	"00011 " &		-- read_com_S14
	"00100 " &		-- read_com_S15
	"00101 " &		-- read_com_S1
	"00110 " &		-- read_com_S18
	"00111 " &		-- burst_strt_S30
	"01000 " &		-- burst_strt_S31
	"01001 " &		-- burst_strt_S33
	"01010 " &		-- burst_strt_S34
	"01011 " &		-- burst_stp_S36
	"01100 " &		-- burst_stp_S37
	"01101 " &		-- burst_stp_S38
	"01110 " &		-- burst_stp_S39
	"01111 " &		-- pro_comm
	"10000 " &		-- dec_comm
	"10001 " &		-- idle
	"10010 " &		-- return_st
	"10011 " &		-- get_comm
	"10100 " &		-- err_dec
	"10101" ;		-- brst_wait

signal Sreg0: Sreg0_type;

attribute STATE_VECTOR: string;
attribute STATE_VECTOR of arch: architecture is "Sreg0";

begin

-- concurrent signals assignments

-- Diagram ACTION
ram_rden <= ram_rden_sig;
ram_wren <= ram_wren_sig;
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
			old_rx_v <= gec_user_rx_valid_out;
			if (reset = '1') then
				tmp_cnt <= (others => '1');
				comm_dec_ready <= '1';
				rx_info_fifo_full_flag <= '0';
				rx_data_fifo_full_flag <= '0';
			else
				if (old_rx_v = '0' and gec_user_rx_valid_out = '1') then
-- reset signal at start of receiving a packet
					comm_dec_ready <= '0';
					is_counting <= '0';
					tmp_cnt <= (others => '1');
				end if;
				if (old_rx_v = '1' and gec_user_rx_valid_out = '0') then
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
			Rx_FIFO_Reset <= '0';
			Tx_FIFO_Reset <= '0';
			clear_crc_err_flag <= '0';
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
			ram_wren_sig <= '0';
			ram_rden_sig <= '0';
			burst_start <= '0';
			burst_stop <= '0';
			rx_info_fifo_rden <= '0';
			rx_data_fifo_rden <= '0';
			Rx_FIFO_Reset <= '1';
			-- Reset FIFOs
			Tx_FIFO_Reset <= '1';
			burst_complete_flag <= '0';
			no_addrs_incr <= '0';
			if (crc_err_flag = '1' and rx_info_fifo_empty = '1') then
			    clear_crc_err_flag <= '1';
			    -- clear if old err, somehow?
			end if;
		else
			-- Set default values for outputs, signals and variables
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
					if (rx_info_fifo_rd_data(2) = '1' or crc_err_flag = '1') then --ACK
					-- handle ACK info (no data for ACK)
						tx_info_fifo_wr_data(15 downto 8) <= (others => '0');
						tx_info_fifo_wr_data(7) <= crc_err_flag;
						tx_info_fifo_wr_data(6) <= rx_info_fifo_full_flag;
						tx_info_fifo_wr_data(5) <= rx_data_fifo_full_flag;
						tx_info_fifo_wr_data(4 downto 0) <= rx_info_fifo_rd_data(4 downto 0);
						tx_info_fifo_wren <= '1';
						-- write to tx info fifo
					-- definition of bits written to tx_info_fifo
					-- bits 15-8: quad word count (read data)
					-- bit 7: crc err detected in received packet
					-- bit 6: rx info fifo has been full since last reset
					-- bit 5: rx data fifo has been full since last reset
					-- bits 4: (currently undefined)
					-- bits 3-0: op code
					-- (bit 3 is no address increment, bit 2 is ack, 1:0 is command)
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
						Sreg0 <= return_st;
						Rx_FIFO_Reset <= '1';
					end if;
				when idle =>
					if (crc_err_flag = '1' and rx_info_fifo_empty = '1') then
					    clear_crc_err_flag <= '1';
					    -- clear if old err, somehow?
					end if;
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
						tx_info_fifo_wren <= '0';
						-- stop write to tx info fifo
						Rx_FIFO_Reset <= '1';
						clear_crc_err_flag <= '1';
					else
						Sreg0 <= dec_comm;
						tx_info_fifo_wren <= '0';
						-- stop write to tx info fifo
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
						burst_complete_flag <= '1';
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
				when read_com_S14 =>
					Sreg0 <= read_com_S18;
					rx_data_fifo_rden <= '0';
				when read_com_S15 =>
					Sreg0 <= return_st;
					tx_info_fifo_wren <= '0';
					-- end write to tx info fifo
					tx_data_fifo_wren <= '0';
				when read_com_S1 =>
					if q_w_count_reg = 0 then	-- err? there is no starting address
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
						burst_complete_flag <= '0';
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
					rx_data_fifo_rden <= '0';
				when burst_strt_S33 =>
					Sreg0 <= burst_strt_S31;
					-- there is at least one quad word in the data fifo
					rx_data_fifo_rden <= '1';
					burst_complete_flag <= '0';
				when burst_strt_S34 =>
					Sreg0 <= return_st;
					burst_start <= '0';
				when write_com_S9 =>
					if (mem_loc_count_reg = 1 and user_ready = '1') then
						ram_wren_sig <= '0';
						--done
					else
						ram_wren_sig <= '1';
						-- Enable the RAM
					end if;
					if (user_ready = '1') then  -- only if user is ready take next data
						if (no_addrs_incr = '0' and mem_loc_count_reg /= 1 ) then
							ram_addr_sig <= ram_addr_sig + 1;
						end if;
						mem_loc_count_reg <= mem_loc_count_reg - 1;
					end if;
					-- read data out of fifo 1 clock later if user is ready
					rx_data_fifo_rden <= user_ready and ram_wren_sig;
					--
					--
					--if (no_addrs_incr = '0') then
					--	ram_addr_sig <= ram_addr_sig + 1;
					--end if;
					--
					--ram_wren_sig <= '1';
					--rx_data_fifo_rden <= '1';
					--mem_loc_count_reg <= mem_loc_count_reg - 1;
					if mem_loc_count_reg = 1 and user_ready = '1' then
						Sreg0 <= return_st;
						-- Turn off read accesses of the
						rx_data_fifo_rden <= '0';
					end if;
				when write_com_S8 =>
					Sreg0 <= write_com_S9;
					ram_addr_sig <= unsigned(rx_data_fifo_rd_data);
					--set base address
					rx_data_fifo_rden <= '1';
					--read first data qword
					ram_wren_sig <= '1';
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
