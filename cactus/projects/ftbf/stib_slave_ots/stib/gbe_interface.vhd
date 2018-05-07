--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    gbe_interface - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    GbE interface between LMB and PHY 
--
-- Dependencies:   ethernet
--                   arp
--                     ip
--                       ipheader
--                       icmp
--                       udp
--                 txether
--                   arprep
--                   qrpreq
--                   sendpkt
--                   streampkt
--                 arptab
--
-- The GMII specification (for example Micrel KSZ9031MNX Fig 14)
-- show RXDV, RXD and RXER asserted on the falling edge of RXCLK
-- with setup and hold times of about 2.5 ns.  We register RXDV,
-- RXD and RXER on the rising edge of RXCLK so that they remain
-- stable for approximately one clock cycle before being sampled
-- on the next rising edge of RXCLK which drives state transitions.
--
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library stib;
use stib.iobus.all;
use stib.gbe.all;

entity gbe_interface is
  generic (
    mac_address : string := "00:00:00:00:00:00";
    ip_address : string := "192.168.1.1";
    netmask : string := "255.255.255.0";
    gateway : string := "192.168.1.254";
    jumpers : boolean := false;
    dhcp : boolean := false
  );
  port (
    reset : out std_logic;
    rxclk : in std_logic;
    rxd : in std_logic_vector(7 downto 0);
    rxdv : in std_logic;
    rxer : in std_logic;
    txclk : out std_logic;
    txd : out std_logic_vector(7 downto 0);
    txen : out std_logic;
    txer : out std_logic;
    jumpered_address : in std_logic_vector(7 downto 0);
    busclk : in std_logic;
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    interrupt : out std_logic;
    stream_read_enable : out std_logic;
    stream_dout : in std_logic_vector(7 downto 0);
    stream_length : in std_logic_vector(15 downto 0);
    stream_cksum : in std_logic_vector(15 downto 0);
    stream_strobe : in std_logic;
    stream_ready : out std_logic;
    debug : out std_logic_vector(7 downto 0)
  );
end gbe_interface;

