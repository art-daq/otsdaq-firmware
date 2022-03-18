
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    psi
-- Module Name:    psi46_interface - RTL
-- Project Name:   test beam
-- Target Devices: xc4vfx12ff668-10
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
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library stib;
use stib.iobus.ALL;

use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity psi46_interface is
  generic ( nsensor : integer range 1 to 4 := 1 );
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

    pixel_addr0 : in std_logic_vector(nsensor-1 downto 0);
    pixel_addr1 : in std_logic_vector(nsensor-1 downto 0);
    pixel_addr2 : in std_logic_vector(nsensor-1 downto 0);
    pixel_addr3 : in std_logic_vector(nsensor-1 downto 0);
    pixel_clk : out std_logic;
    pixel_reset : out std_logic_vector(nsensor-1 downto 0);
    pixel_sda : out std_logic_vector(nsensor-1 downto 0);
    pixel_tokin : out std_logic_vector(nsensor-1 downto 0);
    pixel_tokout : in std_logic_vector(nsensor-1 downto 0);
    pixel_trigger : out std_logic_vector(nsensor-1 downto 0);
    pixel_data : in std_logic_vector(nsensor-1 downto 0);

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
end psi46_interface;

architecture RTL of psi46_interface is

  component pixelclk
  port (
    clk_x : in std_logic;            -- Internally generated 15 ns clock
    clk_y : in std_logic;            -- Internally generated 5 MHz clock
    clk_ext : in std_logic;          -- external 27 mhz clock
    clksel : in std_logic;           -- set to select external clock source
    pclk : out std_logic;
    pclk2x : out std_logic;

    reset : in std_logic;            -- resets all dcm components
    locked : out std_logic;
    arm_bco_reset : in std_logic;
    bco_reset_armed : out std_logic;
    bco_reset_busy : out std_logic;
    bco_reset : in std_logic;        -- reset ts counter when armed
    bco_reset_now : in std_logic;        -- reset ts counter
    bco : out std_logic_vector(47 downto 0);   -- ts counter
    clk_data_in : in std_logic_vector(15 downto 0);   -- dcm reconfiguration data in
    clk_data_out : out std_logic_vector(15 downto 0);   -- dcm reconfiguration data out
    clk_addr : in std_logic_vector(6 downto 0);         -- dcm reconfiguration address
    clk_we : in std_logic;                -- dcm reconfiguration write enable
    clk_en : in std_logic;                -- dcm reconfiguration enable
    busclk : in std_logic;                -- dcm reconfiguration clock
    clk_busy : out std_logic;             -- dcm reconfiguration status
    debug_select : in std_logic;
    debug : out std_logic_vector(7 downto 0)
  );
  end component;

  component pixeli2c
  generic (
    n : integer := 1
  );
  port (
    pclk : in std_logic;
    pclk2x : in std_logic;
    strobe : in std_logic;
    busy : out std_logic;
    sel : in std_logic_vector(n-1 downto 0);
    len : in std_logic_vector(7 downto 0);
    restart : in std_logic;
    data : in std_logic_vector(31 downto 0);
    sda : out std_logic_vector(n-1 downto 0)
  );
  end component;

  component pixelreset
  generic (
    n : integer := 1
  );
  port (
    pclk : in std_logic;
    do_reset : in std_logic;
    reset_mask : in std_logic_vector(n downto 0);
    reset_busy : out std_logic;
    pixel_reset : out std_logic_vector(n-1 downto 0);
    tbm_reset : out std_logic
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

  component pixeltbm
  port (
    pclk : in std_logic;
    reset : in std_logic;
    pixel_caltrig : out std_logic;
    token_out : out std_logic;
    token_in : in std_logic;
    trigger : in std_logic;
    bco : in std_logic_vector(47 downto 0);
    trig_bco : out std_logic_vector(47 downto 0);
    enable : out std_logic;
    itrig : out std_logic_vector(3 downto 0);
    itoken : out std_logic_vector(3 downto 0);
    cal_delay : in std_logic_vector(7 downto 0);
    token_delay : in std_logic_vector(3 downto 0);
    trig_delay : in std_logic_vector(7 downto 0);
    reset_delay : in std_logic_vector(3 downto 0);
    tbm_select : in std_logic;
    do_cal : in std_logic;
    cal_busy : out std_logic;
    do_trig : in std_logic;
    trig_busy : out std_logic;
    do_reset : in std_logic;
    reset_busy : out std_logic;
    do_token : in std_logic;
    token_busy : out std_logic
  );
  end component;

  component pixelreadout
    generic (
      channel : integer := 0;
      iobdelay_value : integer := 0
    );
    port (
      pclk : in std_logic;
      sclk : in std_logic;
      reset : in std_logic;
      enable : in std_logic;
      din : in std_logic;
      aligned : out std_logic;
      serial_input : out std_logic;
      serdes_output : out std_logic_vector(3 downto 0);
      dout : out std_logic_vector(31 downto 0)
    );
  end component;

  component pixelspyfifo
  port (
    rst : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    din : in std_logic_vector(3 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(3 downto 0);
    full : out std_logic;
    empty : out std_logic
  );
  end component;

  component pixelmatch
  port (
    rst : in std_logic;
    pclk : in std_logic;
    enable : in std_logic;
    din : in std_logic_vector(3 downto 0);
    trigger : in std_logic;
    pattern0 : in std_logic_vector(14 downto 0);
    pattern1 : in std_logic_vector(14 downto 0);
    clear : in std_logic;
    trig_count : out std_logic_vector(15 downto 0);
    header_count : out std_logic_vector(15 downto 0);
    match_count0 : out std_logic_vector(15 downto 0);
    match_count1 : out std_logic_vector(15 downto 0)
  );
  end component;

  component pixelpulser
  port (
    rst : in std_logic;
    pclk : in std_logic;
    start : in std_logic;
    busy : out std_logic;
    count : in std_logic_vector(15 downto 0);
    bco_match : in std_logic_vector(7 downto 0);
    bco : in std_logic_vector(7 downto 0);
    do_cal : out std_logic;
    do_trig : out std_logic;
    tbm_busy : in std_logic
  );
  end component;

  component pixelevent
    generic (
      channel : integer := 0
    );
    port (
      rst : in std_logic;
      pclk : in std_logic;
      trigger : in std_logic;
      latch_bco : out std_logic;
      bco_counter : in std_logic_vector(7 downto 0);
      enable : in std_logic;
      din : in std_logic_vector(3 downto 0);
      dv : in std_logic;
      start_event : in std_logic;
      end_event : in std_logic;
      valid : out std_logic;
      empty : out std_logic_vector(2 downto 0);
      full : out std_logic_vector(2 downto 0);
      rclk : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(31 downto 0);
      err : out std_logic
    );
  end component;

  component pixelevb
    generic (
      n : integer := 1
    );
    port (
      rst : in std_logic;
      pclk : in std_logic;
      trigger : in std_logic;
      bco_counter : in std_logic_vector(47 downto 0);
      trigger_number : in std_logic_vector(39 downto 0);
      enable_mask : in std_logic_vector(n-1 downto 0);
      data_available : in std_logic_vector(n-1 downto 0);
      read_enable : out std_logic_vector(n-1 downto 0);
      din0 : in std_logic_vector(31 downto 0);
      din1 : in std_logic_vector(31 downto 0);
      valid : out std_logic;
      rclk : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(31 downto 0)
    );
  end component;
 
  component pixelstream
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

 
  constant base_address : std_logic_vector(15 downto 0) := x"c600";
  constant address_mask : std_logic_vector(15 downto 0) := x"ffff";
  signal masked_address : std_logic_vector(15 downto 0);

  constant address_pixel_csr : std_logic_vector(15 downto 0) := x"0000";       -- command status register
  constant address_pixel_reset : std_logic_vector(15 downto 0) := x"0004";     -- reset
  constant address_pixel_i2c : std_logic_vector(15 downto 0) := x"0008";      -- i2c control interface
  constant address_pixel_i2c_data : std_logic_vector(15 downto 0) := x"000c";      -- i2c data
  constant address_pixel_caltrig : std_logic_vector(15 downto 0) := x"0010";      -- tbm
  constant address_pixel_addr : std_logic_vector(15 downto 0) := x"0014";
  constant address_pixel_status : std_logic_vector(15 downto 0) := x"0018";
  constant address_pixel_inject : std_logic_vector(15 downto 0) := x"001c";
  constant address_pixel_data : std_logic_vector(15 downto 0) := x"0020";    -- pixel input
  constant address_pixel_trigcount : std_logic_vector(15 downto 0) := x"0024";
  constant address_pixel_tokencount : std_logic_vector(15 downto 0) := x"0028";
  constant address_pixel_event : std_logic_vector(15 downto 0) := x"002c";
  constant address_pixel_spy_fifo : std_logic_vector(15 downto 0) := x"0030";
  constant address_pixel_event_data : std_logic_vector(15 downto 0) := x"003c";
  constant address_pixel_bco_counter_low : std_logic_vector(15 downto 0) := x"0040";    -- bco counter
  constant address_pixel_bco_counter_high : std_logic_vector(15 downto 0) := x"0044";   -- bco counter
  constant address_pclk_data : std_logic_vector(15 downto 0) := x"0048";       -- command status register
  constant address_pixel_streamer : std_logic_vector(15 downto 0) := x"004c";

  constant address_pixel_match : std_logic_vector(15 downto 0) := x"0050";
  constant address_pixel_header_count : std_logic_vector(15 downto 0) := x"0054";
  constant address_pixel_match_count : std_logic_vector(15 downto 0) := x"0058";
  constant address_pixel_pulser : std_logic_vector(15 downto 0) := x"0060";
  constant address_pixel_trignum_low : std_logic_vector(15 downto 0) := x"0080";
  constant address_pixel_trignum_high : std_logic_vector(15 downto 0) := x"0084";

  signal pixel_trigcount : std_logic_vector(31 downto 0);
  signal pixel_tokencount : std_logic_vector(31 downto 0);

  signal addressed : std_logic;
  signal bus_data : std_logic_vector(31 downto 0);
  signal ready : std_logic;

  signal pixel_csr : std_logic_vector(31 downto 0) := x"00000000";

  signal bco_counter : std_logic_vector(47 downto 0);
  signal trigger_number : std_logic_vector(39 downto 0);
  signal count_trigger : std_logic;
  signal pclk_reset : std_logic;
  signal pclk_locked : std_logic;
  signal pclk : std_logic;
  signal pclk2x : std_logic;
  signal arm_bco_reset : std_logic;
  signal bco_reset_armed : std_logic;
  signal bco_reset_busy : std_logic;
  signal do_bco_reset : std_logic;
  signal pclk_data_out : std_logic_vector(15 downto 0);
  signal pclk_data_we : std_logic;
  signal pclk_den : std_logic;
  signal pclk_busy : std_logic;
  signal pclk_data : std_logic_vector(31 downto 0) := x"00000000";
  signal pixel_address : std_logic_vector(31 downto 0) := x"00000000";
  signal pixel_status : std_logic_vector(31 downto 0) := x"00000000";
  signal clock_debug : std_logic_vector(7 downto 0);
  signal pixel_debug : std_logic_vector(7 downto 0);
  type count_array_t is array(nsensor-1 downto 0) of std_logic_vector(3 downto 0);
  signal trig_count : count_array_t;
  signal token_count : count_array_t;

  signal pixel_i2c : std_logic_vector(31 downto 0) := x"00000000";
  signal i2c_data : std_logic_vector(31 downto 0) := x"00000000";
  signal tbm_data : std_logic_vector(31 downto 0) := x"00000000";
  signal pixel_spy_data : std_logic_vector(31 downto 0) := x"00000000";
  signal pixel_spy_fifo : std_logic_vector(31 downto 0) := x"00000000";
  signal pixel_spy_data_read : std_logic_vector(31 downto 0);
  signal sda : std_logic_vector(nsensor-1 downto 0);
  signal token : std_logic_vector(nsensor-1 downto 0) := ( others => '0' );
  signal tbm_select : std_logic_vector(nsensor-1 downto 0);
  signal trigger : std_logic_vector(nsensor-1 downto 0);

  signal do_i2c : std_logic := '0';
  signal i2c_busy : std_logic;
  signal do_chipreset : std_logic := '0';
  signal chipreset_busy : std_logic;
  signal do_cal : std_logic := '0';
  signal cal_busy : std_logic;
  signal channel_cal_busy : std_logic_vector(nsensor-1 downto 0);
  signal do_token : std_logic := '0';
  signal token_busy : std_logic;
  signal channel_token_busy : std_logic_vector(nsensor-1 downto 0);
  signal do_reset : std_logic := '0';
  signal reset_busy : std_logic;
  signal channel_reset_busy : std_logic_vector(nsensor-1 downto 0);
  signal do_trig : std_logic := '0';
  signal trig_busy : std_logic;
  signal channel_trig_busy : std_logic_vector(nsensor-1 downto 0);
  signal tbm_cal : std_logic;
  signal tbm_trig : std_logic;

  signal reset : std_logic_vector(nsensor-1 downto 0);
  signal reset_mask : std_logic_vector(nsensor downto 0) := ( others => '0' );
  signal tbm_reset : std_logic;
  signal read_enable : std_logic_vector(nsensor-1 downto 0);
  signal data_ready : std_logic_vector(nsensor-1 downto 0);
  type pixel_data_array_t is array (nsensor-1 downto 0) of std_logic_vector(31 downto 0);
  signal pixel_read_data : pixel_data_array_t;
  signal pixel_input : std_logic_vector(nsensor-1 downto 0);
  signal input_aligned : std_logic_vector(nsensor-1 downto 0);

  signal pixel_spy_fifo_addressed : std_logic := '0';
  signal pixel_spy_fifo_full : std_logic;
  signal pixel_spy_fifo_empty : std_logic;
  signal pixel_spy_fifo_data : std_logic_vector(3 downto 0);
  type pixel_serdes_output_t is array(nsensor-1 downto 0) of std_logic_vector(3 downto 0);
  signal pixel_serdes_output : pixel_serdes_output_t;
  signal pixel_spy_fifo_input : std_logic_vector(3 downto 0);
  signal pixel_spy_fifo_enable : std_logic;

  signal pixel_match : std_logic_vector(31 downto 0) := x"00000000";
  signal pixel_match_count : std_logic_vector(31 downto 0);
  signal pixel_header_count : std_logic_vector(31 downto 0);
  signal pixel_trigger_input : std_logic;

  signal pixel_pulser : std_logic_vector(31 downto 0) := x"00000000";
  signal do_pulser: std_logic := '0';
  signal pulser_busy : std_logic;
  signal pulser_cal : std_logic;
  signal pulser_trig : std_logic;
  signal tbm_busy : std_logic;

  signal event_valid : std_logic_vector(nsensor-1 downto 0);
  type fifo_status_t is array(nsensor-1 downto 0) of std_logic_vector(2 downto 0);
  signal event_fifo_empty : fifo_status_t;
  signal event_fifo_full : fifo_status_t;
  signal event_read_enable : std_logic_vector(nsensor-1 downto 0);
  type event_data_t is array(nsensor-1 downto 0) of std_logic_vector(31 downto 0);
  signal event_data : event_data_t;
  signal event_error : std_logic_vector(nsensor-1 downto 0);
  signal pixel_event_fifo_addressed : std_logic := '0';
  signal read_evb_fifo : std_logic;
  signal evb_data : std_logic_vector(31 downto 0);
  signal evb_data_valid : std_logic;
  signal evb_read_enable : std_logic;
  signal latch_bco : std_logic_vector(nsensor-1 downto 0);
  signal trigger_event : std_logic;
  signal enable_mask : std_logic_vector(nsensor-1 downto 0);

  signal stream_data : std_logic_vector(31 downto 0);
  signal stream_data_valid : std_logic := '0';
  signal stream_status : std_logic_vector(31 downto 0);
  signal stream_words_dumped : std_logic_vector(31 downto 0);

  type iobdelay_array_t is array(0 to 3) of integer;
  constant iobdelay : iobdelay_array_t := ( 48, 0, 0, 0 );
begin

  pixelclk_imp : pixelclk
  port map (
    clk_x => clkx,
    clk_y => clky,
    clk_ext => ext_clk,
    clksel => pixel_csr(16),
    pclk => pclk,
    pclk2x => pclk2x,
    reset => pclk_reset,
    locked => pclk_locked,
    arm_bco_reset => arm_bco_reset,
    bco_reset_armed => bco_reset_armed,
    bco_reset_busy => bco_reset_busy,
    bco_reset => ext_start,
    bco_reset_now => do_bco_reset,
    bco => bco_counter,
    clk_data_in => pclk_data(15 downto 0),
    clk_data_out => pclk_data_out,
    clk_addr => pclk_data(22 downto 16),
    clk_we => pclk_data_we,
    clk_en => pclk_den,
    busclk => busclk,
    clk_busy => pclk_busy,
    debug_select => pixel_csr(13),
    debug => clock_debug
  );

  i2c_imp : pixeli2c
  generic map (
    n => nsensor
  )
  port map (
    pclk => pclk,
    pclk2x => pclk2x,
    strobe => do_i2c,
    busy => i2c_busy,
    sel => pixel_i2c(16+nsensor-1 downto 16),
    len => pixel_i2c(7 downto 0),
    restart => pixel_i2c(24),
    data => i2c_data,
    sda => sda
  );

  pixreset_imp : pixelreset
  generic map (
    n => nsensor
  )
  port map (
    pclk => pclk,
    do_reset => do_chipreset,
    reset_mask => reset_mask,
    reset_busy => chipreset_busy,
    pixel_reset => reset,
    tbm_reset => tbm_reset
  );

  spy_fifo_imp : pixelspyfifo
  port map (
    rst => pixel_spy_fifo(31),
    wr_clk => pclk,
    rd_clk => busclk,
    din => pixel_spy_fifo_input,
    wr_en => pixel_spy_fifo_enable,
    rd_en => pixel_spy_fifo_addressed,
    dout => pixel_spy_fifo_data,
    full => pixel_spy_fifo_full,
    empty => pixel_spy_fifo_empty
  );

  match_imp : pixelmatch
  port map (
    rst => pixel_spy_fifo(31),
    pclk => pclk,
    enable => pixel_spy_fifo_enable,
    din => pixel_spy_fifo_input,
    trigger => pixel_trigger_input,
    pattern0 => pixel_match(14 downto 0),
    pattern1 => pixel_match(30 downto 16),
    clear => pixel_match(31), 
    trig_count => pixel_header_count(15 downto 0),
    header_count => pixel_header_count(31 downto 16),
    match_count0 => pixel_match_count(15 downto 0),
    match_count1 => pixel_match_count(31 downto 16)
  );

  pulser_imp : pixelpulser
  port map (
    rst => tbm_reset,
    pclk => pclk,
    start => do_pulser,
    busy => pulser_busy,
    count => pixel_pulser(15 downto 0),
    bco_match => pixel_pulser(23 downto 16),
    bco => bco_counter(7 downto 0),
    do_cal => pulser_cal,
    do_trig => pulser_trig,
    tbm_busy => tbm_busy
  );

  trignum_imp : trigcounter
  port map (
    clk => pclk,
    ce => count_trigger,
    sclr => pixel_csr(21),
    q => trigger_number
  );

  g_addr : for i in 0 to nsensor-1 generate
    pixel_trigger(i) <= trigger(i);
--    tbm_select(i) <= '1' when to_integer(unsigned(tbm_data(27 downto 24))) = i
--                         else '0';
    pixel_address(4*i) <= pixel_addr0(i);
    pixel_address(4*i+1) <= pixel_addr1(i);
    pixel_address(4*i+2) <= pixel_addr2(i);
    pixel_address(4*i+3) <= pixel_addr3(i);
    pixel_status(4*i) <= input_aligned(i);
    pixel_trigcount(4*i+3 downto 4*i) <= trig_count(i);
    pixel_tokencount(4*i+3 downto 4*i) <= token_count(i);
  end generate;
  
  g_deserdes : for i in 0 to nsensor-1 generate
    tbm_imp : pixeltbm
    port map (
      pclk => pclk,
      reset => tbm_reset,
      pixel_caltrig => trigger(i),
      token_out => token(i),
      token_in => pixel_tokout(i),
      trigger => '0',
      enable => data_ready(i),
      bco => bco_counter,
      trig_bco => open,
      itrig => trig_count(i),
      itoken => token_count(i),
      cal_delay => tbm_data(7 downto 0),
      trig_delay => tbm_data(15 downto 8),
      reset_delay => tbm_data(23 downto 20),
      token_delay => tbm_data(19 downto 16),
      tbm_select => tbm_select(i),
      do_cal => tbm_cal,
      cal_busy => channel_cal_busy(i),
      do_trig => tbm_trig,
      trig_busy => channel_trig_busy(i),
      do_reset => do_reset, 
      reset_busy => channel_reset_busy(i),
      do_token => do_token,
      token_busy => channel_token_busy(i)
    );
    pd_imp : pixelreadout
    generic map (
      channel => i,
      iobdelay_value => iobdelay(i)
    )
    port map (
      pclk => pclk,
      sclk => pclk2x,
      reset => tbm_reset,
      enable => data_ready(i),
      din => pixel_data(i),
      aligned => input_aligned(i),
      serial_input => pixel_input(i),
      serdes_output => pixel_serdes_output(i),
      dout => pixel_read_data(i)
    );
    pe_imp : pixelevent
    generic map (
      channel => i
    )
    port map (
      rst => tbm_reset,
      pclk => pclk,
      trigger => trigger(i),
      latch_bco => latch_bco(i),
      bco_counter => bco_counter(7 downto 0),
      enable => enable_mask(i),
      din => pixel_serdes_output(i),
      dv => read_enable(i),
      start_event => token(i),
      end_event => pixel_tokout(i),
      valid => event_valid(i),
      empty => event_fifo_empty(i),
      full => event_fifo_full(i),
      rclk => busclk,
      rd_en => event_read_enable(i),
      dout => event_data(i),
      err => event_error(i)
    );
  end generate;

  evb_imp : pixelevb
  generic map (
    n => nsensor
  )
  port map (
    rst => tbm_reset,
    pclk => pclk,
    trigger => trigger_event,
    bco_counter => bco_counter,
    trigger_number => trigger_number,
    enable_mask => enable_mask,
    data_available => event_valid,
    read_enable => event_read_enable,
    din0 => event_data(0),
    din1 => event_data(1),
    valid => evb_data_valid,
    rclk => busclk,
    rd_en => read_evb_fifo,
    dout => evb_data
  );

  pixelstream_imp : pixelstream
  port map (
    reset => '0',
    enable => pixel_csr(23),
    flush => '0',
    packet_size => pixel_csr(7 downto 3),
    idle_count => pixel_csr(13 downto 12),
    clk => busclk,
    din => evb_data,
    write_enable => read_evb_fifo,
    status => stream_status,
    words_dumped => stream_words_dumped,
    stream_rclk => stream_rclk,
    stream_read_enable => stream_read_enable,
    stream_dout => stream_dout,
    stream_length => stream_length,
    stream_cksum => stream_cksum,
    stream_strobe => stream_strobe,
    stream_ready => stream_ready
  );

  process ( busclk ) begin
    if ( busclk'event and busclk = '1' ) then

      if ( do_bco_reset = '1' and bco_reset_busy = '1' ) then
        do_bco_reset <= '0';
      end if;
      if ( arm_bco_reset = '1' and bco_reset_busy = '1' ) then
        arm_bco_reset <= '0';
      end if;
      if ( i2c_busy = '1' and do_i2c = '1' ) then
        do_i2c <= '0';
      end if;
      if ( chipreset_busy = '1' and do_chipreset = '1' ) then
        do_chipreset <= '0';
      end if;
      if ( cal_busy = '1' and do_cal = '1' ) then
        do_cal <= '0';
      end if;
      if ( reset_busy = '1' and do_reset = '1' ) then
        do_reset <= '0';
      end if;
      if ( trig_busy = '1' and do_trig = '1' ) then
        do_trig <= '0';
      end if;
      if ( token_busy = '1' and do_token = '1' ) then
        do_token <= '0';
      end if;
      if ( pulser_busy = '1' and do_pulser = '1' ) then
        do_pulser <= '0';
      end if;

      if ( iobus.io_addr_strobe = '1' and masked_address = base_address ) then
        iobus_ready <= '1';
        if ( iobus.io_write_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_pixel_csr =>
              pixel_csr <= iobus.io_write_data;
              arm_bco_reset <= iobus.io_write_data(19);
              do_bco_reset <= iobus.io_write_data(22);
            when address_pixel_reset =>
              if ( chipreset_busy = '0' ) then
                do_chipreset <= iobus.io_write_data(31);
              end if;
              reset_mask <= iobus.io_write_data(nsensor downto 0);
            when address_pixel_i2c =>
              if ( i2c_busy = '0' ) then
                do_i2c <= iobus.io_write_data(31);
              end if;
              pixel_i2c <= iobus.io_write_data;
            when address_pixel_i2c_data =>
              i2c_data <= iobus.io_write_data;
            when address_pixel_data =>
              pixel_spy_data <= iobus.io_write_data;
            when address_pixel_spy_fifo =>
              pixel_spy_fifo <= iobus.io_write_data;
            when address_pixel_caltrig =>
              if ( reset_busy = '0' ) then
                do_reset <= iobus.io_write_data(31);
              end if;
              if ( cal_busy = '0' ) then
                do_cal <= iobus.io_write_data(30);
              end if;
              if ( token_busy = '0' ) then
                do_token <= iobus.io_write_data(29);
              end if;
              if ( trig_busy = '0' ) then
                do_trig <= iobus.io_write_data(28);
              end if;
              tbm_data <= iobus.io_write_data;
            when address_pclk_data =>
              pclk_data <= iobus.io_write_data;
              pclk_data_we <= iobus.io_write_data(31);
              pclk_den <= '1';
            when address_pixel_match =>
              pixel_match <= iobus.io_write_data;
            when address_pixel_pulser =>
              pixel_pulser <= iobus.io_write_data;
              if ( pulser_busy = '0' ) then
                do_pulser <= iobus.io_write_data(31);
              end if;
            when others =>

          end case;
        end if;
        if ( iobus.io_read_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_pixel_csr =>
              bus_data <= pixel_csr(31) & pclk_locked & pixel_csr(29 downto 23) &
                          bco_reset_busy & pixel_csr(21 downto 20) & bco_reset_armed &
                          pixel_csr(18 downto 0);
            when address_pixel_reset =>
              bus_data <= chipreset_busy & std_logic_vector(to_unsigned(0,30-nsensor)) & reset_mask;
            when address_pixel_i2c =>
              bus_data <= i2c_busy & pixel_i2c(30 downto 0);
            when address_pixel_i2c_data =>
              bus_data <= i2c_data;
            when address_pixel_caltrig =>
              bus_data <= reset_busy & cal_busy & token_busy & trig_busy & tbm_data(27 downto 0);
            when address_pixel_addr =>
              bus_data <= pixel_address;
            when address_pixel_status =>
              bus_data <= pixel_status;
            when address_pixel_trigcount =>
              bus_data <= pixel_trigcount;
            when address_pixel_tokencount =>
              bus_data <= pixel_tokencount;
            when address_pixel_data =>
              bus_data <= pixel_spy_data_read;
            when address_pixel_event =>
              bus_data <= evb_data_valid & "0000000" & x"00" &
                          '0' & event_fifo_full(1)(2) & event_fifo_full(1)(1) & event_fifo_full(1)(0) &
                          event_valid(1) & event_fifo_empty(1)(2) & event_fifo_empty(1)(1) & event_fifo_empty(1)(0) &
                          '0' & event_fifo_full(0)(2) & event_fifo_full(0)(1) & event_fifo_full(0)(0) &
                          event_valid(0) & event_fifo_empty(0)(2) & event_fifo_empty(0)(1) & event_fifo_empty(0)(0);
            when address_pixel_event_data =>
              pixel_event_fifo_addressed <= '1';
            when address_pclk_data =>
              bus_data <= pclk_busy & std_logic_vector(to_unsigned(0,15)) & pclk_data_out;
            when address_pixel_spy_fifo =>
              bus_data <= pixel_spy_fifo(31 downto 10) & pixel_spy_fifo_full & pixel_spy_fifo_empty & "0000" & pixel_spy_fifo_data;
              pixel_spy_fifo_addressed <= '1';
            when address_pixel_bco_counter_low =>
              bus_data <= bco_counter(31 downto 0);
            when address_pixel_bco_counter_high =>
              bus_data <= x"0000" & bco_counter(47 downto 32);
            when address_pixel_match =>
              bus_data <= pixel_match;
            when address_pixel_header_count =>
              bus_data <= pixel_header_count;
            when address_pixel_match_count =>
              bus_data <= pixel_match_count;
            when address_pixel_pulser =>
              bus_data <= pulser_busy & pixel_pulser(30 downto 0);
            when address_pixel_trignum_low =>
              bus_data <= trigger_number(31 downto 0);
            when address_pixel_trignum_high =>
              bus_data <= x"000000" & trigger_number(39 downto 32);
            when address_pixel_streamer =>
              bus_data <= stream_status;
            when others =>
              bus_data <= x"c6f8f8f8";
          end case;
        end if;
      else
        iobus_ready <= '0';
        pclk_data_we <= '0';
        pclk_den <= '0';
        pixel_spy_fifo_addressed <= '0';
        pixel_event_fifo_addressed <= '0';
        if ( ext_halt = '1' ) then
          pixel_csr(17) <= '1';
        elsif ( ext_start = '1' ) then
          pixel_csr(17) <= '0';
        end if;
      end if;
    end if;
  end process;

  masked_address <= iobus.io_address(31 downto 16) and address_mask;
--  write_data <= bus_data;
  write_data <= evb_data when pixel_event_fifo_addressed = '1' else bus_data;
  pclk_reset <= pixel_csr(31);
  pixel_clk <= pclk;
  pixel_sda <= sda;
  pixel_reset <= not reset;
  pixel_tokin <= token;

--  cal_busy <= channel_cal_busy(to_integer(unsigned(tbm_data(27 downto 24))));
--  reset_busy <= channel_reset_busy(to_integer(unsigned(tbm_data(27 downto 24))));
--  trig_busy <= channel_trig_busy(to_integer(unsigned(tbm_data(27 downto 24))));
--  token_busy <= channel_token_busy(to_integer(unsigned(tbm_data(27 downto 24))));

  tbm_select <= tbm_data(24+nsensor-1 downto 24);                                     -- only works for nsensor<5
--  read_enable <= ( data_ready and input_aligned ) when
--                 ( input_aligned and enable_mask ) = enable_mask else 
--                 ( others => '0' );
--  enable_mask <= pixel_csr(8+nsensor-1 downto 8);
  read_enable <= data_ready and input_aligned;
  enable_mask <= pixel_csr(8+nsensor-1 downto 8) when pixel_csr(17) = '0' else ( others => '0' );

  process ( channel_cal_busy, channel_reset_busy, channel_trig_busy, channel_token_busy )
    variable cal : std_logic;
    variable reset : std_logic;
    variable trig : std_logic;
    variable token : std_logic;
  begin
    cal := '0';
    reset := '0';
    trig := '0';
    token := '0';
    for i in 0 to nsensor-1 loop
      cal := cal or channel_cal_busy(i);
      reset := reset or channel_reset_busy(i);
      trig := trig or channel_trig_busy(i);
      token := token or channel_token_busy(i);
    end loop;
    cal_busy <= cal;
    reset_busy <= reset;
    trig_busy <= trig;
    token_busy <= token;
  end process;

  pixel_spy_data_read <= pixel_read_data(0) when pixel_spy_fifo(27 downto 24) = "0000" else
                         pixel_read_data(1) when pixel_spy_fifo(27 downto 24) = "0001" else
                         ( others => '1' );
  pixel_spy_fifo_input <= pixel_serdes_output(0) when pixel_spy_fifo(27 downto 24) = "0000" else
                          pixel_serdes_output(1) when pixel_spy_fifo(27 downto 24) = "0001" else "0000";
  pixel_spy_fifo_enable <= data_ready(0) when pixel_spy_fifo(27 downto 24) = "0000" else
                           data_ready(1) when pixel_spy_fifo(27 downto 24) = "0001" else '0';
  pixel_trigger_input <= trigger(0) when pixel_spy_fifo(27 downto 24) = "0000" else
                         trigger(1) when pixel_spy_fifo(27 downto 24) = "0001" else '0';

  trigger_event <= latch_bco(0) or latch_bco(1);
  count_trigger <= ext_trig;
  read_evb_fifo <= evb_data_valid;

  tbm_busy <= '1' when cal_busy = '1' else
              '1' when reset_busy = '1' else
              '1' when token_busy = '1' else
              '1' when trig_busy = '1' else '0';
  tbm_cal <= pulser_cal when pulser_busy = '1' else do_cal;
  tbm_trig <= pulser_trig when pulser_busy = '1' else do_trig;

  pixel_debug <= reset(0) & sda(0) & read_enable(0) & pixel_tokout(0) & token(0) & trigger(0) & pixel_input(0) & pclk when pixel_spy_fifo(27 downto 24) = "0000" else
                 reset(1) & sda(1) & read_enable(1) & pixel_tokout(1) & token(1) & trigger(1) & pixel_input(1) & pclk when pixel_spy_fifo(27 downto 24) = "0001" else "00000000";

  debug_select <= pixel_csr(15);
  debug <= clock_debug when pixel_csr(14) = '1' else pixel_debug;

end rtl;
