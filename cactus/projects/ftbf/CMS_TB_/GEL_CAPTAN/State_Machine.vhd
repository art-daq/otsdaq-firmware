-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : PsiDecoder
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\rrivera\Desktop\TB FW\PsiDecoder_\PsiDecoder\compile\State_Machine.vhd
-- Generated   : 09/30/11 09:48:44
-- From        : C:\Users\rrivera\Desktop\TB FW\PsiDecoder_\PsiDecoder\src\State_Machine.asf
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

use PsiDecoderParameters.all;

entity State_Machine is 
	port (
		clk_en: in STD_LOGIC;
		evt_num: in STD_LOGIC_VECTOR (19 downto 0);
		MASTER_CLOCK: in STD_LOGIC;
		next_chip: in STD_LOGIC;
		output_status: in STD_LOGIC;
		raw_data: in STD_LOGIC_VECTOR (adc_bits_P-1 downto 0);
		RESET: in STD_LOGIC;
		TOKEN_IN: in STD_LOGIC;
		TOKEN_OUT: in STD_LOGIC;
		translated_levels: in STD_LOGIC_VECTOR (2 downto 0);
		at_chip_zero: out STD_LOGIC;
		at_start_state: out STD_LOGIC;
		chip_id_rd: out STD_LOGIC_VECTOR (chip_id_bits_P-1 downto 0);
		DATA_OUT: out STD_LOGIC_VECTOR (pulse_height_bits_P+chip_id_bits_P+13-1 downto 0);
		DATA_OUT_WR: out STD_LOGIC;
		debug_curr_state: out STD_LOGIC_VECTOR (8 downto 0);
		error_reset_out: out STD_LOGIC;
		evt_num_latch: out STD_LOGIC_VECTOR (19 downto 0));
end State_Machine;

architecture State_Machine of State_Machine is

-- diagram signals declarations
signal chip_id_sig: STD_LOGIC_VECTOR (chip_id_bits_P-1 downto 0);
signal col_calc: INTEGER range 127 downto 0;
signal decoded_data: STD_LOGIC_VECTOR (pulse_height_bits_P+chip_id_bits_P+13-1 downto 0);
signal error_sig: STD_LOGIC;
signal old_col: STD_LOGIC_VECTOR (5 downto 0);
signal old_row: STD_LOGIC_VECTOR (6 downto 0);
signal old_trans_level: STD_LOGIC_VECTOR (2 downto 0);
signal repeat_counter: INTEGER range 15 downto 0;
signal repeat_error_reset: STD_LOGIC;
signal repeat_pixel: STD_LOGIC;
signal row_calc: INTEGER range 255 downto 0;
signal sel_status_data: STD_LOGIC;
signal special_token: STD_LOGIC;
signal special_token_in: STD_LOGIC;
signal status_data: STD_LOGIC_VECTOR (pulse_height_bits_P+chip_id_bits_P+13-1 downto 0);
signal status_send: STD_LOGIC;
signal status_send_old: STD_LOGIC;
signal tokout_error_reset: STD_LOGIC;

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    COL0, PH, BLACK, COL1, ROW0, ROW1, ROW2, ULTRABLACK, LAST_DAC, START, TOKEN_SENT
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin

-- concurrent signals assignments

-- diagram ACTION
debug_curr_state(3) <= special_token;
debug_curr_state(4) <= next_chip;
debug_curr_state(7 downto 5) <= translated_levels;
debug_curr_state(8) <= error_sig;
chip_id_rd <= chip_id_sig;
DATA_OUT <= decoded_data when sel_status_data = '0' else status_data;
-- high bit...........  low bit
-- chipid | row(7) | col(6) | pulseheight
-- status: 0 - std error, 1 - repeat error,
process(MASTER_CLOCK)
begin
 	if rising_edge(MASTER_CLOCK) then
--handle special token out
		if RESET = '1' or Sreg0 = START or Sreg0 = TOKEN_SENT then
		 	special_token <= '0';
		else
			if TOKEN_OUT = '1' then
				special_token <= '1';
			end if;
		end if;
