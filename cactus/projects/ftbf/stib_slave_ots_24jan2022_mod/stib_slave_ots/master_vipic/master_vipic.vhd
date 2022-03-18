----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    master
-- Module Name:    master - RTL
-- Project Name:   Master STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Top level design for master STIB firmware.
--                 All IO buffers are instantiated at this level.
--
-- Dependencies:   core
--                 gbe_interface
--                 tlkserdes_interface
--                 clock_interface
--                 iobus_interface
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library stib;
use stib.iobus.all;
use stib.tlkserdes.all;
use stib.clock.all;
use stib.gbe.all;

entity master_vipic is
    port ( clk15ns_pad : in std_logic;
           clk5mhz_pad : in std_logic;
           led_pad : out  std_logic_vector (1 downto 0);
           uart_tx_pad : out  std_logic;
           uart_rx_pad : in  std_logic;
           debug_port_pad : out  std_logic_vector (7 downto 0);

           gmii_txd_pad : out  std_logic_vector (7 downto 0);
           gmii_txer_pad : out  std_logic;
           gmii_txen_pad : out  std_logic;
           gmii_txclk_pad : out  std_logic;
           gmii_reset_pad : out  std_logic;
           gmii_rxd_pad : in  std_logic_vector (7 downto 0);
           gmii_rxer_pad : in  std_logic;
           gmii_rxdv_pad : in  std_logic;
           gmii_rxclk_pad : in  std_logic;
           jumper_pad : in std_logic_vector(7 downto 0);

           tlk_txd_pad : out std_logic_vector(15 downto 0);
           tlk_gtx_clk_pad : out std_logic;
           tlk_lckrefn_pad : out std_logic;
           tlk_prem_pad : out std_logic;
           tlk_txen_pad : out std_logic;
           tlk_txer_pad : out std_logic;
           tlk_enable_pad : out std_logic;
           tlk_loopen_pad : out std_logic;
           tlk_prbsen_pad : out std_logic;
           tlk_testen_pad : out std_logic;
           tlk_rxer_pad : in std_logic;
           tlk_rxdv_pad : in std_logic;
           tlk_rxclk_pad : in std_logic;
           tlk_rxd_pad : in std_logic_vector(15 downto 0);
           sfp_enablen_pad : out std_logic;
           sfp_txdis_pad : out std_logic;
           sfp_rs_pad : out std_logic;
           sfp_txfault_pad : in std_logic;
           sfp_modabs_pad : in std_logic;
           sfp_los_pad : in std_logic;

           vipic_serial_clk_pad_p : out std_logic;
           vipic_serial_clk_pad_n : out std_logic;
           vipic_rstrobe_pad_p : out std_logic;
           vipic_rstrobe_pad_n : out std_logic;
           vipic_clean_pad_p : out std_logic;
           vipic_clean_pad_n : out std_logic;
           vipic_restart_pad_p : out std_logic;
           vipic_restart_pad_n : out std_logic;
           vipic_strobe_pad_p : out std_logic;
           vipic_strobe_pad_n : out std_logic;

           vipic_hitor_pad : in std_logic;
           vipic_load_pad : out std_logic;
           vipic_tsclk_pad : out std_logic;
           vipic_scin_pad : in std_logic_vector(2 downto 0); 
           vipic_scout_pad : out std_logic_vector(2 downto 0); 
           vipic_scclk_pad : out std_logic_vector(2 downto 0); 

           vipic_sin_pad_p : in std_logic_vector(15 downto 0);
           vipic_sin_pad_n : in std_logic_vector(15 downto 0);

           vipic_sout_pad_p : out std_logic_vector(3 downto 0);
           vipic_sout_pad_n : out std_logic_vector(3 downto 0);

           scint_trig_pad_p : in std_logic;
           scint_trig_pad_n : in std_logic;
           bdclk_in_pad_p : in std_logic;
           bdclk_in_pad_n : in std_logic;
           bdclk_out_pad_p : out std_logic_vector(2 downto 0);
           bdclk_out_pad_n : out std_logic_vector(2 downto 0);
           cmd_out_pad_p : out std_logic_vector(2 downto 0);
           cmd_out_pad_n : out std_logic_vector(2 downto 0)
        );
