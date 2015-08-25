-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ethernet_controller
-- Author      : Fermi User
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- File        : d:ProjectsotsdaqPicoZedActiveHDL_projethernet_controllercompileGEC.vhd
-- Generated   : Wed Aug 19 16:13:56 2015
-- From        : d:/Projects/otsdaq/PicoZed/ActiveHDL_proj/ethernet_controller/src/GEC.bde
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


entity GEC is
  port(
       GMII_RX_CLK : in STD_LOGIC;
       GMII_RX_DV : in STD_LOGIC;
       GMII_RX_ER : in STD_LOGIC;
       reset : in STD_LOGIC;
       user_trigger : in STD_LOGIC;
       GMII_RXD : in STD_LOGIC_VECTOR(7 downto 0);
       user_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       user_dest_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       user_dest_mac : in STD_LOGIC_VECTOR(47 downto 0);
       user_dest_port : in STD_LOGIC_VECTOR(15 downto 0);
       user_tx_data_in : in STD_LOGIC_VECTOR(7 downto 0);
       user_tx_size_in : in STD_LOGIC_VECTOR(10 downto 0);
       GMII_TX_EN : out STD_LOGIC;
       GMII_TX_ER : out STD_LOGIC;
       GTX_CLK : out STD_LOGIC;
       crc_err : out STD_LOGIC;
       four_bit_mode_out : out STD_LOGIC;
       user_busy : out STD_LOGIC;
       user_rx_valid_out : out STD_LOGIC;
       user_src_capture : out STD_LOGIC;
       user_tx_enable_out : out STD_LOGIC;
       GMII_TXD : out STD_LOGIC_VECTOR(7 downto 0);
       udp_fwd_port : out STD_LOGIC_VECTOR(15 downto 0);
       user_rx_data_out : out STD_LOGIC_VECTOR(7 downto 0);
       user_rx_size_out : out STD_LOGIC_VECTOR(10 downto 0);
       user_src_addrs : out STD_LOGIC_VECTOR(7 downto 0);
       user_src_mac : out STD_LOGIC_VECTOR(47 downto 0);
       user_src_port : out STD_LOGIC_VECTOR(15 downto 0)
  );
end GEC;

architecture GEC of GEC is

---- Component declarations -----

