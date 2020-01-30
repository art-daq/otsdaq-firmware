-------------------------------------------------------------------------------
--
-- Title       : pol_sel
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\pol_sel.vhd
-- Generated   : Thu Jan 25 15:58:07 2018
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\pol_sel.bde
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


entity pol_sel is
  port(
       sel_in : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       sig_out : out STD_LOGIC
  );
end pol_sel;

architecture pol_sel of pol_sel is

---- Signal declarations used on the diagram ----

signal NET31 : STD_LOGIC;

begin

----  Component instantiations  ----

NET31 <= not(sig_in);

sig_out <= (sig_in and not sel_in) or (NET31 and sel_in);


end pol_sel;
