-------------------------------------------------------------------------------
--
-- Title       : GEC_TX_SEQ_CTL_8
-- Design      : ethernet_controller
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : D:\Projects\OtS DAQ\PicoZed\ActiveHDL_proj\ethernet_controller\compile\GEC_TX_SEQ_CTL_8.vhd
-- Generated   : 08/14/15 14:30:13
-- From        : D:/Projects/OtS DAQ/PicoZed/ActiveHDL_proj/ethernet_controller/src/GEC_TX_SEQ_CTL_8.asf
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

entity GEC_TX_SEQ_CTL_8 is 
	port (
		block_en: in STD_LOGIC;
		clk: in STD_LOGIC;
		data_fifo_empty: in STD_LOGIC;
		data_fifo_rd_data: in STD_LOGIC_VECTOR (63 downto 0);
		data_fifo_rderr: in STD_LOGIC;
		delay_count: in STD_LOGIC;
		four_bit_mode: in STD_LOGIC;
		gec_user_busy: in STD_LOGIC;
		gec_user_tx_enable_out: in STD_LOGIC;
		info_fifo_empty: in STD_LOGIC;
		info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		info_fifo_rderr: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		clear_delay_count: out STD_LOGIC;
		data_fifo_rden: out STD_LOGIC;
		data_fifo_rden_en: out STD_LOGIC;
		gec_user_trigger: out STD_LOGIC;
		gec_user_tx_data_in: out STD_LOGIC_VECTOR (7 downto 0);
		gec_user_tx_size_in: out STD_LOGIC_VECTOR (10 downto 0);
		info_fifo_rden: out STD_LOGIC;
		start_delay_count: out STD_LOGIC;
		state_diag: out STD_LOGIC_VECTOR (3 downto 0));
end GEC_TX_SEQ_CTL_8;

architecture GEC_TX_SEQ_CTL_8 of GEC_TX_SEQ_CTL_8 is

-- diagram signals declarations
signal byte_count: STD_LOGIC_VECTOR (2 downto 0);
signal clken: STD_LOGIC;
signal data_fifo_rd_data_reg: STD_LOGIC_VECTOR (63 downto 0);
signal data_fifo_rden_sig: STD_LOGIC;
signal info_fifo_rden_sig: STD_LOGIC;
signal q_w_count: STD_LOGIC_VECTOR (7 downto 0);
signal seq_count: STD_LOGIC_VECTOR (7 downto 0);
signal tx_data_count: STD_LOGIC_VECTOR (10 downto 0);

-- BINARY ENCODED state machine: Sreg0
attribute ENUM_ENCODING: string;
type Sreg0_type is (
    idle, enabled, chk_busy, txmtdone, data_rdy_read_Ififo, trgrd, data_rdy_savecount, txmt_xmiting, S1, S2, txmt_S3, S4, S5
);
attribute ENUM_ENCODING of Sreg0_type: type is
	"0000 " &		-- idle
	"0001 " &		-- enabled
	"0010 " &		-- chk_busy
	"0011 " &		-- txmtdone
	"0100 " &		-- data_rdy_read_Ififo
	"0101 " &		-- trgrd
	"0110 " &		-- data_rdy_savecount
	"0111 " &		-- txmt_xmiting
	"1000 " &		-- S1
	"1001 " &		-- S2
	"1010 " &		-- txmt_S3
	"1011 " &		-- S4
	"1100" ;		-- S5

signal Sreg0: Sreg0_type;

attribute STATE_VECTOR: string;
attribute STATE_VECTOR of GEC_TX_SEQ_CTL_8: architecture is "Sreg0";

begin

-- concurrent signals assignments

