library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity dac_control_tb is
end dac_control_tb;

architecture TB_ARCHITECTURE of dac_control_tb is
	-- Component declaration of the tested unit
	component dac_control
	port(
		blk_data_in : in STD_LOGIC_VECTOR(15 downto 0);
		clock : in STD_LOGIC;
		reset_p : in STD_LOGIC;
		wr_blk_p : in STD_LOGIC;
		wr_dac_p : in STD_LOGIC;
		dac_out : out STD_LOGIC;
		sclk : out STD_LOGIC;
		sync : out STD_LOGIC;
		wr_error : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal blk_data_in : STD_LOGIC_VECTOR(15 downto 0);
	signal clock : STD_LOGIC;
	signal reset_p : STD_LOGIC;
	signal wr_blk_p : STD_LOGIC;
	signal wr_dac_p : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal dac_out : STD_LOGIC;
	signal sclk : STD_LOGIC;
	signal sync : STD_LOGIC;
	signal wr_error : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : dac_control
		port map (
			blk_data_in => blk_data_in,
			clock => clock,
			reset_p => reset_p,
			wr_blk_p => wr_blk_p,
			wr_dac_p => wr_dac_p,
			dac_out => dac_out,
			sclk => sclk,
			sync => sync,
			wr_error => wr_error
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dac_control of dac_control_tb is
	for TB_ARCHITECTURE
		for UUT : dac_control
			use entity work.dac_control(dac_control_arch);
		end for;
	end for;
end TESTBENCH_FOR_dac_control;

