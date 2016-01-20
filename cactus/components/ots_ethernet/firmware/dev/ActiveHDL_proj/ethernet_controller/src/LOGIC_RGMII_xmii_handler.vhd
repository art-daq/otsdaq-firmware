-------------------------------------
-- Author: Ryan Rivera, FNAL			  
-- Created: Aug 13, 2015																							   
-- 
-- Detects and handles RGMII packets by presenting RGMII to rest of logic as though it was GMII. 
-- This is a layer on top of DIG_GEC, in attempt to hide need for special clock or data handling.
--  
-- NOTE: Assume once RGMII, always RGMII (unless reset)	  
--			Thinking is that it is necessary so that tx is formatted correctly
--			(this is similarly done for 4-bit mode in DIG_GEC)
-- 
-- RGMII:
-- 	* reduction is achieved by clocking data on both the rising and falling edges of the clock in 1000 Mbit/s operation
--  * The RX_CTL signal carries RXDV (data valid) on the rising edge, and (RXDV xor RXER) on the falling edge. 
--  * The TX_CTL signal likewise carries TXEN on rising edge and (TXEN xor TXER) on the falling edge.	 
--
--	Detects rgmii by sampling RXDV on rising and falling edge to see if it toggles
-------------------------------------


----------------------------- 		                                                                                          
--                                                                                                                              
--  Comments by rrivera at fnal dot gov : Sep 4, 2015                                                                          
--                                                                                                                              
--  IMPORTANT!! IMPORTANT!! 				                                                                                      
--  It's very important to note!!!   	                                                                                          
--  										                                                                                      
--  The script that moves these files into a Firmware project will 		                                                      
--   place this solution into the project if PHY_SOLUTION is "LOGIC_RGMII"
--									                                                  
--															

library IEEE;
use IEEE.std_logic_1164.all;		  		
use ieee.numeric_std.all;
																	
entity LOGIC_RGMII_handler is
	port (						 			 					
		clk : in std_logic;	 	  
		reset : in std_logic;	 	  	
--		
--		is_rgmii : out std_logic;  
--		locked : out std_logic; 
		
		rx_dv : in std_logic;	  
		rx_er : in std_logic;	  					  
		rx_dv_handled : out std_logic;				  
		rx_er_handled : out std_logic;	   	   
	
		rx_data : in std_logic_vector(7 downto 0);	
		rx_data_handled : out std_logic_vector(7 downto 0);	   
			  	 		
		tx_dv : in std_logic;	  
		tx_er : in std_logic;	 					  
		tx_dv_handled : out std_logic;				  
		tx_er_handled : out std_logic;	
		
		tx_data : in std_logic_vector(7 downto 0);	
		tx_data_handled : out std_logic_vector(7 downto 0)
	) ;
end;


architecture arch of LOGIC_RGMII_handler is	  
	
	
	signal is_rgmii_sig : std_logic := '0';	  
	signal is_rgmii_sig_old : std_logic;	 
	signal is_rgmii_cnt : unsigned(3 downto 0) := (others => '0');	   	  
	signal lose_lock : std_logic := '0';	   	 
	signal is_passthru_sig : std_logic := '0';	    
	signal is_passthru_cnt : std_logic := '0';	   	
	
	
	signal rx_dest_loc : unsigned(0 downto 0) := "0";	
	signal tx_dest_loc : unsigned(0 downto 0) := "0";   	   
	
	type rxShiftData is array(1 downto 0) of std_logic_vector(3 downto 0);	
	signal rx_data_shift_hi, rx_data_shift_lo : rxShiftData;			   
	
	type byteShiftData is array(1 downto 0) of std_logic_vector(7 downto 0);	 
	signal tx_data_shift : byteShiftData;		
	signal rx_data_passthru_shift : byteShiftData;	
													   	
	signal rx_dv_shift : std_logic_vector(1 downto 0);		
	signal tx_dv_shift : std_logic_vector(1 downto 0);	
												
    signal rx_rgmii_data : std_logic_vector(7 downto 0);    
    signal rx_passthru_data : std_logic_vector(7 downto 0);    

	signal rx_dv_falling : std_logic;		
	
	
	signal tx_rgmii_data : std_logic_vector(7 downto 0);	
	signal tx_rgmii_data_lo, tx_rgmii_data_hi : std_logic_vector(3 downto 0);	
	signal tx_rgmii_dv : std_logic;		
	
	
begin				  
	
	
	-- if not currently RGMII then try to detect RGMII
		-- To detect: if RX_DV is '1' and RX_DV_FALL is '0' and RX_D is x05 for 2x (then consider it RGMII)
	-- if RGMII is never detected then the data should passthrough like GMII as normal	
	-- When RGMII, must use falling edge to get low nibble of data and ER from DV.
			
