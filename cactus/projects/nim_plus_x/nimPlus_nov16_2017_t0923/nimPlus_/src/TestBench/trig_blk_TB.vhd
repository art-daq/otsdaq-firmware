library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity trig_blk_tb is
end trig_blk_tb;

architecture TB_ARCHITECTURE of trig_blk_tb is
	-- Component declaration of the tested unit
	component trig_blk
	port(
		clk : in STD_LOGIC;
		dlay : in INTEGER range 15 downto 0;
		oe : in STD_LOGIC;
		reset_p : in STD_LOGIC;
		s_in : in STD_LOGIC;
		wdth : in INTEGER range 15 downto 0;
		wr_blk : in STD_LOGIC;
		busy_out : out STD_LOGIC;
		s_out : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal dlay : INTEGER range 15 downto 0;
	signal oe : STD_LOGIC;
	signal reset_p : STD_LOGIC;
	signal s_in : STD_LOGIC;
	signal wdth : INTEGER range 15 downto 0;
	signal wr_blk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal busy_out : STD_LOGIC;
	signal s_out : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : trig_blk
		port map (
			clk => clk,
			dlay => dlay,
			oe => oe,
			reset_p => reset_p,
			s_in => s_in,
			wdth => wdth,
			wr_blk => wr_blk,
			busy_out => busy_out,
			s_out => s_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_trig_blk of trig_blk_tb is
	for TB_ARCHITECTURE
		for UUT : trig_blk
			use entity work.trig_blk(trig_blk_arch);
		end for;
	end for;
end TESTBENCH_FOR_trig_blk;

