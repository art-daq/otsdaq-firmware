--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : TOP_LEVEL.vhf
-- /___/   /\     Timestamp : 05/02/2017 16:23:02
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family virtex4 -flat -suppress -vhdl "D:/Projects/Testbeam I/May 2017 fws/TB_STIB_MASTER_DIG_NIM_OT/GEL_CAPTAN/TOP_LEVEL.vhf" -w "D:/Projects/Testbeam I/May 2017 fws/TB_STIB_MASTER_DIG_NIM_OT/GEL_CAPTAN/TOP_LEVEL.sch"
--Design Name: TOP_LEVEL
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M2_1E_MXILINX_TOP_LEVEL is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1E_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of M2_1E_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   I_36_30 : AND3
      port map (I0=>D1,
                I1=>E,
                I2=>S0,
                O=>M1);
   
   I_36_31 : AND3B1
      port map (I0=>S0,
                I1=>E,
                I2=>D0,
                O=>M0);
   
   I_36_38 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M4_1E_MXILINX_TOP_LEVEL is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          D2 : in    std_logic; 
          D3 : in    std_logic; 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic);
end M4_1E_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of M4_1E_MXILINX_TOP_LEVEL is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal M01 : std_logic;
   signal M23 : std_logic;
   component M2_1E_MXILINX_TOP_LEVEL
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component MUXF5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             S  : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of MUXF5 : component is "BLACK_BOX";
   
   attribute HU_SET of I_M01 : label is "I_M01_3";
   attribute HU_SET of I_M23 : label is "I_M23_2";
begin
   I_M01 : M2_1E_MXILINX_TOP_LEVEL
      port map (D0=>D0,
                D1=>D1,
                E=>E,
                S0=>S0,
                O=>M01);
   
   I_M23 : M2_1E_MXILINX_TOP_LEVEL
      port map (D0=>D2,
                D1=>D3,
                E=>E,
                S0=>S0,
                O=>M23);
   
   I_O : MUXF5
      port map (I0=>M01,
                I1=>M23,
                S=>S1,
                O=>O);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FD8RE_MXILINX_TOP_LEVEL is
   port ( C  : in    std_logic; 
          CE : in    std_logic; 
          D  : in    std_logic_vector (7 downto 0); 
          R  : in    std_logic; 
          Q  : out   std_logic_vector (7 downto 0));
end FD8RE_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of FD8RE_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   component FDRE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             R  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDRE : component is "BLACK_BOX";
   
begin
   I_Q0 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(0),
                R=>R,
                Q=>Q(0));
   
   I_Q1 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(1),
                R=>R,
                Q=>Q(1));
   
   I_Q2 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(2),
                R=>R,
                Q=>Q(2));
   
   I_Q3 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(3),
                R=>R,
                Q=>Q(3));
   
   I_Q4 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(4),
                R=>R,
                Q=>Q(4));
   
   I_Q5 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(5),
                R=>R,
                Q=>Q(5));
   
   I_Q6 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(6),
                R=>R,
                Q=>Q(6));
   
   I_Q7 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(7),
                R=>R,
                Q=>Q(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M2_1_MXILINX_TOP_LEVEL is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of M2_1_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
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
   
begin
   I_36_7 : AND2B1
      port map (I0=>S0,
                I1=>D0,
                O=>M0);
   
   I_36_8 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
   I_36_9 : AND2
      port map (I0=>D1,
                I1=>S0,
                O=>M1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FD8CE_MXILINX_TOP_LEVEL is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic_vector (7 downto 0); 
          Q   : out   std_logic_vector (7 downto 0));
end FD8CE_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of FD8CE_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
begin
   I_Q0 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(0),
                Q=>Q(0));
   
   I_Q1 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(1),
                Q=>Q(1));
   
   I_Q2 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(2),
                Q=>Q(2));
   
   I_Q3 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(3),
                Q=>Q(3));
   
   I_Q4 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(4),
                Q=>Q(4));
   
   I_Q5 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(5),
                Q=>Q(5));
   
   I_Q6 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(6),
                Q=>Q(6));
   
   I_Q7 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D(7),
                Q=>Q(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity D2_4E_MXILINX_TOP_LEVEL is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          E  : in    std_logic; 
          D0 : out   std_logic; 
          D1 : out   std_logic; 
          D2 : out   std_logic; 
          D3 : out   std_logic);
end D2_4E_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of D2_4E_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   I_36_30 : AND3
      port map (I0=>A1,
                I1=>A0,
                I2=>E,
                O=>D3);
   
   I_36_31 : AND3B1
      port map (I0=>A0,
                I1=>A1,
                I2=>E,
                O=>D2);
   
   I_36_32 : AND3B1
      port map (I0=>A1,
                I1=>A0,
                I2=>E,
                O=>D1);
   
   I_36_33 : AND3B2
      port map (I0=>A0,
                I1=>A1,
                I2=>E,
                O=>D0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FTC_MXILINX_TOP_LEVEL is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CLR : in    std_logic; 
          T   : in    std_logic; 
          Q   : out   std_logic);
end FTC_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of FTC_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   attribute RLOC       : string ;
   signal TQ      : std_logic;
   signal Q_DUMMY : std_logic;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDC
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
   attribute RLOC of I_36_35 : label is "X0Y0";
begin
   Q <= Q_DUMMY;
   I_36_32 : XOR2
      port map (I0=>T,
                I1=>Q_DUMMY,
                O=>TQ);
   
   I_36_35 : FDC
   generic map( INIT => INIT)
      port map (C=>C,
                CLR=>CLR,
                D=>TQ,
                Q=>Q_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PSI_Dig_Block_MUSER_TOP_LEVEL is
   port ( cal_tag              : in    std_logic_vector (15 downto 0); 
          cal_tag_trig_num_sel : in    std_logic; 
          first_in_chain       : in    std_logic; 
          MASTER_CLK           : in    std_logic; 
          plaq_id              : in    std_logic_vector (2 downto 0); 
          psi_dig_data_delayed : in    std_logic; 
          psi_dig_sdata_clk    : in    std_logic; 
          psi_mode             : in    std_logic_vector (4 downto 0); 
          psi_token_in         : in    std_logic; 
          psi_token_out        : in    std_logic; 
          rd_token_in          : in    std_logic; 
          reset                : in    std_logic; 
          time_stamp           : in    std_logic_vector (12 downto 0); 
          token_stack_count    : in    std_logic_vector (3 downto 0); 
          tokin_cnt            : in    std_logic_vector (19 downto 0); 
          trig_cnt             : in    std_logic_vector (19 downto 0); 
          error_decoder_ovf    : out   std_logic; 
          error_reset_req      : out   std_logic; 
          ovf_err              : out   std_logic; 
          rd_token_out         : out   std_logic; 
          sm_ready             : out   std_logic; 
          we_out               : out   std_logic; 
          bus_dout             : inout std_logic_vector (63 downto 0));
end PSI_Dig_Block_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of PSI_Dig_Block_MUSER_TOP_LEVEL is
   signal psi_dec_data         : std_logic_vector (28 downto 0);
   signal psi_dec_data_we      : std_logic;
   signal tokin_cnt_latch      : std_logic_vector (19 downto 0);
   component chip_token_manager
      port ( reset                : in    std_logic; 
             clk                  : in    std_logic; 
             token_in             : in    std_logic; 
             first_in_token_chain : in    std_logic; 
             cal_trig_sel         : in    std_logic; 
             pdin_we              : in    std_logic; 
             plaq_id              : in    std_logic_vector (2 downto 0); 
             cal_tag              : in    std_logic_vector (15 downto 0); 
             tokin_cnt            : in    std_logic_vector (19 downto 0); 
             trig_cnt             : in    std_logic_vector (19 downto 0); 
             time_stamp           : in    std_logic_vector (12 downto 0); 
             tkstack_cnt          : in    std_logic_vector (3 downto 0); 
             pdin                 : in    std_logic_vector (28 downto 0); 
             b_mode_sel           : in    std_logic_vector (4 downto 0); 
             bus_dout             : inout std_logic_vector (63 downto 0); 
             ovf_err              : out   std_logic; 
             token_out            : out   std_logic; 
             we_out               : out   std_logic; 
             trig_tok_diff        : out   std_logic_vector (3 downto 0));
   end component;
   
   component psi_dig_decoder
      port ( sclk            : in    std_logic; 
             rst             : in    std_logic; 
             sdata           : in    std_logic; 
             tok_in          : in    std_logic; 
             tok_out         : in    std_logic; 
             mclk            : in    std_logic; 
             evt_num         : in    std_logic_vector (19 downto 0); 
             sm_ready        : out   std_logic; 
             error           : out   std_logic; 
             error_reset_req : out   std_logic; 
             dataout_we      : out   std_logic; 
             evt_num_latch   : out   std_logic_vector (19 downto 0); 
             dataout         : out   std_logic_vector (28 downto 0));
   end component;
   
begin
   CHIP_TMGR : chip_token_manager
      port map (b_mode_sel(4 downto 0)=>psi_mode(4 downto 0),
                cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_trig_sel=>cal_tag_trig_num_sel,
                clk=>MASTER_CLK,
                first_in_token_chain=>first_in_chain,
                pdin(28 downto 0)=>psi_dec_data(28 downto 0),
                pdin_we=>psi_dec_data_we,
                plaq_id(2 downto 0)=>plaq_id(2 downto 0),
                reset=>reset,
                time_stamp(12 downto 0)=>time_stamp(12 downto 0),
                tkstack_cnt(3 downto 0)=>token_stack_count(3 downto 0),
                token_in=>rd_token_in,
                tokin_cnt(19 downto 0)=>tokin_cnt_latch(19 downto 0),
                trig_cnt(19 downto 0)=>trig_cnt(19 downto 0),
                ovf_err=>ovf_err,
                token_out=>rd_token_out,
                trig_tok_diff=>open,
                we_out=>we_out,
                bus_dout(63 downto 0)=>bus_dout(63 downto 0));
   
   XLXI_6064 : psi_dig_decoder
      port map (evt_num(19 downto 0)=>tokin_cnt(19 downto 0),
                mclk=>MASTER_CLK,
                rst=>reset,
                sclk=>psi_dig_sdata_clk,
                sdata=>psi_dig_data_delayed,
                tok_in=>psi_token_in,
                tok_out=>psi_token_out,
                dataout(28 downto 0)=>psi_dec_data(28 downto 0),
                dataout_we=>psi_dec_data_we,
                error=>error_decoder_ovf,
                error_reset_req=>error_reset_req,
                evt_num_latch(19 downto 0)=>tokin_cnt_latch(19 downto 0),
                sm_ready=>sm_ready);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity gigabit_ethernet_controller_MUSER_TOP_LEVEL is
   port ( GMII_RXD           : in    std_logic_vector (7 downto 0); 
          GMII_RX_CLK        : in    std_logic; 
          GMII_RX_DV         : in    std_logic; 
          GMII_RX_ER         : in    std_logic; 
          reset              : in    std_logic; 
          user_addrs         : in    std_logic_vector (7 downto 0); 
          user_dest_addrs    : in    std_logic_vector (7 downto 0); 
          user_dest_mac      : in    std_logic_vector (47 downto 0); 
          user_dest_port     : in    std_logic_vector (15 downto 0); 
          user_trigger       : in    std_logic; 
          user_tx_data_in    : in    std_logic_vector (7 downto 0); 
          user_tx_size_in    : in    std_logic_vector (10 downto 0); 
          crc_err            : out   std_logic; 
          GMII_TXD           : out   std_logic_vector (7 downto 0); 
          GMII_TX_EN         : out   std_logic; 
          GMII_TX_ER         : out   std_logic; 
          GTX_CLK            : out   std_logic; 
          user_busy          : out   std_logic; 
          user_rx_data_out   : out   std_logic_vector (7 downto 0); 
          user_rx_size_out   : out   std_logic_vector (10 downto 0); 
          user_rx_valid_out  : out   std_logic; 
          user_src_addrs     : out   std_logic_vector (7 downto 0); 
          user_src_capture   : out   std_logic; 
          user_src_mac       : out   std_logic_vector (47 downto 0); 
          user_src_port      : out   std_logic_vector (15 downto 0); 
          user_tx_enable_out : out   std_logic);
end gigabit_ethernet_controller_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of gigabit_ethernet_controller_MUSER_TOP_LEVEL is
   signal crc_chk_en         : std_logic;
   signal crc_chk_err        : std_logic;
   signal crc_gen_en         : std_logic;
   signal crc_gen_init       : std_logic;
   signal crc_gen_rd         : std_logic;
   signal crc_init           : std_logic;
   signal crc_out            : std_logic_vector (7 downto 0);
   signal rx_data            : std_logic_vector (7 downto 0);
   signal rx_dv              : std_logic;
   signal rx_er              : std_logic;
   signal txd_sig            : std_logic_vector (7 downto 0);
   component CRC_chk
      port ( Reset      : in    std_logic; 
             Clk        : in    std_logic; 
             CRC_init   : in    std_logic; 
             CRC_en     : in    std_logic; 
             CRC_chk_en : in    std_logic; 
             CRC_data   : in    std_logic_vector (7 downto 0); 
             CRC_err    : out   std_logic);
   end component;
   
   component CRC_gen
      port ( Reset      : in    std_logic; 
             Clk        : in    std_logic; 
             Init       : in    std_logic; 
             Data_en    : in    std_logic; 
             CRC_rd     : in    std_logic; 
             Frame_data : in    std_logic_vector (7 downto 0); 
             CRC_end    : out   std_logic; 
             CRC_out    : out   std_logic_vector (7 downto 0));
   end component;
   
   component CRC_splice
      port ( rd      : in    std_logic; 
             data    : in    std_logic_vector (7 downto 0); 
             crc     : in    std_logic_vector (7 downto 0); 
             dataout : out   std_logic_vector (7 downto 0));
   end component;
   
   component DIG_GEC
      port ( GMII_RX_CLK        : in    std_logic; 
             GMII_RX_DV         : in    std_logic; 
             GMII_RX_ER         : in    std_logic; 
             reset              : in    std_logic; 
             trigger            : in    std_logic; 
             GMII_RXD           : in    std_logic_vector (7 downto 0); 
             dest_addrs         : in    std_logic_vector (7 downto 0); 
             dest_mac           : in    std_logic_vector (47 downto 0); 
             dest_port          : in    std_logic_vector (15 downto 0); 
             user_addrs         : in    std_logic_vector (7 downto 0); 
             user_tx_data_in    : in    std_logic_vector (7 downto 0); 
             user_tx_size_in    : in    std_logic_vector (10 downto 0); 
             GMII_GTX_CLK       : out   std_logic; 
             GMII_TX_EN         : out   std_logic; 
             GMII_TX_ER         : out   std_logic; 
             busy               : out   std_logic; 
             crc_chk_en         : out   std_logic; 
             crc_chk_err        : out   std_logic; 
             crc_chk_init       : out   std_logic; 
             crc_gen_en         : out   std_logic; 
             crc_gen_init       : out   std_logic; 
             crc_gen_rd         : out   std_logic; 
             en_tx_data         : out   std_logic; 
             src_capture        : out   std_logic; 
             udp_data_valid_out : out   std_logic; 
             GMII_TXD           : out   std_logic_vector (7 downto 0); 
             src_addrs          : out   std_logic_vector (7 downto 0); 
             src_mac            : out   std_logic_vector (47 downto 0); 
             src_port           : out   std_logic_vector (15 downto 0); 
             udp_data_count     : out   std_logic_vector (10 downto 0); 
             user_rx_data_out   : out   std_logic_vector (7 downto 0));
   end component;
   
   component RX_IN_LATCH
      port ( clk : in    std_logic; 
             dv  : in    std_logic; 
             er  : in    std_logic; 
             d   : in    std_logic_vector (7 downto 0); 
             do  : out   std_logic_vector (7 downto 0); 
             dvo : out   std_logic; 
             ero : out   std_logic);
   end component;
   
begin
   XLXI_226 : CRC_chk
      port map (Clk=>GMII_RX_CLK,
                CRC_chk_en=>crc_chk_err,
                CRC_data(7 downto 0)=>rx_data(7 downto 0),
                CRC_en=>crc_chk_en,
                CRC_init=>crc_init,
                Reset=>reset,
                CRC_err=>crc_err);
   
   XLXI_238 : CRC_gen
      port map (Clk=>GMII_RX_CLK,
                CRC_rd=>crc_gen_rd,
                Data_en=>crc_gen_en,
                Frame_data(7 downto 0)=>txd_sig(7 downto 0),
                Init=>crc_gen_init,
                Reset=>reset,
                CRC_end=>open,
                CRC_out(7 downto 0)=>crc_out(7 downto 0));
   
   XLXI_248 : CRC_splice
      port map (crc(7 downto 0)=>crc_out(7 downto 0),
                data(7 downto 0)=>txd_sig(7 downto 0),
                rd=>crc_gen_rd,
                dataout(7 downto 0)=>GMII_TXD(7 downto 0));
   
   XLXI_249 : DIG_GEC
      port map (dest_addrs(7 downto 0)=>user_dest_addrs(7 downto 0),
                dest_mac(47 downto 0)=>user_dest_mac(47 downto 0),
                dest_port(15 downto 0)=>user_dest_port(15 downto 0),
                GMII_RXD(7 downto 0)=>rx_data(7 downto 0),
                GMII_RX_CLK=>GMII_RX_CLK,
                GMII_RX_DV=>rx_dv,
                GMII_RX_ER=>rx_er,
                reset=>reset,
                trigger=>user_trigger,
                user_addrs(7 downto 0)=>user_addrs(7 downto 0),
                user_tx_data_in(7 downto 0)=>user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),
                busy=>user_busy,
                crc_chk_en=>crc_chk_en,
                crc_chk_err=>crc_chk_err,
                crc_chk_init=>crc_init,
                crc_gen_en=>crc_gen_en,
                crc_gen_init=>crc_gen_init,
                crc_gen_rd=>crc_gen_rd,
                en_tx_data=>user_tx_enable_out,
                GMII_GTX_CLK=>GTX_CLK,
                GMII_TXD(7 downto 0)=>txd_sig(7 downto 0),
                GMII_TX_EN=>GMII_TX_EN,
                GMII_TX_ER=>GMII_TX_ER,
                src_addrs(7 downto 0)=>user_src_addrs(7 downto 0),
                src_capture=>user_src_capture,
                src_mac(47 downto 0)=>user_src_mac(47 downto 0),
                src_port(15 downto 0)=>user_src_port(15 downto 0),
                udp_data_count(10 downto 0)=>user_rx_size_out(10 downto 0),
                udp_data_valid_out=>user_rx_valid_out,
                user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0));
   
   XLXI_251 : RX_IN_LATCH
      port map (clk=>GMII_RX_CLK,
                d(7 downto 0)=>GMII_RXD(7 downto 0),
                dv=>GMII_RX_DV,
                er=>GMII_RX_ER,
                do(7 downto 0)=>rx_data(7 downto 0),
                dvo=>rx_dv,
                ero=>rx_er);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity DATA_MANAGER_MUSER_TOP_LEVEL is
   port ( b_data                 : in    std_logic_vector (63 downto 0); 
          b_data_we              : in    std_logic; 
          b_end_packet           : in    std_logic; 
          gec_user_busy          : in    std_logic; 
          gec_user_crc_err       : in    std_logic; 
          gec_user_rx_data_out   : in    std_logic_vector (7 downto 0); 
          gec_user_rx_size_out   : in    std_logic_vector (10 downto 0); 
          gec_user_rx_valid_out  : in    std_logic; 
          gec_user_tx_enable_out : in    std_logic; 
          MASTER_CLK             : in    std_logic; 
          reset                  : in    std_logic; 
          reset_n                : in    std_logic; 
          tx_data                : in    std_logic_vector (63 downto 0); 
          b_enable               : out   std_logic; 
          gec_user_trigger       : out   std_logic; 
          gec_user_tx_data_in    : out   std_logic_vector (7 downto 0); 
          gec_user_tx_size_in    : out   std_logic_vector (10 downto 0); 
          ram_addr               : out   std_logic_vector (63 downto 0); 
          ram_wren               : out   std_logic; 
          rx_data                : out   std_logic_vector (63 downto 0));
