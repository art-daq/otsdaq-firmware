component load_controller_1
	port (
		clk: in STD_LOGIC;
		disable_ops: in STD_LOGIC;
		inhib_in: in STD_LOGIC_VECTOR (2 downto 0);
		load_cmd_in: in STD_LOGIC_VECTOR (3 downto 0);
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		wr_cmd: in STD_LOGIC;
		inhib_out: out STD_LOGIC;
		load_cmd_out: out STD_LOGIC_VECTOR (3 downto 0));
end component;


instance_name : load_controller_1
( clk => ,
  disable_ops => ,
  inhib_in => ,
  inhib_out => ,
  load_cmd_in => ,
  load_cmd_out => ,
  reset_p => ,
  sig_in => ,
  wr_cmd => );
