--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    vipic
-- Module Name:    vipic_interface - RTL
-- Project Name:   test beam
-- Target Devices: xc4vlx25ff668-10/xc4vsx35ff668-10
-- Tool versions:  ISE 14.6
-- Description:    Defines a MicroBlaze LMB slave that interfaces with the
--                 VIPIC chip
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------
--
-- Description: 
--
-- Base C9000000
--
-- Register VIPIC_CSR xxxx0000 command/status register
--   Bit 31 rw CLKRESET reset clock DCM
--   Bit 30..29 -- -- unused
--   Bit 28 rw STREAMRST stream reset
--   Bit 27 rw INVERT inverts polarity of serial inputs and channel order
--   Bit 26..25 -- -- unused
--   Bit 24 rw STRTRIG enable trigger number in output stream
--   Bit 23 rw STREAMEN enable data in output stream 
--   Bit 21 rw TRIGRST reset trigger counter
--   Bit 20 rw STREAMTS enable timestamp counter in output stream
--   Bit 19..18 -- -- unused
--   Bit 17 rw HALT halt readout
--   Bit 16 rw EXTCLK selects external reference clock
--   Bit 15..13 rw DEBSEL select debug output signals
--   Bit 12..10 -- -- unused
--   Bit 9..8 rw IDLECNT idle time before flushing stream
--   Bit 7..3 rw PKTSIZE packet size
--   
-- Register VIPIC_CLOCK xxxx0004 clock configuration register
--   Bit 31 r READING asserted when readout cycle in progress
--   Bit 30 rw TSCLK send timestamp clock pulse
--   Bit 29 rw RESTART send restart pulse
--   Bit 28 -- -- unused
--   Bit 27 rw LOAD send load pulse
--   Bit 26 rw DO_D shift D bits (w), D bit shift in progress (r)
--   Bit 25 rw DO_R shift R bits (w), R bit shift in progress (r)
--   Bit 24 rw DO_S shift S bits (w), S bit shift in progress (r)
--   Bit 23  r HITOR indicates state of the Hit_or signal
--   Bit 22 -- -- unused
--   Bit 21 rw TSCLKEN send timestamp clock pulse
--   Bit 20 rw CLEAN send clean pulse/clean pulse busy
--   Bit 19..16 rw RSTROBEWID delay after rstrobe pulse
--   Bit 15..8 rw RSTROBECNT number of rstrobe pulses per readout cycle
--   Bit 7..0 rw TSCLKPER timestamp clock period
--
-- Register VIPIC_STATUS xxxx0010 channel enable/link status register
--   Bit 31..16 rw ENABLE  channel enable mask
--   Bit 15..0  r SYNC  channel link synchronization status 
--
-- Register VIPIC_IDELAY xxxx0014 IDELAY control register
--   Bit 31 rw STROBE IDELAY tap increment/decrement clock enable
--   Bit 30 -- -- unused 
--   Bit 29 rw TAPRST reset IDELAY tap count
--   Bit 28 rw TAPINC increment (decrement) IDELAY tap count when set (clear)
--   Bit 27..22 -- -- unused
--   Bit 21..16 r TAPCNT IDELAY tap count
--   Bit 15..4 -- -- unused
--   Bit 3..0 rw SELECT channel select
--   
-- Register VIPIC_SPYFIFO_CSR xxxx0024 spy FIFO control/status register
--   Bit 31 rw RESET FIFO reset
--   Bit 30 -- -- unused
--   Bit 29 r SPY_FULL spy FIFO full flag
--   Bit 28 r SPY_EMPTY spy FIFO empty flag
--   Bit 27 -- -- unused
--   Bit 26 r FIFO_VALID VIPIC FIFO valid flag
--   Bit 25 r FIFO_FULL VIPIC FIFO full flag
--   Bit 24 r FIFO_EMPTY VIPIC FIFO empty flag
--   Bit 23..4 -- -- unused
--   Bit 3..0 rw SELECT channel select
--
-- Register VIPIC_SPYFIFO_DATA xxxx0028 spy FIFO data
--   Bit 31..0 r SPY_DATA spy FIFO data word
--
-- Register VIPIC_TSCOUNT_LOW xxxx0040 timestamp counter low
--   Bit 31..0 r TSCOUNT_LOW timestamp counter bits 31..0
--
-- Register VIPIC_TSCOUNT_HIGH xxxx0044 timestamp counter high
--   Bit 15..0 r TSCOUNT_HIGH timestamp counter bits 47..32
--   Bit 31..16 -- -- unused
--
-- Register VIPIC_SCLK_DATA xxxx0048 VIPIC DCM configuration register
--   Bit 31 rw DCM_WRITE write to DCM reconfiguration bus (w), DCM busy (r)
--   Bit 22..16 rw DCM_ADDR DCM reconfiguration address
--   Bit 15..0 rw DCM_DATA DCM reconfiguration data
--
-- Register VIPIC_STREAMER xxxx004c streaming data status register
--   Bit 31..24 r STATE stream process internal state
--   Bit 23 r STUFFED set when stream FIFO overflows
--   Bit 22 r PROGFULL FIFO almsot full flag
--   Bit 21 r FULL FIFO full flag
--   Bit 20 r EMPTY FIFO empty flag
--   Bit 19 r PKTSTROBE send packet strobe
--   Bit 18 r READY sending packet
--   Bit 17 r PKTFULL packet FIFO full
--   Bit 16 r PKTEMPTY packet FIFO empty
--   Bit 15..8 r IDLECNT idle count
--   Bit 7..0 r WRDCOUNT packet word count
--
-- Register VIPIC_TRIGNUM_LOW xxxx0080 trigger counter low
--   Bit 31..0 r TRIGNUM_LOW trigger number bits 31..0
--
-- Register VIPIC_TRIGNUM_HIGH xxxx0084 trigger counter high
--   Bit 7..0 r TRIGNUM_HIGH trigger number bits 39..32
--   Bit 31..8 -- -- unused
--

