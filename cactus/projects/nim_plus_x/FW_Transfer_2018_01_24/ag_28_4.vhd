-------------------------------------------------------------------------------
--
-- Title       : ag_28_4
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\ag_28_4.vhd
-- Generated   : Mon Jan 29 16:43:31 2018
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
--{entity {ag_28_4} architecture {ag_28_4}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ag_28_4 is
	 port(
		 in28 : in STD_LOGIC_VECTOR(27 downto 0);
		 in4 : in STD_LOGIC_VECTOR(3 downto 0);
		 out32 : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end ag_28_4;

--}} End of automatically maintained section

architecture ag_28_4 of ag_28_4 is	
begin
	p1:	process(in28, in4)
	begin
	-- enter your statements here --  
	out32(31 downto 28) <= in4(3 downto 0);
	out32(27 downto 0) <= in28(27 downto 0);
	
	
	end process p1;


	 -- enter your statements here --

end ag_28_4;
