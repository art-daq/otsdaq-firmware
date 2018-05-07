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
--                 psi46_interface
--                 master_interface
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

entity master_psi46 is
  generic (
    nsensor : integer := 2
  );
  port (
    clk15ns_pad : in std_logic;
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

    pixel_pclka_pad_p : out std_logic;
    pixel_pclka_pad_n : out std_logic;
    pixel_pclkb_pad_p : out std_logic;
    pixel_pclkb_pad_n : out std_logic;
    pixel_i2c_pad_p : out std_logic_vector(nsensor-1 downto 0);
    pixel_i2c_pad_n : out std_logic_vector(nsensor-1 downto 0);
    pixel_reset_pad : out std_logic_vector(nsensor-1 downto 0);
    pixel_tokin_pad_p : out std_logic_vector(nsensor-1 downto 0);
    pixel_tokin_pad_n : out std_logic_vector(nsensor-1 downto 0);
    pixel_tokout_pad_p : in std_logic_vector(nsensor-1 downto 0);
    pixel_tokout_pad_n : in std_logic_vector(nsensor-1 downto 0);
    pixel_trig_pad_p : out std_logic_vector(nsensor-1 downto 0);
    pixel_trig_pad_n : out std_logic_vector(nsensor-1 downto 0);
    pixel_data_pad_p : in std_logic_vector(nsensor-1 downto 0);
    pixel_data_pad_n : in std_logic_vector(nsensor-1 downto 0);
    pixel_addr0_pad : in std_logic_vector(nsensor-1 downto 0);
    pixel_addr1_pad : in std_logic_vector(nsensor-1 downto 0);
    pixel_addr2_pad : in std_logic_vector(nsensor-1 downto 0);
    pixel_addr3_pad : in std_logic_vector(nsensor-1 downto 0);

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
    scint_trig_pad_p : in std_logic;
    scint_trig_pad_n : in std_logic;
    bdclk_in_pad_p : in std_logic;
    bdclk_in_pad_n : in std_logic;
    bdclk_out_pad_p : out std_logic_vector(2 downto 0);
    bdclk_out_pad_n : out std_logic_vector(2 downto 0);
    cmd_out_pad_p : out std_logic_vector(2 downto 0);
    cmd_out_pad_n : out std_logic_vector(2 downto 0);
    other_p : in std_logic_vector(7 downto 0);
    other_n : in std_logic_vector(7 downto 0)
  );
end master_psi46;

architecture RTL of master_psi46 is

  COMPONENT core
  PORT (
    Clk : IN STD_LOGIC;
    Reset : IN STD_LOGIC;
    IO_Addr_Strobe : OUT STD_LOGIC;
    IO_Read_Strobe : OUT STD_LOGIC;
    IO_Write_Strobe : OUT STD_LOGIC;
    IO_Address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IO_Byte_Enable : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    IO_Write_Data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IO_Read_Data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IO_Ready : IN STD_LOGIC;
    UART_Rx : IN STD_LOGIC;
    UART_Tx : OUT STD_LOGIC;
    INTC_Interrupt : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    INTC_IRQ : OUT STD_LOGIC
  );
  END COMPONENT;

  component psi46_interface
    generic (
      nsensor : integer range 1 to 4 := 1
    );
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
 
  signal other : std_logic_vector(7 downto 0);

  signal strip_debug : std_logic_vector(7 downto 0) := ( others => '0' );
  signal trigger_debug : std_logic_vector(7 downto 0);

  signal gmii_txd : std_logic_vector(7 downto 0);
  signal gmii_txer : std_logic;
  signal gmii_txen : std_logic;
  signal gmii_reset : std_logic;
  signal gmii_txclk : std_logic;
  signal gmii_rxclk : std_logic;
  signal gmii_rxdv : std_logic;
  signal gmii_rxer : std_logic;
  signal gmii_rxd : std_logic_vector(7 downto 0);

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

  signal master_debug_select : std_logic;
  signal pixel_debug_select : std_logic;
  signal pixel_debug : std_logic_vector(7 downto 0);

  constant nslave : integer := 5;

  signal master_iobus : iobus_t;
  signal slave_iobus : iobus_array_t(nslave-1 downto 0);
  signal slave_write_data : data_array_t(nslave-1 downto 0);
  signal slave_ready : ready_array_t(nslave-1 downto 0);
  signal io_read_data : std_logic_vector(31 downto 0);
  signal io_ready : std_logic;

  signal onepps : std_logic;
  signal scint_trig : std_logic;
  signal scint_trigger : std_logic;
  signal trigger : std_logic;
  signal start : std_logic;
  signal halt : std_logic;

  signal pixel_addr0 : std_logic_vector(nsensor-1 downto 0);
  signal pixel_addr1 : std_logic_vector(nsensor-1 downto 0);
  signal pixel_addr2 : std_logic_vector(nsensor-1 downto 0);
  signal pixel_addr3 : std_logic_vector(nsensor-1 downto 0);
  signal pixel_pclk : std_logic;
  signal pixel_i2c : std_logic_vector(nsensor-1 downto 0);
  signal pixel_reset : std_logic_vector(nsensor-1 downto 0);
  signal pixel_tokout : std_logic_vector(nsensor-1 downto 0);
  signal pixel_tokin : std_logic_vector(nsensor-1 downto 0);
  signal pixel_trig : std_logic_vector(nsensor-1 downto 0);
  signal pixel_data : std_logic_vector(nsensor-1 downto 0);

  signal stream_read_enable : std_logic;
  signal stream_dout : std_logic_vector(7 downto 0);
  signal stream_length : std_logic_vector(15 downto 0);
  signal stream_cksum : std_logic_vector(15 downto 0);
  signal stream_strobe : std_logic;
  signal stream_ready : std_logic;

  constant stib_type : string := "FNAL_MASTER";
