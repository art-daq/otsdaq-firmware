component section_counter
	port (
		clk: in STD_LOGIC;
		reset_p: in STD_LOGIC;
		sec_in: in STD_LOGIC_VECTOR (7 downto 0);
		sec_en: out STD_LOGIC);
end component;


instance_name : section_counter
( clk => ,
  reset_p => ,
  sec_en => ,
  sec_in => );
