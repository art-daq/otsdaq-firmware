---SCRIPT COMMENT OUT ----------------------------- 		  
-- SCRIPT COMMENT OUT --  
-- SCRIPT COMMENT OUT --  Comments by rrivera at fnal dot gov : Aug 25, 2015 
-- SCRIPT COMMENT OUT --  
-- SCRIPT COMMENT OUT --  IMPORTANT!! IMPORTANT!! 				
-- SCRIPT COMMENT OUT --  It's very important to note!!!   	
-- SCRIPT COMMENT OUT --  										
-- SCRIPT COMMENT OUT --  The script that moves these files into a Firmware project will 		   
-- SCRIPT COMMENT OUT --   remove all "--" comments.. 												
-- SCRIPT COMMENT OUT --  The only way (I think) to safely comment is to put "SCRIPT  COMMENT  OUT"  in your comment line with single spacing

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;		

entity data_manager is
   port ( b_data                 : in    std_logic_vector (63 downto 0); 
          b_data_we              : in    std_logic; 
          b_end_packet           : in    std_logic; 
          four_bit_mode          : in    std_logic; 
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
          rx_data                : out   std_logic_vector (63 downto 0); 
          state_diag             : out   std_logic_vector (13 downto 0));
end data_manager;

architecture BEHAVIORAL of data_manager is	  

   signal burst_done                           : std_logic;
   signal burst_start                          : std_logic;
   signal burst_stop                           : std_logic;
   signal clear_delay_count                    : std_logic;
   signal crc_err_flag                         : std_logic;
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
   signal rx_data_DUMMY                        : std_logic_vector (63 downto 0);	  
 				  
   
--       component DATA_FIFO_0
--       port ( clk   : in    std_logic; 
--              rd_en : in    std_logic; 
--              srst  : in    std_logic; 
--              wr_en : in    std_logic; 
--              din   : in    std_logic_vector (63 downto 0); 
--              empty : out   std_logic; 
--              full  : out   std_logic; 
--              dout  : out   std_logic_vector (63 downto 0));
--                  end component;
--    
--    component INFO_FIFO_0
--       port ( wr_en : in    std_logic; 
--              clk   : in    std_logic; 
--              srst  : in    std_logic; 
--              din   : in    std_logic_vector (15 downto 0); 
--              rd_en : in    std_logic; 
--              dout  : out   std_logic_vector (15 downto 0); 
--              empty : out   std_logic; 
--              full  : out   std_logic);
--                  end component;
--   				  
   										
