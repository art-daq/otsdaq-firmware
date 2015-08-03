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
--Command: sch2hdl -intstyle ise -family kintex7 -flat -suppress -vhdl D:/Projects/CAPTANplusX/fw_00/GEL_CAPTAN/TOP_LEVEL.vhf -w D:/Projects/CAPTANplusX/fw_00/GEL_CAPTAN/TOP_LEVEL.sch
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

entity TOP_LEVEL is
   port ( PHY_RESET      : in    std_logic; 
          PHY_RXCLK      : in    std_logic; 
          PHY_RXCTL_DV   : in    std_logic; 
          PHY_RXD0       : in    std_logic; 
          PHY_RXD1       : in    std_logic; 
          PHY_RXD2       : in    std_logic; 
          PHY_RXD3       : in    std_logic; 
          PHY_RXD4       : in    std_logic; 
          PHY_RXD5       : in    std_logic; 
          PHY_RXD6       : in    std_logic; 
          PHY_RXD7       : in    std_logic; 
          PHY_RXER       : in    std_logic; 
          USER_CLOCK     : in    std_logic; 
          PHY_TXCTL_EN   : out   std_logic; 
          PHY_TXC_GTXCLK : out   std_logic; 
          PHY_TXD0       : out   std_logic; 
          PHY_TXD1       : out   std_logic; 
          PHY_TXD2       : out   std_logic; 
          PHY_TXD3       : out   std_logic; 
          PHY_TXD4       : out   std_logic; 
          PHY_TXD5       : out   std_logic; 
          PHY_TXD6       : out   std_logic; 
          PHY_TXD7       : out   std_logic; 
          PHY_TXER       : out   std_logic);
end TOP_LEVEL;

