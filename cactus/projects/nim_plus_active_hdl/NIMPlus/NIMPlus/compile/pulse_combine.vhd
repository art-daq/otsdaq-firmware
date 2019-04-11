-------------------------------------------------------------------------------
--
-- Title       : pulse_combine
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\compile\pulse_combine.vhd
-- Generated   : Wed May  2 14:06:00 2018
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\src\pulse_combine.bde
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


entity pulse_combine is
  port(
       oe : in STD_LOGIC;
       e : in STD_LOGIC_VECTOR(3 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       y : out STD_LOGIC
  );
end pulse_combine;

architecture pulse_combine of pulse_combine is

---- Signal declarations used on the diagram ----

signal t : STD_LOGIC;
signal s : STD_LOGIC_VECTOR(3 downto 0);

begin

----  Component instantiations  ----

s(0) <= e(0) and x(0);

s(1) <= e(1) and x(1);

s(3) <= e(3) and x(3);

s(2) <= e(2) and x(2);

t <= s(3) or s(2) or s(1) or s(0);

y <= oe and t;


end pulse_combine;