--handle special token in
		if TOKEN_IN = '1' then
			special_token_in <= '1';
		elsif Sreg0 = TOKEN_SENT then  --note: specTokin only matters in START state
			special_token_in <= '0';
			-- reset token in for next token
		end if;
--create one clock width write pulse
		if Sreg0 = START then
			status_send <= output_status;
			--'0';
			--'1';
			-- Set to 1 when status data needed!
		else
			status_send <= '0';
		end if;
		status_send_old <= status_send;
		sel_status_data <= '0';
		DATA_OUT_WR <= '0';
		if Sreg0 = ROW2 and clk_en = '1' then -- normal hit data
			DATA_OUT_WR <= '1';
		elsif status_send_old = '0' and status_send = '1' and RESET = '0' then -- status data
			DATA_OUT_WR <= '1';
			sel_status_data <= '1';
		end if;
	end if;
end process;
-- catch repeat error case, if token out is lost it will occur
process(MASTER_CLOCK)
begin
	if rising_edge(MASTER_CLOCK) then
		if RESET = '1' or Sreg0 = START then
			repeat_counter <= 0;
			tokout_error_reset <= '0';
			old_trans_level <= "000";
		elsif clk_en = '1' then
			old_trans_level <= translated_levels;
			if repeat_counter >= 14 then
				repeat_counter <= 0;
				tokout_error_reset <= '1';
			elsif old_trans_level = translated_levels then
 				repeat_counter <= repeat_counter + 1;
			else
				repeat_counter <= 0;
			end if;
		end if;
	end if;
