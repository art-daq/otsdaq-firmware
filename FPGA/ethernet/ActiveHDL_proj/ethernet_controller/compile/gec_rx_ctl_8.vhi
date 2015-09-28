component GEC_RX_CTL_8
	port (
		block_en: in STD_LOGIC;
		clock: in STD_LOGIC;
		data_fifo_full: in STD_LOGIC;
		four_bit_mode: in STD_LOGIC;
		gec_user_crc_err: in STD_LOGIC;
		gec_user_rx_data_out: in STD_LOGIC_VECTOR (7 downto 0);
		gec_user_rx_size_out: in STD_LOGIC_VECTOR (10 downto 0);
		gec_user_rx_valid_out: in STD_LOGIC;
		reset_n: in STD_LOGIC;
		crc_err_flag: out STD_LOGIC;
		data_fifo_q_w_data: out STD_LOGIC_VECTOR (63 downto 0);
		data_fifo_wren: out STD_LOGIC;
		info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		info_fifo_wren: out STD_LOGIC;
		state_diag: out STD_LOGIC_VECTOR (3 downto 0));
end component;


instance_name : GEC_RX_CTL_8
( block_en => ,
 clock => ,
 crc_err_flag => ,
 data_fifo_full => ,
 data_fifo_q_w_data => ,
 data_fifo_wren => ,
 four_bit_mode => ,
 gec_user_crc_err => ,
 gec_user_rx_data_out => ,
 gec_user_rx_size_out => ,
 gec_user_rx_valid_out => ,
 info_fifo_wr_data => ,
 info_fifo_wren => ,
 reset_n => ,
 state_diag => );
