-------------------------------------------------------------------------------
--
-- Title       : TopShell
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\TopShell.vhd
-- Generated   : Wed May 10 14:38:29 2017
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\TopShell.bde
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


entity TopShell is
  port(
       CLKIN_PORT : in STD_LOGIC;
       DATA_IN_PORT : in STD_LOGIC;
       ENABLE_IN_PORT : in STD_LOGIC;
       DATA_OUT_PORT_N : out STD_LOGIC;
       DATA_OUT_PORT_P : out STD_LOGIC
  );
end TopShell;

architecture TopShell of TopShell is

begin

end TopShell;
