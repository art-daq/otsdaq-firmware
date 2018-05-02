----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:50 11/11/2013 
-- Design Name: 
-- Module Name:    psi_dig_decoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity psi_dig_decoder is
    Port ( sclk : in  STD_LOGIC;				
		   rst : in STD_LOGIC;	  
           sdata : in  STD_LOGIC;					
		   									   		   								 
		   tok_in : in STD_LOGIC;
		   tok_out : in STD_LOGIC;		   								  
		   evt_num : in STD_LOGIC_VECTOR (19 downto 0);	
		   
		   mclk : in STD_LOGIC;	  
		   												  								   
		   sm_ready : out STD_LOGIC;						  								   
		   error : out STD_LOGIC;	   				  								   
		   error_reset_req : out STD_LOGIC;	  	  --psi missed a token out, so request reset
		   dataout_we : out STD_LOGIC;	   
		   evt_num_latch : out STD_LOGIC_VECTOR (19 downto 0);	   -- latch on falling edge of tok_in
		   
           dataout : out  STD_LOGIC_VECTOR (28 downto 0));
end psi_dig_decoder;

architecture Behavioral of psi_dig_decoder is

	signal dataout_sig : 	STD_LOGIC_VECTOR (23 downto 0);
	signal chipid : 	   	STD_LOGIC_VECTOR (3 downto 0) := (others => '1');	
	signal cnt : 	   		STD_LOGIC_VECTOR (5 downto 0) := (others => '1');	
	signal zerocnt : 	 	STD_LOGIC_VECTOR (5 downto 0) := (others => '0');    
	signal onecnt : 	 	STD_LOGIC_VECTOR (5 downto 0) := (others => '0'); 
	signal tok_in_sig, tok_in_sig_old, tok_out_sig, tok_out_sig_old : std_logic;										 
	signal tok_in_found, tok_out_found : std_logic := '0';		   
	
	signal mclk_sample_of_sclk_hd, sclk_sample_of_mclk_hd : std_logic;
	
	signal	sclk_have_data : std_logic := '0';	  
	signal	mclk_have_data : std_logic := '0';
begin
	
	
	-- serial data is:
	-- tok in							   					   
	--	8 + 3 + 6 + 9 + 9	 = 		35
	-- 		0xFF	
	--		1 octet 	unknown?? (last dac?)	  
	--		2 octets 	DCOL					  23:18
	--		3 octets	PixlAddr				  17:9
	--		3 octets 	ADC						   8:0
	
	-- dataout is:				
	--		8:5 & 3:0 	8 bits ADC
	--		17:9 	9 bits PixelAddr
	--		23:18	6 bits DCOL
	--		27:24  	4 bits chipId	 
	--		28  	1 bit 	dig indicator  := '1'
	process(sclk)		 
	begin
		if rising_edge(sclk) then	  
			
			tok_in_sig <= tok_in;	
			tok_in_sig_old <= tok_in_sig;
			tok_out_sig <= tok_out;			
			tok_out_sig_old <= tok_out_sig;
			
			dataout(28) <= '1'; --	psi dig indicator, would be interpreted as chip id 16 by analog decode software
			sclk_sample_of_mclk_hd <= mclk_have_data;
								
			if rst = '1' then	 
				
				tok_in_found <= '0';
				tok_out_found <= '0'; 
				sclk_have_data <= '0';	  
				error <= '0';		   
				cnt <= (others => '1');			
				error_reset_req <= '0';		 
				sm_ready <= '1';
				
			else
				
				if tok_in_sig_old = '1' and tok_in_sig = '0' then -- tok in falling edge		  	   					
					tok_in_found <= '1';
					tok_out_found <= '0';  
					evt_num_latch <= evt_num; 
					chipid <= (others => '1');	--start at -1, and inc on first header		
					sm_ready <= '0'; 
				end if;		  
				
				if tok_in_found = '1' and tok_out_sig_old = '0' and tok_out_sig = '1' then	-- tok out rising edge	 
					tok_out_found <= '1';	   					   
					tok_in_found <= '0';
					error_reset_req <= '0';			
					sm_ready <= '1'; 
				end if;		  												
					
				dataout_sig(23 downto 1) <= dataout_sig(22 downto 0);
				dataout_sig(0) <= sdata;	
				
				if tok_in_found = '1' and dataout_sig(11 downto 2) = '0' & x"FF" & '0' then	  -- found 0xFF header
					
					cnt <= (others => '0');		   
					zerocnt <= (others => '0');		
					onecnt <= (others => '0');			 
					chipid <= chipid + 1;	
				
				elsif cnt < 24 then 		  
					
					cnt <= cnt + 1;					 
					if sdata = '0' then 
						zerocnt <= zerocnt + 1;		 
						onecnt <= (others => '0');		
					else
						zerocnt <= (others => '0');		
						onecnt <= onecnt + 1;
					end if;
				
					if cnt = 23 then					 
					
						if tok_out_found = '0' then	  --still more data to come	or error			  
							if zerocnt > 20 or onecnt > 20 then	   -- receiving all 0's and tok out did not return, so request a ROC reset
								error_reset_req <= '1';										
								sm_ready <= '1'; 
							else																					
								cnt <= (others => '0');	 --reset counter for next pixel data
							end if;	
						end if;					
										 						
							
						--data word complete
						if sclk_have_data = '1' or sclk_sample_of_mclk_hd = '1' then 						
							error <= '1'; --ovf error
						end if;
						
						if dataout_sig(4) = '0' and dataout_sig(23 downto 9) > 0 then	 --only take data if a good hit
							sclk_have_data <= '1';	
						end if;
			
						dataout(23 downto 0) <= dataout_sig(23 downto 0);	--dcol & PixlAddr & adc
						dataout(27 downto 24) <= chipid; --chip id, change by 0xFF's found (?)		 
					end if;
					
				end if;		 		
				
				--lower data flag for next time domain cross
				if sclk_have_data = '1' and mclk_have_data = '1' then 
					sclk_have_data <= '0';
				end if;
				
			end if;
			
		end if;
		
	end process;	  
	
	
	process(mclk)		 
	begin
		if rising_edge(mclk) then	
							   
			dataout_we <= '0';
			mclk_sample_of_sclk_hd <= sclk_have_data; 
			
			if rst = '1' then	 
				
				mclk_have_data <= '0';
							
			else
				
				
				if mclk_have_data = '0' and mclk_sample_of_sclk_hd = '1' then 	   -- pass dataout in mclk domain, data should be stable
					dataout_we <= '1';		
					mclk_have_data <= '1';						
				end if;					
				
				if mclk_have_data = '1' and mclk_sample_of_sclk_hd = '0' then 	  
					mclk_have_data <= '0';	
				end if;	  
			end if;
			
		end if;
		
	end process;
	

end Behavioral;