architecture BEHAVIORAL of TOP_LEVEL is
   attribute HU_SET       : string ;
   attribute BOX_TYPE     : string ;
   attribute IOSTANDARD   : string ;
   attribute CAPACITANCE  : string ;
   attribute SLEW         : string ;
   attribute DRIVE        : string ;
   attribute IBUF_LOW_PWR : string ;
   signal b_data                   : std_logic_vector (63 downto 0);
   signal b_data_we                : std_logic;
   signal gec_addrs                : std_logic_vector (7 downto 0);
   signal GEC_DEST_ADDRS_MAP       : std_logic;
   signal GEC_DEST_MACPORT_MAP     : std_logic;
   signal gec_macport              : std_logic_vector (63 downto 0);
   signal gec_user_addrs           : std_logic_vector (7 downto 0);
   signal GLOBAL_RESET_MAP         : std_logic;
   signal GMII_RXD_0_sig           : std_logic_vector (7 downto 0);
   signal GMII_RX_DV_0_sig         : std_logic;
   signal GMII_RX_ER_0_sig         : std_logic;
   signal GTX_CLK_0_sig            : std_logic;
   signal MASTER_CLK               : std_logic;
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
   signal secondary_clk            : std_logic;
   signal software_reset           : std_logic;
   signal tx_data                  : std_logic_vector (63 downto 0);
   signal user_clk                 : std_logic;
   signal XLXN_12498               : std_logic;
   signal XLXN_12503               : std_logic;
   signal XLXN_12617               : std_logic;
   signal XLXN_15755               : std_logic;
   signal XLXN_18129               : std_logic;
   signal XLXN_18132               : std_logic;
   signal XLXN_18133               : std_logic;
   signal XLXN_18134               : std_logic;
   signal XLXN_18137               : std_logic;
   signal XLXN_18138               : std_logic;
   signal XLXN_18147               : std_logic;
   signal XLXN_18148               : std_logic;
   signal XLXN_18149               : std_logic;
   signal XLXN_18150               : std_logic;
   signal XLXN_18178               : std_logic;
   signal XLXN_18179               : std_logic;
   signal XLXN_18180               : std_logic;
   signal XLXN_18181               : std_logic;
   signal XLXN_18184               : std_logic;
   signal XLXN_18197               : std_logic;
   signal XLXN_18216               : std_logic;
   signal XLXI_5338_in1_openSignal : std_logic_vector (63 downto 0);
   signal XLXI_5338_in2_openSignal : std_logic_vector (63 downto 0);
   signal XLXI_5338_in3_openSignal : std_logic_vector (63 downto 0);
   signal XLXI_5338_in4_openSignal : std_logic_vector (63 downto 0);
   signal XLXI_5338_in5_openSignal : std_logic_vector (63 downto 0);
   signal XLXI_5338_in6_openSignal : std_logic_vector (63 downto 0);
   signal XLXI_5338_in7_openSignal : std_logic_vector (63 downto 0);
   component D4_16E_HXILINX_TOP_LEVEL
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             E   : in    std_logic; 
             D0  : out   std_logic; 
             D1  : out   std_logic; 
             D10 : out   std_logic; 
             D11 : out   std_logic; 
             D12 : out   std_logic; 
             D13 : out   std_logic; 
             D14 : out   std_logic; 
             D15 : out   std_logic; 
             D2  : out   std_logic; 
             D3  : out   std_logic; 
             D4  : out   std_logic; 
             D5  : out   std_logic; 
             D6  : out   std_logic; 
             D7  : out   std_logic; 
             D8  : out   std_logic; 
             D9  : out   std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component FDRE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             R  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDRE : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VERSION_BLK
      port ( version : out   std_logic_vector (7 downto 0));
   end component;
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component MUX64_8
      port ( in0    : in    std_logic_vector (63 downto 0); 
             in1    : in    std_logic_vector (63 downto 0); 
             in2    : in    std_logic_vector (63 downto 0); 
             in3    : in    std_logic_vector (63 downto 0); 
             in4    : in    std_logic_vector (63 downto 0); 
             in5    : in    std_logic_vector (63 downto 0); 
             in6    : in    std_logic_vector (63 downto 0); 
             in7    : in    std_logic_vector (63 downto 0); 
             sel    : in    std_logic_vector (2 downto 0); 
             muxout : out   std_logic_vector (63 downto 0));
   end component;
   
   component Ethernet_Interface_MUSER_TOP_LEVEL
      port ( MASTER_CLK           : in    std_logic; 
             reset                : in    std_logic; 
             b_data_we            : in    std_logic; 
             b_data               : in    std_logic_vector (63 downto 0); 
             tx_data              : in    std_logic_vector (63 downto 0); 
             GMII_RX_DV           : in    std_logic; 
             GMII_RX_ER           : in    std_logic; 
             GMII_RXD             : in    std_logic_vector (7 downto 0); 
             gec_user_addrs       : in    std_logic_vector (7 downto 0); 
             gec_user_dest_addrs  : in    std_logic_vector (7 downto 0); 
             gec_user_dest_mac    : in    std_logic_vector (47 downto 0); 
             gec_user_dest_port   : in    std_logic_vector (15 downto 0); 
             rx_data              : out   std_logic_vector (63 downto 0); 
             rx_addr              : out   std_logic_vector (63 downto 0); 
             rx_wren              : out   std_logic; 
             b_enable             : out   std_logic; 
             GTX_CLK              : out   std_logic; 
             PHY_TX_EN            : out   std_logic; 
             PHY_TXD              : out   std_logic_vector (7 downto 0); 
             PHY_TX_ER            : out   std_logic; 
             gec_user_src_capture : out   std_logic; 
             gec_user_src_addrs   : out   std_logic_vector (7 downto 0); 
             gec_user_src_mac     : out   std_logic_vector (47 downto 0); 
             gec_user_src_port    : out   std_logic_vector (15 downto 0));
   end component;
   
   component fd_64
      port ( Q  : out   std_logic_vector (63 downto 0); 
             CE : in    std_logic; 
             D  : in    std_logic_vector (63 downto 0); 
             C  : in    std_logic; 
             R  : in    std_logic);
   end component;
   
   component FD8RE_HXILINX_TOP_LEVEL
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic_vector (7 downto 0); 
             R  : in    std_logic; 
             Q  : out   std_logic_vector (7 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component FTC_HXILINX_TOP_LEVEL
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
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
   
   attribute HU_SET of XLXI_3432 : label is "XLXI_3432_7";
   attribute HU_SET of XLXI_4677 : label is "XLXI_4677_8";
   attribute HU_SET of XLXI_6015 : label is "XLXI_6015_9";
   attribute HU_SET of XLXI_6032 : label is "XLXI_6032_6";
   attribute HU_SET of XLXI_6035 : label is "XLXI_6035_2";
   attribute HU_SET of XLXI_6040 : label is "XLXI_6040_3";
   attribute HU_SET of XLXI_6055 : label is "XLXI_6055_4";
   attribute HU_SET of XLXI_6058 : label is "XLXI_6058_5";
begin
   XLXI_3432 : D4_16E_HXILINX_TOP_LEVEL
      port map (A0=>rx_addr(8),
                A1=>rx_addr(9),
                A2=>rx_addr(10),
                A3=>rx_addr(11),
                E=>XLXN_12617,
                D0=>open,
                D1=>open,
                D2=>open,
                D3=>open,
                D4=>open,
                D5=>open,
                D6=>open,
                D7=>GLOBAL_RESET_MAP,
                D8=>open,
                D9=>open,
                D10=>open,
                D11=>open,
                D12=>open,
                D13=>open,
                D14=>open,
                D15=>open);
   
   XLXI_3469 : OR2
      port map (I0=>reset_button,
                I1=>software_reset,
                O=>XLXN_18197);
   
   XLXI_3521 : AND2
      port map (I0=>reset,
                I1=>secondary_clk,
                O=>XLXN_12503);
   
   XLXI_3522 : OR2
      port map (I0=>XLXN_12503,
                I1=>MASTER_CLK,
                O=>XLXN_12498);
   
   XLXI_3523 : FDRE
      port map (C=>XLXN_12498,
                CE=>GLOBAL_RESET_MAP,
                D=>rx_data(0),
                R=>reset,
                Q=>software_reset);
   
   XLXI_4007 : INV
      port map (I=>reset,
                O=>reset_n);
   
   XLXI_4177 : OBUF
      port map (I=>PHY_TXEN_sig,
                O=>PHY_TXCTL_EN);
   
   XLXI_4178 : IBUF
      port map (I=>PHY_RXCTL_DV,
                O=>GMII_RX_DV_0_sig);
   
   XLXI_4179 : OBUF
      port map (I=>GTX_CLK_0_sig,
                O=>PHY_TXC_GTXCLK);
   
   XLXI_4181 : OBUF
      port map (I=>PHY_TXD_sig(3),
                O=>PHY_TXD3);
   
   XLXI_4182 : OBUF
      port map (I=>PHY_TXD_sig(2),
                O=>PHY_TXD2);
   
   XLXI_4183 : OBUF
      port map (I=>PHY_TXD_sig(1),
                O=>PHY_TXD1);
   
   XLXI_4184 : OBUF
      port map (I=>PHY_TXD_sig(0),
                O=>PHY_TXD0);
   
   XLXI_4213 : IBUF
      port map (I=>PHY_RXD7,
                O=>GMII_RXD_0_sig(7));
   
   XLXI_4214 : IBUF
      port map (I=>PHY_RXD6,
                O=>GMII_RXD_0_sig(6));
   
   XLXI_4216 : IBUF
      port map (I=>PHY_RXD5,
                O=>GMII_RXD_0_sig(5));
   
   XLXI_4217 : IBUF
      port map (I=>PHY_RXD4,
                O=>GMII_RXD_0_sig(4));
   
   XLXI_4218 : IBUF
      port map (I=>PHY_RXD3,
                O=>GMII_RXD_0_sig(3));
   
   XLXI_4219 : IBUF
      port map (I=>PHY_RXD2,
                O=>GMII_RXD_0_sig(2));
   
   XLXI_4220 : IBUF
      port map (I=>PHY_RXD1,
                O=>GMII_RXD_0_sig(1));
   
   XLXI_4221 : IBUF
      port map (I=>PHY_RXD0,
                O=>GMII_RXD_0_sig(0));
   
   XLXI_4246 : OBUF
      port map (I=>PHY_TXER_sig,
                O=>PHY_TXER);
   
   XLXI_4247 : OBUF
      port map (I=>PHY_TXD_sig(4),
                O=>PHY_TXD4);
   
   XLXI_4248 : IBUF
      port map (I=>PHY_RXER,
                O=>GMII_RX_ER_0_sig);
   
   XLXI_4249 : OBUF
      port map (I=>PHY_TXD_sig(5),
                O=>PHY_TXD5);
   
   XLXI_4250 : OBUF
      port map (I=>PHY_TXD_sig(6),
                O=>PHY_TXD6);
   
   XLXI_4251 : OBUF
      port map (I=>PHY_TXD_sig(7),
                O=>PHY_TXD7);
   
   XLXI_4253 : IBUFG
      port map (I=>PHY_RXCLK,
                O=>MASTER_CLK);
   
   XLXI_4263 : GND
      port map (G=>gec_user_addrs(4));
   
   XLXI_4264 : GND
      port map (G=>gec_user_addrs(5));
   
   XLXI_4265 : GND
      port map (G=>gec_user_addrs(6));
   
   XLXI_4266 : GND
      port map (G=>gec_user_addrs(7));
   
   XLXI_4359 : VERSION_BLK
      port map (version(7 downto 0)=>psi_status(63 downto 56));
   
   XLXI_4620 : GND
      port map (G=>gec_user_addrs(3));
   
   XLXI_4677 : D4_16E_HXILINX_TOP_LEVEL
      port map (A0=>rx_addr(8),
                A1=>rx_addr(9),
                A2=>rx_addr(10),
                A3=>rx_addr(11),
                E=>XLXN_15755,
                D0=>open,
                D1=>open,
                D2=>open,
                D3=>open,
                D4=>open,
                D5=>open,
                D6=>open,
                D7=>open,
                D8=>open,
                D9=>GEC_DEST_MACPORT_MAP,
                D10=>GEC_DEST_ADDRS_MAP,
                D11=>open,
                D12=>open,
                D13=>open,
                D14=>open,
                D15=>open);
   
   XLXI_4696 : AND2
      port map (I0=>rx_addr(12),
                I1=>rx_wren,
                O=>XLXN_15755);
   
   XLXI_4697 : AND2B1
      port map (I0=>rx_addr(12),
                I1=>rx_wren,
                O=>XLXN_12617);
   
   XLXI_5338 : MUX64_8
      port map (in0(63 downto 0)=>psi_status(63 downto 0),
                in1(63 downto 0)=>XLXI_5338_in1_openSignal(63 downto 0),
                in2(63 downto 0)=>XLXI_5338_in2_openSignal(63 downto 0),
                in3(63 downto 0)=>XLXI_5338_in3_openSignal(63 downto 0),
                in4(63 downto 0)=>XLXI_5338_in4_openSignal(63 downto 0),
                in5(63 downto 0)=>XLXI_5338_in5_openSignal(63 downto 0),
                in6(63 downto 0)=>XLXI_5338_in6_openSignal(63 downto 0),
                in7(63 downto 0)=>XLXI_5338_in7_openSignal(63 downto 0),
                sel(2 downto 0)=>rx_addr(10 downto 8),
                muxout(63 downto 0)=>tx_data(63 downto 0));
   
   XLXI_6013 : Ethernet_Interface_MUSER_TOP_LEVEL
      port map (b_data(63 downto 0)=>b_data(63 downto 0),
                b_data_we=>b_data_we,
                gec_user_addrs(7 downto 0)=>gec_user_addrs(7 downto 0),
                gec_user_dest_addrs(7 downto 0)=>gec_addrs(7 downto 0),
                gec_user_dest_mac(47 downto 0)=>gec_macport(47 downto 0),
                gec_user_dest_port(15 downto 0)=>gec_macport(63 downto 48),
                GMII_RXD(7 downto 0)=>GMII_RXD_0_sig(7 downto 0),
                GMII_RX_DV=>GMII_RX_DV_0_sig,
                GMII_RX_ER=>GMII_RX_ER_0_sig,
                MASTER_CLK=>MASTER_CLK,
                reset=>reset,
                tx_data(63 downto 0)=>tx_data(63 downto 0),
                b_enable=>open,
                gec_user_src_addrs=>open,
                gec_user_src_capture=>open,
                gec_user_src_mac=>open,
                gec_user_src_port=>open,
                GTX_CLK=>GTX_CLK_0_sig,
                PHY_TXD(7 downto 0)=>PHY_TXD_sig(7 downto 0),
                PHY_TX_EN=>PHY_TXEN_sig,
                PHY_TX_ER=>PHY_TXER_sig,
                rx_addr(63 downto 0)=>rx_addr(63 downto 0),
                rx_data(63 downto 0)=>rx_data(63 downto 0),
                rx_wren=>rx_wren);
   
   XLXI_6014 : fd_64
      port map (C=>MASTER_CLK,
                CE=>GEC_DEST_MACPORT_MAP,
                D(63 downto 0)=>rx_data(63 downto 0),
                R=>reset,
                Q(63 downto 0)=>gec_macport(63 downto 0));
   
   XLXI_6015 : FD8RE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>GEC_DEST_ADDRS_MAP,
                D(7 downto 0)=>rx_data(7 downto 0),
                R=>reset,
                Q(7 downto 0)=>gec_addrs(7 downto 0));
   
   XLXI_6029 : VCC
      port map (P=>gec_user_addrs(0));
   
   XLXI_6030 : VCC
      port map (P=>gec_user_addrs(1));
   
   XLXI_6031 : VCC
      port map (P=>gec_user_addrs(2));
   
   XLXI_6032 : FTC_HXILINX_TOP_LEVEL
      port map (C=>XLXN_18181,
                CLR=>XLXN_18132,
                T=>XLXN_18129,
                Q=>XLXN_18184);
   
   XLXI_6033 : VCC
      port map (P=>XLXN_18129);
   
   XLXI_6034 : GND
      port map (G=>XLXN_18132);
   
   XLXI_6035 : FTC_HXILINX_TOP_LEVEL
      port map (C=>user_clk,
                CLR=>XLXN_18134,
                T=>XLXN_18133,
                Q=>XLXN_18178);
   
   XLXI_6036 : VCC
      port map (P=>XLXN_18133);
   
   XLXI_6037 : GND
      port map (G=>XLXN_18134);
   
   XLXI_6040 : FTC_HXILINX_TOP_LEVEL
      port map (C=>XLXN_18178,
                CLR=>XLXN_18138,
                T=>XLXN_18137,
                Q=>XLXN_18179);
   
   XLXI_6041 : VCC
      port map (P=>XLXN_18137);
   
   XLXI_6042 : GND
      port map (G=>XLXN_18138);
   
   XLXI_6055 : FTC_HXILINX_TOP_LEVEL
      port map (C=>XLXN_18179,
                CLR=>XLXN_18148,
                T=>XLXN_18147,
                Q=>XLXN_18180);
   
   XLXI_6056 : VCC
      port map (P=>XLXN_18147);
   
   XLXI_6057 : GND
      port map (G=>XLXN_18148);
   
   XLXI_6058 : FTC_HXILINX_TOP_LEVEL
      port map (C=>XLXN_18180,
                CLR=>XLXN_18150,
                T=>XLXN_18149,
                Q=>XLXN_18181);
   
   XLXI_6059 : VCC
      port map (P=>XLXN_18149);
   
   XLXI_6060 : GND
      port map (G=>XLXN_18150);
   
   XLXI_6091 : BUFG
      port map (I=>XLXN_18184,
                O=>secondary_clk);
   
   XLXI_6093 : reset_mgr
      port map (reset_start=>XLXN_18197,
                slow_clk=>secondary_clk,
                reset=>reset);
   
   XLXI_6101 : IBUF
      port map (I=>USER_CLOCK,
                O=>user_clk);
   
   XLXI_6109 : INV
      port map (I=>XLXN_18216,
                O=>reset_button);
   
   XLXI_6122 : IBUF
      port map (I=>PHY_RESET,
                O=>XLXN_18216);
   
