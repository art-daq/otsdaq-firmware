--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    strip_interface - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Defines a MicroBlaze LMB slave that interfaces with the
--                 strip sensor hybrids
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--   strip_csr - 0xc4000000
--     Bits  2.. 0 - R   - Number of channels (normally 6)
--     Bits  7.. 3 - R/W - Packet size
--     Bits 13.. 8 - R/W - Channel enable mask
--     Bits 15..14 - R/W - Idle count
--     Bit 16      - R/W - external clock select 
--     Bit 17      - halt readout
--     Bit 18      -
--     Bit 19      - R/W - arm BCO reset
--     Bit 20      - R/W - flush packet buffers
--     Bit 21      - R/W - clear trigger number
--     Bit 22      - R/W - clear BCO counter
--     Bit 23      - R/W - enable trigger veto
--     Bit 24      - R/W - send trigger primitive data
--     Bit 25      - R/W - send trigger number
--     Bit 26      - R/W - Send bunch counter
--     Bit 27      - R/W - Send strip hit data
--     Bit 28      -
--     Bit 29      - R/W - clock DCM locked
--     Bit 30      - R/W - clock DCM locked
--     Bit 31      - R/W - DCM reset
--
--  strip_reset - 0c4000004
--     Bits  5.. 0 - R/W - Reset mask
--     Bits 31..24 - R/W - Reset type/status
--
--
--  trig_csr - 0xc4000060
--     Bit 3..0    - R/W - BCO offset
--     Bit 7       - R/W - Halt pipeline
--     Bits 31..28 - R   - Trigger inputs
--
--  spy_fifo_csr - 0xc4000030
--     Bit   3.. 0 - channel select
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library stib;
use stib.iobus.ALL;

use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.VComponents.all;

entity strip_interface is
  generic ( nsensor : integer := 2 );
  port (
    clk : in std_logic;                                      -- bus clock
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    clkx : in std_logic;
    clky : in std_logic;
    ext_clk : in std_logic;
    ext_trig : in std_logic;
    ext_halt : in std_logic;
    ext_start : in std_logic;

    dac_cs : out std_logic_vector(3 downto 0);
    dac_sdi : out std_logic;
    dac_sdo : in std_logic;
    dac_sclk : out std_logic;
    dac_reset : out std_logic;
    dac_busab : out std_logic_vector(11 downto 0);
    dac_clk : out std_logic;
    dac_dataclk : out std_logic;

    clocks_locked : out std_logic; 
    something_busy : out std_logic; 
    mclka : out std_logic;                                    -- 66.667 mhz phase 0 deg
    mclkb : out std_logic;                                    -- 66.667 mhz phase 90 deg
    bcoclk : out std_logic_vector(nsensor-1 downto 0);        -- synthesized bco clk to chips - variable frequency
	 
	 bco_cnt_out : out std_logic_vector(47 downto 0); --RAR
	 
    strip_reset : out std_logic_vector(nsensor-1 downto 0);
    shift : out std_logic_vector(nsensor-1 downto 0);
    scin : out std_logic_vector(nsensor-1 downto 0);
    scout : in std_logic_vector(nsensor-1 downto 0);
    out1_0 : in std_logic_vector(nsensor-1 downto 0);
    out1_1 : in std_logic_vector(nsensor-1 downto 0);
    out1_2 : in std_logic_vector(nsensor-1 downto 0);
    out1_3 : in std_logic_vector(nsensor-1 downto 0);
    out1_4 : in std_logic_vector(nsensor-1 downto 0);
    hitor : in std_logic_vector(nsensor-1 downto 0);
    sync_error : out std_logic;  -- used to trigger logic analyzer
    data_available : out std_logic;  -- used to trigger logic analyzer
    bco_zero : out std_logic;
    stream_rclk : in std_logic;
    stream_read_enable : in std_logic;
    stream_dout : out std_logic_vector(7 downto 0);
    stream_length : out std_logic_vector(15 downto 0);
    stream_cksum : out std_logic_vector(15 downto 0);
    stream_strobe : out std_logic;
    stream_ready : in std_logic;

    serdes_data : out std_logic_vector(31 downto 0);
    serdes_data_we : out std_logic;

    strip_debug : out std_logic_vector(7 downto 0);
    debug_select : out std_logic
  );
end strip_interface;