end master_vipic;

architecture RTL of master_vipic is

  COMPONENT core
  PORT (
    clk : in std_logic;
    reset : in std_logic;
    io_addr_strobe : out std_logic;
    io_read_strobe : out std_logic;
    io_write_strobe : out std_logic;
    io_address : out std_logic_vector(31 downto 0);
    io_byte_enable : out std_logic_vector(3 downto 0);
    io_write_data : out std_logic_vector(31 downto 0);
    io_read_data : in std_logic_vector(31 downto 0);
    io_ready : in std_logic;
    uart_rx : in std_logic;
    uart_tx : out std_logic;
    intc_interrupt : in std_logic_vector(0 downto 0);
    intc_irq : out std_logic
  );
  end component;

  component master_interface
  port (
    busclk : in std_logic;                            -- bus clock
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    bdclk_in : in std_logic;
    debug_select : out std_logic;
    ext_trig : in std_logic;
    clk_out : out std_logic;
    cmd_out : out std_logic
  );
  end component;

  component vipic_interface
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
  end component;

  component trigpattern
    generic (
      pattern : std_logic_vector := "00000";
      clock_edge : string := "RISING";
      width : integer := 1
    );
    port (
      clk : in std_logic;
      d : in std_logic;
      trigger : out std_logic
    );
  end component;

  signal clk15ns : std_logic;
  signal clk5mhz : std_logic;
  signal core_reset : std_logic := '0';
  signal uart_rx : std_logic;
  signal uart_tx : std_logic;
  signal uart_irx : std_logic;
  signal uart_itx : std_logic;
  signal irq : std_logic;
  signal interrupt : std_logic_vector(0 downto 0);
  signal debug : std_logic_vector(7 downto 0);
  signal gbe_debug : std_logic_vector(7 downto 0);
  signal debug_port : std_logic_vector(7 downto 0);
  signal led : std_logic_vector(1 downto 0);
  signal led_port : std_logic_vector(1 downto 0);
  signal jumpers : std_logic_vector(7 downto 0);

  signal bdclk_in : std_logic;
  signal bdclk : std_logic;
  signal cmd : std_logic;
  signal scint_trigger : std_logic;
 
  signal stream_read_enable : std_logic;
  signal stream_dout : std_logic_vector(7 downto 0);
  signal stream_length : std_logic_vector(15 downto 0);
  signal stream_cksum : std_logic_vector(15 downto 0);
  signal stream_strobe : std_logic;
  signal stream_ready : std_logic;

  signal strip_debug : std_logic_vector(7 downto 0) := ( others => '0' );
  signal trigger_debug : std_logic_vector(7 downto 0);
  signal vipic_debug : std_logic_vector(7 downto 0);
  signal vipic_debug_select : std_logic;

  signal gmii_txd : std_logic_vector(7 downto 0);
  signal gmii_txer : std_logic;
  signal gmii_txen : std_logic;
  signal gmii_reset : std_logic;
  signal gmii_txclk : std_logic;
  signal gmii_rxclk : std_logic;
  signal gmii_rxdv : std_logic;
  signal gmii_rxer : std_logic;
  signal gmii_rxd : std_logic_vector(7 downto 0);

  signal vipic_sin : std_logic_vector(15 downto 0);
  signal vipic_sout : std_logic_vector(3 downto 0);
  signal vipic_serial_clk : std_logic;
  signal vipic_rstrobe : std_logic;
  signal vipic_clean : std_logic;
  signal vipic_restart : std_logic;
  signal vipic_strobe : std_logic;
  signal vipic_tsclk : std_logic;
  signal vipic_load : std_logic;
  signal vipic_hitor : std_logic;
  signal vipic_scin : std_logic_vector(2 downto 0);
  signal vipic_scout : std_logic_vector(2 downto 0);
  signal vipic_scclk : std_logic_vector(2 downto 0);

  signal serdes_strip_data : std_logic_vector(31 downto 0);
  signal serdes_strip_data_we : std_logic;

  signal tlk_txd : std_logic_vector(15 downto 0);
  signal tlk_gtx_clk : std_logic;
  signal tlk_gtx_clk_obuf : std_logic;
  signal tlk_lckrefn : std_logic;
  signal tlk_prem : std_logic;
  signal tlk_txen : std_logic;
  signal tlk_txer : std_logic;
  signal tlk_enable : std_logic;
  signal tlk_loopen : std_logic;
  signal tlk_prbsen : std_logic;
  signal tlk_testen : std_logic;
  signal tlk_rxer : std_logic;
  signal tlk_rxdv : std_logic;
  signal tlk_rxclk : std_logic;
  signal tlk_rxd : std_logic_vector(15 downto 0);
  signal sfp_enablen : std_logic;
  signal sfp_txdis : std_logic;
  signal sfp_rs : std_logic;
  signal sfp_txfault : std_logic;
  signal sfp_modabs : std_logic;
  signal sfp_los : std_logic;

  signal trigger : std_logic;
  signal start : std_logic;
  signal halt : std_logic;
  signal debug_select : std_logic;

  constant nslave : integer := 5;

  signal master_iobus : iobus_t;
  signal slave_iobus : iobus_array_t(nslave-1 downto 0);
  signal slave_write_data : data_array_t(nslave-1 downto 0);
  signal slave_ready : ready_array_t(nslave-1 downto 0);
  signal io_read_data : std_logic_vector(31 downto 0);
  signal io_ready : std_logic;

  signal onepps : std_logic;
  signal scint_trig : std_logic;

  constant stib_type : string := "FNAL_MASTER";
