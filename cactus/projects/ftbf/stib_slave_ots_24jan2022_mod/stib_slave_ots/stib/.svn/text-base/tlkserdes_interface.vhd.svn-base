--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    07:23:21 12/15/2013 
-- Design Name:    stib
-- Module Name:    tlkserdes_interface - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    TLK3101 serdes slave to hang from the MicroBlaze LMB
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:    Need to re-implement BERT counter
--
-- Register space:
--
--  0000  TLK_CSR          Command/status register
--  0004  TLK_DATA         Write data to TX fifo
--  0010  TLK_RXFIFO       RX spy FIFO
--  0014  TLK_TXFIFO       TX spy FIFO
--  0018  TLK_RXERRCNT     RX error counter
--  001C  TLK_PRBSERRCNT   PRBS error count
--  0020  TLK_RXCOUNT      words received
--  0024  TLK_TXCOUNT      words transmitted
--
--  CSR bit fields:
--
--  Bit  0  R/W  (0)  ENABLE     Drives TLK3101 enable
--       1  R    (0)  TESTEN     Drives TLK3101 TESTEN input (always disabled)
--       2  R/W  (0)  LOOPEN     Drives TLK3101 LOOPEN input (loopback enabled)
--       3  R/W  (0)  PRBSEN     Drives TLK3101 PRBSEN input (PRBS pattern)
--       4  R/W  (0)  LCKREFN    Drives TLK3101 LCKREF_N input (lock to reference when low)
--       5  R/W  (0)  PREM       Drives TLK3101 PREM input (preemphasis enable)
--       6
--       7  R    (-)  RXER       Samples RXERR signal
--       8  R/W  (0)  ENABLEN    Drives SFP ENABLE_N - enabled when low    
--       9  R/W  (0)  TXDIS      Drives SFP TXDIS - disable transmitter when high
--      10  R/W  (0)  RATESEL    Drives SFP ratesel
--      11
--      12  R    (-)  LOS        SFP module loss-of-sync
--      13  R    (-)  ABSENT     SFP module absent
--      14  R    (-)  TXFAULT    SFP TX fault
--      15
--      16  R    (-)  TXEMPTY    RX FIFO empty
--      17  R    (-)  TXFULL     RX FIFO full
--      18  R    (-)  TXVALID    RX FIFO valid
--      19
--      20  R    (-)  TXEMPTY    TX FIFO empty
--      21  R    (-)  TXFULL     TX FIFO full
--      22  R    (-)  TXVALID    TX FIFO valid
--      23
--      24  R    (-)  FIFO_EMPTY FIFO empty
--      25  R    (-)  FIFO_FULL  FIFO full
--  27..26  R/W  (00) DSRC       Data source: 00 = bus,
--                                            01 = BERT counter,
--                                            10 = unused,
--                                            11 = FSSR2 data.
--      28  R/W  (0)  RST_DCM    Reset DCM
--      29  R/W  (0)  RST_COUNT  Reset counters
--      30  R/W  (0)  RST_FIFO   Reset FIFO's
--      31  R    (-)  DCM_LOCKED DCM clock locked signal
--
--  The FIFO's need to be reset before valid data can be sent.  Do this by issuing
--  a reset to the FIFO's before enabling the interface thus:
--  $ poke c3000000 40000000     -- Assert FIFO reset
--  $ poke c3000000 00000001     -- Deassert reset and enable interface
--
--  This seems to be because the TX FIFO comes up in a non-empty state and the
--  interface will be transmitting garbage.
--  
--  To test the TLK serdes in loopback mode do this:
--  $ peek c3000000
--  c3000000 = 81130000
--  $ poke c3000000 40000015            -- Reset the FIFO's and enable loopback
--  c3000000 = 81130000 <-- 40000015
--  $ poke c3000000 15                  -- De-assert FIFO reset
--  c3000000 = c3330015 <-- 00000015
--  $ peek c3000000
--  c3000000 = 81110015                 -- All FIFO's are empty
--  $ poke c3000004 11112222            -- Write a 32-bit word to the FIFO
--  c3000004 = 00000000 <-- 11112222
--  $ peek c3000014                     -- Read the TX fifo
--  c3000014 = 00001111
--  $ peek c3000014                     -- Read the TX fifo
--  c3000014 = 00002222
--  $ peek c3000010                     -- Read the RX fifo
--  c3000010 = 00001111
--  $ peek c3000010                     -- Read the RX fifo
--  c3000010 = 00002222
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library stib;
use stib.iobus.ALL;
use stib.tlkserdes.ALL;