--  constant stib_type : string := "PURDUE_MASTER";

BEGIN 
  mcs_0 : core
  PORT MAP (
    Clk => CLK15NS,
    Reset => CORE_RESET,
    IO_Addr_Strobe => MASTER_IOBUS.IO_Addr_Strobe,
    IO_Read_Strobe => MASTER_IOBUS.IO_Read_Strobe,
    IO_Write_Strobe => MASTER_IOBUS.IO_Write_Strobe,
    IO_Address => MASTER_IOBUS.IO_Address,
    IO_Byte_Enable => MASTER_IOBUS.IO_Byte_Enable,
    IO_Write_Data => MASTER_IOBUS.IO_Write_Data,
    IO_Read_Data => IO_READ_DATA,
    IO_Ready => IO_READY,
    UART_Rx => UART_Rx,
    UART_Tx => UART_Tx,
    INTC_Interrupt => INTERRUPT,
    INTC_IRQ => IRQ
  );

  gs1 : if ( stib_type = "FNAL_MASTER" ) generate
    gbe_imp : gbe_interface
    generic map (
      mac_address => "00:80:55:ec:00:04",
      ip_address => "192.168.133.4",
      netmask => "255.255.255.0",
      gateway => "192.168.133.1",
      jumpers => true,
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
--      MAC_ADDRESS => "00:aa:bb:cc:00:1f",
--      IP_ADDRESS => "192.168.1.5",
--      NETMASK => "255.255.255.0",
--      GATEWAY => "192.168.1.102",
--      JUMPERS => false,
--      DHCP => false
      mac_address => "00:80:55:ec:00:05",
      ip_address => "192.168.1.5",
      netmask => "255.255.255.0",
      gateway => "192.168.1.102",
      jumpers => false,
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
    debug_select => master_debug_select,
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

  pixel_imp : psi46_interface
  generic map (
    nsensor => nsensor
  )
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

    pixel_addr0 => pixel_addr0,
    pixel_addr1 => pixel_addr1,
    pixel_addr2 => pixel_addr2,
    pixel_addr3 => pixel_addr3,
    pixel_clk => pixel_pclk,
    pixel_reset => pixel_reset,
    pixel_sda => pixel_i2c,
    pixel_tokin => pixel_tokin,
    pixel_tokout => pixel_tokout,
    pixel_trigger => pixel_trig,
    pixel_data => pixel_data,
  
    stream_rclk => gmii_rxclk,
    stream_read_enable => stream_read_enable,
    stream_dout => stream_dout,
    stream_length => stream_length,
    stream_cksum => stream_cksum,
    stream_strobe => stream_strobe,
    stream_ready => stream_ready,
 
    debug_select => pixel_debug_select,
    debug => pixel_debug
    
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
  generic map (
    pattern => "01010",
    clock_edge => "FALLING",
    width => 1
  )
  port map (
    clk => bdclk_in,
    d => scint_trig,
    trigger => scint_trigger
  );

  clk15ns_ibufg : IBUFG
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    o => clk15ns,
    i => clk15ns_pad
  );
  clk5mhz_ibufg : ibufg
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    o => clk5mhz,
    i => clk5mhz_pad
  );

  g_led : for i in 0 to 1 generate
    led_obuf : obuf
    generic map (
      iostandard => "LVCMOS25",
      slew => "SLOW"
    )
    port map (
      i => led(i),
      o => led_pad(i)
    );
  end generate;
  g_debug : for i in 0 to 7 generate
    debug_obuf : obuf
    generic map (
      iostandard => "LVCMOS25",
      slew => "SLOW"
    )
    port map (
      i => debug_port(i),
      o => debug_port_pad(i)
    );
  end generate;
  
  uart_tx_obuf : obuf
  generic map (
    drive => 12,
    iostandard => "LVCMOS25",
    slew => "SLOW"
  )
  port map (
    o => uart_tx_pad,
    i => uart_tx
  );
  uart_rx_ibuf : ibuf
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    i => uart_rx_pad,
    o => uart_rx
  );

