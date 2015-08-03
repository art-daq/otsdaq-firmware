library ethernet_controller;
use ethernet_controller.params_package.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

	-- Add your library and packages declaration here ...

entity gec_rx_ctl_8_tb is
end gec_rx_ctl_8_tb;

architecture TB_ARCHITECTURE of gec_rx_ctl_8_tb is
	-- Component declaration of the tested unit
	component gec_rx_ctl_8
	port(
		block_en : in STD_LOGIC;
		clock : in STD_LOGIC;
		data_fifo_full : in STD_LOGIC;
		data_fifo_wrerr : in STD_LOGIC;
		gec_user_crc_err : in STD_LOGIC;
		gec_user_rx_data_out : in STD_LOGIC_VECTOR(7 downto 0);
		gec_user_rx_size_out : in STD_LOGIC_VECTOR(10 downto 0);
		gec_user_rx_valid_out : in STD_LOGIC;					  
		four_bit_mode : in STD_LOGIC;
		reset_n : in STD_LOGIC;
		crc_err_flag : out STD_LOGIC;
		data_fifo_q_w_data : out STD_LOGIC_VECTOR(63 downto 0);
		data_fifo_wren : out STD_LOGIC;
		info_fifo_wr_data : out STD_LOGIC_VECTOR(15 downto 0);
		info_fifo_wren : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal block_en : STD_LOGIC;
	signal clock : STD_LOGIC;
	signal data_fifo_full : STD_LOGIC;
	signal data_fifo_wrerr : STD_LOGIC;
	signal gec_user_crc_err : STD_LOGIC;
	signal gec_user_rx_data_out : STD_LOGIC_VECTOR(7 downto 0);
	signal gec_user_rx_size_out : STD_LOGIC_VECTOR(10 downto 0);
	signal gec_user_rx_valid_out : STD_LOGIC;
	signal reset_n : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal crc_err_flag : STD_LOGIC;										   
	signal four_bit_mode : STD_LOGIC;
	signal data_fifo_q_w_data : STD_LOGIC_VECTOR(63 downto 0);
	signal data_fifo_wren : STD_LOGIC;
	signal info_fifo_wr_data : STD_LOGIC_VECTOR(15 downto 0);
	signal info_fifo_wren : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : gec_rx_ctl_8
		port map (
			block_en => block_en,
			clock => clock,
			data_fifo_full => data_fifo_full,
			data_fifo_wrerr => data_fifo_wrerr,
			gec_user_crc_err => gec_user_crc_err,
			gec_user_rx_data_out => gec_user_rx_data_out,
			gec_user_rx_size_out => gec_user_rx_size_out,
			gec_user_rx_valid_out => gec_user_rx_valid_out,
			reset_n => reset_n,											  
			four_bit_mode => four_bit_mode,
			crc_err_flag => crc_err_flag,
			data_fifo_q_w_data => data_fifo_q_w_data,
			data_fifo_wren => data_fifo_wren,
			info_fifo_wr_data => info_fifo_wr_data,
			info_fifo_wren => info_fifo_wren
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_gec_rx_ctl_8 of gec_rx_ctl_8_tb is
	for TB_ARCHITECTURE
		for UUT : gec_rx_ctl_8
			use entity work.gec_rx_ctl_8(gec_rx_ctl_8);
		end for;
	end for;
end TESTBENCH_FOR_gec_rx_ctl_8;

