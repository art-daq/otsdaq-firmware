-------------------------------------------------------------------------------
--
-- Title       : RAM_COMM_DEC_1
-- Design      : CAPTAN
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : u:\CAPTAN\Data_Conversion_Board\CAPTAN\CAPTAN\compile\RAM_COMM_DEC_1.vhd
-- Generated   : 06/18/08 10:25:40
-- From        : u:/CAPTAN/Data_Conversion_Board/CAPTAN/CAPTAN/src/RAM_COMM_DEC_1.asf
-- By          : FSM2VHDL ver. 5.0.0.9
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
use params_package.all;

entity ram_comm_dec_1 is 
	port (
		block_en: in STD_LOGIC;
		burst_done: in STD_LOGIC;
		clock: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		rx_data_fifo_rd_data: in STD_LOGIC_VECTOR (63 downto 0);
		rx_info_fifo_empty: in STD_LOGIC;
		rx_info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		tx_info_fifo_full: in STD_LOGIC;
		burst_start: out STD_LOGIC;
		burst_stop: out STD_LOGIC;
		ram_addr: out STD_LOGIC_VECTOR (63 downto 0);
		ram_data_in: out STD_LOGIC_VECTOR (63 downto 0);
		ram_en: out STD_LOGIC;
		ram_wren: out STD_LOGIC;
		rx_data_fifo_rden: out STD_LOGIC;
		rx_info_fifo_rden: out STD_LOGIC;
		tx_data_fifo_src_sel: out STD_LOGIC;
		tx_data_fifo_wren: out STD_LOGIC;
		tx_info_fifo_src_sel: out STD_LOGIC;
		tx_info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		tx_info_fifo_wren: out STD_LOGIC);
end ram_comm_dec_1;

architecture ram_comm_dec_1 of RAM_COMM_DEC_1 is

