component decipherer
	port (
		addrs: in STD_LOGIC_VECTOR (7 downto 0);
		clk: in STD_LOGIC;
		data_in: in STD_LOGIC_VECTOR (7 downto 0);
		dv: in STD_LOGIC;
		er: in STD_LOGIC;
		is_rgmii: in STD_LOGIC;
		reset: in STD_LOGIC;
		arp_req_ip: out STD_LOGIC_VECTOR (31 downto 0);
		arp_req_mac: out STD_LOGIC_VECTOR (47 downto 0);
		arp_search_ip: out STD_LOGIC_VECTOR (31 downto 0);
		capture_source_addrs: out STD_LOGIC;
		clken_out: out STD_LOGIC;
		crc_chk_en: out STD_LOGIC;
		crc_chk_init: out STD_LOGIC;
		crc_chk_rd: out STD_LOGIC;
		data_out: out STD_LOGIC_VECTOR (7 downto 0);
		dest_mac: out STD_LOGIC_VECTOR (47 downto 0);
		four_bit_mode_out: out STD_LOGIC;
		icmp_checksum: out STD_LOGIC_VECTOR (15 downto 0);
		is_arp: out STD_LOGIC;
		is_icmp_ping: out STD_LOGIC;
		is_idle: out STD_LOGIC;
		is_ip: out STD_LOGIC;
		is_udp: out STD_LOGIC;
		src_mac: out STD_LOGIC_VECTOR (47 downto 0);
		udp_data_count: out STD_LOGIC_VECTOR (10 downto 0);
		udp_data_valid: out STD_LOGIC;
		udp_dest_port: out STD_LOGIC_VECTOR (15 downto 0);
		udp_src_ip: out STD_LOGIC_VECTOR (31 downto 0);
		udp_src_port: out STD_LOGIC_VECTOR (15 downto 0));
end component;


instance_name : decipherer
( addrs => ,
 arp_req_ip => ,
 arp_req_mac => ,
 arp_search_ip => ,
 capture_source_addrs => ,
 clk => ,
 clken_out => ,
 crc_chk_en => ,
 crc_chk_init => ,
 crc_chk_rd => ,
 data_in => ,
 data_out => ,
 dest_mac => ,
 dv => ,
 er => ,
 four_bit_mode_out => ,
 icmp_checksum => ,
 is_arp => ,
 is_icmp_ping => ,
 is_idle => ,
 is_ip => ,
 is_rgmii => ,
 is_udp => ,
 reset => ,
 src_mac => ,
 udp_data_count => ,
 udp_data_valid => ,
 udp_dest_port => ,
 udp_src_ip => ,
 udp_src_port => );
