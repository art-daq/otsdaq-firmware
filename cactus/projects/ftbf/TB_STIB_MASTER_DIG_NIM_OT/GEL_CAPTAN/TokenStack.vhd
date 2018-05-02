-------------------------------------------------------------------------------
--
-- Title       : TokenStack
-- Design      : Test Beam Master Station
-- Author      : Ryan Rivera
-- Company     : FNAL
-- Date 	   : 9/13/2011					  
-- 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;	
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;					  


-- Handles one plaquette's token stack:
--		Takes in a psi read token and maintains the stack of tokens				  
--			If token stack is full, there is overflow, and the chip must be reset
-- 		Maintains the event number (which is the trigger number of the current token out in circulation)
--			Important: This number is stable for the read state machine (even though state machine is in mclk domain and cnt is in psi domain), 
--			because it can't change until ready signal is received from state machine.
--			
--		Once a token is sent, this block cannot send another until sm_ready drops to '0' and back to '1'
--
-- 			When an error is received, the psi plaquette is held in reset while the stack is emptied and event number
--			is incremented by the number of left over tokens in the stack.

entity TokenStack is
	 port(
		 psi_clk : in STD_LOGIC;		 					-- psi clk		 						 
		 rst : in STD_LOGIC;	 							   -- reset	  
		 error_rst_req : in STD_LOGIC;	 			   -- error requesting reset	  
		 token_we : in STD_LOGIC;							-- psi time domain		   
		 sm_ready : in STD_LOGIC;	 						-- state machine ready		  
		 bypass_stack : in STD_LOGIC;	 					-- '1' bypasses stack so handshaking is not necessary with decoding sm
		 
		 tok_cnt : out STD_LOGIC_VECTOR(3 downto 0);		   
		 event_number : out STD_LOGIC_VECTOR(19 downto 0);	-- current event number of token currently circulating		
		 
		 psi_reset_n : out STD_LOGIC;	 					-- psi plaquette reset, for error recovery (active low)		 																		     
		 ovf_flow : out STD_LOGIC;	 						-- more than 14 tokens backed up	
		 throttle : out STD_LOGIC;							-- throttle triggers	     			   
		 token_to_psi : out STD_LOGIC						  	
	     );
end TokenStack;	   
																												 
architecture TokenStack of TokenStack is				   	  
	  										   
	signal reset_req_count : integer range 0 to 15;		
	signal count : STD_LOGIC_VECTOR(3 downto 0);	      
	signal waiting_for_ready : integer range 0 to 3;	    		-- need to identify sm_ready '1' to '0' to '1'	
	signal handling_reset_req :  STD_LOGIC;													
	signal error_rst_req_old :  STD_LOGIC;						 
	signal event_number_sig : STD_LOGIC_VECTOR(19 downto 0);	-- current event number of token currently circulating			  									
	
begin		
	
	event_number <= event_number_sig;
	tok_cnt <= count;--conv_std_logic_vector(count,4);	   
	
	--==========================================================================
	--		 					  	
	process (psi_clk)
	begin
		if rising_edge(psi_clk) then	
			
			psi_reset_n <= '1';
			token_to_psi <= '0';  	   
			throttle <= '0';   
			if count > 8 then  -- throttle threshold!
				throttle <= '1';
			end if;
			
			error_rst_req_old <= error_rst_req;	 
													  			
			-- main loop
			if rst = '1' then 		
				
		  		count <= (others => '0');	   
				waiting_for_ready <= 0;	  
				ovf_flow <= '0';	 
				event_number_sig <= (others => '1'); --init event number to -1, so that 0 is first token sent 
				reset_req_count <= 0;	 
				handling_reset_req <= '0';
				
			elsif bypass_stack = '1' then
				token_to_psi <= token_we;
			else
			--{	 
				
				if (error_rst_req_old = '0' and error_rst_req = '1') or handling_reset_req = '1' then				 	 --------------------------- error reset request or handling error reset request  
				--{
					handling_reset_req <= '1';	
					waiting_for_ready <= 0;	  --added June 11, 2015
					
					if reset_req_count < 8 then -- up to this count, psi reset, after this count, psi unreset
						psi_reset_n <= '0'; -- reset psi plaquette
					end if;								 
					throttle <= '1'; 
					
					if token_we = '1' then		  	-- if token comes during reset request, advance trigger number as though token sent immediately							
						event_number_sig <= event_number_sig + 1;	 						
					elsif handling_reset_req = '1' then  --make sure 2nd time through
					
						if count = 0 then --count = 0, so no more stacked tokens
							
							reset_req_count <= reset_req_count + 1;	
										
							if reset_req_count = 14 then -- avoid potential error of being at 15 and adding 1
								reset_req_count <= 0; -- reset for next error
								handling_reset_req <= '0';	 
							end if;	
							
						else 		  	--count off tokens
							count <= count - 1;	 		 			
							event_number_sig <= event_number_sig + 1;	
						end if;		   
						
					end if;
					
					
				--}		
				else	  --------------------------- not error reset request  
				--{				 					 						  
				
					--token write/read handling
					if token_we = '1' and waiting_for_ready = 0 and sm_ready = '1' then -- read and write	
						
						 --token count doesn't change				
						token_to_psi <= '1';	-- send token	   
						event_number_sig <= event_number_sig + 1;	
						waiting_for_ready <= 1;
						
					elsif token_we = '1' and waiting_for_ready > 0 then 											--write only
						
						if count /= 14 then	 -- max at 14 saved	tokens
							count <= count + 1;		  
						else  
							handling_reset_req <= '1'; --ovf_flow <= '1';	   -- overflow, handle reseting plaq 
							event_number_sig <= event_number_sig + 1;		   -- increment counter for this overflow recognition clock period
						end if;		   		 						
						
					elsif waiting_for_ready > 1 and sm_ready = '1' then 					--read only
						if count /= 0 then		  	--if tokens available, send one
						   count <= count - 1;	 		 			  
							token_to_psi <= '1';	-- send token	
							event_number_sig <= event_number_sig + 1;	
							waiting_for_ready <= 1;
						else
							waiting_for_ready <= 0;
						end if;		
					
					elsif sm_ready = '0' then
						waiting_for_ready <= 2;
											
					end if;	
					
				end if;
				
			--}	
			end if;	  
			
			
			   
			
		end if;	 		
	end process;	 			
	

end TokenStack;