component CRC_splice
  port (
       clk : in STD_LOGIC;
       crc : in STD_LOGIC_VECTOR(7 downto 0);
       data : in STD_LOGIC_VECTOR(7 downto 0);
       four_bit_mode : in STD_LOGIC;
       rd : in STD_LOGIC;
       tx_en_in : in STD_LOGIC;
       tx_er_in : in STD_LOGIC;
       crc_mask : out STD_LOGIC;
       tx_en : out STD_LOGIC;
       tx_er : out STD_LOGIC;
       txd : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component CRC_chk
  port (
       CRC_chk_en : in STD_LOGIC;
       CRC_data : in STD_LOGIC_VECTOR(7 downto 0);
       CRC_en : in STD_LOGIC;
       CRC_init : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       CRC_err : out STD_LOGIC
  );
end component;
component CRC_gen
  port (
       CRC_rd : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Data_en : in STD_LOGIC;
       Frame_data : in STD_LOGIC_VECTOR(7 downto 0);
       Init : in STD_LOGIC;
       Reset : in STD_LOGIC;
       CRC_end : out STD_LOGIC;
       CRC_out : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component rgmii_data_handler
  port (
       clk : in STD_LOGIC;
       rx_data : in STD_LOGIC_VECTOR(3 downto 0);
       rx_dv : in STD_LOGIC;
       rx_rgmii_data : out STD_LOGIC_VECTOR(7 downto 0);
       rx_rgmii_dv : out STD_LOGIC;
       rx_rgmii_er : out STD_LOGIC
  );
end component;
component DIG_GEC
  port (
       GMII_RXD : in STD_LOGIC_VECTOR(7 downto 0);
       GMII_RX_CLK : in STD_LOGIC;
       GMII_RX_DV : in STD_LOGIC;
       GMII_RX_ER : in STD_LOGIC;
       dest_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       dest_mac : in STD_LOGIC_VECTOR(47 downto 0);
       dest_port : in STD_LOGIC_VECTOR(15 downto 0);
       is_rgmii : in STD_LOGIC;
       reset : in STD_LOGIC;
       trigger : in STD_LOGIC;
       user_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       user_tx_data_in : in STD_LOGIC_VECTOR(7 downto 0);
       user_tx_size_in : in STD_LOGIC_VECTOR(10 downto 0);
       GMII_GTX_CLK : out STD_LOGIC;
       GMII_TXD : out STD_LOGIC_VECTOR(7 downto 0);
       GMII_TX_EN : out STD_LOGIC;
       GMII_TX_ER : out STD_LOGIC;
       busy : out STD_LOGIC;
       crc_chk_din : out STD_LOGIC_VECTOR(7 downto 0);
       crc_chk_en : out STD_LOGIC;
       crc_chk_init : out STD_LOGIC;
       crc_chk_rd : out STD_LOGIC;
       crc_gen_en : out STD_LOGIC;
       crc_gen_init : out STD_LOGIC;
       crc_gen_rd : out STD_LOGIC;
       en_tx_data : out STD_LOGIC;
       four_bit_mode_out : out STD_LOGIC;
       src_addrs : out STD_LOGIC_VECTOR(7 downto 0);
       src_capture : out STD_LOGIC;
       src_mac : out STD_LOGIC_VECTOR(47 downto 0);
       src_port : out STD_LOGIC_VECTOR(15 downto 0);
       udp_data_count : out STD_LOGIC_VECTOR(10 downto 0);
       udp_dest_port : out STD_LOGIC_VECTOR(15 downto 0);
       user_rx_data_out : out STD_LOGIC_VECTOR(7 downto 0);
       user_rx_valid_out : out STD_LOGIC
  );
end component;
component rgmii_handler
  port (
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       rx_data : in STD_LOGIC_VECTOR(7 downto 0);
       rx_dv : in STD_LOGIC;
       rx_er : in STD_LOGIC;
       rx_rgmii_data : in STD_LOGIC_VECTOR(7 downto 0);
       rx_rgmii_dv : in STD_LOGIC;
       rx_rgmii_er : in STD_LOGIC;
       tx_data : in STD_LOGIC_VECTOR(7 downto 0);
       tx_dv : in STD_LOGIC;
       tx_er : in STD_LOGIC;
       is_rgmii : out STD_LOGIC;
       locked : out STD_LOGIC;
       rx_data_handled : out STD_LOGIC_VECTOR(7 downto 0);
       rx_dv_handled : out STD_LOGIC;
       rx_er_handled : out STD_LOGIC;
       tx_data_handled : out STD_LOGIC_VECTOR(7 downto 0);
       tx_dv_handled : out STD_LOGIC;
       tx_er_handled : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal crc_chk_en : STD_LOGIC;
signal crc_chk_init : STD_LOGIC;
signal crc_chk_rd : STD_LOGIC;
signal crc_gen_en : STD_LOGIC;
signal crc_gen_en_masked : STD_LOGIC;
signal crc_gen_init : STD_LOGIC;
signal crc_gen_rd : STD_LOGIC;
signal crc_gen_rd_masked : STD_LOGIC;
signal crc_mask : STD_LOGIC;
signal four_bit_mode : STD_LOGIC;
signal is_rgmii : STD_LOGIC;
signal rx_dv_handled : STD_LOGIC;
signal rx_er_handled : STD_LOGIC;
signal rx_rgmii_dv : STD_LOGIC;
signal rx_rgmii_er : STD_LOGIC;
signal tx_dv : STD_LOGIC;
signal tx_dv_out : STD_LOGIC;
signal tx_er : STD_LOGIC;
signal tx_er_out : STD_LOGIC;
signal crc_chk_din : STD_LOGIC_VECTOR(7 downto 0);
signal crc_gen_out : STD_LOGIC_VECTOR(7 downto 0);
signal GMII_RXD_sig : STD_LOGIC_VECTOR(7 downto 0);
signal rx_data_handled : STD_LOGIC_VECTOR(7 downto 0);
signal rx_rgmii_data : STD_LOGIC_VECTOR(7 downto 0);
signal txd : STD_LOGIC_VECTOR(7 downto 0);
signal txd_out : STD_LOGIC_VECTOR(7 downto 0);

begin

----  Component instantiations  ----

DIG_GEC_Block : DIG_GEC
  port map(
       GMII_GTX_CLK => GTX_CLK,
       GMII_RXD => rx_data_handled,
       GMII_RX_CLK => GMII_RX_CLK,
       GMII_RX_DV => rx_dv_handled,
       GMII_RX_ER => rx_er_handled,
       GMII_TXD => txd,
       GMII_TX_EN => tx_dv,
       GMII_TX_ER => tx_er,
       busy => user_busy,
       crc_chk_din => crc_chk_din,
       crc_chk_en => crc_chk_en,
       crc_chk_init => crc_chk_init,
       crc_chk_rd => crc_chk_rd,
       crc_gen_en => crc_gen_en,
       crc_gen_init => crc_gen_init,
       crc_gen_rd => crc_gen_rd,
       dest_addrs => user_dest_addrs,
       dest_mac => user_dest_mac,
       dest_port => user_dest_port,
       en_tx_data => user_tx_enable_out,
       four_bit_mode_out => four_bit_mode,
       is_rgmii => is_rgmii,
       reset => reset,
       src_addrs => user_src_addrs,
       src_capture => user_src_capture,
       src_mac => user_src_mac,
       src_port => user_src_port,
       trigger => user_trigger,
       udp_data_count => user_rx_size_out,
       udp_dest_port => udp_fwd_port,
       user_addrs => user_addrs,
       user_rx_data_out => user_rx_data_out,
       user_rx_valid_out => user_rx_valid_out,
       user_tx_data_in => user_tx_data_in,
       user_tx_size_in => user_tx_size_in
  );

RGMII_Block : rgmii_handler
  port map(
       clk => GMII_RX_CLK,
       is_rgmii => is_rgmii,
       reset => reset,
       rx_data => GMII_RXD_sig,
       rx_data_handled => rx_data_handled,
       rx_dv => GMII_RX_DV,
       rx_dv_handled => rx_dv_handled,
       rx_er => GMII_RX_ER,
       rx_er_handled => rx_er_handled,
       rx_rgmii_data => rx_rgmii_data,
       rx_rgmii_dv => rx_rgmii_dv,
       rx_rgmii_er => rx_rgmii_er,
       tx_data => txd_out,
       tx_data_handled => GMII_TXD,
       tx_dv => tx_dv_out,
       tx_dv_handled => GMII_TX_EN,
       tx_er => tx_er_out,
       tx_er_handled => GMII_TX_ER
  );

RGMII_Conditioner : rgmii_data_handler
  port map(
       rx_data(0) => GMII_RXD_sig(0),
       rx_data(1) => GMII_RXD_sig(1),
       rx_data(2) => GMII_RXD_sig(2),
       rx_data(3) => GMII_RXD_sig(3),
       clk => GMII_RX_CLK,
       rx_dv => GMII_RX_DV,
       rx_rgmii_data => rx_rgmii_data,
       rx_rgmii_dv => rx_rgmii_dv,
       rx_rgmii_er => rx_rgmii_er
  );

crc_gen_en_masked <= crc_gen_en and crc_mask;

crc_gen_rd_masked <= crc_gen_rd and crc_mask;

crcChk : CRC_chk
  port map(
       CRC_chk_en => crc_chk_rd,
       CRC_data => crc_chk_din,
       CRC_en => crc_chk_en,
       CRC_err => crc_err,
       CRC_init => crc_chk_init,
       Clk => GMII_RX_CLK,
       Reset => reset
  );

crcGen : CRC_gen
  port map(
       CRC_out => crc_gen_out,
       CRC_rd => crc_gen_rd_masked,
       Clk => GMII_RX_CLK,
       Data_en => crc_gen_en_masked,
       Frame_data => txd,
       Init => crc_gen_init,
       Reset => reset
  );

crcSplice : CRC_splice
  port map(
       clk => GMII_RX_CLK,
       crc => crc_gen_out,
       crc_mask => crc_mask,
       data => txd,
       four_bit_mode => four_bit_mode,
       rd => crc_gen_rd,
       tx_en => tx_dv_out,
       tx_en_in => tx_dv,
       tx_er => tx_er_out,
       tx_er_in => tx_er,
       txd => txd_out
  );


---- Terminal assignment ----

    -- Inputs terminals
	GMII_RXD_sig <= GMII_RXD;

    -- Outputbuffer terminals
	four_bit_mode_out <= four_bit_mode;


end GEC;
