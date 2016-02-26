-------------------------------------------------------------------------------
--
-- Title       : params_package	  
-- Author      : rrivera   at fnal dot gov		
--
-------------------------------------------------------------------------------
--
-- File        : params_package.vhd
-- Generated   : Mon Jun  9 15:12:08 2008	
--
-------------------------------------------------------------------------------
--
-- Description :  package of parameters for ethernet controller
--
-------------------------------------------------------------------------------
					   				  	 
	
library IEEE;										 
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

package params_package is	
	
	
	constant ETH_CONTROLLER_VERSION: std_logic_vector(15 downto 0) := x"0030"; -- use all numbers, e.g. "0010" 	
	constant ETH_INTERFACE_VERSION: std_logic_vector(15 downto 0) := x"AACA"; -- use all letters, e.g. "AABF"  
	constant delay_term: natural := 0; --x"000A" --x"07D0";

	-- DO NOT TOUCH IP ADDRESS LINE BELOW.. Managed by setup and install script!
<<<<<<< HEAD
	constant ETH_CONTROLLER_DEFAULT_ADDRS: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(240,8)); -- must be 1 to 254 inclusive
=======
	constant ETH_CONTROLLER_DEFAULT_ADDR: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(2,8)); -- must be 1 to 254 inclusive		
	constant ETH_CONTROLLER_DEFAULT_PORT: std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(2007,16)); -- must be 0 to 65535 inclusive
>>>>>>> d8d123dea39560d65ea87e5d07e11864781d38c7
	-- DO NOT TOUCH IP ADDRESS LINE ABOVE.. Managed by setup and install script!
	
end params_package; 

package	body params_package is
	
-- Functions and procedures
end params_package;
