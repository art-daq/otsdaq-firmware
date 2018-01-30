component count32
	port (
		clock: in STD_LOGIC;
		clr_count: in STD_LOGIC;
		cout_en_p: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		count_out: out STD_LOGIC_VECTOR (31 downto 0);
		ovrflow: out STD_LOGIC);
end component;


instance_name : count32
( clock => ,
  clr_count => ,
  count_out => ,
  cout_en_p => ,
  ovrflow => ,
  reset_p => );
