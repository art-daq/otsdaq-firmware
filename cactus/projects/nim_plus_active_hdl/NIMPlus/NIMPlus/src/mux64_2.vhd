-------------------------------------------------------------------------------
--
-- Title       : mux64_2
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\mux64_2.vhd
-- Generated   : Tue Jan 23 15:07:59 2018
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
--{entity {mux64_2} architecture {mux64_2}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux64_2 is
	 port(
		 in_0 : in STD_LOGIC_VECTOR(63 downto 0);
		 in_1 : in STD_LOGIC_VECTOR(63 downto 0);		
		 sel : in STD_logic;
		 out64 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end mux64_2;

--}} End of automatically maintained section

architecture mux64_2 of mux64_2 is
begin

	p1:	process(in_0, in_1, sel)
	begin
  	 if (sel = '0') then
		 out64(63 downto 0) <= in_0(63 downto 0);
	 else	
		 out64(63 downto 0) <= in_1(63 downto 0);
	 end if;	
	
	end process p1;
	 -- enter your statements here --

end mux64_2;
