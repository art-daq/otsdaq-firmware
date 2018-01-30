-------------------------------------------------------------------------------
--
-- Title       : accel_sync_test
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_11_16_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\accel_sync_test.vhd
-- Generated   : Mon Nov 20 12:17:52 2017
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_11_16_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\accel_sync_test.bde
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


entity accel_sync_test is
  port(
       clk0 : in STD_LOGIC;
       clk_13_25 : in STD_LOGIC;
       clk_26_5 : in STD_LOGIC;
       ctr_reset : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       fs_sync_bus : in STD_LOGIC_VECTOR(5 downto 0);
       clk_39_out : out STD_LOGIC
  );
end accel_sync_test;

architecture accel_sync_test of accel_sync_test is

---- Component declarations -----

component acc_sync
  port (
       clk_13_25 : in STD_LOGIC;
       clk_26_5 : in STD_LOGIC;
       clk_in : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       release_p : out STD_LOGIC
  );
end component;
component divide_by_8
  port (
       clock : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sigout : out STD_LOGIC
  );
end component;
component section_counter
  port (
       clk : in STD_LOGIC;
       release_p : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sec_in : in STD_LOGIC_VECTOR(5 downto 0);
       sec_en : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal release_p : STD_LOGIC;
signal reset_p : STD_LOGIC;
signal sync_w_40MHz : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : divide_by_8
  port map(
       clock => clk0,
       reset_p => sync_w_40MHz,
       sigout => clk_39_out
  );

U2 : section_counter
  port map(
       clk => clk0,
       release_p => release_p,
       reset_p => reset_p,
       sec_en => sync_w_40MHz,
       sec_in => fs_sync_bus
  );

reset_p <= reset_out or ctr_reset;

U286 : acc_sync
  port map(
       clk_13_25 => clk_13_25,
       clk_26_5 => clk_26_5,
       clk_in => clk0,
       release_p => release_p,
       reset_p => reset_p
  );


end accel_sync_test;
