-------------------------------------------------------------------------------
--
-- Title       : ethernet_interface
-- Design      : ethernet_controller
-- Author      : rrivera at fnal dot gov
-- Company     : Fermi National Accelerator Laboratory
--
-------------------------------------------------------------------------------
--
-- Modified   : Thu Nov 12 10:33:07 2015	  
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;	  

entity ethernet_interface is
   port ( 								
   		  reset_in             	: in    std_logic; 		-- optional for user to reset, this block will self reset on startup					
          reset_out            	: out   std_logic;  		-- ethernet reset can be used for "reset on start-up" or for reset to PHY  
		  		
		  -- rx/tx signals
          rx_addr              	: out   std_logic_vector (63 downto 0); 
          rx_data              	: out   std_logic_vector (63 downto 0); 
          rx_wren              	: out   std_logic;												   
          tx_data              	: in    std_logic_vector (63 downto 0); 	 					 
		  tx_rden			   	: out   std_logic;						  	--SCRIPT COMMENT OUT 
		  ready		   			: in    std_logic; 						  	--SCRIPT COMMENT OUT 
		  
		  -- burst signals
   		  b_data               	: in    std_logic_vector (63 downto 0); 
          b_data_we            	: in    std_logic; 												                            
          b_enable             	: out   std_logic; 				  		  															 				   
		  b_force_packet	   	: in    std_logic;						  	--SCRIPT COMMENT OUT  	 
		  
		  -- addrs signals													--SCRIPT COMMENT OUT 
          addrs  	   			: in    std_logic_vector (7 downto 0); 	   	--SCRIPT COMMENT OUT 
          dest_addrs  			: in    std_logic_vector (7 downto 0); 	   	--SCRIPT COMMENT OUT 
          dest_mac    			: in    std_logic_vector (47 downto 0); 	--SCRIPT COMMENT OUT 
          dest_port   			: in    std_logic_vector (15 downto 0); 	--SCRIPT COMMENT OUT 
		  																	--SCRIPT COMMENT OUT 
          src_capture 			: out   std_logic; -- to always respond to sender, latch src when capture is '1' for dest --SCRIPT COMMENT OUT 
          src_addrs   			: out   std_logic_vector (7 downto 0); 	   	--SCRIPT COMMENT OUT 
          src_mac     			: out   std_logic_vector (47 downto 0); 	--SCRIPT COMMENT OUT 
          src_port    			: out   std_logic_vector (15 downto 0); 	--SCRIPT COMMENT OUT 	 
		  
		  -- PHY interface signals
		  MASTER_CLK           	: in    std_logic; 			
		  
          PHY_RXD             	: in    std_logic_vector (7 downto 0); 
          PHY_RX_DV           	: in    std_logic; 
          PHY_RX_ER           	: in    std_logic; 				 	   
		  
          TX_CLK              	: out   std_logic; 
          PHY_TXD              	: out   std_logic_vector (7 downto 0); 
          PHY_TX_EN            	: out   std_logic; 
          PHY_TX_ER            	: out   std_logic
		  );
end ethernet_interface;



architecture BEHAVIORAL of ethernet_interface is	   
											 
	signal b_end_packet           	: std_logic;
	signal four_bit_mode          	: std_logic;
	signal user_busy          		: std_logic;
	signal user_crc_err       		: std_logic;
	signal user_rx_data_out   		: std_logic_vector (7 downto 0);
	signal user_rx_size_out   		: std_logic_vector (10 downto 0);
	signal user_rx_valid_out  		: std_logic;
	signal user_trigger       		: std_logic;
	signal user_tx_data_in    		: std_logic_vector (7 downto 0);
	signal user_tx_enable_out 		: std_logic;
	signal user_tx_size_in    		: std_logic_vector (10 downto 0);
	signal reset         	     	: std_logic;		
	                             				  		   
	signal user_src_capture 		: std_logic; 	-- to always respond to sender, latch src when capture is '1' for dest														 
	signal user_src_addrs   		: std_logic_vector (7 downto 0); 	
	signal user_src_mac     		: std_logic_vector (47 downto 0); 
	signal user_src_port    		: std_logic_vector (15 downto 0); 
	signal user_addrs   			: std_logic_vector (7 downto 0); 	
	signal user_dest_addrs   		: std_logic_vector (7 downto 0); 	
	signal user_dest_mac     		: std_logic_vector (47 downto 0); 
	signal user_dest_port    		: std_logic_vector (15 downto 0); 	
	signal user_tx_rden			   	: std_logic;						
	signal user_ready		   		: std_logic; 						
	signal user_b_force_packet	   	: std_logic;						
  	 											  								     
