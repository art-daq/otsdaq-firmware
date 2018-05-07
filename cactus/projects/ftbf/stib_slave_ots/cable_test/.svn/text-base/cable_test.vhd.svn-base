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
use stib.clock.all;
use stib.gbe.all;

entity cable_test is
    generic (
      nchan : integer := 30
    );
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

           testout_pad_p : out std_logic_vector(nchan-1 downto 0);
           testout_pad_n : out std_logic_vector(nchan-1 downto 0);
           testin_pad_p : in std_logic_vector(nchan-1 downto 0);
           testin_pad_n : in std_logic_vector(nchan-1 downto 0)
        );
end cable_test;

architecture RTL of cable_test is

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

  component cable_interface
  generic (
    nchan : integer := 4
  );
  port (
    busclk : in std_logic;
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    testin : in std_logic_vector(nchan-1 downto 0);
    testout : out std_logic_vector(nchan-1 downto 0)
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

  signal gmii_txd : std_logic_vector(7 downto 0);
  signal gmii_txer : std_logic;
  signal gmii_txen : std_logic;
  signal gmii_reset : std_logic;
  signal gmii_txclk : std_logic;
  signal gmii_rxclk : std_logic;
  signal gmii_rxdv : std_logic;
  signal gmii_rxer : std_logic;
  signal gmii_rxd : std_logic_vector(7 downto 0);

  constant nslave : integer := 3;

  signal master_iobus : iobus_t;
  signal slave_iobus : iobus_array_t(nslave-1 downto 0);
  signal slave_write_data : data_array_t(nslave-1 downto 0);
  signal slave_ready : ready_array_t(nslave-1 downto 0);
  signal io_read_data : std_logic_vector(31 downto 0);
  signal io_ready : std_logic;

  signal stream_read_enable : std_logic;
  signal stream_dout : std_logic_vector(7 downto 0);
  signal stream_length : std_logic_vector(15 downto 0);
  signal stream_cksum : std_logic_vector(15 downto 0);
  signal stream_strobe : std_logic;
  signal stream_ready : std_logic;

  signal testin : std_logic_vector(nchan-1 downto 0);
  signal testout : std_logic_vector(nchan-1 downto 0);

  signal onepps : std_logic;

--  constant stib_type : string := "FNAL_MASTER";
  constant stib_type : string := "PURDUE_MASTER";

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

  clock_imp : clock_interface
  port map (
    clk => clk15ns,
    busclk => clk15ns,
    iobus => slave_iobus(0),
    write_data => slave_write_data(0),
    iobus_ready => slave_ready(0),
    onepps => onepps
  );

  test_imp : cable_interface
  generic map (
    nchan => nchan
  )
  port map (
    busclk => clk15ns,
    iobus => slave_iobus(2),
    write_data => slave_write_data(2),
    iobus_ready => slave_ready(2),
    testin => testin,
    testout => testout
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

  clk15ns_ibufg : ibufg
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
    slew => "SLOW" )
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

  g_test : for i in 0 to nchan/2-1 generate
    test_ibufp : ibuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      i => testin_pad_p(i),
      o => testin(2*i)
    );
    test_ibufn : ibuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      i => testin_pad_n(i),
      o => testin(2*i+1)
    );

    test_obufp : obuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      o => testout_pad_p(i),
      i => testout(2*i)
    );
    test_obufn : obuf
    generic map (
      iostandard => "LVCMOS25"
    )
    port map (
      o => testout_pad_n(i),
      i => testout(2*i+1)
    );

  end generate;

--  Other interfaces...

  led(0) <= onepps;
  led(1) <= '1';

end RTL;
