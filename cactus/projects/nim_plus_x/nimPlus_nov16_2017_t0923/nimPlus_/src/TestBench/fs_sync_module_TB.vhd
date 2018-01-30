library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity fs_sync_module_tb is
end fs_sync_module_tb;

architecture TB_ARCHITECTURE of fs_sync_module_tb is
	-- Component declaration of the tested unit
	component fs_sync_module
	port(
		MHz_40 : in STD_LOGIC;
		clock_320MHz : in STD_LOGIC;
		reset_async_p : in STD_LOGIC;
		reset_master_p : in STD_LOGIC;
		sel_sync_in : in STD_LOGIC_VECTOR(7 downto 0);
		sel_sync_out : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal MHz_40 : STD_LOGIC;
	signal clock_320MHz : STD_LOGIC;
	signal reset_async_p : STD_LOGIC;
	signal reset_master_p : STD_LOGIC;
	signal sel_sync_in : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal sel_sync_out : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fs_sync_module
		port map (
			MHz_40 => MHz_40,
			clock_320MHz => clock_320MHz,
			reset_async_p => reset_async_p,
			reset_master_p => reset_master_p,
			sel_sync_in => sel_sync_in,
			sel_sync_out => sel_sync_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fs_sync_module of fs_sync_module_tb is
	for TB_ARCHITECTURE
		for UUT : fs_sync_module
			use entity work.fs_sync_module(fs_sync_module);
		end for;
	end for;
end TESTBENCH_FOR_fs_sync_module;

