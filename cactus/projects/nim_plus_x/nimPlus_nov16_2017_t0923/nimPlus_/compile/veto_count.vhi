component veto_count
	port (
		clk: in STD_LOGIC;
		count_in: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		veto_out_n: out STD_LOGIC);
end component;


instance_name : veto_count
( clk => ,
  count_in => ,
  reset_p => ,
  sig_in => ,
  veto_out_n => );
