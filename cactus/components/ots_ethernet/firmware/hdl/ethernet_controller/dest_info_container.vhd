-- Author: Ryan Rivera, FNAL

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity dest_info_container is
	port (	
		dest_addrs_in 	: in std_logic_vector(7 downto 0);  	
		dest_ip 		: out std_logic_vector(31 downto 0)
	) ;
end;


architecture dest_info_container_arch of dest_info_container is	 
begin				  
								  
	dest_ip  	<=	x"C0A885" & dest_addrs_in; 	  
	
end dest_info_container_arch;