-------------------------------------------------------------------------------
--
-- Title       : agrgate16_1
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\agrgate16_1.vhd
-- Generated   : Wed Jan 24 12:40:59 2018
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
--{entity {agrgate16_1} architecture {agrgate16_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity agrgate16_1 is
	 port(
		 in15 : in STD_LOGIC;
		 in14 : in STD_LOGIC;
		 in13 : in STD_LOGIC;
		 in12 : in STD_LOGIC;
		 in11 : in STD_LOGIC;
		 in10 : in STD_LOGIC;
		 in9 : in STD_LOGIC;
		 in8 : in STD_LOGIC;
		 in7 : in STD_LOGIC;
		 in6 : in STD_LOGIC;
		 in5 : in STD_LOGIC;
		 in4 : in STD_LOGIC;
		 in3 : in STD_LOGIC;
		 in2 : in STD_LOGIC;
		 in1 : in STD_LOGIC;
		 in0 : in STD_LOGIC;
		 out16 : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end agrgate16_1;

--}} End of automatically maintained section

architecture agrgate16_1 of agrgate16_1 is
begin

	p1:	process(in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15)
	begin
	-- enter your statements here --  
	out16(0) <= in0;
	out16(1) <= in1;
	out16(2) <= in2;
	out16(3) <= in3;
	out16(4) <= in4;
	out16(5) <= in5;
	out16(6) <= in6;
	out16(7) <= in7;
	out16(8) <= in8;
	out16(9) <= in9;
	out16(10) <= in10;
	out16(11) <= in11;
	out16(12) <= in12;
	out16(13) <= in13;
	out16(14) <= in14;
	out16(15) <= in15;
	
	
	
	end process p1;
	 -- enter your statements here --

end agrgate16_1;
