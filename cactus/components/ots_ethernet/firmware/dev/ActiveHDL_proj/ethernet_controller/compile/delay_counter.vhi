component delay_counter
	port (
		clear_delay_count: in STD_LOGIC;
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		start_delay_count: in STD_LOGIC;
		delay_count: out STD_LOGIC);
end component;


instance_name : delay_counter
( clear_delay_count => ,
 clock => ,
 delay_count => ,
 reset => ,
 start_delay_count => );