end DATA_MANAGER_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of DATA_MANAGER_MUSER_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal burst_done                           : std_logic;
   signal burst_start                          : std_logic;
   signal burst_stop                           : std_logic;
   signal clear_delay_count                    : std_logic;
   signal crc_err_flag                         : std_logic;
   signal data_fifo_empty                      : std_logic;
   signal data_fifo_full                       : std_logic;
   signal data_fifo_rden_en                    : std_logic;
   signal data_fifo_rd_data                    : std_logic_vector (63 downto 0);
   signal data_fifo_wren                       : std_logic;
   signal data_fifo_wr_data                    : std_logic_vector (63 downto 0);
   signal delay_count                          : std_logic;
   signal info_fifo_rd_data                    : std_logic_vector (15 downto 0);
   signal info_fifo_wren                       : std_logic;
   signal info_fifo_wr_data                    : std_logic_vector (15 downto 0);
   signal rx_data_fifo_empty                   : std_logic;
   signal rx_data_fifo_read_enable             : std_logic;
   signal rx_fifo_reset                        : std_logic;
   signal rx_fifo_reset_sig                    : std_logic;
   signal rx_info_fifo_empty                   : std_logic;
   signal rx_info_fifo_rden                    : std_logic;
   signal start_delay_count                    : std_logic;
   signal tx_data_fifo_din                     : std_logic_vector (63 downto 0);
   signal tx_data_fifo_empty                   : std_logic;
   signal tx_data_fifo_full                    : std_logic;
   signal tx_data_fifo_rden                    : std_logic;
   signal tx_data_fifo_read_enable             : std_logic;
   signal tx_data_fifo_src_sel                 : std_logic;
   signal tx_data_fifo_wren_burst              : std_logic;
   signal tx_data_fifo_wren_comm               : std_logic;
   signal tx_data_fifo_wr_en                   : std_logic;
   signal tx_fifo_reset                        : std_logic;
   signal tx_fifo_reset_sig                    : std_logic;
   signal tx_info_fifo_data_burst              : std_logic_vector (15 downto 0);
   signal tx_info_fifo_data_comm               : std_logic_vector (15 downto 0);
   signal tx_info_fifo_din                     : std_logic_vector (15 downto 0);
   signal tx_info_fifo_dout                    : std_logic_vector (15 downto 0);
   signal tx_info_fifo_empty                   : std_logic;
   signal tx_info_fifo_full                    : std_logic;
   signal tx_info_fifo_rden                    : std_logic;
   signal tx_info_fifo_src_sel                 : std_logic;
   signal tx_info_fifo_wren_burst              : std_logic;
   signal tx_info_fifo_wren_comm               : std_logic;
   signal tx_info_fifo_wr_en                   : std_logic;
   signal XLXN_342                             : std_logic;
   signal XLXN_443                             : std_logic;
   signal XLXN_463                             : std_logic;
   signal XLXN_1735                            : std_logic;
   signal rx_data_DUMMY                        : std_logic_vector (63 downto 0);
   signal XLXI_3365_data_fifo_wrerr_openSignal : std_logic;
   signal XLXI_3513_data_fifo_rderr_openSignal : std_logic;
   signal XLXI_3513_info_fifo_rderr_openSignal : std_logic;
   component DATA_FIFO_0
      port ( clk   : in    std_logic; 
             rd_en : in    std_logic; 
             srst  : in    std_logic; 
             wr_en : in    std_logic; 
             din   : in    std_logic_vector (63 downto 0); 
             empty : out   std_logic; 
             full  : out   std_logic; 
             dout  : out   std_logic_vector (63 downto 0));
   end component;
   
   component INFO_FIFO_0
      port ( wr_en : in    std_logic; 
             clk   : in    std_logic; 
             srst  : in    std_logic; 
             din   : in    std_logic_vector (15 downto 0); 
             rd_en : in    std_logic; 
             dout  : out   std_logic_vector (15 downto 0); 
             empty : out   std_logic; 
             full  : out   std_logic);
   end component;
   
   component burst_controller_sm
      port ( b_data_we    : in    std_logic; 
             b_end_burst  : in    std_logic; 
             b_end_packet : in    std_logic; 
             burst_start  : in    std_logic; 
             burst_stop   : in    std_logic; 
             clk          : in    std_logic; 
             reset_n      : in    std_logic; 
             tx_data_full : in    std_logic; 
             tx_info_full : in    std_logic; 
             b_enable     : out   std_logic; 
             burst_done   : out   std_logic; 
             tx_data_we   : out   std_logic; 
             tx_info_we   : out   std_logic; 
             tx_info      : out   std_logic_vector (15 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GEC_RX_CTL_8
      port ( block_en              : in    std_logic; 
             clock                 : in    std_logic; 
             data_fifo_full        : in    std_logic; 
             data_fifo_wrerr       : in    std_logic; 
             gec_user_crc_err      : in    std_logic; 
             gec_user_rx_valid_out : in    std_logic; 
             reset_n               : in    std_logic; 
             gec_user_rx_data_out  : in    std_logic_vector (7 downto 0); 
             gec_user_rx_size_out  : in    std_logic_vector (10 downto 0); 
             crc_err_flag          : out   std_logic; 
             data_fifo_wren        : out   std_logic; 
             info_fifo_wren        : out   std_logic; 
             data_fifo_q_w_data    : out   std_logic_vector (63 downto 0); 
             info_fifo_wr_data     : out   std_logic_vector (15 downto 0));
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component RAM_COMM_DEC_9
      port ( block_en             : in    std_logic; 
             burst_done           : in    std_logic; 
             clock                : in    std_logic; 
             reset_n              : in    std_logic; 
             rx_info_fifo_empty   : in    std_logic; 
             tx_info_fifo_full    : in    std_logic; 
             rx_data_fifo_rd_data : in    std_logic_vector (63 downto 0); 
             rx_info_fifo_rd_data : in    std_logic_vector (15 downto 0); 
             burst_start          : out   std_logic; 
             burst_stop           : out   std_logic; 
             ram_en               : out   std_logic; 
             ram_wren             : out   std_logic; 
             rx_data_fifo_rden    : out   std_logic; 
             Rx_FIFO_Reset        : out   std_logic; 
             rx_info_fifo_rden    : out   std_logic; 
             tx_data_fifo_src_sel : out   std_logic; 
             tx_data_fifo_wren    : out   std_logic; 
             Tx_FIFO_Reset        : out   std_logic; 
             tx_info_fifo_src_sel : out   std_logic; 
             tx_info_fifo_wren    : out   std_logic; 
             ram_addr             : out   std_logic_vector (63 downto 0); 
             state_diag           : out   std_logic_vector (0 to 5); 
             tx_info_fifo_wr_data : out   std_logic_vector (15 downto 0));
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component GEC_TX_SEQ_CTL_8
      port ( block_en               : in    std_logic; 
             clk                    : in    std_logic; 
             data_fifo_empty        : in    std_logic; 
             data_fifo_rderr        : in    std_logic; 
             delay_count            : in    std_logic; 
             gec_user_busy          : in    std_logic; 
             gec_user_tx_enable_out : in    std_logic; 
             info_fifo_empty        : in    std_logic; 
             info_fifo_rderr        : in    std_logic; 
             reset_n                : in    std_logic; 
             data_fifo_rd_data      : in    std_logic_vector (63 downto 0); 
             info_fifo_rd_data      : in    std_logic_vector (15 downto 0); 
             clear_delay_count      : out   std_logic; 
             data_fifo_rden         : out   std_logic; 
             data_fifo_rden_en      : out   std_logic; 
             gec_user_trigger       : out   std_logic; 
             info_fifo_rden         : out   std_logic; 
             start_delay_count      : out   std_logic; 
             gec_user_tx_data_in    : out   std_logic_vector (7 downto 0); 
             gec_user_tx_size_in    : out   std_logic_vector (10 downto 0));
   end component;
   
   component delay_counter
      port ( clear_delay_count : in    std_logic; 
             clock             : in    std_logic; 
             reset_n           : in    std_logic; 
             start_delay_count : in    std_logic; 
             delay_count       : out   std_logic);
   end component;
   
   component MUX16_2
      port ( sel    : in    std_logic; 
             in0    : in    std_logic_vector (15 downto 0); 
             in1    : in    std_logic_vector (15 downto 0); 
             muxout : out   std_logic_vector (15 downto 0));
   end component;
   
   component M2_1_MXILINX_TOP_LEVEL
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component MUX64_2
      port ( sel    : in    std_logic; 
             in0    : in    std_logic_vector (63 downto 0); 
             in1    : in    std_logic_vector (63 downto 0); 
             muxout : out   std_logic_vector (63 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_3527 : label is "XLXI_3527_4";
   attribute HU_SET of XLXI_3532 : label is "XLXI_3532_5";
begin
   rx_data(63 downto 0) <= rx_data_DUMMY(63 downto 0);
   RX_DATA_FIFO : DATA_FIFO_0
      port map (clk=>MASTER_CLK,
                din(63 downto 0)=>data_fifo_wr_data(63 downto 0),
                rd_en=>rx_data_fifo_read_enable,
                srst=>rx_fifo_reset_sig,
                wr_en=>data_fifo_wren,
                dout(63 downto 0)=>rx_data_DUMMY(63 downto 0),
                empty=>rx_data_fifo_empty,
                full=>open);
   
   RX_INFO_FIFO : INFO_FIFO_0
      port map (clk=>MASTER_CLK,
                din(15 downto 0)=>info_fifo_wr_data(15 downto 0),
                rd_en=>rx_info_fifo_rden,
                srst=>rx_fifo_reset_sig,
                wr_en=>info_fifo_wren,
                dout(15 downto 0)=>info_fifo_rd_data(15 downto 0),
                empty=>rx_info_fifo_empty,
                full=>open);
   
   TX_DATA_FIFO : DATA_FIFO_0
      port map (clk=>MASTER_CLK,
                din(63 downto 0)=>tx_data_fifo_din(63 downto 0),
                rd_en=>tx_data_fifo_read_enable,
                srst=>tx_fifo_reset_sig,
                wr_en=>tx_data_fifo_wr_en,
                dout(63 downto 0)=>data_fifo_rd_data(63 downto 0),
                empty=>tx_data_fifo_empty,
                full=>tx_data_fifo_full);
   
   TX_INFO_FIFO : INFO_FIFO_0
      port map (clk=>MASTER_CLK,
                din(15 downto 0)=>tx_info_fifo_din(15 downto 0),
                rd_en=>tx_info_fifo_rden,
                srst=>tx_fifo_reset_sig,
                wr_en=>tx_info_fifo_wr_en,
                dout(15 downto 0)=>tx_info_fifo_dout(15 downto 0),
                empty=>tx_info_fifo_empty,
                full=>tx_info_fifo_full);
   
   XLXI_2539 : burst_controller_sm
      port map (burst_start=>burst_start,
                burst_stop=>burst_stop,
                b_data_we=>b_data_we,
                b_end_burst=>XLXN_1735,
                b_end_packet=>b_end_packet,
                clk=>MASTER_CLK,
                reset_n=>reset_n,
                tx_data_full=>tx_data_fifo_full,
                tx_info_full=>tx_info_fifo_full,
                burst_done=>burst_done,
                b_enable=>b_enable,
                tx_data_we=>tx_data_fifo_wren_burst,
                tx_info(15 downto 0)=>tx_info_fifo_data_burst(15 downto 0),
                tx_info_we=>tx_info_fifo_wren_burst);
   
   XLXI_3364 : VCC
      port map (P=>XLXN_342);
   
   XLXI_3365 : GEC_RX_CTL_8
      port map (block_en=>XLXN_342,
                clock=>MASTER_CLK,
                data_fifo_full=>data_fifo_full,
                data_fifo_wrerr=>XLXI_3365_data_fifo_wrerr_openSignal,
                gec_user_crc_err=>gec_user_crc_err,
                gec_user_rx_data_out(7 downto 0)=>gec_user_rx_data_out(7 downto 
            0),
                gec_user_rx_size_out(10 downto 0)=>gec_user_rx_size_out(10 
            downto 0),
                gec_user_rx_valid_out=>gec_user_rx_valid_out,
                reset_n=>reset_n,
                crc_err_flag=>crc_err_flag,
                data_fifo_q_w_data(63 downto 0)=>data_fifo_wr_data(63 downto 0),
                data_fifo_wren=>data_fifo_wren,
                info_fifo_wren=>info_fifo_wren,
                info_fifo_wr_data(15 downto 0)=>info_fifo_wr_data(15 downto 0));
   
   XLXI_3401 : VCC
      port map (P=>XLXN_463);
   
   XLXI_3505 : OR2
      port map (I0=>tx_fifo_reset,
                I1=>reset,
                O=>tx_fifo_reset_sig);
   
   XLXI_3506 : RAM_COMM_DEC_9
      port map (block_en=>XLXN_463,
                burst_done=>burst_done,
                clock=>MASTER_CLK,
                reset_n=>reset_n,
                rx_data_fifo_rd_data(63 downto 0)=>rx_data_DUMMY(63 downto 0),
                rx_info_fifo_empty=>rx_info_fifo_empty,
                rx_info_fifo_rd_data(15 downto 0)=>info_fifo_rd_data(15 downto 
            0),
                tx_info_fifo_full=>tx_info_fifo_full,
                burst_start=>burst_start,
                burst_stop=>burst_stop,
                ram_addr(63 downto 0)=>ram_addr(63 downto 0),
                ram_en=>open,
                ram_wren=>ram_wren,
                rx_data_fifo_rden=>rx_data_fifo_read_enable,
                Rx_FIFO_Reset=>rx_fifo_reset,
                rx_info_fifo_rden=>rx_info_fifo_rden,
                state_diag=>open,
                tx_data_fifo_src_sel=>tx_data_fifo_src_sel,
                tx_data_fifo_wren=>tx_data_fifo_wren_comm,
                Tx_FIFO_Reset=>tx_fifo_reset,
                tx_info_fifo_src_sel=>tx_info_fifo_src_sel,
                tx_info_fifo_wren=>tx_info_fifo_wren_comm,
                tx_info_fifo_wr_data(15 downto 0)=>tx_info_fifo_data_comm(15 
            downto 0));
   
   XLXI_3511 : VCC
      port map (P=>XLXN_443);
   
   XLXI_3512 : AND2
      port map (I0=>tx_data_fifo_rden,
                I1=>data_fifo_rden_en,
                O=>tx_data_fifo_read_enable);
   
   XLXI_3513 : GEC_TX_SEQ_CTL_8
      port map (block_en=>XLXN_443,
                clk=>MASTER_CLK,
                data_fifo_empty=>data_fifo_empty,
                data_fifo_rderr=>XLXI_3513_data_fifo_rderr_openSignal,
                data_fifo_rd_data(63 downto 0)=>data_fifo_rd_data(63 downto 0),
                delay_count=>delay_count,
                gec_user_busy=>gec_user_busy,
                gec_user_tx_enable_out=>gec_user_tx_enable_out,
                info_fifo_empty=>tx_info_fifo_empty,
                info_fifo_rderr=>XLXI_3513_info_fifo_rderr_openSignal,
                info_fifo_rd_data(15 downto 0)=>tx_info_fifo_dout(15 downto 0),
                reset_n=>reset_n,
                clear_delay_count=>clear_delay_count,
                data_fifo_rden=>tx_data_fifo_rden,
                data_fifo_rden_en=>data_fifo_rden_en,
                gec_user_trigger=>gec_user_trigger,
                gec_user_tx_data_in(7 downto 0)=>gec_user_tx_data_in(7 downto 0),
                gec_user_tx_size_in(10 downto 0)=>gec_user_tx_size_in(10 downto 
            0),
                info_fifo_rden=>tx_info_fifo_rden,
                start_delay_count=>start_delay_count);
   
   XLXI_3514 : delay_counter
      port map (clear_delay_count=>clear_delay_count,
                clock=>MASTER_CLK,
                reset_n=>reset_n,
                start_delay_count=>start_delay_count,
                delay_count=>delay_count);
   
   XLXI_3526 : MUX16_2
      port map (in0(15 downto 0)=>tx_info_fifo_data_comm(15 downto 0),
                in1(15 downto 0)=>tx_info_fifo_data_burst(15 downto 0),
                sel=>tx_info_fifo_src_sel,
                muxout(15 downto 0)=>tx_info_fifo_din(15 downto 0));
   
   XLXI_3527 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>tx_info_fifo_wren_comm,
                D1=>tx_info_fifo_wren_burst,
                S0=>tx_info_fifo_src_sel,
                O=>tx_info_fifo_wr_en);
   
   XLXI_3531 : MUX64_2
      port map (in0(63 downto 0)=>tx_data(63 downto 0),
                in1(63 downto 0)=>b_data(63 downto 0),
                sel=>tx_data_fifo_src_sel,
                muxout(63 downto 0)=>tx_data_fifo_din(63 downto 0));
   
   XLXI_3532 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>tx_data_fifo_wren_comm,
                D1=>tx_data_fifo_wren_burst,
                S0=>tx_data_fifo_src_sel,
                O=>tx_data_fifo_wr_en);
   
   XLXI_3540 : GND
      port map (G=>XLXN_1735);
   
   XLXI_3541 : OR2
      port map (I0=>rx_fifo_reset,
                I1=>reset,
                O=>rx_fifo_reset_sig);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Ethernet_Interface_MUSER_TOP_LEVEL is
   port ( b_data               : in    std_logic_vector (63 downto 0); 
          b_data_we            : in    std_logic; 
          gec_user_addrs       : in    std_logic_vector (7 downto 0); 
          gec_user_dest_addrs  : in    std_logic_vector (7 downto 0); 
          gec_user_dest_mac    : in    std_logic_vector (47 downto 0); 
          gec_user_dest_port   : in    std_logic_vector (15 downto 0); 
          GMII_RXD             : in    std_logic_vector (7 downto 0); 
          GMII_RX_DV           : in    std_logic; 
          GMII_RX_ER           : in    std_logic; 
          MASTER_CLK           : in    std_logic; 
          reset                : in    std_logic; 
          tx_data              : in    std_logic_vector (63 downto 0); 
          b_enable             : out   std_logic; 
          gec_user_src_addrs   : out   std_logic_vector (7 downto 0); 
          gec_user_src_capture : out   std_logic; 
          gec_user_src_mac     : out   std_logic_vector (47 downto 0); 
          gec_user_src_port    : out   std_logic_vector (15 downto 0); 
          GTX_CLK              : out   std_logic; 
          PHY_TXD              : out   std_logic_vector (7 downto 0); 
          PHY_TX_EN            : out   std_logic; 
          PHY_TX_ER            : out   std_logic; 
          rx_addr              : out   std_logic_vector (63 downto 0); 
          rx_data              : out   std_logic_vector (63 downto 0); 
          rx_wren              : out   std_logic);
end Ethernet_Interface_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of Ethernet_Interface_MUSER_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   signal b_end_packet           : std_logic;
   signal gec_user_busy          : std_logic;
   signal gec_user_crc_err       : std_logic;
   signal gec_user_rx_data_out   : std_logic_vector (7 downto 0);
   signal gec_user_rx_size_out   : std_logic_vector (10 downto 0);
   signal gec_user_rx_valid_out  : std_logic;
   signal gec_user_trigger       : std_logic;
   signal gec_user_tx_data_in    : std_logic_vector (7 downto 0);
   signal gec_user_tx_enable_out : std_logic;
   signal gec_user_tx_size_in    : std_logic_vector (10 downto 0);
   signal XLXN_15874             : std_logic;
   component gigabit_ethernet_controller_MUSER_TOP_LEVEL
      port ( user_tx_data_in    : in    std_logic_vector (7 downto 0); 
             user_tx_size_in    : in    std_logic_vector (10 downto 0); 
             user_addrs         : in    std_logic_vector (7 downto 0); 
             GMII_RXD           : in    std_logic_vector (7 downto 0); 
             GMII_RX_CLK        : in    std_logic; 
             user_trigger       : in    std_logic; 
             reset              : in    std_logic; 
             GMII_RX_DV         : in    std_logic; 
             GMII_RX_ER         : in    std_logic; 
             user_dest_addrs    : in    std_logic_vector (7 downto 0); 
             user_dest_mac      : in    std_logic_vector (47 downto 0); 
             user_dest_port     : in    std_logic_vector (15 downto 0); 
             user_rx_size_out   : out   std_logic_vector (10 downto 0); 
             GMII_TX_EN         : out   std_logic; 
             GMII_TX_ER         : out   std_logic; 
             GTX_CLK            : out   std_logic; 
             user_busy          : out   std_logic; 
             user_rx_valid_out  : out   std_logic; 
             user_tx_enable_out : out   std_logic; 
             user_rx_data_out   : out   std_logic_vector (7 downto 0); 
             GMII_TXD           : out   std_logic_vector (7 downto 0); 
             user_src_addrs     : out   std_logic_vector (7 downto 0); 
             crc_err            : out   std_logic; 
             user_src_capture   : out   std_logic; 
             user_src_mac       : out   std_logic_vector (47 downto 0); 
             user_src_port      : out   std_logic_vector (15 downto 0));
   end component;
   
   component DATA_MANAGER_MUSER_TOP_LEVEL
      port ( reset                  : in    std_logic; 
             MASTER_CLK             : in    std_logic; 
             reset_n                : in    std_logic; 
             gec_user_rx_size_out   : in    std_logic_vector (10 downto 0); 
             gec_user_crc_err       : in    std_logic; 
             gec_user_rx_valid_out  : in    std_logic; 
             gec_user_rx_data_out   : in    std_logic_vector (7 downto 0); 
             gec_user_busy          : in    std_logic; 
             gec_user_tx_enable_out : in    std_logic; 
             b_data_we              : in    std_logic; 
             tx_data                : in    std_logic_vector (63 downto 0); 
             b_data                 : in    std_logic_vector (63 downto 0); 
             b_end_packet           : in    std_logic; 
             rx_data                : out   std_logic_vector (63 downto 0); 
             ram_wren               : out   std_logic; 
             ram_addr               : out   std_logic_vector (63 downto 0); 
             gec_user_tx_data_in    : out   std_logic_vector (7 downto 0); 
             gec_user_tx_size_in    : out   std_logic_vector (10 downto 0); 
             gec_user_trigger       : out   std_logic; 
             b_enable               : out   std_logic);
   end component;
   
   component burst_traffic_controller
      port ( MASTER_CLK       : in    std_logic; 
             RESET            : in    std_logic; 
             BURST_WE         : in    std_logic; 
             BURST_END_PACKET : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   GEC : gigabit_ethernet_controller_MUSER_TOP_LEVEL
      port map (GMII_RXD(7 downto 0)=>GMII_RXD(7 downto 0),
                GMII_RX_CLK=>MASTER_CLK,
                GMII_RX_DV=>GMII_RX_DV,
                GMII_RX_ER=>GMII_RX_ER,
                reset=>reset,
                user_addrs(7 downto 0)=>gec_user_addrs(7 downto 0),
                user_dest_addrs(7 downto 0)=>gec_user_dest_addrs(7 downto 0),
                user_dest_mac(47 downto 0)=>gec_user_dest_mac(47 downto 0),
                user_dest_port(15 downto 0)=>gec_user_dest_port(15 downto 0),
                user_trigger=>gec_user_trigger,
                user_tx_data_in(7 downto 0)=>gec_user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>gec_user_tx_size_in(10 downto 0),
                crc_err=>gec_user_crc_err,
                GMII_TXD(7 downto 0)=>PHY_TXD(7 downto 0),
                GMII_TX_EN=>PHY_TX_EN,
                GMII_TX_ER=>PHY_TX_ER,
                GTX_CLK=>GTX_CLK,
                user_busy=>gec_user_busy,
                user_rx_data_out(7 downto 0)=>gec_user_rx_data_out(7 downto 0),
                user_rx_size_out(10 downto 0)=>gec_user_rx_size_out(10 downto 0),
                user_rx_valid_out=>gec_user_rx_valid_out,
                user_src_addrs(7 downto 0)=>gec_user_src_addrs(7 downto 0),
                user_src_capture=>gec_user_src_capture,
                user_src_mac(47 downto 0)=>gec_user_src_mac(47 downto 0),
                user_src_port(15 downto 0)=>gec_user_src_port(15 downto 0),
                user_tx_enable_out=>gec_user_tx_enable_out);
   
   XLXI_3535 : DATA_MANAGER_MUSER_TOP_LEVEL
      port map (b_data(63 downto 0)=>b_data(63 downto 0),
                b_data_we=>b_data_we,
                b_end_packet=>b_end_packet,
                gec_user_busy=>gec_user_busy,
                gec_user_crc_err=>gec_user_crc_err,
                gec_user_rx_data_out(7 downto 0)=>gec_user_rx_data_out(7 downto 
            0),
                gec_user_rx_size_out(10 downto 0)=>gec_user_rx_size_out(10 
            downto 0),
                gec_user_rx_valid_out=>gec_user_rx_valid_out,
                gec_user_tx_enable_out=>gec_user_tx_enable_out,
                MASTER_CLK=>MASTER_CLK,
                reset=>reset,
                reset_n=>XLXN_15874,
                tx_data(63 downto 0)=>tx_data(63 downto 0),
                b_enable=>b_enable,
                gec_user_trigger=>gec_user_trigger,
                gec_user_tx_data_in(7 downto 0)=>gec_user_tx_data_in(7 downto 0),
                gec_user_tx_size_in(10 downto 0)=>gec_user_tx_size_in(10 downto 
            0),
                ram_addr(63 downto 0)=>rx_addr(63 downto 0),
                ram_wren=>rx_wren,
                rx_data(63 downto 0)=>rx_data(63 downto 0));
   
   XLXI_4124 : burst_traffic_controller
      port map (BURST_WE=>b_data_we,
                MASTER_CLK=>MASTER_CLK,
                RESET=>reset,
                BURST_END_PACKET=>b_end_packet);
   
   XLXI_5365 : INV
      port map (I=>reset,
                O=>XLXN_15874);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity D4_16E_MXILINX_TOP_LEVEL is
   port ( A0  : in    std_logic; 
          A1  : in    std_logic; 
          A2  : in    std_logic; 
          A3  : in    std_logic; 
          E   : in    std_logic; 
          D0  : out   std_logic; 
          D1  : out   std_logic; 
          D2  : out   std_logic; 
          D3  : out   std_logic; 
          D4  : out   std_logic; 
          D5  : out   std_logic; 
          D6  : out   std_logic; 
          D7  : out   std_logic; 
          D8  : out   std_logic; 
          D9  : out   std_logic; 
          D10 : out   std_logic; 
          D11 : out   std_logic; 
          D12 : out   std_logic; 
          D13 : out   std_logic; 
          D14 : out   std_logic; 
          D15 : out   std_logic);
end D4_16E_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of D4_16E_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   component AND5B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B3 : component is "BLACK_BOX";
   
   component AND5B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B2 : component is "BLACK_BOX";
   
   component AND5B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B1 : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component AND5B4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5B4 : component is "BLACK_BOX";
   
begin
   I_36_53 : AND5B3
      port map (I0=>A0,
                I1=>A1,
                I2=>A2,
                I3=>A3,
                I4=>E,
                O=>D8);
   
   I_36_54 : AND5B2
      port map (I0=>A1,
                I1=>A2,
                I2=>E,
                I3=>A3,
                I4=>A0,
                O=>D9);
   
   I_36_55 : AND5B2
      port map (I0=>A0,
                I1=>A2,
                I2=>E,
                I3=>A3,
                I4=>A1,
                O=>D10);
   
   I_36_56 : AND5B1
      port map (I0=>A2,
                I1=>A0,
                I2=>A1,
                I3=>A3,
                I4=>E,
                O=>D11);
   
   I_36_57 : AND5B2
      port map (I0=>A0,
                I1=>A1,
                I2=>E,
                I3=>A3,
                I4=>A2,
                O=>D12);
   
   I_36_58 : AND5B1
      port map (I0=>A1,
                I1=>A0,
                I2=>A2,
                I3=>A3,
                I4=>E,
                O=>D13);
   
   I_36_59 : AND5B1
      port map (I0=>A0,
                I1=>A1,
                I2=>A2,
                I3=>A3,
                I4=>E,
                O=>D14);
   
   I_36_60 : AND5
      port map (I0=>A3,
                I1=>A2,
                I2=>A1,
                I3=>A0,
                I4=>E,
                O=>D15);
   
   I_36_61 : AND5B2
      port map (I0=>A3,
                I1=>A0,
                I2=>E,
                I3=>A2,
                I4=>A1,
                O=>D6);
   
   I_36_62 : AND5B1
      port map (I0=>A3,
                I1=>A2,
                I2=>A1,
                I3=>A0,
                I4=>E,
                O=>D7);
   
   I_36_63 : AND5B2
      port map (I0=>A3,
                I1=>A1,
                I2=>E,
                I3=>A2,
                I4=>A0,
                O=>D5);
   
   I_36_64 : AND5B3
      port map (I0=>A0,
                I1=>A1,
                I2=>A3,
                I3=>A2,
                I4=>E,
                O=>D4);
   
   I_36_65 : AND5B2
      port map (I0=>A2,
                I1=>A3,
                I2=>E,
                I3=>A0,
                I4=>A1,
                O=>D3);
   
   I_36_66 : AND5B3
      port map (I0=>A0,
                I1=>A3,
                I2=>A2,
                I3=>A1,
                I4=>E,
                O=>D2);
   
   I_36_67 : AND5B3
      port map (I0=>A1,
                I1=>A2,
                I2=>A3,
                I3=>A0,
                I4=>E,
                O=>D1);
   
   I_36_68 : AND5B4
      port map (I0=>A3,
                I1=>A2,
                I2=>A1,
                I3=>A0,
                I4=>E,
                O=>D0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FD16RE_MXILINX_TOP_LEVEL is
   port ( C  : in    std_logic; 
          CE : in    std_logic; 
          D  : in    std_logic_vector (15 downto 0); 
          R  : in    std_logic; 
          Q  : out   std_logic_vector (15 downto 0));
end FD16RE_MXILINX_TOP_LEVEL;

architecture BEHAVIORAL of FD16RE_MXILINX_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   component FDRE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             R  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDRE : component is "BLACK_BOX";
   
begin
   I_Q0 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(0),
                R=>R,
                Q=>Q(0));
   
   I_Q1 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(1),
                R=>R,
                Q=>Q(1));
   
   I_Q2 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(2),
                R=>R,
                Q=>Q(2));
   
   I_Q3 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(3),
                R=>R,
                Q=>Q(3));
   
   I_Q4 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(4),
                R=>R,
                Q=>Q(4));
   
   I_Q5 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(5),
                R=>R,
                Q=>Q(5));
   
   I_Q6 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(6),
                R=>R,
                Q=>Q(6));
   
   I_Q7 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(7),
                R=>R,
                Q=>Q(7));
   
   I_Q8 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(8),
                R=>R,
                Q=>Q(8));
   
   I_Q9 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(9),
                R=>R,
                Q=>Q(9));
   
   I_Q10 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(10),
                R=>R,
                Q=>Q(10));
   
   I_Q11 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(11),
                R=>R,
                Q=>Q(11));
   
   I_Q12 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(12),
                R=>R,
                Q=>Q(12));
   
   I_Q13 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(13),
                R=>R,
                Q=>Q(13));
   
   I_Q14 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(14),
                R=>R,
                Q=>Q(14));
   
   I_Q15 : FDRE
      port map (C=>C,
                CE=>CE,
                D=>D(15),
                R=>R,
                Q=>Q(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity DELAY16_MUSER_TOP_LEVEL is
   port ( CLOCK_INIT : in    std_logic; 
          in_sig     : in    std_logic; 
          RESET_INIT : out   std_logic);
end DELAY16_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of DELAY16_MUSER_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   attribute INIT       : string ;
   signal XLXN_7     : std_logic;
   signal XLXN_8     : std_logic;
   signal XLXN_11    : std_logic;
   signal XLXN_36    : std_logic;
   signal XLXN_37    : std_logic;
   signal XLXN_39    : std_logic;
   signal XLXN_41    : std_logic;
   signal XLXN_45    : std_logic;
   signal XLXN_46    : std_logic;
   signal XLXN_48    : std_logic;
   signal XLXN_50    : std_logic;
   signal XLXN_54    : std_logic;
   signal XLXN_55    : std_logic;
   signal XLXN_57    : std_logic;
   signal XLXN_59    : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   attribute INIT of XLXI_1 : label is "1";
   attribute INIT of XLXI_2 : label is "1";
   attribute INIT of XLXI_3 : label is "1";
   attribute INIT of XLXI_7 : label is "1";
   attribute INIT of XLXI_36 : label is "1";
   attribute INIT of XLXI_37 : label is "1";
   attribute INIT of XLXI_38 : label is "1";
   attribute INIT of XLXI_39 : label is "1";
   attribute INIT of XLXI_40 : label is "1";
   attribute INIT of XLXI_41 : label is "1";
   attribute INIT of XLXI_42 : label is "1";
   attribute INIT of XLXI_43 : label is "1";
   attribute INIT of XLXI_44 : label is "1";
   attribute INIT of XLXI_45 : label is "1";
   attribute INIT of XLXI_46 : label is "1";
   attribute INIT of XLXI_47 : label is "1";
begin
   XLXI_1 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>in_sig,
                Q=>XLXN_11);
   
   XLXI_2 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_11,
                Q=>XLXN_8);
   
   XLXI_3 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_8,
                Q=>XLXN_7);
   
   XLXI_7 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_7,
                Q=>XLXN_41);
   
   XLXI_36 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_36,
                Q=>XLXN_50);
   
   XLXI_37 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_37,
                Q=>XLXN_36);
   
   XLXI_38 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_39,
                Q=>XLXN_37);
   
   XLXI_39 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_41,
                Q=>XLXN_39);
   
   XLXI_40 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_45,
                Q=>XLXN_59);
   
   XLXI_41 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_46,
                Q=>XLXN_45);
   
   XLXI_42 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_48,
                Q=>XLXN_46);
   
   XLXI_43 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_50,
                Q=>XLXN_48);
   
   XLXI_44 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_54,
                Q=>RESET_INIT);
   
   XLXI_45 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_55,
                Q=>XLXN_54);
   
   XLXI_46 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_57,
                Q=>XLXN_55);
   
   XLXI_47 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_59,
                Q=>XLXN_57);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity RESET_INIT_MUSER_TOP_LEVEL is
   port ( CLOCK_INIT : in    std_logic; 
          RESET_INIT : out   std_logic);