architecture behavioral of strip_interface is

  component stripdacspi
    port (
      clk : in std_logic;
      reset : in std_logic;
      strobe : in std_logic;
      busy : out std_logic;
      sel : in std_logic_vector(3 downto 0);
      addr : in std_logic_vector(7 downto 0);
      din : in std_logic_vector(7 downto 0);
      dout : out std_logic_vector(7 downto 0);
      cs : out std_logic_vector(3 downto 0);
      sdi : out std_logic;
      sdo : in std_logic;
      sclk : out std_logic
    );
  end component;

  component stripdac
    port (
      reset : in std_logic;
      strobe : in std_logic;
      enable : in std_logic;
      busy : out std_logic;
      bcoclk : in std_logic;
      bco : in std_logic_vector(7 downto 0);
      bco_match : in std_logic_vector(7 downto 0);
      bco_mask : in std_logic_vector(7 downto 0);
      bco_period : in std_logic_vector(7 downto 0);
      value : in std_logic_vector(11 downto 0);
      delay : in std_logic_vector(11 downto 0);
      rate : in std_logic_vector(3 downto 0);
      clk : in std_logic;
      dataclk : out std_logic;
      busab : out std_logic_vector(11 downto 0)
    );
  end component;

  component stripclk
    port (
      clk_x : in std_logic;
      clk_y : in std_logic;
      clk_ext : in std_logic;
      clksel : in std_logic;
      mclk_a : out std_logic;
      mclk_b : out std_logic;
      outclk : out std_logic;
      bcoclk : out std_logic;
      dacclk : out std_logic;
      reset : in std_logic;
      locked : out std_logic_vector(1 downto 0);
      arm_bco_reset : in std_logic;
      bco_reset_armed : out std_logic;
      bco_reset_busy : out std_logic;
      bco_reset : in std_logic;
      bco_reset_now : in std_logic;
      bco : out std_logic_vector(47 downto 0);
      fracbcoclk : out std_logic;
      fracbco : out std_logic_vector(2 downto 0);
      bcoclk_data_in : in std_logic_vector(15 downto 0);
      bcoclk_data_out : out std_logic_vector(15 downto 0);
      bcoclk_addr : in std_logic_vector(6 downto 0);
      bcoclk_we : in std_logic;
      bcoclk_en : in std_logic;
      busclk : in std_logic;
      bcoclk_busy : out std_logic;
      debug : out std_logic_vector(7 downto 0)
    );
  end component;

  component stripreset
    generic ( n : integer := 1 );
    port (
      clk : in std_logic;
      do_reset : in std_logic_vector(7 downto 0);
      reset_mask : in std_logic_vector (n-1 downto 0);
      reset_busy : out std_logic;
      fssr_reset : out std_logic_vector (n-1 downto 0);
      fifo_reset : out std_logic_vector (n-1 downto 0);
      error_reset : out std_logic_vector (n-1 downto 0);
      link_reset : out std_logic_vector (n-1 downto 0);
      dac_reset : out std_logic
    );
  end component;

  component stripsc
    generic ( n : integer := 1 );
    port (
      clk : in std_logic;
      strobe : in std_logic;
      busy : out std_logic;
      raw : in std_logic;
      bco : in std_logic_vector(7 downto 0);
      bco_sync : in std_logic;
      bco_zero : in std_logic;
      chipid : in std_logic_vector(4 downto 0);
      addr : in std_logic_vector(4 downto 0);
      inst : in std_logic_vector(2 downto 0);
      count : in std_logic_vector(7 downto 0);
      sel : in std_logic_vector(2 downto 0);
      mask : in std_logic_vector(n-1 downto 0);
      bits_in : in std_logic_vector(127 downto 0);
      bits_out : out std_logic_vector(127 downto 0);
      shift : out std_logic_vector(n-1 downto 0);
      scin : out std_logic_vector(n-1 downto 0);
      scout : in std_logic_vector(n-1 downto 0)
    );
  end component;

  component chipserdes 
    generic (
      chipid : integer := 0;
      channel : integer := 0;
      iobdelay_value : integer := 0
    );
    port (
      reset : in std_logic;
      enable : in std_logic;
      mclk : in std_logic;
      din : in std_logic;
      serdes_input : out std_logic;
      outclk : in std_logic;
      dout : out std_logic_vector(31 downto 0);
      sync_valid : out std_logic;
      data_valid : out std_logic;
      ack : in std_logic;
      dlyce : in std_logic;
      dlyrst : in std_logic;
      dlyinc : in std_logic;
      status : out std_logic_vector(31 downto 0)
    );
  end component;

  component stripfifo
    port (
      clk : in std_logic;
      reset : in std_logic;
      din1 : in std_logic_vector(31 downto 0);
      din2 : in std_logic_vector(31 downto 0);
      din3 : in std_logic_vector(31 downto 0);
      din4 : in std_logic_vector(31 downto 0);
      din5 : in std_logic_vector(31 downto 0);
      data_valid : in std_logic_vector(5 downto 1);
      ack : out std_logic_vector(5 downto 1);
      spy_data : out std_logic_vector(31 downto 0);
      spy_data_valid : out std_logic;
      rdclk : in std_logic;
      fifo_empty : out std_logic;
      dout : out std_logic_vector(31 downto 0);
      token_in : in std_logic;
      token_out : out std_logic;
      dout_valid : out std_logic;
      trig_enable : in std_logic;
      trig_clk : out std_logic;
      trig_addr : out std_logic_vector(7 downto 0);
      trig_data : in std_logic_vector(3 downto 0)
  );
  end component;

  component stripana
    port (
      clear : in std_logic;
      done : out std_logic;
      strip : in std_logic_vector(3 downto 0);
      set : in std_logic_vector(4 downto 0);
      adc : in std_logic_vector(2 downto 0);
      tcbit : in std_logic_vector(4 downto 0);
      clk : in std_logic;
      bcoclk : in std_logic;
      din : in std_logic_vector(31 downto 0);
      write_enable : in std_logic;
      bco_counter : out std_logic_vector(31 downto 0);
      nhit1 : out std_logic_vector(31 downto 0);
      nhit2 : out std_logic_vector(31 downto 0);
      nhit3 : out std_logic_vector(31 downto 0);
      nhit4 : out std_logic_vector(31 downto 0);
      nhit5 : out std_logic_vector(31 downto 0)
  );
  end component;

  component trigprim
    generic (
      datatype : std_logic_vector(7 downto 0) := x"f8"
    );
    port (
      reset : in std_logic;
      trig_input : in  std_logic_vector(1 downto 0);
      enable_input : in  std_logic_vector(1 downto 0);
      fbcoclk : in  std_logic;
      bcoclk : in  std_logic;
      bco : in  std_logic_vector (7 downto 0);
      fbco : in  std_logic_vector (2 downto 0);
      bco_trim : in std_logic_vector(3 downto 0);
      fbco_trim_0 : in std_logic_vector(3 downto 0);
      fbco_trim_1 : in std_logic_vector(3 downto 0);
      trig_mask_0 : in  std_logic_vector (7 downto 0);
      trig_mask_1 : in  std_logic_vector (7 downto 0);
      trig_output : out  std_logic;
      send_trig : in std_logic;
      spy_data : out std_logic_vector(31 downto 0);
      spy_data_valid : out std_logic;
      rdclk : in std_logic;                   -- reads the data fifo
      fifo_empty : out std_logic;             -- data fifo empty flag
      dout : out std_logic_vector(31 downto 0);  -- fifo output
      token_in : in std_logic;                -- token in
      token_out : out std_logic;              -- token out
      dout_valid : out std_logic             -- asserted when data is being read
    );
  end component;

  component trigproc
    port (
      reset : in std_logic;
      fbcoclk : in  std_logic;
      bcoclk : in  std_logic;
      bco : in  std_logic_vector (7 downto 0);
      fbco : in  std_logic_vector (2 downto 0);
      trig_input : in std_logic_vector(3 downto 0);
      bco_offset : in std_logic_vector(3 downto 0);
      trigger_number : out std_logic_vector(39 downto 0);
      clear : in std_logic;
		ext_trig : in std_logic;
      send_trignum : in std_logic;
      addr : out std_logic_vector(7 downto 0);
      spy_data : out std_logic_vector(31 downto 0);
      spy_data_valid : out std_logic;
      rdclk : in std_logic;
      fifo_empty : out std_logic;
      dout : out std_logic_vector(31 downto 0);
      token_in : in std_logic;
      token_out : out std_logic;
      dout_valid : out std_logic
    );
  end component;

  component stripstream
    generic ( n : integer := 1 );
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

  component striptbm
    port (
      clk : in std_logic;
      reset : in std_logic;
      data_available : in std_logic;
      send_bco : in std_logic;
      bco : in std_logic_vector(47 downto 0);
      bco_count : in std_logic_vector(7 downto 0);
      dout : out std_logic_vector(31 downto 0);
      data_valid : out std_logic;
      token_in : in std_logic;
      token_out : out std_logic;
      oops : out std_logic
    );
  end component;

  component trigbuf
    port (
      clka : in std_logic;
      wea : in std_logic_vector(0 downto 0);
      addra : in std_logic_vector(7 downto 0);
      dina : in std_logic_vector(3 downto 0);
      clkb : in std_logic;
      addrb : in std_logic_vector(7 downto 0);
      doutb : out std_logic_vector(3 downto 0)
    );
  end component;

  component chip_fifo
    port (
      rst : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(35 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(35 downto 0);
      empty : out std_logic;
      full : out std_logic
    );
  end component;

  constant base_address : std_logic_vector(15 downto 0) := x"c400";
  constant address_mask : std_logic_vector(15 downto 0) := x"ffff";
  signal masked_address : std_logic_vector(15 downto 0);

  constant address_strip_csr : std_logic_vector(15 downto 0) := x"0000";       -- command status register
  constant address_strip_reset : std_logic_vector(15 downto 0) := x"0004";     -- reset
  constant address_strip_sc : std_logic_vector(15 downto 0) := x"0008";        -- slow controls parameters
  constant address_strip_sci0 : std_logic_vector(15 downto 0) := x"0010";      -- data to be shifted into fssr2
  constant address_strip_sci1 : std_logic_vector(15 downto 0) := x"0014";
  constant address_strip_sci2 : std_logic_vector(15 downto 0) := x"0018";
  constant address_strip_sci3 : std_logic_vector(15 downto 0) := x"001c";
  constant address_strip_sco0 : std_logic_vector(15 downto 0) := x"0020";      -- data received from fssr2
  constant address_strip_sco1 : std_logic_vector(15 downto 0) := x"0024";
  constant address_strip_sco2 : std_logic_vector(15 downto 0) := x"0028";
  constant address_strip_sco3 : std_logic_vector(15 downto 0) := x"002c";
  constant address_spy_fifo_csr : std_logic_vector(15 downto 0) := x"0030";
  constant address_spy_fifo_data : std_logic_vector(15 downto 0) := x"0034";
  constant address_strip_ana_csr : std_logic_vector(15 downto 0) := x"0038";
  constant address_strip_ana_bco_counter  : std_logic_vector(15 downto 0) := x"003c";
  constant address_strip_ana_hit1_counter : std_logic_vector(15 downto 0) := x"013c";
  constant address_strip_ana_hit2_counter : std_logic_vector(15 downto 0) := x"023c";
  constant address_strip_ana_hit3_counter : std_logic_vector(15 downto 0) := x"033c";
  constant address_strip_ana_hit4_counter : std_logic_vector(15 downto 0) := x"043c";
  constant address_strip_ana_hit5_counter : std_logic_vector(15 downto 0) := x"053c";
  constant address_strip_status : std_logic_vector(15 downto 0) := x"0130";
  constant address_strip_bco_counter_low : std_logic_vector(15 downto 0) := x"0040";    -- bco counter
  constant address_strip_bco_counter_high : std_logic_vector(15 downto 0) := x"0044";   -- bco counter
  constant address_strip_bco_dcm : std_logic_vector(15 downto 0) := x"0048";            -- bco dcm data
  constant address_strip_streamer : std_logic_vector(15 downto 0) := x"004c";
  constant address_strip_dac_csr  : std_logic_vector(15 downto 0) := x"0050";           -- dac control register
  constant address_strip_dac_value  : std_logic_vector(15 downto 0) := x"0054";         -- dac amplitude
  constant address_strip_dac_spi : std_logic_vector(15 downto 0) := x"0058";            -- dac spi interface
  constant address_strip_words_dumped : std_logic_vector(15 downto 0) := x"005c";       -- words dumped by stripstream
  constant address_strip_trig_csr : std_logic_vector(15 downto 0) := x"0060"; 
  constant address_strip_trig_fifo : std_logic_vector(15 downto 0) := x"0064"; 
  constant address_strip_trig_unbiased : std_logic_vector(15 downto 0) := x"0068";
  constant address_strip_debug_monitor : std_logic_vector(15 downto 0) := x"006c";
  constant address_strip_trig_input_0 : std_logic_vector(15 downto 0) := x"0070";
  constant address_strip_trig_input_1 : std_logic_vector(15 downto 0) := x"0074";
  constant address_strip_trig_input_2 : std_logic_vector(15 downto 0) := x"0078";
  constant address_strip_trig_input_3 : std_logic_vector(15 downto 0) := x"007c";
  constant address_strip_trignum_low : std_logic_vector(15 downto 0) := x"0080";
  constant address_strip_trignum_high : std_logic_vector(15 downto 0) := x"0084";
  constant address_strip_trim_csr : std_logic_vector(15 downto 0) := x"0088";
  constant address_bco_freq : std_logic_vector(15 downto 0) := x"008c";
  constant address_cmd_counter : std_logic_vector(15 downto 0) := x"0090";
  constant address_trig_counter : std_logic_vector(15 downto 0) := x"0094";
  constant address_daq_param : std_logic_vector(15 downto 0) := x"0098";

  signal strip_csr : std_logic_vector(31 downto 0);
  signal strip_daq_param : std_logic_vector(31 downto 0) := x"00000080";

  signal dcm_mclk_a : std_logic;
  signal dcm_mclk_b : std_logic;
  signal dcm_bcoclk : std_logic;
  signal regional_bcoclk : std_logic;
  signal dcm_outclk : std_logic;
  signal strip_clk_locked : std_logic_vector(1 downto 0);
  signal dcm_reset : std_logic;
  signal fracbcoclk : std_logic;
  signal fracbco : std_logic_vector(2 downto 0);

  type bco_reset_state_t is ( Idle, Resetting, Pause1, Pause2, Pause3, Pause4, DoingScrSet, Done );
  signal bco_reset_state : bco_reset_state_t := Idle;
  signal automatic_scr_set : std_logic := '0';
  signal automatic_scr_strobe : std_logic := '0';
  signal bus_strip_sc : std_logic_vector(31 downto 0);
  signal strip_sc : std_logic_vector(31 downto 0);
  signal sci_bits : std_logic_vector(127 downto 0);
  signal sco_bits : std_logic_vector(127 downto 0);
  signal sc_count : std_logic_vector(7 downto 0);
  signal sc_busy : std_logic;
  signal do_sc : std_logic;
  signal bus_do_sc : std_logic;
  signal sc_working : std_logic;
  signal dac_busy : std_logic;
  signal do_dac : std_logic;

  signal bcoclk_data : std_logic_vector(31 downto 0);
  signal sc_shift : std_logic_vector(nsensor-1 downto 0);
  signal sc_scin : std_logic_vector(nsensor-1 downto 0);
  signal sc_scout : std_logic_vector(nsensor-1 downto 0);
  signal bco_counter_zero : std_logic;

  signal do_spi : std_logic;
  signal spi_busy : std_logic;
  signal spi_doing_stuff_bit : std_logic;
  signal dac_doing_stuff_bit : std_logic;
  signal strip_dac_spi : std_logic_vector(31 downto 0);
  signal strip_dac_csr : std_logic_vector(31 downto 0);
  signal strip_dac_data : std_logic_vector(7 downto 0);
  signal strip_dac_reset : std_logic;
  signal strip_dac_clk : std_logic;
  signal strip_dac_value : std_logic_vector(31 downto 0);

  signal do_reset : std_logic_vector(7 downto 0);
  signal reset_status : std_logic_vector(7 downto 0);
  signal reset_busy : std_logic;
  signal reset_mask : std_logic_vector(nsensor-1 downto 0);
  signal fssr_reset : std_logic_vector(nsensor-1 downto 0);
  signal strip_serdes_reset : std_logic_vector(nsensor-1 downto 0);
  signal strip_fifo_reset : std_logic_vector(nsensor-1 downto 0);
  signal strip_error_clear : std_logic_vector(nsensor-1 downto 0);
  signal strip_data : std_logic_vector(31 downto 0);
  signal strip_fifo_filter : std_logic_vector(1 downto 0);
  signal strip_serdes_status : std_logic_vector(31 downto 0);
  signal strip_bco_counter : std_logic_vector(47 downto 0);
  signal strip_data_available : std_logic;

  signal cmd_counter : std_logic_vector(31 downto 0) := ( others => '0' );
  signal trig_counter : std_logic_vector(31 downto 0) := ( others => '0' );
  signal halt_count : unsigned(15 downto 0) := x"0000";
  signal start_count : unsigned(15 downto 0) := x"0000";
  signal trig_count : unsigned(31 downto 0) := x"00000000";
  signal reset_count : unsigned(15 downto 0) := x"0000";
  signal latched_halt : std_logic;
  signal latched_start : std_logic;
  signal latched_trig : std_logic;

  signal bcoclk_data_out : std_logic_vector(15 downto 0);
  signal bcoclk_data_we : std_logic;
  signal bcoclk_den : std_logic;
  signal bcoclk_addressed : std_logic;

  signal spy_fifo_csr : std_logic_vector(31 downto 0);
  signal read_spy_fifo_csr : std_logic_vector(31 downto 0);

  TYPE vector_array_t IS ARRAY(NSENSOR-1 DOWNTO 0,5 DOWNTO 1) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  TYPE bit_array_t IS ARRAY(NSENSOR-1 DOWNTO 0,5 DOWNTO 1) OF STD_LOGIC;
  TYPE channel_vector_t IS ARRAY(NSENSOR-1 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  TYPE another_bit_vector_t IS ARRAY(NSENSOR-1 DOWNTO 0) OF STD_LOGIC_VECTOR(5 DOWNTO 1);
  SIGNAL STRIP_DATA_ARRAY : vector_array_t;
  SIGNAL STRIP_STATUS_ARRAY : vector_array_t;
  SIGNAL STRIP_SYNC_VALID : another_bit_vector_t;
  SIGNAL STRIP_DATA_VALID : another_bit_vector_t;
  SIGNAL STRIP_DATA_ACK : another_bit_vector_t;
  SIGNAL STRIP_FIFO_EMPTY : STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
  SIGNAL STRIP_FIFO_DATA : channel_vector_t;
  SIGNAL STRIP_FIFO_DATA_VALID : STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
  SIGNAL STRIP_SERDES_INPUT : bit_array_t;
  SIGNAL STRIP_SPY_DATA : channel_vector_t;
  SIGNAL STRIP_SPY_DATA_VALID : STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
  SIGNAL STRIP_FIFO_AVAILABLE : STD_LOGIC;
  SIGNAL MONITOR_CHANNEL : INTEGER RANGE 0 TO NSENSOR-1;
  SIGNAL MONITOR_CHIP : INTEGER RANGE 1 TO 5;
  SIGNAL spy_channel : integer range 0 to 15;

  SIGNAL STREAM_STATUS : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STREAM_WORDS_DUMPED : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STREAM_SENDPKT : STD_LOGIC;

  SIGNAL STRIP_ANA_ICHAN : INTEGER RANGE 0 TO NSENSOR-1;
  SIGNAL STRIP_ANA_CSR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_ANA_DONE : STD_LOGIC;
  SIGNAL STRIP_ANA_RESET : STD_LOGIC;
  SIGNAL STRIP_ANA_DIN : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_ANA_WE : STD_LOGIC;
  SIGNAL STRIP_ANA_BCO : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_ANA_NHIT1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_ANA_NHIT2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_ANA_NHIT3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_ANA_NHIT4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_ANA_NHIT5 : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL TOKEN : STD_LOGIC_VECTOR(NSENSOR+5 DOWNTO 0);
  SIGNAL TBM_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL TBM_DATA_VALID : STD_LOGIC;
  SIGNAL TBM_STATUS_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL TBM_STATUS_DATA_VALID : STD_LOGIC;
  SIGNAL TBM_OOPS : STD_LOGIC;

  SIGNAL BCOCLK_BUSY : STD_LOGIC;

  SIGNAL TRIGGER_DPRAM_WE : STD_LOGIC_VECTOR(0 DOWNTO 0);
  TYPE trig_addr_t IS ARRAY(NSENSOR-1 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
  TYPE trig_data_t IS ARRAY(NSENSOR-1 DOWNTO 0) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
  TYPE trig_fifo_data_t IS ARRAY(3 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL TRIG_CLK : STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
  SIGNAL TRIG_ADDR : trig_addr_t; 
  SIGNAL TRIG_DATA : trig_data_t;

  SIGNAL STRIP_TRIG_CSR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_TRIG_INPUT_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_TRIG_INPUT_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_TRIG_INPUT_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL STRIP_TRIG_INPUT_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL TRIG_FIFO_EMPTY : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL TRIG_FIFO_DATA : trig_fifo_data_t;
  SIGNAL TRIG_FIFO_DATA_VALID : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL TRIG_OUTPUTS : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  signal spy_trigprim_data_valid: std_logic_vector(3 downto 0);
  signal spy_trigprim_data : trig_fifo_data_t;                 -- std_logic_vector(31 downto 0);
  SIGNAL TRIG_DPRAM_ADDR : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL SPY_TRIG_FIFO_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);

  signal spy_trigproc_data : std_logic_vector(31 downto 0);
  signal spy_trigproc_data_valid : std_logic;
  SIGNAL TRIGNUM_FIFO_EMPTY : STD_LOGIC;
  SIGNAL TRIGNUM_FIFO_DOUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL TRIGNUM_FIFO_DATA_VALID : STD_LOGIC;
  SIGNAL STRIP_TRIGGER_NUMBER : STD_LOGIC_VECTOR(39 DOWNTO 0);

  SIGNAL UNBIASED_TRIGGER : STD_LOGIC;
  SIGNAL EXT_UNBIASED : STD_LOGIC_VECTOR(1 DOWNTO 0);

  SIGNAL STRIP_TRIG_UNBIASED : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"0FFFFF00";

  SIGNAL MATCH_BCO_BIT : INTEGER RANGE 0 TO 15;
  SIGNAL MATCH_BCO_WIDTH : INTEGER RANGE 0 TO 15;
  SIGNAL MATCH_BCO_MASK : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL MATCH_BCO : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL MATCH_ZERO_MASK : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL ZERO_BCO : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL SENSOR_ENABLE : STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);

  SIGNAL HITOR_INPUT : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
  signal debug_monitor : std_logic_vector(31 downto 0) := X"00000010";
  signal spy_fifo_a_input : std_logic_vector(35 downto 0);
  signal spy_fifo_a_we : std_logic;
  signal spy_fifo_a_read_enable : std_logic;
  signal spy_fifo_a_full : std_logic;
  signal spy_fifo_a_empty : std_logic;
  signal spy_fifo_a_output : std_logic_vector(35 downto 0);
  signal spy_fifo_a_addressed : std_logic;
  signal spy_fifo_b_input : std_logic_vector(35 downto 0);
  signal spy_fifo_b_we : std_logic;
  signal spy_fifo_b_full : std_logic;
  signal spy_fifo_b_empty : std_logic;
  signal spy_fifo_b_output : std_logic_vector(35 downto 0);
  signal spy_fifo_b_read_enable : std_logic;
  signal spy_fifo_b_addressed : std_logic;
  signal spy_fifo_c_input : std_logic_vector(35 downto 0);
  signal spy_fifo_c_we : std_logic;
  signal spy_fifo_c_full : std_logic;
  signal spy_fifo_c_empty : std_logic;
  signal spy_fifo_c_output : std_logic_vector(35 downto 0);
  signal spy_fifo_c_read_enable : std_logic;
  signal spy_fifo_c_addressed : std_logic;

  signal latch_count : std_logic := '0';
  signal clear_count : std_logic := '0';
  signal please_count : std_logic := '1';
  signal busclk_count : unsigned(31 downto 0);
  signal bcoclk_count : unsigned(31 downto 0);
  signal bcoclk_freq : std_logic_vector(31 downto 0);

  SIGNAL do_trim : STD_LOGIC := '0';
  SIGNAL trim_busy : STD_LOGIC := '0';
  TYPE dly_enable_t IS ARRAY(NSENSOR-1 DOWNTO 0) OF STD_LOGIC_VECTOR(5 DOWNTO 1);
  SIGNAL dly_enable : dly_enable_t;
  SIGNAL dly_reset : dly_enable_t;
  signal strip_trim_csr : std_logic_vector(31 downto 0) := x"10000010";
  signal trim_count : unsigned(5 downto 0) := "000000";
  signal strip_mclk : std_logic_vector(nsensor-1 downto 0);

  signal trig_enable_0 : std_logic_vector(1 downto 0);
  signal trig_enable_1 : std_logic_vector(1 downto 0);
  signal trig_enable_2 : std_logic_vector(1 downto 0);
  signal trig_enable_3 : std_logic_vector(1 downto 0);

--  signal reset_bco_counter : std_logic;
  signal bco_reset_armed : std_logic;
  signal bco_reset_busy : std_logic;
  signal do_bco_reset : std_logic := '0';
  signal arm_bco_reset : std_logic := '0';
  signal debug_reset : std_logic_vector(7 downto 0);

  type iobdelay_array_t is array(0 to 5,1 to 5) of integer;
  constant iobdelay : iobdelay_array_t := ( (0,0,0,0,0),
                                            (0,0,0,0,0),
                                            (0,0,0,0,0),
                                            (0,0,0,0,0),
                                            (0,0,0,0,0),
                                            (0,0,0,0,0) );
begin

  clocks_locked <= '1' when (dcm_reset = '1' or (strip_clk_locked(1) = '1' and strip_clk_locked(0) = '1'))
                        else '0'; --RAR
								
		 bco_cnt_out <= strip_bco_counter;

  stripclk_imp : stripclk
  port map (
    clk_x => clkx,
    clk_y => clky,
    clk_ext => ext_clk,
    clksel => strip_csr(16),      -- ext_bcoclk field: selects external bco clock source
    mclk_a => dcm_mclk_a,
    mclk_b => dcm_mclk_b,
    outclk => dcm_outclk,
    bcoclk => dcm_bcoclk,
    dacclk => strip_dac_clk,
    reset => dcm_reset,
    locked => strip_clk_locked,
    arm_bco_reset => arm_bco_reset,  -- arm the BCO reset logic
    bco_reset_armed => bco_reset_armed,   -- bco reset status
    bco_reset_busy => bco_reset_busy,   -- bco reset in progress
    bco_reset => ext_start,         -- reset bco to zero when armed
    bco_reset_now => do_bco_reset,  -- reset bco to zero when armed
    bco => strip_bco_counter,
    fracbcoclk => fracbcoclk,
    fracbco => fracbco,
    bcoclk_data_in => bcoclk_data(15 downto 0),
    bcoclk_data_out => bcoclk_data_out,
    bcoclk_addr => bcoclk_data(22 downto 16),
    bcoclk_we => bcoclk_data_we,
    bcoclk_en => bcoclk_den,
    busclk => clk,
    bcoclk_busy => bcoclk_busy,
    debug => debug_reset
  );

--  bcoclk_bufr_imp : bufr
--  port map (
--    i => dcm_bcoclk,
--    ce => '1',
--    clr => '0',
--    o => regional_bcoclk
--  );
  regional_bcoclk <= dcm_bcoclk;

  dacspi_imp : stripdacspi
  PORT MAP (
    CLK => CLKY,
    RESET => STRIP_DAC_RESET,
    STROBE => DO_SPI,
    BUSY => SPI_BUSY,
    SEL => STRIP_DAC_SPI(19 DOWNTO 16),
    ADDR => STRIP_DAC_SPI(15 DOWNTO 8),
    DIN => STRIP_DAC_SPI(7 DOWNTO 0),
    DOUT => STRIP_DAC_DATA,
    CS => DAC_CS,
    SDI => DAC_SDI,
    SDO => DAC_SDO,
    SCLK => DAC_SCLK
  );

  dac_imp : stripdac
  PORT MAP (
    RESET => STRIP_DAC_RESET,
    STROBE => DO_DAC,
    ENABLE => STRIP_DAC_CSR(30),
    BUSY => DAC_BUSY,
    BCOCLK => DCM_BCOCLK,
    BCO => STRIP_BCO_COUNTER(7 DOWNTO 0),
    BCO_MATCH => STRIP_DAC_CSR(23 DOWNTO 16),
    BCO_MASK => STRIP_DAC_CSR(15 DOWNTO 8),   -- trigger when BCO&MASK = MATCH
    BCO_PERIOD => STRIP_DAC_CSR(7 DOWNTO 0),  -- how many BCO to wait before next trigger
    VALUE => STRIP_DAC_VALUE(11 DOWNTO 0),    -- pulse amplitude
    DELAY => STRIP_DAC_VALUE(31 DOWNTO 20),   -- how many DAC_CLK to wait after trigger before firing pulse
    RATE => STRIP_DAC_VALUE(19 DOWNTO 16),    -- how fast to return to baseline
    CLK => STRIP_DAC_CLK,
    DATACLK => DAC_DATACLK,
    BUSAB => DAC_BUSAB
  );

  reset_imp : stripreset
  generic map ( n => nsensor )
  port map (
    clk => regional_bcoclk,
    do_reset => do_reset,
    reset_mask => reset_mask,
    reset_busy => reset_busy,
    fssr_reset => fssr_reset,
    fifo_reset => strip_fifo_reset,
    error_reset => strip_error_clear,
    link_reset => strip_serdes_reset,
    dac_reset => strip_dac_reset
  );

  sc_imp : stripsc
  GENERIC MAP ( N => NSENSOR )
  PORT MAP (
    CLK => regional_bcoclk,
    STROBE => DO_SC,
    BUSY => SC_BUSY,
    RAW => STRIP_SC(30),
    BCO => STRIP_BCO_COUNTER(7 DOWNTO 0),
    BCO_SYNC => STRIP_SC(29),
    BCO_ZERO => STRIP_SC(28),
    CHIPID => STRIP_SC(4 DOWNTO 0),
    ADDR => STRIP_SC(9 DOWNTO 5),
    INST => STRIP_SC(12 DOWNTO 10),
    COUNT => SC_COUNT,
    SEL => STRIP_SC(15 DOWNTO 13),
    MASK => STRIP_SC(15+NSENSOR DOWNTO 16),
    BITS_IN => SCI_BITS,
    BITS_OUT => SCO_BITS,
    SHIFT => sc_shift,
    SCIN => sc_scin,
    SCOUT => sc_scout
  );

  mclka <= dcm_mclk_a;
  mclkb <= dcm_mclk_b;
  shift <= sc_shift;
  scin <= sc_scin;
  sc_scout <= scout;
  strip_reset <= fssr_reset;

										  G : FOR I IN 0 TO NSENSOR-1 GENERATE

											 BCOCLK(I) <= DCM_BCOCLK;

											 bufgmux_imp : BUFGMUX
											 port map (
												o => strip_mclk(i),
												i0 => DCM_MCLK_A,
												i1 => DCM_MCLK_B,
												s => strip_trim_csr(8+i)
											 );

											 chipserdes4_imp : chipserdes
											 GENERIC MAP (
												CHIPID => 5,
												CHANNEL => I,
												IOBDELAY_VALUE => iobdelay(I,5)
											 )
											 PORT MAP (
												RESET => STRIP_SERDES_RESET(I),
												ENABLE => SENSOR_ENABLE(I),
												MCLK => strip_mclk(i),
												DIN => OUT1_4(I),
												SERDES_INPUT => STRIP_SERDES_INPUT(I,5),
												OUTCLK => DCM_OUTCLK,
												DOUT => STRIP_DATA_ARRAY(I,5),
												SYNC_VALID => STRIP_SYNC_VALID(I)(5),
												DATA_VALID => STRIP_DATA_VALID(I)(5),
												ACK => STRIP_DATA_ACK(I)(5),
												DLYCE => DLY_ENABLE(I)(5),
												DLYRST => DLY_RESET(I)(5),
												DLYINC => strip_trim_csr(28),
												STATUS => STRIP_STATUS_ARRAY(I,5)
											 );
											 chipserdes3_imp : chipserdes
											 GENERIC MAP (
												CHIPID => 4,
												CHANNEL => I,
												IOBDELAY_VALUE => iobdelay(I,4)
											 )
											 PORT MAP (
												RESET => STRIP_SERDES_RESET(I),
												ENABLE => SENSOR_ENABLE(I),
												MCLK => strip_mclk(i),
												DIN => OUT1_3(I),
												SERDES_INPUT => STRIP_SERDES_INPUT(I,4),
												OUTCLK => DCM_OUTCLK,
												DOUT => STRIP_DATA_ARRAY(I,4),
												SYNC_VALID => STRIP_SYNC_VALID(I)(4),
												DATA_VALID => STRIP_DATA_VALID(I)(4),
												ACK => STRIP_DATA_ACK(I)(4),
												DLYCE => DLY_ENABLE(I)(4),
												DLYRST => DLY_RESET(I)(4),
												DLYINC => strip_trim_csr(28),
												STATUS => STRIP_STATUS_ARRAY(I,4)
											 );
											 chipserdes2_imp : chipserdes
											 GENERIC MAP (
												CHIPID => 3,
												CHANNEL => I,
												IOBDELAY_VALUE => iobdelay(I,3)
											 )
											 PORT MAP (
												RESET => STRIP_SERDES_RESET(I),
												ENABLE => SENSOR_ENABLE(I),
												MCLK => strip_mclk(i),
												DIN => OUT1_2(I),
												SERDES_INPUT => STRIP_SERDES_INPUT(I,3),
												OUTCLK => DCM_OUTCLK,
												DOUT => STRIP_DATA_ARRAY(I,3),
												DATA_VALID => STRIP_DATA_VALID(I)(3),
												SYNC_VALID => STRIP_SYNC_VALID(I)(3),
												ACK => STRIP_DATA_ACK(I)(3),
												DLYCE => DLY_ENABLE(I)(3),
												DLYRST => DLY_RESET(I)(3),
												DLYINC => strip_trim_csr(28),
												STATUS => STRIP_STATUS_ARRAY(I,3)
											 );
											 chipserdes1_imp : chipserdes
											 GENERIC MAP (
												CHIPID => 2,
												CHANNEL => I,
												IOBDELAY_VALUE => iobdelay(I,2)
											 )
											 PORT MAP (
												RESET => STRIP_SERDES_RESET(I),
												ENABLE => SENSOR_ENABLE(I),
												MCLK => strip_mclk(i),
												DIN => OUT1_1(I),
												SERDES_INPUT => STRIP_SERDES_INPUT(I,2),
												OUTCLK => DCM_OUTCLK,
												DOUT => STRIP_DATA_ARRAY(I,2),
												DATA_VALID => STRIP_DATA_VALID(I)(2),
												SYNC_VALID => STRIP_SYNC_VALID(I)(2),
												ACK => STRIP_DATA_ACK(I)(2),
												DLYCE => DLY_ENABLE(I)(2),
												DLYRST => DLY_RESET(I)(2),
												DLYINC => strip_trim_csr(28),
												STATUS => STRIP_STATUS_ARRAY(I,2)
											 );
											 chipserdes0_imp : chipserdes
											 GENERIC MAP (
												CHIPID => 1,
												CHANNEL => I,
												IOBDELAY_VALUE => iobdelay(I,1)
											 )
											 PORT MAP (
												RESET => STRIP_SERDES_RESET(I),
												ENABLE => SENSOR_ENABLE(I),
												MCLK => strip_mclk(i),
												DIN => OUT1_0(I),
												SERDES_INPUT => STRIP_SERDES_INPUT(I,1),
												OUTCLK => DCM_OUTCLK,
												DOUT => STRIP_DATA_ARRAY(I,1),
												DATA_VALID => STRIP_DATA_VALID(I)(1),
												SYNC_VALID => STRIP_SYNC_VALID(I)(1),
												ACK => STRIP_DATA_ACK(I)(1),
												DLYCE => DLY_ENABLE(I)(1),
												DLYRST => DLY_RESET(I)(1),
												DLYINC => strip_trim_csr(28),
												STATUS => STRIP_STATUS_ARRAY(I,1)
											 );

											 strip_fifo_imp : stripfifo
											 PORT MAP (
												CLK => DCM_MCLK_A,
												RESET => STRIP_FIFO_RESET(I),
												DIN1 => STRIP_DATA_ARRAY(I,1),
												DIN2 => STRIP_DATA_ARRAY(I,2),
												DIN3 => STRIP_DATA_ARRAY(I,3),
												DIN4 => STRIP_DATA_ARRAY(I,4),
												DIN5 => STRIP_DATA_ARRAY(I,5),
												DATA_VALID => STRIP_DATA_VALID(I),
												ACK => STRIP_DATA_ACK(I),
												SPY_DATA => STRIP_SPY_DATA(I),
												SPY_DATA_VALID => STRIP_SPY_DATA_VALID(I),
												RDCLK => DCM_MCLK_A,
												FIFO_EMPTY => STRIP_FIFO_EMPTY(I),
												DOUT => STRIP_FIFO_DATA(I),
												TOKEN_IN => TOKEN(I),
												TOKEN_OUT => TOKEN(I+1),
												DOUT_VALID => STRIP_FIFO_DATA_VALID(I),
												TRIG_ENABLE => STRIP_CSR(23),       -- VETO_ENABLE: when set, events can be vetoed by trigger
												TRIG_CLK => TRIG_CLK(I),
												TRIG_ADDR => TRIG_ADDR(I),
												TRIG_DATA => TRIG_DATA(I)
											 );

											 trigbuf_imp : trigbuf
											 PORT MAP (
												CLKA => dcm_bcoclk,   -- Check this...  it should probably be DCM_BCOCLK.
												WEA => TRIGGER_DPRAM_WE,
												ADDRA => TRIG_DPRAM_ADDR,
												DINA => TRIG_OUTPUTS,
												CLKB => DCM_MCLK_A,
												ADDRB => TRIG_ADDR(I),
												DOUTB => TRIG_DATA(I)
											 );

										  END GENERATE;

  trigprim0_imp : trigprim
  generic map (
    datatype => x"f8"
  )
  port map (
    reset => strip_fifo_reset(0),    -- change this...  this needs its own reset signal
    trig_input => (others => '0'),--hitor_input(1 downto 0),
    enable_input => (others => '0'),--trig_enable_0,
    fbcoclk => fracbcoclk,
    bcoclk => regional_bcoclk,
    bco => strip_bco_counter(7 downto 0),
    fbco => fracbco,
    bco_trim => strip_trig_input_0(27 downto 24),
    fbco_trim_0 => strip_trig_input_0(19 downto 16),
    fbco_trim_1 => strip_trig_input_0(23 downto 20),
    trig_mask_0 => strip_trig_input_0(7 downto 0),
    trig_mask_1 => strip_trig_input_0(15 downto 8),
    trig_output => trig_outputs(0),
    send_trig => strip_csr(24),      -- send_trig: send trigger primitive data
    spy_data => spy_trigprim_data(0),
    spy_data_valid => spy_trigprim_data_valid(0),
    rdclk => dcm_mclk_a,
    fifo_empty => trig_fifo_empty(0),
    dout => trig_fifo_data(0),
    token_in => '0',--token(nsensor),
    token_out => token(nsensor+1),
    dout_valid => trig_fifo_data_valid(0)
  );

  trigprim1_imp : trigprim
  generic map (
    datatype => x"e8"
  )
  port map (
    reset => strip_fifo_reset(0),    -- change this...  this needs its own reset signal
    trig_input => (others => '0'),--hitor_input(3 downto 2),
    enable_input => (others => '0'),--trig_enable_1,
    fbcoclk => fracbcoclk,
    bcoclk => regional_bcoclk,
    bco => strip_bco_counter(7 downto 0),
    fbco => fracbco,
    bco_trim => strip_trig_input_1(27 downto 24),
    fbco_trim_0 => strip_trig_input_1(19 downto 16),
    fbco_trim_1 => strip_trig_input_1(23 downto 20),
    trig_mask_0 => strip_trig_input_1(7 downto 0),
    trig_mask_1 => strip_trig_input_1(15 downto 8),
    trig_output => trig_outputs(1),
    send_trig => strip_csr(24),      -- send_trig: send trigger primitive data
    spy_data => spy_trigprim_data(1),
    spy_data_valid => spy_trigprim_data_valid(1),
    rdclk => dcm_mclk_a,
    fifo_empty => trig_fifo_empty(1),
    dout => trig_fifo_data(1),
    token_in => token(nsensor+1),
    token_out => token(nsensor+2),
    dout_valid => trig_fifo_data_valid(1)
  );

  trigprim2_imp : trigprim
  generic map (
    datatype => x"d8"
  )
  port map (
    reset => strip_fifo_reset(0),    -- change this...  this needs its own reset signal
    trig_input => (others => '0'),--hitor_input(5 downto 4),
    enable_input => (others => '0'),--trig_enable_2,
    fbcoclk => fracbcoclk,
    bcoclk => regional_bcoclk,
    bco => strip_bco_counter(7 downto 0),
    fbco => fracbco,
    bco_trim => strip_trig_input_2(27 downto 24),
    fbco_trim_0 => strip_trig_input_2(19 downto 16),
    fbco_trim_1 => strip_trig_input_2(23 downto 20),
    trig_mask_0 => strip_trig_input_2(7 downto 0),
    trig_mask_1 => strip_trig_input_2(15 downto 8),
    trig_output => trig_outputs(2),
    send_trig => strip_csr(24),      -- send_trig: send trigger primitive data
    spy_data => spy_trigprim_data(2),
    spy_data_valid => spy_trigprim_data_valid(2),
    rdclk => dcm_mclk_a,
    fifo_empty => trig_fifo_empty(2),
    dout => trig_fifo_data(2),
    token_in => token(nsensor+2),
    token_out => token(nsensor+3),
    dout_valid => trig_fifo_data_valid(2)
  );

  trigprim3_imp : trigprim
  GENERIC MAP (
    datatype => x"c8"
  )
  port map (
    reset => strip_fifo_reset(0),    -- change this...  this needs its own reset signal
    trig_input => (others => '0'),--ext_unbiased,
    enable_input => (others => '0'),--trig_enable_3,
    fbcoclk => fracbcoclk,
    bcoclk => regional_bcoclk,
    bco => strip_bco_counter(7 downto 0),
    fbco => fracbco,
    bco_trim => strip_trig_input_3(27 downto 24),
    fbco_trim_0 => strip_trig_input_3(19 downto 16),
    fbco_trim_1 => strip_trig_input_3(23 downto 20),
    trig_mask_0 => strip_trig_input_3(7 downto 0),
    trig_mask_1 => strip_trig_input_3(15 downto 8),
    trig_output => trig_outputs(3),
    send_trig => strip_csr(24),      -- send_trig: send trigger primitive data
    spy_data => spy_trigprim_data(3),
    spy_data_valid => spy_trigprim_data_valid(3),
    rdclk => dcm_mclk_a,
    fifo_empty => trig_fifo_empty(3),
    dout => trig_fifo_data(3),
    token_in => token(nsensor+3),
    token_out => token(nsensor+4),
    dout_valid => trig_fifo_data_valid(3)
  );

  trigproc_imp : trigproc
  PORT MAP (
    RESET => STRIP_FIFO_RESET(0),  -- Again, we really should have a dedicated reset for all the fifo's
    FBCOCLK => FRACBCOCLK,
    BCOCLK => DCM_BCOCLK,
    BCO => STRIP_BCO_COUNTER(7 DOWNTO 0),
    FBCO => FRACBCO,
	 ext_trig => latched_trig,
    TRIG_INPUT => TRIG_OUTPUTS,
    BCO_OFFSET => STRIP_TRIG_CSR(3 DOWNTO 0),
    TRIGGER_NUMBER => STRIP_TRIGGER_NUMBER,    -- 40-bit trigger counter
    CLEAR => STRIP_CSR(21),        -- TRIGNUM_CLEAR: resets trigger number to zero
    SEND_TRIGNUM => STRIP_CSR(25),  -- SEND_TRIGNUM: send trigger numbers in output stream
    ADDR => TRIG_DPRAM_ADDR,
    SPY_DATA => SPY_TRIGPROC_DATA,
    SPY_DATA_VALID => SPY_TRIGPROC_DATA_VALID,
    RDCLK => DCM_MCLK_A,
    FIFO_EMPTY => TRIGNUM_FIFO_EMPTY,
    DOUT => TRIGNUM_FIFO_DOUT,
    TOKEN_IN => TOKEN(NSENSOR+4),
    TOKEN_OUT => TOKEN(NSENSOR+5),
    DOUT_VALID => TRIGNUM_FIFO_DATA_VALID
  );

							  striptbm_imp : striptbm
							  PORT MAP (
								 CLK => DCM_MCLK_A,
								 RESET => STRIP_FIFO_RESET(0),    -- change this...
								 DATA_AVAILABLE => STRIP_DATA_AVAILABLE,
								 SEND_BCO => STRIP_CSR(26),   -- SEND_BCO: send bunch counter in data stream
								 BCO => STRIP_BCO_COUNTER,
								 BCO_COUNT => strip_daq_param(7 downto 0),
								 DOUT => TBM_STATUS_DATA,
								 DATA_VALID => TBM_STATUS_DATA_VALID,
								 TOKEN_IN => token(nsensor),--TOKEN(1),--TOKEN(NSENSOR+5),
								 TOKEN_OUT => TOKEN(0),
								 OOPS => TBM_OOPS
						);

  stripana_imp : stripana
  PORT MAP (
    CLEAR => STRIP_ANA_CSR(30),
    DONE => STRIP_ANA_DONE,
    STRIP => STRIP_ANA_CSR(3 DOWNTO 0),
    SET => STRIP_ANA_CSR(8 DOWNTO 4),
    ADC => STRIP_ANA_CSR(22 DOWNTO 20),
    TCBIT => STRIP_ANA_CSR(15 DOWNTO 11),
    CLK => DCM_MCLK_A,
    BCOCLK => DCM_BCOCLK,
    DIN => STRIP_ANA_DIN,
    WRITE_ENABLE => STRIP_ANA_WE,
    BCO_COUNTER => STRIP_ANA_BCO,
    NHIT1 => STRIP_ANA_NHIT1,
    NHIT2 => STRIP_ANA_NHIT2,
    NHIT3 => STRIP_ANA_NHIT3,
    NHIT4 => STRIP_ANA_NHIT4,
    NHIT5 => STRIP_ANA_NHIT5
  );

  stripstream_imp : stripstream
  GENERIC MAP ( N => NSENSOR )
  PORT MAP (
    RESET => STRIP_FIFO_RESET(0),    -- change this...
    ENABLE => STRIP_CSR(27),         -- STREAM_ENABLE: send hit data
    FLUSH => STRIP_CSR(20),          -- FLUSH: flush buffers
    PACKET_SIZE => STRIP_CSR(7 DOWNTO 3),
    IDLE_COUNT => STRIP_CSR(15 DOWNTO 14),
    CLK => DCM_MCLK_A,
    DIN => TBM_DATA,
    WRITE_ENABLE => TBM_DATA_VALID,
    STATUS => STREAM_STATUS,
    WORDS_DUMPED => STREAM_WORDS_DUMPED,
    STREAM_RCLK => STREAM_RCLK,
    STREAM_READ_ENABLE => STREAM_READ_ENABLE,
    STREAM_DOUT => STREAM_DOUT,
    STREAM_LENGTH => STREAM_LENGTH,
    STREAM_CKSUM => STREAM_CKSUM,
    STREAM_STROBE => STREAM_SENDPKT,
    STREAM_READY => STREAM_READY
  );

--									  spy_fifo_a_imp : chip_fifo
--									  port map (
--										 rst => spy_fifo_csr(31),
--										 wr_clk => dcm_mclk_a,
--										 rd_clk => clk,
--										 din => spy_fifo_a_input,
--										 wr_en => spy_fifo_a_we,
--										 rd_en => spy_fifo_a_addressed,
--										 full => spy_fifo_a_full,
--										 empty => spy_fifo_a_empty,
--										 dout => spy_fifo_a_output
--									  );
--									  spy_fifo_b_imp : chip_fifo
--									  port map (
--										 rst => spy_fifo_csr(31),
--										 wr_clk => regional_bcoclk,
--										 rd_clk => clk,
--										 din => spy_fifo_b_input,
--										 wr_en => spy_fifo_b_we,
--										 rd_en => spy_fifo_b_addressed,
--										 full => spy_fifo_b_full,
--										 empty => spy_fifo_b_empty,
--										 dout => spy_fifo_b_output
--									  );
--									  spy_fifo_c_imp : chip_fifo
--									  port map (
--										 rst => spy_fifo_csr(31),
--										 wr_clk => fracbcoclk,
--										 rd_clk => clk,
--										 din => spy_fifo_c_input,
--										 wr_en => spy_fifo_c_we,
--										 rd_en => spy_fifo_c_addressed,
--										 full => spy_fifo_c_full,
--										 empty => spy_fifo_c_empty,
--										 dout => spy_fifo_c_output
--									  );

  process ( clk )
    variable chip_index : integer range 0 to 5;
    variable chan_index : integer range 0 to nsensor-1;
  begin
    if ( clk'event and clk = '1' ) then
	 
      something_busy <= sc_busy; --RAR
		
      if ( do_reset /= x"00" and reset_busy = '1' ) then
        do_reset <= ( others => '0' );
      end if;
      if ( bus_do_sc = '1' and sc_busy = '1' ) then
        bus_do_sc <= '0';
      end if;
      if ( do_spi = '1' and spi_busy = '1' ) then
        do_spi <= '0';
      end if;
      if ( do_trim = '1' and trim_busy = '1' ) then
        do_trim <= '0';
      end if;
      if ( do_dac = '1' and dac_busy = '1' ) then
        do_dac <= '0';
      end if;
      if ( do_bco_reset = '1' and bco_reset_busy = '1' ) then
        do_bco_reset <= '0';
      end if;
      if ( arm_bco_reset = '1' and bco_reset_busy = '1' ) then
        arm_bco_reset <= '0';
      end if;
      if ( iobus.io_addr_strobe = '1' and masked_address = base_address ) then
        iobus_ready <= '1';

        if ( iobus.io_write_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_strip_csr =>
              strip_csr <= iobus.io_write_data;
              arm_bco_reset <= iobus.io_write_data(19);
              do_bco_reset <= iobus.io_write_data(22);
            when address_strip_trig_csr => 
              strip_trig_csr <= iobus.io_write_data;
            when address_strip_trig_input_0 =>
              strip_trig_input_0 <= iobus.io_write_data;
            when address_strip_trig_input_1 =>
              strip_trig_input_1 <= iobus.io_write_data;
            when address_strip_trig_input_2 =>
              strip_trig_input_2 <= iobus.io_write_data;
            when address_strip_trig_input_3 =>
              strip_trig_input_3 <= iobus.io_write_data;
            when address_strip_trig_unbiased =>
              strip_trig_unbiased <= iobus.io_write_data;
            when address_strip_reset =>
              reset_mask <= iobus.io_write_data(nsensor-1 downto 0);
              if ( reset_busy = '0' ) then
                do_reset <= iobus.io_write_data(31 downto 24);
              end if;
            when address_strip_sc =>
              bus_strip_sc <= iobus.io_write_data;
              if ( sc_busy = '0' ) then
                bus_do_sc <= '1';
              end if;
            when address_strip_dac_csr =>
              strip_dac_csr <= iobus.io_write_data;
              if ( dac_busy = '0' ) then
                do_dac <= iobus.io_write_data(31);
              end if;
            when address_strip_dac_spi =>
              strip_dac_spi <= iobus.io_write_data;
              if ( spi_busy = '0' ) then
                do_spi <= iobus.io_write_data(31);
              end if;
            when address_strip_dac_value => 
              strip_dac_value <= iobus.io_write_data;
            when address_spy_fifo_csr => 
              spy_fifo_csr <= iobus.io_write_data;
--            when address_strip_trig_fifo =>   
--              if ( strip_trig_csr(7 downto 4) = "0100" ) then      
--                spy_trigproc_read_enable <= '1';
--              else
--                spy_trigproc_read_enable <= '0';
--              end if;
            when address_strip_trim_csr =>
              strip_trim_csr <= iobus.io_write_data;
              if ( trim_busy = '0' ) then
                do_trim <= iobus.io_write_data(31);
              end if;
            when address_strip_ana_csr => 
              strip_ana_csr <= iobus.io_write_data;
            when address_strip_sci0 => 
              sci_bits(31 downto 0) <= iobus.io_write_data;
            when address_strip_sci1 => 
              sci_bits(63 downto 32) <= iobus.io_write_data;
            when address_strip_sci2 => 
              sci_bits(95 downto 64) <= iobus.io_write_data;
            when address_strip_sci3 => 
              sci_bits(127 downto 96) <= iobus.io_write_data;
            when address_strip_bco_dcm =>
              bcoclk_data <= iobus.io_write_data;
              bcoclk_data_we <= iobus.io_write_data(31);
              bcoclk_den <= '1';
            when address_daq_param => 
              strip_daq_param <= iobus.io_write_data;
            when address_strip_debug_monitor =>
              debug_monitor <= iobus.io_write_data;
            when others =>

          end case;
        end if;

        if ( iobus.io_read_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_strip_csr =>
              write_data <= strip_csr(31) & strip_clk_locked & strip_csr(28 downto 23) &
                            bco_reset_busy & strip_csr(21 downto 20) &
                            bco_reset_armed & strip_csr(18 downto 3) &
                            std_logic_vector(to_unsigned(nsensor,3));
            when address_strip_reset =>
              write_data <= reset_status & std_logic_vector(to_unsigned(0,24-nsensor)) & reset_mask;
            when address_strip_sc =>
              write_data <= sc_working & strip_sc(30 downto 0);
            when address_strip_sci0 =>
              write_data <= sci_bits(31 downto 0);
            when address_strip_sci1 =>
              write_data <= sci_bits(63 downto 32);
            when address_strip_sci2 =>
              write_data <= sci_bits(95 downto 64);
            when address_strip_sci3 =>
              write_data <= sci_bits(127 downto 96);
            when address_strip_sco0 =>
              write_data <= sco_bits(31 downto 0);
            when address_strip_sco1 =>
              write_data <= sco_bits(63 downto 32);
            when address_strip_sco2 =>
              write_data <= sco_bits(95 downto 64);
            when address_strip_sco3 =>
              write_data <= sco_bits(127 downto 96);
            when address_strip_bco_counter_low =>
              write_data <= strip_bco_counter(31 downto 0);
            when address_strip_bco_counter_high =>
              write_data <= x"0000" & strip_bco_counter(47 downto 32);
            when address_strip_bco_dcm =>
              write_data <= bcoclk_busy & std_logic_vector(to_unsigned(0,15)) & bcoclk_data_out;
            when address_strip_dac_csr =>
              write_data <= dac_doing_stuff_bit & strip_dac_csr(30 downto 0);
            when address_strip_dac_value =>
              write_data <= strip_dac_value;
            when address_strip_dac_spi =>
              write_data <= spi_doing_stuff_bit & strip_dac_spi(30 downto 8) & strip_dac_data;
            when address_spy_fifo_csr =>
              write_data <= spy_fifo_csr(31 downto 24) & spy_fifo_c_output(35 downto 32) &
                            spy_fifo_b_output(35 downto 32) & spy_fifo_a_output(35 downto 32) &
                            "00" & spy_fifo_c_full & spy_fifo_c_empty &
                            spy_fifo_b_full & spy_fifo_b_empty & spy_fifo_a_full & spy_fifo_a_empty &
                            spy_fifo_csr(3 downto 0);
            when address_spy_fifo_data =>
              if ( spy_channel = 12 ) then
                write_data <= spy_fifo_c_output(31 downto 0);
                spy_fifo_c_addressed <= '1';
              elsif ( spy_channel > 7 and spy_channel < 12 ) then
                write_data <= spy_fifo_b_output(31 downto 0);
                spy_fifo_b_addressed <= '1';
              else
                write_data <= spy_fifo_a_output(31 downto 0);
                spy_fifo_a_addressed <= '1';
              end if;
            when address_strip_streamer =>
              write_data <= stream_status;
            when address_strip_words_dumped =>
              write_data <= stream_words_dumped;
            when address_strip_ana_csr =>
              write_data <= strip_ana_done & strip_ana_csr(30 downto 0);
            when address_strip_ana_bco_counter =>
              write_data <= strip_ana_bco;
            when address_strip_ana_hit1_counter =>
              write_data <= strip_ana_nhit1;
            when address_strip_ana_hit2_counter =>
              write_data <= strip_ana_nhit2;
            when address_strip_ana_hit3_counter =>
              write_data <= strip_ana_nhit3;
            when address_strip_ana_hit4_counter =>
              write_data <= strip_ana_nhit4;
            when address_strip_ana_hit5_counter =>
              write_data <= strip_ana_nhit5;
            when address_strip_trim_csr =>
              write_data <= trim_busy & strip_trim_csr(30 downto 24) & "00" &
                            std_logic_vector(trim_count) & strip_trim_csr(15 downto 0);
            when address_strip_trig_csr =>
              write_data <= trig_outputs & strip_trig_csr(27 downto 0);
            when address_strip_trig_input_0 =>
              write_data <= strip_trig_input_0;
            when address_strip_trig_input_1 =>
              write_data <= strip_trig_input_1;
            when address_strip_trig_input_2 =>
              write_data <= strip_trig_input_2;
            when address_strip_trig_input_3 =>
              write_data <= strip_trig_input_3;
--            when address_strip_trig_fifo =>
--              write_data <= spy_trig_fifo_data;
--              if ( strip_trig_csr(7 downto 4) = "0000" ) then
--                spy_trigprim_read_enable(0) <= '1';
--              elsif ( strip_trig_csr(7 downto 4) = "0001" ) then
--                spy_trigprim_read_enable(1) <= '1';
--              elsif ( strip_trig_csr(7 downto 4) = "0010" ) then
--                spy_trigprim_read_enable(2) <= '1';
--              elsif ( strip_trig_csr(7 downto 4) = "0011" ) then
--                spy_trigprim_read_enable(3) <= '1';
--              else
--                spy_trigprim_read_enable(0) <= '0';
--              end if;
            when address_strip_trig_unbiased =>
              write_data <= strip_trig_unbiased;
            when address_strip_trignum_low =>
              write_data <= strip_trigger_number(31 downto 0);
            when address_strip_trignum_high =>
              write_data <= x"000000" & strip_trigger_number(39 downto 32);
            when address_strip_debug_monitor =>
              write_data <= debug_monitor;
            when address_cmd_counter => 
              write_data <= cmd_counter;
            when address_trig_counter => 
              write_data <= trig_counter;
            when address_bco_freq => 
              write_data <= bcoclk_freq;
            when address_daq_param => 
              write_data <= strip_daq_param;
            when others =>
              if ( iobus.io_address(15 downto 8) /= x"00" and
                   iobus.io_address(7 downto 0) = address_strip_status(7 downto 0) ) then
                chip_index := to_integer(unsigned(iobus.io_address(10 downto 8)));
                chan_index := to_integer(unsigned(iobus.io_address(14 downto 12)));
                write_data <= strip_status_array(chan_index,chip_index);
              else
                write_data <= ( others => '0' );
              end if;
          end case;

        end if;
      else
        iobus_ready <= '0';
        bcoclk_data_we <= '0';
        bcoclk_den <= '0';
        spy_fifo_a_addressed <= '0';
        spy_fifo_b_addressed <= '0';
        spy_fifo_c_addressed <= '0';
        if ( ext_halt = '1' ) then
          strip_csr(17) <= '1';
        elsif ( ext_start = '1' ) then
          strip_csr(17) <= '0';
        end if;
      end if;
    end if;
  end process;

--
--  The following two processes provide a way to measure
--  the actual BCO clock frequency, given that the bus
--  clock has a period of 15 ns.
--

-- RAR clk is master clock now and clkx is 15MHz
  process ( clkx ) begin
    if ( clkx'event and clkx = '1' ) then
      if ( busclk_count = x"03f940ab" ) then
        latch_count <= '1';
        please_count <= '0';
        clear_count <= '0';
        busclk_count <= busclk_count + 1;
      elsif ( busclk_count(31 downto 20) = x"040" ) then
        latch_count <= '0';
        please_count <= '0';
        clear_count <= '0';
        busclk_count <= busclk_count + 1;
      elsif ( busclk_count(31 downto 20) = x"041" ) then
        latch_count <= '0';
        please_count <= '0';
        clear_count <= '1';
        busclk_count <= busclk_count + 1;
      elsif ( busclk_count(31 downto 20) = x"042" ) then
        latch_count <= '0';
        clear_count <= '0';
        please_count <= '1';
        busclk_count <= ( others => '0' );
      else
        latch_count <= '0';
        clear_count <= '0';
        please_count <= '1';
        busclk_count <= busclk_count + 1;
      end if;
    end if;
  end process;
  process ( regional_bcoclk ) begin
    if ( regional_bcoclk'event and regional_bcoclk = '1' ) then
      if ( latch_count = '1' ) then
        bcoclk_freq <= std_logic_vector(bcoclk_count);
      elsif ( clear_count = '1' ) then
        bcoclk_count <= ( others => '0' );
      elsif ( please_count = '1' ) then
        bcoclk_count <= bcoclk_count + 1;
      end if;
    end if;
  end process;

--	--RAR
--	process (strip_trim_csr) begin
--		 for i in 0 to nsensor-1 loop
--			  dly_enable(i) <= strip_trim_csr(i*8+4 downto i*8);
--		 end loop;
--	end process;

  process ( dcm_outclk, do_trim ) begin
    if ( dcm_outclk'event and dcm_outclk = '1' ) then
      if ( trim_busy = '0' ) then
        if ( do_trim = '1' ) then
          trim_busy <= '1';
          for i in 0 to nsensor-1 loop
            if ( i = to_integer(unsigned(strip_trim_csr(2 downto 0))) ) then
              if ( strip_trim_csr(30) = '0' ) then
                dly_enable(i) <= strip_trim_csr(7 downto 3);
                dly_reset(i) <= ( others => '0' );
                if ( strip_trim_csr(28) = '0' ) then
                  trim_count <= trim_count - 1;
                else
                  trim_count <= trim_count + 1;
                end if;
              else
                dly_reset(i) <= strip_trim_csr(7 downto 3);
                dly_enable(i) <= ( others => '0' );
                trim_count <= "000000";
              end if;
            else
              dly_reset(i) <= ( others => '0' );
              dly_enable(i) <= ( others => '0' );
            end if;
          end loop;
        end if;
      else
        for i in 0 to nsensor-1 loop
          dly_reset(i) <= ( others => '0' );
          dly_enable(i) <= ( others => '0' );
        end loop;
        trim_busy <= do_trim;
      end if;
    end if;
  end process;

  process ( ext_clk, ext_trig, ext_start, ext_halt ) begin
    if ( ext_clk'event and ext_clk = '1' ) then
      if ( ext_start = '1' and latched_start = '0' ) then
        start_count <= start_count + 1;
      end if;
      if ( ext_halt = '1' and latched_halt = '0' ) then
        halt_count <= halt_count + 1;
      end if;
      if ( ext_trig = '1' and latched_trig = '0' ) then
        trig_count <= trig_count + 1;
      end if;
      latched_halt <= ext_halt;
      latched_start <= ext_start;
      latched_trig <= ext_trig;
    end if;
  end process;

  process ( regional_bcoclk, bco_reset_busy ) begin
    if ( regional_bcoclk'event and regional_bcoclk = '1' ) then
      case bco_reset_state is
        when Idle =>
          automatic_scr_set <= '0';
          automatic_scr_strobe <= '0';
          if ( bco_reset_busy = '1' ) then
            bco_reset_state <= Resetting;
          end if;
        when Resetting =>
          if ( bco_reset_busy = '0' ) then
            bco_reset_state <= Pause1;
          end if;
        when Pause1 =>
          bco_reset_state <= Pause2;
        when Pause2 =>
          bco_reset_state <= Pause3;
        when Pause3 =>
          automatic_scr_set <= '1';
          bco_reset_state <= Pause4;
        when Pause4 =>
          automatic_scr_strobe <= '1';
          bco_reset_state <= DoingScrSet;
        when DoingScrSet =>
          if ( sc_busy = '1' ) then
            bco_reset_state <= Done;
          end if;
        when Done =>
          automatic_scr_strobe <= '0';
          if ( sc_busy = '0' ) then
            automatic_scr_set <= '0';
            bco_reset_state <= Idle;
          end if;
      end case;
    end if;
  end process;

  PROCESS ( STRIP_FIFO_DATA_VALID, STRIP_FIFO_EMPTY, TBM_STATUS_DATA_VALID,
            TBM_STATUS_DATA, STRIP_FIFO_DATA )
    VARIABLE DV : STD_LOGIC;
    VARIABLE DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE AVAILABLE : STD_LOGIC;
  BEGIN
    DV := '0';
    DATA := X"F9F9F9F9";
    AVAILABLE := '0';
    IF ( TBM_STATUS_DATA_VALID = '1' ) THEN
      DATA := TBM_STATUS_DATA;
      DV := '1';
    ELSE
      FOR I IN 0 TO NSENSOR-1 LOOP
        IF ( STRIP_FIFO_DATA_VALID(I) = '1' ) THEN
          DATA := STRIP_FIFO_DATA(I);
          DV := '1';
        END IF;
        IF ( STRIP_FIFO_EMPTY(I) = '0' ) THEN
          AVAILABLE := '1';
        END IF;
        
      END LOOP;

      FOR I IN 0 TO 3 LOOP
        IF ( TRIG_FIFO_DATA_VALID(I) = '1' ) THEN
          DATA := TRIG_FIFO_DATA(I);
          DV := '1';
        END IF;
        IF ( TRIG_FIFO_EMPTY(I) = '0' ) THEN
          AVAILABLE := '1';
        END IF;
      END LOOP;

      IF ( TRIGNUM_FIFO_DATA_VALID = '1' ) THEN
        DATA := TRIGNUM_FIFO_DOUT;
        DV := '1';
      END IF;
      IF ( TRIGNUM_FIFO_EMPTY = '0' ) THEN
        AVAILABLE := '1';
      END IF;

    END IF;
    TBM_DATA <= DATA;
    TBM_DATA_VALID <= DV;
    STRIP_DATA_AVAILABLE <= AVAILABLE;
  END PROCESS;

  HITOR_INPUT(NSENSOR-1 DOWNTO 0) <= HITOR;

    -- RAR edit: add extra delay to help meet timing (especially when chipscope is added)
  extra_bdata_reg_proc : process(DCM_MCLK_A)
  begin
    if rising_edge(DCM_MCLK_A) then
        SERDES_DATA <= TBM_DATA;         
        SERDES_DATA_WE <= TBM_DATA_VALID;        
    end if;
  end process;
  
  --RAR SERDES_DATA <= TBM_DATA;
  --RAR SERDES_DATA_WE <= TBM_DATA_VALID;

  BCO_ZERO <= '1' WHEN STRIP_BCO_COUNTER(7 DOWNTO 0) = X"00" ELSE '0';

--  The format of the STRIP_TRIG_UNBIASED word is as follows:
--     |-fff|mmmm mmmm mmmm|bbbb bbbb|wwww|iiii|
--  So when set to the pattern 0002805c it will match BCO counters that
--  look like 16c200080
--            16e200080
--            170200080
--            ...
--            186200080
--  etc...

  MATCH_BCO_BIT <= TO_INTEGER(UNSIGNED(STRIP_TRIG_UNBIASED(3 DOWNTO 0)));
  MATCH_BCO_WIDTH <= TO_INTEGER(UNSIGNED(STRIP_TRIG_UNBIASED(7 DOWNTO 4)));
  MATCH_BCO_MASK <= STD_LOGIC_VECTOR(TO_UNSIGNED((2**MATCH_BCO_WIDTH)-1,32)) WHEN MATCH_BCO_WIDTH /= 0 ELSE X"00000000";
  MATCH_ZERO_MASK <= STD_LOGIC_VECTOR(TO_UNSIGNED((2**MATCH_BCO_BIT)-1,32)) WHEN MATCH_BCO_BIT /= 0 ELSE X"00000000";
  MATCH_BCO <= STD_LOGIC_VECTOR(SHIFT_RIGHT(UNSIGNED(STRIP_BCO_COUNTER(39 DOWNTO 8)),MATCH_BCO_BIT));
  ZERO_BCO <= STD_LOGIC_VECTOR(UNSIGNED(STRIP_BCO_COUNTER(39 DOWNTO 8)));

  UNBIASED_TRIGGER <= '1' WHEN ( FRACBCO = STRIP_TRIG_UNBIASED(30 DOWNTO 28) ) AND
                          ( STRIP_BCO_COUNTER(7 DOWNTO 0) = STRIP_TRIG_UNBIASED(15 DOWNTO 8) ) AND
                          ( ( MATCH_BCO(11 DOWNTO 0) AND MATCH_BCO_MASK(11 DOWNTO 0) ) = STRIP_TRIG_UNBIASED(27 DOWNTO 16) ) AND
                          ( ( ZERO_BCO AND MATCH_ZERO_MASK ) = X"00000000" ) ELSE '0';
  EXT_UNBIASED <= EXT_TRIG & UNBIASED_TRIGGER;

--  reset_bco_counter <= do_bco_reset or ( bco_reset_armed and ext_trig );

  DAC_DOING_STUFF_BIT <= DAC_BUSY OR DO_DAC;
  SPI_DOING_STUFF_BIT <= SPI_BUSY OR DO_SPI;
  DAC_CLK <= STRIP_DAC_CLK;

  bco_counter_zero <= '1' when strip_bco_counter(7 downto 0) = x"00" else '0';
  monitor_chip <= to_integer(unsigned(debug_monitor(7 downto 4)));
  monitor_channel <= to_integer(unsigned(debug_monitor(2 downto 0)));
  debug_select <= debug_monitor(31);
  strip_debug <= sc_scout(monitor_channel) & sc_scin(monitor_channel) & sc_shift(monitor_channel) &
                 regional_bcoclk & fssr_reset(monitor_channel) &
                 strip_serdes_input(monitor_channel,monitor_chip) & bco_counter_zero &
                 hitor(monitor_channel) when debug_monitor(30) = '0' else debug_reset;
  spy_channel <= to_integer(unsigned(spy_fifo_csr(3 downto 0)));
  spy_fifo_a_input(35 downto 32) <= spy_fifo_csr(3 downto 0);
  spy_fifo_a_input(31 downto 0) <= strip_spy_data(spy_channel) when spy_channel < 6 else
                                   tbm_status_data when spy_channel = 7 else ( others => '0' );
  spy_fifo_a_we <= strip_spy_data_valid(spy_channel) when spy_channel < 6 else
                   tbm_status_data_valid when spy_channel = 7 else '0';

  spy_fifo_b_input(35 downto 32) <= spy_fifo_csr(3 downto 0);
  spy_fifo_b_input(31 downto 0) <= spy_trigprim_data(0) when spy_channel = 8 else
                                   spy_trigprim_data(1) when spy_channel = 9 else
                                   spy_trigprim_data(2) when spy_channel = 10 else
                                   spy_trigprim_data(3) when spy_channel = 11 else
                                   spy_trigproc_data when spy_channel = 12 else
                                   ( others => '0' );
  spy_fifo_b_we <= spy_trigprim_data_valid(0) when spy_channel = 8 else
                   spy_trigprim_data_valid(1) when spy_channel = 9 else
                   spy_trigprim_data_valid(2) when spy_channel = 10 else
                   spy_trigprim_data_valid(3) when spy_channel = 11 else '0';

  spy_fifo_c_input(35 downto 32) <= spy_fifo_csr(3 downto 0);
  spy_fifo_c_input(31 downto 0) <= spy_trigproc_data when spy_channel = 12 else ( others => '0' );
  spy_fifo_c_we <= spy_trigproc_data_valid when spy_channel = 12 else '0';

  data_available <= strip_data_available;
  stream_strobe <= stream_sendpkt;

  DAC_RESET <= STRIP_DAC_RESET;
  DCM_RESET <= STRIP_CSR(31);
  SYNC_ERROR <= TBM_OOPS;

  do_sc <= bus_do_sc or automatic_scr_strobe;
  sc_working <= sc_busy or do_sc;
  strip_sc <= bus_strip_sc when automatic_scr_set = '0' else x"903f0b95";
  sc_count <= strip_sc(7 downto 0) when strip_sc(30) = '1' else
              x"01" when strip_sc(26 downto 24) = "001" else
              x"02" when strip_sc(26 downto 24) = "010" else
              x"08" when strip_sc(26 downto 24) = "011" else
              x"80" when strip_sc(26 downto 24) = "100" else
              x"00";

  masked_address <= iobus.io_address(31 downto 16) and address_mask;

--  Actions on the trigger RAM can be halted by setting a bit in the trigger CSR.
--  This prevents new trigger data from being written and allows the RAM to be read
--  over the bus instead of stripfifo, which dumps data that was not triggered.
  TRIGGER_DPRAM_WE(0) <= NOT STRIP_TRIG_CSR(7);
--


--  G1 : FOR I IN 0 TO NSENSOR-1 GENERATE
--    SPY_FIFO_READ_ENABLE(I) <= '1' WHEN ( SENSOR_FIFO_ADDRESSED = '1' AND I = TO_INTEGER(UNSIGNED(STRIP_FIFO_CSR(18 DOWNTO 16))) ) ELSE '0';
--  END GENERATE;

  G2 : FOR I IN 0 TO 7 GENERATE
    RESET_STATUS(I) <= '1' WHEN RESET_BUSY = '1' AND DO_RESET(I) = '1' ELSE '0';
  END GENERATE;

  SENSOR_ENABLE <= STRIP_CSR(NSENSOR+7 DOWNTO 8) WHEN STRIP_CSR(17) = '0' ELSE
                   ( OTHERS => '0' );

--  READ_SPY_FIFO_CSR <= STRIP_FIFO_CSR(31 DOWNTO 16) &
--                         ( 15 DOWNTO 8+NSENSOR => '0' ) & SPY_FIFO_FULL &
--                         (  7 DOWNTO NSENSOR => '0' ) & SPY_FIFO_EMPTY;
--  READ_SPY_FIFO_DATA <= SPY_FIFO_DATA(TO_INTEGER(UNSIGNED(STRIP_FIFO_CSR(18 DOWNTO 16))));
--  SPY_TRIG_FIFO_DATA <= SPY_TRIGPRIM_FIFO_DATA(0) WHEN STRIP_TRIG_CSR(7 DOWNTO 4) = "0000" ELSE
--                        SPY_TRIGPRIM_FIFO_DATA(1) WHEN STRIP_TRIG_CSR(7 DOWNTO 4) = "0001" ELSE
--                        SPY_TRIGPRIM_FIFO_DATA(2) WHEN STRIP_TRIG_CSR(7 DOWNTO 4) = "0010" ELSE
--                        SPY_TRIGPRIM_FIFO_DATA(3) WHEN STRIP_TRIG_CSR(7 DOWNTO 4) = "0011" ELSE
--                        SPY_TRIGPROC_FIFO_DATA WHEN STRIP_TRIG_CSR(7 DOWNTO 4) = "0100" ELSE ( OTHERS => '0' );

  STRIP_ANA_ICHAN <= TO_INTEGER(UNSIGNED(STRIP_ANA_CSR(18 DOWNTO 16)));
  STRIP_ANA_RESET <= STRIP_FIFO_RESET(STRIP_ANA_ICHAN);
  STRIP_ANA_DIN <= STRIP_SPY_DATA(STRIP_ANA_ICHAN);
  STRIP_ANA_WE <= STRIP_SPY_DATA_VALID(STRIP_ANA_ICHAN);

  trig_enable_0 <= strip_trig_input_0(29 downto 28) when STRIP_CSR(17) = '0' ELSE "00";
  trig_enable_1 <= strip_trig_input_1(29 downto 28) when STRIP_CSR(17) = '0' ELSE "00";
  trig_enable_2 <= strip_trig_input_2(29 downto 28) when STRIP_CSR(17) = '0' ELSE "00";
  trig_enable_3 <= strip_trig_input_3(29 downto 28) when STRIP_CSR(17) = '0' ELSE "00";

  cmd_counter <= std_logic_vector(halt_count) & std_logic_vector(start_count);
  trig_counter <= std_logic_vector(trig_count);

end Behavioral;