-- Diagram ACTION
state_diag <= CONV_STD_LOGIC_VECTOR(Sreg0_type'POS(Sreg0),4);
info_fifo_rden <= info_fifo_rden_sig and clken;
data_fifo_rden <= data_fifo_rden_sig and clken;
four_bit_proc : process (clk) -- make trigger sig a single clock width pulse
begin
	if rising_edge(clk) then
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
Sreg0_machine: process (clk)
begin
	if clk'event and clk = '1' then
		if reset_n = '0' then
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
			gec_user_trigger <= '0';
			gec_user_tx_size_in <= v_11_0;
			q_w_count <= v_8_0;
			tx_data_count <= v_11_0;
			info_fifo_rden_sig <= '0';
			data_fifo_rden_sig <= '0';
			data_fifo_rden_en <= '0';
			data_fifo_rd_data_reg <= v_64_0;
			byte_count <= "000";
			start_delay_count <= '0';
			clear_delay_count <= '0';
		else
			if clken = '1' then
				-- Set default values for outputs, signals and variables
				-- ...
				case Sreg0 is
					when idle =>
						if block_en = '0' then
							Sreg0 <= idle;
						elsif block_en = '1' then
							Sreg0 <= enabled;
						end if;
					when enabled =>
						if block_en = '0' then
							Sreg0 <= idle;
						elsif (info_fifo_empty = '0' and block_en = '1') and
							delay_count = '0' then	-- FIFO has an entry and no more delay needed
							Sreg0 <= data_rdy_read_Ififo;
							clear_delay_count <= '1';
							info_fifo_rden_sig <= '1';
							-- Read the info word
							byte_count <= "000";
						elsif (info_fifo_empty = '1' and block_en = '1') or
							delay_count = '1' then	-- FIFO is  empty or delay not complete
							Sreg0 <= enabled;
						end if;
					when chk_busy =>
						if gec_user_busy = '0' then
							Sreg0 <= trgrd;
							gec_user_trigger <= '1';
							-- GEC not busy
							-- assert trigger to GEC
							if (tx_data_count /= v_11_2) then
							  data_fifo_rd_data_reg <= data_fifo_rd_data;
							-- prepare first quad word if there is one
							end if;
						elsif gec_user_busy = '1' then
							Sreg0 <= chk_busy;
							data_fifo_rden_sig <= '0';
							-- finished reading quad word fifo for first quad word
						end if;
					when txmtdone =>
						if block_en = '1' then
							Sreg0 <= enabled;
						elsif block_en = '0' then
							Sreg0 <= idle;
						end if;
					when trgrd =>
						if gec_user_tx_enable_out = '1' then
							Sreg0 <= S5;
							gec_user_tx_data_in <= seq_count;
						elsif gec_user_tx_enable_out = '0' then	-- wait for enable tx reply
							Sreg0 <= trgrd;
						end if;
					when S1 =>
						Sreg0 <= S2;
						tx_data_count <= tx_data_count + v_11_2;
						-- add return code byte to
						-- produce the final number of bytes
						-- add sequence counter byte also
						start_delay_count <= '1';
					when S2 =>
						Sreg0 <= S4;
						gec_user_tx_size_in <= tx_data_count;
						-- present byte count to GEC
						if (tx_data_count /= v_11_2) then
						-- read a quad word for initialization
						  data_fifo_rden_en <= '1';
						  data_fifo_rden_sig <= '1';
						end if;
					when S4 =>
						Sreg0 <= chk_busy;
						data_fifo_rden_sig <= '0';
						start_delay_count <= '0';
					when S5 =>
						Sreg0 <= txmt_xmiting;
						if (tx_data_count = v_11_2) then
						  data_fifo_rden_en <= '0';
						-- turn off FIFO accesses early
						-- only one byte is requested and
						-- it has been preloaded (this should
						-- not happen in loopback tests
						else
						-- update the data presented to the GEC
						    gec_user_tx_data_in <= data_fifo_rd_data(63 downto 56);
						-- increment the byte count
						    byte_count <= "001";
						end if;
						-- decrement count of bytes;
						-- user_tx_enable_out from the GEC is
						-- enabling read operations on the data
						-- FIFO
					when data_rdy_read_Ififo =>
						Sreg0 <= data_rdy_savecount;
						info_fifo_rden_sig <= '0';
						-- terminate info word read
						clear_delay_count <= '0';
					when data_rdy_savecount =>
						Sreg0 <= S1;
						q_w_count <= info_fifo_rd_data(15 downto 8);
						-- get number of quad words
						gec_user_tx_data_in <= info_fifo_rd_data(7 downto 0);
						-- assert the return code to the GEC
						-- when Ryan's enable out signal goes high
						-- the return code is there already
						tx_data_count <= info_fifo_rd_data(15 downto 8) & "000";
						-- compute number of bytes in quad words to be returned to PC
						-- multiplies quad word count by 8
						data_fifo_rden_sig <= '0';
						-- terminate first data word read
					when txmt_xmiting =>
						if tx_data_count = v_11_2 then
							Sreg0 <= txmt_S3;
							gec_user_trigger <= '0';
							gec_user_tx_size_in <= v_11_0;
							tx_data_count <= v_11_0;
							info_fifo_rden_sig <= '0';
							data_fifo_rden_sig <= '0';
							data_fifo_rden_en <= '0';
						elsif q_w_count /= v_8_0 then
							Sreg0 <= txmt_xmiting;
							case byte_count is
							    when "000" =>
							      byte_count <= byte_count + v_3_1;
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(63 downto 56);
							    when "001" =>
							      byte_count <= byte_count + v_3_1;
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(55 downto 48);
							    when "010" =>
							      byte_count <= byte_count + v_3_1;
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(47 downto 40);
							-- Read a new data quad word with plenty of time to spare
							-- Jefferson did this to compensate for commenting
							--out the action done when q_w_count =v_5_1
							       if (q_w_count > v_5_1)then
							          data_fifo_rden_sig <= '1';
							       end if;
							    when "011" =>
							      byte_count <= byte_count + v_3_1;
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(39 downto 32);
							-- Finish read a new data quad word with plenty of time to spare
							      data_fifo_rden_sig <= '0';
							    when "100" =>
							      byte_count <= byte_count + v_3_1;
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(31 downto 24);
							-- at this point, the data_fifo_rd_data lines have the
							-- next quad word sitting on them
							    when "101" =>
							      byte_count <= byte_count + v_3_1;
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(23 downto 16);
							    when "110" =>
							      byte_count <= byte_count + v_3_1;
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(15 downto 8);
							    when "111" =>
							      byte_count <= "000";
							      gec_user_tx_data_in <= data_fifo_rd_data_reg(7 downto 0);
							-- read another quad word
								  data_fifo_rd_data_reg <= data_fifo_rd_data;
							-- we latch the data into the internal register
							-- data_fifo_rd_data_reg
							       q_w_count <= q_w_count - v_5_1;
							-- decrement the quad word count after we process the 8 bytes
							-- in a quad word
							    when others =>
							      byte_count <= "000";
							--null;
							end case;
						elsif q_w_count = v_8_0 then
							Sreg0 <= txmt_S3;
							gec_user_trigger <= '0';
							gec_user_tx_size_in <= v_11_0;
							tx_data_count <= v_11_0;
							info_fifo_rden_sig <= '0';
							data_fifo_rden_sig <= '0';
							data_fifo_rden_en <= '0';
							--Jefferson commented this out because it caused only
							-- the first case (when "000") was being run
							-- I think it is because this is not a loop
							--case byte_count is
							--  when "000" =>
							--    byte_count <= byte_count + v_3_1;
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(7 downto 0);
							--  when "001" =>
							--    byte_count <= byte_count + v_3_1;
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(15 downto 8);
							--  when "010" =>
							--    byte_count <= byte_count + v_3_1;
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(23 downto 16);
							---- Read a new data quad word with plenty of time to spare
							----    data_fifo_rden_sig <= '1';
							--  when "011" =>
							--    byte_count <= byte_count + v_3_1;
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(31 downto 24);
							---- Finish read a new data quad word with plenty of time to spare
							--    data_fifo_rden_sig <= '0';
							--  when "100" =>
							--    byte_count <= byte_count + v_3_1;
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(39 downto 32);
							---- at this point, the data_fifo_rd_data lines have the
							---- next quad word sitting on them
							--  when "101" =>
							--    byte_count <= byte_count + v_3_1;
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(47 downto 40);
							--  when "110" =>
							--    byte_count <= byte_count + v_3_1;
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(55 downto 48);
							--  when "111" =>
							--    byte_count <= "000";
							--    gec_user_tx_data_in <= data_fifo_rd_data_reg(63 downto 56);
							---- read another quad word
							----	data_fifo_rd_data_reg <= data_fifo_rd_data;
							---- we latch the data into the internal register
							---- data_fifo_rd_data_reg
							----   q_w_count <= q_w_count - v_5_1;
							---- decrement the quad word count after we process the 8 bytes
							---- in a quad word
							--  when others =>
							--    byte_count <= "000";
							--    --null;
							--end case;
							--
						end if;
					when txmt_S3 =>
						Sreg0 <= txmtdone;
						gec_user_trigger <= '0';
						gec_user_tx_size_in <= v_11_0;
						tx_data_count <= v_11_0;
						info_fifo_rden_sig <= '0';
						data_fifo_rden_sig <= '0';
						data_fifo_rden_en <= '0';
						gec_user_trigger <= '0';
						gec_user_tx_size_in <= v_11_0;
						tx_data_count <= v_11_0;
						info_fifo_rden_sig <= '0';
						data_fifo_rden_sig <= '0';
						data_fifo_rden_en <= '0';
						if (seq_count = v_8_255) then
						  seq_count <= v_8_0;
						else
						  seq_count <= seq_count + v_8_1;
						end if;
--vhdl_cover_off
					when others =>
						null;
--vhdl_cover_on
				end case;
			end if;
		end if;
	end if;
end process;

end GEC_TX_SEQ_CTL_8;