end process;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (MASTER_CLOCK)
begin
	if MASTER_CLOCK'event and MASTER_CLOCK = '1' then
		if RESET='1' or tokout_error_reset = '1' or repeat_error_reset = '1' or error_sig = '1' then	
			Sreg0 <= START;
			-- Set default values for outputs, signals and variables
			-- ...
			decoded_data <= (others => '0');
			evt_num_latch <= (others => '1');
			at_start_state <= '1';
			chip_id_sig <= (others => '0');
			at_chip_zero <= '1';
			debug_curr_state(2 downto 0) <= "000";
			status_data <= (0 => error_sig, 1 => tokout_error_reset, 2 => repeat_error_reset, others => '1');
			error_sig <= '0';
			repeat_error_reset <= '0';
			error_reset_out <= repeat_error_reset or tokout_error_reset or error_sig;
			-- super error reset!! (reset token stack and plaquette)
		else
			if clk_en = '1' then
				-- Set default values for outputs, signals and variables
				-- ...
				case Sreg0 is
					when COL0 =>
						Sreg0 <= COL1;
						if translated_levels > 0 and translated_levels < 7 then
							col_calc <= col_calc + conv_integer(translated_levels)-1;
						else
							error_sig <= '1';
						end if;
						debug_curr_state(2 downto 0) <= "100";
					when PH =>
						if next_chip='1' then	
							Sreg0 <= ULTRABLACK;
							chip_id_sig <= chip_id_sig+1;
							debug_curr_state(2 downto 0) <= "110";
						elsif special_token='1' then	
							Sreg0 <= START;
							chip_id_sig <= (others => '0');
							at_chip_zero <= '1';
							debug_curr_state(2 downto 0) <= "000";
							status_data <= (0 => error_sig, 1 => tokout_error_reset, 2 => repeat_error_reset, others => '1');
							error_sig <= '0';
							repeat_error_reset <= '0';
							error_reset_out <= repeat_error_reset or tokout_error_reset or error_sig;
							-- super error reset!! (reset token stack and plaquette)
						else
							Sreg0 <= COL0;
							if translated_levels > 0 and translated_levels < 7 then
								col_calc <= power1_lut(conv_integer(translated_levels)-1);
							else
								error_sig <= '1';
							end if;
							if old_row = decoded_data(pulse_height_bits_P+12 downto pulse_height_bits_P+6) and
							   old_col = decoded_data(pulse_height_bits_P+5 downto pulse_height_bits_P)	 then
								repeat_pixel <= '1';
								if repeat_pixel = '1' then				  -- same pixel has occured 3 times
									repeat_error_reset <= '1';
								end if;
							else
								repeat_pixel <= '0';
							end if;
							debug_curr_state(2 downto 0) <= "011";
						end if;
					when BLACK =>
						Sreg0 <= LAST_DAC;
						debug_curr_state(2 downto 0) <= "010";
					when COL1 =>
						Sreg0 <= ROW0;
						if translated_levels > 0 and translated_levels < 7 then
							row_calc <= power2_lut(conv_integer(translated_levels)-1);
						else
							error_sig <= '1';
						end if;
						debug_curr_state(2 downto 0) <= "101";
					when ROW0 =>
						Sreg0 <= ROW1;
						if translated_levels > 0 and translated_levels < 7 then
							row_calc <= row_calc + power1_lut(conv_integer(translated_levels)-1);
						else
							error_sig <= '1';
						end if;
						debug_curr_state(2 downto 0) <= "110";
					when ROW1 =>
						Sreg0 <= ROW2;
						if translated_levels > 0 and translated_levels < 7 then
							row_calc <= row_calc + (conv_integer(translated_levels)-1);
						else
							error_sig <= '1';
						end if;
						decoded_data(pulse_height_bits_P + 5 downto pulse_height_bits_P+1) <= conv_std_logic_vector(col_calc,5);
						old_col <= decoded_data(pulse_height_bits_P + 5 downto pulse_height_bits_P);
						-- save previous column value
						debug_curr_state(2 downto 0) <= "111";
					when ROW2 =>
						Sreg0 <= PH;
						decoded_data(pulse_height_bits_P-1 downto 0) <= raw_data(adc_bits_P-1 downto adc_bits_P-pulse_height_bits_P);
						decoded_data(pulse_height_bits_P) <= conv_std_logic_vector(row_calc,8)(0);
						decoded_data(pulse_height_bits_P+12 downto pulse_height_bits_P+6) <= conv_std_logic_vector(80-(row_calc/2),7);
						decoded_data(pulse_height_bits_P+17 downto pulse_height_bits_P+13) <= chip_id_sig-1;
						old_row <= decoded_data(pulse_height_bits_P+12 downto pulse_height_bits_P+6);
						-- save previous row value
					when ULTRABLACK =>
						Sreg0 <= BLACK;
					when LAST_DAC =>
						if next_chip='1' then	
							Sreg0 <= ULTRABLACK;
							chip_id_sig <= chip_id_sig+1;
							debug_curr_state(2 downto 0) <= "110";
						elsif special_token='1' then	
							Sreg0 <= START;
							chip_id_sig <= (others => '0');
							at_chip_zero <= '1';
							debug_curr_state(2 downto 0) <= "000";
							status_data <= (0 => error_sig, 1 => tokout_error_reset, 2 => repeat_error_reset, others => '1');
							error_sig <= '0';
							repeat_error_reset <= '0';
							error_reset_out <= repeat_error_reset or tokout_error_reset or error_sig;
							-- super error reset!! (reset token stack and plaquette)
						else
							Sreg0 <= COL0;
							if translated_levels > 0 and translated_levels < 7 then
								col_calc <= power1_lut(conv_integer(translated_levels)-1);
							else
								error_sig <= '1';
							end if;
							repeat_pixel <= '0';
							old_row <= (others => '0');
							old_col <= (others => '0');
							debug_curr_state(2 downto 0) <= "011";
						end if;
					when START =>
						at_start_state <= '1';
						if special_token_in = '1' then	
							Sreg0 <= TOKEN_SENT;
							debug_curr_state(2 downto 0) <= "001";
							at_start_state <= '0';
							error_reset_out <= '0';
							--reset error
							evt_num_latch <= evt_num;
							-- latch for state machine domain
						end if;
					when TOKEN_SENT =>
						if translated_levels = 0 then	
							Sreg0 <= ULTRABLACK;
							chip_id_sig <= chip_id_sig+1;
							-- always read ahead
							at_chip_zero <= '0';
							-- release hold on chip zero
							debug_curr_state(2 downto 0) <= "110";
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

end State_Machine;
