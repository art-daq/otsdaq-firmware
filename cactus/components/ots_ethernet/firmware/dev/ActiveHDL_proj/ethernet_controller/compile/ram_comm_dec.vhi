component ram_comm_dec
	port (
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
		clear_crc_err_flag: out STD_LOGIC;
		ram_addr: out STD_LOGIC_VECTOR (63 downto 0);
		ram_rden: out STD_LOGIC;
		ram_wdata: out STD_LOGIC_VECTOR (63 downto 0);
		ram_wren: out STD_LOGIC;
		rx_data_fifo_rden: out STD_LOGIC;
		Rx_FIFO_Reset: out STD_LOGIC;
		rx_info_fifo_rden: out STD_LOGIC;
		tx_data_fifo_wren: out STD_LOGIC;
		Tx_FIFO_Reset: out STD_LOGIC;
		tx_info_fifo_wr_data: out STD_LOGIC_VECTOR (15 downto 0);
		tx_info_fifo_wren: out STD_LOGIC);
end component;


instance_name : ram_comm_dec
( clear_crc_err_flag => ,
 clock => ,
 crc_err_flag => ,
 ram_addr => ,
 ram_rden => ,
 ram_wdata => ,
 ram_wren => ,
 reset => ,
 rx_data_fifo_full => ,
 rx_data_fifo_rd_data => ,
 rx_data_fifo_rden => ,
 Rx_FIFO_Reset => ,
 rx_info_fifo_empty => ,
 rx_info_fifo_full => ,
 rx_info_fifo_rd_data => ,
 rx_info_fifo_rden => ,
 tx_data_fifo_wren => ,
 Tx_FIFO_Reset => ,
 tx_info_fifo_full => ,
 tx_info_fifo_wr_data => ,
 tx_info_fifo_wren => ,
 user_ready => ,
 user_rx_valid_out => );
