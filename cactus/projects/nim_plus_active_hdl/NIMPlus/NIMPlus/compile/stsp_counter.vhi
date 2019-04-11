component stsp_counter
	port (
		clk: in STD_LOGIC;
		rst_p: in STD_LOGIC;
		stp: in STD_LOGIC;
		strt: in STD_LOGIC;
		count_out: out STD_LOGIC_VECTOR (31 downto 0);
		ovr: out STD_LOGIC);
end component;


instance_name : stsp_counter
( clk => ,
 count_out => ,
 ovr => ,
 rst_p => ,
 stp => ,
 strt => );
