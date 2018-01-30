-------------------------------------------------------------------------------
--
-- Title       : nim_plus_package_1
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\nim_plus_package_1.vhd
-- Generated   : Tue Aug  9 13:36:04 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {nim_plus_package_1} architecture {nim_plus_package_1}}


library IEEE;										 
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

package nim_plus_package_1 is	
	
	
	constant z4: std_logic_vector(3 downto 0) := "0000";
	constant u4: std_logic_vector(3 downto 0) := "0001";	
	
	constant z8: std_logic_vector(7 downto 0) := "00000000";
	constant u8: std_logic_vector(7 downto 0) := "00000001";
	
	Constant z16: std_logic_vector(15 downto 0) := "0000000000000000"; 
	Constant u16: std_logic_vector(15 downto 0) := "0000000000000001";	 
	
	Constant z32: std_logic_vector(31 downto 0) := "00000000000000000000000000000000"; 
	Constant u32: std_logic_vector(31 downto 0) := "00000000000000000000000000000001";	   
	
	Constant z64: std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000"; 
	Constant u64: std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
	
end nim_plus_package_1; 

package	body nim_plus_package_1 is
	
-- Functions and procedures
end nim_plus_package_1;


