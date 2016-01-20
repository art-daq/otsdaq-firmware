component ip_checksum_calc
	port (
		addrsDest: in STD_LOGIC_VECTOR (7 downto 0);
		addrsSrc: in STD_LOGIC_VECTOR (7 downto 0);
		clk: in STD_LOGIC;
		icmp_mode: in STD_LOGIC;
		length: in STD_LOGIC_VECTOR (10 downto 0);
		reset: in STD_LOGIC;
		trigger: in STD_LOGIC;
		cs: out STD_LOGIC_VECTOR (15 downto 0));
end component;


instance_name : ip_checksum_calc
( addrsDest => ,
 addrsSrc => ,
 clk => ,
 cs => ,
 icmp_mode => ,
 length => ,
 reset => ,
 trigger => );