library ieee;
use ieee.std_logic_1164.all;
library stib;
use stib.iobus.all;

use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity vipic_interface is
  port (
    busclk : in std_logic;
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    clkx : in std_logic;
    clky : in std_logic;
    ext_clk : in std_logic;
    ext_trig : in std_logic;
    ext_start : in std_logic;
    ext_halt : in std_logic;
    serial_clk : out std_logic;
    rstrobe : out std_logic;
    ts_clk : out std_logic;
    load : out std_logic;
    hitor : in std_logic;
    clean : out std_logic;
    restart : out std_logic;
    strobe : out std_logic;
    scin : in std_logic_vector(2 downto 0);
    scout : out std_logic_vector(2 downto 0);
    scclk : out std_logic_vector(2 downto 0);
    sin : in std_logic_vector(15 downto 0);
    sout : out std_logic_vector(3 downto 0);
    dout : out std_logic_vector(31 downto 0);
    dv : out std_logic;
    stream_rclk : in std_logic;
    stream_read_enable : in std_logic;
    stream_dout : out std_logic_vector(7 downto 0);
    stream_length : out std_logic_vector(15 downto 0);
    stream_cksum : out std_logic_vector(15 downto 0);
    stream_strobe : out std_logic;
    stream_ready : in std_logic;
    debug_select : out std_logic;
    debug : out std_logic_vector(7 downto 0)
  );
end vipic_interface;