architecture RTL of gbe_interface is

  component fb
    port (
      rst : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(7 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(7 downto 0);
      full : out std_logic;
      empty : out std_logic;
      valid : out std_logic
    );
  end component;

  component ethernet
    port (
      reset : in std_logic;
      clk : in std_logic;
      enable : in std_logic;
      din : in std_logic_vector(7 downto 0);
      saddr : out std_logic_vector(47 downto 0);
      daddr : out std_logic_vector(47 downto 0);
      frame_type : out std_logic_vector(15 downto 0);
      arp_enable : out std_logic;
      ip_enable : out std_logic;
      payload : out std_logic;
      frame_strobe : out std_logic;
      crc_valid : out std_logic
    );
  end component;

  component arp
    port (
      reset : in std_logic;
      clk : in std_logic;
      enable : in std_logic;
      din : in std_logic_vector(7 downto 0);
      ip_address : in std_logic_vector(31 downto 0);
      hardware_type : out std_logic_vector(15 downto 0);
      protocol_type : out std_logic_vector(15 downto 0);
      hlen : out std_logic_vector(7 downto 0);
      plen : out std_logic_vector(7 downto 0);
      operation : out std_logic_vector(15 downto 0);
      sender_ha : out std_logic_vector(47 downto 0);
      sender_ip : out std_logic_vector(31 downto 0);
      target_ha : out std_logic_vector(47 downto 0);
      target_ip : out std_logic_vector(31 downto 0);
      matched : out std_logic
    );
  end component;

  component icmprep
    generic ( id : integer := 0 );
    port (
      reset : in std_logic;
      clk : in std_logic;
      strobe : in std_logic;
      wr_clk : in std_logic;
      din : in std_logic_vector(7 downto 0);
      wr_en : in std_logic;
      clear : in std_logic;
      protocol : out std_logic_vector(7 downto 0);
      length : out std_logic_vector(15 downto 0);
      ip_header_cksum : in std_logic_vector(15 downto 0);
      dout : out std_logic_vector(7 downto 0);
      request : out std_logic;
      enable : in std_logic_vector(2 downto 0)
    );
  end component;

  component icmp
    port (
      reset : in std_logic;
      clk : in std_logic;
      enable : in std_logic;
      din : in std_logic_vector(7 downto 0);
      icmp_type : out std_logic_vector(7 downto 0);
      icmp_code : out std_logic_vector(7 downto 0);
      echo_ident : out std_logic_vector(15 downto 0);
      echo_seq : out std_logic_vector(15 downto 0);
      echo_timestamp : out std_logic_vector(15 downto 0);
      icmp_data_we : out std_logic
    );
  end component;

  component udp
    port (
      reset : in std_logic;
      clk : in std_logic;
      enable : in std_logic;
      din : in std_logic_vector(7 downto 0);
      src_port : out std_logic_vector(15 downto 0);
      dst_port : out std_logic_vector(15 downto 0);
      length : out std_logic_vector(15 downto 0);
      udp_data_we : out std_logic;
      udp_buffer_clear : out std_logic
    );
  end component;

  component ip
    port (
      reset : in std_logic;
      clk : in std_logic;
      enable : in std_logic;
      din : in std_logic_vector(7 downto 0);
      ip_address : in std_logic_vector(31 downto 0);
      ip_version : out std_logic_vector(3 downto 0);
      ip_ihl: out std_logic_vector(3 downto 0);
      ip_length : out std_logic_vector(15 downto 0);
      ip_identification : out std_logic_vector(15 downto 0);
      ip_flags : out std_logic_vector(2 downto 0);
      ip_fragment : out std_logic_vector(12 downto 0);
      ip_ttl : out std_logic_vector(7 downto 0);
      ip_protocol : out std_logic_vector(7 downto 0);
      ip_saddr : out std_logic_vector(31 downto 0);
      ip_daddr : out std_logic_vector(31 downto 0);
      header_cksum_valid : out std_logic;
      data_cksum_valid : out std_logic;
      buffer_clear : out std_logic;
      icmp_enable : out std_logic;
      udp_enable : out std_logic;
      payload : out std_logic;
      matched : out std_logic
    );
  end component;

  component arptab
    generic ( size : integer := 4 );   -- THis is the width of the address bus
    port (
      reset : in std_logic;
      clk : in std_logic;
      read_strobe : in std_logic;
      write_strobe : in std_logic;
      my_ip_address : in std_logic_vector(31 downto 0);
      my_netmask : in std_logic_vector(31 downto 0);
      gw_ip_address : in std_logic_vector(31 downto 0);
      load_ip_addr : in std_logic_vector(31 downto 0);
      load_hw_addr : in std_logic_vector(47 downto 0);
      lookup_ip_addr : in std_logic_vector(31 downto 0);
      target_ip_addr : out std_logic_vector(31 downto 0);
      lookup_hw_addr : out std_logic_vector(47 downto 0);
      found : out std_logic;
      missing : out std_logic;
      broadcast : out std_logic;
      entries : out std_logic_vector(7 downto 0);
      index : in std_logic_vector(7 downto 0);
      table_ip_addr : out std_logic_vector(31 downto 0);
      table_hw_addr : out std_logic_vector(47 downto 0);
      table_ref_count : out std_logic_vector(15 downto 0);
      debug_state : out std_logic_vector(7 downto 0)
    );
  end component;

  component arprep
    generic ( id : integer := 0 );
    port (
      reset : in std_logic;
      clk : in std_logic;
      strobe : in std_logic;
      src_ha : in std_logic_vector(47 downto 0);
      src_ip : in std_logic_vector(31 downto 0);
      dst_ha : in std_logic_vector(47 downto 0);
      dst_ip : in std_logic_vector(31 downto 0);
      dout : out std_logic_vector(7 downto 0);
      request : out std_logic;
      enable : in std_logic_vector(2 downto 0)
    );
  end component;

  component arpreq
    generic ( id : integer := 0 );
    port (
      reset : in std_logic;
      clk : in std_logic;
      strobe : in std_logic;
      src_ha : in std_logic_vector(47 downto 0);
      src_ip : in std_logic_vector(31 downto 0);
      target_ip : in std_logic_vector(31 downto 0);
      my_netmask : in std_logic_vector(31 downto 0);
      gw_ip_address : in std_logic_vector(31 downto 0);
      dout : out std_logic_vector(7 downto 0);
      request : out std_logic;
      enable : in std_logic_vector(2 downto 0)
    );
  end component;

  component txether
    port (
      reset : in std_logic;
      clk : in std_logic;
      saddr : in std_logic_vector(47 downto 0);
      daddr : in std_logic_vector(47 downto 0);
      sel : in std_logic_vector(6 downto 0);
      enable : out std_logic_vector(2 downto 0);
      ip_header : out std_logic;
      header : out std_logic;
      crc : out std_logic;
      din : in std_logic_vector(7 downto 0);
      dout : out std_logic_vector(7 downto 0);
      crc_out : out std_logic_vector(7 downto 0);
      txen : out std_logic
    );
  end component;

  component ipheader
    port (
      reset : in std_logic;
      clk : in std_logic;
      strobe : in std_logic;
      length : in std_logic_vector(15 downto 0);
      protocol : in std_logic_vector(7 downto 0);
      saddr : in std_logic_vector(31 downto 0);
      daddr : in std_logic_vector(31 downto 0);
      dout : out std_logic_vector(7 downto 0);
      checksum : out std_logic_vector(15 downto 0)
    );
  end component;

  component sendpkt
    generic ( id : integer := 0 );
    port (
      reset : in std_logic;
      clk : in std_logic;
      strobe : in std_logic;
      wr_clk : in std_logic;
      din : in std_logic_vector(7 downto 0);
      wr_en : in std_logic;
      clear : in std_logic;
      saddr : in std_logic_vector(31 downto 0);
      daddr : in std_logic_vector(31 downto 0);
      sport : in std_logic_vector(15 downto 0);
      dport : in std_logic_vector(15 downto 0);
      arp_strobe : out std_logic;
      arptab_found : in std_logic;
      arptab_missing : in std_logic;
      issue_arp_request : out std_logic;
      protocol : out std_logic_vector(7 downto 0);
      length : out std_logic_vector(15 downto 0);
      ip_header_checksum : in std_logic_vector(15 downto 0);
      dout : out std_logic_vector(7 downto 0);
      request : out std_logic;
      enable : in std_logic_vector(2 downto 0);
      payload_checksum : out std_logic_vector(15 downto 0);
      internal_state : out std_logic_vector(7 downto 0)
    );
  end component;

  component streampkt
    generic ( id : integer := 0 );
    port (
      reset : in std_logic;
      clk : in std_logic;
      ipbuf_read_enable : out std_logic;
      ipbuf_dout : in std_logic_vector(7 downto 0);
      ipbuf_length : in std_logic_vector(15 downto 0);
      ipbuf_cksum : in std_logic_vector(15 downto 0);
      strobe : in std_logic;
      ready : out std_logic;
      saddr : in std_logic_vector(31 downto 0);
      daddr : in std_logic_vector(31 downto 0);
      sport : in std_logic_vector(15 downto 0);
      dport : in std_logic_vector(15 downto 0);
      arp_strobe : out std_logic;
      arptab_found : in std_logic;
      arptab_missing : in std_logic;
      issue_arp_request : out std_logic;
      protocol : out std_logic_vector(7 downto 0);
      length : out std_logic_vector(15 downto 0);
      ip_header_checksum : in std_logic_vector(15 downto 0);
      dout : out std_logic_vector(7 downto 0);
      request : out std_logic;
      enable : in std_logic_vector(2 downto 0);
      payload_checksum : out std_logic_vector(15 downto 0);
      internal_state : out std_logic_vector(7 downto 0)
    );
  end component;

  component ipbuf
    port (
      reset : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(7 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(7 downto 0);
      length : out std_logic_vector(15 downto 0);
      clear : in std_logic;
      cksum : out std_logic_vector(15 downto 0)
    );
  end component;

  constant base_address : std_logic_vector(15 downto 0) := x"c100";
  constant address_mask : std_logic_vector(15 downto 0) := x"ffff";

  constant address_gbe_csr : std_logic_vector(15 downto 0) := x"0000";
  constant address_gbe_fifo_status : std_logic_vector(15 downto 0) := x"0004";

  constant address_rx_fifo : std_logic_vector(15 downto 0) := x"0010";
  constant address_tx_fifo : std_logic_vector(15 downto 0) := x"0014";
  constant address_udp_listen_ports : std_logic_vector(15 downto 0) := x"0018";

  constant address_ip_addr : std_logic_vector(15 downto 0) := x"0020";
  constant address_netmask : std_logic_vector(15 downto 0) := x"0024";
  constant address_gateway : std_logic_vector(15 downto 0) := x"0028";
  constant address_ip_daddr : std_logic_vector(15 downto 0) := x"002c";

  constant address_udp_fifo_data0 : std_logic_vector(15 downto 0) := x"0030";
  constant address_udp_fifo_data1 : std_logic_vector(15 downto 0) := x"0034";
  constant address_udp_ports : std_logic_vector(15 downto 0) := x"0038";
  constant address_udp_length : std_logic_vector(15 downto 0) := x"003c";
  constant address_udp_saddr : std_logic_vector(15 downto 0) := x"0040";

  constant address_arp_csr : std_logic_vector(15 downto 0) := x"0044";
  constant address_arp_lookup_ip : std_logic_vector(15 downto 0) := x"0048";
  constant address_arp_table_ip : std_logic_vector(15 downto 0) := x"004c";
  constant address_arp_table_ha_low : std_logic_vector(15 downto 0) := x"0050";
  constant address_arp_table_ha_high : std_logic_vector(15 downto 0) := x"0054";
  constant address_arp_table_refcount : std_logic_vector(15 downto 0) := x"0058";

  constant address_sendpkt_csr : std_logic_vector(15 downto 0) := x"0060";
  constant address_sendpkt_daddr : std_logic_vector(15 downto 0) := x"0064";
  constant address_sendpkt_ports : std_logic_vector(15 downto 0) := x"0068";
  constant address_sendpkt_stuff : std_logic_vector(15 downto 0) := x"006c";

  constant address_mac_address_high : std_logic_vector(15 downto 0) := x"0070";
  constant address_mac_address_low : std_logic_vector(15 downto 0) := x"0074";

  constant address_ipbuf_fifo_data : std_logic_vector(15 downto 0) := x"0080";
  constant address_ipbuf_length : std_logic_vector(15 downto 0) := x"0084";

  constant address_debug_flags : std_logic_vector(15 downto 0) := x"0090";
  constant address_debug_arpinput : std_logic_vector(15 downto 0 ) := x"0094";
  constant address_debug_arpoutput_lo : std_logic_vector(15 downto 0 ) := x"0098";
  constant address_debug_arpoutput_hi : std_logic_vector(15 downto 0 ) := x"009c";

  constant address_streampkt_csr : std_logic_vector(15 downto 0) := x"00a0";
  constant address_streampkt_daddr : std_logic_vector(15 downto 0) := x"00a4";
  constant address_streampkt_ports : std_logic_vector(15 downto 0) := x"00a8";
  constant address_streampkt_stuff : std_logic_vector(15 downto 0) := x"00ac";

  constant arptab_size : integer := 4;

  signal masked_address : std_logic_vector(15 downto 0);

  signal gbe_csr : std_logic_vector(31 downto 0) := x"80000000";  -- assert gbe reset by default
  signal read_gbe_csr : std_logic_vector(31 downto 0);
  signal arp_csr : std_logic_vector(31 downto 0) := x"00000000";
  signal read_arp_csr : std_logic_vector(31 downto 0) := x"00000000";
  signal sendpkt_csr : std_logic_vector(31 downto 0) := x"00000000";
  signal read_sendpkt_csr : std_logic_vector(31 downto 0);
  signal sendpkt_strobe : std_logic;
  signal sendpkt_we : std_logic;
  signal sendpkt_clear : std_logic;

  SIGNAL SENDPKT_DADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL SENDPKT_PORTS : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL SENDPKT_ARPTAB_READ_STROBE : STD_LOGIC;
  SIGNAL SENDPKT_ARPREQ_STROBE : STD_LOGIC;
  SIGNAL SENDPKT_PROTOCOL : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL SENDPKT_LENGTH : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL SENDPKT_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL SENDPKT_STATE : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL SENDPKT_PAYLOAD_CHECKSUM : STD_LOGIC_VECTOR(15 DOWNTO 0);

  SIGNAL STREAMPKT_CSR : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
  SIGNAL READ_STREAMPKT_CSR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STREAMPKT_DADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STREAMPKT_PORTS : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STREAMPKT_ARPTAB_READ_STROBE : STD_LOGIC;
  SIGNAL STREAMPKT_ARPREQ_STROBE : STD_LOGIC;
  SIGNAL STREAMPKT_PROTOCOL : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL STREAMPKT_LENGTH : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL STREAMPKT_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL STREAMPKT_STATE : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL STREAMPKT_PAYLOAD_CHECKSUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL STREAMPKT_READ_ENABLE : STD_LOGIC;

  SIGNAL RX_FRAME_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_ERROR_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_VALID_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_ARPREQ_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_ARPREQ_ADDR_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_ARPREP_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_IP_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_IP_BADCKSUM_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_ICMPREQ_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_ICMPREP_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL TX_ICMPREP_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL RX_UDP_COUNTER : UNSIGNED(31 DOWNTO 0) := X"00000000";

  SIGNAL GW_IP_ADDRESS : STD_LOGIC_VECTOR(31 DOWNTO 0) := string_to_ipaddr(GATEWAY);
  SIGNAL MY_NETMASK : STD_LOGIC_VECTOR(31 DOWNTO 0) := string_to_ipaddr(NETMASK);
  SIGNAL MY_IP_ADDRESS : STD_LOGIC_VECTOR(31 DOWNTO 0) := string_to_ipaddr(IP_ADDRESS);
  SIGNAL MY_MAC_ADDR : STD_LOGIC_VECTOR(47 DOWNTO 0) := string_to_hwaddr(MAC_ADDRESS);

  SIGNAL ETHERNET_DEST_HA : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ETHERNET_HEADER : STD_LOGIC;
  SIGNAL ETHERNET_CRC : STD_LOGIC;
  SIGNAL ETHERNET_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);

  signal r_rxd : std_logic_vector(7 downto 0);
  signal r_rxdv : std_logic;
  signal r_rxer : std_logic;
  signal r_txer : std_logic;

  signal previous_rxdv : std_logic;
  signal previous_rxer : std_logic;

  signal dout : std_logic_vector(7 downto 0);    -- this is the data to be driven on txd
  signal den : std_logic;                        -- enable signal driven on txen

  signal ethernet_crc_out : std_logic_vector(7 downto 0);

  SIGNAL FIFO_STATUS_WORD : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL RX_FIFO_READ_ENABLE : STD_LOGIC;
  SIGNAL RX_FIFO_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL RX_FIFO_DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);   -- This is latched on read strobe and driven on READY
  SIGNAL RX_FIFO_FULL : STD_LOGIC;
  SIGNAL RX_FIFO_EMPTY : STD_LOGIC;
  SIGNAL RX_FIFO_VALID : STD_LOGIC;
  SIGNAL TX_FIFO_READ_ENABLE : STD_LOGIC;
  SIGNAL TX_FIFO_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL TX_FIFO_DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);   -- This is latched on read strobe and driven on READY
  SIGNAL TX_FIFO_FULL : STD_LOGIC;
  SIGNAL TX_FIFO_EMPTY : STD_LOGIC;
  SIGNAL TX_FIFO_VALID : STD_LOGIC;

  SIGNAL ETHERNET_SOURCE_HA : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ETHERNET_TARGET_HA : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL FRAME_TYPE : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL FRAME_STROBE : STD_LOGIC;
  SIGNAL FRAME_CRC_VALID : STD_LOGIC;
  SIGNAL ETHERNET_PAYLOAD : STD_LOGIC;

  signal arp_enable : std_logic;
  signal icmp_enable : std_logic;
  SIGNAL UDP_ENABLE : STD_LOGIC;
  SIGNAL MATCHED_ARPREQ_FRAME : STD_LOGIC;
  SIGNAL MATCHED_ARPREQ_ADDRESS : STD_LOGIC;
  SIGNAL MATCHED_ARPREP_FRAME : STD_LOGIC;
  SIGNAL MATCHED_ICMPREP_FRAME : STD_LOGIC;
  SIGNAL MATCHED_ICMPREQ_FRAME : STD_LOGIC;
  SIGNAL MATCHED_IP_ADDRESS : STD_LOGIC;

  SIGNAL ARP_HARDWARE_TYPE : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL ARP_PROTOCOL_TYPE : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL ARP_HLEN : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ARP_PLEN : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ARP_OPERATION : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL ARP_SENDER_HA : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ARP_SENDER_IP : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL ARP_TARGET_HA : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ARP_TARGET_IP : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL ARP_LOOKUP_IP : STD_LOGIC_VECTOR(31 DOWNTO 0);      -- register set from iobus
  SIGNAL ARPREQ_TARGET_IP : STD_LOGIC_VECTOR(31 DOWNTO 0);   -- input to arpreq
  SIGNAL ARP_LOOKUP_HA : STD_LOGIC_VECTOR(47 DOWNTO 0) := X"FFFFFFFFFFFF";

  SIGNAL ARPTAB_READ_STROBE : STD_LOGIC;
  SIGNAL ARPTAB_WRITE_STROBE : STD_LOGIC;
  SIGNAL ARPTAB_LOAD_IP_ADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL ARPTAB_TARGET_IP_ADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL ARPTAB_LOAD_HW_ADDR : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ARPTAB_LOOKUP_IP_ADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL ARPTAB_LOOKUP_HW_ADDR : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ARPTAB_FOUND : STD_LOGIC;
  SIGNAL ARPTAB_MISSING : STD_LOGIC;
  SIGNAL ARPTAB_BROADCAST : STD_LOGIC;
  SIGNAL ARPTAB_ENTRIES : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ARPTAB_INDEX : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ARPTAB_READ_IP_ADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL ARPTAB_READ_HW_ADDR : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ARPTAB_READ_REFCOUNT : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL ARPTAB_DEBUG_STATE : STD_LOGIC_VECTOR(7 DOWNTO 0);

  SIGNAL IP_ENABLE : STD_LOGIC;
  SIGNAL MATCHED_IP_FRAME : STD_LOGIC;
  SIGNAL MATCHED_IP_BADCKSUM_FRAME : STD_LOGIC;
  SIGNAL IP_VERSION : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL IP_IHL : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL IP_LENGTH : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IP_IDENT : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IP_FLAGS : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL IP_FRAGMENT : STD_LOGIC_VECTOR(12 DOWNTO 0);
  SIGNAL IP_TTL : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL IP_PROTOCOL : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL IP_SADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IP_DADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IP_HEADER_CKSUM_VALID : STD_LOGIC;
  SIGNAL IP_DATA_CKSUM_VALID : STD_LOGIC;
  SIGNAL IP_PAYLOAD : STD_LOGIC;
  SIGNAL IP_HEADER_CKSUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IP_HEADER_TXD : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ETHERNET_DEST_IP : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IP_HEADER_ENABLE : STD_LOGIC;
  SIGNAL IP_BUFFER_CLEAR : STD_LOGIC;

  SIGNAL LENGTH : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL PROTOCOL : STD_LOGIC_VECTOR(7 DOWNTO 0);

  signal arp_reply_strobe : std_logic;
  signal arp_request_strobe : std_logic;
  SIGNAL ARPREP_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ARPREQ_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);

  signal icmp_type : std_logic_vector(7 downto 0);
  signal icmp_code : std_logic_vector(7 downto 0);
  signal icmp_echo_ident : std_logic_vector(15 downto 0);
  signal icmp_echo_seq : std_logic_vector(15 downto 0);
  signal icmp_echo_timestamp : std_logic_vector(15 downto 0);
  signal icmp_data_we : std_logic;
  signal icmp_data_clear : std_logic;
  signal icmprep_dout : std_logic_vector(7 downto 0);
  signal icmp_buffer_clear : std_logic;

  signal icmp_reply_strobe : std_logic;
  signal icmp_reply_protocol : std_logic_vector(7 downto 0);
  signal icmp_reply_length : std_logic_vector(15 downto 0);

  SIGNAL ETH_TX_SOURCE : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
  SIGNAL ETH_TX_ENABLE : STD_LOGIC_VECTOR(2 DOWNTO 0);

  signal icmprep_ipbuf_read_enable : std_logic;
  signal icmprep_ipbuf_dout : std_logic_vector(7 downto 0);
  signal icmprep_ipbuf_cksum : std_logic_vector(15 downto 0);
  signal icmprep_ipbuf_count : std_logic_vector(15 downto 0);

  signal udp_listen_ports : std_logic_vector(31 downto 0) := x"00000000";
  signal udp_payload : std_logic;
  signal udp_data_we : std_logic_vector(1 downto 0);
  signal udp_fifo_read_enable : std_logic_vector(1 downto 0);
  type udp_fifo_dout_t is array(1 downto 0) of std_logic_vector(7 downto 0);
  signal udp_fifo_dout : udp_fifo_dout_t;
  signal udp_fifo_full : std_logic_vector(1 downto 0);
  signal udp_fifo_empty : std_logic_vector(1 downto 0);
  signal udp_fifo_valid : std_logic_vector(1 downto 0);

  signal udp_fifo_data : std_logic_vector(7 downto 0);   -- this is latched on read strobe and driven on ready
  signal udp_buffer_clear : std_logic;
  signal selected_udp_buffer_clear : std_logic_vector(1 downto 0);

  SIGNAL MATCHED_UDP_FRAME : STD_LOGIC;
  SIGNAL UDP_RECEIVED_STROBE : STD_LOGIC;
  SIGNAL UDP_SADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);

  signal udp_src_port : std_logic_vector(15 downto 0);
  signal udp_dst_port : std_logic_vector(15 downto 0);
  signal udp_length : std_logic_vector(15 downto 0);
  signal udp_cksum : std_logic_vector(15 downto 0) := x"0000";
  signal latched_udp_dst_port : std_logic_vector(15 downto 0);

  SIGNAL GBE_INT : STD_LOGIC := '0';
  SIGNAL GBE_INT_ACK : STD_LOGIC := '0';

