-------------------------------------------------------------------------------
--
-- Title       : DIG Gigabit Ethernet Controller
-- Design      : ethernet_controller
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\phansen2\Desktop\ActiveHDL_proj\ethernet_controller\compile\ethernet_controller.vhd
-- Generated   : Tue Jan 12 15:42:07 2016
-- From        : C:/Users/phansen2/Desktop/ActiveHDL_proj/ethernet_controller/src/ethernet_controller.bde
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


entity ethernet_controller is
  port(
       GMII_RX_CLK : in STD_LOGIC;
       GMII_RX_DV : in STD_LOGIC;
       GMII_RX_ER : in STD_LOGIC;
       reset : in STD_LOGIC;
       trigger : in STD_LOGIC;
       GMII_RXD : in STD_LOGIC_VECTOR(7 downto 0);
       addrs : in STD_LOGIC_VECTOR(7 downto 0);
       dest_addrs : in STD_LOGIC_VECTOR(7 downto 0);
       dest_mac : in STD_LOGIC_VECTOR(47 downto 0);
       dest_port : in STD_LOGIC_VECTOR(15 downto 0);
       user_tx_data_in : in std_logic_vector(7 downto 0);
       user_tx_size_in : in STD_LOGIC_VECTOR(10 downto 0);
       GMII_GTX_CLK : out STD_LOGIC;
       GMII_TX_EN : out STD_LOGIC;
       GMII_TX_ER : out STD_LOGIC;
       busy : out STD_LOGIC;
       crc_chk_en : out STD_LOGIC;
       crc_chk_init : out STD_LOGIC;
       crc_chk_rd : out STD_LOGIC;
       crc_gen_en : out std_logic;
       crc_gen_init : out std_logic;
       crc_gen_rd : out std_logic;
       en_tx_data : out STD_LOGIC;
       four_bit_mode_out : out STD_LOGIC;
       src_capture : out STD_LOGIC;
       user_rx_valid_out : out STD_LOGIC;
       GMII_TXD : out STD_LOGIC_VECTOR(7 downto 0);
       crc_chk_din : out STD_LOGIC_VECTOR(7 downto 0);
       src_addrs : out STD_LOGIC_VECTOR(7 downto 0);
       src_mac : out STD_LOGIC_VECTOR(47 downto 0);
       src_port : out STD_LOGIC_VECTOR(15 downto 0);
       udp_data_count : out STD_LOGIC_VECTOR(10 downto 0);
       udp_dest_port : out STD_LOGIC_VECTOR(15 downto 0);
       user_rx_data_out : out STD_LOGIC_VECTOR(7 downto 0)
  );
end ethernet_controller;

architecture arch of ethernet_controller is

---- Component declarations -----

component address_container
  port (
       addr_in : in STD_LOGIC_VECTOR(7 downto 0);
       capture : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       user_addr_in : in STD_LOGIC_VECTOR(7 downto 0);
       addr : out STD_LOGIC_VECTOR(7 downto 0);
       arp_announce_strobe : out STD_LOGIC;
       protocol_ping_strobe : out STD_LOGIC
  );