entity tlkserdes_interface is
  port (
    busclk : in std_logic;
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    strip_data_clk : in std_logic;
    strip_data : in std_logic_vector(31 downto 0);
    strip_data_we : in std_logic;
    enable : out std_logic;
    testen : out std_logic;
    loopen : out std_logic;
    prbsen : out std_logic;
    lckrefn : out std_logic;
    prem : out std_logic;
    gtxclk : out std_logic;
    rxclk : in std_logic;
    rxdv : in std_logic;
    rxer : in std_logic;
    rxd : in std_logic_vector(15 downto 0);
    txen : out std_logic;
    txer : out std_logic;
    txd : out std_logic_vector(15 downto 0);
    enablen : out std_logic;
    txdis : out std_logic;
    ratesel : out std_logic;
    txfault : in std_logic;
    module_absent : in std_logic;
    loss_of_sync : in std_logic
  );
end tlkserdes_interface;

architecture RTL of tlkserdes_interface is

  component sb
    port (
      rst : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(15 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(15 downto 0);
      full : out std_logic;
      empty : out std_logic;
      valid : out std_logic
    );
  end component;

  component tlkfifo
    port (
      rst : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(31 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(15 downto 0);
      full : out std_logic;
      empty : out std_logic
    );
  end component;

  constant base_address : std_logic_vector(15 downto 0) := x"c300";
  constant address_mask : std_logic_vector(15 downto 0) := x"ffff";

  constant address_tlk_csr : std_logic_vector(15 downto 0) := x"0000";
  constant address_tlk_data : std_logic_vector(15 downto 0) := x"0004";
  constant address_tlk_rxfifo : std_logic_vector(15 downto 0) := x"0010";
  constant address_tlk_txfifo : std_logic_vector(15 downto 0) := x"0014";
  constant address_tlk_rxerrcnt : std_logic_vector(15 downto 0) := x"0018";
  constant address_tlk_prbserrcnt : std_logic_vector(15 downto 0) := x"001c";
  constant address_tlk_rxcount : std_logic_vector(15 downto 0) := x"0020";
  constant address_tlk_txcount : std_logic_vector(15 downto 0) := x"0024";

  signal masked_address : std_logic_vector(15 downto 0);
  
  signal tlk_csr : std_logic_vector(31 downto 0) := x"00000001";
  signal tlk_rxerrcnt : unsigned(31 downto 0) := x"00000000";
  signal tlk_prbserrcnt : unsigned(31 downto 0) := x"00000000";
  signal tlk_rxcount : unsigned(31 downto 0) := x"00000000";
  signal tlk_txcount : unsigned(31 downto 0) := x"00000000";

  signal rx_fifo_read_enable : std_logic;
  signal rx_fifo_dout : std_logic_vector(15 downto 0);
  signal rx_fifo_data : std_logic_vector(15 downto 0);
  signal rx_fifo_full : std_logic;
  signal rx_fifo_empty : std_logic;
  signal rx_fifo_valid : std_logic;
  signal tx_fifo_read_enable : std_logic;
  signal tx_fifo_dout : std_logic_vector(15 downto 0);
  signal tx_fifo_data : std_logic_vector(15 downto 0);
  signal tx_fifo_full : std_logic;
  signal tx_fifo_empty : std_logic;
  signal tx_fifo_valid : std_logic;
  signal reset_counters : std_logic;
  signal checking_errors : std_logic;

  signal tlkclk_clkfx : std_logic;
  signal tlkclk_fb : std_logic;
  signal tlkclk_clk0 : std_logic;
  signal tlk_dcm_locked : std_logic;
  signal tlk_gtx_clk : std_logic;

  signal dout : std_logic_vector(15 downto 0) := x"0000";
  signal fifo_dout : std_logic_vector(15 downto 0) := x"0000";
  signal fifo_full : std_logic;
  signal fifo_empty : std_logic;
  signal fifo_re : std_logic;   -- not empty 
  signal den : std_logic;

  signal fifo_we : std_logic;
  signal rx_fifo_write_enable : std_logic;
  signal tlk_fifo_data_input : std_logic_vector(31 downto 0);
  signal bert_counter : unsigned(31 downto 0) := x"00000000";

  signal fifo_iobus_we : std_logic;
  signal fifo_bert_we : std_logic;
  signal fifo_iobus_data : std_logic_vector(31 downto 0);

  signal fifo_clk : std_logic;
  signal fifo_clk_sel : std_logic;

  signal r_rxd : std_logic_vector(15 downto 0);
  signal r_rxdv : std_logic;
  signal r_rxer : std_logic;

begin

  tlkclk_dcm : dcm_base
  generic map (
    clkfx_divide => 8,
    clkfx_multiply => 15,
    clkdv_divide => 2.0,
    clkin_divide_by_2 => false,
    clkin_period => 15.0   -- 15 ns when driven from busclk
  )
  port map (
    clk0 => tlkclk_clk0,
    clk180 => open,
    clk270 => open,
    clk90 => open,
    clk2x => open,
    clk2x180 => open,
    clkdv => open,
    clkfx => tlkclk_clkfx,      -- 125 mhz
    clkfx180 => open,
    locked => tlk_dcm_locked,
    clkfb => tlkclk_fb,
    clkin => busclk,           -- 66.667 mhz
    rst => tlk_csr(28)
  );

  tlkclk_fb_bufg : bufg
  port map (
    i => tlkclk_clk0,
    o => tlkclk_fb
  );
  tlk_gtxclk_bufg : bufg
  port map (
    i => tlkclk_clkfx,
    o => tlk_gtx_clk
  );

--  The sb FIFO's have FWFT enabled, so the data out is latched on
--  the rising edge of busclk, coincident with asserting rd_en.
--  On the next rising edge of busclk, the data is advanced.

  rxsb_imp : sb
  port map (
    rst => tlk_csr(30),    -- bit 30 of csr resets fifos
    wr_clk => rxclk,       -- latched data is valid on falling clock edge
    rd_clk => busclk,      -- output data asserted on rising clock edge
    din => r_rxd,            -- input from tlk interface
    wr_en => rx_fifo_write_enable,    -- latched data valid signal
    rd_en => rx_fifo_read_enable,
    dout => rx_fifo_dout,
    full => rx_fifo_full,
    empty => rx_fifo_empty,
    valid => rx_fifo_valid
  );

  txsb_imp : sb
  port map (
    rst => tlk_csr(30),    -- bit 30 of csr resets fifos
    wr_clk => tlk_gtx_clk,   -- Just changed this...
    rd_clk => busclk,
    din => dout,
    wr_en => den,
    rd_en => tx_fifo_read_enable,
    dout => tx_fifo_dout,
    full => tx_fifo_full,
    empty => tx_fifo_empty,
    valid => tx_fifo_valid
  );

--  The tlkfifo component is a standard FIFO so the valid data is
--  presented after the rising edge of rd_clk when rd_en is asserted.
--  In this case, fifo_re allows the valid data to be driven on dout
--  which is latched on the next rising edge of gtx_tlk_clk and driven
--  to the serdes.

  tlkfifo_imp : tlkfifo
  port map (
    rst => tlk_csr(30),
    wr_clk => fifo_clk,
    rd_clk => tlk_gtx_clk,
    din => tlk_fifo_data_input,
    wr_en => fifo_we,
    rd_en => fifo_re,
    dout => fifo_dout,
    full => fifo_full,
    empty => fifo_empty
  );

  fifoclkmux : bufgmux
  port map (
    i0 => busclk,
    i1 => strip_data_clk,
    o => fifo_clk,
    s => fifo_clk_sel
  );
  gtxclk <= tlk_gtx_clk;

  process ( rxclk ) begin
    if ( rxclk'event and rxclk = '1' ) then
      r_rxd <= rxd;
      r_rxdv <= rxdv;
      r_rxer <= rxer;
    end if;
  end process;

  process ( busclk ) begin
    if ( busclk'event and busclk = '1' ) then
      if ( iobus.io_addr_strobe = '1' and masked_address = base_address ) then
        iobus_ready <= '1';
        if ( iobus.io_write_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_tlk_csr =>
              tlk_csr <= iobus.io_write_data;
              tlk_csr(1) <= '0';    -- should always be tied low
            when address_tlk_data =>
              fifo_iobus_data <= iobus.io_write_data;
              fifo_iobus_we <= '1';
            when others =>

          end case;
        end if;

        if ( iobus.io_read_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_tlk_csr =>
              write_data <= tlk_dcm_locked & tlk_csr(30 downto 26) & fifo_full & fifo_empty &
                            tlk_csr(23) & tx_fifo_valid & tx_fifo_full & tx_fifo_empty &
                            tlk_csr(19) & rx_fifo_valid & rx_fifo_full & rx_fifo_empty &
                            tlk_csr(15) & txfault & module_absent & loss_of_sync &
                            tlk_csr(11 downto 8) & rxer & tlk_csr(6 downto 0);
            when address_tlk_data =>
              write_data <= fifo_iobus_data;
            when address_tlk_rxfifo =>
              write_data <= x"0000" & rx_fifo_dout;
              rx_fifo_read_enable <= '1';
            when address_tlk_txfifo =>
              write_data <= x"0000" & tx_fifo_dout;
              tx_fifo_read_enable <= '1';
            when address_tlk_rxerrcnt =>
              write_data <= std_logic_vector(tlk_rxerrcnt);
            when address_tlk_prbserrcnt =>
              write_data <= std_logic_vector(tlk_prbserrcnt);
            when address_tlk_rxcount =>
              write_data <= std_logic_vector(tlk_rxcount);
            when address_tlk_txcount =>
              write_data <= std_logic_vector(tlk_txcount);
            when others =>

          end case;
        end if;
      else
        iobus_ready <= '0';
        rx_fifo_read_enable <= '0';
        tx_fifo_read_enable <= '0';
        fifo_iobus_we <= '0';
      end if;
    end if;

--  BERT_COUNTER <= BERT_COUNTER + 1;

  end process;

  process ( rxclk, reset_counters, checking_errors, r_rxer, r_rxdv ) begin
    if ( rxclk'event and rxclk = '1' ) then
      if ( reset_counters = '1' ) then
        tlk_rxerrcnt <= ( others => '0' );
        tlk_prbserrcnt <= ( others => '0' );
        tlk_rxcount <= ( others => '0' );
      elsif ( checking_errors = '1' and r_rxer = '1' and r_rxdv = '1' ) then
        tlk_rxerrcnt <= tlk_rxerrcnt + 1;
      elsif ( checking_errors = '0' and r_rxer = '0' ) then
        tlk_prbserrcnt <= tlk_prbserrcnt + 1;
      end if;
      if ( r_rxer = '0' and r_rxdv = '1' ) then
        tlk_rxcount <= tlk_rxcount + 1;
      end if;
    end if;
  end process;

  process ( rxclk ) begin
    if ( rxclk'event and rxclk = '0' ) then
      reset_counters <= tlk_csr(29);
      checking_errors <= not tlk_csr(3);   -- don't count errors when prbsen is asserted
    end if;
  end process;

  process ( tlk_gtx_clk, fifo_empty ) begin
    if ( tlk_gtx_clk'event and tlk_gtx_clk = '1' ) then
      if ( reset_counters = '1' ) then
        tlk_txcount <= ( others => '0' );
      elsif ( fifo_re = '1' ) then
        tlk_txcount <= tlk_txcount + 1;
      end if;
      den <= fifo_re;
      dout <= fifo_dout;
    end if;
  end process;
  fifo_re <= not ( fifo_empty or tlk_csr(30) );
  txer <= '0';
  txen <= den;
  txd <= dout;

  enable <= tlk_csr(0);
  testen <= tlk_csr(1);
  loopen <= tlk_csr(2);
  prbsen <= tlk_csr(3);
  lckrefn <= tlk_csr(4);
  prem <= tlk_csr(5);
  enablen <= tlk_csr(8);
  txdis <= tlk_csr(9);
  ratesel <= tlk_csr(10);

  fifo_clk_sel <= '1' when tlk_csr(27 downto 26) = "11" else '0';
  
  rx_fifo_write_enable <= r_rxdv and not rx_fifo_full;

  masked_address <= iobus.io_address(31 downto 16) and address_mask;

  tlk_fifo_data_input <= fifo_iobus_data when tlk_csr(27 downto 26) = "00" else
                         std_logic_vector(bert_counter) when tlk_csr(27 downto 26) = "01" else
                         strip_data when tlk_csr(27 downto 26) = "11" else
                         x"f7f7f7f7";

  fifo_we <= fifo_iobus_we when tlk_csr(27 downto 26) = "00" else
             fifo_bert_we when tlk_csr(27 downto 26) = "01" else
             strip_data_we when tlk_csr(27 downto 26) = "11" else '0';

end RTL;
