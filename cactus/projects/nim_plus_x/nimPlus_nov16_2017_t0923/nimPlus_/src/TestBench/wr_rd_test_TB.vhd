library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity wr_rd_test_tb is
end wr_rd_test_tb;

architecture TB_ARCHITECTURE of wr_rd_test_tb is
	-- Component declaration of the tested unit
	component wr_rd_test
	port(
		OEI_reg_wr : in STD_LOGIC;
		clk_in : in STD_LOGIC;
		OEI_addr : in STD_LOGIC_VECTOR(31 downto 0);
		d_in : in STD_LOGIC_VECTOR(31 downto 0);
		read_data_out : out STD_LOGIC_VECTOR(31 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal OEI_reg_wr : STD_LOGIC;
	signal clk_in : STD_LOGIC;
	signal OEI_addr : STD_LOGIC_VECTOR(31 downto 0);
	signal d_in : STD_LOGIC_VECTOR(31 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal read_data_out : STD_LOGIC_VECTOR(31 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : wr_rd_test
		port map (
			OEI_reg_wr => OEI_reg_wr,
			clk_in => clk_in,
			OEI_addr => OEI_addr,
			d_in => d_in,
			read_data_out => read_data_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_wr_rd_test of wr_rd_test_tb is
	for TB_ARCHITECTURE
		for UUT : wr_rd_test
			use entity work.wr_rd_test(wr_rd_test);
		end for;
	end for;
end TESTBENCH_FOR_wr_rd_test;

