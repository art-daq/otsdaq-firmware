--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : TOP_LEVEL.vhf
-- /___/   /\     Timestamp : 07/29/2015 09:41:45
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family kintex7 -flat -suppress -vhdl D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.vhf -w D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.sch
--Design Name: TOP_LEVEL
--Device: kintex7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;


use work.iobus.ALL;

entity top is
    GENERIC ( NSENSOR_PADS : INTEGER := 1 );
   port ( PHY_RESET      : in    std_logic; 
          PHY_RXCLK      : in    std_logic; 
          PHY_RXCTL_DV   : in    std_logic; 
          PHY_RXD0       : in    std_logic; 
          PHY_RXD1       : in    std_logic; 
          PHY_RXD2       : in    std_logic; 
          PHY_RXD3       : in    std_logic; 
                    --PHY_RXD4       : in    std_logic; 
                    --PHY_RXD5       : in    std_logic; 
                    --PHY_RXD6       : in    std_logic; 
                    --PHY_RXD7       : in    std_logic; 
                    --PHY_RXER       : in    std_logic; 
                    --USER_CLOCK     : in    std_logic; 
          
          PZ_ULED_1      : out   std_logic;
          
          PHY_TXCTL_EN   : out   std_logic; 
          PHY_TXC_GTXCLK : out   std_logic; 
          PHY_TXD0       : out   std_logic; 
          PHY_TXD1       : out   std_logic; 
          PHY_TXD2       : out   std_logic; 
          PHY_TXD3       : out   std_logic;
                    --PHY_TXD4       : out   std_logic; 
                    --PHY_TXD5       : out   std_logic; 
                    --PHY_TXD6       : out   std_logic; 
                    --PHY_TXD7       : out   std_logic; 
                    --PHY_TXER       : out   std_logic);
          
          
        STRIP_RESET_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_RESET_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_SHIFT_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_SHIFT_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_SCIN_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0); 
        STRIP_SCIN_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_SCOUT_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0); 
        STRIP_SCOUT_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_BCOCLK_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_BCOCLK_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_MCLKA0_PAD_P : OUT STD_LOGIC;
        STRIP_MCLKA0_PAD_N : OUT STD_LOGIC;
        STRIP_MCLKB0_PAD_P : OUT STD_LOGIC;
        STRIP_MCLKB0_PAD_N : OUT STD_LOGIC;
        STRIP_MCLKA1_PAD_P : OUT STD_LOGIC;
        STRIP_MCLKA1_PAD_N : OUT STD_LOGIC;
        STRIP_MCLKB1_PAD_P : OUT STD_LOGIC;
        STRIP_MCLKB1_PAD_N : OUT STD_LOGIC;
        STRIP_OUT1_0_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_0_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_1_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_1_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_2_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_2_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_3_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_3_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_4_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_OUT1_4_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_GOTHITOR_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
        STRIP_GOTHITOR_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0)
              
          ); 
end top;