--  GMII interface to GbE PHY layer

  gmii_rxclk_ibufg : ibufg
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    i => gmii_rxclk_pad,
    o => gmii_rxclk
  );
  gmii_rxdv_ibufg : ibuf
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    i => gmii_rxdv_pad,
    o => gmii_rxdv
  );
  gmii_rxer_ibufg : ibuf
  generic map (
    iostandard => "LVCMOS25"
  )
  port map (
    i => gmii_rxer_pad,
    o => gmii_rxer
  );

  gmii_txer_obuf : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => gmii_txer_pad,
    c => gmii_rxclk,
    ce => '1',
    d1 => gmii_txer,
    d2 => gmii_txer,
    r => '0',
    s => '0'
  );
  gmii_txen_obuf : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => gmii_txen_pad,
    c => gmii_rxclk,
    ce => '1',
    d1 => gmii_txen,
    d2 => gmii_txen,
    r => '0',
    s => '0'
  );
  gmii_txclk_obuf : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => gmii_txclk_pad,
    c => gmii_rxclk,
    ce => '1',
    d1 => '0',
    d2 => '1',
    r => '0',
    s => '0'
  );
  gmii_reset_obuf : obuf
  generic map (
    iostandard => "LVCMOS25",
    slew => "SLOW"
  ) 
  port map (
    i => gmii_reset,
    o => gmii_reset_pad
  );
  g_gmii: for i in 0 to 7 generate
    gmii_txd_obuf : oddr
    generic map (
      ddr_clk_edge => "SAME_EDGE"
    )
    port map (
      q => gmii_txd_pad(i),
      c => gmii_rxclk,
      ce => '1',
      d1 => gmii_txd(i),
      d2 => gmii_txd(i),
      r => '0',
      s => '0'
    );
    gmii_rxd_ibuf : ibuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      i => gmii_rxd_pad(i),
      o => gmii_rxd(i)
    );
  end generate;

