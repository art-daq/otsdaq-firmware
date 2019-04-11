component ps_hold_count
	port (
		clk: in STD_LOGIC;
		count_in: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		sig_in: in STD_LOGIC;
		ps_hold_out_p: out STD_LOGIC);
end component;


instance_name : ps_hold_count
( clk => ,
 count_in => ,
 ps_hold_out_p => ,
 reset_p => ,
 sig_in => );
