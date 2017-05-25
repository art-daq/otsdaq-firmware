-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ots_interface
-- Author      : Fermi User
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- File        : D:\elewis\ots_interface\ots_interface\ots_interface\compile\ram_tester.vhd
-- Generated   : Tue May 16 12:03:54 2017
-- From        : D:/elewis/ots_interface/ots_interface/ots_interface/src/ram_tester.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;


entity ram_tester is
  port(
       FLASH_CLK : in STD_LOGIC;
       MASTER_CLK : in STD_LOGIC;
       ots_rden : in STD_LOGIC;
       ots_wren : in STD_LOGIC;
       reset : in STD_LOGIC;
       ots_block_addr : in STD_LOGIC_VECTOR(31 downto 0);
       ots_block_sel : in STD_LOGIC_VECTOR(31 downto 0);
       ots_din : in STD_LOGIC_VECTOR(63 downto 0);
       eth_ready : out STD_LOGIC;
       ots_dout : out STD_LOGIC_VECTOR(63 downto 0)
  );
end ram_tester;

architecture ram_tester of ram_tester is

---- Component declarations -----

component RAM_chip_simulator
  port (
       SCLK : in STD_LOGIC;
       chip_select : in STD_LOGIC;
       reset : in STD_LOGIC;
       io_0 : inout STD_LOGIC;
       io_1 : inout STD_LOGIC;
       io_2 : inout STD_LOGIC;
       io_3 : inout STD_LOGIC
  );
end component;
component ram_interface
  port (
       FLASH_CLK : in STD_LOGIC;
       MASTER_CLK : in STD_LOGIC;
       ots_block_addr : in STD_LOGIC_VECTOR(31 downto 0);
       ots_block_sel : in STD_LOGIC_VECTOR(31 downto 0);
       ots_din : in STD_LOGIC_VECTOR(63 downto 0);
       ots_rden : in STD_LOGIC;
       ots_wren : in STD_LOGIC;
       reset : in STD_LOGIC;
       SCLK : out STD_LOGIC;
       chip_select : out STD_LOGIC;
       eth_ready : out STD_LOGIC;
       ots_dout : out STD_LOGIC_VECTOR(63 downto 0);
       spi_reset : out STD_LOGIC;
       io_0 : inout STD_LOGIC;
       io_1 : inout STD_LOGIC;
       io_2 : inout STD_LOGIC;
       io_3 : inout STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET27 : STD_LOGIC;
signal NET31 : STD_LOGIC;
signal NET35 : STD_LOGIC;
signal NET39 : STD_LOGIC;
signal NET43 : STD_LOGIC;
signal NET47 : STD_LOGIC;
signal NET51 : STD_LOGIC;

begin

----  Component instantiations  ----

U2 : ram_interface
  port map(
       FLASH_CLK => FLASH_CLK,
       MASTER_CLK => MASTER_CLK,
       SCLK => NET43,
       chip_select => NET27,
       eth_ready => eth_ready,
       io_0 => NET31,
       io_1 => NET39,
       io_2 => NET47,
       io_3 => NET51,
       ots_block_addr => ots_block_addr,
       ots_block_sel => ots_block_sel,
       ots_din => ots_din,
       ots_dout => ots_dout,
       ots_rden => ots_rden,
       ots_wren => ots_wren,
       reset => reset,
       spi_reset => NET35
  );

U3 : RAM_chip_simulator
  port map(
       SCLK => NET43,
       chip_select => NET27,
       io_0 => NET31,
       io_1 => NET39,
       io_2 => NET47,
       io_3 => NET51,
       reset => NET35
  );


end ram_tester;