architecture BEHAVIORAL of top is
  
    
    attribute BOX_TYPE     : string ;
    attribute IOSTANDARD   : string ;
    attribute CAPACITANCE  : string ;
    attribute SLEW         : string ;
    attribute DRIVE        : string ;
    attribute IBUF_LOW_PWR : string ;
    
    signal b_data                   : std_logic_vector (63 downto 0);
    signal b_data_we                : std_logic;
    signal GMII_RXD_0_sig           : std_logic_vector (7 downto 0);
    signal GMII_RX_DV_0_sig         : std_logic;
    signal GMII_RX_ER_0_sig         : std_logic;
    signal GTX_CLK_0_sig            : std_logic;
    signal MASTER_CLK               : std_logic;
    signal CLK15NS, CLK15NS_sig     : std_logic;    
                                
    signal iobus : iobus_t;
   
    signal gec_mac, gec_user_src_mac       : std_logic_vector (47 downto 0);
    signal gec_port, gec_user_src_port     : std_logic_vector (15 downto 0);
    signal gec_addrs, gec_user_src_addrs   : std_logic_vector (7 downto 0); 
    
    signal gec_user_src_capture                  : std_logic;    
    
    signal reset_btn : std_logic;
    signal gnd : std_logic;
   
    
    signal PHY_TXD_sig              : std_logic_vector (7 downto 0);
    signal PHY_TXEN_sig             : std_logic;
    signal PHY_TXER_sig             : std_logic;
    signal psi_status               : std_logic_vector (63 downto 0);
    signal reset                    : std_logic;
    signal reset_button             : std_logic;
    signal reset_n                  : std_logic;
    signal rx_addr                  : std_logic_vector (63 downto 0);
    signal rx_data                  : std_logic_vector (63 downto 0);
    signal rx_wren                  : std_logic;
    signal secondary_clk, secondary_clk_sig       : std_logic;
    signal tx_data                  : std_logic_vector (63 downto 0);
   
   
   
    SIGNAL STRIP_MCLKA : STD_LOGIC;
    SIGNAL STRIP_MCLKB : STD_LOGIC;
    SIGNAL STRIP_BCOCLK : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_RESET : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_SHIFT : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_SCIN : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_SCOUT : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_0 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_1 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_2 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_3 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_4 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_DATA_AVAILABLE : STD_LOGIC;
    SIGNAL STRIP_SYNC_ERROR : STD_LOGIC;
    SIGNAL STRIP_BCO_ZERO : STD_LOGIC;
    SIGNAL STRIP_HITOR : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);

     
     
   
    attribute mark_debug : string;
    attribute mark_debug of MASTER_CLK : signal is "true";
    attribute mark_debug of secondary_clk : signal is "true";
    attribute mark_debug of PHY_TXD_sig : signal is "true";
    attribute mark_debug of PHY_TXEN_sig : signal is "true";
    attribute mark_debug of rx_wren : signal is "true";
    
        --    attribute mark_debug of GMII_RXD_0_sig : signal is "true";
        --    attribute mark_debug of GMII_RX_DV_0_sig : signal is "true";
        --    attribute mark_debug of rx_addr : signal is "true";
        --    attribute mark_debug of rx_data : signal is "true";
       
   
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component IBUFG
      -- synopsys translate_off
      generic( IBUF_LOW_PWR : boolean :=  TRUE);
      -- synopsys translate_on
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute IBUF_LOW_PWR of IBUFG : component is "TRUE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
     
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component reset_mgr
      port ( slow_clk    : in    std_logic; 
             reset_start : in    std_logic; 
             reset       : out   std_logic);
   end component;
   
   
   
