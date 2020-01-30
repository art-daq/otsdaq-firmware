-------------------------------------------------------------------------------
--
-- Title       : v_sec_32_4_in_64_out
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_04_30_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\v_sec_32_4_in_64_out
-- Generated   : Mon May  1 08:24:47 2017
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
--{entity {v_sec_32_4_in_64_out} architecture {v_sec_32_4_in_64_out}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity v_sec_32_4_in_64_out is
	 port(
		 
		v_in_0 : in STD_LOGIC_VECTOR(31 downto 0);	 
		v_in_1 : in STD_LOGIC_VECTOR(31 downto 0);
		v_out : out STD_LOGIC_VECTOR(63 downto 0)	 	  	   
		 
	     );
end v_sec_32_4_in_64_out;

--}} End of automatically maintained section

architecture v_sec_32_4_in_64_out of v_sec_32_4_in_64_out is 


begin  
			p1:	process(v_in_0, v_in_1)
		begin
			v_out(31 downto 0) <= v_in_0;
			v_out(63 downto 32) <= v_in_1;		 
		end	process p1;

	 -- enter your statements here --

end v_sec_32_4_in_64_out;
