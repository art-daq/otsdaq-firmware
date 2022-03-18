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

entity master is
    Port ( CLK15NS_PAD : in STD_LOGIC;
           CLK5MHZ_PAD : in STD_LOGIC;
           LED_PAD : out  STD_LOGIC_VECTOR (1 downto 0);
           UART_TX_PAD : out  STD_LOGIC;
           UART_RX_PAD : in  STD_LOGIC;
           DEBUG_PORT_PAD : out  STD_LOGIC_VECTOR (7 downto 0);
           GMII_TXD_PAD : out  STD_LOGIC_VECTOR (7 downto 0);
           GMII_TXER_PAD : out  STD_LOGIC;
           GMII_TXEN_PAD : out  STD_LOGIC;
           GMII_TXCLK_PAD : out  STD_LOGIC;
           GMII_RESET_PAD : out  STD_LOGIC;
           GMII_RXD_PAD : in  STD_LOGIC_VECTOR (7 downto 0);
           GMII_RXER_PAD : in  STD_LOGIC;
           GMII_RXDV_PAD : in  STD_LOGIC;
           GMII_RXCLK_PAD : in  STD_LOGIC;
           JUMPER_PAD : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

           TLK_TXD_PAD : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
           TLK_GTX_CLK_PAD : OUT STD_LOGIC;
           TLK_LCKREFN_PAD : OUT STD_LOGIC;
           TLK_PREM_PAD : OUT STD_LOGIC;
           TLK_TXEN_PAD : OUT STD_LOGIC;
           TLK_TXER_PAD : OUT STD_LOGIC;
           TLK_ENABLE_PAD : OUT STD_LOGIC;
           TLK_LOOPEN_PAD : OUT STD_LOGIC;
           TLK_PRBSEN_PAD : OUT STD_LOGIC;
           TLK_TESTEN_PAD : OUT STD_LOGIC;
           TLK_RXER_PAD : IN STD_LOGIC;
           TLK_RXDV_PAD : IN STD_LOGIC;
           TLK_RXCLK_PAD : IN STD_LOGIC;
           TLK_RXD_PAD : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
           SFP_ENABLEN_PAD : OUT STD_LOGIC;
           SFP_TXDIS_PAD : OUT STD_LOGIC;
           SFP_RS_PAD : OUT STD_LOGIC;
           SFP_TXFAULT_PAD : IN STD_LOGIC;
           SFP_MODABS_PAD : IN STD_LOGIC;
           SFP_LOS_PAD : IN STD_LOGIC;
           SCINT_TRIG_PAD_P : IN STD_LOGIC;
           SCINT_TRIG_PAD_N : IN STD_LOGIC;
           BDCLK_IN_PAD_P : IN STD_LOGIC;
           BDCLK_IN_PAD_N : IN STD_LOGIC;
           BDCLK_OUT_PAD_P : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
           BDCLK_OUT_PAD_N : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
           CMD_OUT_PAD_P : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
           CMD_OUT_PAD_N : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
           OTHER_P : IN STD_LOGIC_VECTOR(7 downto 0);
           OTHER_N : IN STD_LOGIC_VECTOR(7 downto 0)
        );
end master;