begin
    gnd <= '0';
    
    reset_n <= not reset;
   
   reset_ibuf : IBUF       -- SW3 on board is active high
      port map (I=>PHY_RESET,  O=>reset_btn);
   user_led1: OBUF   -- LED display of RESET
      port map (I=>reset,    O=>PZ_ULED_1);        
      
   
   -- start simple OEI
  eth_interface : entity work.Ethernet_Interface
      port map (b_data(63 downto 0)=>b_data(63 downto 0),
                b_data_we=>b_data_we,
                PHY_RXD(7 downto 0)=>GMII_RXD_0_sig(7 downto 0),
                PHY_RX_DV=>GMII_RX_DV_0_sig,
                PHY_RX_ER=>GMII_RX_ER_0_sig,
                MASTER_CLK=>MASTER_CLK,                
                reset_in=>reset_btn,
                reset_out => reset,
                tx_data(63 downto 0)=>tx_data(63 downto 0),
                b_enable=>open,
                TX_CLK=>GTX_CLK_0_sig,
                PHY_TXD(7 downto 0)=>PHY_TXD_sig(7 downto 0),
                PHY_TX_EN=>PHY_TXEN_sig,
                PHY_TX_ER=>PHY_TXER_sig,
                rx_addr(63 downto 0)=>rx_addr(63 downto 0),
                rx_data(63 downto 0)=>rx_data(63 downto 0),
                rx_wren=>rx_wren);
                     
  -- end simple OEI
  
     
   
   
   makeSlowClock : for i in 0 to 0 generate
        signal cnt : unsigned(4 downto 0) := (others => '0');
   begin
        secondary_clk_sig <= cnt(4); -- 32 times slower clock than MASTER_CLK 
        CLK15NS_sig <= cnt(0); -- 2 times slower clock than MASTER_CLK
        process(MASTER_CLK)
        begin
            if (rising_edge(MASTER_CLK)) then
                cnt <= cnt + 1;        
            end if;
        end process;   
   end generate;
   
   CLK5MHz_bufg : BUFG
      port map (I=>secondary_clk_sig,  O=>secondary_clk);
      
   CLK15NS_bufg : BUFG
    port map (I=>CLK15NS_sig,  O=>CLK15NS);
      

      
    iobus.IO_Addr_Strobe <= '1';
    iobus.IO_Read_Strobe <= '1';
    iobus.IO_Write_Strobe <= rx_wren;
    iobus.IO_Address <= rx_addr(31 downto 0);
    iobus.IO_Byte_Enable <= x"F";
    iobus.IO_Write_Data <= rx_data(31 downto 0);
                
    tx_data(63 downto 32) <= x"ABCD0000";
                
    strip_imp : entity work.strip_interface
     GENERIC MAP ( NSENSOR => NSENSOR_PADS )
     PORT MAP (
       CLK => CLK15NS,
       IOBUS => iobus, --SLAVE_IOBUS(3),
       WRITE_DATA => tx_data(31 downto 0), --SLAVE_WRITE_DATA(3),
       IOBUS_READY => open, --SLAVE_READY(3),
       CLKX => CLK15NS,
       CLKY => secondary_clk,--CLK5MHZ,
       EXT_CLK => gnd,--EXT_CLK,
       EXT_TRIG => gnd,--TRIGGER,
       EXT_HALT => gnd,--HALT,
       EXT_START => gnd,--START,
       DAC_CS => open,--STRIP_DAC_CS,
       DAC_SDI => open,--STRIP_DAC_SDI,
       DAC_SDO => gnd,--STRIP_DAC_SDO,
       DAC_SCLK => open,--STRIP_DAC_SCLK,
       DAC_RESET => open,--STRIP_DAC_RESET,
       DAC_BUSAB => open,--STRIP_DAC_BUSAB,
       DAC_CLK => open,--STRIP_DAC_CLK,
       DAC_DATACLK => open,--STRIP_DAC_DATACLK,
       MCLKA => STRIP_MCLKA,
       MCLKB => STRIP_MCLKB,
       BCOCLK => STRIP_BCOCLK,
       RESET => STRIP_RESET,
       SHIFT => STRIP_SHIFT,
       SCIN => STRIP_SCIN,
       SCOUT => STRIP_SCOUT,
       OUT1_0 => STRIP_OUT1_0,
       OUT1_1 => STRIP_OUT1_1,
       OUT1_2 => STRIP_OUT1_2,
       OUT1_3 => STRIP_OUT1_3,
       OUT1_4 => STRIP_OUT1_4,
       HITOR => STRIP_HITOR,
       DATA_AVAILABLE => open,--STRIP_DATA_AVAILABLE,
       SYNC_ERROR => open,--STRIP_SYNC_ERROR,
       BCO_ZERO => open,--STRIP_BCO_ZERO,
       STREAM_RCLK => MASTER_CLK,--GMII_RXCLK,
       STREAM_READ_ENABLE => gnd,--STREAM_READ_ENABLE,
       STREAM_DOUT => open,--STREAM_DOUT,
       STREAM_LENGTH => open,--STREAM_LENGTH,
       STREAM_CKSUM => open,--STREAM_CKSUM,
       STREAM_STROBE => open,--STREAM_STROBE,
       STREAM_READY => gnd,--STREAM_READY,
       SERDES_DATA => open,--SERDES_STRIP_DATA,
       SERDES_DATA_WE => open,--SERDES_STRIP_DATA_WE,
       STRIP_DEBUG => open,--STRIP_DEBUG,
       DEBUG_SELECT => open--STRIP_DEBUG_SELECT
     );
   
    -----------------------
    ----------------------- IBUF 's 
    
     XLXI_4178 : IBUF
      port map (I=>PHY_RXCTL_DV,  O=>GMII_RX_DV_0_sig);
      
     GMII_RXD_0_sig(7 downto 4) <= x"0";
     
     XLXI_4218 : IBUF
        port map (I=>PHY_RXD3, O=>GMII_RXD_0_sig(3));
     
     XLXI_4219 : IBUF
        port map (I=>PHY_RXD2, O=>GMII_RXD_0_sig(2));
     
     XLXI_4220 : IBUF
        port map (I=>PHY_RXD1, O=>GMII_RXD_0_sig(1));
     
     XLXI_4221 : IBUF
        port map (I=>PHY_RXD0, O=>GMII_RXD_0_sig(0));   
     
     GMII_RX_ER_0_sig <= '0';
     
     XLXI_4253 : IBUFG
        port map (I=>PHY_RXCLK,  O=>MASTER_CLK);
        
    -----------------------
    ----------------------- OBUF 's 
    
     XLXI_4177 : OBUF
       port map (I=>PHY_TXEN_sig,  O=>PHY_TXCTL_EN);
    
    XLXI_4179 : OBUF
       port map (I=>GTX_CLK_0_sig, O=>PHY_TXC_GTXCLK);
    
    XLXI_4181 : OBUF
       port map (I=>PHY_TXD_sig(3), O=>PHY_TXD3);
    
    XLXI_4182 : OBUF
       port map (I=>PHY_TXD_sig(2), O=>PHY_TXD2);
    
    XLXI_4183 : OBUF
       port map (I=>PHY_TXD_sig(1), O=>PHY_TXD1);
    
    XLXI_4184 : OBUF
       port map (I=>PHY_TXD_sig(0), O=>PHY_TXD0);
           
           
    -----------------------
    ----------------------- Strip Pad O/I BUF 's 
    
     strip_mclka0_obuf : OBUFDS
     GENERIC MAP ( IOSTANDARD => "LVDS_25" )
     PORT MAP (
       I => STRIP_MCLKA,
       O => STRIP_MCLKA0_PAD_P,
       OB => STRIP_MCLKA0_PAD_N
     );
     strip_mclkb0_obuf : OBUFDS
     GENERIC MAP ( IOSTANDARD => "LVDS_25" )
     PORT MAP (
       I => STRIP_MCLKB,
       O => STRIP_MCLKB0_PAD_P,
       OB => STRIP_MCLKB0_PAD_N
     );
     
    strip_pad_gen : FOR I IN 0 TO NSENSOR_PADS-1 GENERATE
        strip_reset_obuf : OBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25" )
        PORT MAP (
          I => STRIP_RESET(I),
          O => STRIP_RESET_PAD_P(I),
          OB => STRIP_RESET_PAD_N(I)
        );
        strip_shift_obuf : OBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25" )
        PORT MAP (
          I => STRIP_SHIFT(I),
          O => STRIP_SHIFT_PAD_P(I),
          OB => STRIP_SHIFT_PAD_N(I)
        );
        strip_scout_obuf : OBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25" )
        PORT MAP (
          I => STRIP_SCIN(I),
          O => STRIP_SCIN_PAD_P(I),
          OB => STRIP_SCIN_PAD_N(I)
        );
        strip_bcoclk_obuf : OBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25" )
        PORT MAP (
          I => STRIP_BCOCLK(I),
          O => STRIP_BCOCLK_PAD_P(I),
          OB => STRIP_BCOCLK_PAD_N(I)
        );
        
        strip_scout_ibuf : IBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25",
                      DIFF_TERM => TRUE )
        PORT MAP (
          I => STRIP_SCOUT_PAD_P(I),
          IB => STRIP_SCOUT_PAD_N(I),
          O => STRIP_SCOUT(I)
        );
        strip_out1_0_ibuf : IBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25",
                      DIFF_TERM => TRUE )
        PORT MAP (
          I => STRIP_OUT1_0_PAD_P(I),
          IB => STRIP_OUT1_0_PAD_N(I),
          O => STRIP_OUT1_0(I)
        );
        strip_out1_1_ibuf : IBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25",
                      DIFF_TERM => TRUE )
        PORT MAP (
          I => STRIP_OUT1_1_PAD_P(I),
          IB => STRIP_OUT1_1_PAD_N(I),
          O => STRIP_OUT1_1(I)
        );
        strip_out1_2_ibuf : IBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25",
                      DIFF_TERM => TRUE )
        PORT MAP (
          I => STRIP_OUT1_2_PAD_P(I),
          IB => STRIP_OUT1_2_PAD_N(I),
          O => STRIP_OUT1_2(I)
        );
        strip_out1_3_ibuf : IBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25",
                      DIFF_TERM => TRUE )
        PORT MAP (
          I => STRIP_OUT1_3_PAD_P(I),
          IB => STRIP_OUT1_3_PAD_N(I),
          O => STRIP_OUT1_3(I)
        );
        strip_out1_4_ibuf : IBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25",
                      DIFF_TERM => TRUE )
        PORT MAP (
          I => STRIP_OUT1_4_PAD_P(I),
          IB => STRIP_OUT1_4_PAD_N(I),
          O => STRIP_OUT1_4(I)
        );
        
        hitor_ibuf : IBUFDS
        GENERIC MAP ( IOSTANDARD => "LVDS_25",
                      DIFF_TERM => TRUE )
        PORT MAP (
          I => STRIP_GOTHITOR_PAD_P(I),
          IB => STRIP_GOTHITOR_PAD_N(I),
          O => STRIP_HITOR(I)
        );
    
    END GENERATE;
end BEHAVIORAL;

