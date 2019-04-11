component clkd_b_fifo_mux
	port (
		clk0: in STD_LOGIC;
		cwd0: in STD_LOGIC_VECTOR (31 downto 0);
		cwd1: in STD_LOGIC_VECTOR (31 downto 0);
		cwd2: in STD_LOGIC_VECTOR (31 downto 0);
		cwd3: in STD_LOGIC_VECTOR (31 downto 0);
		cwd4: in STD_LOGIC_VECTOR (31 downto 0);
		cwd5: in STD_LOGIC_VECTOR (31 downto 0);
		latched: in STD_LOGIC;
		restp: in STD_LOGIC;
		burst_w_out: out STD_LOGIC;
		out64: out STD_LOGIC_VECTOR (63 downto 0));
end component;


instance_name : clkd_b_fifo_mux
( burst_w_out => ,
 clk0 => ,
 cwd0 => ,
 cwd1 => ,
 cwd2 => ,
 cwd3 => ,
 cwd4 => ,
 cwd5 => ,
 latched => ,
 out64 => ,
 restp => );