end RESET_INIT_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of RESET_INIT_MUSER_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   attribute INIT       : string ;
   signal XLXN_7     : std_logic;
   signal XLXN_8     : std_logic;
   signal XLXN_11    : std_logic;
   signal XLXN_14    : std_logic;
   signal XLXN_36    : std_logic;
   signal XLXN_37    : std_logic;
   signal XLXN_39    : std_logic;
   signal XLXN_41    : std_logic;
   signal XLXN_45    : std_logic;
   signal XLXN_46    : std_logic;
   signal XLXN_48    : std_logic;
   signal XLXN_50    : std_logic;
   signal XLXN_54    : std_logic;
   signal XLXN_55    : std_logic;
   signal XLXN_57    : std_logic;
   signal XLXN_59    : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute INIT of XLXI_1 : label is "1";
   attribute INIT of XLXI_2 : label is "1";
   attribute INIT of XLXI_3 : label is "1";
   attribute INIT of XLXI_7 : label is "1";
   attribute INIT of XLXI_36 : label is "1";
   attribute INIT of XLXI_37 : label is "1";
   attribute INIT of XLXI_38 : label is "1";
   attribute INIT of XLXI_39 : label is "1";
   attribute INIT of XLXI_40 : label is "1";
   attribute INIT of XLXI_41 : label is "1";
   attribute INIT of XLXI_42 : label is "1";
   attribute INIT of XLXI_43 : label is "1";
   attribute INIT of XLXI_44 : label is "1";
   attribute INIT of XLXI_45 : label is "1";
   attribute INIT of XLXI_46 : label is "1";
   attribute INIT of XLXI_47 : label is "1";
