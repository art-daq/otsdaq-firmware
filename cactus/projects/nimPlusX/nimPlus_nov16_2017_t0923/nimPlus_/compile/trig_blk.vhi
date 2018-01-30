component trig_blk
	port (
		clk: in STD_LOGIC;
		dlay: in STD_LOGIC_VECTOR (7 downto 0);
		oe: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		s_in: in STD_LOGIC;
		wdth: in STD_LOGIC_VECTOR (7 downto 0);
		wr_blk: in STD_LOGIC;
		busy_n: out STD_LOGIC;
		s_out: out STD_LOGIC);
end component;


instance_name : trig_blk
( busy_n => ,
  clk => ,
  dlay => ,
  oe => ,
  reset_p => ,
  s_in => ,
  s_out => ,
  wdth => ,
  wr_blk => );