--	is_rgmii <= is_rgmii_sig;  		  
--	locked <= (is_rgmii_sig or is_passthru_sig) and (not lose_lock);
	
	rx_er_handled <= rx_er; -- this is not quite correct for RGMII, but who cares (?)	
	tx_er_handled <= '0'; -- never used (?)
	
	tx_data_handled <= 	tx_rgmii_data when is_rgmii_sig = '1' else tx_data;	  
	tx_dv_handled <= 	tx_rgmii_dv when is_rgmii_sig = '1' else tx_dv;
		
	tx_rgmii_data(7 downto 4) <= x"0";
	
	-- tx method, for harder tx_clk implementation
	--tx_rgmii_data(3 downto 0) <= tx_rgmii_data_lo when clk = '0' else tx_rgmii_data_hi; 	
	--tx_rgmii_dv <= tx_dv_shift(1) when clk = '0' else '0'; -- er never used (?) 
	
	-- tx method, for easier version
	tx_rgmii_data(3 downto 0) <= tx_rgmii_data_lo when clk = '1' else tx_rgmii_data_hi; 	
	tx_rgmii_dv <= tx_dv_shift(0) when clk = '1' else '0'; -- er never used (?) 
		
	-- rx data mux
	rx_data_handled <= rx_passthru_data when is_rgmii_sig = '0' else rx_rgmii_data;	   
			
		
		
	------------------------------------------------------------	 
	------------------------------------------------------------			  
	-- TIMING CONSTRAINT NOTE: tx_dest_loc has 1/2 clk period setup time
	-- TIMING CONSTRAINT NOTE: tx_data_shift has 3/2 clk period travel time	
	rx_handling_rising:process(clk)
	begin
		if rising_edge(clk) then	  
								   	
			is_passthru_cnt <= '0';  			
			rx_dv_handled <= '0';	  
			is_rgmii_sig_old <= is_rgmii_sig;	 
			rx_dv_shift <= rx_dv_shift(0) & rx_dv;	   	
			tx_dv_shift <= tx_dv_shift(0) & tx_dv;				 
			
			-- always take data into shift register as though it is rgmii data
			rx_data_shift_hi( to_integer( rx_dest_loc) ) <= rx_data(3 downto 0);
			
			-- always take rx data as though it were gmii data also
			rx_data_passthru_shift <= rx_data_passthru_shift(0) & rx_data;
			
			
			-- tx method, for harder tx_clk implementation
			--tx_data_shift( to_integer(tx_dest_loc) ) <= tx_data;  
			
			-- tx method, for easier side of clock 
			tx_rgmii_data_lo <= tx_data(3 downto 0);	
			tx_rgmii_data_hi <= tx_data(7 downto 4);	 
			
			if reset = '1' then
				is_rgmii_sig <= '0';  	
				is_passthru_sig <= '0';      
				lose_lock <= '0';
				rx_dest_loc <= "0";	   
				tx_dest_loc <= "0";	  
				rx_dv_shift <= (others => '0');		
				is_rgmii_cnt <= (others => '0');
			else				   		
				
				 --alternate locations for rgmii whenever dv = 1
				if (rx_dv = '1' or rx_dv_shift(0) = '1') then 	  
					rx_dest_loc <= not rx_dest_loc;		 
				else
					rx_dest_loc <= "0";	   	
				end if;	  								  
				
				 --alternate locations for rgmii whenever dv = 1				
				if (tx_dv = '1' or tx_dv_shift(0) = '1') then 	  
					tx_dest_loc <= not tx_dest_loc;		 	
				else
					tx_dest_loc <= "0";	  
				end if;	
				
				--both paths, RGMII or GMII must deliver data at same time (3 clocks delayed)
				rx_dv_handled <= rx_dv_shift(1);								  
						  
				rx_passthru_data <= rx_data_passthru_shift(1);	   			-- normal GMII operation (wont happen if RGMII detected) passthrough: only rising edges
					
				rx_rgmii_data <= 	rx_data_shift_lo( to_integer(rx_dest_loc) ) &	  -- rx RGMII: combine rising and falling edges		
									rx_data_shift_hi( to_integer(rx_dest_loc) );	
						
				
				if (is_rgmii_sig = '0') then -- RGMII not detected yet
																		   
					
					-- detect RGMII
					if (rx_dv = '1' and rx_dv_falling = '1' and rx_data = x"05") then --that's one!	 						
						is_rgmii_cnt <= is_rgmii_cnt + 1;		
					else					
						if (is_rgmii_cnt = 4) then --pass threshold	  
							is_rgmii_sig <= '1'; -- detected RGMII, so set forever!!	 (until reset) 	 			 																	   
						end if;						
						is_rgmii_cnt <= (others => '0');
					end if;	
					
					-- consider 
					if (rx_dv = '1' and rx_dv_falling = '1' and rx_data(3 downto 0) = x"5") then --count as passthrough lock
						if 	(is_passthru_cnt = '1') then --that's two!	  
							is_passthru_sig <= '1'; -- consider a lock for passthrough!	 (until reset) 	 			 																	   
						end if;	
						is_passthru_cnt <= '1';
					end if;
					
				end if;			  
				
				
				if (rx_dv_shift(0) = '0' and rx_dv = '1' and rx_data(3 downto 0) /= x"5") then --lock was lost if first nibble is not 0x5
					lose_lock <= '1';
				end if;
											
			end if;	 
		end if;
	end process;	 
						 
	------------------------------------------------------------	
	------------------------------------------------------------			
	-- TIMING CONSTRAINT NOTE: rx_dest_loc has 1/2 clk period setup time
	-- TIMING CONSTRAINT NOTE: rx_dv_falling has 1/2 clk period setup time
	-- TIMING CONSTRAINT NOTE: rx_data_shift_lo has 3/2 clk period travel time	
	rx_handling_falling:process(clk)   	
	begin			   
		if falling_edge(clk) then	   			
			rx_dv_falling <= rx_dv;	   																	     			
			rx_data_shift_lo( to_integer( not rx_dest_loc) ) <= rx_data(3 downto 0);	
			
		
			-- tx method, for harder tx_clk implementation	
			---- always latch tx data as though it is rgmii data	 
			--tx_rgmii_data_lo <= tx_data_shift( to_integer(tx_dest_loc) )(3 downto 0);	
			--tx_rgmii_data_hi <= tx_data_shift( to_integer(tx_dest_loc) )(7 downto 4);	  
		end if;		
	end process;
	
end arch;				