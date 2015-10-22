component GEC_TX_SEQ_CTL
	port (
		clk: in STD_LOGIC;
		data_fifo_empty: in STD_LOGIC;
		data_fifo_rd_data: in STD_LOGIC_VECTOR (63 downto 0);
		delay_count: in STD_LOGIC;
		four_bit_mode: in STD_LOGIC;
		gec_user_busy: in STD_LOGIC;
		gec_user_tx_enable_out: in STD_LOGIC;
		info_fifo_empty: in STD_LOGIC;
		info_fifo_rd_data: in STD_LOGIC_VECTOR (15 downto 0);
		reset: in STD_LOGIC;
		clear_delay_count: out STD_LOGIC;
		data_fifo_rden: out STD_LOGIC;
		data_fifo_rden_en: out STD_LOGIC;
		gec_user_trigger: out STD_LOGIC;
		gec_user_tx_data_in: out STD_LOGIC_VECTOR (7 downto 0);
		gec_user_tx_size_in: out STD_LOGIC_VECTOR (10 downto 0);
		info_fifo_rden: out STD_LOGIC;
		start_delay_count: out STD_LOGIC);
end component;


instance_name : GEC_TX_SEQ_CTL
( clear_delay_count => ,
 clk => ,
 data_fifo_empty => ,
 data_fifo_rd_data => ,
 data_fifo_rden => ,
 data_fifo_rden_en => ,
 delay_count => ,
 four_bit_mode => ,
 gec_user_busy => ,
 gec_user_trigger => ,
 gec_user_tx_data_in => ,
 gec_user_tx_enable_out => ,
 gec_user_tx_size_in => ,
 info_fifo_empty => ,
 info_fifo_rd_data => ,
 info_fifo_rden => ,
 reset => ,
 start_delay_count => );
