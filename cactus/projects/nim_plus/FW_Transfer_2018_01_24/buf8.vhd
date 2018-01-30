-------------------------------------------------------------------------------
--
-- Title       : buf8
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\buf8.vhd
-- Generated   : Wed Jan 24 10:31:50 2018
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\buf8.bde
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


entity buf8 is
  port(
       b_in : in STD_LOGIC_VECTOR(7 downto 0);
       b_out : out STD_LOGIC_VECTOR(7 downto 0)
  );
end buf8;

architecture buf8 of buf8 is

begin

----  Component instantiations  ----

b_out(0) <= b_in(0);

b_out(1) <= b_in(1);

b_out(2) <= b_in(2);

b_out(3) <= b_in(3);

b_out(4) <= b_in(4);

b_out(5) <= b_in(5);

b_out(6) <= b_in(6);

b_out(7) <= b_in(7);


end buf8;
