-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ethernet_controller
-- Author      : Fermi User
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- File        : d:\Projects\otsdaq\OtS Ethernet MAC firmware\ActiveHDL_proj\ethernet_controller\compile\top_tmp.vhd
-- Generated   : Mon Feb 29 11:09:35 2016
-- From        : d:/Projects/otsdaq/OtS Ethernet MAC firmware/ActiveHDL_proj/ethernet_controller/src/top_tmp.bde
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


entity top_tmp is 
end top_tmp;

architecture top_tmp of top_tmp is

---- Component declarations -----

component ethernet_interface
  port (
       MASTER_CLK : in STD_LOGIC;
       PHY_RXD : in STD_LOGIC_VECTOR(7 downto 0);
       PHY_RX_DV : in STD_LOGIC;
       PHY_RX_ER : in STD_LOGIC;
       b_data : in STD_LOGIC_VECTOR(63 downto 0);
       b_data_we : in STD_LOGIC;
       b_force_packet : in STD_LOGIC;
       internal_addr : in STD_LOGIC_VECTOR(31 downto 0);
       internal_block_sel : in STD_LOGIC_VECTOR(31 downto 0);
       internal_din : in STD_LOGIC_VECTOR(63 downto 0);
       internal_we : in STD_LOGIC;
       ready : in STD_LOGIC;
       reset_in : in STD_LOGIC;
       tx_data : in STD_LOGIC_VECTOR(63 downto 0);
       user_addr : in STD_LOGIC_VECTOR(7 downto 0);
       PHY_TXD : out STD_LOGIC_VECTOR(7 downto 0);
       PHY_TX_EN : out STD_LOGIC;
       PHY_TX_ER : out STD_LOGIC;
       TX_CLK : out STD_LOGIC;
       b_enable : out STD_LOGIC;
       internal_dout : out STD_LOGIC_VECTOR(63 downto 0);
       reset_out : out STD_LOGIC;
       rx_addr : out STD_LOGIC_VECTOR(31 downto 0);
       rx_data : out STD_LOGIC_VECTOR(63 downto 0);
       rx_wren : out STD_LOGIC;
       tx_rden : out STD_LOGIC
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : ethernet_interface
  port map(
       b_data(0) => Dangling_Input_Signal,
       b_data(1) => Dangling_Input_Signal,
       b_data(2) => Dangling_Input_Signal,
       b_data(3) => Dangling_Input_Signal,
       b_data(4) => Dangling_Input_Signal,
       b_data(5) => Dangling_Input_Signal,
       b_data(6) => Dangling_Input_Signal,
       b_data(7) => Dangling_Input_Signal,
       b_data(8) => Dangling_Input_Signal,
       b_data(9) => Dangling_Input_Signal,
       b_data(10) => Dangling_Input_Signal,
       b_data(11) => Dangling_Input_Signal,
       b_data(12) => Dangling_Input_Signal,
       b_data(13) => Dangling_Input_Signal,
       b_data(14) => Dangling_Input_Signal,
       b_data(15) => Dangling_Input_Signal,
       b_data(16) => Dangling_Input_Signal,
       b_data(17) => Dangling_Input_Signal,
       b_data(18) => Dangling_Input_Signal,
       b_data(19) => Dangling_Input_Signal,
       b_data(20) => Dangling_Input_Signal,
       b_data(21) => Dangling_Input_Signal,
       b_data(22) => Dangling_Input_Signal,
       b_data(23) => Dangling_Input_Signal,
       b_data(24) => Dangling_Input_Signal,
       b_data(25) => Dangling_Input_Signal,
       b_data(26) => Dangling_Input_Signal,
       b_data(27) => Dangling_Input_Signal,
       b_data(28) => Dangling_Input_Signal,
       b_data(29) => Dangling_Input_Signal,
       b_data(30) => Dangling_Input_Signal,
       b_data(31) => Dangling_Input_Signal,
       b_data(32) => Dangling_Input_Signal,
       b_data(33) => Dangling_Input_Signal,
       b_data(34) => Dangling_Input_Signal,
       b_data(35) => Dangling_Input_Signal,
       b_data(36) => Dangling_Input_Signal,
       b_data(37) => Dangling_Input_Signal,
       b_data(38) => Dangling_Input_Signal,
       b_data(39) => Dangling_Input_Signal,
       b_data(40) => Dangling_Input_Signal,
       b_data(41) => Dangling_Input_Signal,
       b_data(42) => Dangling_Input_Signal,
       b_data(43) => Dangling_Input_Signal,
       b_data(44) => Dangling_Input_Signal,
       b_data(45) => Dangling_Input_Signal,
       b_data(46) => Dangling_Input_Signal,
       b_data(47) => Dangling_Input_Signal,
       b_data(48) => Dangling_Input_Signal,
       b_data(49) => Dangling_Input_Signal,
       b_data(50) => Dangling_Input_Signal,
       b_data(51) => Dangling_Input_Signal,
       b_data(52) => Dangling_Input_Signal,
       b_data(53) => Dangling_Input_Signal,
       b_data(54) => Dangling_Input_Signal,
       b_data(55) => Dangling_Input_Signal,
       b_data(56) => Dangling_Input_Signal,
       b_data(57) => Dangling_Input_Signal,
       b_data(58) => Dangling_Input_Signal,
       b_data(59) => Dangling_Input_Signal,
       b_data(60) => Dangling_Input_Signal,
       b_data(61) => Dangling_Input_Signal,
       b_data(62) => Dangling_Input_Signal,
       b_data(63) => Dangling_Input_Signal,
       internal_addr(0) => Dangling_Input_Signal,
       internal_addr(1) => Dangling_Input_Signal,
       internal_addr(2) => Dangling_Input_Signal,
       internal_addr(3) => Dangling_Input_Signal,
       internal_addr(4) => Dangling_Input_Signal,
       internal_addr(5) => Dangling_Input_Signal,
       internal_addr(6) => Dangling_Input_Signal,
       internal_addr(7) => Dangling_Input_Signal,
       internal_addr(8) => Dangling_Input_Signal,
       internal_addr(9) => Dangling_Input_Signal,
       internal_addr(10) => Dangling_Input_Signal,
       internal_addr(11) => Dangling_Input_Signal,
       internal_addr(12) => Dangling_Input_Signal,
       internal_addr(13) => Dangling_Input_Signal,
       internal_addr(14) => Dangling_Input_Signal,
       internal_addr(15) => Dangling_Input_Signal,
       internal_addr(16) => Dangling_Input_Signal,
       internal_addr(17) => Dangling_Input_Signal,
       internal_addr(18) => Dangling_Input_Signal,
       internal_addr(19) => Dangling_Input_Signal,
       internal_addr(20) => Dangling_Input_Signal,
       internal_addr(21) => Dangling_Input_Signal,
       internal_addr(22) => Dangling_Input_Signal,
       internal_addr(23) => Dangling_Input_Signal,
       internal_addr(24) => Dangling_Input_Signal,
       internal_addr(25) => Dangling_Input_Signal,
       internal_addr(26) => Dangling_Input_Signal,
       internal_addr(27) => Dangling_Input_Signal,
       internal_addr(28) => Dangling_Input_Signal,
       internal_addr(29) => Dangling_Input_Signal,
       internal_addr(30) => Dangling_Input_Signal,
       internal_addr(31) => Dangling_Input_Signal,
       internal_block_sel(0) => Dangling_Input_Signal,
       internal_block_sel(1) => Dangling_Input_Signal,
       internal_block_sel(2) => Dangling_Input_Signal,
       internal_block_sel(3) => Dangling_Input_Signal,
       internal_block_sel(4) => Dangling_Input_Signal,
       internal_block_sel(5) => Dangling_Input_Signal,
       internal_block_sel(6) => Dangling_Input_Signal,
       internal_block_sel(7) => Dangling_Input_Signal,
       internal_block_sel(8) => Dangling_Input_Signal,
       internal_block_sel(9) => Dangling_Input_Signal,
       internal_block_sel(10) => Dangling_Input_Signal,
       internal_block_sel(11) => Dangling_Input_Signal,
       internal_block_sel(12) => Dangling_Input_Signal,
       internal_block_sel(13) => Dangling_Input_Signal,
       internal_block_sel(14) => Dangling_Input_Signal,
       internal_block_sel(15) => Dangling_Input_Signal,
       internal_block_sel(16) => Dangling_Input_Signal,
       internal_block_sel(17) => Dangling_Input_Signal,
       internal_block_sel(18) => Dangling_Input_Signal,
       internal_block_sel(19) => Dangling_Input_Signal,
       internal_block_sel(20) => Dangling_Input_Signal,
       internal_block_sel(21) => Dangling_Input_Signal,
       internal_block_sel(22) => Dangling_Input_Signal,
       internal_block_sel(23) => Dangling_Input_Signal,
       internal_block_sel(24) => Dangling_Input_Signal,
       internal_block_sel(25) => Dangling_Input_Signal,
       internal_block_sel(26) => Dangling_Input_Signal,
       internal_block_sel(27) => Dangling_Input_Signal,
       internal_block_sel(28) => Dangling_Input_Signal,
       internal_block_sel(29) => Dangling_Input_Signal,
       internal_block_sel(30) => Dangling_Input_Signal,
       internal_block_sel(31) => Dangling_Input_Signal,
       internal_din(0) => Dangling_Input_Signal,
       internal_din(1) => Dangling_Input_Signal,
       internal_din(2) => Dangling_Input_Signal,
       internal_din(3) => Dangling_Input_Signal,
       internal_din(4) => Dangling_Input_Signal,
       internal_din(5) => Dangling_Input_Signal,
       internal_din(6) => Dangling_Input_Signal,
       internal_din(7) => Dangling_Input_Signal,
       internal_din(8) => Dangling_Input_Signal,
       internal_din(9) => Dangling_Input_Signal,
       internal_din(10) => Dangling_Input_Signal,
       internal_din(11) => Dangling_Input_Signal,
       internal_din(12) => Dangling_Input_Signal,
       internal_din(13) => Dangling_Input_Signal,
       internal_din(14) => Dangling_Input_Signal,
       internal_din(15) => Dangling_Input_Signal,
       internal_din(16) => Dangling_Input_Signal,
       internal_din(17) => Dangling_Input_Signal,
       internal_din(18) => Dangling_Input_Signal,
       internal_din(19) => Dangling_Input_Signal,
       internal_din(20) => Dangling_Input_Signal,
       internal_din(21) => Dangling_Input_Signal,
       internal_din(22) => Dangling_Input_Signal,
       internal_din(23) => Dangling_Input_Signal,
       internal_din(24) => Dangling_Input_Signal,
       internal_din(25) => Dangling_Input_Signal,
       internal_din(26) => Dangling_Input_Signal,
       internal_din(27) => Dangling_Input_Signal,
       internal_din(28) => Dangling_Input_Signal,
       internal_din(29) => Dangling_Input_Signal,
       internal_din(30) => Dangling_Input_Signal,
       internal_din(31) => Dangling_Input_Signal,
       internal_din(32) => Dangling_Input_Signal,
       internal_din(33) => Dangling_Input_Signal,
       internal_din(34) => Dangling_Input_Signal,
       internal_din(35) => Dangling_Input_Signal,
       internal_din(36) => Dangling_Input_Signal,
       internal_din(37) => Dangling_Input_Signal,
       internal_din(38) => Dangling_Input_Signal,
       internal_din(39) => Dangling_Input_Signal,
       internal_din(40) => Dangling_Input_Signal,
       internal_din(41) => Dangling_Input_Signal,
       internal_din(42) => Dangling_Input_Signal,
       internal_din(43) => Dangling_Input_Signal,
       internal_din(44) => Dangling_Input_Signal,
       internal_din(45) => Dangling_Input_Signal,
       internal_din(46) => Dangling_Input_Signal,
       internal_din(47) => Dangling_Input_Signal,
       internal_din(48) => Dangling_Input_Signal,
       internal_din(49) => Dangling_Input_Signal,
       internal_din(50) => Dangling_Input_Signal,
       internal_din(51) => Dangling_Input_Signal,
       internal_din(52) => Dangling_Input_Signal,
       internal_din(53) => Dangling_Input_Signal,
       internal_din(54) => Dangling_Input_Signal,
       internal_din(55) => Dangling_Input_Signal,
       internal_din(56) => Dangling_Input_Signal,
       internal_din(57) => Dangling_Input_Signal,
       internal_din(58) => Dangling_Input_Signal,
       internal_din(59) => Dangling_Input_Signal,
       internal_din(60) => Dangling_Input_Signal,
       internal_din(61) => Dangling_Input_Signal,
       internal_din(62) => Dangling_Input_Signal,
       internal_din(63) => Dangling_Input_Signal,
       MASTER_CLK => Dangling_Input_Signal,
       PHY_RXD(0) => Dangling_Input_Signal,
       PHY_RXD(1) => Dangling_Input_Signal,
       PHY_RXD(2) => Dangling_Input_Signal,
       PHY_RXD(3) => Dangling_Input_Signal,
       PHY_RXD(4) => Dangling_Input_Signal,
       PHY_RXD(5) => Dangling_Input_Signal,
       PHY_RXD(6) => Dangling_Input_Signal,
       PHY_RXD(7) => Dangling_Input_Signal,
       PHY_RX_DV => Dangling_Input_Signal,
       PHY_RX_ER => Dangling_Input_Signal,
       tx_data(0) => Dangling_Input_Signal,
       tx_data(1) => Dangling_Input_Signal,
       tx_data(2) => Dangling_Input_Signal,
       tx_data(3) => Dangling_Input_Signal,
       tx_data(4) => Dangling_Input_Signal,
       tx_data(5) => Dangling_Input_Signal,
       tx_data(6) => Dangling_Input_Signal,
       tx_data(7) => Dangling_Input_Signal,
       tx_data(8) => Dangling_Input_Signal,
       tx_data(9) => Dangling_Input_Signal,
       tx_data(10) => Dangling_Input_Signal,
       tx_data(11) => Dangling_Input_Signal,
       tx_data(12) => Dangling_Input_Signal,
       tx_data(13) => Dangling_Input_Signal,
       tx_data(14) => Dangling_Input_Signal,
       tx_data(15) => Dangling_Input_Signal,
       tx_data(16) => Dangling_Input_Signal,
       tx_data(17) => Dangling_Input_Signal,
       tx_data(18) => Dangling_Input_Signal,
       tx_data(19) => Dangling_Input_Signal,
       tx_data(20) => Dangling_Input_Signal,
       tx_data(21) => Dangling_Input_Signal,
       tx_data(22) => Dangling_Input_Signal,
       tx_data(23) => Dangling_Input_Signal,
       tx_data(24) => Dangling_Input_Signal,
       tx_data(25) => Dangling_Input_Signal,
       tx_data(26) => Dangling_Input_Signal,
       tx_data(27) => Dangling_Input_Signal,
       tx_data(28) => Dangling_Input_Signal,
       tx_data(29) => Dangling_Input_Signal,
       tx_data(30) => Dangling_Input_Signal,
       tx_data(31) => Dangling_Input_Signal,
       tx_data(32) => Dangling_Input_Signal,
       tx_data(33) => Dangling_Input_Signal,
       tx_data(34) => Dangling_Input_Signal,
       tx_data(35) => Dangling_Input_Signal,
       tx_data(36) => Dangling_Input_Signal,
       tx_data(37) => Dangling_Input_Signal,
       tx_data(38) => Dangling_Input_Signal,
       tx_data(39) => Dangling_Input_Signal,
       tx_data(40) => Dangling_Input_Signal,
       tx_data(41) => Dangling_Input_Signal,
       tx_data(42) => Dangling_Input_Signal,
       tx_data(43) => Dangling_Input_Signal,
       tx_data(44) => Dangling_Input_Signal,
       tx_data(45) => Dangling_Input_Signal,
       tx_data(46) => Dangling_Input_Signal,
       tx_data(47) => Dangling_Input_Signal,
       tx_data(48) => Dangling_Input_Signal,
       tx_data(49) => Dangling_Input_Signal,
       tx_data(50) => Dangling_Input_Signal,
       tx_data(51) => Dangling_Input_Signal,
       tx_data(52) => Dangling_Input_Signal,
       tx_data(53) => Dangling_Input_Signal,
       tx_data(54) => Dangling_Input_Signal,
       tx_data(55) => Dangling_Input_Signal,
       tx_data(56) => Dangling_Input_Signal,
       tx_data(57) => Dangling_Input_Signal,
       tx_data(58) => Dangling_Input_Signal,
       tx_data(59) => Dangling_Input_Signal,
       tx_data(60) => Dangling_Input_Signal,
       tx_data(61) => Dangling_Input_Signal,
       tx_data(62) => Dangling_Input_Signal,
       tx_data(63) => Dangling_Input_Signal,
       user_addr(0) => Dangling_Input_Signal,
       user_addr(1) => Dangling_Input_Signal,
       user_addr(2) => Dangling_Input_Signal,
       user_addr(3) => Dangling_Input_Signal,
       user_addr(4) => Dangling_Input_Signal,
       user_addr(5) => Dangling_Input_Signal,
       user_addr(6) => Dangling_Input_Signal,
       user_addr(7) => Dangling_Input_Signal,
       b_data_we => Dangling_Input_Signal,
       b_force_packet => Dangling_Input_Signal,
       internal_we => Dangling_Input_Signal,
       ready => Dangling_Input_Signal,
       reset_in => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end top_tmp;
