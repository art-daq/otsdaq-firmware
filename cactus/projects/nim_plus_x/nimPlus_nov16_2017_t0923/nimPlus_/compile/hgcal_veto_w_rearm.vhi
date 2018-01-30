component HGCAL_Veto_w_Rearm
	port (
		clk: in STD_LOGIC;
		en_rearm: in STD_LOGIC;
		high_period: in STD_LOGIC_VECTOR (7 downto 0);
		reset_p: in STD_LOGIC;
		start_in: in STD_LOGIC;
		trig_out: out STD_LOGIC);
end component;


instance_name : HGCAL_Veto_w_Rearm
( clk => ,
  en_rearm => ,
  high_period => ,
  reset_p => ,
  start_in => ,
  trig_out => );
