-------------------------------------------------------------------------------
--
-- Title       : GEC_RX_CTL
-- Design      : ethernet_controller
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : d:\Projects\otsdaq\PicoZed\ActiveHDL_proj\ethernet_controller\compile\GEC_RX_CTL.vhd
-- Generated   : 09/28/15 14:43:17
-- From        : d:/Projects/otsdaq/PicoZed/ActiveHDL_proj/ethernet_controller/src/GEC_RX_CTL.asf
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

entity GEC_RX_CTL is 
	port (
		clock: in STD_LOGIC;
		four_bit_mode: in STD_LOGIC;
		gec_user_crc_err: in STD_LOGIC;
		gec_user_rx_data_out: in STD_LOGIC_VECTOR (7 downto 0);
		gec_user_rx_size_out: in STD_LOGIC_VECTOR (10 downto 0);
		gec_user_rx_valid_out: in STD_LOGIC;
		reset: in STD_LOGIC;
		crc_err_flag: out STD_LOGIC;
		data_fifo_q_w_data: out STD_LOGIC_VECTOR (63 downto 0);
		data_fifo_wren: out STD_LOGIC;
		info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		info_fifo_wren: out STD_LOGIC;
		state_diag: out STD_LOGIC_VECTOR (3 downto 0));
end GEC_RX_CTL;

architecture GEC_RX_CTL of GEC_RX_CTL is

-- diagram signals declarations
signal clken: STD_LOGIC;
signal com_code: STD_LOGIC_VECTOR (1 downto 0);
signal crc_err_reg: STD_LOGIC;
signal crc_loop_count: STD_LOGIC_VECTOR (4 downto 0);
signal data_fifo_wren_sig: STD_LOGIC;
signal info_fifo_wren_sig: STD_LOGIC;
signal q_w_count: STD_LOGIC_VECTOR (7 downto 0);
signal q_w_counter: STD_LOGIC_VECTOR (7 downto 0);
signal q_w_reg: STD_LOGIC_VECTOR (63 downto 0);

-- BINARY ENCODED state machine: Sreg0
attribute ENUM_ENCODING: string;
type Sreg0_type is (
    S3_S4, S3_S7, S3_S8, S3_S9, S3_S10, S3_S11, S3_S12, S3_S6, S3_S5, idle, check_crc, rcvdone, S2, S1, S13
);
attribute ENUM_ENCODING of Sreg0_type: type is
	"0000 " &		-- S3_S4
	"0001 " &		-- S3_S7
	"0010 " &		-- S3_S8
	"0011 " &		-- S3_S9
	"0100 " &		-- S3_S10
	"0101 " &		-- S3_S11
	"0110 " &		-- S3_S12
	"0111 " &		-- S3_S6
	"1000 " &		-- S3_S5
	"1001 " &		-- idle
	"1010 " &		-- check_crc
	"1011 " &		-- rcvdone
	"1100 " &		-- S2
	"1101 " &		-- S1
	"1110" ;		-- S13

signal Sreg0: Sreg0_type;

attribute STATE_VECTOR: string;
attribute STATE_VECTOR of GEC_RX_CTL: architecture is "Sreg0";

begin

-- concurrent signals assignments

