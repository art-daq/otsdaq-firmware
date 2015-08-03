

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
          rx_wren              : out   std_logic; 
          state_diag           : out   std_logic_vector (13 downto 0));
end Ethernet_Interface_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of Ethernet_Interface_MUSER_TOP_LEVEL is
   attribute BOX_TYPE   : string ;
   signal b_end_packet           : std_logic;
   signal four_bit_mode          : std_logic;
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
   component GEC
      port ( GMII_RX_CLK        : in    std_logic; 
             GMII_RX_DV         : in    std_logic; 
             GMII_RX_ER         : in    std_logic; 
             reset              : in    std_logic; 
             user_trigger       : in    std_logic; 
             GMII_RXD           : in    std_logic_vector (7 downto 0); 
             user_addrs         : in    std_logic_vector (7 downto 0); 
             user_dest_addrs    : in    std_logic_vector (7 downto 0); 
             user_dest_mac      : in    std_logic_vector (47 downto 0); 
             user_dest_port     : in    std_logic_vector (15 downto 0); 
             user_tx_data_in    : in    std_logic_vector (7 downto 0); 
             user_tx_size_in    : in    std_logic_vector (10 downto 0); 
             GMII_TX_EN         : out   std_logic; 
             GMII_TX_ER         : out   std_logic; 
             GTX_CLK            : out   std_logic; 
             crc_err            : out   std_logic; 
             user_busy          : out   std_logic; 
             user_rx_valid_out  : out   std_logic; 
             user_src_capture   : out   std_logic; 
             user_tx_enable_out : out   std_logic; 
             GMII_TXD           : out   std_logic_vector (7 downto 0); 
             udp_fwd_port       : out   std_logic_vector (15 downto 0); 
             user_rx_data_out   : out   std_logic_vector (7 downto 0); 
             user_rx_size_out   : out   std_logic_vector (10 downto 0); 
             user_src_addrs     : out   std_logic_vector (7 downto 0); 
             user_src_mac       : out   std_logic_vector (47 downto 0); 
             user_src_port      : out   std_logic_vector (15 downto 0); 
             four_bit_mode_out  : out   std_logic);
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
             four_bit_mode          : in    std_logic; 
             rx_data                : out   std_logic_vector (63 downto 0); 
             ram_wren               : out   std_logic; 
             ram_addr               : out   std_logic_vector (63 downto 0); 
             gec_user_tx_data_in    : out   std_logic_vector (7 downto 0); 
             gec_user_tx_size_in    : out   std_logic_vector (10 downto 0); 
             gec_user_trigger       : out   std_logic; 
             b_enable               : out   std_logic; 
             state_diag             : out   std_logic_vector (13 downto 0));
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
   GEC_blk : GEC
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
                four_bit_mode_out=>four_bit_mode,
                GMII_TXD(7 downto 0)=>PHY_TXD(7 downto 0),
                GMII_TX_EN=>PHY_TX_EN,
                GMII_TX_ER=>PHY_TX_ER,
                GTX_CLK=>GTX_CLK,
                udp_fwd_port=>open,
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
                four_bit_mode=>four_bit_mode,
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
                rx_data(63 downto 0)=>rx_data(63 downto 0),
                state_diag(13 downto 0)=>state_diag(13 downto 0));
   
   XLXI_4124 : burst_traffic_controller
      port map (BURST_WE=>b_data_we,
                MASTER_CLK=>MASTER_CLK,
                RESET=>reset,
                BURST_END_PACKET=>b_end_packet);
   
   XLXI_5365 : INV
      port map (I=>reset,
                O=>XLXN_15874);
   
end BEHAVIORAL;

