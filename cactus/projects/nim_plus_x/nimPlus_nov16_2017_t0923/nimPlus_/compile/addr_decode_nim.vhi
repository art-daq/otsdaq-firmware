component addr_decode_NIM
	port (
		addr: in STD_LOGIC_VECTOR (32 downto 0);
		clock: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		wr_en: in STD_LOGIC;
		blk_wr_en: out STD_LOGIC_VECTOR (7 downto 0));
end component;


instance_name : addr_decode_NIM
( addr => ,
  blk_wr_en => ,
  clock => ,
  reset_p => ,
  wr_en => );
