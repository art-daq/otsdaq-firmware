

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;	  

entity ethernet_interface is
   port ( 								
   		  reset_in             : in    std_logic; 		-- optional for user to reset, this block will self reset on startup					
          reset_out            : out   std_logic;  		-- ethernet reset can be used for "reset on start-up" or for reset to PHY  
		  		
		  -- rx/tx signals
          rx_addr              : out   std_logic_vector (63 downto 0); 
          rx_data              : out   std_logic_vector (63 downto 0); 
          rx_wren              : out   std_logic;			
		  tx_rden			   : out   std_logic;
          tx_data              : in    std_logic_vector (63 downto 0); 	 
		  user_ready		   : in    std_logic; 					
		  
		  -- burst signals
   		  b_data               : in    std_logic_vector (63 downto 0); 
          b_data_we            : in    std_logic; 	
		  b_force_packet	   : in    std_logic;
          b_enable             : out   std_logic; 		 
		  
		  															 
          oei_user_addrs  	   : in    std_logic_vector (7 downto 0); 
          oei_user_dest_addrs  : in    std_logic_vector (7 downto 0); 
          oei_user_dest_mac    : in    std_logic_vector (47 downto 0); 
          oei_user_dest_port   : in    std_logic_vector (15 downto 0); 	  
		  																
          oei_user_src_capture : out   std_logic; 	-- to always respond to sender, latch src when capture is '1' for dest														 
          oei_user_src_addrs   : out   std_logic_vector (7 downto 0); 	
          oei_user_src_mac     : out   std_logic_vector (47 downto 0); 
          oei_user_src_port    : out   std_logic_vector (15 downto 0); 		 
		  
		  -- PHY interface signals
		  MASTER_CLK           : in    std_logic; 			
		  
          PHY_RXD             : in    std_logic_vector (7 downto 0); 
          PHY_RX_DV           : in    std_logic; 
          PHY_RX_ER           : in    std_logic; 				 	   
		  
          TX_CLK              : out   std_logic; 
          PHY_TXD              : out   std_logic_vector (7 downto 0); 
          PHY_TX_EN            : out   std_logic; 
          PHY_TX_ER            : out   std_logic
		  );
end ethernet_interface;



architecture BEHAVIORAL of ethernet_interface is	   
											 
   signal b_end_packet           : std_logic;
   signal four_bit_mode          : std_logic;
   signal oei_user_busy          : std_logic;
   signal oei_user_crc_err       : std_logic;
   signal oei_user_rx_data_out   : std_logic_vector (7 downto 0);
   signal oei_user_rx_size_out   : std_logic_vector (10 downto 0);
   signal oei_user_rx_valid_out  : std_logic;
   signal oei_user_trigger       : std_logic;
   signal oei_user_tx_data_in    : std_logic_vector (7 downto 0);
   signal oei_user_tx_enable_out : std_logic;
   signal oei_user_tx_size_in    : std_logic_vector (10 downto 0);
   signal reset         	     : std_logic;
  	 
   
begin
   ec_wrapper : entity work.ethernet_controller_wrapper
      port map (GMII_RXD(7 downto 0)=>PHY_RXD(7 downto 0),
                GMII_RX_CLK=>MASTER_CLK,	
                GMII_RX_DV=>PHY_RX_DV,
                GMII_RX_ER=>PHY_RX_ER,
                reset=>reset,		
				user_addrs=>oei_user_addrs,
                user_dest_addrs(7 downto 0)=>oei_user_dest_addrs(7 downto 0),
                user_dest_mac(47 downto 0)=>oei_user_dest_mac(47 downto 0),
                user_dest_port(15 downto 0)=>oei_user_dest_port(15 downto 0),
                user_trigger=>oei_user_trigger,
                user_tx_data_in(7 downto 0)=>oei_user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>oei_user_tx_size_in(10 downto 0),
                crc_err=>oei_user_crc_err,
                four_bit_mode_out=>four_bit_mode,
                GMII_TXD(7 downto 0)=>PHY_TXD(7 downto 0),
                GMII_TX_EN=>PHY_TX_EN,
                GMII_TX_ER=>PHY_TX_ER,
                GTX_CLK=>TX_CLK,
                udp_fwd_port=>open,
                user_busy=>oei_user_busy,
                user_rx_data_out(7 downto 0)=>oei_user_rx_data_out(7 downto 0),
                user_rx_size_out(10 downto 0)=>oei_user_rx_size_out(10 downto 0),
                user_rx_valid_out=>oei_user_rx_valid_out,
                user_src_addrs(7 downto 0)=>oei_user_src_addrs(7 downto 0),
                user_src_capture=>oei_user_src_capture,
                user_src_mac(47 downto 0)=>oei_user_src_mac(47 downto 0),
                user_src_port(15 downto 0)=>oei_user_src_port(15 downto 0),
                user_tx_enable_out=>oei_user_tx_enable_out);
   
   data_manager_blk : entity work.data_manager
      port map (b_data(63 downto 0)=>b_data(63 downto 0),
                b_data_we=>b_data_we,
                b_end_packet=>b_end_packet,
                four_bit_mode=>four_bit_mode,
                oei_user_busy=>oei_user_busy,
                oei_user_crc_err=>oei_user_crc_err,
                oei_user_rx_data_out(7 downto 0)=>oei_user_rx_data_out(7 downto 0),
                oei_user_rx_size_out(10 downto 0)=>oei_user_rx_size_out(10 downto 0),
                oei_user_rx_valid_out=>oei_user_rx_valid_out,
                oei_user_tx_enable_out=>oei_user_tx_enable_out,
                MASTER_CLK=>MASTER_CLK,
                reset=>reset,		  
                tx_data(63 downto 0)=>tx_data(63 downto 0),
                b_enable=>b_enable,
                oei_user_trigger=>oei_user_trigger,
                oei_user_tx_data_in(7 downto 0)=>oei_user_tx_data_in(7 downto 0),
                oei_user_tx_size_in(10 downto 0)=>oei_user_tx_size_in(10 downto 0),
                ram_addr(63 downto 0)=>rx_addr(63 downto 0),
                ram_rden=>tx_rden,							
                ram_wren=>rx_wren,								   
				oei_user_ready=>user_ready,
                rx_data(63 downto 0)=>rx_data(63 downto 0));
   
   burst_traffic_controller_blk : entity work.burst_traffic_controller
      port map (BURST_WE=>b_data_we,
	  			MASTER_CLK=>MASTER_CLK,		
	  			BURST_FORCE_PACKET=>b_force_packet,
                RESET=>reset,
                BURST_END_PACKET=>b_end_packet);
				
				
	-------- start reset section -----------
	-- handle self reset for Eth Interface and input and output reset
	reset_mgr : entity work.reset_mgr
		port map (
			slow_clk => MASTER_CLK,
			reset_start => reset_in,
			reset => reset);
						  		 
	reset_out <= reset;
   	-------- end reset section -----------
	   
end BEHAVIORAL;