-- diagram signals declarations
signal burst_active: STD_LOGIC;
signal comm_reg: STD_LOGIC_VECTOR (2 downto 0);
signal crc_err: STD_LOGIC;
signal mem_loc_count_reg: STD_LOGIC_VECTOR (4 downto 0);
signal q_w_count_reg: STD_LOGIC_VECTOR (4 downto 0);
signal ram_addr_reg: STD_LOGIC_VECTOR (63 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    dec_comm, enabled, idle, burst_stp, burst_strt, illegal, return_st, get_comm, write_com_S9, write_com_S8, write_com_S11, write_com_S10,
    read_com_S13, read_com_S14, read_com_S15, read_com_S16
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock)
begin
	if clock'event and clock = '1' then
		if reset_n = '0' then	
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
-- Initialize registers
			comm_reg <= v_3_0;
			q_w_count_reg <= v_5_0;
			mem_loc_count_reg <= v_5_0;
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
			ram_data_in <= v_64_0;
			ram_addr <= v_64_0;
			ram_wren <= '0';
			ram_en <= '0';
			burst_start <= '0';
			burst_stop <= '0';
			rx_info_fifo_rden <= '0';
			rx_data_fifo_rden <= '0';
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when dec_comm =>
					if comm_reg = "011" then	
						Sreg0 <= burst_stp;
					elsif comm_reg(2) = '1' or
						(comm_reg = "000" and burst_active = '1') or
						(comm_reg = "010" and burst_active = '1') then	
						Sreg0 <= illegal;
					elsif comm_reg = "010" and burst_active = '0' then	
						Sreg0 <= burst_strt;
						burst_active <= '1';
						burst_start <= '1';
						-- Point FIFO muxes towards
						-- burst controller
						tx_data_fifo_src_sel <= '1';
						tx_info_fifo_src_sel <= '1';
					elsif comm_reg = "000" and burst_active = '0' then	
						Sreg0 <= read_com_S14;
						rx_data_fifo_rden <= '1';
					elsif comm_reg = "001" then	
						Sreg0 <= write_com_S8;
						rx_data_fifo_rden <= '1';
					end if;
				when enabled =>
					if block_en = '0' then	
						Sreg0 <= idle;
					elsif rx_info_fifo_empty = '1' then	
						Sreg0 <= enabled;
					elsif rx_info_fifo_empty = '0' then	
						Sreg0 <= get_comm;
						rx_info_fifo_rden <= '1';
					end if;
				when idle =>
					if block_en = '1' then	
						Sreg0 <= enabled;
					elsif block_en = '0' then	
						Sreg0 <= idle;
					end if;
				when burst_stp =>
					if burst_done = '0' then	
						Sreg0 <= burst_stp;
					elsif burst_done = '1' then	
						Sreg0 <= return_st;
						burst_active <= '0';
						-- Point FIFO muxes towards
						-- burst controller
						tx_data_fifo_src_sel <= '0';
						tx_info_fifo_src_sel <= '0';
					end if;
				when burst_strt =>
					Sreg0 <= return_st;
					burst_start <= '0';
				when illegal =>
					Sreg0 <= return_st;
				when return_st =>
					if block_en = '0' then	
						Sreg0 <= idle;
					elsif block_en = '1' then	
						Sreg0 <= enabled;
					end if;
				when get_comm =>
					Sreg0 <= dec_comm;
					rx_info_fifo_rden <= '0';
					comm_reg <= rx_info_fifo_rd_data(2 downto 0);
					q_w_count_reg <= rx_info_fifo_rd_data(7 downto 3);
					crc_err <= rx_info_fifo_rd_data(13);
					mem_loc_count_reg <= v_5_0;
				when read_com_S13 =>
					Sreg0 <= read_com_S16;
					ram_addr <= ram_addr_reg;
					ram_addr_reg <= ram_addr_reg + v_64_1;
					mem_loc_count_reg <= mem_loc_count_reg + v_5_1;
				when read_com_S14 =>
					Sreg0 <= read_com_S13;
					rx_data_fifo_rden <= '0';
					ram_addr_reg <= rx_data_fifo_rd_data;
					-- obtain starting address
				when read_com_S15 =>
					Sreg0 <= return_st;
				when read_com_S16 =>
					if mem_loc_count_reg < q_w_count_reg then	
						Sreg0 <= read_com_S16;
						ram_addr <= ram_addr_reg;
						ram_addr_reg <= ram_addr_reg + v_64_1;
						if (crc_err = '0') then
						  tx_data_fifo_wren <= '1';
						  ram_en <= '1';
						else
						  tx_data_fifo_wren <= '0';
						  ram_en <= '0';
						end if;
						mem_loc_count_reg <= mem_loc_count_reg + v_5_1;
					elsif mem_loc_count_reg = q_w_count_reg then	
						Sreg0 <= read_com_S15;
						ram_en <= '0';
						mem_loc_count_reg <= v_5_0;
						tx_data_fifo_wren <= '0';
						-- need to write code to
						-- tx_info_fifo
						tx_info_fifo_wr_data(7 downto 0) <= "000" & q_w_count_reg;
						tx_info_fifo_wr_data(15 downto 8) <= "00000" & comm_reg;
					end if;
				when write_com_S9 =>
					Sreg0 <= write_com_S10;
					ram_addr <= ram_addr_reg;
					ram_addr_reg <= ram_addr_reg + v_64_1;
					mem_loc_count_reg <= mem_loc_count_reg + v_5_1;
				when write_com_S8 =>
					Sreg0 <= write_com_S9;
					rx_data_fifo_rden <= '0';
					ram_addr_reg <= rx_data_fifo_rd_data;
					-- starting address
				when write_com_S11 =>
					Sreg0 <= return_st;
				when write_com_S10 =>
					if mem_loc_count_reg < q_w_count_reg then	
						Sreg0 <= write_com_S10;
						ram_addr <= ram_addr_reg;
						ram_addr_reg <= ram_addr_reg + v_64_1;
						if (crc_err = '0') then
						-- empty FIFO only
						  ram_wren <= '1';
						  ram_en <= '1';
						else
						  ram_wren <= '0';
						  ram_en <= '0';
						end if;
						rx_data_fifo_rden <= '1';
						mem_loc_count_reg <= mem_loc_count_reg + v_5_1;
					elsif mem_loc_count_reg = q_w_count_reg then	
						Sreg0 <= write_com_S11;
						ram_wren <= '0';
						ram_en <= '0';
						mem_loc_count_reg <= v_5_0;
					end if;
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end RAM_COMM_DEC_1;
