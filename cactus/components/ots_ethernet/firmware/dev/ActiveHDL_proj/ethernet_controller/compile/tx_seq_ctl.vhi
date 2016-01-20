component tx_seq_ctl
	port (
		clk: in STD_LOGIC;
		ctrl_info_fifo_empty: in STD_LOGIC;
		data_fifo_empty: in STD_LOGIC;
		data_fifo_rd_data: in STD_LOGIC_VECTOR (63 downto 0);
		data_info_fifo_empty: in STD_LOGIC;
		dest_busy: in STD_LOGIC;
		four_bit_mode: in STD_LOGIC;
		info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		reset: in STD_LOGIC;
		user_tx_enable_out: in STD_LOGIC;
		data_fifo_rden: out STD_LOGIC;
		fifo_sel: out STD_LOGIC;
		info_fifo_rden: out STD_LOGIC;
		tx_data: out STD_LOGIC_VECTOR (7 downto 0);
		user_trigger: out STD_LOGIC;
		user_tx_size_in: out STD_LOGIC_VECTOR (10 downto 0));
end component;


instance_name : tx_seq_ctl
( clk => ,
 ctrl_info_fifo_empty => ,
 data_fifo_empty => ,
 data_fifo_rd_data => ,
 data_fifo_rden => ,
 data_info_fifo_empty => ,
 dest_busy => ,
 fifo_sel => ,
 four_bit_mode => ,
 info_fifo_rd_data => ,
 info_fifo_rden => ,
 reset => ,
 tx_data => ,
 user_trigger => ,
 user_tx_enable_out => ,
 user_tx_size_in => );
