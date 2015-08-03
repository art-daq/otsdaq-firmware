component RAM_COMM_DEC_9
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
end component;


instance_name : RAM_COMM_DEC_9
( block_en => ,
 burst_done => ,
 burst_start => ,
 burst_stop => ,
 clock => ,
 ram_addr => ,
 ram_en => ,
 ram_wren => ,
 reset_n => ,
 rx_data_fifo_rd_data => ,
 rx_data_fifo_rden => ,
 Rx_FIFO_Reset => ,
 rx_info_fifo_empty => ,
 rx_info_fifo_rd_data => ,
 rx_info_fifo_rden => ,
 state_diag => ,
 tx_data_fifo_src_sel => ,
 tx_data_fifo_wren => ,
 Tx_FIFO_Reset => ,
 tx_info_fifo_full => ,
 tx_info_fifo_src_sel => ,
 tx_info_fifo_wr_data => ,
 tx_info_fifo_wren => );