--  All debug stuff goes here

  SIGNAL IPBUF_READ_ENABLE : STD_LOGIC;
  SIGNAL IPBUF_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL IPBUF_LENGTH : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IPBUF_CKSUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal ipbuf_fifo_data : std_logic_vector(7 downto 0);
  SIGNAL DEBUG_FLAGS : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL DHCP_BIT : STD_LOGIC := '0';

begin

  rxfb_imp : fb
  port map (
    rst => gbe_csr(30),     -- bit 30 of csr resets fifos
    wr_clk => rxclk,        -- latched data is stable on the rising clock edge
    rd_clk => busclk,       -- output data asserted on rising clock edge
    din => r_rxd,           -- input from latched gmii data
    wr_en => r_rxdv,        -- latched data valid signal
    rd_en => rx_fifo_read_enable,
    dout => rx_fifo_dout,
    full => rx_fifo_full,
    empty => rx_fifo_empty,
    valid => rx_fifo_valid
  );

  txfb_imp : fb
  port map (
    rst => gbe_csr(30),    -- bit 30 of csr resets fifos
    wr_clk => rxclk,       -- latched data is valid on rising clock edge
    rd_clk => busclk,      -- output data asserted on rising clock edge, valid on falling clock edge
    din => dout,           -- data driven out on txd
    wr_en => den,          -- output data enable
    rd_en => tx_fifo_read_enable,
    dout => tx_fifo_dout,
    full => tx_fifo_full,
    empty => tx_fifo_empty,
    valid => tx_fifo_valid
  );

  ethernet_imp : ethernet
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      enable => r_rxdv,
      din => r_rxd,
      saddr => ethernet_source_ha,
      daddr => ethernet_target_ha,
      frame_type => frame_type,
      arp_enable => arp_enable,
      ip_enable => ip_enable,
      payload => ethernet_payload,
      frame_strobe => frame_strobe,
      crc_valid => frame_crc_valid
    );

  arp_imp : arp
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      enable => arp_enable,
      din => r_rxd,
      ip_address => my_ip_address,
      hardware_type => arp_hardware_type,
      protocol_type => arp_protocol_type,
      hlen => arp_hlen,
      plen => arp_plen,
      operation => arp_operation,
      sender_ha => arp_sender_ha,
      sender_ip => arp_sender_ip,
      target_ha => arp_target_ha,
      target_ip => arp_target_ip,
      matched => matched_arpreq_address
    );

  arptab_imp : arptab
    generic map ( size => arptab_size )
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      read_strobe => arptab_read_strobe,
      write_strobe => arptab_write_strobe,
      my_ip_address => my_ip_address,
      my_netmask => my_netmask,
      gw_ip_address => gw_ip_address,
      load_ip_addr => arptab_load_ip_addr,
      target_ip_addr => arptab_target_ip_addr,
      load_hw_addr => arptab_load_hw_addr,
      lookup_ip_addr => arptab_lookup_ip_addr,
      lookup_hw_addr => arptab_lookup_hw_addr,
      found => arptab_found,
      missing => arptab_missing,
      broadcast => arptab_broadcast,
      entries => arptab_entries,
      index => arptab_index,
      table_ip_addr => arptab_read_ip_addr,
      table_hw_addr => arptab_read_hw_addr,
      table_ref_count => arptab_read_refcount,
      debug_state => arptab_debug_state
    );

    ipbuf_imp : ipbuf
      port map (
        reset => gbe_csr(30),
        wr_clk => rxclk,
        rd_clk => busclk,
        din => r_rxd,
        wr_en => icmp_data_we,
        clear => icmp_buffer_clear,
        rd_en => ipbuf_read_enable,
        dout => ipbuf_dout,
        length => ipbuf_length,
        cksum => ipbuf_cksum
      );

    icmprep_imp : icmprep
      generic map ( id => 4 )
      port map (
        reset => gbe_csr(30),
        clk => rxclk,
        strobe => icmp_reply_strobe,
        wr_clk => rxclk,
        din => r_rxd,
        wr_en => icmp_data_we,
        clear => icmp_buffer_clear,
        protocol => icmp_reply_protocol,
        length => icmp_reply_length,
        ip_header_cksum => ip_header_cksum,
        dout => icmprep_dout,
        request => eth_tx_source(3),
        enable => eth_tx_enable
    );

    icmp_imp : icmp
      port map (
        reset => gbe_csr(30),
        clk => rxclk,
        enable => icmp_enable,
        din => r_rxd,
        icmp_type => icmp_type,
        icmp_code => icmp_code,
        echo_ident => icmp_echo_ident,
        echo_seq => icmp_echo_seq,
        echo_timestamp => icmp_echo_timestamp,
        icmp_data_we => icmp_data_we
      );

  udp_imp : udp
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      enable => udp_enable,
      din => r_rxd,
      src_port => udp_src_port,
      dst_port => udp_dst_port,
      length => udp_length,
      udp_data_we => udp_payload,
      udp_buffer_clear => udp_buffer_clear
  );

  udpfb : for i in 0 to 1 generate
    udpfb_imp : fb
    port map (
      rst => selected_udp_buffer_clear(i),
      wr_clk => not rxclk,   -- latched data is valid on falling clock edge
      rd_clk => busclk,      -- output data asserted on rising clock edge
      din => r_rxd,          -- input from latched gmii data
      wr_en => udp_data_we(i),        -- latched data valid signal
      rd_en => udp_fifo_read_enable(i),
      dout => udp_fifo_dout(i),
      full => udp_fifo_full(i),
      empty => udp_fifo_empty(i),
      valid => udp_fifo_valid(i)
    );
  end generate;

  ip_imp : ip
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      enable => ip_enable,
      din => r_rxd,
      ip_address => my_ip_address,
      ip_version => ip_version,
      ip_ihl => ip_ihl,
      ip_length => ip_length,
      ip_identification => ip_ident,
      ip_flags => ip_flags,
      ip_fragment => ip_fragment,
      ip_ttl => ip_ttl,
      ip_protocol => ip_protocol,
      ip_saddr => ip_saddr,
      ip_daddr => ip_daddr,
      header_cksum_valid => ip_header_cksum_valid,
      data_cksum_valid => ip_data_cksum_valid,
      buffer_clear => ip_buffer_clear,
      icmp_enable => icmp_enable,
      udp_enable => udp_enable,
      payload => ip_payload,
      matched => matched_ip_address
    );

  ipheader_imp : ipheader
    PORT MAP (
      RESET => GBE_CSR(30),
      CLK => RXCLK,
      STROBE => IP_HEADER_ENABLE,
      LENGTH => LENGTH,
      PROTOCOL => PROTOCOL,
      SADDR => MY_IP_ADDRESS,
      DADDR => ETHERNET_DEST_IP,
      DOUT => IP_HEADER_TXD,
      CHECKSUM => IP_HEADER_CKSUM
  );

  tx_imp : txether
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      saddr => my_mac_addr,
      daddr => ethernet_dest_ha,
      sel => eth_tx_source,
      enable => eth_tx_enable,
      ip_header => ip_header_enable,
      header => ethernet_header,
      crc => ethernet_crc,
      din => dout,
      dout => ethernet_dout,
      crc_out => ethernet_crc_out,
      txen => den
    );

  arprep_imp : arprep
    GENERIC MAP ( ID => 1 )
    PORT MAP (
      RESET => GBE_CSR(30),
      CLK => RXCLK,
      STROBE => ARP_REPLY_STROBE,
      SRC_HA => MY_MAC_ADDR,
      SRC_IP => MY_IP_ADDRESS,
      DST_HA => ARP_SENDER_HA,
      DST_IP => ARP_SENDER_IP,
      DOUT => ARPREP_DOUT,
      REQUEST => ETH_TX_SOURCE(0),
      ENABLE => ETH_TX_ENABLE
    );

  arpreq_imp : arpreq
    generic map ( id => 2 )
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      strobe => arp_request_strobe,
      src_ha => my_mac_addr,
      src_ip => my_ip_address,
      target_ip => arpreq_target_ip,
      my_netmask => my_netmask,
      gw_ip_address => gw_ip_address,
      dout => arpreq_dout,
      request => eth_tx_source(1),
      enable => eth_tx_enable
    );

  sendpkt_imp : sendpkt
    generic map ( id => 6 )
    port map (
      reset => gbe_csr(30),
      clk => rxclk,
      strobe => sendpkt_strobe,
      wr_clk => not busclk,              -- data is sampled on falling edge
      din => iobus.io_write_data(7 downto 0),
      wr_en => sendpkt_we,
      clear => sendpkt_clear,
      saddr => my_ip_address,
      daddr => sendpkt_daddr,
      sport => sendpkt_ports(31 downto 16),
      dport => sendpkt_ports(15 downto 0),
      arp_strobe => sendpkt_arptab_read_strobe,
      arptab_found => arptab_found,
      arptab_missing => arptab_missing,
      issue_arp_request => sendpkt_arpreq_strobe,
      protocol => sendpkt_protocol,
      length => sendpkt_length,
      ip_header_checksum => ip_header_cksum,
      dout => sendpkt_dout,
      request => eth_tx_source(5),
      enable => eth_tx_enable,
      payload_checksum => sendpkt_payload_checksum,
      internal_state => sendpkt_state
    );

  streampkt_imp : streampkt
    generic map ( id => 7 )
    port map (
      reset => gbe_csr(30),
      clk => rxclk,

      ipbuf_read_enable => streampkt_read_enable,
      ipbuf_dout => stream_dout,
      ipbuf_length => stream_length,
      ipbuf_cksum => stream_cksum,
      strobe => stream_strobe,
      ready => stream_ready,

      saddr => my_ip_address,
      daddr => streampkt_daddr,
      sport => streampkt_ports(31 downto 16),
      dport => streampkt_ports(15 downto 0),
      arp_strobe => streampkt_arptab_read_strobe,
      arptab_found => arptab_found,
      arptab_missing => arptab_missing,
      issue_arp_request => streampkt_arpreq_strobe,
      protocol => streampkt_protocol,
      length => streampkt_length,
      ip_header_checksum => ip_header_cksum,
      dout => streampkt_dout,
      request => eth_tx_source(6),
      enable => eth_tx_enable,
      payload_checksum => streampkt_payload_checksum,
      internal_state => streampkt_state
    );

  process ( busclk ) begin
    if ( busclk'event and busclk = '1' ) then
      if ( gbe_int = '0' ) then
        gbe_int_ack  <= '0';
      end if;
      if ( iobus.io_addr_strobe = '1' and masked_address = base_address ) then
        iobus_ready <= '1';

        if ( iobus.io_write_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_gbe_csr =>
              gbe_csr <= iobus.io_write_data;
              if ( gbe_int = '1' and iobus.io_write_data(0) = '1' ) then
                gbe_int_ack <= '1';
              end if;
            when address_ip_addr =>
              my_ip_address(31 downto 8) <= iobus.io_write_data(31 downto 8);
              if ( not jumpers ) then
                my_ip_address(7 downto 0) <= iobus.io_write_data(7 downto 0);
              end if;
            when address_arp_lookup_ip =>
              arp_lookup_ip <= iobus.io_write_data;
            when address_arp_csr =>
              arp_csr <= iobus.io_write_data;
            when address_sendpkt_csr =>
              sendpkt_csr <= iobus.io_write_data;
              sendpkt_we <= iobus.io_write_data(30);
              sendpkt_clear <= iobus.io_write_data(29);
            when address_udp_listen_ports =>
              udp_listen_ports <= iobus.io_write_data;
            when address_sendpkt_daddr =>
              sendpkt_daddr <= iobus.io_write_data;
            when address_sendpkt_ports =>
              sendpkt_ports <= iobus.io_write_data;
            when address_streampkt_csr =>
              streampkt_csr <= iobus.io_write_data;
            when address_streampkt_daddr =>
              streampkt_daddr <= iobus.io_write_data;
            when address_streampkt_ports =>
              streampkt_ports <= iobus.io_write_data;
            when address_netmask =>
              my_netmask <= iobus.io_write_data;
            when address_gateway =>
              gw_ip_address <= iobus.io_write_data;
            when others =>
  
          end case;
        end if;

        if ( iobus.io_read_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_gbe_csr =>
              write_data <= read_gbe_csr;
            when address_gbe_fifo_status =>
              write_data <= fifo_status_word;
            when address_ip_addr =>
              write_data <= my_ip_address;
            when address_ip_daddr =>
              write_data <= ip_daddr;
            when address_arp_lookup_ip =>
              write_data <= arp_lookup_ip;
            when address_arp_csr =>
              write_data <= read_arp_csr;
            when address_udp_ports =>
              write_data <= udp_src_port & udp_dst_port;
            when address_udp_length =>
              write_data <= udp_cksum & udp_length;
            when address_udp_saddr =>
              write_data <= udp_saddr;
            when address_sendpkt_csr =>
              write_data <= read_sendpkt_csr;
            when address_udp_listen_ports =>
              write_data <= udp_listen_ports;
            when address_sendpkt_daddr =>
              write_data <= sendpkt_daddr;
            when address_sendpkt_ports =>
              write_data <= sendpkt_ports;
            when address_streampkt_csr =>
              write_data <= read_streampkt_csr;
            when address_streampkt_daddr =>
              write_data <= streampkt_daddr;
            when address_streampkt_ports =>
              write_data <= streampkt_ports;
            when address_arp_table_ip =>
              write_data <= arptab_read_ip_addr;
            when address_arp_table_ha_low =>
              write_data <= arptab_read_hw_addr(31 downto 0);
            when address_arp_table_ha_high =>
              write_data <= x"0000" & arptab_read_hw_addr(47 downto 32);
            when address_arp_table_refcount =>
              write_data <= x"0000" & arptab_read_refcount;
            when address_netmask =>
              write_data <= my_netmask;
            when address_gateway =>
              write_data <= gw_ip_address;
            when address_debug_flags =>
              write_data <= debug_flags;
            when address_debug_arpinput =>
              write_data <= arptab_lookup_ip_addr;
            when address_debug_arpoutput_lo =>
              write_data <= arptab_lookup_hw_addr(31 downto 0);
            when address_debug_arpoutput_hi =>
              write_data <= x"0000" & arptab_lookup_hw_addr(47 downto 32);
            when address_ipbuf_length =>
              write_data <= ipbuf_cksum & ipbuf_length;
            when address_sendpkt_stuff =>
              write_data <= x"0000" & sendpkt_payload_checksum;
            when address_mac_address_high =>
              write_data <= x"0000" & my_mac_addr(47 downto 32);
            when address_mac_address_low =>
              write_data <= my_mac_addr(31 downto 0);
            when x"0100" =>
              write_data <= std_logic_vector(rx_frame_counter);
            when x"0104" =>
              write_data <= std_logic_vector(rx_error_counter);
            when x"0108" =>
              write_data <= std_logic_vector(rx_valid_counter);
            when x"010c" =>
              write_data <= std_logic_vector(rx_arpreq_counter);
            when x"0110" =>
              write_data <= std_logic_vector(rx_arprep_counter);
            when x"0114" =>
              write_data <= std_logic_vector(rx_ip_counter);
            when x"0118" =>
              write_data <= std_logic_vector(rx_ip_badcksum_counter);
            when x"011c" =>
              write_data <= std_logic_vector(rx_arpreq_addr_counter);
            when x"0120" =>
              write_data <= std_logic_vector(rx_icmpreq_counter);
            when x"0124" =>
              write_data <= std_logic_vector(rx_icmprep_counter);
            when x"0128" =>
              write_data <= std_logic_vector(tx_icmprep_counter);
            when x"012c" =>
              write_data <= std_logic_vector(rx_udp_counter);
            when address_rx_fifo =>
              write_data <= x"000000" & rx_fifo_dout;
              rx_fifo_read_enable <= '1';
            when address_tx_fifo =>
              write_data <= x"000000" & tx_fifo_dout;
              tx_fifo_read_enable <= '1';
            when address_udp_fifo_data0 =>
              write_data <= x"000000" & udp_fifo_dout(0);
              udp_fifo_read_enable(0) <= '1';
            when address_udp_fifo_data1 =>
              write_data <= x"000000" & udp_fifo_dout(1);
              udp_fifo_read_enable(1) <= '1';
            when address_ipbuf_fifo_data =>
              write_data <= x"000000" & ipbuf_dout;
              ipbuf_read_enable <= '1';
            when others =>
              write_data <= x"f8f8f8f8";
          end case;
        end if;
      else
        iobus_ready <= '0';
        sendpkt_we <= '0';
        sendpkt_clear <= '0';
        rx_fifo_read_enable <= '0';
        tx_fifo_read_enable <= '0';
        udp_fifo_read_enable(0) <= '0';
        udp_fifo_read_enable(1) <= '0';
        ipbuf_read_enable <= '0';
        write_data <= ( others => '0' );
      end if;
    end if;
  end process;

--  Register rxd, rxdv, rxer

  process ( rxclk ) begin
    if ( rxclk'event and rxclk = '1' ) then
      r_rxd <= rxd;
      r_rxdv <= rxdv;
      r_rxer <= rxer;
      txd <= dout;
      txen <= den;
      txer <= '0';
    end if;
  end process;

--  Count received frames

  process ( rxclk ) begin
    if ( rxclk'event and rxclk = '1' ) then
      if ( gbe_csr(30) = '1' ) then
        rx_frame_counter <= ( others => '0' );
        rx_error_counter <= ( others => '0' );
        rx_valid_counter <= ( others => '0' );
        rx_arpreq_counter <= ( others => '0' );
        rx_arpreq_addr_counter <= ( others => '0' );
        rx_arprep_counter <= ( others => '0' );
        rx_ip_counter <= ( others => '0' );
        rx_ip_badcksum_counter <= ( others => '0' );
        rx_icmpreq_counter <= ( others => '0' );
        rx_icmprep_counter <= ( others => '0' );
        tx_icmprep_counter <= ( others => '0' );
        rx_udp_counter <= ( others => '0' );
        gbe_int <= '0';
      else
        if ( r_rxdv = '1' and previous_rxdv = '0' ) then
          rx_frame_counter <= rx_frame_counter + 1;
        end if;
        if ( r_rxer = '1' and previous_rxer = '0' ) then
          rx_error_counter <= rx_error_counter + 1;
        end if;
        if ( frame_strobe = '1' and frame_crc_valid = '1' ) then
          rx_valid_counter <= rx_valid_counter + 1;
        end if;
        if ( matched_arpreq_frame = '1' ) then
          rx_arpreq_counter <= rx_arpreq_counter + 1;
        end if;
        if ( arp_reply_strobe = '1' ) then
          rx_arpreq_addr_counter <= rx_arpreq_addr_counter + 1;
        end if;
        if ( matched_arprep_frame = '1' ) then
          rx_arprep_counter <= rx_arprep_counter + 1;
        end if;
        if ( matched_ip_frame = '1' ) then
          rx_ip_counter <= rx_ip_counter + 1;
        end if;
        if ( matched_ip_badcksum_frame = '1' ) then
          rx_ip_badcksum_counter <= rx_ip_badcksum_counter + 1;
        end if;
        if ( matched_icmpreq_frame = '1' ) then
          rx_icmpreq_counter <= rx_icmpreq_counter + 1;
        end if;
        if ( matched_icmprep_frame = '1' ) then
          rx_icmprep_counter <= rx_icmprep_counter + 1;
        end if;
        if ( icmp_reply_strobe = '1' ) then
          tx_icmprep_counter <= tx_icmprep_counter + 1;
        end if;
        if ( udp_received_strobe = '1' ) then
          rx_udp_counter <= rx_udp_counter + 1;
        end if;
        if ( udp_received_strobe = '1' ) then
          udp_saddr <= ip_saddr;
          gbe_int <= '1';
        elsif ( gbe_int_ack = '1' ) then
          gbe_int <= '0';
        end if;
      end if;
      previous_rxdv <= r_rxdv;
      previous_rxer <= r_rxer;
    end if;
  end process;

  process ( rxclk ) begin
    if ( rxclk'event and rxclk = '0' ) then
      latched_udp_dst_port <= udp_dst_port;
    end if;
  end process;

  interrupt <= gbe_int;
  masked_address <= iobus.io_address(31 downto 16) and address_mask;

  dhcp_bit <= '1' when dhcp = true else '0';
  read_gbe_csr <= gbe_csr(31 downto 24) & dhcp_bit & eth_tx_source & den & eth_tx_enable & gbe_csr(11 downto 1) & gbe_int;
  read_sendpkt_csr <= sendpkt_csr(31 downto 16) & sendpkt_state & sendpkt_csr(7 downto 0);
  fifo_status_word <= x"0000" &
                      '0' & udp_fifo_valid(1) & udp_fifo_full(1) & udp_fifo_empty(1) &
                      '0' & udp_fifo_valid(0) & udp_fifo_full(0) & udp_fifo_empty(0) &
                      '0' & tx_fifo_valid & tx_fifo_full & tx_fifo_empty &
                      '0' & rx_fifo_valid & rx_fifo_full & rx_fifo_empty;

  matched_ip_frame <= '1' when frame_strobe = '1' and ip_enable = '1' else '0';
  matched_ip_badcksum_frame <= '1' when frame_strobe = '1' and ip_enable = '1' and ip_header_cksum_valid = '0' else '0';
  matched_arpreq_frame <= '1' when frame_strobe = '1' and arp_enable = '1' and arp_operation = x"0001" else '0';
  matched_arprep_frame <= '1' when frame_strobe = '1' and arp_enable = '1' and arp_operation = x"0002" else '0';
  matched_icmprep_frame <= '1' when frame_strobe = '1' and ip_enable = '1' and ip_protocol = x"01" and icmp_type = x"00" else '0';
  matched_icmpreq_frame <= '1' when frame_strobe = '1' and ip_enable = '1' and ip_protocol = x"01" and icmp_type = x"08" else '0';
  matched_udp_frame <= '1' when frame_strobe = '1' and ip_enable = '1' and ip_protocol = x"11" else '0';

  arp_reply_strobe <= '1' when frame_strobe = '1' and matched_arpreq_frame = '1' and matched_arpreq_address = '1' else '0';
  arptab_write_strobe <= arp_reply_strobe or matched_arprep_frame;
  icmp_reply_strobe <= '1' when frame_strobe = '1' and matched_icmpreq_frame = '1' and matched_ip_address = '1' else '0';
  udp_received_strobe <= '1' when matched_udp_frame = '1' and matched_ip_address = '1' else '0';

  icmp_buffer_clear <= '1' when ip_enable = '1' and ip_protocol = x"01" and ip_buffer_clear = '1' else '0';

  selected_udp_buffer_clear(0) <= udp_buffer_clear when ( latched_udp_dst_port = udp_listen_ports(15 downto 0) ) else
                                  udp_buffer_clear when ( udp_listen_ports(15 downto 0) = X"0000" ) else '0';

  selected_udp_buffer_clear(1) <= udp_buffer_clear when ( latched_udp_dst_port = udp_listen_ports(31 downto 16) ) else
                                  udp_buffer_clear when ( udp_listen_ports(31 downto 16) = X"0000" ) else '0';

  udp_data_we(0) <= udp_payload when ( latched_udp_dst_port = udp_listen_ports(15 downto 0) ) or ( udp_listen_ports(15 downto 0) = X"0000" ) else '0';
  udp_data_we(1) <= udp_payload when ( latched_udp_dst_port = udp_listen_ports(31 downto 16) ) or ( udp_listen_ports(31 downto 16) = X"0000" ) else '0';
 
  arptab_load_ip_addr <= arp_sender_ip;
  arptab_load_hw_addr <= arp_sender_ha;

--  Need to multiplex these signals when more are added...

  arptab_read_strobe <= sendpkt_arptab_read_strobe;
  arptab_lookup_ip_addr <= sendpkt_daddr;

  ETHERNET_DEST_HA <= ARP_SENDER_HA WHEN ( ETH_TX_SOURCE(0) = '1' ) ELSE            -- arp reply
                      X"FFFFFFFFFFFF" WHEN ( ETH_TX_SOURCE(1) = '1' ) ELSE          -- arp request
                      ETHERNET_SOURCE_HA WHEN ( ETH_TX_SOURCE(3) = '1' ) ELSE       -- icmp reply
                      ARPTAB_LOOKUP_HW_ADDR WHEN ( ETH_TX_SOURCE(5) = '1' ) ELSE    -- arp lookup address from sendpkt
                      ARPTAB_LOOKUP_HW_ADDR WHEN ( ETH_TX_SOURCE(6) = '1' ) ELSE    -- arp lookup address from streampkt
                      X"000000000000";

  ethernet_dest_ip <= ip_saddr when ( eth_tx_source(3) = '1' ) else
                      sendpkt_daddr when ( eth_tx_source(5) = '1' ) else
                      streampkt_daddr when ( eth_tx_source(6) = '1' ) else
                      X"00000000";

  arpreq_target_ip <= arptab_target_ip_addr when sendpkt_arpreq_strobe = '1' else arp_lookup_ip;

  read_arp_csr <= arp_csr(31 downto 28) & sendpkt_arptab_read_strobe & sendpkt_arpreq_strobe & arptab_missing & arptab_found &
                  std_logic_vector(to_unsigned(arptab_size,8)) & arptab_entries & arp_csr(7 downto 0);
  arptab_index <= arp_csr(7 downto 0);
  read_streampkt_csr <= streampkt_csr(31 downto 16) & streampkt_state & streampkt_csr(7 downto 0);

--

  reset <= not gbe_csr(31);
  sendpkt_strobe <= sendpkt_csr(31);
  arp_request_strobe <= arp_csr(31) or sendpkt_arpreq_strobe;

  stream_read_enable <= streampkt_read_enable;

  length <= icmp_reply_length when eth_tx_source(3) = '1' else
            sendpkt_length when eth_tx_source(5) = '1' else
            streampkt_length when eth_tx_source(6) = '1' else
            x"0000";
  protocol <= icmp_reply_protocol when eth_tx_source(3) = '1' else
              sendpkt_protocol when eth_tx_source(5) = '1' else
              streampkt_protocol when eth_tx_source(6) = '1' else
              x"00";

  dout <= ethernet_crc_out when ethernet_crc = '1' else
          ethernet_dout when ethernet_header = '1' else
          ip_header_txd when ip_header_enable = '1' else
          arprep_dout when eth_tx_enable = "001" else
          arpreq_dout when eth_tx_enable = "010" else
          icmprep_dout when eth_tx_enable = "100" else
          sendpkt_dout when eth_tx_enable = "110" else
          streampkt_dout when eth_tx_enable = "111" else
          x"00";

  g_jumpers : if ( jumpers ) generate
    my_mac_addr(7 downto 0) <= jumpered_address;
    my_ip_address(7 downto 0) <= jumpered_address;
  end generate;

--  Debug signals

  debug_flags <= arptab_debug_state & "000" & arptab_broadcast & arptab_found & arptab_missing &
                 arptab_read_strobe & arptab_write_strobe &  arp_request_strobe & arp_reply_strobe &
                 sendpkt_strobe & ip_header_enable & ethernet_header & ethernet_crc &
                 eth_tx_enable & eth_tx_source;

  debug(0) <= busclk;
  debug(1) <= stream_strobe;
  debug(2) <= streampkt_read_enable;
  debug(3) <= ethernet_header;
  debug(4) <= ip_header_enable;
  debug(5) <= arptab_read_strobe;
  debug(6) <= '0';
  debug(7) <= eth_tx_source(6);  -- streampkt request

end RTL;
