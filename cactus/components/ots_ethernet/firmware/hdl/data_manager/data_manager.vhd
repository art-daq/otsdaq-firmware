--erased - 		  
--erased   
--erased   Comments by rrivera at fnal dot gov : Aug 25, 2015 
--erased   
--erased   IMPORTANT!! IMPORTANT!! 				
--erased   It's very important to note!!!   	
--erased   										
--erased   The script that moves these files into a Firmware project will 		   
--erased    remove all "" comments.. 												
--erased   The only way (I think) to safely comment is to put "SCRIPT  COMMENT  OUT"  in your comment line with single spacing

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;		

entity data_manager is
   port ( b_data                 	: in    std_logic_vector (63 downto 0); 
          b_data_we              	: in    std_logic; 
          b_end_packet           	: in    std_logic; 
          four_bit_mode          	: in    std_logic; 
          user_busy          		: in    std_logic; 
          user_crc_err       		: in    std_logic; 
          user_rx_data_out   		: in    std_logic_vector (7 downto 0); 
          user_rx_size_out   		: in    std_logic_vector (10 downto 0); 
          user_rx_valid_out  		: in    std_logic; 
          user_tx_enable_out 		: in    std_logic; 	 
		  user_ready	 			: in    std_logic;
          MASTER_CLK             	: in    std_logic; 
          reset                  	: in    std_logic;  
          tx_data                	: in    std_logic_vector (63 downto 0); 
          b_enable               	: out   std_logic; 
          user_trigger       		: out   std_logic; 
          user_tx_data_in    		: out   std_logic_vector (7 downto 0); 
          user_tx_size_in    		: out   std_logic_vector (10 downto 0); 
          ram_addr               	: out   std_logic_vector (63 downto 0);   
          ram_rden               	: out   std_logic; 
          ram_wren               	: out   std_logic; 
          rx_data                	: out   std_logic_vector (63 downto 0));
end data_manager;

architecture BEHAVIORAL of data_manager is	  

   signal burst_done                           : std_logic;
   signal burst_start                          : std_logic;
   signal burst_stop                           : std_logic;
   signal clear_delay_count                    : std_logic;
   signal crc_err_flag, clear_crc_err_flag     : std_logic;
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
   signal rx_info_fifo_full	                   : std_logic;	
   signal rx_data_fifo_full	                   : std_logic;	   
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
   signal rx_data_sig                          : std_logic_vector (63 downto 0);	  	
   
   signal tx_data_reg			               : std_logic_vector (63 downto 0); 
 				  
   
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
   				  
   										
begin

	rx_data(63 downto 0) <= rx_data_sig(63 downto 0);
   		  
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased

--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
				
							   

--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
	
