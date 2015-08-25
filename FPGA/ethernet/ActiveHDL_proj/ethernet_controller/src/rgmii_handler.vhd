-------------------------------------
-- Author: Ryan Rivera, FNAL			  
-- Created: Aug 13, 2015																							   
-- 
-- Detects and handles RGMII packets by presenting RGMII to rest of logic as though it was GMII. 
-- This is a layer on top of DIG_GEC, in attempt to hide need for special clock or data handling.	   
--   (THIS FUNCTIONALITY TO RECEIVE ON BOTH EDGES WAS MOVED TO VERILOG ... because of Vivado compiling issue)
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

library IEEE;
use IEEE.std_logic_1164.all;		  		
use ieee.numeric_std.all;
																	
entity rgmii_handler is
	port (						 			 					
		clk : in std_logic;	 	  
		reset : in std_logic;	 	  	
		
		is_rgmii : out std_logic;  	--feedback to user about state
		locked : out std_logic; 
		
		rx_dv : in std_logic;	  
		rx_er : in std_logic;	  	
		rx_rgmii_dv : in std_logic;	  
		rx_rgmii_er : in std_logic;	  	    	   
	
		rx_data : in std_logic_vector(7 downto 0);	 
		rx_rgmii_data : in std_logic_vector(7 downto 0);
		
		rx_data_handled : out std_logic_vector(7 downto 0);	   
		rx_dv_handled : out std_logic;				  
		rx_er_handled : out std_logic;	
			  	 		
		tx_dv : in std_logic;	  
		tx_er : in std_logic;	 					  
		tx_dv_handled : out std_logic;				  
		tx_er_handled : out std_logic;	
		
		tx_data : in std_logic_vector(7 downto 0);	
		tx_data_handled : out std_logic_vector(7 downto 0)
	) ;
end;


architecture arch of rgmii_handler is	  
	
	
	signal is_rgmii_sig : std_logic := '0';	
	signal is_passthru_sig : std_logic := '0';	   
	signal lose_lock : std_logic := '0';

	signal count_fives : unsigned(3 downto 0) := (others => '0'); 	  
	
	signal rx_passthru_data : std_logic_vector(7 downto 0);    
	signal rx_passthru_er : std_logic;   
														  
	type byteShiftData is array(1 downto 0) of std_logic_vector(7 downto 0);	
	signal rx_data_passthru_shift : byteShiftData;		  
	signal rx_dv_passthru_shift : std_logic_vector(1 downto 0);	   
	signal tx_dv_shift : std_logic_vector(1 downto 0);	
	
	signal tx_rgmii_data : std_logic_vector(7 downto 0);	
	signal tx_rgmii_data_lo, tx_rgmii_data_hi : std_logic_vector(3 downto 0);	
	signal tx_rgmii_dv : std_logic;		
	
   	--attribute mark_debug : string;	   		  			    	
--    attribute mark_debug of reset : signal is "true";           
--    attribute mark_debug of is_rgmii_sig : signal is "true";                
--    attribute mark_debug of locked : signal is "true";                     
--    attribute mark_debug of lose_lock : signal is "true";     
--    attribute mark_debug of is_passthru_sig : signal is "true";             
--    attribute mark_debug of rx_data_handled : signal is "true";             
--    attribute mark_debug of rx_rgmii_data : signal is "true";       
--    attribute mark_debug of rx_dv_handled : signal is "true";  
--    attribute mark_debug of rx_er_handled : signal is "true";        
--    attribute mark_debug of tx_data : signal is "true";   
--    attribute mark_debug of tx_dv : signal is "true";     
--    attribute mark_debug of count_fives : signal is "true"; 
--    attribute mark_debug of tx_data_handled : signal is "true";     
--    attribute mark_debug of tx_dv_handled : signal is "true"; 
--	
	
begin				  
	
	
	-- if not currently RGMII then try to detect RGMII
		-- To detect: if only 4x 55 on normal data lines, then RGMII
	-- if RGMII is never detected then the data should passthrough like GMII as normal	
	-- When RGMII, select rgmii data to passthrough.
			
	is_rgmii <= is_rgmii_sig;  		  
	locked <= (is_rgmii_sig or is_passthru_sig) and (not lose_lock);
							
	
	rx_data_handled <= rx_data_passthru_shift(1) when is_rgmii_sig = '0' else rx_rgmii_data;	  
	rx_dv_handled <= rx_dv_passthru_shift(1) when is_rgmii_sig = '0' else rx_rgmii_dv;	  		
	rx_er_handled <= rx_passthru_er when is_rgmii_sig = '0' else rx_rgmii_er; -- er is one clock early for passthru, but who cares?	  
		
		
	tx_rgmii_data(7 downto 4) <= (others => '0');
	tx_rgmii_data(3 downto 0) <= tx_rgmii_data_lo when clk = '1' else tx_rgmii_data_hi;    
	tx_rgmii_dv <= tx_dv_shift(0) when clk = '1' else tx_dv_shift(0); -- er never used (?) 				 
		
	tx_data_handled <= 	tx_rgmii_data when is_rgmii_sig = '1' else tx_data;	  
	tx_dv_handled <= 	tx_rgmii_dv when is_rgmii_sig = '1' else tx_dv;	  
	tx_er_handled <= '0'; -- never used (?)
																  
		
	------------------------------------------------------------	 
	------------------------------------------------------------
	-- Falling edge logic is handled upstream of this block by rgmii_data_handler
	--  because Vivado had trouble with VHDL. Verilog was handled better.
	rx_handling_rising:process(clk)
	begin
		if rising_edge(clk) then	 			
										  	  
			rx_data_passthru_shift <= rx_data_passthru_shift(0) & rx_data;	 
			rx_dv_passthru_shift <= rx_dv_passthru_shift(0) & rx_dv;	 			
									    
			rx_passthru_er <= rx_er;	   	 
			
			-- tx method, for easier side of clock 		
			tx_dv_shift <= tx_dv_shift(0) & tx_dv;		 
			tx_rgmii_data_lo <= tx_data(3 downto 0);	
			tx_rgmii_data_hi <= tx_data(7 downto 4);					 
													 
			
			if reset = '1' then				 
				is_passthru_sig <= '0';
				is_rgmii_sig <= '0';  	     
				lose_lock <= '0';	
				count_fives <= (others => '0');  
			else			 		 
				
				if (is_rgmii_sig = '0' and is_passthru_sig = '0') then
					
					if (rx_dv_passthru_shift(0) = '1') then
						if (rx_data_passthru_shift(0) = x"05") then	
							count_fives <= count_fives + 1;
						elsif (count_fives = 0) then 	  -- detected GMII
							is_passthru_sig <= '1';
						elsif (count_fives = 8 and rx_rgmii_data = x"D5") then
							is_rgmii_sig <= '1';	  -- detected RGMII, so set forever!!	 (until reset) 
						end if;
					else	  -- dv down, so reset count
						count_fives <= (others => '0');	
					end if;		
					
				end if;		   
				
				-- TODO -- maybe? could identify if lock was lost by counting 5's when DV transitions
					-- and making sure the 5's come out to expected number.
				-- Poor man's lock detection:
				if (rx_dv_passthru_shift(0) = '0' and rx_dv = '1' and rx_data(3 downto 0) /= x"5") then --lock was lost if first nibble is not 0x5
					lose_lock <= '1';
				end if;
				
			end if;
	
		end if;
	end process;				

end arch;				