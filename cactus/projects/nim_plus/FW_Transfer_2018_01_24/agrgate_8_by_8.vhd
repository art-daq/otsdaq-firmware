-------------------------------------------------------------------------------
--
-- Title       : agrgate_8_by_8
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\agrgate_8_by_8.vhd
-- Generated   : Mon Jan 22 16:16:43 2018
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
--{entity {agrgate_8_by_8} architecture {agrgate_8_by_8}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity agrgate_8_by_8 is
	 port(
		 in0 : in STD_LOGIC_VECTOR(7 downto 0);
		 in1 : in STD_LOGIC_VECTOR(7 downto 0);
		 in2 : in STD_LOGIC_VECTOR(7 downto 0);
		 in3 : in STD_LOGIC_VECTOR(7 downto 0);
		 in4 : in STD_LOGIC_VECTOR(7 downto 0);
		 in5 : in STD_LOGIC_VECTOR(7 downto 0);
		 in6 : in STD_LOGIC_VECTOR(7 downto 0);
		 in7 : in STD_LOGIC_VECTOR(7 downto 0);
		 out_0 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end agrgate_8_by_8;

--}} End of automatically maintained section

architecture agrgate_8_by_8 of agrgate_8_by_8 is
begin
	
	p1:	process(in0, in1, in2, in3, in4, in5, in6, in7)
	begin
	-- enter your statements here --  
	out_0(63 downto 56) <= in7(7 downto 0);	
	out_0(55 downto 48) <= in6(7 downto 0);
 	out_0(47 downto 40) <= in5(7 downto 0);
	out_0(39 downto 32) <= in4(7 downto 0);
	out_0(31 downto 24) <= in3(7 downto 0);
	out_0(23 downto 16) <= in2(7 downto 0);
	out_0(15 downto 8) <= in1(7 downto 0);
	out_0(7 downto 0) <= in0(7 downto 0);	
	
	end process p1;
end agrgate_8_by_8;