begin
   XLXI_1 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_14,
                Q=>XLXN_11);
   
   XLXI_2 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_11,
                Q=>XLXN_8);
   
   XLXI_3 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_8,
                Q=>XLXN_7);
   
   XLXI_7 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_7,
                Q=>XLXN_41);
   
   XLXI_36 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_36,
                Q=>XLXN_50);
   
   XLXI_37 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_37,
                Q=>XLXN_36);
   
   XLXI_38 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_39,
                Q=>XLXN_37);
   
   XLXI_39 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_41,
                Q=>XLXN_39);
   
   XLXI_40 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_45,
                Q=>XLXN_59);
   
   XLXI_41 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_46,
                Q=>XLXN_45);
   
   XLXI_42 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_48,
                Q=>XLXN_46);
   
   XLXI_43 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_50,
                Q=>XLXN_48);
   
   XLXI_44 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_54,
                Q=>RESET_INIT);
   
   XLXI_45 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_55,
                Q=>XLXN_54);
   
   XLXI_46 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_57,
                Q=>XLXN_55);
   
   XLXI_47 : FD
   -- synopsys translate_off
   generic map( INIT => '1')
   -- synopsys translate_on
      port map (C=>CLOCK_INIT,
                D=>XLXN_59,
                Q=>XLXN_57);
   
   XLXI_48 : GND
      port map (G=>XLXN_14);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity TOP_LEVEL is
   port ( BUSAA_02DN_05S   : in    std_logic; 
          BUSAA_02DP_04S   : in    std_logic; 
          BUSAA_06DN_13S   : in    std_logic; 
          BUSAA_06DP_12S   : in    std_logic; 
          BUSB_18DN_37S    : in    std_logic; 
          BUSB_18DP_36S    : in    std_logic; 
          BUSB_27DN_55S    : in    std_logic; 
          BUSB_27DP_54S    : in    std_logic; 
          BUSC_06DN_13S    : in    std_logic; 
          BUSC_06DP_12S    : in    std_logic; 
          BUSC_16DP_32S    : in    std_logic; 
          BUSC_17DN_35S    : in    std_logic; 
          BUSC_17DP_34S    : in    std_logic; 
          BUSC_18DN_37S    : in    std_logic; 
          BUSC_18DP_36S    : in    std_logic; 
          BUSC_19DN_39S    : in    std_logic; 
          BUSC_19DP_38S    : in    std_logic; 
          BUSC_20DN_41S    : in    std_logic; 
          BUSC_20DP_40S    : in    std_logic; 
          BUSC_27DP_54S    : in    std_logic; 
          BUSD_15DN_31S    : in    std_logic; 
          BUSD_15DP_30S    : in    std_logic; 
          BUSD_24DN_49S    : in    std_logic; 
          BUSD_24DP_48S    : in    std_logic; 
          GEL_RXCLK        : in    std_logic; 
          GENERAL_20DN_41S : in    std_logic; 
          GENERAL_20DP_40S : in    std_logic; 
          IP_MAC_0         : in    std_logic; 
          IP_MAC_1         : in    std_logic; 
          IP_MAC_2         : in    std_logic; 
          IP_MAC_3         : in    std_logic; 
          IP_MAC_4         : in    std_logic; 
          IP_MAC_5         : in    std_logic; 
          IP_MAC_6         : in    std_logic; 
          IP_MAC_7         : in    std_logic; 
          SECONDARY_CLK    : in    std_logic; 
          BUSAA_03DN_07S   : out   std_logic; 
          BUSAA_03DP_06S   : out   std_logic; 
          BUSAA_07DN_15S   : out   std_logic; 
          BUSAA_07DP_14S   : out   std_logic; 
          BUSA_21DN_43S    : out   std_logic; 
          BUSA_21DP_42S    : out   std_logic; 
          BUSA_22DN_45S    : out   std_logic; 
          BUSA_22DP_44S    : out   std_logic; 
          BUSA_23DP_46S    : out   std_logic; 
          BUSB_13DN_27S    : out   std_logic; 
          BUSB_13DP_26S    : out   std_logic; 
          BUSB_14DN_29S    : out   std_logic; 
          BUSB_14DP_28S    : out   std_logic; 
          BUSB_15DN_31S    : out   std_logic; 
          BUSB_15DP_30S    : out   std_logic; 
          BUSB_22DN_45S    : out   std_logic; 
          BUSB_22DP_44S    : out   std_logic; 
          BUSB_24DN_49S    : out   std_logic; 
          BUSB_24DP_48S    : out   std_logic; 
          BUSB_28DP_56S    : out   std_logic; 
          BUSB_29DN_59S    : out   std_logic; 
          BUSB_29DP_58S    : out   std_logic; 
          BUSB_30DN_61S    : out   std_logic; 
          BUSB_30DP_60S    : out   std_logic; 
          BUSB_31DN_63S    : out   std_logic; 
          BUSB_31DP_62S    : out   std_logic; 
          BUSC_02DP_04S    : out   std_logic; 
          BUSC_03DN_07S    : out   std_logic; 
          BUSC_03DP_06S    : out   std_logic; 
          BUSC_04DN_09S    : out   std_logic; 
          BUSC_04DP_08S    : out   std_logic; 
          BUSC_11DN_23S    : out   std_logic; 
          BUSC_11DP_22S    : out   std_logic; 
          BUSC_14DN_29S    : out   std_logic; 
          BUSC_14DP_28S    : out   std_logic; 
          BUSC_15DN_31S    : out   std_logic; 
          BUSC_15DP_30S    : out   std_logic; 
          BUSC_16DN_33S    : out   std_logic; 
          BUSC_24DN_49S    : out   std_logic; 
          BUSC_24DP_48S    : out   std_logic; 
          BUSC_25DN_51S    : out   std_logic; 
          BUSC_25DP_50S    : out   std_logic; 
          BUSC_26DN_53S    : out   std_logic; 
          BUSC_27DN_55S    : out   std_logic; 
          BUSD_18DN_37S    : out   std_logic; 
          BUSD_18DP_36S    : out   std_logic; 
          BUSD_21DN_43S    : out   std_logic; 
          BUSD_21DP_42S    : out   std_logic; 
          BUSD_25DN_51S    : out   std_logic; 
          BUSD_25DP_50S    : out   std_logic; 
          BUSD_26DN_53S    : out   std_logic; 
          BUSD_26DP_52S    : out   std_logic; 
          GENERAL_19DN_39S : out   std_logic; 
          GENERAL_19DP_38S : out   std_logic; 
          BUSC_21DN_43S    : inout std_logic);
end TOP_LEVEL;

