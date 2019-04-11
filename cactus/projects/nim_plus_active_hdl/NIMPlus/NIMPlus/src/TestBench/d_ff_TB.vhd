library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity d_ff_tb is
end d_ff_tb;

architecture TB_ARCHITECTURE of d_ff_tb is
	-- Component declaration of the tested unit
	component d_ff
	port(
		clk : in STD_LOGIC;
		dl : in STD_LOGIC;
		rst_p : in STD_LOGIC;
		q : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal dl : STD_LOGIC;
	signal rst_p : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal q : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : d_ff
		port map (
			clk => clk,
			dl => dl,
			rst_p => rst_p,
			q => q
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_d_ff of d_ff_tb is
	for TB_ARCHITECTURE
		for UUT : d_ff
			use entity work.d_ff(d_ff);
		end for;
	end for;
end TESTBENCH_FOR_d_ff;

