component presecaler_count
	port (
		clk: in STD_LOGIC;
		count_in: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		ct_lsb: out STD_LOGIC;
		prescale_block_n: out STD_LOGIC);
end component;


instance_name : presecaler_count
( clk => ,
  count_in => ,
  ct_lsb => ,
  prescale_block_n => ,
  reset_p => );