begin
   rx_data(63 downto 0) <= rx_data_DUMMY(63 downto 0);
   		  
   	  RX_DATA_FIFO : entity work.reg_fifo							--SCRIPT COMMENT OUT
   	  generic map (width => 64,	depth => 256, addr => 8)			--SCRIPT COMMENT OUT
      port map (WCLOCK=>MASTER_CLK, 								 --SCRIPT COMMENT OUT
	 			RCLOCK=>MASTER_CLK,									 --SCRIPT COMMENT OUT
                DATA(63 downto 0)=>data_fifo_wr_data(63 downto 0),	 --SCRIPT COMMENT OUT
                RE=>rx_data_fifo_read_enable,						 --SCRIPT COMMENT OUT
                RESET=>rx_fifo_reset_sig,							 --SCRIPT COMMENT OUT
                WE=>data_fifo_wren,									 --SCRIPT COMMENT OUT
                Q(63 downto 0)=>rx_data_DUMMY(63 downto 0),	  	   	 --SCRIPT COMMENT OUT
				RD_COUNT=>open,										 --SCRIPT COMMENT OUT
                EMPTY=>rx_data_fifo_empty,							 --SCRIPT COMMENT OUT
                FULL=>open);										--SCRIPT COMMENT OUT

 	RX_INFO_FIFO : entity work.reg_fifo								   --SCRIPT COMMENT OUT    
   	  generic map (width => 16,	depth => 16, addr => 4)				   --SCRIPT COMMENT OUT    
      port map (WCLOCK=>MASTER_CLK,									    --SCRIPT COMMENT OUT   
	 			RCLOCK=>MASTER_CLK,									    --SCRIPT COMMENT OUT   
                DATA(15 downto 0)=>info_fifo_wr_data(15 downto 0),	    --SCRIPT COMMENT OUT   
                RE=>rx_info_fifo_rden,								    --SCRIPT COMMENT OUT   
                RESET=>rx_fifo_reset_sig,							    --SCRIPT COMMENT OUT   
                WE=>info_fifo_wren,									    --SCRIPT COMMENT OUT   
                Q(15 downto 0)=>info_fifo_rd_data(15 downto 0),	  	    --SCRIPT COMMENT OUT   
				RD_COUNT=>open,										    --SCRIPT COMMENT OUT   
                EMPTY=>rx_info_fifo_empty,							    --SCRIPT COMMENT OUT   
                FULL=>open);										   --SCRIPT COMMENT OUT    
				
							   

  	  TX_DATA_FIFO : entity work.reg_fifo			  					--SCRIPT COMMENT OUT    
   	  generic map (width => 64,depth => 256,addr => 8)					--SCRIPT COMMENT OUT    
      port map (WCLOCK=>MASTER_CLK,										 --SCRIPT COMMENT OUT   
	 			RCLOCK=>MASTER_CLK,										 --SCRIPT COMMENT OUT   
                DATA(63 downto 0)=>tx_data_fifo_din(63 downto 0),		 --SCRIPT COMMENT OUT   
                RE=>tx_data_fifo_read_enable,							 --SCRIPT COMMENT OUT   
                RESET=>tx_fifo_reset_sig,								 --SCRIPT COMMENT OUT   
                WE=>tx_data_fifo_wr_en,									 --SCRIPT COMMENT OUT   
                Q(63 downto 0)=>data_fifo_rd_data(63 downto 0),	  	   	 --SCRIPT COMMENT OUT   
				RD_COUNT=>open,											 --SCRIPT COMMENT OUT   
                EMPTY=>tx_data_fifo_empty,								 --SCRIPT COMMENT OUT   
                FULL=>tx_data_fifo_full);								--SCRIPT COMMENT OUT    
	
 	TX_INFO_FIFO : entity work.reg_fifo									--SCRIPT COMMENT OUT    
   	  generic map (width => 16,	depth => 16,addr => 4)					--SCRIPT COMMENT OUT    
      port map (WCLOCK=>MASTER_CLK,										 --SCRIPT COMMENT OUT   
	 			RCLOCK=>MASTER_CLK,										 --SCRIPT COMMENT OUT   
                DATA(15 downto 0)=>tx_info_fifo_din(15 downto 0),		 --SCRIPT COMMENT OUT   
                RE=>tx_info_fifo_rden,									 --SCRIPT COMMENT OUT   
                RESET=>tx_fifo_reset_sig,								 --SCRIPT COMMENT OUT   
                WE=>tx_info_fifo_wr_en,									 --SCRIPT COMMENT OUT   
                Q(15 downto 0)=>tx_info_fifo_dout(15 downto 0),	  	   	 --SCRIPT COMMENT OUT   
				RD_COUNT=>open,											 --SCRIPT COMMENT OUT   
                EMPTY=>tx_info_fifo_empty,								 --SCRIPT COMMENT OUT   
                FULL=>tx_info_fifo_full);								--SCRIPT COMMENT OUT    
            