architecture rtl of vipic_interface is

  component srmem
  port (
    clka : in std_logic;
    wea : in std_logic_vector(0 downto 0);
    addra : in std_logic_vector(6 downto 0);
    dina : in std_logic_vector(31 downto 0);
    douta : out std_logic_vector(31 downto 0);
    clkb : in std_logic;
    web : in std_logic_vector(0 downto 0);
    addrb : in std_logic_vector(11 downto 0);
    dinb : in std_logic_vector(0 downto 0);
    doutb : out std_logic_vector(0 downto 0)
  );
  end component;

  component dmem
  port (
    clka : in std_logic;
    wea : in std_logic_vector(0 downto 0);
    addra : in std_logic_vector(10 downto 0);
    dina : in std_logic_vector(31 downto 0);
    douta : out std_logic_vector(31 downto 0);
    clkb : in std_logic;
    web : in std_logic_vector(0 downto 0);
    addrb : in std_logic_vector(15 downto 0);
    dinb : in std_logic_vector(0 downto 0);
    doutb : out std_logic_vector(0 downto 0)
  );
  end component;

  component vipicclk
  port (
    clk_x  : in std_logic;
    clk_y : in std_logic;
    clk_ext : in std_logic;
    clksel : in std_logic;
    tsclk_period : in std_logic_vector(7 downto 0);
    rstrobe_count : in std_logic_vector(7 downto 0);
    rstrobe_width : in std_logic_vector(3 downto 0);
    hitor : in std_logic;
    sclk : out std_logic;
    serial_clk : out std_logic;
    rstrobe : out std_logic;
    ts_clk : out std_logic;
    sclk_enable : out std_logic;
    do_read : in std_logic;
    read_busy : out std_logic;
    do_load : in std_logic;
    load_busy : out std_logic;
    load : out std_logic;
    mrproper : in std_logic;
    clean : out std_logic;
    do_restart : in std_logic;
    restart_busy : out std_logic;
    do_tsclk : in std_logic;
    tsclk_busy : out std_logic;
    send_tsclk : in std_logic;
    restart : out std_logic;
    reset : in std_logic;
    locked : out std_logic;
    arm_ts_reset : in std_logic;
    ts_reset_armed : out std_logic;
    ts_reset_busy : out std_logic;
    ts_reset : in std_logic;
    ts_reset_now : in std_logic;
    ts : out std_logic_vector(47 downto 0);
    clk_data_in : in std_logic_vector(15 downto 0);
    clk_data_out : out std_logic_vector(15 downto 0);
    clk_addr : in std_logic_vector(6 downto 0);
    clk_we : in std_logic;                -- dcm reconfiguration write enable
    clk_en : in std_logic;                -- dcm reconfiguration enable
    busclk : in std_logic;                -- dcm reconfiguration clock
    clk_busy : out std_logic;             -- dcm reconfiguration status
    debug_select : in std_logic;
    debug : out std_logic_vector(7 downto 0)
  );
  end component;

  component vipic_readout
  port (
    sin : in std_logic_vector(15 downto 0);
    sclk : in std_logic;
    invert : in std_logic;
    sclk_enable : in std_logic;
    serial_clk : in std_logic;
    ts_clk : in std_logic;
    mask : in std_logic_vector(15 downto 0);
    sync : out std_logic_vector(15 downto 0);
    ts : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(31 downto 0);
    dv : out std_logic;
    do_idelay : in std_logic;
    idelay_busy : out std_logic;
    idelay_inc : in std_logic;
    idelay_rst : in std_logic;
    idelay_tap : out std_logic_vector(5 downto 0);
    idelay_select : in std_logic_vector(3 downto 0);
    debug_select : in std_logic_vector(3 downto 0);
    debug : out std_logic_vector(7 downto 0)
  );
  end component;

  component vipic_test
  port (
    sout : out std_logic_vector(3 downto 0);
    serial_clk : in std_logic;
    rstrobe : in std_logic;
    write_strobe : in std_logic;
    busy : out std_logic;
    address : in std_logic_vector(7 downto 0);
    count : in std_logic_vector(3 downto 0);
    mask : in std_logic_vector(15 downto 0)
  );
  end component;

  component vipic_fifo
    port (
      rst : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(35 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(35 downto 0);
      empty : out std_logic;
      full : out std_logic;
      valid : out std_logic
    );
  end component;

  component vipicpulser
  generic (
    pulse_width : integer := 32
  );
  port (
    rst : in std_logic;
    sclk : in std_logic;
    ts_counter : in std_logic_vector(7 downto 0);
    ts_match : in std_logic_vector(7 downto 0);
    delay : in std_logic_vector(7 downto 0);
    count : in std_logic_vector(7 downto 0);
    start : in std_logic;
    busy : out std_logic;
    strobe : out std_logic
  );
  end component;

  component vipicstream
    port (
      reset : in std_logic;
      enable : in std_logic;
      flush : in std_logic;
      packet_size : in std_logic_vector(4 downto 0);
      idle_count : in std_logic_vector(1 downto 0);
      clk : in std_logic;
      din : in std_logic_vector(31 downto 0);
      write_enable : in std_logic;
      status : out std_logic_vector(31 downto 0);
      words_dumped : out std_logic_vector(31 downto 0);
      stream_rclk : in std_logic;
      stream_read_enable : in std_logic;
      stream_dout : out std_logic_vector(7 downto 0);
      stream_length : out std_logic_vector(15 downto 0);
      stream_cksum : out std_logic_vector(15 downto 0);
      stream_strobe : out std_logic;
      stream_ready : in std_logic
    );
  end component;

  component trigcounter
    port (
      clk : in std_logic;
      ce : in std_logic;
      sclr : in std_logic;
      q : out std_logic_vector(39 downto 0)
    );
  end component;

  constant base_address : std_logic_vector(15 downto 0) := x"c900";
  constant address_mask : std_logic_vector(15 downto 0) := x"ffff";
  signal masked_address : std_logic_vector(15 downto 0);
  signal bus_data : std_logic_vector(31 downto 0);

  constant address_vipic_csr : std_logic_vector(15 downto 0) := x"0000";       -- command status register
  constant address_vipic_clock : std_logic_vector(15 downto 0) := x"0004";     -- clock configuration register
  constant address_vipic_calib : std_logic_vector(15 downto 0) := x"0008";
  constant address_vipic_status : std_logic_vector(15 downto 0) := x"0010";
  constant address_vipic_idelay : std_logic_vector(15 downto 0) := x"0014";
  constant address_vipic_test : std_logic_vector(15 downto 0) := x"0020";
  constant address_vipic_spy_fifo_csr : std_logic_vector(15 downto 0) := x"0024";
  constant address_vipic_spy_fifo_data : std_logic_vector(15 downto 0) := x"0028";
  constant address_vipic_ts_counter_low : std_logic_vector(15 downto 0) := x"0040";    -- ts counter
  constant address_vipic_ts_counter_high : std_logic_vector(15 downto 0) := x"0044";   -- ts counter
  constant address_vipic_sclk_data : std_logic_vector(15 downto 0) := x"0048";       -- command status register
  constant address_vipic_streamer : std_logic_vector(15 downto 0) := x"004c";
  constant address_vipic_trignum_low : std_logic_vector(15 downto 0) := x"0080";
  constant address_vipic_trignum_high : std_logic_vector(15 downto 0) := x"0084";

  signal vipic_csr : std_logic_vector(31 downto 0) := x"0000c000";
  signal vipic_clock : std_logic_vector(31 downto 0) := x"00730210"; 
  signal vipic_calib : std_logic_vector(31 downto 0) := x"00000000"; 
  signal vipic_mask : std_logic_vector(15 downto 0) := x"0000";
  signal vipic_channel_enable : std_logic_vector(15 downto 0);
  signal vipic_test_csr : std_logic_vector(31 downto 0) := x"00000000";
  signal vipic_idelay : std_logic_vector(31 downto 0) := x"00000000";
  signal vipic_idelay_tap : std_logic_vector(5 downto 0);
  signal spy_fifo_csr : std_logic_vector(31 downto 0) := x"00000000";
  signal spy_fifo_data : std_logic_vector(31 downto 0);
  signal sclk_data : std_logic_vector(31 downto 0) := x"00000000";
  signal do_r : std_logic;
  signal do_s : std_logic;
  signal do_d : std_logic;
  signal do_load : std_logic;
  signal load_busy : std_logic;
  signal clean_busy : std_logic := '0';
  signal busy_r : std_logic := '0';
  signal busy_s : std_logic := '0';
  signal sclkd : std_logic := '0';
  signal rclkd : std_logic := '0';
  signal dclkd : std_logic := '0';
  signal busy_d : std_logic := '0';
  signal send_clean : std_logic;
  signal send_tsclk : std_logic := '1';
  signal do_restart : std_logic;
  signal restart_busy : std_logic;
  signal do_tsclk : std_logic := '0';
  signal tsclk_busy : std_logic;
  signal do_read : std_logic := '0';
  signal read_busy : std_logic;
  signal do_cal : std_logic := '0';
  signal cal_busy : std_logic;
  signal do_idelay : std_logic := '0';
  signal idelay_busy : std_logic;

  type state_t is ( Idle, Counting, Last, Done );
  signal state : state_t := Idle;

  signal smemr_dout : std_logic_vector(31 downto 0);
  signal smemw_dout : std_logic_vector(31 downto 0);
  signal smemr_addr : std_logic_vector(11 downto 0);
  signal smemw_addr : std_logic_vector(11 downto 0) := "000000000000";
  signal read_smemr : std_logic;
  signal read_smemw : std_logic;
  signal s_out : std_logic_vector(0 downto 0);
  signal s_in : std_logic_vector(0 downto 0);
  signal s_clk : std_logic;
  signal smemw_we : std_logic_vector(0 downto 0);
  signal smemr_we : std_logic_vector(0 downto 0);
  signal count : unsigned(15 downto 0);
  signal mon_sclk : std_logic;
  signal mon_rclk : std_logic;
  signal mon_dclk : std_logic;

  signal rmemr_dout : std_logic_vector(31 downto 0);
  signal rmemw_dout : std_logic_vector(31 downto 0);
  signal rmemr_addr : std_logic_vector(11 downto 0);
  signal rmemw_addr : std_logic_vector(11 downto 0) := "000000000000";
  signal read_rmemr : std_logic;
  signal read_rmemw : std_logic;
  signal r_out : std_logic_vector(0 downto 0);
  signal r_in : std_logic_vector(0 downto 0);
  signal r_clk : std_logic;
  signal rmemw_we : std_logic_vector(0 downto 0);
  signal rmemr_we : std_logic_vector(0 downto 0);

  signal dmemr_dout : std_logic_vector(31 downto 0);
  signal dmemw_dout : std_logic_vector(31 downto 0);
  signal dmemr_addr : std_logic_vector(15 downto 0);
  signal dmemw_addr : std_logic_vector(15 downto 0) := x"0000";
  signal read_dmemr : std_logic;
  signal read_dmemw : std_logic;
  signal d_out : std_logic_vector(0 downto 0);
  signal d_in : std_logic_vector(0 downto 0);
  signal d_clk : std_logic;
  signal dmemw_we : std_logic_vector(0 downto 0);
  signal dmemr_we : std_logic_vector(0 downto 0);

  signal sclk : std_logic;
  signal tsclk : std_logic;
  signal rstr : std_logic;
  signal sclk_enable : std_logic;
  signal vipic_serial_clk : std_logic;
  signal vipic_data : std_logic_vector(31 downto 0);
  signal vipic_dv : std_logic;
  signal trigger_dv : std_logic;
  signal sclk_reset : std_logic;
  signal sclk_locked : std_logic;
  signal arm_ts_reset : std_logic;
  signal ts_reset_armed : std_logic;
  signal ts_reset_busy : std_logic;
  signal do_ts_reset : std_logic;
  signal sclk_busy : std_logic;
  signal sclk_den : std_logic;
  signal sclk_data_we : std_logic;
  signal sclk_data_out : std_logic_vector(15 downto 0);
  signal timestamp_counter : std_logic_vector(47 downto 0);
  signal latched_timestamp_counter : std_logic_vector(47 downto 0);
  signal clock_debug : std_logic_vector(7 downto 0);
  signal chan_debug : std_logic_vector(7 downto 0);
  signal sc_debug : std_logic_vector(7 downto 0);
  signal cal_debug : std_logic_vector(7 downto 0);
  signal fifo_debug : std_logic_vector(7 downto 0);
  signal vipic_sout : std_logic_vector(3 downto 0);
  signal vipic_sync : std_logic_vector(15 downto 0);
  signal vipic_cal_strobe : std_logic;

  signal vipic_test_strobe : std_logic := '0';
  signal vipic_test_busy : std_logic;

  signal spy_fifo_addressed : std_logic := '0';
  signal spy_fifo_empty : std_logic;
  signal spy_fifo_full : std_logic;
  signal spy_fifo_output : std_logic_vector(35 downto 0);
  signal fifo_input : std_logic_vector(35 downto 0);
  signal vipic_fifo_read : std_logic := '0';
  signal vipic_fifo_empty : std_logic;
  signal vipic_fifo_valid : std_logic;
  signal vipic_fifo_full : std_logic;
  signal vipic_fifo_output : std_logic_vector(35 downto 0);

  signal trigger_fifo_input : std_logic_vector(35 downto 0);
  signal trigger_fifo_read : std_logic := '0';
  signal trigger_fifo_empty : std_logic;
  signal trigger_fifo_valid : std_logic;
  signal trigger_fifo_full : std_logic;
  signal trigger_fifo_output : std_logic_vector(35 downto 0);
  signal trigger_state : std_logic := '0';
  signal latched_trigger : std_logic_vector(23 downto 0);

  signal stream_data : std_logic_vector(31 downto 0);
  signal stream_data_valid : std_logic := '0';
  signal stream_status : std_logic_vector(31 downto 0);
  signal stream_words_dumped : std_logic_vector(31 downto 0);
  signal stream_sendpkt : std_logic;

  signal last_tsclk : std_logic;
  signal send_ts_high : std_logic := '0';
  signal send_header : std_logic := '0';
  signal send_trigger : std_logic := '0';
  signal need_ts : std_logic := '1';
  signal ts_idle : unsigned(6 downto 0) := ( others => '0' );
  signal latched_ts_high : std_logic_vector(23 downto 0);
  signal decoded_address : std_logic_vector(7 downto 0);

  signal trigger_count : std_logic_vector(39 downto 0);
  signal last_ext_trig : std_logic;
  signal trigger : std_logic;

begin

  smemw_imp : srmem
  port map (
    clka => busclk,
    wea => smemw_we,
    addra => iobus.io_address(8 downto 2),
    dina => iobus.io_write_data,
    douta => smemw_dout,
    clkb => clky,
    web => "0",
    addrb => smemw_addr,
    dinb => "0",
    doutb => s_out
  );
  smemr_imp : srmem
  port map (
    clka => busclk,
    wea => "0",
    addra => iobus.io_address(8 downto 2),
    dina => x"00000000",
    douta => smemr_dout,
    clkb => clky,
    web => smemr_we,
    addrb => smemr_addr,
    dinb => s_in,
    doutb => open
  );
  rmemw_imp : srmem
  port map (
    clka => busclk,
    wea => rmemw_we,
    addra => iobus.io_address(8 downto 2),
    dina => iobus.io_write_data,
    douta => rmemw_dout,
    clkb => clky,
    web => "0",
    addrb => rmemw_addr,
    dinb => "0",
    doutb => r_out
  );
  rmemr_imp : srmem
  port map (
    clka => busclk,
    wea => "0",
    addra => iobus.io_address(8 downto 2),
    dina => x"00000000",
    douta => rmemr_dout,
    clkb => clky,
    web => rmemr_we,
    addrb => rmemr_addr,
    dinb => r_in,
    doutb => open
  );
  dmemw_imp : dmem
  port map (
    clka => busclk,
    wea => dmemw_we,
    addra => iobus.io_address(12 downto 2),
    dina => iobus.io_write_data,
    douta => dmemw_dout,
    clkb => clky,
    web => "0",
    addrb => dmemw_addr,
    dinb => "0",
    doutb => d_out
  );
  demr_imp : dmem
  port map (
    clka => busclk,
    wea => "0",
    addra => iobus.io_address(12 downto 2),
    dina => x"00000000",
    douta => dmemr_dout,
    clkb => clky,
    web => dmemr_we,
    addrb => dmemr_addr,
    dinb => d_in,
    doutb => open
  );

  vipicclk_imp : vipicclk
  port map (
    clk_x => clkx,
    clk_y => clky,
    clk_ext => ext_clk,
    clksel => vipic_csr(16),
    tsclk_period => vipic_clock(7 downto 0),
    rstrobe_count => vipic_clock(15 downto 8),
    rstrobe_width => vipic_clock(19 downto 16),
    hitor => hitor,
    rstrobe => rstr,
    ts_clk => tsclk,
    sclk => sclk,
    sclk_enable => sclk_enable,
    serial_clk => vipic_serial_clk,
    do_read => do_read ,
    read_busy => read_busy,
    do_load => do_load,
    load_busy => load_busy,
    load => load,
    mrproper => send_clean,
    clean => clean,
    do_restart => do_restart,
    restart_busy => restart_busy,
    do_tsclk => do_tsclk,
    tsclk_busy => tsclk_busy,
    send_tsclk => send_tsclk,
    restart => restart,
    reset => sclk_reset,
    locked => sclk_locked,
    arm_ts_reset => arm_ts_reset,
    ts_reset_armed => ts_reset_armed,
    ts_reset_busy => ts_reset_busy,
    ts_reset => ext_start,
    ts_reset_now => do_ts_reset,
    ts => timestamp_counter,
    clk_data_in => sclk_data(15 downto 0),
    clk_data_out => sclk_data_out,
    clk_addr => sclk_data(22 downto 16),
    clk_we => sclk_data_we,
    clk_en => sclk_den,
    busclk => busclk,
    clk_busy => sclk_busy,
    debug_select => vipic_csr(13),
    debug => clock_debug
  );

  vr_imp : vipic_readout
  port map (
    sin => sin,
    sclk => sclk,
    invert => vipic_csr(27),
    serial_clk => vipic_serial_clk,
    sclk_enable => sclk_enable,
    mask => vipic_channel_enable,
    sync => vipic_sync,
    ts_clk => tsclk,
    ts => latched_timestamp_counter(7 downto 0),
    dout => vipic_data,
    dv => vipic_dv,
    do_idelay => do_idelay,
    idelay_busy => idelay_busy,
    idelay_inc => vipic_idelay(28),
    idelay_rst => vipic_idelay(29),
    idelay_tap => vipic_idelay_tap,
    idelay_select => vipic_idelay(3 downto 0),
    debug_select => spy_fifo_csr(3 downto 0),
    debug => chan_debug
  );

  vt_imp : vipic_test
  port map (
    sout => vipic_sout,
    serial_clk => sclk,
    rstrobe => rstr,
    write_strobe => vipic_test_strobe,
    busy => vipic_test_busy,
    address => vipic_test_csr(7 downto 0),
    count => vipic_test_csr(11 downto 8),
    mask => vipic_test_csr(31 downto 16)
  );

  vipic_spy_fifo_imp : vipic_fifo
  port map (
    rst => spy_fifo_csr(31),
    wr_clk => sclk,
    rd_clk => busclk,
    din => fifo_input,
    wr_en => vipic_dv,
    rd_en => spy_fifo_addressed,
    full => spy_fifo_full,
    empty => spy_fifo_empty,
    dout => spy_fifo_output,
    valid => open
  );

  vipic_fifo_imp : vipic_fifo
  port map (
    rst => spy_fifo_csr(31),
    wr_clk => sclk,
    rd_clk => sclk,
    din => fifo_input,
    wr_en => vipic_dv,
    rd_en => vipic_fifo_read,
    full => vipic_fifo_full,
    empty => vipic_fifo_empty,
    dout => vipic_fifo_output,
    valid => vipic_fifo_valid
  );

  trigger_fifo_imp : vipic_fifo
  port map (
    rst => spy_fifo_csr(31),
    wr_clk => sclk,
    rd_clk => sclk,
    din => trigger_fifo_input,
    wr_en => trigger_dv,
    rd_en => trigger_fifo_read,
    full => trigger_fifo_full,
    empty => trigger_fifo_empty,
    dout => trigger_fifo_output,
    valid => trigger_fifo_valid
  );

  pulser_imp : vipicpulser
  port map (
    rst => '0',
    sclk => sclk,
    ts_counter => timestamp_counter(7 downto 0),
    count => vipic_calib(7 downto 0),
    delay => vipic_calib(15 downto 8),
    ts_match => vipic_calib(23 downto 16),
    start => do_cal,
    busy => cal_busy,
    strobe => vipic_cal_strobe
  );

  vipicstream_imp : vipicstream
  port map (
    reset => vipic_csr(28),
    enable => vipic_csr(23),
    flush => '0',
    packet_size => vipic_csr(7 downto 3),
    idle_count => vipic_csr(9 downto 8),
    clk => sclk,
    din => stream_data,
    write_enable => stream_data_valid,
    status => stream_status,
    words_dumped => stream_words_dumped,
    stream_rclk => stream_rclk,
    stream_read_enable => stream_read_enable,
    stream_dout => stream_dout,
    stream_length => stream_length,
    stream_cksum => stream_cksum,
    stream_strobe => stream_sendpkt,
    stream_ready => stream_ready
  );

  trigcounter_imp : trigcounter
  port map (
    clk => sclk,
    ce => trigger,
    sclr => vipic_csr(21),
    q => trigger_count
  );

  process ( busclk ) begin
    if ( busclk'event and busclk = '1' ) then

      if ( do_r = '1' and busy_r = '1' ) then
        do_r <= '0';
      end if;
      if ( do_s = '1' and busy_s = '1' ) then
        do_s <= '0';
      end if;
      if ( do_d = '1' and busy_d = '1' ) then
        do_d <= '0';
      end if;
      if ( do_load = '1' and load_busy = '1' ) then
        do_load <= '0';
      end if;
      if ( do_restart = '1' and restart_busy = '1' ) then
        do_restart <= '0';
      end if;
      if ( do_read = '1' and read_busy = '1' ) then
        do_read <= '0';
      end if;
      if ( do_tsclk = '1' and tsclk_busy = '1' ) then
        do_tsclk <= '0';
      end if;
      if ( do_ts_reset = '1' and ts_reset_busy = '1' ) then
        do_ts_reset <= '0';
      end if;
      if ( arm_ts_reset = '1' and ts_reset_busy = '1' ) then
        arm_ts_reset <= '0';
      end if;
      if ( vipic_test_strobe = '1' and vipic_test_busy = '1' ) then
        vipic_test_strobe <= '0';
      end if;
      if ( do_cal = '1' and cal_busy = '1' ) then
        do_cal <= '0';
      end if;
      if ( do_idelay = '1' and idelay_busy = '1' ) then
        do_idelay <= '0';
      end if;

      if ( iobus.io_addr_strobe = '1' and masked_address = base_address ) then
        iobus_ready <= '1';
        if ( iobus.io_write_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_vipic_csr =>
              vipic_csr <= iobus.io_write_data;
              arm_ts_reset <= iobus.io_write_data(19);
              do_ts_reset <= iobus.io_write_data(22);
            when address_vipic_clock =>
              send_clean <= iobus.io_write_data(20);
              send_tsclk <= iobus.io_write_data(21);
              do_s <= iobus.io_write_data(24);
              do_r <= iobus.io_write_data(25);
              do_d <= iobus.io_write_data(26);
              if ( load_busy = '0' ) then
                do_load <= iobus.io_write_data(27);
              end if;
              if ( restart_busy = '0' ) then
                do_restart <= iobus.io_write_data(29);
              end if;
              if ( tsclk_busy = '0' ) then
                do_tsclk <= iobus.io_write_data(30);
              end if;
              if ( read_busy = '0' ) then
                do_read <= iobus.io_write_data(31);
              end if;
              vipic_clock <= iobus.io_write_data;
            when address_vipic_calib =>
              if ( cal_busy = '0' ) then
                do_cal <= iobus.io_write_data(31);
              end if;
              vipic_calib <= iobus.io_write_data;
            when address_vipic_idelay =>
              if ( idelay_busy = '0' ) then
                do_idelay <= iobus.io_write_data(31);
              end if;
              vipic_idelay <= iobus.io_write_data;
            when address_vipic_test =>
              if ( vipic_test_busy = '0' ) then
                vipic_test_csr <= iobus.io_write_data;
                vipic_test_strobe <= '1';
              end if;
            when address_vipic_status =>
              vipic_mask <= iobus.io_write_data(31 downto 16);
            when address_vipic_sclk_data =>
              sclk_data <= iobus.io_write_data;
              sclk_data_we <= iobus.io_write_data(31);
              sclk_den <= '1';
            when address_vipic_spy_fifo_csr =>
              spy_fifo_csr <= iobus.io_write_data;
            when others =>

          end case;
        end if;

        if ( iobus.io_read_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_vipic_csr =>
              bus_data <= vipic_csr(31) & sclk_locked & vipic_csr(29 downto 23) &
                          ts_reset_busy & vipic_csr(21 downto 20) &
                          ts_reset_armed & vipic_csr(18 downto 0);
            when address_vipic_clock =>
              bus_data <= read_busy & tsclk_busy & restart_busy & clean_busy & load_busy  & busy_d & busy_r & busy_s &
                          hitor & '0' & send_tsclk & send_clean & vipic_clock(19 downto 0);
            when address_vipic_calib =>
              bus_data <= cal_busy & vipic_calib(30 downto 0);
            when address_vipic_status =>
              bus_data <= vipic_mask & vipic_sync;
            when address_vipic_idelay =>
              bus_data <= idelay_busy & '0' & vipic_idelay(29 downto 28) & "000000" & vipic_idelay_tap & x"000" & vipic_idelay(3 downto 0);
            when address_vipic_test =>
              bus_data <= vipic_test_busy & vipic_test_csr(30 downto 0);
            when address_vipic_sclk_data =>
              bus_data <= sclk_busy & std_logic_vector(to_unsigned(0,15)) & sclk_data_out;
            when address_vipic_ts_counter_low =>
              bus_data <= timestamp_counter(31 downto 0);
            when address_vipic_ts_counter_high =>
              bus_data <= x"0000" & timestamp_counter(47 downto 32);
            when address_vipic_spy_fifo_csr =>
              bus_data <= spy_fifo_csr(31 downto 30) & spy_fifo_full & spy_fifo_empty &
                          spy_fifo_csr(27 downto 27) & vipic_fifo_valid & vipic_fifo_full & vipic_fifo_empty &
                          spy_fifo_csr(23 downto 0);
            when address_vipic_spy_fifo_data =>
              bus_data <= spy_fifo_output(31 downto 0);
              spy_fifo_addressed <= '1';
            when address_vipic_streamer =>
              bus_data <= stream_status;
            when address_vipic_trignum_low =>
              bus_data <= trigger_count(31 downto 0);
            when address_vipic_trignum_high =>
              bus_data <= x"000000" & trigger_count(39 downto 32);
            when others =>
              if ( iobus.io_address(15 downto 9) = "0001000" ) then
                read_smemw <= '1';
              elsif ( iobus.io_address(15 downto 9) = "0001001" ) then
                read_smemr <= '1';
              elsif ( iobus.io_address(15 downto 9) = "0001010" ) then
                read_rmemw <= '1';
              elsif ( iobus.io_address(15 downto 9) = "0001011" ) then
                read_rmemr <= '1';
              elsif ( iobus.io_address(15 downto 13) = "001" ) then
                read_dmemw <= '1';
              elsif ( iobus.io_address(15 downto 13) = "010" ) then
                read_dmemr <= '1';
              else
                bus_data <= x"c9f8f8f8";
              end if;
          end case;

        end if;
      else
        read_smemw <= '0';
        read_smemr <= '0';
        read_rmemw <= '0';
        read_rmemr <= '0';
        read_dmemw <= '0';
        read_dmemr <= '0';
        sclk_data_we <= '0';
        sclk_den <= '0';
        spy_fifo_addressed <= '0';
        iobus_ready <= '0';
        if ( ext_halt = '1' ) then
          vipic_csr(17) <= '1';
        elsif ( ext_start = '1' ) then
          vipic_csr(17) <= '0';
        end if;
      end if;
    end if;
  end process;

  process ( clky ) begin
    if ( clky'event and clky = '1') then
      smemw_addr <= not std_logic_vector(count(11 downto 0));
      smemr_addr <= smemw_addr;
      rmemw_addr <= not std_logic_vector(count(11 downto 0));
      rmemr_addr <= rmemw_addr;
      dmemw_addr <= not std_logic_vector(count(15 downto 0));
      dmemr_addr <= dmemw_addr;
      case state is
        when Idle =>
          if ( do_s = '1' ) then
            count <= ( 0 => '1', others => '0' );
            busy_s <= '1';
            busy_r <= '0';
            busy_d <= '0';
            state <= Counting;
          elsif ( do_r = '1' ) then
            count <= ( 0 => '1', others => '0' );
            busy_s <= '0';
            busy_r <= '1';
            busy_d <= '0';
            state <= Counting;
          elsif ( do_d = '1' ) then
            count <= ( 0 => '1', others => '0' );
            busy_s <= '0';
            busy_r <= '0';
            busy_d <= '1';
            state <= Counting;
          else
            count <= ( others => '0' );
            busy_s <= '0';
            busy_r <= '0';
            busy_d <= '0';
            sclkd <= '0';
            rclkd <= '0';
            dclkd <= '0';
          end if;
        when Counting =>
          count <= count + 1;
          sclkd <= busy_s;
          rclkd <= busy_r;
          dclkd <= busy_d;
          if ( ( count(11 downto 0) = x"000" and ( busy_s = '1' or busy_r = '1' ) ) or
               ( count(15 downto 0) = x"c000" and busy_d = '1' ) ) then
            state <= Last;
          end if;
        when Last =>
          busy_s <= '0';
          busy_r <= '0';
          busy_d <= '0';
          sclkd <= '0';
          rclkd <= '0';
          dclkd <= '0';
          state <= Done;
        when Done =>
          if ( do_s = '0' and do_r = '0' and do_d = '0' ) then
            state <= Idle;
          end if;
      end case;
    end if;
  end process;
  s_in(0) <= scin(0);
  smemr_we(0) <= sclkd;

  r_in(0) <= scin(1);
  rmemr_we(0) <= rclkd;

  d_in(0) <= scin(2);
  dmemr_we(0) <= dclkd;

  process ( sclk, ext_trig ) begin
    if ( sclk'event and sclk = '1' ) then
      last_ext_trig <= ext_trig;
    end if;
  end process;
  trigger <= '1' when last_ext_trig = '0' and ext_trig = '1' else '0';

  process ( tsclk ) begin
    if ( tsclk'event and tsclk = '1' ) then
      latched_timestamp_counter <= timestamp_counter;
    end if;
  end process;

  process ( sclk ) begin
    if ( sclk'event and sclk = '1' ) then

      if ( trigger_state = '0' ) then
        if ( trigger = '1' ) then
          latched_trigger <= trigger_count(39 downto 16);
          trigger_fifo_input <= "0000" & trigger_count(15 downto 0) & timestamp_counter(7 downto 0) & x"a8";
          trigger_state <= '1';
          trigger_dv <= vipic_csr(24);
        else
          trigger_dv <= '0';
        end if;
      else
        trigger_fifo_input <= "0000" & latched_trigger & x"b8";
        trigger_state <= '0';
        trigger_dv <= vipic_csr(24);
      end if;

      if ( vipic_fifo_valid = '1' or trigger_fifo_valid = '1' ) then
        if ( send_header = '1' ) then
          if ( send_ts_high = '0' ) then
            latched_ts_high <= timestamp_counter(47 downto 24);
            stream_data <= timestamp_counter(23 downto 0) & x"18";
            stream_data_valid <= '1';
            send_ts_high <= '1';
          else
            stream_data <= latched_ts_high & x"28";
            stream_data_valid <= '1';
            send_header <= '0';
            ts_idle <= ( others => '0' );
          end if;
        elsif ( trigger_fifo_valid = '1' ) then
          stream_data <= trigger_fifo_output(31 downto 0);
          stream_data_valid <= '1';
        else
          if ( vipic_fifo_output(7) = '1' ) then
            stream_data <= vipic_fifo_output(27 downto 24) &
                           decoded_address & "1111" &
                           vipic_fifo_output(23 downto 16) & x"02";
          else
            stream_data <= vipic_fifo_output(27 downto 24) &
                           decoded_address & vipic_fifo_output(6 downto 3) &
                           vipic_fifo_output(23 downto 16) & x"02";
          end if;
          stream_data_valid <= '1';
          if ( last_tsclk = '0' and tsclk = '1' ) then
            if ( need_ts = '0' ) then
              ts_idle <= ts_idle + 1;
              send_ts_high <= '0';
            end if;
          end if;
        end if;
      else
        send_header <= vipic_csr(20) and need_ts;
        stream_data_valid <= '0';
        stream_data <= ( others => '0' );
      end if;

      if ( last_tsclk = '0' and tsclk = '1' ) then
        if ( need_ts = '1' ) then
          send_ts_high <= '0';
        else
          ts_idle <= ts_idle + 1;
          send_ts_high <= '0';
        end if;
      end if;
      last_tsclk <= tsclk;

    end if;
  end process;

  need_ts <= '1' when ts_idle = "1111111" else '0';

  decoded_address(0) <= not vipic_fifo_output(15);
  decoded_address(1) <= not vipic_fifo_output(14);
  decoded_address(2) <= not vipic_fifo_output(13);
  decoded_address(3) <= not vipic_fifo_output(12);
  decoded_address(4) <= not vipic_fifo_output(11);
  decoded_address(5) <= not vipic_fifo_output(10);
  decoded_address(6) <= not vipic_fifo_output(9);
  decoded_address(7) <= not vipic_fifo_output(8);

  masked_address <= iobus.io_address(31 downto 16) and address_mask;
  write_data <= smemw_dout when read_smemw = '1' else
                smemr_dout when read_smemr = '1' else
                rmemw_dout when read_rmemw = '1' else
                rmemr_dout when read_rmemr = '1' else
                dmemw_dout when read_dmemw = '1' else
                dmemr_dout when read_dmemr = '1' else
                bus_data;

  smemw_we <= "0" when masked_address /= base_address else
              "0" when iobus.io_address(15 downto 9) /= "0001000" else
              "0" when iobus.io_addr_strobe = '0' else
              "0" when iobus.io_write_strobe = '0' else "1";
  rmemw_we <= "0" when masked_address /= base_address else
              "0" when iobus.io_address(15 downto 9) /= "0001010" else
              "0" when iobus.io_addr_strobe = '0' else
              "0" when iobus.io_write_strobe = '0' else "1";
  dmemw_we <= "0" when masked_address /= base_address else
              "0" when iobus.io_address(15 downto 13) /= "001" else
              "0" when iobus.io_addr_strobe = '0' else
              "0" when iobus.io_write_strobe = '0' else "1";
--
--  These are only used for the monitor/debug interface so we gate the clock
--
  process ( clky ) begin
    if ( clky'event and clky = '1' ) then
      mon_sclk <= sclkd;
      mon_rclk <= rclkd;
      mon_dclk <= dclkd;
    end if;
  end process; 
  s_clk <= '0' when clky = '1' else mon_sclk;
  r_clk <= '0' when clky = '1' else mon_rclk;
  d_clk <= '0' when clky = '1' else mon_dclk;

--  The FIFO read enable is asserted before the clock cycle that
--  latches the output and advances the FIFO.
--  If we need to send a timestamp or a trigger number then don't
--  enable the pixel fifo.  If we need to send a timestamp, then
--  don't enable the trigger fifo.

  vipic_fifo_read <= vipic_fifo_valid when send_header = '0' and trigger_fifo_valid = '0' else '0';
  trigger_fifo_read <= trigger_fifo_valid when send_header = '0' else '0';

  fifo_input <= "0000" & vipic_data;
  stream_strobe <= stream_sendpkt;
  sclk_reset <= vipic_csr(31);
  sout <= vipic_sout;
  ts_clk <= tsclk;
  rstrobe <= rstr;
  serial_clk <= vipic_serial_clk;

  sclkddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => scclk(0),
    c => clky,
    ce => '1',
    d2 => sclkd,
    d1 => '0',
    s => '0',
    r => '0'
  );
  rclkddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE",
    srtype => "SYNC"
  )
  port map (
    q => scclk(1),
    c => clky,
    ce => '1',
    d2 => rclkd,
    d1 => '0',
    s => '0',
    r => '0'
  );
  dclkddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => scclk(2),
    c => clky,
    ce => '1',
    d2 => dclkd,
    d1 => '0',
    s => '0',
    r => '0'
  );

  soutddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => scout(0),
    c => clky,
    ce => '1',
    d1 => s_out(0),
    d2 => s_out(0),
    s => '0',
    r => '0'
  );
  routddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => scout(1),
    c => clky,
    ce => '1',
    d1 => r_out(0),
    d2 => r_out(0),
    s => '0',
    r => '0'
  );
  doutddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => scout(2),
    c => clky,
    ce => '1',
    d1 => d_out(0),
    d2 => d_out(0),
    s => '0',
    r => '0'
  );

  strobeddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => strobe,
    c => sclk,
    ce => '1',
    d1 => vipic_cal_strobe,
    d2 => vipic_cal_strobe,
    s => '0',
    r => '0'
  );

-- Gregory says that data should be asserted on the falling
-- edge because it is sampled on the rising edge.

  vipic_channel_enable <= vipic_mask when vipic_csr(17) = '0' else ( others => '0' );

  sc_debug <= rclkd & r_in & r_out & r_clk & scin(1) & scin(0) & busy_s & clky;

--  sc_debug <= busy_s & s_in & s_out & s_clk & busy_r & r_in & r_out & r_clk;
--  fifo_debug <= vipic_fifo_valid & stream_data_valid & tsclk & vipic_fifo_empty & send_header & vipic_fifo_read & vipic_dv & sclk;
--  cal_debug <= vipic_cal_strobe & cal_busy & tsclk & '0' & vipic_dv & rstr & vipic_serial_clk & sclk;

  debug_select <= vipic_csr(15) or vipic_csr(14);
  debug <= clock_debug when vipic_csr(15 downto 14) = "10" else
           chan_debug when vipic_csr(15 downto 14) = "11" else
           sc_debug when vipic_csr(15 downto 14) = "01" else ( others => '0' );

end rtl;