architecture RTL of master is

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

  SIGNAL CLK15NS : STD_LOGIC;
  SIGNAL CLK5MHZ : STD_LOGIC;
  SIGNAL CORE_RESET : STD_LOGIC := '0';
  SIGNAL UART_RX : STD_LOGIC;
  SIGNAL UART_TX : STD_LOGIC;
  SIGNAL UART_IRX : STD_LOGIC;
  SIGNAL UART_ITX : STD_LOGIC;
  SIGNAL IRQ : STD_LOGIC;
  SIGNAL INTERRUPT : STD_LOGIC_VECTOR(0 DOWNTO 0);
  SIGNAL DEBUG : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL GBE_DEBUG : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL DEBUG_PORT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL LED : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL LED_PORT : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL JUMPERS : STD_LOGIC_VECTOR(7 DOWNTO 0);

  signal bdclk_in : std_logic;
  signal bdclk : std_logic;
  signal cmd : std_logic;
 
  SIGNAL STREAM_READ_ENABLE : STD_LOGIC;
  SIGNAL STREAM_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL STREAM_LENGTH : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL STREAM_CKSUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL STREAM_STROBE : STD_LOGIC;
  SIGNAL STREAM_READY : STD_LOGIC;

  SIGNAL OTHER : STD_LOGIC_VECTOR(7 DOWNTO 0);

  signal strip_debug : std_logic_vector(7 downto 0) := ( others => '0' );
  signal trigger_debug : std_logic_vector(7 downto 0);

  SIGNAL GMII_TXD : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL GMII_TXER : STD_LOGIC;
  SIGNAL GMII_TXEN : STD_LOGIC;
  SIGNAL GMII_RESET : STD_LOGIC;
  SIGNAL GMII_TXCLK : STD_LOGIC;
  SIGNAL GMII_RXCLK : STD_LOGIC;
  SIGNAL GMII_RXDV : STD_LOGIC;
  SIGNAL GMII_RXER : STD_LOGIC;
  SIGNAL GMII_RXD : STD_LOGIC_VECTOR(7 DOWNTO 0);

  SIGNAL SERDES_STRIP_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL SERDES_STRIP_DATA_WE : STD_LOGIC;

  SIGNAL TLK_TXD : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL TLK_GTX_CLK : STD_LOGIC;
  SIGNAL TLK_GTX_CLK_OBUF : STD_LOGIC;
  SIGNAL TLK_LCKREFN : STD_LOGIC;
  SIGNAL TLK_PREM : STD_LOGIC;
  SIGNAL TLK_TXEN : STD_LOGIC;
  SIGNAL TLK_TXER : STD_LOGIC;
  SIGNAL TLK_ENABLE : STD_LOGIC;
  SIGNAL TLK_LOOPEN : STD_LOGIC;
  SIGNAL TLK_PRBSEN : STD_LOGIC;
  SIGNAL TLK_TESTEN : STD_LOGIC;
  SIGNAL TLK_RXER : STD_LOGIC;
  SIGNAL TLK_RXDV : STD_LOGIC;
  SIGNAL TLK_RXCLK : STD_LOGIC;
  SIGNAL TLK_RXD : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL SFP_ENABLEN : STD_LOGIC;
  SIGNAL SFP_TXDIS : STD_LOGIC;
  SIGNAL SFP_RS : STD_LOGIC;
  SIGNAL SFP_TXFAULT : STD_LOGIC;
  SIGNAL SFP_MODABS : STD_LOGIC;
  SIGNAL SFP_LOS : STD_LOGIC;

  signal debug_select : std_logic;

  CONSTANT NSLAVE : INTEGER := 4;

  SIGNAL MASTER_IOBUS : iobus_t;
  SIGNAL SLAVE_IOBUS : iobus_array_t(NSLAVE-1 DOWNTO 0);
  SIGNAL SLAVE_WRITE_DATA : data_array_t(NSLAVE-1 DOWNTO 0);
  SIGNAL SLAVE_READY : ready_array_t(NSLAVE-1 DOWNTO 0);
  SIGNAL IO_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IO_READY : STD_LOGIC;

  signal onepps : std_logic;
  signal scint_trig : std_logic;
  signal trigger : std_logic;

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
    GENERIC MAP (
      MAC_ADDRESS => "00:80:55:ec:00:04",
      IP_ADDRESS => "192.168.133.4",
      NETMASK => "255.255.255.0",
      GATEWAY => "192.168.133.1",
      JUMPERS => true,
      DHCP => false
    )
    PORT MAP (
      RESET => GMII_RESET,
      RXCLK => GMII_RXCLK,
      RXD => GMII_RXD,
      RXDV => GMII_RXDV,
      RXER => GMII_RXER,
      TXCLK => GMII_TXCLK,
      TXD => GMII_TXD,
      TXEN => GMII_TXEN,
      TXER => GMII_TXER,
      JUMPERED_ADDRESS => JUMPERS,
      BUSCLK => CLK15NS,
      IOBUS => SLAVE_IOBUS(1),
      WRITE_DATA => SLAVE_WRITE_DATA(1),
      IOBUS_READY => SLAVE_READY(1),
      INTERRUPT => INTERRUPT(0),
      STREAM_READ_ENABLE => STREAM_READ_ENABLE,
      STREAM_DOUT => STREAM_DOUT,
      STREAM_LENGTH => STREAM_LENGTH,
      STREAM_CKSUM => STREAM_CKSUM,
      STREAM_STROBE => STREAM_STROBE,
      STREAM_READY => STREAM_READY,
  
      DEBUG => GBE_DEBUG
    );
  end generate;

  gs2 : if ( stib_type = "PURDUE_MASTER" ) generate
    gbe_imp : gbe_interface
    GENERIC MAP (
--      MAC_ADDRESS => "00:aa:bb:cc:00:1f",
--      IP_ADDRESS => "192.168.1.5",
--      NETMASK => "255.255.255.0",
--      GATEWAY => "192.168.1.102",
--      JUMPERS => false,
--      DHCP => false
      MAC_ADDRESS => "00:80:55:ec:00:05",
      IP_ADDRESS => "192.168.133.5",
      NETMASK => "255.255.255.0",
      GATEWAY => "192.168.133.1",
      JUMPERS => false,
      DHCP => false
    )
    PORT MAP (
      RESET => GMII_RESET,
      RXCLK => GMII_RXCLK,
      RXD => GMII_RXD,
      RXDV => GMII_RXDV,
      RXER => GMII_RXER,
      TXCLK => GMII_TXCLK,
      TXD => GMII_TXD,
      TXEN => GMII_TXEN,
      TXER => GMII_TXER,
      JUMPERED_ADDRESS => JUMPERS,
      BUSCLK => CLK15NS,
      IOBUS => SLAVE_IOBUS(1),
      WRITE_DATA => SLAVE_WRITE_DATA(1),
      IOBUS_READY => SLAVE_READY(1),
      INTERRUPT => INTERRUPT(0),
      STREAM_READ_ENABLE => STREAM_READ_ENABLE,
      STREAM_DOUT => STREAM_DOUT,
      STREAM_LENGTH => STREAM_LENGTH,
      STREAM_CKSUM => STREAM_CKSUM,
      STREAM_STROBE => STREAM_STROBE,
      STREAM_READY => STREAM_READY,
  
      DEBUG => GBE_DEBUG
    );
  end generate;

  tlk_imp : tlkserdes_interface
  PORT MAP (
    BUSCLK => CLK15NS,
    IOBUS => SLAVE_IOBUS(2),
    WRITE_DATA => SLAVE_WRITE_DATA(2),
    IOBUS_READY => SLAVE_READY(2),
    STRIP_DATA_CLK => '0',
    STRIP_DATA => ( others => '0' ),
    STRIP_DATA_WE => '0',
    ENABLE => TLK_ENABLE,
    TESTEN => TLK_TESTEN,
    LOOPEN => TLK_LOOPEN,
    PRBSEN => TLK_PRBSEN,
    LCKREFN => TLK_LCKREFN,
    PREM => TLK_PREM,
    GTXCLK => TLK_GTX_CLK,
    RXCLK => TLK_RXCLK,
    RXDV => TLK_RXDV,
    RXER => TLK_RXER,
    RXD => TLK_RXD,
    TXEN => TLK_TXEN,
    TXER => TLK_TXER,
    TXD => TLK_TXD,
    ENABLEN => SFP_ENABLEN,
    TXDIS => SFP_TXDIS,
    RATESEL => SFP_RS,
    TXFAULT => SFP_TXFAULT,
    MODULE_ABSENT => SFP_MODABS,
    LOSS_OF_SYNC => SFP_LOS
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
    ext_trig => trigger,
    clk_out => bdclk,
    cmd_out => cmd
  );

  iobus_imp : iobus_interface
  GENERIC MAP (
    NSLAVE => NSLAVE
  )
  PORT MAP (
    CLK => CLK15NS,
    MASTER => MASTER_IOBUS,
    IO_READ_DATA => IO_READ_DATA,
    IO_READY => IO_READY,
    SLAVE => SLAVE_IOBUS,
    IO_WRITE_DATA => SLAVE_WRITE_DATA,
    SLAVE_READY => SLAVE_READY
  );

  trigpattern_imp : trigpattern
  GENERIC MAP (
    PATTERN => "01010",
    CLOCK_EDGE => "FALLING",
    WIDTH => 1
  )
  PORT MAP (
    CLK => bdclk_in,
    D => scint_trig,
    TRIGGER => trigger
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

  G_OTHER : FOR I IN 0 TO 7 GENERATE
    other_ibuf : ibufds
    generic map ( iostandard => "LVDS_25",
                  diff_term => true )
    port map (
      i => other_p(i),
      ib => other_n(i),
      o => other(i)
    );
  END GENERATE;

--  Other interfaces...

  led(0) <= onepps;
  led(1) <= '1';

  trigger_debug <= "000000" & cmd & bdclk;
  debug_port <= trigger_debug when debug_select = '0' else bdclk_in & scint_trig & other(5 downto 0);

end RTL;
