component sig_gen_prog
	port (
		clk: in STD_LOGIC;
		p_count: in STD_LOGIC_VECTOR (27 downto 0);
		p_hi: in STD_LOGIC_VECTOR (31 downto 0);
		p_lo: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		start_en: in STD_LOGIC;
		err_out: out STD_LOGIC;
		p_out: out STD_LOGIC);
end component;


instance_name : sig_gen_prog
( clk => ,
 err_out => ,
 p_count => ,
 p_hi => ,
 p_lo => ,
 p_out => ,
 reset_p => ,
 start_en => );