end BEHAVIORAL;



----- CELL D4_16E_HXILINX_TOP_LEVEL -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D4_16E_HXILINX_TOP_LEVEL is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;
    D4  : out std_logic;
    D5  : out std_logic;
    D6  : out std_logic;
    D7  : out std_logic;
    D8  : out std_logic;
    D9  : out std_logic;
    D10  : out std_logic;
    D11  : out std_logic;
    D12  : out std_logic;
    D13  : out std_logic;
    D14  : out std_logic;
    D15  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    E   : in std_logic
  );
end D4_16E_HXILINX_TOP_LEVEL;

architecture D4_16E_HXILINX_TOP_LEVEL_V of D4_16E_HXILINX_TOP_LEVEL is
  signal d_tmp : std_logic_vector(15 downto 0);
begin
  process (A0, A1, A2, A3, E)
  variable sel   : std_logic_vector(3 downto 0);
  begin
    sel := A3&A2&A1&A0;
    if( E = '0') then
    d_tmp <= "0000000000000000";
    else
      case sel is
      when "0000" => d_tmp <= "0000000000000001";
      when "0001" => d_tmp <= "0000000000000010";
      when "0010" => d_tmp <= "0000000000000100";
      when "0011" => d_tmp <= "0000000000001000";
      when "0100" => d_tmp <= "0000000000010000";
      when "0101" => d_tmp <= "0000000000100000";
      when "0110" => d_tmp <= "0000000001000000";
      when "0111" => d_tmp <= "0000000010000000";
      when "1000" => d_tmp <= "0000000100000000";
      when "1001" => d_tmp <= "0000001000000000";
      when "1010" => d_tmp <= "0000010000000000";
      when "1011" => d_tmp <= "0000100000000000";
      when "1100" => d_tmp <= "0001000000000000";
      when "1101" => d_tmp <= "0010000000000000";
      when "1110" => d_tmp <= "0100000000000000";
      when "1111" => d_tmp <= "1000000000000000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D15 <= d_tmp(15);
    D14 <= d_tmp(14);
    D13 <= d_tmp(13);
    D12 <= d_tmp(12);
    D11 <= d_tmp(11);
    D10 <= d_tmp(10);
    D9  <= d_tmp(9);
    D8  <= d_tmp(8);
    D7  <= d_tmp(7);
    D6  <= d_tmp(6);
    D5  <= d_tmp(5);
    D4  <= d_tmp(4);
    D3  <= d_tmp(3);
    D2  <= d_tmp(2);
    D1  <= d_tmp(1);
    D0  <= d_tmp(0);

end D4_16E_HXILINX_TOP_LEVEL_V;
----- CELL FTC_HXILINX_TOP_LEVEL -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_TOP_LEVEL is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_TOP_LEVEL;

architecture Behavioral of FTC_HXILINX_TOP_LEVEL is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL FD8RE_HXILINX_TOP_LEVEL -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8RE_HXILINX_TOP_LEVEL is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0);
    R   : in STD_LOGIC
    );
end FD8RE_HXILINX_TOP_LEVEL;

architecture Behavioral of FD8RE_HXILINX_TOP_LEVEL is

begin

process(C)
begin
  if (C'event and C = '1') then
    if (R='1') then
      Q <= (others => '0');
    elsif (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;



