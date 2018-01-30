component DAC_Control
	port (
		blk_data_in: in STD_LOGIC_VECTOR (15 downto 0);
		clock: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		wr_blk_p: in STD_LOGIC;
		wr_dac_p: in STD_LOGIC;
		dac_out: out STD_LOGIC;
		sclk: out STD_LOGIC;
		sync: out STD_LOGIC;
		wr_error: out STD_LOGIC);
end component;


instance_name : DAC_Control
( blk_data_in => ,
  clock => ,
  dac_out => ,
  reset_p => ,
  sclk => ,
  sync => ,
  wr_blk_p => ,
  wr_dac_p => ,
  wr_error => );
