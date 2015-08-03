component dest_ip_mac_container
	port (
		clk: in STD_LOGIC;
		ip_from_arp: in STD_LOGIC_VECTOR (31 downto 0);
		ip_from_udp: in STD_LOGIC_VECTOR (31 downto 0);
		is_arp: in STD_LOGIC;
		is_udp: in STD_LOGIC;
		mac_from_arp: in STD_LOGIC_VECTOR (47 downto 0);
		mac_from_udp: in STD_LOGIC_VECTOR (47 downto 0);
		reset: in STD_LOGIC;
		dest_ip: out STD_LOGIC_VECTOR (31 downto 0);
		dest_mac: out STD_LOGIC_VECTOR (47 downto 0);
		is_known: out STD_LOGIC);
end component;


instance_name : dest_ip_mac_container
( clk => ,
  dest_ip => ,
  dest_mac => ,
  ip_from_arp => ,
  ip_from_udp => ,
  is_arp => ,
  is_known => ,
  is_udp => ,
  mac_from_arp => ,
  mac_from_udp => ,
  reset => );