begin										 
	
   ec_wrapper : entity work.ethernet_controller_wrapper
      port map (GMII_RXD(7 downto 0)=>PHY_RXD(7 downto 0),
                GMII_RX_CLK=>MASTER_CLK,	
                GMII_RX_DV=>PHY_RX_DV,
                GMII_RX_ER=>PHY_RX_ER,
                reset=>reset,		
				user_addrs=>user_addrs,
                user_dest_addrs(7 downto 0)=>user_dest_addrs(7 downto 0),
                user_dest_mac(47 downto 0)=>user_dest_mac(47 downto 0),
                user_dest_port(15 downto 0)=>user_dest_port(15 downto 0),
                user_trigger=>user_trigger,
                user_tx_data_in(7 downto 0)=>user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),
                crc_err=>user_crc_err,
                four_bit_mode_out=>four_bit_mode,
                GMII_TXD(7 downto 0)=>PHY_TXD(7 downto 0),
                GMII_TX_EN=>PHY_TX_EN,
                GMII_TX_ER=>PHY_TX_ER,
                GTX_CLK=>TX_CLK,
                udp_fwd_port=>open,
                user_busy=>user_busy,
                user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0),
                user_rx_size_out(10 downto 0)=>user_rx_size_out(10 downto 0),
                user_rx_valid_out=>user_rx_valid_out,
                user_src_addrs(7 downto 0)=>user_src_addrs(7 downto 0),
                user_src_capture=>user_src_capture,
                user_src_mac(47 downto 0)=>user_src_mac(47 downto 0),
                user_src_port(15 downto 0)=>user_src_port(15 downto 0),
                user_tx_enable_out=>user_tx_enable_out);
   
   data_manager_blk : entity work.data_manager
      port map (b_data(63 downto 0)=>b_data(63 downto 0),
                b_data_we=>b_data_we,
                b_end_packet=>b_end_packet,
                four_bit_mode=>four_bit_mode,
                user_busy=>user_busy,
                user_crc_err=>user_crc_err,
                user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0),
                user_rx_size_out(10 downto 0)=>user_rx_size_out(10 downto 0),
                user_rx_valid_out=>user_rx_valid_out,
                user_tx_enable_out=>user_tx_enable_out,
                MASTER_CLK=>MASTER_CLK,
                reset=>reset,		  
                tx_data(63 downto 0)=>tx_data(63 downto 0),
                b_enable=>b_enable,
                user_trigger=>user_trigger,
                user_tx_data_in(7 downto 0)=>user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),
                ram_addr(63 downto 0)=>rx_addr(63 downto 0),
                ram_rden=>user_tx_rden,							
                ram_wren=>rx_wren,								   
				user_ready=>user_ready,
                rx_data(63 downto 0)=>rx_data(63 downto 0));
   
   burst_traffic_controller_blk : entity work.burst_traffic_controller
      port map (BURST_WE=>b_data_we,
	  			MASTER_CLK=>MASTER_CLK,		
	  			BURST_FORCE_PACKET=>user_b_force_packet,
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
	   
	   
	   
	src_capture <= user_src_capture;  			--SCRIPT COMMENT OUT 
	src_addrs   <= user_src_addrs;    			--SCRIPT COMMENT OUT 
	src_mac     <= user_src_mac;      			--SCRIPT COMMENT OUT 
	src_port    <= user_src_port;	   			--SCRIPT COMMENT OUT    
	user_dest_addrs   	 <= dest_addrs;  		--SCRIPT COMMENT OUT 
	user_dest_mac     	 <= dest_mac;    		--SCRIPT COMMENT OUT 
	user_dest_port    	 <= dest_port;   		--SCRIPT COMMENT OUT 	
	user_addrs			 <= addrs;		  		--SCRIPT COMMENT OUT			
	tx_rden				 <= user_tx_rden;		--SCRIPT COMMENT OUT					
	user_ready		   	 <= ready;		  		--SCRIPT COMMENT OUT		 
	user_b_force_packet	 <= b_force_packet;  	--SCRIPT COMMENT OUT	
	
	-------- start simple section -----------  
	-- comments denoted as -- simple -- will be removed in this case by install script
	-- and lines with --SCRIPT COMMENT OUT  will be commented out
	-- simple --
	-- simple -- user_addrs <= (others => '0'); -- choosing 0s will force the default value on reset	  
	-- simple -- user_ready <= '1';
	-- simple -- user_b_force_packet <= '0';													   
	-- simple --
    -- simple -- process(MASTER_CLK)
    -- simple -- begin
    -- simple --     if (rising_edge(MASTER_CLK) and user_src_capture = '1') then	 
    -- simple --         user_dest_addrs <= user_src_addrs;    
    -- simple --         user_dest_mac <= user_src_mac;  
    -- simple --         user_dest_port <= user_src_port;   		  
    -- simple --     end if;   
    -- simple -- end process;					 
	-------- end simple section -----------
	   
end BEHAVIORAL;

