-------------------------------------
-- Author: Ryan Rivera, FNAL			  
-- Created: Sep 11, 2015		
--  on Feb 3 -- BIG CHANGE, to not allow single byte address changing. Now a 32 bit reg in address space.
-- 	
-- This block takes decipher data on rising edge of capture_source_sig, if not 0 or 255	   
--
-- This allows the 1 byte packet ("OtsUDPHardware Ping") to change the ip addrs of the GEI remotely
--
-- NOTE: reseting returns the GEI to the default address as specified by user logic.
-------------------------------------   


library IEEE;
use IEEE.std_logic_1164.all;		  		
use ieee.numeric_std.all;	   

	  		
use work.params_package.all;
																	
entity address_container is
	port (						 			 					
		clk : in std_logic;	 		   
		capture : in std_logic;										  
		data_in : in std_logic_vector(7 downto 0);			
											 
		set_ctrl_dest_strobe : out std_logic;	 
		set_data_dest_strobe : out std_logic;	
																			  		
		protocol_ping_strobe : out std_logic
		);
end;


architecture arch of address_container is	   

	signal capture_old : std_logic;		  							   

begin						  
		
	process(clk)
	begin
		
		if (rising_edge(clk)) then
			
			capture_old <= capture;			  
			protocol_ping_strobe <= '0';	  
			set_ctrl_dest_strobe <= '0';
			set_data_dest_strobe <= '0';
			
<<<<<<< HEAD
			if (reset = '1') then					 -- reset can happen any time
				addr_sig <= user_addr_in;			
			elsif (addr_sig = x"00" or addr_sig = x"FF") then 	  
				-- addr=0 should happen at startup ONLY ... 
				-- or this case happens if reset and user_addr_in is not being used (or is illegal, i.e. 0 or 255).
				addr_sig <= ETH_CONTROLLER_DEFAULT_ADDRS;	  		-- take default addr from params_package
			elsif (	capture_old = '0' and capture = '1') then   -- rising edge of source capture
				if (addr_in /= x"00" and addr_in /= x"FF") then		 --and not illegal addr
					addr_sig <= addr_in;			-- take "OtsUDPHardware Ping" addr	
					arp_announce_strobe <= '1';
				elsif (addr_in = x"00") then		-- 0s is used as "OtsUDPHardware ping"	
					protocol_ping_strobe <= '1';									
				--else (addr_in = x"FF")			-- 1s is used as "OtsUDPHardware no-op"	
				end if;
			else
				addr_sig <= addr_sig;		-- give explicit registering behavior (Vivado seems to not be sure?)
=======
			if (capture_old = '0' and capture = '1') then   -- rising edge of source capture	
				if (data_in = x"00") then		-- 0s is used as "CAPTAN ping"	
					protocol_ping_strobe <= '1';									
				elsif (data_in = x"01") then		-- 1 is used to set ctrl dest with the current source
					set_ctrl_dest_strobe <= '1';									
				elsif (data_in = x"02") then		-- 2 is used to set data dest with the current source
					set_data_dest_strobe <= '1';									
				--else (data_in = x"FF")			-- 1s is used as "CAPTAN no-op"	
				end if;	   
>>>>>>> d8d123dea39560d65ea87e5d07e11864781d38c7
			end if;	  
				
		end if;	
		
	end process;
	
end arch;