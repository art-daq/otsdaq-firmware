component long_pulse
	port (
		clk: in STD_LOGIC;
		ct_in: in STD_LOGIC_VECTOR (63 downto 0);
		phi: in STD_LOGIC_VECTOR (63 downto 0);
		rst_p: in STD_LOGIC;
		srout_in: in STD_LOGIC;
		ctr_rst: out STD_LOGIC;
		p_out: out STD_LOGIC);
end component;


instance_name : long_pulse
( clk => ,
 ct_in => ,
 ctr_rst => ,
 p_out => ,
 phi => ,
 rst_p => ,
 srout_in => );