--  constant stib_type : string := "PURDUE_MASTER";

begin 
  mcs_0 : core
  port map (
    clk => clk15ns,
    reset => core_reset,
    io_addr_strobe => master_iobus.io_addr_strobe,
    io_read_strobe => master_iobus.io_read_strobe,
    io_write_strobe => master_iobus.io_write_strobe,
    io_address => master_iobus.io_address,
    io_byte_enable => master_iobus.io_byte_enable,
    io_write_data => master_iobus.io_write_data,
    io_read_data => io_read_data,
    io_ready => io_ready,
    uart_rx => uart_rx,
    uart_tx => uart_tx,
    intc_interrupt => interrupt,
    intc_irq => irq
  );

  gs1 : if ( stib_type = "FNAL_MASTER" ) generate
    gbe_imp : gbe_interface
    generic map (
      mac_address => "00:80:55:ec:00:05",
      ip_address => "192.168.133.5",
      netmask => "255.255.255.0",
      gateway => "192.168.133.1",
      jumpers => true,
--      jumpers => false,
      dhcp => false
    )
    port map (
      reset => gmii_reset,
      rxclk => gmii_rxclk,
      rxd => gmii_rxd,
      rxdv => gmii_rxdv,
      rxer => gmii_rxer,
      txclk => gmii_txclk,
      txd => gmii_txd,
      txen => gmii_txen,
      txer => gmii_txer,
      jumpered_address => jumpers,
      busclk => clk15ns,
      iobus => slave_iobus(1),
      write_data => slave_write_data(1),
      iobus_ready => slave_ready(1),
      interrupt => interrupt(0),
      stream_read_enable => stream_read_enable,
      stream_dout => stream_dout,
      stream_length => stream_length,
      stream_cksum => stream_cksum,
      stream_strobe => stream_strobe,
      stream_ready => stream_ready,
  
      debug => gbe_debug
    );
  end generate;

  gs2 : if ( stib_type = "PURDUE_MASTER" ) generate
    gbe_imp : gbe_interface
    generic map (
      MAC_ADDRESS => "00:aa:bb:cc:00:1f",
      IP_ADDRESS => "192.168.1.5",
      NETMASK => "255.255.255.0",
      GATEWAY => "192.168.1.102",
      JUMPERS => false,
      DHCP => false
    )
    port map (
      reset => gmii_reset,
      rxclk => gmii_rxclk,
      rxd => gmii_rxd,
      rxdv => gmii_rxdv,
      rxer => gmii_rxer,
      txclk => gmii_txclk,
      txd => gmii_txd,
      txen => gmii_txen,
      txer => gmii_txer,
      jumpered_address => jumpers,
      busclk => clk15ns,
      iobus => slave_iobus(1),
      write_data => slave_write_data(1),
      iobus_ready => slave_ready(1),
      interrupt => interrupt(0),
      stream_read_enable => stream_read_enable,
      stream_dout => stream_dout,
      stream_length => stream_length,
      stream_cksum => stream_cksum,
      stream_strobe => stream_strobe,
      stream_ready => stream_ready,
  
      debug => gbe_debug
    );
  end generate;

  tlk_imp : tlkserdes_interface
  port map (
    busclk => clk15ns,
    iobus => slave_iobus(2),
    write_data => slave_write_data(2),
    iobus_ready => slave_ready(2),
    strip_data_clk => '0',
    strip_data => ( others => '0' ),
    strip_data_we => '0',
    enable => tlk_enable,
    testen => tlk_testen,
    loopen => tlk_loopen,
    prbsen => tlk_prbsen,
    lckrefn => tlk_lckrefn,
    prem => tlk_prem,
    gtxclk => tlk_gtx_clk,
    rxclk => tlk_rxclk,
    rxdv => tlk_rxdv,
    rxer => tlk_rxer,
    rxd => tlk_rxd,
    txen => tlk_txen,
    txer => tlk_txer,
    txd => tlk_txd,
    enablen => sfp_enablen,
    txdis => sfp_txdis,
    ratesel => sfp_rs,
    txfault => sfp_txfault,
    module_absent => sfp_modabs,
    loss_of_sync => sfp_los
  );

  clock_imp : clock_interface
  port map (
    clk => clk15ns,
    busclk => clk15ns,
    iobus => slave_iobus(0),
    write_data => slave_write_data(0),
    iobus_ready => slave_ready(0),
    onepps => onepps
  );

  mi_imp : master_interface
  port map (
    busclk => clk15ns,
    iobus => slave_iobus(3),
    write_data => slave_write_data(3),
    iobus_ready => slave_ready(3),
    bdclk_in => bdclk_in,
    debug_select => debug_select,
    ext_trig => scint_trigger,
    clk_out => bdclk,
    cmd_out => cmd
  );

  trigpattern_imp : trigpattern
  generic map (
    pattern => "01010",
    clock_edge => "FALLING",
    width => 1
  )
  port map (
    clk => bdclk,
    d => cmd,
    trigger => trigger
  );

  startpattern_imp : trigpattern
  generic map (
    pattern => "01101",
    clock_edge => "FALLING",
    width => 4
  )
  port map (
    clk => bdclk,
    d => cmd,
    trigger => start 
  );

  haltpattern_imp : trigpattern
  generic map (
    pattern => "00111",
    clock_edge => "FALLING",
    width => 2
  )
  port map (
    clk => bdclk,
    d => cmd,
    trigger => halt 
  );

  vipic_imp : vipic_interface
  port map (
    busclk => clk15ns,
    iobus => slave_iobus(4),
    write_data => slave_write_data(4),
    iobus_ready => slave_ready(4),
    clkx => clk15ns,
    clky => clk5mhz,
    ext_clk => bdclk,
    ext_trig => trigger,
    ext_start => start,
    ext_halt => halt,
    serial_clk => vipic_serial_clk,
    rstrobe => vipic_rstrobe,
    ts_clk => vipic_tsclk,
    load => vipic_load,
    hitor => vipic_hitor,
    clean => vipic_clean,
    restart => vipic_restart,
    strobe => vipic_strobe,
    sin => vipic_sin,
    sout => vipic_sout,
    scin => vipic_scin,
    scout => vipic_scout,
    scclk => vipic_scclk,
    dout => open,
    dv => open,
    stream_rclk => gmii_rxclk,
    stream_read_enable => stream_read_enable,
    stream_dout => stream_dout,
    stream_length => stream_length,
    stream_cksum => stream_cksum,
    stream_strobe => stream_strobe,
    stream_ready => stream_ready,
    debug_select => vipic_debug_select,
    debug => vipic_debug
  );

  iobus_imp : iobus_interface
  generic map (
    nslave => nslave
  )
  port map (
    clk => clk15ns,
    master => master_iobus,
    io_read_data => io_read_data,
    io_ready => io_ready,
    slave => slave_iobus,
    io_write_data => slave_write_data,
    slave_ready => slave_ready
  );

  triginput_imp : trigpattern
  GENERIC MAP (
    PATTERN => "01010",
    CLOCK_EDGE => "FALLING",
    WIDTH => 1
  )
  PORT MAP (
    CLK => bdclk_in,
    D => scint_trig,
    TRIGGER => scint_trigger
  );

  clk15ns_ibufg : IBUFG
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    O => CLK15NS,
    I => CLK15NS_PAD
  );
  clk5mhz_ibufg : IBUFG
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    O => CLK5MHZ,
    I => CLK5MHZ_PAD
  );

  G_LED : FOR I IN 0 TO 1 GENERATE
    led_obuf : OBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25",
      SLEW => "SLOW"
    )
    PORT MAP (
      I => LED(I),
      O => LED_PAD(I)
    );
  END GENERATE;
  G_DEBUG : FOR I IN 0 TO 7 GENERATE
    debug_obuf : OBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25",
      SLEW => "SLOW"
    )
    PORT MAP (
      I => DEBUG_PORT(I),
      O => DEBUG_PORT_PAD(I)
    );
  END GENERATE;
  
  uart_tx_obuf : OBUF
  GENERIC MAP (
    DRIVE => 12,
    IOSTANDARD => "LVCMOS25",
    SLEW => "SLOW" )
  PORT MAP (
    O => UART_TX_PAD,
    I => UART_TX
  );
  uart_rx_ibuf : IBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => UART_RX_PAD,
    O => UART_RX
  );

