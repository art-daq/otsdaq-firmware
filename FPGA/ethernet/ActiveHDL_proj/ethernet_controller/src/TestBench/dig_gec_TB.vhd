library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity dig_gec_tb is
end dig_gec_tb;

architecture TB_ARCHITECTURE of dig_gec_tb is
	-- Component declaration of the tested unit
	component dig_gec
	port(
		GMII_RX_CLK : in STD_LOGIC;
		GMII_RX_DV : in STD_LOGIC;
		GMII_RX_ER : in STD_LOGIC;
		reset : in STD_LOGIC;
		trigger : in STD_LOGIC;
		GMII_RXD : in STD_LOGIC_VECTOR(7 downto 0);
		dest_addrs : in STD_LOGIC_VECTOR(7 downto 0);
		dest_mac : in STD_LOGIC_VECTOR(47 downto 0);
		dest_port : in STD_LOGIC_VECTOR(15 downto 0);
		user_addrs : in STD_LOGIC_VECTOR(7 downto 0);
		user_tx_data_in : in STD_LOGIC_VECTOR(7 downto 0);
		user_tx_size_in : in STD_LOGIC_VECTOR(10 downto 0);
		GMII_GTX_CLK : out STD_LOGIC;
		GMII_TX_EN : out STD_LOGIC;
		GMII_TX_ER : out STD_LOGIC;
		busy : out STD_LOGIC;
		crc_chk_en : out STD_LOGIC;
		crc_chk_rd : out STD_LOGIC;
		crc_chk_init : out STD_LOGIC;
		crc_gen_en : out STD_LOGIC;
		crc_gen_init : out STD_LOGIC;
		crc_gen_rd : out STD_LOGIC;
		en_tx_data : out STD_LOGIC;
		src_capture : out STD_LOGIC;
		user_rx_valid_out : out STD_LOGIC;
		GMII_TXD : out STD_LOGIC_VECTOR(7 downto 0);
		src_addrs : out STD_LOGIC_VECTOR(7 downto 0);
		src_mac : out STD_LOGIC_VECTOR(47 downto 0);
		src_port : out STD_LOGIC_VECTOR(15 downto 0);
		udp_data_count : out STD_LOGIC_VECTOR(10 downto 0);
		udp_dest_port : out STD_LOGIC_VECTOR(15 downto 0);
		user_rx_data_out : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal GMII_RX_CLK : STD_LOGIC;
	signal GMII_RX_DV : STD_LOGIC;
	signal GMII_RX_ER : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal trigger : STD_LOGIC;
	signal GMII_RXD : STD_LOGIC_VECTOR(7 downto 0);
	signal dest_addrs : STD_LOGIC_VECTOR(7 downto 0);
	signal dest_mac : STD_LOGIC_VECTOR(47 downto 0);
	signal dest_port : STD_LOGIC_VECTOR(15 downto 0);
	signal user_addrs : STD_LOGIC_VECTOR(7 downto 0);
	signal user_tx_data_in : STD_LOGIC_VECTOR(7 downto 0);
	signal user_tx_size_in : STD_LOGIC_VECTOR(10 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal GMII_GTX_CLK : STD_LOGIC;
	signal GMII_TX_EN : STD_LOGIC;
	signal GMII_TX_ER : STD_LOGIC;
	signal busy : STD_LOGIC;
	signal crc_chk_en : STD_LOGIC;
	signal crc_chk_err : STD_LOGIC;
	signal crc_chk_init : STD_LOGIC;
	signal crc_gen_en : STD_LOGIC;
	signal crc_gen_init : STD_LOGIC;
	signal crc_gen_rd : STD_LOGIC;
	signal en_tx_data : STD_LOGIC;
	signal src_capture : STD_LOGIC;
	signal user_rx_valid_out : STD_LOGIC;
	signal GMII_TXD : STD_LOGIC_VECTOR(7 downto 0);
	signal src_addrs : STD_LOGIC_VECTOR(7 downto 0);
	signal src_mac : STD_LOGIC_VECTOR(47 downto 0);
	signal src_port : STD_LOGIC_VECTOR(15 downto 0);
	signal udp_data_count : STD_LOGIC_VECTOR(10 downto 0);
	signal udp_dest_port : STD_LOGIC_VECTOR(15 downto 0);
	signal user_rx_data_out : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : dig_gec
		port map (
			GMII_RX_CLK => GMII_RX_CLK,
			GMII_RX_DV => GMII_RX_DV,
			GMII_RX_ER => GMII_RX_ER,
			reset => reset,
			trigger => trigger,
			GMII_RXD => GMII_RXD,
			dest_addrs => dest_addrs,
			dest_mac => dest_mac,
			dest_port => dest_port,
			user_addrs => user_addrs,
			user_tx_data_in => user_tx_data_in,
			user_tx_size_in => user_tx_size_in,
			GMII_GTX_CLK => GMII_GTX_CLK,
			GMII_TX_EN => GMII_TX_EN,
			GMII_TX_ER => GMII_TX_ER,
			busy => busy,
			crc_chk_en => crc_chk_en,
			crc_chk_rd => crc_chk_err,
			crc_chk_init => crc_chk_init,
			crc_gen_en => crc_gen_en,
			crc_gen_init => crc_gen_init,
			crc_gen_rd => crc_gen_rd,
			en_tx_data => en_tx_data,
			src_capture => src_capture,
			user_rx_valid_out => user_rx_valid_out,
			GMII_TXD => GMII_TXD,
			src_addrs => src_addrs,
			src_mac => src_mac,
			src_port => src_port,
			udp_data_count => udp_data_count,
			udp_dest_port => udp_dest_port,
			user_rx_data_out => user_rx_data_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dig_gec of dig_gec_tb is
	for TB_ARCHITECTURE
		for UUT : dig_gec
			use entity work.dig_gec(dig_gec);
		end for;
	end for;
end TESTBENCH_FOR_dig_gec;