--       RX_DATA_FIFO : DATA_FIFO_0
--          port map (clk=>MASTER_CLK,
--                    din(63 downto 0)=>data_fifo_wr_data(63 downto 0),
--                    rd_en=>rx_data_fifo_read_enable,
--                    srst=>rx_fifo_reset_sig,
--                    wr_en=>data_fifo_wren,
--                    dout(63 downto 0)=>rx_data_DUMMY(63 downto 0),
--                    empty=>rx_data_fifo_empty,
--                    full=>open);
--       RX_INFO_FIFO : INFO_FIFO_0
--          port map (clk=>MASTER_CLK,
--                    din(15 downto 0)=>info_fifo_wr_data(15 downto 0),
--                    rd_en=>rx_info_fifo_rden,
--                    srst=>rx_fifo_reset_sig,
--                    wr_en=>info_fifo_wren,
--                    dout(15 downto 0)=>info_fifo_rd_data(15 downto 0),
--                    empty=>rx_info_fifo_empty,
--                    full=>open);
--                                   	
--       TX_DATA_FIFO : DATA_FIFO_0
--          port map (clk=>MASTER_CLK,
--                    din(63 downto 0)=>tx_data_fifo_din(63 downto 0),
--                    rd_en=>tx_data_fifo_read_enable,
--                    srst=>tx_fifo_reset_sig,
--                    wr_en=>tx_data_fifo_wr_en,
--                    dout(63 downto 0)=>data_fifo_rd_data(63 downto 0),
--                    empty=>tx_data_fifo_empty,
--                    full=>tx_data_fifo_full);
--				
--   TX_INFO_FIFO : INFO_FIFO_0
--      port map (clk=>MASTER_CLK,
--                din(15 downto 0)=>tx_info_fifo_din(15 downto 0),
--                rd_en=>tx_info_fifo_rden,
--                srst=>tx_fifo_reset_sig,
--                wr_en=>tx_info_fifo_wr_en,
--                dout(15 downto 0)=>tx_info_fifo_dout(15 downto 0),
--                empty=>tx_info_fifo_empty,
--                full=>tx_info_fifo_full);
   
   burst_controller_sm : entity work.burst_controller_sm
      port map (burst_start=>burst_start,
                burst_stop=>burst_stop,
                b_data_we=>b_data_we,
                b_end_burst=>'0',
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
					 
   
   GEC_RX_CTRL : entity work.GEC_RX_CTL
      port map (
                clock=>MASTER_CLK,				 					   
                four_bit_mode=>four_bit_mode,
                gec_user_crc_err=>gec_user_crc_err,
                gec_user_rx_data_out(7 downto 0)=>gec_user_rx_data_out(7 downto 0),
                gec_user_rx_size_out(10 downto 0)=>gec_user_rx_size_out(10 downto 0),
                gec_user_rx_valid_out=>gec_user_rx_valid_out,
                reset=>reset,
                crc_err_flag=>crc_err_flag,
                data_fifo_q_w_data(63 downto 0)=>data_fifo_wr_data(63 downto 0),
                data_fifo_wren=>data_fifo_wren,
                info_fifo_wren=>info_fifo_wren,
                info_fifo_wr_data(15 downto 0)=>info_fifo_wr_data(15 downto 0),
                state_diag(3 downto 0)=>state_diag(3 downto 0));
							
	tx_fifo_reset_sig <=  tx_fifo_reset or reset;
   
   RAM_COMM_DEC : entity work.RAM_COMM_DEC
      port map (
                burst_done=>burst_done,
                clock=>MASTER_CLK,
                reset=>reset,
                rx_data_fifo_rd_data(63 downto 0)=>rx_data_DUMMY(63 downto 0),
                rx_info_fifo_empty=>rx_info_fifo_empty,
                rx_info_fifo_rd_data(15 downto 0)=>info_fifo_rd_data(15 downto 0),
                tx_info_fifo_full=>tx_info_fifo_full,
                burst_start=>burst_start,
                burst_stop=>burst_stop,
                ram_addr(63 downto 0)=>ram_addr(63 downto 0),
                ram_en=>open,
                ram_wren=>ram_wren,
                rx_data_fifo_rden=>rx_data_fifo_read_enable,
                Rx_FIFO_Reset=>rx_fifo_reset,
                rx_info_fifo_rden=>rx_info_fifo_rden,
                state_diag(0 to 5)=>state_diag(9 downto 4),
                tx_data_fifo_src_sel=>tx_data_fifo_src_sel,
                tx_data_fifo_wren=>tx_data_fifo_wren_comm,
                Tx_FIFO_Reset=>tx_fifo_reset,
                tx_info_fifo_src_sel=>tx_info_fifo_src_sel,
                tx_info_fifo_wren=>tx_info_fifo_wren_comm,
                tx_info_fifo_wr_data(15 downto 0)=>tx_info_fifo_data_comm(15 
            downto 0));
							   
	tx_data_fifo_read_enable <= tx_data_fifo_rden and data_fifo_rden_en;
   
   GEC_TX_SEQ_CTL : entity work.GEC_TX_SEQ_CTL
      port map (
                clk=>MASTER_CLK,
                data_fifo_empty=>tx_data_fifo_empty,					
                data_fifo_rd_data(63 downto 0)=>data_fifo_rd_data(63 downto 0),
                delay_count=>delay_count,
                four_bit_mode=>four_bit_mode,
                gec_user_busy=>gec_user_busy,
                gec_user_tx_enable_out=>gec_user_tx_enable_out,
                info_fifo_empty=>tx_info_fifo_empty,					
                info_fifo_rd_data(15 downto 0)=>tx_info_fifo_dout(15 downto 0),
                reset=>reset,
                clear_delay_count=>clear_delay_count,
                data_fifo_rden=>tx_data_fifo_rden,
                data_fifo_rden_en=>data_fifo_rden_en,
                gec_user_trigger=>gec_user_trigger,
                gec_user_tx_data_in(7 downto 0)=>gec_user_tx_data_in(7 downto 0),
                gec_user_tx_size_in(10 downto 0)=>gec_user_tx_size_in(10 downto 0),
                info_fifo_rden=>tx_info_fifo_rden,
                start_delay_count=>start_delay_count,
                state_diag(3 downto 0)=>state_diag(13 downto 10));
   
   delay_counter : entity work.delay_counter
      port map (clear_delay_count=>clear_delay_count,
                clock=>MASTER_CLK,
                reset=>reset,
                start_delay_count=>start_delay_count,
                delay_count=>delay_count);
				
	tx_info_fifo_din(15 downto 0) <= tx_info_fifo_data_comm(15 downto 0) when  tx_info_fifo_src_sel = '0' else tx_info_fifo_data_burst(15 downto 0);
	tx_info_fifo_wr_en <= tx_info_fifo_wren_comm when  tx_info_fifo_src_sel = '0' else tx_info_fifo_wren_burst;
	
	tx_data_fifo_din(63 downto 0) <= tx_data(63 downto 0) when  tx_data_fifo_src_sel = '0' else b_data(63 downto 0);
	
	tx_data_fifo_wr_en <= tx_data_fifo_wren_comm when  tx_data_fifo_src_sel = '0' else tx_data_fifo_wren_burst;
							
	rx_fifo_reset_sig <= rx_fifo_reset or reset;
   
end BEHAVIORAL;



			  