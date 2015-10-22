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

	  		
use work.params_package.all;
																	
entity gei_address_container is
	port (						 			 					
		clk : in std_logic;	 	  
		reset : in std_logic;		   
		capture : in std_logic;								  
		addr_in : in std_logic_vector(7 downto 0);			
		
		arp_announce_strobe : out std_logic;	
		gei_protocol_ping_strobe : out std_logic;	
		
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
			arp_announce_strobe <= '0';	 
			gei_protocol_ping_strobe <= '0';
			
			if (reset = '1' or 					 -- reset can happen any time
				gei_addr_sig = x"00" ) then 	  -- addr=0 should happen at startup ONLY
				gei_addr_sig <= ETH_CONTROLLER_DEFAULT_ADDRS;	  		-- take default addr from params_package
			elsif (	capture_old = '0' and capture = '1') then   -- rising edge of source capture
				if (addr_in /= x"00" and addr_in /= x"FF") then		 --and not illegal addr
					gei_addr_sig <= addr_in;			-- take "CAPTAN Ping" addr	
					arp_announce_strobe <= '1';
				else   					-- illegal address is used as "CAPTAN ping"	
					gei_protocol_ping_strobe <= '1';					
				end if;
			else
				gei_addr_sig <= gei_addr_sig;		-- give explicit registering behavior (Vivado seems to not be sure?)
			end if;	  
				
		end if;	
		
	end process;
	
end arch;