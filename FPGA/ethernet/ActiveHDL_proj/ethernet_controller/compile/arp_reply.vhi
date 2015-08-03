component arp_reply
	port (
		addrs: in STD_LOGIC_VECTOR (7 downto 0);
		clk: in STD_LOGIC;
		four_bit_mode: in STD_LOGIC;
		reset: in STD_LOGIC;
		tip: in STD_LOGIC_VECTOR (31 downto 0);
		tmac: in STD_LOGIC_VECTOR (47 downto 0);
		trigger: in STD_LOGIC;
		udp_busy: in STD_LOGIC;
		arp_busy: out STD_LOGIC;
		crc_gen_en: out STD_LOGIC;
		crc_gen_init: out STD_LOGIC;
		crc_gen_rd: out STD_LOGIC;
		dataout: out STD_LOGIC_VECTOR (7 downto 0);
		tx_en: out STD_LOGIC;
		tx_er: out STD_LOGIC);
end component;


instance_name : arp_reply
( addrs => ,
 arp_busy => ,
 clk => ,
 crc_gen_en => ,
 crc_gen_init => ,
 crc_gen_rd => ,
 dataout => ,
 four_bit_mode => ,
 reset => ,
 tip => ,
 tmac => ,
 trigger => ,
 tx_en => ,
 tx_er => ,
 udp_busy => );