--  GMII interface to GbE PHY layer

  gmii_rxclk_ibufg : IBUFG
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => GMII_RXCLK_PAD,
    O => GMII_RXCLK
  );
  gmii_rxdv_ibufg : IBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => GMII_RXDV_PAD,
    O => GMII_RXDV
  );
  gmii_rxer_ibufg : IBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => GMII_RXER_PAD,
    O => GMII_RXER
  );

  gmii_txer_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => GMII_TXER_PAD,
    C => GMII_RXCLK,
    CE => '1',
    D1 => GMII_TXER,
    D2 => GMII_TXER,
    R => '0',
    S => '0'
  );
  gmii_txen_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => GMII_TXEN_PAD,
    C => GMII_RXCLK,
    CE => '1',
    D1 => GMII_TXEN,
    D2 => GMII_TXEN,
    R => '0',
    S => '0'
  );
  gmii_txclk_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => GMII_TXCLK_PAD,
    C => GMII_RXCLK,
    CE => '1',
    D1 => '0',
    D2 => '1',
    R => '0',
    S => '0'
  );
  gmii_reset_obuf : OBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25",
    SLEW => "SLOW"
  ) 
  PORT MAP (
    I => GMII_RESET,
    O => GMII_RESET_PAD
  );
  G_GMII: FOR I IN 0 TO 7 GENERATE
    gmii_txd_obuf : ODDR
    GENERIC MAP (
      DDR_CLK_EDGE => "SAME_EDGE"
    )
    PORT MAP (
      Q => GMII_TXD_PAD(I),
      C => GMII_RXCLK,
      CE => '1',
      D1 => GMII_TXD(I),
      D2 => GMII_TXD(I),
      R => '0',
      S => '0'
    );
    gmii_rxd_ibuf : IBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25"
    )
    PORT MAP (
      I => GMII_RXD_PAD(I),
      O => GMII_RXD(I)
    );
  END GENERATE;

