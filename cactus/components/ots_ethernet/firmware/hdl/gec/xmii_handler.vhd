-------------------------------------
-- Author: Ryan Rivera, FNAL			  
-- Created: Sep 4, 2015     																							   
-- 
-- Detects and handles RGMII packets by presenting RGMII to rest of logic as though it was GMII. 
-- It expects Xilinx 7Series IDDR and ODDR components
--
-- RGMII:
-- 	* reduction is achieved by clocking data on both the rising and falling edges of the clock in 1000 Mbit/s operation
--  * The RX_CTL signal carries RXDV (data valid) on the rising edge, and (RXDV xor RXER) on the falling edge. 
--  * The TX_CTL signal likewise carries TXEN on rising edge and (TXEN xor TXER) on the falling edge.	 
--
-------------------------------------  
							  
----------------------------- 		                                                                                          
--                                                                                                                              
--  Comments by rrivera at fnal dot gov : Sep 4, 2015                                                                          
--                                                                                                                              
--  IMPORTANT!! IMPORTANT!! 				                                                                                      
--  It's very important to note!!!   	                                                                                          
--  										                                                                                      
--  The script that moves these files into a Firmware project will 		                                                      
--   place this solution into the project if PHY_SOLUTION is "XILINX_7SERIES_RGMII"
--									                                                  
--															   
			 				   

library IEEE;
use IEEE.std_logic_1164.all;		  		
use ieee.numeric_std.all;		  


Library UNISIM;				  		  -- NOTE: must install Xilinx libraries for this
use UNISIM.vcomponents.all;
																	
entity XILINX_7SERIES_RGMII_handler is
	port (						 			 					
		clk : in std_logic;	 	  
		reset : in std_logic;	  
		
		-- rx
		rx_data : in std_logic_vector(7 downto 0);	
		rx_dv : in std_logic;	  
		rx_er : in std_logic;	     	   		 
		
		rx_data_handled : out std_logic_vector(7 downto 0);	   
		rx_dv_handled : out std_logic;				  
		rx_er_handled : out std_logic;	
		
		-- tx
		tx_data : in std_logic_vector(7 downto 0);	
		tx_dv : in std_logic;	  
		tx_er : in std_logic;	 						   
		
		tx_data_handled : out std_logic_vector(7 downto 0);				  
		tx_dv_handled : out std_logic;				  
		tx_er_handled : out std_logic
															 
	) ;
end;


architecture arch of XILINX_7SERIES_RGMII_handler is	  

	
--	  attribute mark_debug : string;	   		  			    	
--    attribute mark_debug of reset : signal is "true";           
--    attribute mark_debug of is_rgmii_sig : signal is "true";                
--    attribute mark_debug of locked : signal is "true";                     
--    attribute mark_debug of lose_lock : signal is "true";     
--    attribute mark_debug of is_passthru_sig : signal is "true";             
--    attribute mark_debug of rx_data_handled : signal is "true";             
--    attribute mark_debug of rx_rgmii_data : signal is "true";       
--    attribute mark_debug of rx_dv_handled_sig : signal is "true";  
--    attribute mark_debug of rx_er_handled : signal is "true";        
--    attribute mark_debug of tx_data : signal is "true";   
--    attribute mark_debug of tx_dv : signal is "true";     
--    attribute mark_debug of count_fives : signal is "true"; 
--    attribute mark_debug of tx_data_handled : signal is "true";     
--    attribute mark_debug of tx_dv_handled : signal is "true"; 
--							  	   

	signal rx_er_recv : std_logic;			  
	signal rx_dv_handled_sig : std_logic;
																									  
begin				  
	
	
	tx_er_handled <= '0'; -- never used (?)	   
	rx_er_handled <= rx_er_recv xor rx_dv_handled_sig; 			   
	rx_dv_handled <= rx_dv_handled_sig;

	
	---------------------------------------
	-- IDDR_ODDR solution
	---------------------------------------							  
															 
	tx_data_handled(7 downto 4) <= (others => '0');
	
	gen_iddr_rxd : for i in 3 downto 0 generate
		-- IDDR: Double Data Rate Input Register with Set, Reset
		-- and Clock Enable.
		-- 7 Series
		-- Xilinx HDL Libraries Guide, version 2012.2
		IDDR_RXD_inst : IDDR
			generic map (
				DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", -- "OPPOSITE_EDGE", "SAME_EDGE"
				-- or "SAME_EDGE_PIPELINED"
				INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
				INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
				SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC"
			port map (
				Q1 => rx_data_handled(i), -- 1-bit output for positive edge of clock
				Q2 => rx_data_handled(i+4), -- 1-bit output for negative edge of clock
				C => clk, -- 1-bit clock input
				CE => '1', -- 1-bit clock enable input
				D => rx_data(i), -- 1-bit DDR data input
				R => '0', -- 1-bit reset
				S => '0' -- 1-bit set
			);
		-- End of IDDR_inst instantiation  			
	end generate;  

	IDDR_RXDV_inst : IDDR
		generic map (
			DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", -- "OPPOSITE_EDGE", "SAME_EDGE"
			-- or "SAME_EDGE_PIPELINED"
			INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
			INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
			SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC"
		port map (
			Q1 => rx_dv_handled_sig, -- 1-bit output for positive edge of clock
			Q2 => rx_er_recv, -- 1-bit output for negative edge of clock
			C => clk, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D => rx_dv, -- 1-bit DDR data input
			R => '0', -- 1-bit reset
			S => '0' -- 1-bit set
		);
 		
 										 



	-- ODDR: Output Double Data Rate Output Register with Set, Reset 
    -- and Clock Enable.
    -- 7 Series
    -- Xilinx HDL Libraries Guide, version 2012.2
    gen_iddr_txd : for i in 3 downto 0 generate
        IDDR_TXD_inst : ODDR
	        generic map(
	            DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
	            INIT => '0', -- Initial value for Q port ('1' or '0')
	            SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
	        port map (
	            Q => tx_data_handled(i), -- 1-bit DDR output
	            C => clk, -- 1-bit clock input
	            CE => '1', -- 1-bit clock enable input
	            D1 => tx_data(i), -- 1-bit data input (positive edge)
	            D2 => tx_data(i+4), -- 1-bit data input (negative edge)
	            R => '0', -- 1-bit reset input
	            S => '0' -- 1-bit set input
	        );
    end generate;	 
 	    
    ODDR_TXDV_inst : ODDR
	    generic map(
	       DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
	       INIT => '0', -- Initial value for Q port ('1' or '0')
	       SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
	    port map (
	       Q => tx_dv_handled, -- 1-bit DDR output
	       C => clk, -- 1-bit clock input
	       CE => '1', -- 1-bit clock enable input
	       D1 => tx_dv, -- 1-bit data input (positive edge)
	       D2 => tx_dv, -- 1-bit data input (negative edge)
	       R => '0', -- 1-bit reset input
	       S => '0' -- 1-bit set input
	    );    
    
    -- End of ODDR_inst instantiation	   
	 

end arch;				