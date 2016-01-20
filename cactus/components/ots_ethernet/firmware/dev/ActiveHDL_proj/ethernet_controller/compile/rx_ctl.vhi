component rx_ctl
	port (
		clear_crc_err_flag: in STD_LOGIC;
		clock: in STD_LOGIC;
		four_bit_mode: in STD_LOGIC;
		reset: in STD_LOGIC;
		user_crc_chk: in STD_LOGIC;
		user_crc_err: in STD_LOGIC;
		user_rx_data_out: in STD_LOGIC_VECTOR (7 downto 0);
		user_rx_size_out: in STD_LOGIC_VECTOR (10 downto 0);
		user_rx_valid_out: in STD_LOGIC;
		crc_err_flag: out STD_LOGIC;
		data_fifo_wdata: out STD_LOGIC_VECTOR (63 downto 0);
		data_fifo_wren: out STD_LOGIC;
		info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		info_fifo_wren: out STD_LOGIC);
end component;


instance_name : rx_ctl
( clear_crc_err_flag => ,
 clock => ,
 crc_err_flag => ,
 data_fifo_wdata => ,
 data_fifo_wren => ,
 four_bit_mode => ,
 info_fifo_wr_data => ,
 info_fifo_wren => ,
 reset => ,
 user_crc_chk => ,
 user_crc_err => ,
 user_rx_data_out => ,
 user_rx_size_out => ,
 user_rx_valid_out => );
