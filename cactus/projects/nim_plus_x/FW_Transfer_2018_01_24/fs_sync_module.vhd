-------------------------------------------------------------------------------
--
-- Title       : fs_sync_module
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\fs_sync_module.vhd
-- Generated   : Wed May 10 14:43:01 2017
-- From        : U:/PREP/PREP_Modernization/Firmware_Backups/Aldec_Backups/One_Phase_Designs/AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase/NIMPlus/NIMPlus/src/fs_sync_module.bde
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


entity fs_sync_module is
  port(
       MHz_40 : in STD_LOGIC;
       clock_320MHz : in STD_LOGIC;
       reset_async_p : in STD_LOGIC;
       reset_master_p : in STD_LOGIC;
       sel_sync_in : in STD_LOGIC_VECTOR(7 downto 0);
       sel_sync_out : out STD_LOGIC
  );
end fs_sync_module;

architecture fs_sync_module of fs_sync_module is

---- Component declarations -----

component d_ff
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
  );
end component;
component section_counter
  port (
       clk : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sec_in : in STD_LOGIC_VECTOR(7 downto 0);
       sec_en : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET92 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : section_counter
  port map(
       clk => clock_320MHz,
       reset_p => NET92,
       sec_en => sel_sync_out,
       sec_in => sel_sync_in
  );

U2 : d_ff
  port map(
       clk => MHz_40,
       dl => reset_async_p,
       q => NET92,
       rst_p => reset_master_p
  );


end fs_sync_module;