-- Diagram ACTION
state_diag <= CONV_STD_LOGIC_VECTOR(Sreg0_type'POS(Sreg0),4);
info_fifo_wren <= info_fifo_wren_sig and clken;
data_fifo_wren <= data_fifo_wren_sig and clken;
four_bit_proc : process (clock) -- make trigger sig a single clock width pulse
begin
	if rising_edge(clock) then
		if (four_bit_mode = '1') then
			clken <= not clken;
		else
			clken <= '1';
		end if;
	end if;
end process;

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
			crc_err_reg <= '0';
			crc_loop_count <= v_5_0;
			q_w_reg <= v_32_0 & v_32_0;
-- Initialize error flag outputs
			crc_err_flag <= '0';
-- Initialize FIFO control outputs
			data_fifo_wren_sig <= '0';
			info_fifo_wren_sig <= '0';
			info_fifo_wr_data <= v_16_0;
			com_code <= (others => '0');
			data_fifo_q_w_data <= (others => '0');
		else
			if clken = '1' then
				-- Set default values for outputs, signals and variables
				-- ...
				case Sreg0 is
					when idle =>
						if gec_user_rx_valid_out = '1' and
							gec_user_rx_size_out > v_11_1 then
							Sreg0 <= S13;
							info_fifo_wr_data(7 downto 0) <= gec_user_rx_data_out;
							-- Put the entire command/size word in the info
							-- FIFO
							-- this is not written until
							-- all info for the fifo is
							-- accumulated
							--q_w_count <= gec_user_rx_data_out (7 downto 3);
							-- set the terminal count of quad words
							-- using that portion of the command/size
							-- word
							com_code <= gec_user_rx_data_out(1 downto 0);
							-- save command code
						elsif gec_user_rx_valid_out = '1' and
							gec_user_rx_size_out = v_11_1 then
							Sreg0 <= check_crc;
							info_fifo_wr_data(7 downto 0) <= gec_user_rx_data_out;
							info_fifo_wr_data(15 downto 8) <= v_8_0;
							-- Capture command byte
						end if;
					when check_crc =>
						if (crc_loop_count = v_5_22) or 
							(gec_user_crc_err = '1') or
							(crc_err_reg = '1') then	-- CRC timed out  -- or CRC err detected
							Sreg0 <= S1;
							if (gec_user_crc_err = '1') then
							  crc_err_reg <= '1';
							end if;
						else
							Sreg0 <= check_crc;
							crc_loop_count <= crc_loop_count + v_5_1;
						end if;
					when rcvdone =>
						Sreg0 <= idle;
						info_fifo_wren_sig <= '0';
					when S2 =>
						Sreg0 <= rcvdone;
						crc_err_reg <= '0';
						-- reset the crc error counter
						crc_err_flag <= '0';
						-- reset the crc error flag (output)
						crc_loop_count <= v_5_0;
						-- reset the 22 cycle crc loop counter
						data_fifo_wren_sig <= '0';
						info_fifo_wren_sig <= '1';
						-- we actually write the info fifo here.
					when S1 =>
						Sreg0 <= S2;
						info_fifo_wr_data(3) <= crc_err_reg;
						-- keep the crc error status
						-- at this point the info should be complete
						crc_err_flag <= crc_err_reg;
						-- assert the crc error status on the output
					when S13 =>
						Sreg0 <= S3_S4;
						q_w_count <= gec_user_rx_data_out;
						info_fifo_wr_data(15 downto 8) <= gec_user_rx_data_out;
					when S3_S4 =>
						Sreg0 <= S3_S5;
						data_fifo_q_w_data(63 downto 56) <= gec_user_rx_data_out;
						q_w_counter <= v_8_1;
						-- initialize the counter
						-- Increment the quad word count for writes
						-- First word is the starting address
						-- next n words (I received a count of n)
						-- is the actual quad word data for writing.
						case com_code is
						  when "00" =>
						-- read
						    q_w_count <= v_8_1;
						-- This will cause only the address word
						-- to be written to the data fifo.
						  when "01" =>
						-- write
						    q_w_count <= q_w_count + v_8_1;
						-- watch out for overflow
						-- writes the starting address first plus the
						-- data
						  when "10" =>
						-- burst start
						    q_w_count <= v_8_1;
						-- This will cause only the address word
						-- to be written to the data fifo.
						  when "11" =>
						-- burst stop
						    q_w_count <= v_8_1;
						-- This will cause only the address word
						-- to be written to the data fifo.
						  when others =>
						    q_w_count <= v_8_1;
						end case;
					when S3_S7 =>
						Sreg0 <= S3_S8;
						data_fifo_q_w_data(39 downto 32) <= gec_user_rx_data_out;
					when S3_S8 =>
						Sreg0 <= S3_S9;
						data_fifo_q_w_data(31 downto 24) <= gec_user_rx_data_out;
					when S3_S9 =>
						Sreg0 <= S3_S10;
						data_fifo_q_w_data(23 downto 16) <= gec_user_rx_data_out;
					when S3_S10 =>
						Sreg0 <= S3_S11;
						data_fifo_q_w_data(15 downto 8) <= gec_user_rx_data_out;
					when S3_S11 =>
						Sreg0 <= S3_S12;
						data_fifo_wren_sig <= '1';
						-- write the assembled data to the FIFO
						data_fifo_q_w_data(7 downto 0) <= gec_user_rx_data_out;
					when S3_S12 =>
						if q_w_counter < q_w_count then
							Sreg0 <= S3_S5;
							data_fifo_q_w_data(63 downto 56) <= gec_user_rx_data_out;
							data_fifo_wren_sig <= '0';
							-- Finish the write to the data fifo
							q_w_counter <= q_w_counter + v_8_1;
							-- increment the counter
						elsif q_w_counter = q_w_count then
							Sreg0 <= check_crc;
							data_fifo_wren_sig <= '0';
							-- finish data FIFO write
							if (gec_user_crc_err = '1') then
							  crc_err_reg <= '1';
							end if;
							crc_loop_count <= crc_loop_count + v_5_1;
							-- increment loop counter for catching CRC errors
						end if;
					when S3_S6 =>
						Sreg0 <= S3_S7;
						data_fifo_q_w_data(47 downto 40) <= gec_user_rx_data_out;
					when S3_S5 =>
						Sreg0 <= S3_S6;
						data_fifo_q_w_data(55 downto 48) <= gec_user_rx_data_out;
--vhdl_cover_off
					when others =>
						null;
--vhdl_cover_on
				end case;
			end if;
		end if;
	end if;
end process;

end GEC_RX_CTL;
