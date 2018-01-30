library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity ld_array_4_tb is
end ld_array_4_tb;

architecture TB_ARCHITECTURE of ld_array_4_tb is
	-- Component declaration of the tested unit
	component ld_array_4
	port(
		clk0 : in STD_LOGIC;
		clk1 : in STD_LOGIC;
		clk2 : in STD_LOGIC;
		clk3 : in STD_LOGIC;
		dis_ops : in STD_LOGIC;
		rst_p : in STD_LOGIC;
		sig_in : in STD_LOGIC;
		dl : in STD_LOGIC_VECTOR(7 downto 0);
		ld_cmd_in : in STD_LOGIC_VECTOR(3 downto 0);
		wr_cmd : in STD_LOGIC_VECTOR(3 downto 0);
		s_out : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk0 : STD_LOGIC;
	signal clk1 : STD_LOGIC;
	signal clk2 : STD_LOGIC;
	signal clk3 : STD_LOGIC;
	signal dis_ops : STD_LOGIC;
	signal rst_p : STD_LOGIC;
	signal sig_in : STD_LOGIC;
	signal dl : STD_LOGIC_VECTOR(7 downto 0);
	signal ld_cmd_in : STD_LOGIC_VECTOR(3 downto 0);
	signal wr_cmd : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal s_out : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : ld_array_4
		port map (
			clk0 => clk0,
			clk1 => clk1,
			clk2 => clk2,
			clk3 => clk3,
			dis_ops => dis_ops,
			rst_p => rst_p,
			sig_in => sig_in,
			dl => dl,
			ld_cmd_in => ld_cmd_in,
			wr_cmd => wr_cmd,
			s_out => s_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ld_array_4 of ld_array_4_tb is
	for TB_ARCHITECTURE
		for UUT : ld_array_4
			use entity work.ld_array_4(ld_array_4);
		end for;
	end for;
end TESTBENCH_FOR_ld_array_4;

