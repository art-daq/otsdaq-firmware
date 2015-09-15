-------------------------------------
-- Author: Ryan Rivera, FNAL			  
-- Created: Sep 11, 2015																							   
-- 	
-- This block takes decipher data on rising edge of capture_source_sig, if not 0 or 255	   
--
-- This allows the 1 byte packet ("CAPTAN Ping") to change the ip addrs of the GEI remotely
--
-- NOTE: reseting returns the GEI to the default address as specified by user logic.
-------------------------------------   


library IEEE;
use IEEE.std_logic_1164.all;		  		
use ieee.numeric_std.all;
																	
entity gei_address_container is
	port (						 			 					
		clk : in std_logic;	 	  
		reset : in std_logic;		   
		capture : in std_logic;	
		default_addr_in : in std_logic_vector(7 downto 0);	  
		addr_in : in std_logic_vector(7 downto 0);
		
		gei_addr : out std_logic_vector(7 downto 0)
		);
end;


architecture arch of gei_address_container is	   

	signal capture_old : std_logic;		  
	signal gei_addr_sig : std_logic_vector(7 downto 0) := (others => '0');	

begin		
	
	gei_addr <= gei_addr_sig;
		
	process(clk)
	begin
		
		if (rising_edge(clk)) then
			
			capture_old <= capture;
			
			if (reset = '1' or 						 -- reset can happen any time
				unsigned(gei_addr_sig) = 0 ) then 	  -- addr=0 should happen at startup ONLY
				gei_addr_sig <= default_addr_in;	  -- take default addr
			elsif (	capture_old = '0' and capture = '1' and  -- rising edge of source capture
				unsigned(addr_in) > 0 and unsigned(addr_in) < 255) then		 --and not illegal addr
				gei_addr_sig <= addr_in;			-- take "CAPTAN Ping" addr
			end if;	  
				
		end if;	
		
	end process;
	
end arch;