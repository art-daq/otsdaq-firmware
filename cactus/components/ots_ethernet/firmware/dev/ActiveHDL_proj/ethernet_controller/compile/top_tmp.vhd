-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ethernet_controller
-- Author      : Fermi User
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- File        : d:\Projects\otsdaq\PicoZed\ActiveHDL_proj\ethernet_controller\compile\top_tmp.vhd
-- Generated   : Tue Nov  3 13:32:29 2015
-- From        : d:/Projects/otsdaq/PicoZed/ActiveHDL_proj/ethernet_controller/src/top_tmp.bde
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
       gec_user_dest_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       gec_user_dest_mac : in STD_LOGIC_VECTOR(47 downto 0);
       gec_user_dest_port : in STD_LOGIC_VECTOR(15 downto 0);
       reset_in : in STD_LOGIC;
       tx_data : in STD_LOGIC_VECTOR(63 downto 0);
       user_ready : in STD_LOGIC;
       PHY_TXD : out STD_LOGIC_VECTOR(7 downto 0);
       PHY_TX_EN : out STD_LOGIC;
       PHY_TX_ER : out STD_LOGIC;
       TX_CLK : out STD_LOGIC;
       b_enable : out STD_LOGIC;
       gec_user_src_addrs : out STD_LOGIC_VECTOR(7 downto 0);
       gec_user_src_capture : out STD_LOGIC;
       gec_user_src_mac : out STD_LOGIC_VECTOR(47 downto 0);
       gec_user_src_port : out STD_LOGIC_VECTOR(15 downto 0);
       reset_out : out STD_LOGIC;
       rx_addr : out STD_LOGIC_VECTOR(63 downto 0);
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
       gec_user_dest_addrs(0) => Dangling_Input_Signal,
       gec_user_dest_addrs(1) => Dangling_Input_Signal,
       gec_user_dest_addrs(2) => Dangling_Input_Signal,
       gec_user_dest_addrs(3) => Dangling_Input_Signal,
       gec_user_dest_addrs(4) => Dangling_Input_Signal,
       gec_user_dest_addrs(5) => Dangling_Input_Signal,
       gec_user_dest_addrs(6) => Dangling_Input_Signal,
       gec_user_dest_addrs(7) => Dangling_Input_Signal,
       gec_user_dest_mac(0) => Dangling_Input_Signal,
       gec_user_dest_mac(1) => Dangling_Input_Signal,
       gec_user_dest_mac(2) => Dangling_Input_Signal,
       gec_user_dest_mac(3) => Dangling_Input_Signal,
       gec_user_dest_mac(4) => Dangling_Input_Signal,
       gec_user_dest_mac(5) => Dangling_Input_Signal,
       gec_user_dest_mac(6) => Dangling_Input_Signal,
       gec_user_dest_mac(7) => Dangling_Input_Signal,
       gec_user_dest_mac(8) => Dangling_Input_Signal,
       gec_user_dest_mac(9) => Dangling_Input_Signal,
       gec_user_dest_mac(10) => Dangling_Input_Signal,
       gec_user_dest_mac(11) => Dangling_Input_Signal,
       gec_user_dest_mac(12) => Dangling_Input_Signal,
       gec_user_dest_mac(13) => Dangling_Input_Signal,
       gec_user_dest_mac(14) => Dangling_Input_Signal,
       gec_user_dest_mac(15) => Dangling_Input_Signal,
       gec_user_dest_mac(16) => Dangling_Input_Signal,
       gec_user_dest_mac(17) => Dangling_Input_Signal,
       gec_user_dest_mac(18) => Dangling_Input_Signal,
       gec_user_dest_mac(19) => Dangling_Input_Signal,
       gec_user_dest_mac(20) => Dangling_Input_Signal,
       gec_user_dest_mac(21) => Dangling_Input_Signal,
       gec_user_dest_mac(22) => Dangling_Input_Signal,
       gec_user_dest_mac(23) => Dangling_Input_Signal,
       gec_user_dest_mac(24) => Dangling_Input_Signal,
       gec_user_dest_mac(25) => Dangling_Input_Signal,
       gec_user_dest_mac(26) => Dangling_Input_Signal,
       gec_user_dest_mac(27) => Dangling_Input_Signal,
       gec_user_dest_mac(28) => Dangling_Input_Signal,
       gec_user_dest_mac(29) => Dangling_Input_Signal,
       gec_user_dest_mac(30) => Dangling_Input_Signal,
       gec_user_dest_mac(31) => Dangling_Input_Signal,
       gec_user_dest_mac(32) => Dangling_Input_Signal,
       gec_user_dest_mac(33) => Dangling_Input_Signal,
       gec_user_dest_mac(34) => Dangling_Input_Signal,
       gec_user_dest_mac(35) => Dangling_Input_Signal,
       gec_user_dest_mac(36) => Dangling_Input_Signal,
       gec_user_dest_mac(37) => Dangling_Input_Signal,
       gec_user_dest_mac(38) => Dangling_Input_Signal,
       gec_user_dest_mac(39) => Dangling_Input_Signal,
       gec_user_dest_mac(40) => Dangling_Input_Signal,
       gec_user_dest_mac(41) => Dangling_Input_Signal,
       gec_user_dest_mac(42) => Dangling_Input_Signal,
       gec_user_dest_mac(43) => Dangling_Input_Signal,
       gec_user_dest_mac(44) => Dangling_Input_Signal,
       gec_user_dest_mac(45) => Dangling_Input_Signal,
       gec_user_dest_mac(46) => Dangling_Input_Signal,
       gec_user_dest_mac(47) => Dangling_Input_Signal,
       gec_user_dest_port(0) => Dangling_Input_Signal,
       gec_user_dest_port(1) => Dangling_Input_Signal,
       gec_user_dest_port(2) => Dangling_Input_Signal,
       gec_user_dest_port(3) => Dangling_Input_Signal,
       gec_user_dest_port(4) => Dangling_Input_Signal,
       gec_user_dest_port(5) => Dangling_Input_Signal,
       gec_user_dest_port(6) => Dangling_Input_Signal,
       gec_user_dest_port(7) => Dangling_Input_Signal,
       gec_user_dest_port(8) => Dangling_Input_Signal,
       gec_user_dest_port(9) => Dangling_Input_Signal,
       gec_user_dest_port(10) => Dangling_Input_Signal,
       gec_user_dest_port(11) => Dangling_Input_Signal,
       gec_user_dest_port(12) => Dangling_Input_Signal,
       gec_user_dest_port(13) => Dangling_Input_Signal,
       gec_user_dest_port(14) => Dangling_Input_Signal,
       gec_user_dest_port(15) => Dangling_Input_Signal,
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
       b_data_we => Dangling_Input_Signal,
       b_force_packet => Dangling_Input_Signal,
       reset_in => Dangling_Input_Signal,
       user_ready => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end top_tmp;
