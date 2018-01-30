-------------------------------------------------------------------------------
--
-- Title       : mux_2_1_16ch
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_24_NIMPlus_jw121_320MHz_1Phase\NIMPlus\NIMPlus\compile\mux_2_1_16ch.vhd
-- Generated   : Wed May 24 11:21:43 2017
-- From        : U:/PREP/PREP_Modernization/Firmware_Backups/Aldec_Backups/One_Phase_Designs/AGP_2017_05_24_NIMPlus_jw121_320MHz_1Phase/NIMPlus/NIMPlus/src/mux_2_1_16ch.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
--use nim_plus_package_1.all;


entity mux_2_1_16ch is
  port(
       sel : in STD_LOGIC;
       in_ch0 : in STD_LOGIC_VECTOR(15 downto 0);
       in_ch1 : in STD_LOGIC_VECTOR(15 downto 0);
       s_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end mux_2_1_16ch;

architecture mux_2_1_16ch of mux_2_1_16ch is

begin

----  Component instantiations  ----

s_out(0) <= (in_ch0(0) and not sel) or (in_ch1(0) and sel);

s_out(9) <= (in_ch0(9) and not sel) or (in_ch1(9) and sel);

s_out(10) <= (in_ch0(10) and not sel) or (in_ch1(10) and sel);

s_out(11) <= (in_ch0(11) and not sel) or (in_ch1(11) and sel);

s_out(12) <= (in_ch0(12) and not sel) or (in_ch1(12) and sel);

s_out(13) <= (in_ch0(13) and not sel) or (in_ch1(13) and sel);

s_out(14) <= (in_ch0(14) and not sel) or (in_ch1(14) and sel);

s_out(15) <= (in_ch0(15) and not sel) or (in_ch1(15) and sel);

s_out(1) <= (in_ch0(1) and not sel) or (in_ch1(1) and sel);

s_out(2) <= (in_ch0(2) and not sel) or (in_ch1(2) and sel);

s_out(3) <= (in_ch0(3) and not sel) or (in_ch1(3) and sel);

s_out(4) <= (in_ch0(4) and not sel) or (in_ch1(4) and sel);

s_out(5) <= (in_ch0(5) and not sel) or (in_ch1(5) and sel);

s_out(6) <= (in_ch0(6) and not sel) or (in_ch1(6) and sel);

s_out(7) <= (in_ch0(7) and not sel) or (in_ch1(7) and sel);

s_out(8) <= (in_ch0(8) and not sel) or (in_ch1(8) and sel);


end mux_2_1_16ch;