--  TLK3101 interface

  g_tlk : for i in 0 to 15 generate
    tlk_txd_obuf : oddr
    generic map (
      ddr_clk_edge => "SAME_EDGE"
    )
    port map (
      q => tlk_txd_pad(i),
      c => tlk_gtx_clk,
      ce => '1',
      d1 => tlk_txd(i),
      d2 => tlk_txd(i),
      r => '0',
      s => '0'
    );
    tlk_rxd_ibuf : ibuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      i => tlk_rxd_pad(i),
      o => tlk_rxd(i)
    );
  end generate;
  tlk_gtx_clk_oddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => tlk_gtx_clk_obuf,
    c => tlk_gtx_clk,
    ce => '1',
    d1 => '0',
    d2 => '1',   -- this makes an inverted output clock so that the tlk3101 samples on the rising edge.
    r => '0',
    s => '0'
  );
  tlk_gtx_clk_output_buffer : obuf
  generic map (
    iostandard => "LVCMOS25",
    drive => 24,
    slew => "FAST"
  )
  port map (
    i => tlk_gtx_clk_obuf,
    o => tlk_gtx_clk_pad
  );

  tlk_txen_obuf : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => tlk_txen_pad,
    c => tlk_gtx_clk,
    ce => '1',
    d1 => tlk_txen,
    d2 => tlk_txen,
    r => '0',
    s => '0'
  );
  tlk_txer_obuf : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => tlk_txer_pad,
    c => tlk_gtx_clk,
    ce => '1',
    d1 => tlk_txer,
    d2 => tlk_txer,
    r => '0',
    s => '0'
  );

  tlk_lckrefn_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_lckrefn,
    o => tlk_lckrefn_pad
  );
  tlk_prem_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_prem,
    o => tlk_prem_pad
  );
  tlk_enable_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_enable,
    o => tlk_enable_pad
  );
  tlk_loopen_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_loopen,
    o => tlk_loopen_pad
  );
  tlk_prbsen_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_prbsen,
    o => tlk_prbsen_pad
  );
  tlk_testen_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_testen,
    o => tlk_testen_pad
  );
  tlk_rxer_ibuf : ibuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_rxer_pad,
    o => tlk_rxer
  );
  tlk_rxdv_ibuf : ibuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_rxdv_pad,
    o => tlk_rxdv
  );
  tlk_rxclk_ibufg : ibufg
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => tlk_rxclk_pad,
    o => tlk_rxclk
  );
  sfp_enablen_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => sfp_enablen,
    o => sfp_enablen_pad
  );
  sfp_txdis_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => sfp_txdis,
    o => sfp_txdis_pad
  );
  sfp_rs_obuf : obuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => sfp_rs,
    o => sfp_rs_pad
  );
  sfp_txfault_ibuf : ibuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => sfp_txfault_pad,
    o => sfp_txfault
  );
  sfp_modabs_ibuf : ibuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => sfp_modabs_pad,
    o => sfp_modabs
  );
  sfp_los_ibuf : ibuf
  generic map ( iostandard => "LVCMOS25" )
  port map (
    i => sfp_los_pad,
    o => sfp_los
  );

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

  g_jumper : for i in 0 to 7 generate
    jumper_ibuf : ibuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      i => jumper_pad(i),
      o => jumpers(i)
    );
  end generate;

  g_other : for i in 0 to 7 generate
    other_ibuf : ibufds
    generic map (
      iostandard => "LVDS_25",
      diff_term => true
    )
    port map (
      i => other_p(i),
      ib => other_n(i),
      o => other(i)
    );
  end generate;

  pclka_obuf : obufds
  generic map ( iostandard => "LVDS_25" )
  port map (
    i => pixel_pclk,
    o => pixel_pclka_pad_p,
    ob => pixel_pclka_pad_n
  );
  pclkb_obuf : obufds
  generic map ( iostandard => "LVDS_25" )
  port map (
    i => pixel_pclk,
    o => pixel_pclkb_pad_p,
    ob => pixel_pclkb_pad_n
  );

  g_pix: for i in 0 to nsensor-1 generate
    addr0_ibuf : ibuf
    generic map ( iostandard => "LVCMOS25" )
    port map (
      i => pixel_addr0_pad(i),
      o => pixel_addr0(i)
    );
    addr1_ibuf : ibuf
    generic map ( iostandard => "LVCMOS25" )
    port map (
      i => pixel_addr1_pad(i),
      o => pixel_addr1(i)
    );
    addr2_ibuf : ibuf
    generic map ( iostandard => "LVCMOS25" )
    port map (
      i => pixel_addr2_pad(i),
      o => pixel_addr2(i)
    );
    addr3_ibuf : ibuf
    generic map ( iostandard => "LVCMOS25" )
    port map (
      i => pixel_addr3_pad(i),
      o => pixel_addr3(i)
    );

    i2c_obuf : obufds
    generic map ( iostandard => "LVDS_25" )
    port map (
      i => pixel_i2c(i),
      o => pixel_i2c_pad_p(i),
      ob => pixel_i2c_pad_n(i)
    );
    tokin_obuf : obufds                        --  This drives the PSI46 chip token input
    generic map ( iostandard => "LVDS_25" )
    port map (
      i => pixel_tokin(i),
      o => pixel_tokin_pad_p(i),
      ob => pixel_tokin_pad_n(i)
    );
    tokout_ibuf : ibufds                       -- This receives the PSI46 chip token output
    generic map (
      iostandard => "LVDS_25",
      diff_term => true
    )
    port map (
      i => pixel_tokout_pad_p(i),
      ib => pixel_tokout_pad_n(i),
      o => pixel_tokout(i)
    );
    data_ibuf : ibufds
    generic map (
      iostandard => "LVDS_25",
      diff_term => true
    )
    port map (
      i => pixel_data_pad_p(i),
      ib => pixel_data_pad_n(i),
      o => pixel_data(i)
    );
    trig_obuf : obufds
    generic map ( iostandard => "LVDS_25" )
    port map (
      i => pixel_trig(i),
      o => pixel_trig_pad_p(i),
      ob => pixel_trig_pad_n(i)
    );

    reset_obuf : obuf
    generic map ( iostandard => "LVCMOS25" )
    port map (
      i => pixel_reset(i),
      o => pixel_reset_pad(i)
    );
  end generate;

--  other interfaces...

  led(0) <= onepps;
  led(1) <= '1';

  trigger_debug <= "000000" & cmd & bdclk;
  debug_port <= pixel_debug when pixel_debug_select = '1' else
                trigger_debug when master_debug_select = '1' else ( others => '0' );

end rtl;
