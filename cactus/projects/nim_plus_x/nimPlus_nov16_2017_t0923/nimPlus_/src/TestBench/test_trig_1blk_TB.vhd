library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity test_trig_1blk_tb is
end test_trig_1blk_tb;

architecture TB_ARCHITECTURE of test_trig_1blk_tb is
	-- Component declaration of the tested unit
	component test_trig_1blk
	port(
		clk_0 : in STD_LOGIC;
		clk_1 : in STD_LOGIC;
		clk_2 : in STD_LOGIC;
		clk_3 : in STD_LOGIC;
		en_output : in STD_LOGIC;
		en_pulses : in STD_LOGIC;
		sysreset : in STD_LOGIC;
		wr_blk : in STD_LOGIC;
		dlay_in : in STD_LOGIC_VECTOR(7 downto 0);
		e : in STD_LOGIC_VECTOR(15 downto 0);
		wdth_in : in STD_LOGIC_VECTOR(7 downto 0);
		x : in STD_LOGIC_VECTOR(3 downto 0);
		trg_sig : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk_0 : STD_LOGIC;
	signal clk_1 : STD_LOGIC;
	signal clk_2 : STD_LOGIC;
	signal clk_3 : STD_LOGIC;
	signal en_output : STD_LOGIC;
	signal en_pulses : STD_LOGIC;
	signal sysreset : STD_LOGIC;
	signal wr_blk : STD_LOGIC;
	signal dlay_in : STD_LOGIC_VECTOR(7 downto 0);
	signal e : STD_LOGIC_VECTOR(15 downto 0);
	signal wdth_in : STD_LOGIC_VECTOR(7 downto 0);
	signal x : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal trg_sig : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : test_trig_1blk
		port map (
			clk_0 => clk_0,
			clk_1 => clk_1,
			clk_2 => clk_2,
			clk_3 => clk_3,
			en_output => en_output,
			en_pulses => en_pulses,
			sysreset => sysreset,
			wr_blk => wr_blk,
			dlay_in => dlay_in,
			e => e,
			wdth_in => wdth_in,
			x => x,
			trg_sig => trg_sig
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_test_trig_1blk of test_trig_1blk_tb is
	for TB_ARCHITECTURE
		for UUT : test_trig_1blk
			use entity work.test_trig_1blk(test_trig_1blk);
		end for;
	end for;
end TESTBENCH_FOR_test_trig_1blk;

