component reg_32
	port (
		clk: in STD_LOGIC;
		d: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		wr_en: in STD_LOGIC;
		q: out STD_LOGIC_VECTOR (31 downto 0));
end component;


instance_name : reg_32
( clk => ,
  d => ,
  q => ,
  reset_p => ,
  wr_en => );