--erased    
--erased    
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased   
--erased    
            
       RX_DATA_FIFO : DATA_FIFO_0
          port map (clk=>MASTER_CLK,
                    din(63 downto 0)=>data_fifo_wr_data(63 downto 0),
                    rd_en=>rx_data_fifo_read_enable,
                    srst=>rx_fifo_reset_sig,
                    wr_en=>data_fifo_wren,
                    dout(63 downto 0)=>rx_data_sig(63 downto 0),
                    empty=>rx_data_fifo_empty,
                    full=>rx_data_fifo_full);
       RX_INFO_FIFO : INFO_FIFO_0
          port map (clk=>MASTER_CLK,
                    din(15 downto 0)=>info_fifo_wr_data(15 downto 0),
                    rd_en=>rx_info_fifo_rden,
                    srst=>rx_fifo_reset_sig,
                    wr_en=>info_fifo_wren,
                    dout(15 downto 0)=>info_fifo_rd_data(15 downto 0),
                    empty=>rx_info_fifo_empty,
                    full=>rx_info_fifo_full);
                                   	
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
   
   burst_controller_sm : entity work.burst_controller_sm
      port map (burst_start=>burst_start,
                burst_stop=>burst_stop,
                b_data_we=>b_data_we,  
                b_end_packet=>b_end_packet,
                clk=>MASTER_CLK,
                reset=>reset,
                tx_data_full=>tx_data_fifo_full,
                tx_info_full=>tx_info_fifo_full,
                burst_done=>burst_done,
                b_enable=>b_enable,
                tx_data_we=>tx_data_fifo_wren_burst,
                tx_info(15 downto 0)=>tx_info_fifo_data_burst(15 downto 0),
                tx_info_we=>tx_info_fifo_wren_burst);
					 
   
   GEC_RX_CTRL : entity work.rx_ctl
      port map (
                clock=>MASTER_CLK,				 					   
                four_bit_mode=>four_bit_mode,
                user_crc_err=>user_crc_err,
                user_rx_data_out(7 downto 0)=>user_rx_data_out(7 downto 0),
                user_rx_size_out(10 downto 0)=>user_rx_size_out(10 downto 0),
                user_rx_valid_out=>user_rx_valid_out,
                reset=>reset,
                crc_err_flag=>crc_err_flag,	  
                clear_crc_err_flag=>clear_crc_err_flag,
                data_fifo_wdata(63 downto 0)=>data_fifo_wr_data(63 downto 0),
                data_fifo_wren=>data_fifo_wren,
                info_fifo_wren=>info_fifo_wren,
                info_fifo_wr_data(15 downto 0)=>info_fifo_wr_data(15 downto 0));
							
	tx_fifo_reset_sig <=  tx_fifo_reset or reset;
   
   RAM_COMM_DEC : entity work.ram_comm_dec
      port map (						   
                clock=>MASTER_CLK,
                reset=>reset,
                rx_data_fifo_rd_data(63 downto 0)=>rx_data_sig(63 downto 0),
                rx_info_fifo_empty=>rx_info_fifo_empty,							  
				rx_info_fifo_full=>rx_info_fifo_full,	   
				rx_data_fifo_full=>rx_data_fifo_full,
                rx_info_fifo_rd_data(15 downto 0)=>info_fifo_rd_data(15 downto 0),				
                tx_info_fifo_full=>tx_info_fifo_full,	 
                burst_done=>burst_done,
                burst_start=>burst_start,
                burst_stop=>burst_stop,					   	 
                ram_addr(63 downto 0)=>ram_addr(63 downto 0),
                ram_rden=>ram_rden,
                ram_wren=>ram_wren,		   			
				user_ready=>user_ready,
				user_rx_valid_out=>user_rx_valid_out,  
                crc_err_flag=>crc_err_flag,	  
                clear_crc_err_flag=>clear_crc_err_flag,	  
                rx_data_fifo_rden=>rx_data_fifo_read_enable,
                Rx_FIFO_Reset=>rx_fifo_reset,
                rx_info_fifo_rden=>rx_info_fifo_rden,		 
                tx_data_fifo_src_sel=>tx_data_fifo_src_sel,
                tx_data_fifo_wren=>tx_data_fifo_wren_comm,
                Tx_FIFO_Reset=>tx_fifo_reset,
                tx_info_fifo_src_sel=>tx_info_fifo_src_sel,
                tx_info_fifo_wren=>tx_info_fifo_wren_comm,
                tx_info_fifo_wr_data(15 downto 0)=>tx_info_fifo_data_comm(15 downto 0));
							   
	tx_data_fifo_read_enable <= tx_data_fifo_rden and data_fifo_rden_en;
   
   GEC_TX_SEQ_CTL : entity work.tx_seq_ctl
      port map (
                clk=>MASTER_CLK,
                data_fifo_empty=>tx_data_fifo_empty,					
                data_fifo_rd_data(63 downto 0)=>data_fifo_rd_data(63 downto 0),
                delay_count=>delay_count,
                four_bit_mode=>four_bit_mode,
                user_busy=>user_busy,
                user_tx_enable_out=>user_tx_enable_out,
                info_fifo_empty=>tx_info_fifo_empty,					
                info_fifo_rd_data(15 downto 0)=>tx_info_fifo_dout(15 downto 0),
                reset=>reset,
                clear_delay_count=>clear_delay_count,
                data_fifo_rden=>tx_data_fifo_rden,
                data_fifo_rden_en=>data_fifo_rden_en,
                user_trigger=>user_trigger,
                user_tx_data_in(7 downto 0)=>user_tx_data_in(7 downto 0),
                user_tx_size_in(10 downto 0)=>user_tx_size_in(10 downto 0),
                info_fifo_rden=>tx_info_fifo_rden,
                start_delay_count=>start_delay_count);
   
   delay_counter : entity work.delay_counter
      port map (clear_delay_count=>clear_delay_count,
                clock=>MASTER_CLK,
                reset=>reset,
                start_delay_count=>start_delay_count,
                delay_count=>delay_count);
				
	tx_info_fifo_din(15 downto 0) <= tx_info_fifo_data_comm(15 downto 0) when  tx_info_fifo_src_sel = '0' else tx_info_fifo_data_burst(15 downto 0);
	tx_info_fifo_wr_en <= tx_info_fifo_wren_comm when  tx_info_fifo_src_sel = '0' else tx_info_fifo_wren_burst;
		
--erased  	 latch tx_data once for timing to be right for tx_wren from RAM_COMM_DEC
	process(MASTER_CLK)
	begin
		if (rising_edge(MASTER_CLK)) then
			tx_data_reg <= tx_data;
		end if;
	end process;
			
	tx_data_fifo_din(63 downto 0) <= 	tx_data_reg(63 downto 0) 	when  tx_data_fifo_src_sel = '0' else b_data(63 downto 0);	
	tx_data_fifo_wr_en <= 				tx_data_fifo_wren_comm 	when  tx_data_fifo_src_sel = '0' else tx_data_fifo_wren_burst;
							
	rx_fifo_reset_sig <= rx_fifo_reset or reset;
   
end BEHAVIORAL;



			  