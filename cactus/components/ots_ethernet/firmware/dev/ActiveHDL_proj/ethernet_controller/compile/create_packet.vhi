component create_packet
	port (
		addrs: in STD_LOGIC_VECTOR (31 downto 0);
		arp_busy: in STD_LOGIC;
		checksum: in STD_LOGIC_VECTOR (15 downto 0);
		clk: in STD_LOGIC;
		data_length: in STD_LOGIC_VECTOR (10 downto 0);
		dest_ip: in STD_LOGIC_VECTOR (31 downto 0);
		dest_mac: in STD_LOGIC_VECTOR (47 downto 0);
		dest_port: in STD_LOGIC_VECTOR (15 downto 0);
		four_bit_mode: in STD_LOGIC;
		icmp_checksum: in STD_LOGIC_VECTOR (15 downto 0);
		icmp_data: in STD_LOGIC_VECTOR (7 downto 0);
		icmp_ip: in STD_LOGIC_VECTOR (31 downto 0);
		icmp_mac: in STD_LOGIC_VECTOR (47 downto 0);
		icmp_ping: in STD_LOGIC;
		mac: in STD_LOGIC_VECTOR (47 downto 0);
		ping: in STD_LOGIC;
		reset: in STD_LOGIC;
		trigger: in STD_LOGIC;
		busy: out STD_LOGIC;
		checksum_trig: out STD_LOGIC;
		clken_out: out STD_LOGIC;
		crc_gen_en: out STD_LOGIC;
		crc_gen_init: out STD_LOGIC;
		crc_gen_rd: out STD_LOGIC;
		dataout: out STD_LOGIC_VECTOR (7 downto 0);
		en_tx_data: out STD_LOGIC;
		length_count_out: out STD_LOGIC_VECTOR (10 downto 0);
		tx_en: out STD_LOGIC;
		tx_er: out STD_LOGIC;
		tx_icmp_packet: out STD_LOGIC;
		udp_data_sel: out STD_LOGIC);
end component;


instance_name : create_packet
( addrs => ,
 arp_busy => ,
 busy => ,
 checksum => ,
 checksum_trig => ,
 clk => ,
 clken_out => ,
 crc_gen_en => ,
 crc_gen_init => ,
 crc_gen_rd => ,
 data_length => ,
 dataout => ,
 dest_ip => ,
 dest_mac => ,
 dest_port => ,
 en_tx_data => ,
 four_bit_mode => ,
 icmp_checksum => ,
 icmp_data => ,
 icmp_ip => ,
 icmp_mac => ,
 icmp_ping => ,
 length_count_out => ,
 mac => ,
 ping => ,
 reset => ,
 trigger => ,
 tx_en => ,
 tx_er => ,
 tx_icmp_packet => ,
 udp_data_sel => );
