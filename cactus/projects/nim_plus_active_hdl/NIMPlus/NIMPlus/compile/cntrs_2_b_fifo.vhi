component cntrs_2_b_fifo
	port (
		b_fifo_full_p: in STD_LOGIC;
		clk: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		b_wr: out STD_LOGIC;
		fin_wr: out STD_LOGIC;
		latch_sig: out STD_LOGIC;
		mux_dir: out STD_LOGIC_VECTOR (1 downto 0));
end component;


instance_name : cntrs_2_b_fifo
( b_fifo_full_p => ,
 b_wr => ,
 clk => ,
 fin_wr => ,
 latch_sig => ,
 mux_dir => ,
 reset_p => ,
 sig_in => );
