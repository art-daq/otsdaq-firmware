library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity pulse_combine_tb is
end pulse_combine_tb;

architecture TB_ARCHITECTURE of pulse_combine_tb is
	-- Component declaration of the tested unit
	component pulse_combine
	port(
		oe : in STD_LOGIC;
		e : in STD_LOGIC_VECTOR(3 downto 0);
		x : in STD_LOGIC_VECTOR(3 downto 0);
		y : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal oe : STD_LOGIC;
	signal e : STD_LOGIC_VECTOR(3 downto 0);
	signal x : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal y : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : pulse_combine
		port map (
			oe => oe,
			e => e,
			x => x,
			y => y
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_pulse_combine of pulse_combine_tb is
	for TB_ARCHITECTURE
		for UUT : pulse_combine
			use entity work.pulse_combine(pulse_combine);
		end for;
	end for;
end TESTBENCH_FOR_pulse_combine;

