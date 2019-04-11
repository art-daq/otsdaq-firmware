component clkd_burst_mux_8_to_1
	port (
		burst_in: in STD_LOGIC_VECTOR (7 downto 0);
		burst_mux_sel: in STD_LOGIC_VECTOR (2 downto 0);
		clk0: in STD_LOGIC;
		rstp: in STD_LOGIC;
		sig0: in STD_LOGIC_VECTOR (63 downto 0);
		sig1: in STD_LOGIC_VECTOR (63 downto 0);
		sig2: in STD_LOGIC_VECTOR (63 downto 0);
		sig3: in STD_LOGIC_VECTOR (63 downto 0);
		sig4: in STD_LOGIC_VECTOR (63 downto 0);
		sig5: in STD_LOGIC_VECTOR (63 downto 0);
		sig6: in STD_LOGIC_VECTOR (63 downto 0);
		sig7: in STD_LOGIC_VECTOR (63 downto 0);
		b_read_out: out STD_LOGIC_VECTOR (63 downto 0);
		b_wr_out: out STD_LOGIC);
end component;


instance_name : clkd_burst_mux_8_to_1
( b_read_out => ,
 b_wr_out => ,
 burst_in => ,
 burst_mux_sel => ,
 clk0 => ,
 rstp => ,
 sig0 => ,
 sig1 => ,
 sig2 => ,
 sig3 => ,
 sig4 => ,
 sig5 => ,
 sig6 => ,
 sig7 => );