--  TLK3101 interface

  G_TLK : FOR I IN 0 TO 15 GENERATE
    tlk_txd_obuf : ODDR
    GENERIC MAP (
      DDR_CLK_EDGE => "SAME_EDGE"
    )
    PORT MAP (
      Q => TLK_TXD_PAD(I),
      C => TLK_GTX_CLK,
      CE => '1',
      D1 => TLK_TXD(I),
      D2 => TLK_TXD(I),
      R => '0',
      S => '0'
    );
    tlk_rxd_ibuf : IBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25"
    )
    PORT MAP (
      I => TLK_RXD_PAD(I),
      O => TLK_RXD(I)
    );
  END GENERATE;
  tlk_gtx_clk_oddr : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => TLK_GTX_CLK_OBUF,
    C => TLK_GTX_CLK,
    CE => '1',
    D1 => '0',
    D2 => '1',   -- This makes an inverted output clock so that the TLK3101 samples on the rising edge.
    R => '0',
    S => '0'
  );
  tlk_gtx_clk_output_buffer : OBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25",
    DRIVE => 24,
    SLEW => "FAST"
  )
  PORT MAP (
    I => TLK_GTX_CLK_OBUF,
    O => TLK_GTX_CLK_PAD
  );

  tlk_txen_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => TLK_TXEN_PAD,
    C => TLK_GTX_CLK,
    CE => '1',
    D1 => TLK_TXEN,
    D2 => TLK_TXEN,
    R => '0',
    S => '0'
  );
  tlk_txer_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => TLK_TXER_PAD,
    C => TLK_GTX_CLK,
    CE => '1',
    D1 => TLK_TXER,
    D2 => TLK_TXER,
    R => '0',
    S => '0'
  );

  tlk_lckrefn_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_LCKREFN,
    O => TLK_LCKREFN_PAD
  );
  tlk_prem_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_PREM,
    O => TLK_PREM_PAD
  );
  tlk_enable_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_ENABLE,
    O => TLK_ENABLE_PAD
  );
  tlk_loopen_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_LOOPEN,
    O => TLK_LOOPEN_PAD
  );
  tlk_prbsen_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_PRBSEN,
    O => TLK_PRBSEN_PAD
  );
  tlk_testen_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_TESTEN,
    O => TLK_TESTEN_PAD
  );
  tlk_rxer_ibuf : IBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_RXER_PAD,
    O => TLK_RXER
  );
  tlk_rxdv_ibuf : IBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_RXDV_PAD,
    O => TLK_RXDV
  );
  tlk_rxclk_ibufg : IBUFG
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => TLK_RXCLK_PAD,
    O => TLK_RXCLK
  );
  sfp_enablen_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => SFP_ENABLEN,
    O => SFP_ENABLEN_PAD
  );
  sfp_txdis_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => SFP_TXDIS,
    O => SFP_TXDIS_PAD
  );
  sfp_rs_obuf : OBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => SFP_RS,
    O => SFP_RS_PAD
  );
  sfp_txfault_ibuf : IBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => SFP_TXFAULT_PAD,
    O => SFP_TXFAULT
  );
  sfp_modabs_ibuf : IBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => SFP_MODABS_PAD,
    O => SFP_MODABS
  );
  sfp_los_ibuf : IBUF
  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
  PORT MAP (
    I => SFP_LOS_PAD,
    O => SFP_LOS
  );

  sclk_obuf : obufds
  generic map (
    iostandard => "LVDS_25"
  )
  port map (
    i => vipic_serial_clk,
    o => vipic_serial_clk_pad_p,
    ob => vipic_serial_clk_pad_n
  );
  rstr_obuf : obufds
  generic map (
    iostandard => "LVDS_25"
  )
  port map (
    i => vipic_rstrobe,
    o => vipic_rstrobe_pad_p,
    ob => vipic_rstrobe_pad_n
  );
  clean_obuf : obufds
  generic map (
    iostandard => "LVDS_25"
  )
  port map (
    i => vipic_clean,
    o => vipic_clean_pad_p,
    ob => vipic_clean_pad_n
  );
  restart_obuf : obufds
  generic map (
    iostandard => "LVDS_25"
  )
  port map (
    i => vipic_restart,
    o => vipic_restart_pad_p,
    ob => vipic_restart_pad_n
  );
  strobe_obuf : obufds
  generic map (
    iostandard => "LVDS_25"
  )
  port map (
    i => vipic_strobe,
    o => vipic_strobe_pad_p,
    ob => vipic_strobe_pad_n
  );

  tsclk_obuf : obuf
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    i => vipic_tsclk,
    o => vipic_tsclk_pad
  );
  load_obuf : obuf
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    i => vipic_load,
    o => vipic_load_pad
  );
  hitor_ibuf : ibuf
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    i => vipic_hitor_pad,
    o => vipic_hitor
  );

  gsc : for i in 0 to 2 generate
    scout_obuf : obuf
    generic map (
      iostandard => "LVCMOS25",
      drive => 24
    )
    port map (
      i => vipic_scout(i),
      o => vipic_scout_pad(i)
    );
    scclk_obuf : obuf
    generic map (
      iostandard => "LVCMOS25",
      drive => 24
    )
    port map (
      i => vipic_scclk(i),
      o => vipic_scclk_pad(i)
    );
    scin_ibuf : ibuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      i => vipic_scin_pad(i),
      o => vipic_scin(i)
    );
  end generate;

  gvsi : for i in 0 to 15 generate
    vsin_ibuf : ibufds
    generic map (
--      iostandard => "LDT_25",
      iostandard => "LVDSEXT_25",
--      iostandard => "LVDS_25",
--      iostandard => "LVPECL_25",
      diff_term => true
    )
    port map (
      i => vipic_sin_pad_p(i),
      ib => vipic_sin_pad_n(i),
      o => vipic_sin(i)
    );
  end generate;

  gvso : for i in 0 to 3 generate
    vsout_obuf : obufds
    generic map (
      iostandard => "LVDS_25"
    )
    port map (
      i => vipic_sout(i),
      o => vipic_sout_pad_p(i),
      ob => vipic_sout_pad_n(i)
    );
  end generate;

  bdclk_ibuf : ibufds
  generic map ( iostandard => "LVDS_25",
                diff_term => true )
  port map (
    i => bdclk_in_pad_p,
    ib => bdclk_in_pad_n,
    o => bdclk_in
  );

  trig_ibuf : ibufds
  generic map ( iostandard => "LVDS_25",
                diff_term => true )
  port map (
    i => scint_trig_pad_p,
    ib => scint_trig_pad_n,
    o => scint_trig
  );

  g_clktrig : for i in 0 to 2 generate
    bdclk_obuf : obufds
    generic map ( iostandard => "LVDS_25" )
    port map (
      i => bdclk,
      o => bdclk_out_pad_p(i),
      ob => bdclk_out_pad_n(i)
    );
    trig_obuf : obufds
    generic map ( iostandard => "LVDS_25" )
    port map (
      i => cmd,
      o => cmd_out_pad_p(i),
      ob => cmd_out_pad_n(i)
    );
  end generate;

  G_JUMPER : FOR I IN 0 TO 7 GENERATE
    jumper_ibuf : IBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25"
    )
    PORT MAP (
      I => JUMPER_PAD(I),
      O => JUMPERS(I)
    );
  END GENERATE;

--  Other interfaces...

  led(0) <= onepps;
  led(1) <= '1';

  trigger_debug <= scint_trig & bdclk_in & "0" & trigger & halt & start & cmd & bdclk;
  debug_port <= vipic_debug when vipic_debug_select = '1' else
                trigger_debug when debug_select = '0' else ( others => '0' );

end RTL;
