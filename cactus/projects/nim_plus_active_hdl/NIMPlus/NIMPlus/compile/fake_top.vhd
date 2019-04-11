-------------------------------------------------------------------------------
--
-- Title       : fake_top
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\fake_top.vhd
-- Generated   : Wed May  2 14:14:53 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\fake_top.bde
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
--use nim_plus_package_1.all;


entity fake_top is 
end fake_top;

architecture fake_top of fake_top is

---- Component declarations -----

component nim_plus_block_v3
  port (
       DAC_clk : in STD_LOGIC;
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       rx_addr : in STD_LOGIC_VECTOR(31 downto 0);
       rx_data : in STD_LOGIC_VECTOR(15 downto 0);
       rx_wren : in STD_LOGIC;
       tx_clk : in STD_LOGIC;
       x : in STD_LOGIC_VECTOR(3 downto 0);
       dac_out : out STD_LOGIC;
       read_data_out : out STD_LOGIC_VECTOR(31 downto 0);
       s_out : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sync : out STD_LOGIC
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : nim_plus_block_v3
  port map(
       DAC_clk => Dangling_Input_Signal,
       rx_addr(0) => Dangling_Input_Signal,
       rx_addr(1) => Dangling_Input_Signal,
       rx_addr(2) => Dangling_Input_Signal,
       rx_addr(3) => Dangling_Input_Signal,
       rx_addr(4) => Dangling_Input_Signal,
       rx_addr(5) => Dangling_Input_Signal,
       rx_addr(6) => Dangling_Input_Signal,
       rx_addr(7) => Dangling_Input_Signal,
       rx_addr(8) => Dangling_Input_Signal,
       rx_addr(9) => Dangling_Input_Signal,
       rx_addr(10) => Dangling_Input_Signal,
       rx_addr(11) => Dangling_Input_Signal,
       rx_addr(12) => Dangling_Input_Signal,
       rx_addr(13) => Dangling_Input_Signal,
       rx_addr(14) => Dangling_Input_Signal,
       rx_addr(15) => Dangling_Input_Signal,
       rx_addr(16) => Dangling_Input_Signal,
       rx_addr(17) => Dangling_Input_Signal,
       rx_addr(18) => Dangling_Input_Signal,
       rx_addr(19) => Dangling_Input_Signal,
       rx_addr(20) => Dangling_Input_Signal,
       rx_addr(21) => Dangling_Input_Signal,
       rx_addr(22) => Dangling_Input_Signal,
       rx_addr(23) => Dangling_Input_Signal,
       rx_addr(24) => Dangling_Input_Signal,
       rx_addr(25) => Dangling_Input_Signal,
       rx_addr(26) => Dangling_Input_Signal,
       rx_addr(27) => Dangling_Input_Signal,
       rx_addr(28) => Dangling_Input_Signal,
       rx_addr(29) => Dangling_Input_Signal,
       rx_addr(30) => Dangling_Input_Signal,
       rx_addr(31) => Dangling_Input_Signal,
       rx_data(0) => Dangling_Input_Signal,
       rx_data(1) => Dangling_Input_Signal,
       rx_data(2) => Dangling_Input_Signal,
       rx_data(3) => Dangling_Input_Signal,
       rx_data(4) => Dangling_Input_Signal,
       rx_data(5) => Dangling_Input_Signal,
       rx_data(6) => Dangling_Input_Signal,
       rx_data(7) => Dangling_Input_Signal,
       rx_data(8) => Dangling_Input_Signal,
       rx_data(9) => Dangling_Input_Signal,
       rx_data(10) => Dangling_Input_Signal,
       rx_data(11) => Dangling_Input_Signal,
       rx_data(12) => Dangling_Input_Signal,
       rx_data(13) => Dangling_Input_Signal,
       rx_data(14) => Dangling_Input_Signal,
       rx_data(15) => Dangling_Input_Signal,
       x(0) => Dangling_Input_Signal,
       x(1) => Dangling_Input_Signal,
       x(2) => Dangling_Input_Signal,
       x(3) => Dangling_Input_Signal,
       clk0 => Dangling_Input_Signal,
       clk1 => Dangling_Input_Signal,
       clk2 => Dangling_Input_Signal,
       clk3 => Dangling_Input_Signal,
       reset_out => Dangling_Input_Signal,
       rx_wren => Dangling_Input_Signal,
       tx_clk => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end fake_top;
