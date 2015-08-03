component icmp_ping_checksum_calc
	port (
		clk: in STD_LOGIC;
		req_chk_sum: in STD_LOGIC_VECTOR (15 downto 0);
		reset: in STD_LOGIC;
		trigger: in STD_LOGIC;
		resp_chk_sum: out STD_LOGIC_VECTOR (15 downto 0));
end component;


instance_name : icmp_ping_checksum_calc
( clk => ,
 req_chk_sum => ,
 reset => ,
 resp_chk_sum => ,
 trigger => );