architecture BEHAVIORAL of TOP_LEVEL is
   attribute BOX_TYPE              : string ;
   attribute CLK_FEEDBACK          : string ;
   attribute CLKDV_DIVIDE          : string ;
   attribute CLKFX_DIVIDE          : string ;
   attribute CLKFX_MULTIPLY        : string ;
   attribute CLKIN_DIVIDE_BY_2     : string ;
   attribute CLKIN_PERIOD          : string ;
   attribute CLKOUT_PHASE_SHIFT    : string ;
   attribute DCM_PERFORMANCE_MODE  : string ;
   attribute DESKEW_ADJUST         : string ;
   attribute DFS_FREQUENCY_MODE    : string ;
   attribute DLL_FREQUENCY_MODE    : string ;
   attribute DUTY_CYCLE_CORRECTION : string ;
   attribute FACTORY_JF            : string ;
   attribute PHASE_SHIFT           : string ;
   attribute STARTUP_WAIT          : string ;
   attribute DCM_AUTOCALIBRATION   : string ;
   attribute IOBDELAY_VALUE        : string ;
   attribute IOBDELAY_TYPE         : string ;
   attribute HU_SET                : string ;
   attribute IOSTANDARD            : string ;
   attribute CAPACITANCE           : string ;
   attribute SLEW                  : string ;
   attribute DRIVE                 : string ;
   attribute DIFF_TERM             : string ;
   signal ACC_CLK_IN                  : std_logic;
   signal ADC_CLK_DEL_MAP             : std_logic;
   signal adc_clk_del_reset           : std_logic;
   signal adc_clk_sel                 : std_logic;
   signal ADC_CLK_SEL_MAP             : std_logic;
   signal ADC_CLOCK_MAP               : std_logic;
   signal ADC_DCM_FB                  : std_logic;
   signal ADC_DELAY_MAP               : std_logic;
   signal ADC_SAMPLE_CAL              : std_logic;
   signal adc_ss_data                 : std_logic_vector (63 downto 0);
   signal adc_ss_data_we              : std_logic;
   signal ADC_TESTMODE_MAP            : std_logic;
   signal BURST_DATA_SEL_MAP          : std_logic;
   signal bypass_token_stack          : std_logic;
   signal b_data                      : std_logic_vector (63 downto 0);
   signal b_data_mode_sel             : std_logic_vector (4 downto 0);
   signal b_data_we                   : std_logic;
   signal cal_ctrl_psi_cmd_fifo_empty : std_logic;
   signal cal_ctrl_sw_en_pulse        : std_logic;
   signal cal_tag                     : std_logic_vector (15 downto 0);
   signal cal_tag_trig_num_sel        : std_logic;
   signal clock_5mhz                  : std_logic;
   signal dcm_reset                   : std_logic;
   signal dcm_reset_psi               : std_logic;
   signal delayed_token               : std_logic_vector (2 downto 0);
   signal dut_dcm_clk0                : std_logic_vector (2 downto 0);
   signal dut_dcm_clk0_inv            : std_logic_vector (2 downto 0);
   signal dut_dcm_clk90               : std_logic_vector (2 downto 0);
   signal dut_dcm_clk90_inv           : std_logic_vector (2 downto 0);
   signal dut_phase_ctrl              : std_logic_vector (15 downto 0);
   signal dut_ps_en                   : std_logic_vector (2 downto 0);
   signal dut_src_clk                 : std_logic;
   signal dut_src_clk_bufg            : std_logic;
   signal EN_TRIG_TOK_MAP             : std_logic;
   signal error_reset_req             : std_logic_vector (2 downto 0);
   signal event_number                : std_logic_vector (63 downto 0);
   signal EXT_CLK                     : std_logic;
   signal EXT_TRIGG                   : std_logic;
   signal first_in_chain              : std_logic_vector (3 downto 0);
   signal gec_addrs                   : std_logic_vector (7 downto 0);
   signal GEC_DEST_ADDRS_MAP          : std_logic;
   signal GEC_DEST_MACPORT_MAP        : std_logic;
   signal gec_macport                 : std_logic_vector (63 downto 0);
   signal gec_user_addrs              : std_logic_vector (7 downto 0);
   signal global_plaq_write_sel       : std_logic_vector (1 downto 0);
   signal GLOBAL_RESET_MAP            : std_logic;
   signal GMII_RXD_0_sig              : std_logic_vector (7 downto 0);
   signal GMII_RX_DV_0_sig            : std_logic;
   signal GMII_RX_ER_0_sig            : std_logic;
   signal GTX_CLK_0_sig               : std_logic;
   signal initial_reset               : std_logic;
   signal internal_acc_clk            : std_logic;
   signal internal_4x_clk             : std_logic;
   signal internal_4x180_clk          : std_logic;
   signal inv_psi_reset               : std_logic;
   signal levels_read0                : std_logic_vector (63 downto 0);
   signal levels_read1                : std_logic_vector (63 downto 0);
   signal man_sample_sel_bits         : std_logic_vector (7 downto 0);
   signal MAN_SAMPLE_SEL_MAP          : std_logic;
   signal MASTER_CLK                  : std_logic;
   signal MASTER_TRIGGER_MAP          : std_logic;
   signal MASTER_VETO_MAP             : std_logic;
   signal mux_clk_in0                 : std_logic;
   signal mux_clk_in90                : std_logic;
   signal mux_clk_in180               : std_logic;
   signal mux_clk_in270               : std_logic;
   signal mux_clk_out                 : std_logic;
   signal MUX_CLK_OUT_MAP             : std_logic;
   signal mux_clk_out_sel0            : std_logic;
   signal mux_clk_out_sel1            : std_logic;
   signal PHY_TXD_sig                 : std_logic_vector (7 downto 0);
   signal PHY_TXEN_sig                : std_logic;
   signal PHY_TXER_sig                : std_logic;
   signal plaq_id                     : std_logic_vector (8 downto 0);
   signal PLAQ_SEL_MAP                : std_logic;
   signal psi_burst_data              : std_logic_vector (63 downto 0);
   signal psi_burst_we                : std_logic;
   signal psi_b_data_we               : std_logic_vector (2 downto 0);
   signal psi_b_data_we_pre_and       : std_logic_vector (2 downto 0);
   signal PSI_CAL_TAG_MAP             : std_logic;
   signal PSI_CLK0                    : std_logic;
   signal PSI_CLK90                   : std_logic;
   signal PSI_CLK270                  : std_logic;
   signal psi_cmd_fifo_dout           : std_logic_vector (95 downto 0);
   signal psi_cmd_fifo_empty          : std_logic_vector (2 downto 0);
   signal psi_cmd_fifo_full           : std_logic_vector (2 downto 0);
   signal PSI_CMD_FIFO_MAP            : std_logic;
   signal psi_cmd_fifo_re             : std_logic_vector (2 downto 0);
   signal psi_cmd_sender_dout         : std_logic_vector (2 downto 0);
   signal psi_data_out                : std_logic_vector (3 downto 0);
   signal psi_delay_high              : std_logic;
   signal psi_dig_ctrl                : std_logic_vector (7 downto 0);
   signal psi_dig_data                : std_logic_vector (2 downto 0);
   signal psi_dig_data_delayed        : std_logic_vector (2 downto 0);
   signal psi_dig_data_delay_inc      : std_logic;
   signal psi_dig_data_delay_rst      : std_logic;
   signal PSI_DIG_MAP                 : std_logic;
   signal psi_dig_read                : std_logic_vector (63 downto 0);
   signal psi_dig_reset_req           : std_logic_vector (2 downto 0);
   signal psi_dig_sdata_clk           : std_logic_vector (2 downto 0);
   signal psi_dig_sm_ready            : std_logic_vector (2 downto 0);
   signal psi_errors                  : std_logic_vector (63 downto 0);
   signal psi_extdom_trig             : std_logic;
   signal psi_i2c_clk                 : std_logic_vector (2 downto 0);
   signal PSI_LEVELS_WE_MAP           : std_logic;
   signal psi_out_clk_sel             : std_logic_vector (7 downto 0);
   signal PSI_OUT_CLK_SELECT_MAP      : std_logic;
   signal PSI_PHASE_FLIP_MAP          : std_logic;
   signal PSI_PHASE_TOK_TRIG_MAP      : std_logic;
   signal PSI_PULSES_MAP              : std_logic;
   signal psi_reset                   : std_logic;
   signal PSI_SAMPLE_DEBUG_MAP        : std_logic;
   signal psi_status                  : std_logic_vector (63 downto 0);
   signal psi_status_en               : std_logic;
   signal PSI_STATUS_EN_MAP           : std_logic;
   signal psi_token_in                : std_logic_vector (2 downto 0);
   signal psi_token_in_mux            : std_logic_vector (2 downto 0);
   signal psi_token_out               : std_logic_vector (2 downto 0);
   signal psi_token_reset_n           : std_logic_vector (2 downto 0);
   signal psi_token_we                : std_logic;
   signal psi_trigger                 : std_logic;
   signal psi_trigger_mux             : std_logic_vector (2 downto 0);
   signal psi180_token_in             : std_logic_vector (2 downto 0);
   signal psi180_trigger              : std_logic;
   signal readout_reset               : std_logic;
   signal reset                       : std_logic;
   signal reset_button                : std_logic;
   signal reset_dig4x_dcm             : std_logic;
   signal reset_extension             : std_logic;
   signal RESET_MAP                   : std_logic;
   signal reset_n                     : std_logic;
   signal reset_phy                   : std_logic;
   signal reset_start                 : std_logic;
   signal rx_addr                     : std_logic_vector (63 downto 0);
   signal rx_data                     : std_logic_vector (63 downto 0);
   signal rx_wren                     : std_logic;
   signal sm_ready                    : std_logic_vector (2 downto 0);
   signal software_reset              : std_logic;
   signal third_dut_ctrl              : std_logic_vector (7 downto 0);
   signal timestamp                   : std_logic_vector (12 downto 0);
   signal token                       : std_logic_vector (3 downto 0);
   signal token_count                 : std_logic_vector (11 downto 0);
   signal TOKEN_STACK_MAP             : std_logic;
   signal token_throttle              : std_logic_vector (2 downto 0);
   signal trigger_busy                : std_logic;
   signal trigger_number              : std_logic_vector (63 downto 0);
   signal trig_reset                  : std_logic;
   signal tx_data                     : std_logic_vector (63 downto 0);
   signal vcc_sig                     : std_logic;
   signal XLXN_11574                  : std_logic;
   signal XLXN_12023                  : std_logic;
   signal XLXN_12172                  : std_logic;
   signal XLXN_12188                  : std_logic;
   signal XLXN_12220                  : std_logic;
   signal XLXN_12229                  : std_logic;
   signal XLXN_12257                  : std_logic;
   signal XLXN_12498                  : std_logic;
   signal XLXN_12503                  : std_logic;
   signal XLXN_12617                  : std_logic;
   signal XLXN_15064                  : std_logic;
   signal XLXN_15755                  : std_logic;
   signal XLXN_15847                  : std_logic;
   signal XLXN_15848                  : std_logic;
   signal XLXN_17193                  : std_logic;
   signal XLXN_17196                  : std_logic;
   signal XLXN_17199                  : std_logic;
   signal XLXN_17233                  : std_logic;
   signal XLXN_17239                  : std_logic;
   signal XLXN_17430                  : std_logic;
   signal XLXN_17517                  : std_logic;
   signal XLXN_18354                  : std_logic;
   signal XLXN_18355                  : std_logic;
   signal XLXN_18365                  : std_logic;
   signal XLXN_18372                  : std_logic;
   signal XLXN_18379                  : std_logic;
   signal XLXN_18389                  : std_logic;
   signal XLXN_18390                  : std_logic;
   signal XLXN_18398                  : std_logic;
   signal XLXN_18532                  : std_logic;
   signal XLXN_18537                  : std_logic;
   signal XLXN_18540                  : std_logic_vector (1 downto 0);
   signal XLXN_18546                  : std_logic_vector (1 downto 0);
   signal XLXN_18569                  : std_logic;
   signal XLXN_18597                  : std_logic;
   signal XLXN_18639                  : std_logic;
   signal XLXN_18694                  : std_logic;
   signal XLXN_18695                  : std_logic;
   signal XLXN_18698                  : std_logic;
   signal XLXN_18810                  : std_logic;
   signal XLXN_18856                  : std_logic_vector (2 downto 0);
   signal XLXN_18857                  : std_logic_vector (2 downto 0);
   signal XLXN_18983                  : std_logic;
   signal XLXN_18986                  : std_logic;
   signal XLXN_18989                  : std_logic;
   signal XLXN_18992                  : std_logic;
   signal XLXN_18993                  : std_logic;
   signal XLXN_19006                  : std_logic;
   signal XLXN_19007                  : std_logic;
   signal XLXN_19008                  : std_logic;
   signal XLXN_19009                  : std_logic;
   signal XLXN_19019                  : std_logic;
   signal XLXN_19020                  : std_logic;
   signal XLXN_19021                  : std_logic;
   signal XLXN_19101                  : std_logic_vector (2 downto 0);
   signal XLXN_19113                  : std_logic;
   signal XLXN_19130                  : std_logic;
   signal XLXN_19142                  : std_logic;
   signal XLXI_5338_in7_openSignal    : std_logic_vector (63 downto 0);
   component FDE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDE : component is "BLACK_BOX";
   
   component DCM_PS
      -- synopsys translate_off
      generic( CLK_FEEDBACK : string :=  "1X";
               CLKDV_DIVIDE : real :=  2.0;
               CLKFX_DIVIDE : integer :=  1;
               CLKFX_MULTIPLY : integer :=  4;
               CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
               CLKIN_PERIOD : real :=  10.0;
               CLKOUT_PHASE_SHIFT : string :=  "NONE";
               DCM_PERFORMANCE_MODE : string :=  "MAX_SPEED";
               DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
               DFS_FREQUENCY_MODE : string :=  "LOW";
               DLL_FREQUENCY_MODE : string :=  "LOW";
               DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
               FACTORY_JF : bit_vector :=  x"F0F0";
               PHASE_SHIFT : integer :=  0;
               STARTUP_WAIT : boolean :=  FALSE;
               DCM_AUTOCALIBRATION : boolean :=  TRUE);
      -- synopsys translate_on
      port ( CLKIN    : in    std_logic; 
             CLKFB    : in    std_logic; 
             RST      : in    std_logic; 
             PSINCDEC : in    std_logic; 
             PSEN     : in    std_logic; 
             PSCLK    : in    std_logic; 
             CLK0     : out   std_logic; 
             CLK90    : out   std_logic; 
             CLK180   : out   std_logic; 
             CLK270   : out   std_logic; 
             CLK2X    : out   std_logic; 
             CLK2X180 : out   std_logic; 
             CLKDV    : out   std_logic; 
             CLKFX    : out   std_logic; 
             CLKFX180 : out   std_logic; 
             LOCKED   : out   std_logic; 
             PSDONE   : out   std_logic; 
             DO       : out   std_logic_vector (15 downto 0));
   end component;
   attribute CLK_FEEDBACK of DCM_PS : component is "1X";
   attribute CLKDV_DIVIDE of DCM_PS : component is "2.0";
   attribute CLKFX_DIVIDE of DCM_PS : component is "1";
   attribute CLKFX_MULTIPLY of DCM_PS : component is "4";
   attribute CLKIN_DIVIDE_BY_2 of DCM_PS : component is "FALSE";
   attribute CLKIN_PERIOD of DCM_PS : component is "10.0";
   attribute CLKOUT_PHASE_SHIFT of DCM_PS : component is "NONE";
   attribute DCM_PERFORMANCE_MODE of DCM_PS : component is "MAX_SPEED";
   attribute DESKEW_ADJUST of DCM_PS : component is "SYSTEM_SYNCHRONOUS";
   attribute DFS_FREQUENCY_MODE of DCM_PS : component is "LOW";
   attribute DLL_FREQUENCY_MODE of DCM_PS : component is "LOW";
   attribute DUTY_CYCLE_CORRECTION of DCM_PS : component is "TRUE";
   attribute FACTORY_JF of DCM_PS : component is "F0F0";
   attribute PHASE_SHIFT of DCM_PS : component is "0";
   attribute STARTUP_WAIT of DCM_PS : component is "FALSE";
   attribute DCM_AUTOCALIBRATION of DCM_PS : component is "TRUE";
   attribute BOX_TYPE of DCM_PS : component is "BLACK_BOX";
   
   component External_Trigger_Handler
      port ( xclk             : in    std_logic; 
             ext_trig_line_in : in    std_logic; 
             ext_trigger      : out   std_logic);
   end component;
   
   component IDELAY
      -- synopsys translate_off
      generic( IOBDELAY_VALUE : integer :=  0;
               IOBDELAY_TYPE : string :=  "DEFAULT");
      -- synopsys translate_on
      port ( I   : in    std_logic; 
             CE  : in    std_logic; 
             C   : in    std_logic; 
             INC : in    std_logic; 
             RST : in    std_logic; 
             O   : out   std_logic);
   end component;
   attribute IOBDELAY_VALUE of IDELAY : component is "0";
   attribute IOBDELAY_TYPE of IDELAY : component is "DEFAULT";
   attribute BOX_TYPE of IDELAY : component is "BLACK_BOX";
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component M4_1E_MXILINX_TOP_LEVEL
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component psi_cmd_fifo32_512depth
      port ( rst    : in    std_logic; 
             wr_clk : in    std_logic; 
             rd_clk : in    std_logic; 
             wr_en  : in    std_logic; 
             rd_en  : in    std_logic; 
             din    : in    std_logic_vector (31 downto 0); 
             full   : out   std_logic; 
             empty  : out   std_logic; 
             dout   : out   std_logic_vector (31 downto 0));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component psi_command_sender
      port ( psi_clk    : in    std_logic; 
             reset      : in    std_logic; 
             fifo_empty : in    std_logic; 
             fifo_full  : in    std_logic; 
             data       : in    std_logic_vector (31 downto 0); 
             fifo_re    : out   std_logic; 
             data_error : out   std_logic; 
             we_error   : out   std_logic; 
             data_out   : out   std_logic);
   end component;
   
   component PSI_Dig_Block_MUSER_TOP_LEVEL
      port ( MASTER_CLK           : in    std_logic; 
             rd_token_in          : in    std_logic; 
             plaq_id              : in    std_logic_vector (2 downto 0); 
             first_in_chain       : in    std_logic; 
             psi_mode             : in    std_logic_vector (4 downto 0); 
             reset                : in    std_logic; 
             psi_dig_sdata_clk    : in    std_logic; 
             psi_dig_data_delayed : in    std_logic; 
             psi_token_in         : in    std_logic; 
             psi_token_out        : in    std_logic; 
             tokin_cnt            : in    std_logic_vector (19 downto 0); 
             token_stack_count    : in    std_logic_vector (3 downto 0); 
             time_stamp           : in    std_logic_vector (12 downto 0); 
             trig_cnt             : in    std_logic_vector (19 downto 0); 
             cal_tag_trig_num_sel : in    std_logic; 
             cal_tag              : in    std_logic_vector (15 downto 0); 
             bus_dout             : inout std_logic_vector (63 downto 0); 
             ovf_err              : out   std_logic; 
             rd_token_out         : out   std_logic; 
             we_out               : out   std_logic; 
             error_decoder_ovf    : out   std_logic; 
             error_reset_req      : out   std_logic; 
             sm_ready             : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component TokenStack
      port ( psi_clk       : in    std_logic; 
             rst           : in    std_logic; 
             error_rst_req : in    std_logic; 
             token_we      : in    std_logic; 
             sm_ready      : in    std_logic; 
             bypass_stack  : in    std_logic; 
             psi_reset_n   : out   std_logic; 
             ovf_flow      : out   std_logic; 
             throttle      : out   std_logic; 
             token_to_psi  : out   std_logic; 
             tok_cnt       : out   std_logic_vector (3 downto 0); 
             event_number  : out   std_logic_vector (19 downto 0));
   end component;
   
   component psi_token_delay_blk
      port ( clk         : in    std_logic; 
             token       : in    std_logic; 
             token_delay : out   std_logic);
   end component;
   
   component token_trigger_controller
      port ( is_ext_mode         : in    std_logic; 
             use_cal_inject      : in    std_logic; 
             sw_en_pulse         : in    std_logic; 
             param_we            : in    std_logic; 
             ext_trigger         : in    std_logic; 
             master_clk          : in    std_logic; 
             psi_clk             : in    std_logic; 
             rst                 : in    std_logic; 
             trig_repetition_per : in    std_logic_vector (15 downto 0); 
             inject_trig_gap     : in    std_logic_vector (7 downto 0); 
             trig_token_gap      : in    std_logic_vector (15 downto 0); 
             num_of_triggers     : in    std_logic_vector (7 downto 0); 
             token               : out   std_logic; 
             trigger             : out   std_logic; 
             error               : out   std_logic; 
             busy                : out   std_logic);
   end component;
   
   component DCM_ADV
      -- synopsys translate_off
      generic( CLK_FEEDBACK : string :=  "1X";
               CLKDV_DIVIDE : real :=  2.0;
               CLKFX_DIVIDE : integer :=  1;
               CLKFX_MULTIPLY : integer :=  4;
               CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
               CLKIN_PERIOD : real :=  10.0;
               CLKOUT_PHASE_SHIFT : string :=  "NONE";
               DCM_PERFORMANCE_MODE : string :=  "MAX_SPEED";
               DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
               DFS_FREQUENCY_MODE : string :=  "LOW";
               DLL_FREQUENCY_MODE : string :=  "LOW";
               DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
               FACTORY_JF : bit_vector :=  x"F0F0";
               PHASE_SHIFT : integer :=  0;
               STARTUP_WAIT : boolean :=  FALSE;
               DCM_AUTOCALIBRATION : boolean :=  TRUE);
      -- synopsys translate_on
      port ( CLKIN    : in    std_logic; 
             CLKFB    : in    std_logic; 
             RST      : in    std_logic; 
             PSINCDEC : in    std_logic; 
             PSEN     : in    std_logic; 
             PSCLK    : in    std_logic; 
             DADDR    : in    std_logic_vector (6 downto 0); 
             DI       : in    std_logic_vector (15 downto 0); 
             DWE      : in    std_logic; 
             DEN      : in    std_logic; 
             DCLK     : in    std_logic; 
             CLK0     : out   std_logic; 
             CLK90    : out   std_logic; 
             CLK180   : out   std_logic; 
             CLK270   : out   std_logic; 
             CLK2X    : out   std_logic; 
             CLK2X180 : out   std_logic; 
             CLKDV    : out   std_logic; 
             CLKFX    : out   std_logic; 
             CLKFX180 : out   std_logic; 
             LOCKED   : out   std_logic; 
             PSDONE   : out   std_logic; 
             DO       : out   std_logic_vector (15 downto 0); 
             DRDY     : out   std_logic);
   end component;
   attribute CLK_FEEDBACK of DCM_ADV : component is "1X";
   attribute CLKDV_DIVIDE of DCM_ADV : component is "2.0";
   attribute CLKFX_DIVIDE of DCM_ADV : component is "1";
   attribute CLKFX_MULTIPLY of DCM_ADV : component is "4";
   attribute CLKIN_DIVIDE_BY_2 of DCM_ADV : component is "FALSE";
   attribute CLKIN_PERIOD of DCM_ADV : component is "10.0";
   attribute CLKOUT_PHASE_SHIFT of DCM_ADV : component is "NONE";
   attribute DCM_PERFORMANCE_MODE of DCM_ADV : component is "MAX_SPEED";
   attribute DESKEW_ADJUST of DCM_ADV : component is "SYSTEM_SYNCHRONOUS";
   attribute DFS_FREQUENCY_MODE of DCM_ADV : component is "LOW";
   attribute DLL_FREQUENCY_MODE of DCM_ADV : component is "LOW";
   attribute DUTY_CYCLE_CORRECTION of DCM_ADV : component is "TRUE";
   attribute FACTORY_JF of DCM_ADV : component is "F0F0";
   attribute PHASE_SHIFT of DCM_ADV : component is "0";
   attribute STARTUP_WAIT of DCM_ADV : component is "FALSE";
   attribute DCM_AUTOCALIBRATION of DCM_ADV : component is "TRUE";
   attribute BOX_TYPE of DCM_ADV : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component IDELAYCTRL
      port ( REFCLK : in    std_logic; 
             RST    : in    std_logic; 
             RDY    : out   std_logic);
   end component;
   attribute BOX_TYPE of IDELAYCTRL : component is "BLACK_BOX";
   
   component DCM_BASE
      -- synopsys translate_off
      generic( CLK_FEEDBACK : string :=  "1X";
               CLKDV_DIVIDE : real :=  2.0;
               CLKFX_DIVIDE : integer :=  1;
               CLKFX_MULTIPLY : integer :=  4;
               CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
               CLKIN_PERIOD : real :=  10.0;
               CLKOUT_PHASE_SHIFT : string :=  "NONE";
               DCM_PERFORMANCE_MODE : string :=  "MAX_SPEED";
               DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
               DFS_FREQUENCY_MODE : string :=  "LOW";
               DLL_FREQUENCY_MODE : string :=  "LOW";
               DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
               FACTORY_JF : bit_vector :=  x"F0F0";
               PHASE_SHIFT : integer :=  0;
               STARTUP_WAIT : boolean :=  FALSE;
               DCM_AUTOCALIBRATION : boolean :=  TRUE);
      -- synopsys translate_on
      port ( CLKIN    : in    std_logic; 
             CLKFB    : in    std_logic; 
             RST      : in    std_logic; 
             CLK0     : out   std_logic; 
             CLK90    : out   std_logic; 
             CLK180   : out   std_logic; 
             CLK270   : out   std_logic; 
             CLK2X    : out   std_logic; 
             CLK2X180 : out   std_logic; 
             CLKDV    : out   std_logic; 
             CLKFX    : out   std_logic; 
             CLKFX180 : out   std_logic; 
             LOCKED   : out   std_logic);
   end component;
   attribute CLK_FEEDBACK of DCM_BASE : component is "1X";
   attribute CLKDV_DIVIDE of DCM_BASE : component is "2.0";
   attribute CLKFX_DIVIDE of DCM_BASE : component is "1";
   attribute CLKFX_MULTIPLY of DCM_BASE : component is "4";
   attribute CLKIN_DIVIDE_BY_2 of DCM_BASE : component is "FALSE";
   attribute CLKIN_PERIOD of DCM_BASE : component is "10.0";
   attribute CLKOUT_PHASE_SHIFT of DCM_BASE : component is "NONE";
   attribute DCM_PERFORMANCE_MODE of DCM_BASE : component is "MAX_SPEED";
   attribute DESKEW_ADJUST of DCM_BASE : component is "SYSTEM_SYNCHRONOUS";
   attribute DFS_FREQUENCY_MODE of DCM_BASE : component is "LOW";
   attribute DLL_FREQUENCY_MODE of DCM_BASE : component is "LOW";
   attribute DUTY_CYCLE_CORRECTION of DCM_BASE : component is "TRUE";
   attribute FACTORY_JF of DCM_BASE : component is "F0F0";
   attribute PHASE_SHIFT of DCM_BASE : component is "0";
   attribute STARTUP_WAIT of DCM_BASE : component is "FALSE";
   attribute DCM_AUTOCALIBRATION of DCM_BASE : component is "TRUE";
   attribute BOX_TYPE of DCM_BASE : component is "BLACK_BOX";
   
   component OR3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3B1 : component is "BLACK_BOX";
   
   component D4_16E_MXILINX_TOP_LEVEL
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
   
   component FDRE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             R  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDRE : component is "BLACK_BOX";
   
   component DELAY16_MUSER_TOP_LEVEL
      port ( CLOCK_INIT : in    std_logic; 
             in_sig     : in    std_logic; 
             RESET_INIT : out   std_logic);
   end component;
   
   component RESET_INIT_MUSER_TOP_LEVEL
      port ( CLOCK_INIT : in    std_logic; 
             RESET_INIT : out   std_logic);
   end component;
   
   component IBUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
   
   component IOBUF
      port ( I  : in    std_logic; 
             IO : inout std_logic; 
             O  : out   std_logic; 
             T  : in    std_logic);
   end component;
   attribute IOSTANDARD of IOBUF : component is "DEFAULT";
   attribute CAPACITANCE of IOBUF : component is "DONT_CARE";
   attribute SLEW of IOBUF : component is "SLOW";
   attribute DRIVE of IOBUF : component is "12";
   attribute BOX_TYPE of IOBUF : component is "BLACK_BOX";
   
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
   
   component VERSION_BLK
      port ( version : out   std_logic_vector (7 downto 0));
   end component;
   
   component FD16RE_MXILINX_TOP_LEVEL
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic_vector (15 downto 0); 
             R  : in    std_logic; 
             Q  : out   std_logic_vector (15 downto 0));
   end component;
   
   component PLAQ_ID_GEN
      port ( plaq_id0 : out   std_logic_vector (2 downto 0); 
             plaq_id1 : out   std_logic_vector (2 downto 0); 
             plaq_id2 : out   std_logic_vector (2 downto 0); 
             plaq_id3 : out   std_logic_vector (2 downto 0));
   end component;
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component M2_1_MXILINX_TOP_LEVEL
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component IBUFDS
      -- synopsys translate_off
      generic( DIFF_TERM : boolean :=  FALSE);
      -- synopsys translate_on
      port ( I  : in    std_logic; 
             IB : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFDS : component is "DEFAULT";
   attribute CAPACITANCE of IBUFDS : component is "DONT_CARE";
   attribute DIFF_TERM of IBUFDS : component is "FALSE";
   attribute BOX_TYPE of IBUFDS : component is "BLACK_BOX";
   
   component OBUFDS
      port ( I  : in    std_logic; 
             O  : out   std_logic; 
             OB : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUFDS : component is "DEFAULT";
   attribute CAPACITANCE of OBUFDS : component is "DONT_CARE";
   attribute BOX_TYPE of OBUFDS : component is "BLACK_BOX";
   
   component FTC_MXILINX_TOP_LEVEL
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component D2_4E_MXILINX_TOP_LEVEL
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component First_In_Chain_Gen
      port ( first_in_chain : out   std_logic_vector (3 downto 0));
   end component;
   
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
   
   component IBUFGDS
      -- synopsys translate_off
      generic( DIFF_TERM : boolean :=  FALSE);
      -- synopsys translate_on
      port ( I  : in    std_logic; 
             IB : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFGDS : component is "DEFAULT";
   attribute CAPACITANCE of IBUFGDS : component is "DONT_CARE";
   attribute DIFF_TERM of IBUFGDS : component is "FALSE";
   attribute BOX_TYPE of IBUFGDS : component is "BLACK_BOX";
   
   component Trigger_Counter_Block
      port ( master_clk      : in    std_logic; 
             psi_trigger     : in    std_logic; 
             reset           : in    std_logic; 
             trigger_counter : out   std_logic_vector (19 downto 0); 
             timestamp       : out   std_logic_vector (12 downto 0));
   end component;
   
   component MUX64_2
      port ( sel    : in    std_logic; 
             in0    : in    std_logic_vector (63 downto 0); 
             in1    : in    std_logic_vector (63 downto 0); 
             muxout : out   std_logic_vector (63 downto 0));
   end component;
   
   component FD8CE_MXILINX_TOP_LEVEL
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
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
   
   component FD8RE_MXILINX_TOP_LEVEL
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic_vector (7 downto 0); 
             R  : in    std_logic; 
             Q  : out   std_logic_vector (7 downto 0));
   end component;
   
   component calibration_controller
      port ( mclk                        : in    std_logic; 
             trigger_busy                : in    std_logic; 
             next_cal_trigger            : in    std_logic; 
             reset                       : in    std_logic; 
             psi_cmd_fifo_empty          : in    std_logic; 
             cal_en                      : in    std_logic; 
             error                       : out   std_logic; 
             cal_ctrl_psi_cmd_fifo_empty : out   std_logic; 
             cal_ctrl_sw_en_pulse        : out   std_logic);
   end component;
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   attribute CLKIN_PERIOD of dut_clk_dcm_0 : label is "26.0";
   attribute DCM_PERFORMANCE_MODE of dut_clk_dcm_0 : label is "MAX_RANGE";
   attribute CLKFX_MULTIPLY of dut_clk_dcm_0 : label is "2";
   attribute CLKFX_DIVIDE of dut_clk_dcm_0 : label is "2";
   attribute CLKOUT_PHASE_SHIFT of dut_clk_dcm_0 : label is "VARIABLE_CENTER";
   attribute CLKIN_PERIOD of dut_clk_dcm_1 : label is "26.0";
   attribute DCM_PERFORMANCE_MODE of dut_clk_dcm_1 : label is "MAX_RANGE";
   attribute CLKFX_MULTIPLY of dut_clk_dcm_1 : label is "2";
   attribute CLKFX_DIVIDE of dut_clk_dcm_1 : label is "2";
   attribute CLKOUT_PHASE_SHIFT of dut_clk_dcm_1 : label is "VARIABLE_CENTER";
   attribute CLKIN_PERIOD of dut_clk_dcm_2 : label is "26.0";
   attribute DCM_PERFORMANCE_MODE of dut_clk_dcm_2 : label is "MAX_RANGE";
   attribute CLKFX_MULTIPLY of dut_clk_dcm_2 : label is "2";
   attribute CLKFX_DIVIDE of dut_clk_dcm_2 : label is "2";
   attribute CLKOUT_PHASE_SHIFT of dut_clk_dcm_2 : label is "VARIABLE_CENTER";
   attribute IOBDELAY_TYPE of idelay_psi_dig_0 : label is "VARIABLE";
   attribute IOBDELAY_TYPE of idelay_psi_dig_1 : label is "VARIABLE";
   attribute IOBDELAY_TYPE of idelay_psi_dig_2 : label is "VARIABLE";
   attribute HU_SET of psi_cmd_clk_mux_0 : label is "psi_cmd_clk_mux_0_33";
   attribute HU_SET of psi_cmd_clk_mux_1 : label is "psi_cmd_clk_mux_1_32";
   attribute HU_SET of psi_cmd_clk_mux_2 : label is "psi_cmd_clk_mux_2_31";
   attribute CLKFX_MULTIPLY of XLXI_3254 : label is "16";
   attribute CLKFX_DIVIDE of XLXI_3254 : label is "27";
   attribute CLKIN_PERIOD of XLXI_3254 : label is "8.0";
   attribute CLKIN_PERIOD of XLXI_3410 : label is "8.0";
   attribute CLKFX_MULTIPLY of XLXI_3410 : label is "8";
   attribute CLKFX_DIVIDE of XLXI_3410 : label is "5";
   attribute HU_SET of XLXI_3432 : label is "XLXI_3432_6";
   attribute HU_SET of XLXI_4595 : label is "XLXI_4595_8";
   attribute CLKIN_PERIOD of XLXI_4615 : label is "26.0";
   attribute CLKFX_MULTIPLY of XLXI_4615 : label is "2";
   attribute CLKFX_DIVIDE of XLXI_4615 : label is "2";
   attribute DCM_PERFORMANCE_MODE of XLXI_4615 : label is "MAX_RANGE";
   attribute HU_SET of XLXI_4677 : label is "XLXI_4677_7";
   attribute HU_SET of XLXI_4773 : label is "XLXI_4773_14";
   attribute DIFF_TERM of XLXI_4794 : label is "TRUE";
   attribute HU_SET of XLXI_4846 : label is "XLXI_4846_13";
   attribute HU_SET of XLXI_5284 : label is "XLXI_5284_23";
   attribute DIFF_TERM of XLXI_5542 : label is "TRUE";
   attribute DIFF_TERM of XLXI_5548 : label is "TRUE";
   attribute HU_SET of XLXI_5561 : label is "XLXI_5561_9";
   attribute DIFF_TERM of XLXI_5567 : label is "TRUE";
   attribute HU_SET of XLXI_5677 : label is "XLXI_5677_10";
   attribute HU_SET of XLXI_5678 : label is "XLXI_5678_11";
   attribute HU_SET of XLXI_6015 : label is "XLXI_6015_12";
   attribute DIFF_TERM of XLXI_6040 : label is "TRUE";
   attribute HU_SET of XLXI_6067 : label is "XLXI_6067_15";
   attribute HU_SET of XLXI_6084 : label is "XLXI_6084_18";
   attribute HU_SET of XLXI_6086 : label is "XLXI_6086_16";
   attribute CLKIN_PERIOD of XLXI_6096 : label is "16.0";
   attribute CLKFX_DIVIDE of XLXI_6096 : label is "4";
   attribute HU_SET of XLXI_6104 : label is "XLXI_6104_34";
   attribute DIFF_TERM of XLXI_6184 : label is "TRUE";
   attribute HU_SET of XLXI_6193 : label is "XLXI_6193_17";
   attribute HU_SET of XLXI_6207 : label is "XLXI_6207_19";
   attribute HU_SET of XLXI_6260 : label is "XLXI_6260_22";
   attribute HU_SET of XLXI_6315 : label is "XLXI_6315_20";
   attribute HU_SET of XLXI_6323 : label is "XLXI_6323_21";
   attribute HU_SET of XLXI_6340 : label is "XLXI_6340_25";
   attribute HU_SET of XLXI_6341 : label is "XLXI_6341_26";
   attribute HU_SET of XLXI_6345 : label is "XLXI_6345_24";
   attribute HU_SET of XLXI_6356 : label is "XLXI_6356_27";
   attribute HU_SET of XLXI_6357 : label is "XLXI_6357_28";
   attribute HU_SET of XLXI_6360 : label is "XLXI_6360_29";
   attribute HU_SET of XLXI_6361 : label is "XLXI_6361_30";
   attribute CLKIN_PERIOD of XLXI_6376 : label is "25.0";
   attribute CLKFX_MULTIPLY of XLXI_6376 : label is "2";
   attribute CLKFX_DIVIDE of XLXI_6376 : label is "2";
   attribute HU_SET of XLXI_6377 : label is "XLXI_6377_35";
begin
   chipscope_dig_latch_0 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_18379,
                D=>psi_dig_data_delayed(0),
                Q=>psi_dig_read(0));
   
   chipscope_dig_latch_1 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_18379,
                D=>psi_dig_data_delayed(1),
                Q=>psi_dig_read(1));
   
   chipscope_dig_latch_2 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_18379,
                D=>psi_dig_data_delayed(2),
                Q=>psi_dig_read(2));
   
   dut_clk_dcm_0 : DCM_PS
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 26.0,
            DCM_PERFORMANCE_MODE => "MAX_RANGE",
            CLKFX_MULTIPLY => 2,
            CLKFX_DIVIDE => 2,
            CLKOUT_PHASE_SHIFT => "VARIABLE_CENTER")
   -- synopsys translate_on
      port map (CLKFB=>dut_dcm_clk0(0),
                CLKIN=>dut_src_clk_bufg,
                PSCLK=>MASTER_CLK,
                PSEN=>dut_ps_en(0),
                PSINCDEC=>dut_phase_ctrl(0),
                RST=>dut_phase_ctrl(4),
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>XLXN_18856(0),
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>XLXN_18857(0),
                CLK180=>open,
                CLK270=>open,
                DO=>open,
                LOCKED=>psi_status(1),
                PSDONE=>open);
   
   dut_clk_dcm_1 : DCM_PS
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 26.0,
            DCM_PERFORMANCE_MODE => "MAX_RANGE",
            CLKFX_MULTIPLY => 2,
            CLKFX_DIVIDE => 2,
            CLKOUT_PHASE_SHIFT => "VARIABLE_CENTER")
   -- synopsys translate_on
      port map (CLKFB=>dut_dcm_clk0(1),
                CLKIN=>dut_src_clk_bufg,
                PSCLK=>MASTER_CLK,
                PSEN=>dut_ps_en(1),
                PSINCDEC=>dut_phase_ctrl(0),
                RST=>dut_phase_ctrl(5),
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>XLXN_18856(1),
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>XLXN_18857(1),
                CLK180=>open,
                CLK270=>open,
                DO=>open,
                LOCKED=>psi_status(2),
                PSDONE=>open);
   
   dut_clk_dcm_2 : DCM_PS
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 26.0,
            DCM_PERFORMANCE_MODE => "MAX_RANGE",
            CLKFX_MULTIPLY => 2,
            CLKFX_DIVIDE => 2,
            CLKOUT_PHASE_SHIFT => "VARIABLE_CENTER")
   -- synopsys translate_on
      port map (CLKFB=>dut_dcm_clk0(2),
                CLKIN=>dut_src_clk_bufg,
                PSCLK=>MASTER_CLK,
                PSEN=>dut_ps_en(2),
                PSINCDEC=>dut_phase_ctrl(0),
                RST=>dut_phase_ctrl(6),
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>XLXN_18856(2),
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>XLXN_18857(2),
                CLK180=>open,
                CLK270=>open,
                DO=>open,
                LOCKED=>psi_status(3),
                PSDONE=>open);
   
   error_reset_ff_0 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18546(0),
                Q=>error_reset_req(0));
   
   error_reset_ff_1 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18546(1),
                Q=>error_reset_req(1));
   
   ext_trig_handler : External_Trigger_Handler
      port map (ext_trig_line_in=>EXT_TRIGG,
                xclk=>PSI_CLK90,
                ext_trigger=>psi_extdom_trig);
   
   idelay_psi_dig_0 : IDELAY
   -- synopsys translate_off
   generic map( IOBDELAY_TYPE => "VARIABLE")
   -- synopsys translate_on
      port map (C=>MASTER_CLK,
                CE=>psi_dig_data_delay_inc,
                I=>psi_dig_data(0),
                INC=>psi_delay_high,
                RST=>psi_dig_data_delay_rst,
                O=>psi_dig_data_delayed(0));
   
   idelay_psi_dig_1 : IDELAY
   -- synopsys translate_off
   generic map( IOBDELAY_TYPE => "VARIABLE")
   -- synopsys translate_on
      port map (C=>MASTER_CLK,
                CE=>psi_dig_data_delay_inc,
                I=>psi_dig_data(1),
                INC=>psi_delay_high,
                RST=>psi_dig_data_delay_rst,
                O=>psi_dig_data_delayed(1));
   
   idelay_psi_dig_2 : IDELAY
   -- synopsys translate_off
   generic map( IOBDELAY_TYPE => "VARIABLE")
   -- synopsys translate_on
      port map (C=>MASTER_CLK,
                CE=>psi_dig_data_delay_inc,
                I=>psi_dig_data(2),
                INC=>psi_delay_high,
                RST=>psi_dig_data_delay_rst,
                O=>psi_dig_data_delayed(2));
   
   psi_cmd_clk_bufg_0 : BUFG
      port map (I=>XLXN_19101(0),
                O=>psi_i2c_clk(0));
   
   psi_cmd_clk_bufg_1 : BUFG
      port map (I=>XLXN_19101(1),
                O=>psi_i2c_clk(1));
   
   psi_cmd_clk_bufg_2 : BUFG
      port map (I=>XLXN_19101(2),
                O=>psi_i2c_clk(2));
   
   psi_cmd_clk_mux_0 : M4_1E_MXILINX_TOP_LEVEL
      port map (D0=>dut_dcm_clk0(0),
                D1=>dut_dcm_clk90(0),
                D2=>dut_dcm_clk0_inv(0),
                D3=>dut_dcm_clk90_inv(0),
                E=>XLXN_18398,
                S0=>psi_out_clk_sel(0),
                S1=>psi_out_clk_sel(3),
                O=>XLXN_19101(0));
   
   psi_cmd_clk_mux_1 : M4_1E_MXILINX_TOP_LEVEL
      port map (D0=>dut_dcm_clk0(1),
                D1=>dut_dcm_clk90(1),
                D2=>dut_dcm_clk0_inv(1),
                D3=>dut_dcm_clk90_inv(1),
                E=>XLXN_18398,
                S0=>psi_out_clk_sel(1),
                S1=>psi_out_clk_sel(4),
                O=>XLXN_19101(1));
   
   psi_cmd_clk_mux_2 : M4_1E_MXILINX_TOP_LEVEL
      port map (D0=>dut_dcm_clk0(2),
                D1=>dut_dcm_clk90(2),
                D2=>dut_dcm_clk0_inv(2),
                D3=>dut_dcm_clk90_inv(2),
                E=>XLXN_18398,
                S0=>psi_out_clk_sel(2),
                S1=>psi_out_clk_sel(5),
                O=>XLXN_19101(2));
   
   psi_cmd_fifo_vector_0 : psi_cmd_fifo32_512depth
      port map (din(31 downto 0)=>rx_data(31 downto 0),
                rd_clk=>psi_i2c_clk(0),
                rd_en=>psi_cmd_fifo_re(0),
                rst=>psi_reset,
                wr_clk=>MASTER_CLK,
                wr_en=>PSI_CMD_FIFO_MAP,
                dout(31 downto 0)=>psi_cmd_fifo_dout(31 downto 0),
                empty=>psi_cmd_fifo_empty(0),
                full=>psi_cmd_fifo_full(0));
   
   psi_cmd_fifo_vector_1 : psi_cmd_fifo32_512depth
      port map (din(31 downto 0)=>rx_data(31 downto 0),
                rd_clk=>psi_i2c_clk(1),
                rd_en=>psi_cmd_fifo_re(1),
                rst=>psi_reset,
                wr_clk=>MASTER_CLK,
                wr_en=>PSI_CMD_FIFO_MAP,
                dout(31 downto 0)=>psi_cmd_fifo_dout(63 downto 32),
                empty=>psi_cmd_fifo_empty(1),
                full=>psi_cmd_fifo_full(1));
   
   psi_cmd_fifo_vector_2 : psi_cmd_fifo32_512depth
      port map (din(31 downto 0)=>rx_data(31 downto 0),
                rd_clk=>psi_i2c_clk(2),
                rd_en=>psi_cmd_fifo_re(2),
                rst=>psi_reset,
                wr_clk=>MASTER_CLK,
                wr_en=>PSI_CMD_FIFO_MAP,
                dout(31 downto 0)=>psi_cmd_fifo_dout(95 downto 64),
                empty=>psi_cmd_fifo_empty(2),
                full=>psi_cmd_fifo_full(2));
   
   psi_cmd_inv0_0 : INV
      port map (I=>dut_dcm_clk0(0),
                O=>dut_dcm_clk0_inv(0));
   
   psi_cmd_inv0_1 : INV
      port map (I=>dut_dcm_clk0(1),
                O=>dut_dcm_clk0_inv(1));
   
   psi_cmd_inv0_2 : INV
      port map (I=>dut_dcm_clk0(2),
                O=>dut_dcm_clk0_inv(2));
   
   psi_cmd_inv1_0 : INV
      port map (I=>dut_dcm_clk90(0),
                O=>dut_dcm_clk90_inv(0));
   
   psi_cmd_inv1_1 : INV
      port map (I=>dut_dcm_clk90(1),
                O=>dut_dcm_clk90_inv(1));
   
   psi_cmd_inv1_2 : INV
      port map (I=>dut_dcm_clk90(2),
                O=>dut_dcm_clk90_inv(2));
   
   psi_cmd_sender_vector_0 : psi_command_sender
      port map (data(31 downto 0)=>psi_cmd_fifo_dout(31 downto 0),
                fifo_empty=>psi_cmd_fifo_empty(0),
                fifo_full=>psi_cmd_fifo_full(0),
                psi_clk=>psi_i2c_clk(0),
                reset=>psi_reset,
                data_error=>psi_errors(32),
                data_out=>psi_cmd_sender_dout(0),
                fifo_re=>psi_cmd_fifo_re(0),
                we_error=>psi_errors(36));
   
   psi_cmd_sender_vector_1 : psi_command_sender
      port map (data(31 downto 0)=>psi_cmd_fifo_dout(63 downto 32),
                fifo_empty=>psi_cmd_fifo_empty(1),
                fifo_full=>psi_cmd_fifo_full(1),
                psi_clk=>psi_i2c_clk(1),
                reset=>psi_reset,
                data_error=>psi_errors(33),
                data_out=>psi_cmd_sender_dout(1),
                fifo_re=>psi_cmd_fifo_re(1),
                we_error=>psi_errors(37));
   
   psi_cmd_sender_vector_2 : psi_command_sender
      port map (data(31 downto 0)=>psi_cmd_fifo_dout(95 downto 64),
                fifo_empty=>psi_cmd_fifo_empty(2),
                fifo_full=>psi_cmd_fifo_full(2),
                psi_clk=>psi_i2c_clk(2),
                reset=>psi_reset,
                data_error=>psi_errors(34),
                data_out=>psi_cmd_sender_dout(2),
                fifo_re=>psi_cmd_fifo_re(2),
                we_error=>psi_errors(38));
   
   PSI_Dig_Blk_0 : PSI_Dig_Block_MUSER_TOP_LEVEL
      port map (cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_tag_trig_num_sel=>cal_tag_trig_num_sel,
                first_in_chain=>first_in_chain(0),
                MASTER_CLK=>MASTER_CLK,
                plaq_id(2 downto 0)=>plaq_id(2 downto 0),
                psi_dig_data_delayed=>psi_dig_data_delayed(0),
                psi_dig_sdata_clk=>psi_dig_sdata_clk(0),
                psi_mode(4 downto 0)=>b_data_mode_sel(4 downto 0),
                psi_token_in=>psi_token_in(0),
                psi_token_out=>delayed_token(0),
                rd_token_in=>token(0),
                reset=>readout_reset,
                time_stamp(12 downto 0)=>timestamp(12 downto 0),
                token_stack_count(3 downto 0)=>token_count(3 downto 0),
                tokin_cnt(19 downto 0)=>event_number(19 downto 0),
                trig_cnt(19 downto 0)=>trigger_number(19 downto 0),
                error_decoder_ovf=>psi_errors(4),
                error_reset_req=>psi_dig_reset_req(0),
                ovf_err=>psi_errors(0),
                rd_token_out=>token(1),
                sm_ready=>psi_dig_sm_ready(0),
                we_out=>psi_b_data_we_pre_and(0),
                bus_dout(63 downto 0)=>psi_burst_data(63 downto 0));
   
   PSI_Dig_Blk_1 : PSI_Dig_Block_MUSER_TOP_LEVEL
      port map (cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_tag_trig_num_sel=>cal_tag_trig_num_sel,
                first_in_chain=>first_in_chain(1),
                MASTER_CLK=>MASTER_CLK,
                plaq_id(2 downto 0)=>plaq_id(5 downto 3),
                psi_dig_data_delayed=>psi_dig_data_delayed(1),
                psi_dig_sdata_clk=>psi_dig_sdata_clk(1),
                psi_mode(4 downto 0)=>b_data_mode_sel(4 downto 0),
                psi_token_in=>psi_token_in(1),
                psi_token_out=>delayed_token(1),
                rd_token_in=>token(1),
                reset=>readout_reset,
                time_stamp(12 downto 0)=>timestamp(12 downto 0),
                token_stack_count(3 downto 0)=>token_count(7 downto 4),
                tokin_cnt(19 downto 0)=>event_number(39 downto 20),
                trig_cnt(19 downto 0)=>trigger_number(19 downto 0),
                error_decoder_ovf=>psi_errors(5),
                error_reset_req=>psi_dig_reset_req(1),
                ovf_err=>psi_errors(1),
                rd_token_out=>token(2),
                sm_ready=>psi_dig_sm_ready(1),
                we_out=>psi_b_data_we_pre_and(1),
                bus_dout(63 downto 0)=>psi_burst_data(63 downto 0));
   
   PSI_Dig_Blk_2 : PSI_Dig_Block_MUSER_TOP_LEVEL
      port map (cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_tag_trig_num_sel=>cal_tag_trig_num_sel,
                first_in_chain=>first_in_chain(2),
                MASTER_CLK=>MASTER_CLK,
                plaq_id(2 downto 0)=>plaq_id(8 downto 6),
                psi_dig_data_delayed=>psi_dig_data_delayed(2),
                psi_dig_sdata_clk=>psi_dig_sdata_clk(2),
                psi_mode(4 downto 0)=>b_data_mode_sel(4 downto 0),
                psi_token_in=>psi_token_in(2),
                psi_token_out=>delayed_token(2),
                rd_token_in=>token(2),
                reset=>readout_reset,
                time_stamp(12 downto 0)=>timestamp(12 downto 0),
                token_stack_count(3 downto 0)=>token_count(11 downto 8),
                tokin_cnt(19 downto 0)=>event_number(59 downto 40),
                trig_cnt(19 downto 0)=>trigger_number(19 downto 0),
                error_decoder_ovf=>psi_errors(6),
                error_reset_req=>psi_dig_reset_req(2),
                ovf_err=>psi_errors(2),
                rd_token_out=>token(3),
                sm_ready=>psi_dig_sm_ready(2),
                we_out=>psi_b_data_we_pre_and(2),
                bus_dout(63 downto 0)=>psi_burst_data(63 downto 0));
   
   RESET_REQ_AND_0 : AND2
      port map (I0=>psi_dig_ctrl(2),
                I1=>psi_dig_reset_req(0),
                O=>XLXN_18546(0));
   
   RESET_REQ_AND_1 : AND2
      port map (I0=>psi_dig_ctrl(3),
                I1=>psi_dig_reset_req(1),
                O=>XLXN_18546(1));
   
   sm_ready_ff_0 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18540(0),
                Q=>sm_ready(0));
   
   sm_ready_ff_1 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18540(1),
                Q=>sm_ready(1));
   
   SM_READY_OR_0 : OR2
      port map (I0=>psi_dig_ctrl(4),
                I1=>psi_dig_sm_ready(0),
                O=>XLXN_18540(0));
   
   SM_READY_OR_1 : OR2
      port map (I0=>psi_dig_ctrl(5),
                I1=>psi_dig_sm_ready(1),
                O=>XLXN_18540(1));
   
   TokenStack_vector_0 : TokenStack
      port map (bypass_stack=>bypass_token_stack,
                error_rst_req=>error_reset_req(0),
                psi_clk=>PSI_CLK90,
                rst=>psi_reset,
                sm_ready=>sm_ready(0),
                token_we=>psi_token_we,
                event_number(19 downto 0)=>event_number(19 downto 0),
                ovf_flow=>psi_errors(8),
                psi_reset_n=>psi_token_reset_n(0),
                throttle=>token_throttle(0),
                token_to_psi=>psi_token_in(0),
                tok_cnt(3 downto 0)=>token_count(3 downto 0));
   
   TokenStack_vector_1 : TokenStack
      port map (bypass_stack=>bypass_token_stack,
                error_rst_req=>error_reset_req(1),
                psi_clk=>PSI_CLK90,
                rst=>psi_reset,
                sm_ready=>sm_ready(1),
                token_we=>psi_token_we,
                event_number(19 downto 0)=>event_number(39 downto 20),
                ovf_flow=>psi_errors(9),
                psi_reset_n=>psi_token_reset_n(1),
                throttle=>token_throttle(1),
                token_to_psi=>psi_token_in(1),
                tok_cnt(3 downto 0)=>token_count(7 downto 4));
   
   TokenStack_vector_2 : TokenStack
      port map (bypass_stack=>bypass_token_stack,
                error_rst_req=>error_reset_req(2),
                psi_clk=>PSI_CLK90,
                rst=>psi_reset,
                sm_ready=>sm_ready(2),
                token_we=>psi_token_we,
                event_number(19 downto 0)=>event_number(59 downto 40),
                ovf_flow=>psi_errors(10),
                psi_reset_n=>psi_token_reset_n(2),
                throttle=>token_throttle(2),
                token_to_psi=>psi_token_in(2),
                tok_cnt(3 downto 0)=>token_count(11 downto 8));
   
   token_delay_vector_0 : psi_token_delay_blk
      port map (clk=>PSI_CLK90,
                token=>psi_token_out(0),
                token_delay=>delayed_token(0));
   
   token_delay_vector_1 : psi_token_delay_blk
      port map (clk=>PSI_CLK90,
                token=>psi_token_out(1),
                token_delay=>delayed_token(1));
   
   token_delay_vector_2 : psi_token_delay_blk
      port map (clk=>PSI_CLK90,
                token=>psi_token_out(2),
                token_delay=>delayed_token(2));
   
   token_trigger_blk : token_trigger_controller
      port map (ext_trigger=>psi_extdom_trig,
                inject_trig_gap(7 downto 0)=>rx_data(23 downto 16),
                is_ext_mode=>rx_data(48),
                master_clk=>MASTER_CLK,
                num_of_triggers(7 downto 0)=>rx_data(47 downto 40),
                param_we=>PSI_PULSES_MAP,
                psi_clk=>PSI_CLK90,
                rst=>trig_reset,
                sw_en_pulse=>cal_ctrl_sw_en_pulse,
                trig_repetition_per(15 downto 0)=>rx_data(15 downto 0),
                trig_token_gap(15 downto 0)=>rx_data(39 downto 24),
                use_cal_inject=>rx_data(56),
                busy=>trigger_busy,
                error=>psi_errors(40),
                token=>psi_token_we,
                trigger=>psi_trigger);
   
   WE_DIG_AND_0 : AND2
      port map (I0=>psi_dig_ctrl(6),
                I1=>psi_b_data_we_pre_and(0),
                O=>psi_b_data_we(0));
   
   WE_DIG_AND_1 : AND2
      port map (I0=>psi_dig_ctrl(7),
                I1=>psi_b_data_we_pre_and(1),
                O=>psi_b_data_we(1));
   
   XLXI_3254 : DCM_ADV
   -- synopsys translate_off
   generic map( CLKFX_MULTIPLY => 16,
            CLKFX_DIVIDE => 27,
            DLL_FREQUENCY_MODE => "LOW",
            DFS_FREQUENCY_MODE => "LOW",
            CLKIN_PERIOD => 8.0,
            CLKOUT_PHASE_SHIFT => "NONE")
   -- synopsys translate_on
      port map (CLKFB=>ADC_DCM_FB,
                CLKIN=>MASTER_CLK,
                DADDR(6 downto 0)=>rx_data(6 downto 0),
                DCLK=>MASTER_CLK,
                DEN=>ADC_CLOCK_MAP,
                DI(15 downto 0)=>rx_data(23 downto 8),
                DWE=>ADC_CLOCK_MAP,
                PSCLK=>XLXN_12188,
                PSEN=>XLXN_12188,
                PSINCDEC=>XLXN_12188,
                RST=>dcm_reset,
                CLKDV=>open,
                CLKFX=>internal_acc_clk,
                CLKFX180=>open,
                CLK0=>XLXN_11574,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                DO=>open,
                DRDY=>open,
                LOCKED=>psi_status(4),
                PSDONE=>open);
   
   XLXI_3265 : BUFG
      port map (I=>XLXN_11574,
                O=>ADC_DCM_FB);
   
   XLXI_3301 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(4),
                Q=>XLXN_17199);
   
   XLXI_3302 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(0),
                Q=>XLXN_17196);
   
   XLXI_3360 : INV
      port map (I=>reset_phy,
                O=>XLXN_12023);
   
   XLXI_3399 : BUFG
      port map (I=>XLXN_12172,
                O=>PSI_CLK0);
   
   XLXI_3402 : GND
      port map (G=>XLXN_12188);
   
   XLXI_3406 : IDELAYCTRL
      port map (REFCLK=>XLXN_15064,
                RST=>reset,
                RDY=>open);
   
   XLXI_3410 : DCM_BASE
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 8.0,
            CLKFX_MULTIPLY => 8,
            CLKFX_DIVIDE => 5)
   -- synopsys translate_on
      port map (CLKFB=>XLXN_12229,
                CLKIN=>MASTER_CLK,
                RST=>reset,
                CLKDV=>open,
                CLKFX=>XLXN_12257,
                CLKFX180=>open,
                CLK0=>XLXN_12220,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>open);
   
   XLXI_3411 : BUFG
      port map (I=>XLXN_12220,
                O=>XLXN_12229);
   
   XLXI_3427 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(1),
                Q=>XLXN_17193);
   
   XLXI_3430 : OR3B1
      port map (I0=>reset_button,
                I1=>software_reset,
                I2=>initial_reset,
                O=>reset_start);
   
   XLXI_3432 : D4_16E_MXILINX_TOP_LEVEL
      port map (A0=>rx_addr(8),
                A1=>rx_addr(9),
                A2=>rx_addr(10),
                A3=>rx_addr(11),
                E=>XLXN_12617,
                D0=>open,
                D1=>ADC_CLOCK_MAP,
                D2=>RESET_MAP,
                D3=>PSI_PULSES_MAP,
                D4=>PLAQ_SEL_MAP,
                D5=>BURST_DATA_SEL_MAP,
                D6=>ADC_DELAY_MAP,
                D7=>GLOBAL_RESET_MAP,
                D8=>ADC_TESTMODE_MAP,
                D9=>PSI_LEVELS_WE_MAP,
                D10=>PSI_STATUS_EN_MAP,
                D11=>PSI_SAMPLE_DEBUG_MAP,
                D12=>PSI_CMD_FIFO_MAP,
                D13=>EN_TRIG_TOK_MAP,
                D14=>open,
                D15=>PSI_CAL_TAG_MAP);
   
   XLXI_3469 : OR2
      port map (I0=>software_reset,
                I1=>initial_reset,
                O=>reset_phy);
   
   XLXI_3521 : AND2
      port map (I0=>reset_extension,
                I1=>clock_5mhz,
                O=>XLXN_12503);
   
   XLXI_3522 : OR2
      port map (I0=>XLXN_12503,
                I1=>MASTER_CLK,
                O=>XLXN_12498);
   
   XLXI_3523 : FDRE
      port map (C=>XLXN_12498,
                CE=>GLOBAL_RESET_MAP,
                D=>rx_data(0),
                R=>reset_extension,
                Q=>software_reset);
   
   XLXI_4004 : DELAY16_MUSER_TOP_LEVEL
      port map (CLOCK_INIT=>clock_5mhz,
                in_sig=>reset_start,
                RESET_INIT=>reset_extension);
   
   XLXI_4005 : OR2
      port map (I0=>reset_start,
                I1=>reset_extension,
                O=>reset);
   
   XLXI_4006 : RESET_INIT_MUSER_TOP_LEVEL
      port map (CLOCK_INIT=>clock_5mhz,
                RESET_INIT=>initial_reset);
   
   XLXI_4007 : INV
      port map (I=>reset,
                O=>reset_n);
   
   XLXI_4090 : FDE
      port map (C=>MASTER_CLK,
                CE=>BURST_DATA_SEL_MAP,
                D=>rx_data(4),
                Q=>b_data_mode_sel(2));
   
   XLXI_4136 : IBUFG
      port map (I=>SECONDARY_CLK,
                O=>clock_5mhz);
   
   XLXI_4171 : IOBUF
      port map (I=>XLXN_12023,
                T=>XLXN_12023,
                O=>reset_button,
                IO=>BUSC_21DN_43S);
   
   XLXI_4177 : OBUF
      port map (I=>PHY_TXEN_sig,
                O=>BUSC_27DN_55S);
   
   XLXI_4178 : IBUF
      port map (I=>BUSC_27DP_54S,
                O=>GMII_RX_DV_0_sig);
   
   XLXI_4179 : OBUF
      port map (I=>GTX_CLK_0_sig,
                O=>BUSC_26DN_53S);
   
   XLXI_4181 : OBUF
      port map (I=>PHY_TXD_sig(3),
                O=>BUSC_24DP_48S);
   
   XLXI_4182 : OBUF
      port map (I=>PHY_TXD_sig(2),
                O=>BUSC_24DN_49S);
   
   XLXI_4183 : OBUF
      port map (I=>PHY_TXD_sig(1),
                O=>BUSC_25DP_50S);
   
   XLXI_4184 : OBUF
      port map (I=>PHY_TXD_sig(0),
                O=>BUSC_25DN_51S);
   
   XLXI_4213 : IBUF
      port map (I=>BUSC_20DP_40S,
                O=>GMII_RXD_0_sig(7));
   
   XLXI_4214 : IBUF
      port map (I=>BUSC_20DN_41S,
                O=>GMII_RXD_0_sig(6));
   
   XLXI_4216 : IBUF
      port map (I=>BUSC_19DP_38S,
                O=>GMII_RXD_0_sig(5));
   
   XLXI_4217 : IBUF
      port map (I=>BUSC_19DN_39S,
                O=>GMII_RXD_0_sig(4));
   
   XLXI_4218 : IBUF
      port map (I=>BUSC_18DP_36S,
                O=>GMII_RXD_0_sig(3));
   
   XLXI_4219 : IBUF
      port map (I=>BUSC_18DN_37S,
                O=>GMII_RXD_0_sig(2));
   
   XLXI_4220 : IBUF
      port map (I=>BUSC_17DP_34S,
                O=>GMII_RXD_0_sig(1));
   
   XLXI_4221 : IBUF
      port map (I=>BUSC_17DN_35S,
                O=>GMII_RXD_0_sig(0));
   
   XLXI_4246 : OBUF
      port map (I=>PHY_TXER_sig,
                O=>BUSC_16DN_33S);
   
   XLXI_4247 : OBUF
      port map (I=>PHY_TXD_sig(4),
                O=>BUSC_15DN_31S);
   
   XLXI_4248 : IBUF
      port map (I=>BUSC_16DP_32S,
                O=>GMII_RX_ER_0_sig);
   
   XLXI_4249 : OBUF
      port map (I=>PHY_TXD_sig(5),
                O=>BUSC_15DP_30S);
   
   XLXI_4250 : OBUF
      port map (I=>PHY_TXD_sig(6),
                O=>BUSC_14DN_29S);
   
   XLXI_4251 : OBUF
      port map (I=>PHY_TXD_sig(7),
                O=>BUSC_14DP_28S);
   
   XLXI_4253 : IBUFG
      port map (I=>GEL_RXCLK,
                O=>MASTER_CLK);
   
   XLXI_4294 : IBUF
      port map (I=>IP_MAC_1,
                O=>gec_user_addrs(1));
   
   XLXI_4295 : IBUF
      port map (I=>IP_MAC_2,
                O=>gec_user_addrs(2));
   
   XLXI_4296 : IBUF
      port map (I=>IP_MAC_0,
                O=>gec_user_addrs(0));
   
   XLXI_4359 : VERSION_BLK
      port map (version(7 downto 0)=>psi_status(63 downto 56));
   
   XLXI_4529 : BUFG
      port map (I=>XLXN_12257,
                O=>XLXN_15064);
   
   XLXI_4576 : OR2
      port map (I0=>reset,
                I1=>XLXN_17193,
                O=>dcm_reset_psi);
   
   XLXI_4595 : FD16RE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_CAL_TAG_MAP,
                D(15 downto 0)=>rx_data(15 downto 0),
                R=>reset,
                Q(15 downto 0)=>cal_tag(15 downto 0));
   
   XLXI_4615 : DCM_BASE
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 26.0,
            CLKFX_MULTIPLY => 2,
            CLKFX_DIVIDE => 2,
            DCM_PERFORMANCE_MODE => "MAX_RANGE",
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLK_FEEDBACK => "1X")
   -- synopsys translate_on
      port map (CLKFB=>PSI_CLK0,
                CLKIN=>dut_src_clk_bufg,
                RST=>dcm_reset_psi,
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>XLXN_12172,
                CLK2X=>XLXN_18537,
                CLK2X180=>open,
                CLK90=>XLXN_18993,
                CLK180=>open,
                CLK270=>XLXN_18992,
                LOCKED=>psi_status(0));
   
   XLXI_4660 : PLAQ_ID_GEN
      port map (plaq_id0(2 downto 0)=>plaq_id(2 downto 0),
                plaq_id1(2 downto 0)=>plaq_id(5 downto 3),
                plaq_id2(2 downto 0)=>plaq_id(8 downto 6),
                plaq_id3=>open);
   
   XLXI_4677 : D4_16E_MXILINX_TOP_LEVEL
      port map (A0=>rx_addr(8),
                A1=>rx_addr(9),
                A2=>rx_addr(10),
                A3=>rx_addr(11),
                E=>XLXN_15755,
                D0=>ADC_CLK_SEL_MAP,
                D1=>ADC_CLK_DEL_MAP,
                D2=>ADC_SAMPLE_CAL,
                D3=>MAN_SAMPLE_SEL_MAP,
                D4=>MASTER_TRIGGER_MAP,
                D5=>TOKEN_STACK_MAP,
                D6=>open,
                D7=>open,
                D8=>MUX_CLK_OUT_MAP,
                D9=>GEC_DEST_MACPORT_MAP,
                D10=>GEC_DEST_ADDRS_MAP,
                D11=>PSI_OUT_CLK_SELECT_MAP,
                D12=>PSI_PHASE_TOK_TRIG_MAP,
                D13=>PSI_PHASE_FLIP_MAP,
                D14=>MASTER_VETO_MAP,
                D15=>PSI_DIG_MAP);
   
   XLXI_4696 : AND2
      port map (I0=>rx_addr(12),
                I1=>rx_wren,
                O=>XLXN_15755);
   
   XLXI_4697 : AND2B1
      port map (I0=>rx_addr(12),
                I1=>rx_wren,
                O=>XLXN_12617);
   
   XLXI_4704 : FDE
      port map (C=>MASTER_CLK,
                CE=>PLAQ_SEL_MAP,
                D=>rx_data(0),
                Q=>global_plaq_write_sel(0));
   
   XLXI_4773 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>XLXN_18532,
                D1=>EXT_CLK,
                S0=>adc_clk_sel,
                O=>dut_src_clk);
   
   XLXI_4776 : FDE
      port map (C=>MASTER_CLK,
                CE=>ADC_CLK_SEL_MAP,
                D=>rx_data(0),
                Q=>adc_clk_sel);
   
   XLXI_4781 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_CAL_TAG_MAP,
                D=>rx_data(16),
                Q=>cal_tag_trig_num_sel);
   
   XLXI_4794 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSD_24DP_48S,
                IB=>BUSD_24DN_49S,
                O=>EXT_TRIGG);
   
   XLXI_4830 : OBUFDS
      port map (I=>EXT_CLK,
                O=>BUSD_25DP_50S,
                OB=>BUSD_25DN_51S);
   
   XLXI_4831 : OBUFDS
      port map (I=>EXT_TRIGG,
                O=>BUSD_26DP_52S,
                OB=>BUSD_26DN_53S);
   
   XLXI_4832 : OBUFDS
      port map (I=>EXT_CLK,
                O=>BUSB_15DP_30S,
                OB=>BUSB_15DN_31S);
   
   XLXI_4833 : OBUFDS
      port map (I=>EXT_TRIGG,
                O=>BUSB_24DP_48S,
                OB=>BUSB_24DN_49S);
   
   XLXI_4844 : BUFG
      port map (I=>XLXN_18537,
                O=>ACC_CLK_IN);
   
   XLXI_4846 : FTC_MXILINX_TOP_LEVEL
      port map (C=>internal_acc_clk,
                CLR=>XLXN_15847,
                T=>XLXN_15848,
                Q=>XLXN_18532);
   
   XLXI_4847 : GND
      port map (G=>XLXN_15847);
   
   XLXI_4848 : VCC
      port map (P=>XLXN_15848);
   
   XLXI_5033 : FDE
      port map (C=>MASTER_CLK,
                CE=>BURST_DATA_SEL_MAP,
                D=>rx_data(0),
                Q=>b_data_mode_sel(0));
   
   XLXI_5104 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_SAMPLE_DEBUG_MAP,
                D=>rx_data(4),
                Q=>b_data_mode_sel(4));
   
   XLXI_5105 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_SAMPLE_DEBUG_MAP,
                D=>rx_data(0),
                Q=>b_data_mode_sel(3));
   
   XLXI_5137 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_STATUS_EN_MAP,
                D=>rx_data(0),
                Q=>psi_status_en);
   
   XLXI_5229 : FDE
      port map (C=>MASTER_CLK,
                CE=>BURST_DATA_SEL_MAP,
                D=>rx_data(1),
                Q=>b_data_mode_sel(1));
   
   XLXI_5272 : FDE
      port map (C=>MASTER_CLK,
                CE=>PLAQ_SEL_MAP,
                D=>rx_data(1),
                Q=>global_plaq_write_sel(1));
   
   XLXI_5284 : D2_4E_MXILINX_TOP_LEVEL
      port map (A0=>global_plaq_write_sel(0),
                A1=>global_plaq_write_sel(1),
                E=>psi_cmd_sender_dout(2),
                D0=>open,
                D1=>open,
                D2=>psi_data_out(2),
                D3=>open);
   
   XLXI_5316 : First_In_Chain_Gen
      port map (first_in_chain(3 downto 0)=>first_in_chain(3 downto 0));
   
   XLXI_5338 : MUX64_8
      port map (in0(63 downto 0)=>psi_status(63 downto 0),
                in1(63 downto 0)=>psi_errors(63 downto 0),
                in2(63 downto 0)=>trigger_number(63 downto 0),
                in3(63 downto 0)=>psi_dig_read(63 downto 0),
                in4(63 downto 0)=>levels_read0(63 downto 0),
                in5(63 downto 0)=>levels_read1(63 downto 0),
                in6(63 downto 0)=>event_number(63 downto 0),
                in7(63 downto 0)=>XLXI_5338_in7_openSignal(63 downto 0),
                sel(2 downto 0)=>rx_addr(10 downto 8),
                muxout(63 downto 0)=>tx_data(63 downto 0));
   
   XLXI_5542 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSB_27DP_54S,
                IB=>BUSB_27DN_55S,
                O=>psi_token_out(0));
   
   XLXI_5543 : OBUFDS
      port map (I=>dut_dcm_clk90(0),
                O=>BUSB_22DP_44S,
                OB=>BUSB_22DN_45S);
   
   XLXI_5544 : OBUFDS
      port map (I=>psi_data_out(0),
                O=>BUSB_31DP_62S,
                OB=>BUSB_31DN_63S);
   
   XLXI_5545 : OBUFDS
      port map (I=>psi_token_in_mux(0),
                O=>BUSB_29DP_58S,
                OB=>BUSB_29DN_59S);
   
   XLXI_5546 : OBUF
      port map (I=>XLXN_18983,
                O=>BUSB_28DP_56S);
   
   XLXI_5547 : OBUFDS
      port map (I=>psi_trigger_mux(0),
                O=>BUSB_30DP_60S,
                OB=>BUSB_30DN_61S);
   
   XLXI_5548 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSAA_02DP_04S,
                IB=>BUSAA_02DN_05S,
                O=>psi_token_out(1));
   
   XLXI_5549 : OBUFDS
      port map (I=>dut_dcm_clk90(1),
                O=>BUSAA_07DP_14S,
                OB=>BUSAA_07DN_15S);
   
   XLXI_5550 : OBUFDS
      port map (I=>psi_data_out(1),
                O=>BUSA_21DP_42S,
                OB=>BUSA_21DN_43S);
   
   XLXI_5551 : OBUFDS
      port map (I=>psi_token_in_mux(1),
                O=>BUSAA_03DP_06S,
                OB=>BUSAA_03DN_07S);
   
   XLXI_5552 : OBUF
      port map (I=>XLXN_18986,
                O=>BUSA_23DP_46S);
   
   XLXI_5553 : OBUFDS
      port map (I=>psi_trigger_mux(1),
                O=>BUSA_22DP_44S,
                OB=>BUSA_22DN_45S);
   
   XLXI_5561 : D4_16E_MXILINX_TOP_LEVEL
      port map (A0=>rx_addr(0),
                A1=>rx_addr(1),
                A2=>rx_addr(2),
                A3=>rx_addr(3),
                E=>ADC_DELAY_MAP,
                D0=>XLXN_19019,
                D1=>XLXN_19020,
                D2=>XLXN_19021,
                D3=>open,
                D4=>open,
                D5=>open,
                D6=>open,
                D7=>open,
                D8=>open,
                D9=>open,
                D10=>open,
                D11=>open,
                D12=>open,
                D13=>XLXN_19008,
                D14=>open,
                D15=>XLXN_19009);
   
   XLXI_5567 : IBUFGDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSD_15DP_30S,
                IB=>BUSD_15DN_31S,
                O=>EXT_CLK);
   
   XLXI_5573 : OR2
      port map (I0=>reset,
                I1=>XLXN_17196,
                O=>dcm_reset);
   
   XLXI_5579 : OR2
      port map (I0=>reset,
                I1=>XLXN_17233,
                O=>trig_reset);
   
   XLXI_5580 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(12),
                Q=>XLXN_17233);
   
   XLXI_5581 : INV
      port map (I=>psi_reset,
                O=>inv_psi_reset);
   
   XLXI_5583 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(16),
                Q=>XLXN_17239);
   
   XLXI_5598 : Trigger_Counter_Block
      port map (master_clk=>MASTER_CLK,
                psi_trigger=>psi_trigger,
                reset=>psi_reset,
                timestamp(12 downto 0)=>timestamp(12 downto 0),
                trigger_counter(19 downto 0)=>trigger_number(19 downto 0));
   
   XLXI_5654 : OR2
      port map (I0=>reset,
                I1=>XLXN_17430,
                O=>adc_clk_del_reset);
   
   XLXI_5655 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(24),
                Q=>XLXN_17430);
   
   XLXI_5676 : MUX64_2
      port map (in0(63 downto 0)=>adc_ss_data(63 downto 0),
                in1(63 downto 0)=>psi_burst_data(63 downto 0),
                sel=>b_data_mode_sel(2),
                muxout(63 downto 0)=>b_data(63 downto 0));
   
   XLXI_5677 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>adc_ss_data_we,
                D1=>psi_burst_we,
                S0=>b_data_mode_sel(2),
                O=>b_data_we);
   
   XLXI_5678 : FD8CE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>MAN_SAMPLE_SEL_MAP,
                CLR=>XLXN_17517,
                D(7 downto 0)=>rx_data(7 downto 0),
                Q(7 downto 0)=>man_sample_sel_bits(7 downto 0));
   
   XLXI_5679 : GND
      port map (G=>XLXN_17517);
   
   XLXI_5683 : BUF
      port map (I=>token(3),
                O=>token(0));
   
   XLXI_5976 : AND2
      port map (I0=>inv_psi_reset,
                I1=>psi_token_reset_n(0),
                O=>XLXN_18983);
   
   XLXI_5977 : AND2
      port map (I0=>inv_psi_reset,
                I1=>psi_token_reset_n(1),
                O=>XLXN_18986);
   
   XLXI_5987 : FDE
      port map (C=>MASTER_CLK,
                CE=>TOKEN_STACK_MAP,
                D=>rx_data(0),
                Q=>bypass_token_stack);
   
   XLXI_5989 : OR2
      port map (I0=>reset,
                I1=>XLXN_17199,
                O=>psi_reset);
   
   XLXI_5996 : OR2
      port map (I0=>reset,
                I1=>XLXN_17239,
                O=>readout_reset);
   
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
   
   XLXI_6015 : FD8RE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>GEC_DEST_ADDRS_MAP,
                D(7 downto 0)=>rx_data(7 downto 0),
                R=>reset,
                Q(7 downto 0)=>gec_addrs(7 downto 0));
   
   XLXI_6021 : BUF
      port map (I=>trigger_busy,
                O=>psi_status(17));
   
   XLXI_6040 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSB_18DP_36S,
                IB=>BUSB_18DN_37S,
                O=>psi_dig_data(0));
   
   XLXI_6042 : calibration_controller
      port map (cal_en=>cal_tag_trig_num_sel,
                mclk=>MASTER_CLK,
                next_cal_trigger=>EN_TRIG_TOK_MAP,
                psi_cmd_fifo_empty=>XLXN_18810,
                reset=>trig_reset,
                trigger_busy=>trigger_busy,
                cal_ctrl_psi_cmd_fifo_empty=>cal_ctrl_psi_cmd_fifo_empty,
                cal_ctrl_sw_en_pulse=>cal_ctrl_sw_en_pulse,
                error=>psi_errors(16));
   
   XLXI_6046 : OBUFDS
      port map (I=>EXT_CLK,
                O=>BUSB_13DP_26S,
                OB=>BUSB_13DN_27S);
   
   XLXI_6047 : OBUFDS
      port map (I=>EXT_TRIGG,
                O=>BUSB_14DP_28S,
                OB=>BUSB_14DN_29S);
   
   XLXI_6051 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => FALSE)
   -- synopsys translate_on
      port map (I=>BUSAA_06DP_12S,
                IB=>BUSAA_06DN_13S,
                O=>psi_dig_data(1));
   
   XLXI_6067 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>internal_4x_clk,
                D1=>internal_4x180_clk,
                S0=>psi_dig_ctrl(0),
                O=>XLXN_18355);
   
   XLXI_6071 : VCC
      port map (P=>psi_delay_high);
   
   XLXI_6072 : BUFG
      port map (I=>XLXN_18355,
                O=>psi_dig_sdata_clk(0));
   
   XLXI_6083 : BUFG
      port map (I=>XLXN_18354,
                O=>internal_4x_clk);
   
   XLXI_6084 : FD8CE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_DIG_MAP,
                CLR=>XLXN_18365,
                D(7 downto 0)=>rx_data(7 downto 0),
                Q(7 downto 0)=>psi_dig_ctrl(7 downto 0));
   
   XLXI_6085 : GND
      port map (G=>XLXN_18365);
   
   XLXI_6086 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>internal_4x_clk,
                D1=>internal_4x180_clk,
                S0=>psi_dig_ctrl(1),
                O=>XLXN_18372);
   
   XLXI_6087 : BUFG
      port map (I=>XLXN_18372,
                O=>psi_dig_sdata_clk(1));
   
   XLXI_6091 : VCC
      port map (P=>XLXN_18379);
   
   XLXI_6096 : DCM_BASE
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 16.0,
            CLKFX_MULTIPLY => 4,
            CLKFX_DIVIDE => 4,
            DCM_PERFORMANCE_MODE => "MAX_SPEED",
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLK_FEEDBACK => "1X")
   -- synopsys translate_on
      port map (CLKFB=>XLXN_18390,
                CLKIN=>ACC_CLK_IN,
                RST=>reset_dig4x_dcm,
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>XLXN_18389,
                CLK2X=>XLXN_18354,
                CLK2X180=>XLXN_18569,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>psi_status(8));
   
   XLXI_6098 : BUFG
      port map (I=>XLXN_18389,
                O=>XLXN_18390);
   
   XLXI_6103 : VCC
      port map (P=>XLXN_18398);
   
   XLXI_6104 : FD8RE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_OUT_CLK_SELECT_MAP,
                D(7 downto 0)=>rx_data(7 downto 0),
                R=>reset,
                Q(7 downto 0)=>psi_out_clk_sel(7 downto 0));
   
   XLXI_6147 : BUFG
      port map (I=>dut_src_clk,
                O=>dut_src_clk_bufg);
   
   XLXI_6157 : IBUF
      port map (I=>IP_MAC_4,
                O=>gec_user_addrs(4));
   
   XLXI_6158 : IBUF
      port map (I=>IP_MAC_5,
                O=>gec_user_addrs(5));
   
   XLXI_6159 : IBUF
      port map (I=>IP_MAC_3,
                O=>gec_user_addrs(3));
   
   XLXI_6169 : IBUF
      port map (I=>IP_MAC_6,
                O=>gec_user_addrs(6));
   
   XLXI_6170 : IBUF
      port map (I=>IP_MAC_7,
                O=>gec_user_addrs(7));
   
   XLXI_6173 : VCC
      port map (P=>vcc_sig);
   
   XLXI_6183 : BUFG
      port map (I=>XLXN_18569,
                O=>internal_4x180_clk);
   
   XLXI_6184 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>GENERAL_20DP_40S,
                IB=>GENERAL_20DN_41S,
                O=>psi_token_out(2));
   
   XLXI_6185 : OBUFDS
      port map (I=>dut_dcm_clk90(2),
                O=>BUSC_11DP_22S,
                OB=>BUSC_11DN_23S);
   
   XLXI_6186 : OBUFDS
      port map (I=>psi_data_out(2),
                O=>BUSC_04DP_08S,
                OB=>BUSC_04DN_09S);
   
   XLXI_6188 : OBUF
      port map (I=>XLXN_18989,
                O=>BUSC_02DP_04S);
   
   XLXI_6189 : OBUFDS
      port map (I=>psi_trigger_mux(2),
                O=>BUSC_03DP_06S,
                OB=>BUSC_03DN_07S);
   
   XLXI_6190 : AND2
      port map (I0=>inv_psi_reset,
                I1=>psi_token_reset_n(2),
                O=>XLXN_18989);
   
   XLXI_6191 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => FALSE)
   -- synopsys translate_on
      port map (I=>BUSC_06DP_12S,
                IB=>BUSC_06DN_13S,
                O=>psi_dig_data(2));
   
   XLXI_6192 : BUFG
      port map (I=>XLXN_18597,
                O=>psi_dig_sdata_clk(2));
   
   XLXI_6193 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>internal_4x_clk,
                D1=>internal_4x180_clk,
                S0=>third_dut_ctrl(4),
                O=>XLXN_18597);
   
   XLXI_6206 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_DIG_MAP,
                D=>rx_data(16),
                Q=>reset_dig4x_dcm);
   
   XLXI_6207 : FD8CE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_DIG_MAP,
                CLR=>XLXN_18639,
                D(7 downto 0)=>rx_data(15 downto 8),
                Q(7 downto 0)=>third_dut_ctrl(7 downto 0));
   
   XLXI_6208 : GND
      port map (G=>XLXN_18639);
   
   XLXI_6216 : AND2
      port map (I0=>third_dut_ctrl(2),
                I1=>psi_b_data_we_pre_and(2),
                O=>psi_b_data_we(2));
   
   XLXI_6217 : AND2
      port map (I0=>third_dut_ctrl(0),
                I1=>psi_dig_reset_req(2),
                O=>XLXN_18694);
   
   XLXI_6218 : OR2
      port map (I0=>third_dut_ctrl(1),
                I1=>psi_dig_sm_ready(2),
                O=>XLXN_18695);
   
   XLXI_6220 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18695,
                Q=>sm_ready(2));
   
   XLXI_6221 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18694,
                Q=>error_reset_req(2));
   
   XLXI_6227 : OR3
      port map (I0=>psi_b_data_we(2),
                I1=>psi_b_data_we(1),
                I2=>psi_b_data_we(0),
                O=>psi_burst_we);
   
   XLXI_6228 : OBUF
      port map (I=>psi_token_in_mux(2),
                O=>GENERAL_19DP_38S);
   
   XLXI_6229 : INV
      port map (I=>psi_token_in_mux(2),
                O=>XLXN_18698);
   
   XLXI_6230 : OBUF
      port map (I=>XLXN_18698,
                O=>GENERAL_19DN_39S);
   
   XLXI_6260 : D2_4E_MXILINX_TOP_LEVEL
      port map (A0=>global_plaq_write_sel(0),
                A1=>global_plaq_write_sel(1),
                E=>psi_cmd_sender_dout(1),
                D0=>open,
                D1=>psi_data_out(1),
                D2=>open,
                D3=>open);
   
   XLXI_6314 : GND
      port map (G=>XLXN_18639);
   
   XLXI_6315 : FD8CE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_PHASE_FLIP_MAP,
                CLR=>XLXN_18639,
                D(7 downto 0)=>rx_data(7 downto 0),
                Q(7 downto 0)=>dut_phase_ctrl(7 downto 0));
   
   XLXI_6319_0 : BUFG
      port map (I=>XLXN_18856(0),
                O=>dut_dcm_clk0(0));
   
   XLXI_6319_1 : BUFG
      port map (I=>XLXN_18856(1),
                O=>dut_dcm_clk0(1));
   
   XLXI_6319_2 : BUFG
      port map (I=>XLXN_18856(2),
                O=>dut_dcm_clk0(2));
   
   XLXI_6320_0 : BUFG
      port map (I=>XLXN_18857(0),
                O=>dut_dcm_clk90(0));
   
   XLXI_6320_1 : BUFG
      port map (I=>XLXN_18857(1),
                O=>dut_dcm_clk90(1));
   
   XLXI_6320_2 : BUFG
      port map (I=>XLXN_18857(2),
                O=>dut_dcm_clk90(2));
   
   XLXI_6323 : D2_4E_MXILINX_TOP_LEVEL
      port map (A0=>global_plaq_write_sel(0),
                A1=>global_plaq_write_sel(1),
                E=>psi_cmd_sender_dout(0),
                D0=>psi_data_out(0),
                D1=>open,
                D2=>open,
                D3=>open);
   
   XLXI_6340 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>psi_token_in(0),
                D1=>psi180_token_in(0),
                S0=>dut_phase_ctrl(8),
                O=>psi_token_in_mux(0));
   
   XLXI_6341 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>psi_trigger,
                D1=>psi180_trigger,
                S0=>dut_phase_ctrl(9),
                O=>psi_trigger_mux(0));
   
   XLXI_6342 : BUFG
      port map (I=>XLXN_18993,
                O=>PSI_CLK90);
   
   XLXI_6343 : BUFG
      port map (I=>XLXN_18992,
                O=>PSI_CLK270);
   
   XLXI_6344 : GND
      port map (G=>XLXN_18639);
   
   XLXI_6345 : FD8CE_MXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_PHASE_TOK_TRIG_MAP,
                CLR=>XLXN_18639,
                D(7 downto 0)=>rx_data(15 downto 8),
                Q(7 downto 0)=>dut_phase_ctrl(15 downto 8));
   
   XLXI_6346 : FD
      port map (C=>PSI_CLK270,
                D=>psi_token_in(0),
                Q=>psi180_token_in(0));
   
   XLXI_6352 : FD
      port map (C=>PSI_CLK270,
                D=>psi_trigger,
                Q=>psi180_trigger);
   
   XLXI_6356 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>psi_token_in(1),
                D1=>psi180_token_in(1),
                S0=>dut_phase_ctrl(10),
                O=>psi_token_in_mux(1));
   
   XLXI_6357 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>psi_trigger,
                D1=>psi180_trigger,
                S0=>dut_phase_ctrl(11),
                O=>psi_trigger_mux(1));
   
   XLXI_6359 : FD
      port map (C=>PSI_CLK270,
                D=>psi_token_in(1),
                Q=>psi180_token_in(1));
   
   XLXI_6360 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>psi_token_in(2),
                D1=>psi180_token_in(2),
                S0=>dut_phase_ctrl(12),
                O=>psi_token_in_mux(2));
   
   XLXI_6361 : M2_1_MXILINX_TOP_LEVEL
      port map (D0=>psi_trigger,
                D1=>psi180_trigger,
                S0=>dut_phase_ctrl(13),
                O=>psi_trigger_mux(2));
   
   XLXI_6362 : FD
      port map (C=>PSI_CLK270,
                D=>psi_token_in(2),
                Q=>psi180_token_in(2));
   
   XLXI_6363 : OR3
      port map (I0=>psi_cmd_fifo_empty(2),
                I1=>psi_cmd_fifo_empty(1),
                I2=>psi_cmd_fifo_empty(0),
                O=>XLXN_18810);
   
   XLXI_6364 : OBUFDS
      port map (I=>XLXN_19142,
                O=>BUSD_21DP_42S,
                OB=>BUSD_21DN_43S);
   
   XLXI_6365 : OBUFDS
      port map (I=>mux_clk_out,
                O=>BUSD_18DP_36S,
                OB=>BUSD_18DN_37S);
   
   XLXI_6366 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_19007,
                D=>XLXN_19008,
                Q=>psi_dig_data_delay_inc);
   
   XLXI_6367 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_19006,
                D=>XLXN_19009,
                Q=>psi_dig_data_delay_rst);
   
   XLXI_6368 : VCC
      port map (P=>XLXN_19007);
   
   XLXI_6369 : VCC
      port map (P=>XLXN_19006);
   
   XLXI_6370 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_19007,
                D=>XLXN_19019,
                Q=>dut_ps_en(0));
   
   XLXI_6371 : VCC
      port map (P=>XLXN_19007);
   
   XLXI_6372 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_19007,
                D=>XLXN_19020,
                Q=>dut_ps_en(1));
   
   XLXI_6373 : VCC
      port map (P=>XLXN_19007);
   
   XLXI_6374 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_19007,
                D=>XLXN_19021,
                Q=>dut_ps_en(2));
   
   XLXI_6375 : VCC
      port map (P=>XLXN_19007);
   
   XLXI_6376 : DCM_BASE
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 25.0,
            CLKFX_MULTIPLY => 2,
            CLKFX_DIVIDE => 2,
            DCM_PERFORMANCE_MODE => "MAX_SPEED",
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLK_FEEDBACK => "1X")
   -- synopsys translate_on
      port map (CLKFB=>XLXN_19113,
                CLKIN=>ACC_CLK_IN,
                RST=>reset_dig4x_dcm,
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>mux_clk_in0,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>mux_clk_in90,
                CLK180=>mux_clk_in180,
                CLK270=>mux_clk_in270,
                LOCKED=>psi_status(12));
   
   XLXI_6377 : M4_1E_MXILINX_TOP_LEVEL
      port map (D0=>mux_clk_in0,
                D1=>mux_clk_in90,
                D2=>mux_clk_in180,
                D3=>mux_clk_in270,
                E=>XLXN_19130,
                S0=>mux_clk_out_sel0,
                S1=>mux_clk_out_sel1,
                O=>mux_clk_out);
   
   XLXI_6378 : BUFG
      port map (I=>mux_clk_in0,
                O=>XLXN_19113);
   
   XLXI_6379 : GND
      port map (G=>XLXN_19142);
   
   XLXI_6380 : VCC
      port map (P=>XLXN_19130);
   
   XLXI_6389 : FDE
      port map (C=>MASTER_CLK,
                CE=>MUX_CLK_OUT_MAP,
                D=>rx_data(0),
                Q=>mux_clk_out_sel0);
   
   XLXI_6390 : FDE
      port map (C=>MASTER_CLK,
                CE=>MUX_CLK_OUT_MAP,
                D=>rx_data(1),
                Q=>mux_clk_out_sel1);
   
end BEHAVIORAL;


