library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity accel_sync_test_tb is
end accel_sync_test_tb;

architecture TB_ARCHITECTURE of accel_sync_test_tb is
	-- Component declaration of the tested unit
	component accel_sync_test
	port(
		clk0 : in STD_LOGIC;
		clk_13_25 : in STD_LOGIC;
		clk_26_5 : in STD_LOGIC;
		ctr_reset : in STD_LOGIC;
		reset_out : in STD_LOGIC;
		fs_sync_bus : in STD_LOGIC_VECTOR(5 downto 0);
		clk_39_out : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk0 : STD_LOGIC;
	signal clk_13_25 : STD_LOGIC;
	signal clk_26_5 : STD_LOGIC;
	signal ctr_reset : STD_LOGIC;
	signal reset_out : STD_LOGIC;
	signal fs_sync_bus : STD_LOGIC_VECTOR(5 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal clk_39_out : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : accel_sync_test
		port map (
			clk0 => clk0,
			clk_13_25 => clk_13_25,
			clk_26_5 => clk_26_5,
			ctr_reset => ctr_reset,
			reset_out => reset_out,
			fs_sync_bus => fs_sync_bus,
			clk_39_out => clk_39_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_accel_sync_test of accel_sync_test_tb is
	for TB_ARCHITECTURE
		for UUT : accel_sync_test
			use entity work.accel_sync_test(accel_sync_test);
		end for;
	end for;
end TESTBENCH_FOR_accel_sync_test;