end component;
component icmp_ping_checksum_calc
  port (
       clk : in STD_LOGIC;
       req_chk_sum : in STD_LOGIC_VECTOR(15 downto 0);
       reset : in STD_LOGIC;
       trigger : in STD_LOGIC;
       resp_chk_sum : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component icmp_ping_shift_reg
  port (
       clk : in STD_LOGIC;
       din : in STD_LOGIC_VECTOR(7 downto 0);
       ds_clken : in STD_LOGIC;
       us_clken : in STD_LOGIC;
       dout : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component user_addrs_mux
  port (
       icmp_dest_addr : in STD_LOGIC_VECTOR(7 downto 0);
       icmp_length : in STD_LOGIC_VECTOR(10 downto 0);
       icmp_mode : in STD_LOGIC;
       ping_mode : in STD_LOGIC;
       user_dest_addr : in STD_LOGIC_VECTOR(7 downto 0);
       user_length : in STD_LOGIC_VECTOR(10 downto 0);
       ip_dest_addr : out STD_LOGIC_VECTOR(7 downto 0);
       ip_tx_length : out STD_LOGIC_VECTOR(10 downto 0)
  );
end component;
component arp_reply
  port (
       addrs : in STD_LOGIC_VECTOR(7 downto 0);
       arp_announce : in STD_LOGIC;
       clk : in STD_LOGIC;
       four_bit_mode : in STD_LOGIC;
       reset : in STD_LOGIC;
       tip : in STD_LOGIC_VECTOR(31 downto 0);
       tmac : in STD_LOGIC_VECTOR(47 downto 0);
       trigger : in STD_LOGIC;
       udp_busy : in STD_LOGIC;
       arp_busy : out STD_LOGIC;
       crc_gen_en : out STD_LOGIC;
       crc_gen_init : out STD_LOGIC;
       crc_gen_rd : out STD_LOGIC;
       dataout : out STD_LOGIC_VECTOR(7 downto 0);
       tx_en : out STD_LOGIC;
       tx_er : out STD_LOGIC
  );
end component;
component create_packet
  port (
       addrs : in STD_LOGIC_VECTOR(7 downto 0);
       arp_busy : in STD_LOGIC;
       checksum : in STD_LOGIC_VECTOR(15 downto 0);
       clk : in STD_LOGIC;
       data_length : in STD_LOGIC_VECTOR(10 downto 0);
       dest_ip : in STD_LOGIC_VECTOR(31 downto 0);
       dest_mac : in STD_LOGIC_VECTOR(47 downto 0);
       dest_port : in STD_LOGIC_VECTOR(15 downto 0);
       four_bit_mode : in STD_LOGIC;
       icmp_checksum : in STD_LOGIC_VECTOR(15 downto 0);
       icmp_data : in STD_LOGIC_VECTOR(7 downto 0);
       icmp_ip : in STD_LOGIC_VECTOR(31 downto 0);
       icmp_mac : in STD_LOGIC_VECTOR(47 downto 0);
       icmp_ping : in STD_LOGIC;
       ping : in STD_LOGIC;
       reset : in STD_LOGIC;
       trigger : in STD_LOGIC;
       busy : out STD_LOGIC;
       clken_out : out STD_LOGIC;
       crc_gen_en : out STD_LOGIC;
       crc_gen_init : out STD_LOGIC;
       crc_gen_rd : out STD_LOGIC;
       dataout : out STD_LOGIC_VECTOR(7 downto 0);
       en_tx_data : out STD_LOGIC;
       length_count_out : out STD_LOGIC_VECTOR(10 downto 0);
       tx_en : out STD_LOGIC;
       tx_er : out STD_LOGIC;
       tx_icmp_packet : out STD_LOGIC;
       udp_data_sel : out STD_LOGIC
  );
end component;
component dataout_mux
  port (
       arp_data_out : in STD_LOGIC_VECTOR(7 downto 0);
       arp_tx_en : in STD_LOGIC;
       arp_tx_er : in STD_LOGIC;
       sel_udp : in STD_LOGIC;
       udp_data_out : in STD_LOGIC_VECTOR(7 downto 0);
       udp_tx_en : in STD_LOGIC;
       udp_tx_er : in STD_LOGIC;
       tx_en : out STD_LOGIC;
       tx_er : out STD_LOGIC;
       txd : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component decipherer
  port (
       addrs : in STD_LOGIC_VECTOR(7 downto 0);
       clk : in STD_LOGIC;
       data_in : in STD_LOGIC_VECTOR(7 downto 0);
       dv : in STD_LOGIC;
       er : in STD_LOGIC;
       reset : in STD_LOGIC;
       arp_req_ip : out STD_LOGIC_VECTOR(31 downto 0);
       arp_req_mac : out STD_LOGIC_VECTOR(47 downto 0);
       arp_search_ip : out STD_LOGIC_VECTOR(31 downto 0);
       capture_source_addrs : out STD_LOGIC;
       clken_out : out STD_LOGIC;
       crc_chk_en : out STD_LOGIC;
       crc_chk_init : out STD_LOGIC;
       crc_chk_rd : out STD_LOGIC;
       data_out : out STD_LOGIC_VECTOR(7 downto 0);
       dest_mac : out STD_LOGIC_VECTOR(47 downto 0);
       four_bit_mode_out : out STD_LOGIC;
       icmp_checksum : out STD_LOGIC_VECTOR(15 downto 0);
       is_arp : out STD_LOGIC;
       is_icmp_ping : out STD_LOGIC;
       is_idle : out STD_LOGIC;
       is_ip : out STD_LOGIC;
       is_udp : out STD_LOGIC;
       src_mac : out STD_LOGIC_VECTOR(47 downto 0);
       udp_data_count : out STD_LOGIC_VECTOR(10 downto 0);
       udp_data_valid : out STD_LOGIC;
       udp_dest_port : out STD_LOGIC_VECTOR(15 downto 0);
       udp_src_ip : out STD_LOGIC_VECTOR(31 downto 0);
       udp_src_port : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component dest_info_container
  port (
       dest_addrs_in : in STD_LOGIC_VECTOR(7 downto 0);
       dest_ip : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component filter_data_out
  port (
       clk : in STD_LOGIC;
       enable : in STD_LOGIC;
       rx_data : in STD_LOGIC_VECTOR(7 downto 0);
       us_clken : in STD_LOGIC;
       out_data : out STD_LOGIC_VECTOR(7 downto 0);
       out_data_valid : out STD_LOGIC
  );
end component;
component ip_checksum_calc
  port (
       addrsDest : in STD_LOGIC_VECTOR(7 downto 0);
       addrsSrc : in STD_LOGIC_VECTOR(7 downto 0);
       clk : in STD_LOGIC;
       icmp_mode : in STD_LOGIC;
       length : in STD_LOGIC_VECTOR(10 downto 0);
       reset : in STD_LOGIC;
       trigger : in STD_LOGIC;
       cs : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component or33
  port (
       a1 : in std_logic;
       a2 : in std_logic;
       b1 : in std_logic;
       b2 : in std_logic;
       c1 : in std_logic;
       c2 : in std_logic;
       ao : out std_logic;
       bo : out std_logic;
       co : out std_logic
  );
end component;
component udp_data_splicer
  port (
       clk : in std_logic;
       gen_data : in std_logic_vector(7 downto 0);
       sel_user : in std_logic;
       user_data : in std_logic_vector(7 downto 0);
       udp_data_out : out std_logic_vector(7 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal arp_announce_strobe : STD_LOGIC;
signal arp_busy : STD_LOGIC;
signal arp_crc_gen_en_sig : STD_LOGIC;
signal arp_crc_gen_init_sig : STD_LOGIC;
signal arp_crc_gen_rd_sig : STD_LOGIC;
signal arp_trigger : STD_LOGIC;
signal arp_tx_en : STD_LOGIC;
signal arp_tx_er : STD_LOGIC;
signal busy_sig : STD_LOGIC;
signal capture_addrs : STD_LOGIC;
signal clk : STD_LOGIC;
signal crc_chk_en_sig : STD_LOGIC;
signal crc_chk_init_sig : STD_LOGIC;
signal crc_chk_rd_sig : STD_LOGIC;
signal crc_gen_en_sig : std_logic;
signal crc_gen_init_sig : std_logic;
signal crc_gen_rd_sig : std_logic;
signal create_clken : STD_LOGIC;
signal decipher_clken : STD_LOGIC;
signal dec_chk_rd_sig : STD_LOGIC;
signal en_tx_data_sig : STD_LOGIC;
signal four_bit_mode : STD_LOGIC;
signal is_arp_packet_sig : STD_LOGIC;
signal is_icmp_packet_sig : STD_LOGIC;
signal is_ip_packet_sig : STD_LOGIC;
signal oei_protocol_ping_strobe : STD_LOGIC;
signal rx_dv : STD_LOGIC;
signal rx_er : STD_LOGIC;
signal sel_udp : STD_LOGIC;
signal trigger_sig : STD_LOGIC;
signal tx_en : STD_LOGIC;
signal tx_er : STD_LOGIC;
signal tx_icmp_packet : STD_LOGIC;
signal udp_crc_gen_en_sig : std_logic;
signal udp_crc_gen_init_sig : std_logic;
signal udp_crc_gen_rd_sig : std_logic;
signal udp_data_valid : STD_LOGIC;
signal udp_tx_en : STD_LOGIC;
signal udp_tx_er : STD_LOGIC;
signal addrs_sig : STD_LOGIC_VECTOR(7 downto 0);
signal arp_data_out : STD_LOGIC_VECTOR(7 downto 0);
signal arp_req_ip : STD_LOGIC_VECTOR(31 downto 0);
signal arp_req_mac : STD_LOGIC_VECTOR(47 downto 0);
signal checksum : STD_LOGIC_VECTOR(15 downto 0);
signal data_out : STD_LOGIC_VECTOR(7 downto 0);
signal decipher_dout : STD_LOGIC_VECTOR(7 downto 0);
signal dest_ip : STD_LOGIC_VECTOR(31 downto 0);
signal frame_src_mac : STD_LOGIC_VECTOR(47 downto 0);
signal icmp_checksum : STD_LOGIC_VECTOR(15 downto 0);
signal icmp_req_checksum : STD_LOGIC_VECTOR(15 downto 0);
signal ip_data_count_sig : STD_LOGIC_VECTOR(10 downto 0);
signal ip_dest_addrs : STD_LOGIC_VECTOR(7 downto 0);
signal ping_data_delayed : STD_LOGIC_VECTOR(7 downto 0);
signal rxd : STD_LOGIC_VECTOR(7 downto 0);
signal udp_data_out : STD_LOGIC_VECTOR(7 downto 0);
signal udp_gen_data : STD_LOGIC_VECTOR(7 downto 0);
signal udp_src_ip : STD_LOGIC_VECTOR(31 downto 0);
signal udp_src_port : STD_LOGIC_VECTOR(15 downto 0);
signal udp_tx_length : STD_LOGIC_VECTOR(10 downto 0);
signal user_addr_in : STD_LOGIC_VECTOR(7 downto 0);
signal user_tx_size_in_latched : STD_LOGIC_VECTOR(10 downto 0);

begin

----  Component instantiations  ----

AddressContainer : address_container
  port map(
       addr => addrs_sig,
       addr_in => decipher_dout,
       arp_announce_strobe => arp_announce_strobe,
       capture => capture_addrs,
       clk => clk,
       protocol_ping_strobe => oei_protocol_ping_strobe,
       reset => reset,
       user_addr_in => user_addr_in
  );

ArpReplyBlock : arp_reply
  port map(
       addrs => addrs_sig,
       arp_announce => arp_announce_strobe,
       arp_busy => arp_busy,
       clk => clk,
       crc_gen_en => arp_crc_gen_en_sig,
       crc_gen_init => arp_crc_gen_init_sig,
       crc_gen_rd => arp_crc_gen_rd_sig,
       dataout => arp_data_out,
       four_bit_mode => four_bit_mode,
       reset => reset,
       tip => arp_req_ip,
       tmac => arp_req_mac,
       trigger => arp_trigger,
       tx_en => arp_tx_en,
       tx_er => arp_tx_er,
       udp_busy => sel_udp
  );

CRC_OR : or33
  port map(
       a1 => arp_crc_gen_en_sig,
       a2 => udp_crc_gen_en_sig,
       ao => crc_gen_en_sig,
       b1 => arp_crc_gen_init_sig,
       b2 => udp_crc_gen_init_sig,
       bo => crc_gen_init_sig,
       c1 => arp_crc_gen_rd_sig,
       c2 => udp_crc_gen_rd_sig,
       co => crc_gen_rd_sig
  );

ChecksumCalcBlock : ip_checksum_calc
  port map(
       addrsDest => ip_dest_addrs,
       addrsSrc => addrs_sig,
       clk => clk,
       cs => checksum,
       icmp_mode => tx_icmp_packet,
       length => user_tx_size_in_latched,
       reset => reset,
       trigger => trigger_sig
  );

CreatePacketBlock : create_packet
  port map(
       addrs => addrs_sig,
       arp_busy => arp_busy,
       busy => busy_sig,
       checksum => checksum,
       clk => clk,
       clken_out => create_clken,
       crc_gen_en => udp_crc_gen_en_sig,
       crc_gen_init => udp_crc_gen_init_sig,
       crc_gen_rd => udp_crc_gen_rd_sig,
       data_length => udp_tx_length,
       dataout => udp_gen_data,
       dest_ip => dest_ip,
       dest_mac => dest_mac,
       dest_port => dest_port,
       en_tx_data => en_tx_data_sig,
       four_bit_mode => four_bit_mode,
       icmp_checksum => icmp_checksum,
       icmp_data => ping_data_delayed,
       icmp_ip => udp_src_ip,
       icmp_mac => frame_src_mac,
       icmp_ping => is_icmp_packet_sig,
       length_count_out => user_tx_size_in_latched,
       ping => oei_protocol_ping_strobe,
       reset => reset,
       trigger => trigger_sig,
       tx_en => udp_tx_en,
       tx_er => udp_tx_er,
       tx_icmp_packet => tx_icmp_packet,
       udp_data_sel => sel_udp
  );

DataoutMux : dataout_mux
  port map(
       arp_data_out => arp_data_out,
       arp_tx_en => arp_tx_en,
       arp_tx_er => arp_tx_er,
       sel_udp => sel_udp,
       tx_en => tx_en,
       tx_er => tx_er,
       txd => data_out,
       udp_data_out => udp_data_out,
       udp_tx_en => udp_tx_en,
       udp_tx_er => udp_tx_er
  );

DecipherBlock : decipherer
  port map(
       addrs => addrs_sig,
       arp_req_ip => arp_req_ip,
       arp_req_mac => arp_req_mac,
       capture_source_addrs => capture_addrs,
       clk => clk,
       clken_out => decipher_clken,
       crc_chk_en => crc_chk_en_sig,
       crc_chk_init => crc_chk_init_sig,
       crc_chk_rd => dec_chk_rd_sig,
       data_in => rxd,
       data_out => decipher_dout,
       dv => rx_dv,
       er => rx_er,
       four_bit_mode_out => four_bit_mode,
       icmp_checksum => icmp_req_checksum,
       is_arp => is_arp_packet_sig,
       is_icmp_ping => is_icmp_packet_sig,
       is_ip => is_ip_packet_sig,
       reset => reset,
       src_mac => frame_src_mac,
       udp_data_count => ip_data_count_sig,
       udp_data_valid => udp_data_valid,
       udp_dest_port => udp_dest_port,
       udp_src_ip => udp_src_ip,
       udp_src_port => udp_src_port
  );

DestInfoContainer : dest_info_container
  port map(
       dest_addrs_in => dest_addrs,
       dest_ip => dest_ip
  );

FilterDataOutBlock : filter_data_out
  port map(
       clk => clk,
       enable => udp_data_valid,
       out_data => user_rx_data_out,
       out_data_valid => user_rx_valid_out,
       rx_data => decipher_dout,
       us_clken => decipher_clken
  );

ICMPPingChecksumCalcBlock : icmp_ping_checksum_calc
  port map(
       clk => clk,
       req_chk_sum => icmp_req_checksum,
       reset => reset,
       resp_chk_sum => icmp_checksum,
       trigger => trigger_sig
  );

ICMPPingShiftRegBlock : icmp_ping_shift_reg
  port map(
       clk => clk,
       din => decipher_dout,
       dout => ping_data_delayed,
       ds_clken => create_clken,
       us_clken => decipher_clken
  );

trigger_sig <= trigger or oei_protocol_ping_strobe or is_icmp_packet_sig;

crc_chk_rd_sig <= is_ip_packet_sig and dec_chk_rd_sig;

arp_trigger <= arp_announce_strobe or is_arp_packet_sig;

UDPDataSplicer : udp_data_splicer
  port map(
       clk => clk,
       gen_data => udp_gen_data,
       sel_user => en_tx_data_sig,
       udp_data_out => udp_data_out,
       user_data => user_tx_data_in
  );

UdpLengthMux : user_addrs_mux
  port map(
       icmp_dest_addr(0) => udp_src_ip(0),
       icmp_dest_addr(1) => udp_src_ip(1),
       icmp_dest_addr(2) => udp_src_ip(2),
       icmp_dest_addr(3) => udp_src_ip(3),
       icmp_dest_addr(4) => udp_src_ip(4),
       icmp_dest_addr(5) => udp_src_ip(5),
       icmp_dest_addr(6) => udp_src_ip(6),
       icmp_dest_addr(7) => udp_src_ip(7),
       icmp_length => ip_data_count_sig,
       icmp_mode => tx_icmp_packet,
       ip_dest_addr => ip_dest_addrs,
       ip_tx_length => udp_tx_length,
       ping_mode => capture_addrs,
       user_dest_addr => dest_addrs,
       user_length => user_tx_size_in
  );


---- Terminal assignment ----

    -- Inputs terminals
	rxd <= GMII_RXD;
	clk <= GMII_RX_CLK;
	rx_dv <= GMII_RX_DV;
	rx_er <= GMII_RX_ER;
	user_addr_in <= addrs;

    -- Output\buffer terminals
	GMII_GTX_CLK <= clk;
	GMII_TXD <= data_out;
	GMII_TX_EN <= tx_en;
	GMII_TX_ER <= tx_er;
	busy <= busy_sig;
	crc_chk_din <= decipher_dout;
	crc_chk_en <= crc_chk_en_sig;
	crc_chk_init <= crc_chk_init_sig;
	crc_chk_rd <= crc_chk_rd_sig;
	crc_gen_en <= crc_gen_en_sig;
	crc_gen_init <= crc_gen_init_sig;
	crc_gen_rd <= crc_gen_rd_sig;
	en_tx_data <= en_tx_data_sig;
	four_bit_mode_out <= four_bit_mode;
	src_addrs(0) <= udp_src_ip(0);
	src_addrs(1) <= udp_src_ip(1);
	src_addrs(2) <= udp_src_ip(2);
	src_addrs(3) <= udp_src_ip(3);
	src_addrs(4) <= udp_src_ip(4);
	src_addrs(5) <= udp_src_ip(5);
	src_addrs(6) <= udp_src_ip(6);
	src_addrs(7) <= udp_src_ip(7);
	src_capture <= oei_protocol_ping_strobe;
	src_mac <= frame_src_mac;
	src_port <= udp_src_port;
	udp_data_count <= ip_data_count_sig;


end arch;
