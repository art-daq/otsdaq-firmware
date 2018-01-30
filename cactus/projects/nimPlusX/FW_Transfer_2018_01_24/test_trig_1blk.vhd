-------------------------------------------------------------------------------
--
-- Title       : test_trig_1blk
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\test_trig_1blk.vhd
-- Generated   : Wed May 10 14:38:08 2017
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\test_trig_1blk.bde
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


entity test_trig_1blk is
  port(
       clk_0 : in STD_LOGIC;
       clk_1 : in STD_LOGIC;
       clk_2 : in STD_LOGIC;
       clk_3 : in STD_LOGIC;
       en_output : in STD_LOGIC;
       en_pulses : in STD_LOGIC;
       sysreset : in STD_LOGIC;
       wr_blk : in STD_LOGIC;
       dlay_in : in STD_LOGIC_VECTOR(7 downto 0);
       e : in STD_LOGIC_VECTOR(15 downto 0);
       wdth_in : in STD_LOGIC_VECTOR(7 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       trg_sig : out STD_LOGIC
  );
end test_trig_1blk;

architecture test_trig_1blk of test_trig_1blk is

---- Component declarations -----

component trig_test
  port (
       clk_0 : in STD_LOGIC;
       clk_1 : in STD_LOGIC;
       clk_2 : in STD_LOGIC;
       clk_3 : in STD_LOGIC;
       dlay_in : in STD_LOGIC_VECTOR(7 downto 0);
       e : in STD_LOGIC_VECTOR(15 downto 0);
       en_output : in STD_LOGIC;
       en_pulses : in STD_LOGIC;
       sysreset : in STD_LOGIC;
       wdth_in : in STD_LOGIC_VECTOR(7 downto 0);
       wr_blk : in STD_LOGIC;
       x : in STD_LOGIC_VECTOR(3 downto 0);
       trg_sig : out STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

U1 : trig_test
  port map(
       clk_0 => clk_0,
       clk_1 => clk_1,
       clk_2 => clk_2,
       clk_3 => clk_3,
       dlay_in => dlay_in,
       e => e,
       en_output => en_output,
       en_pulses => en_pulses,
       sysreset => sysreset,
       trg_sig => trg_sig,
       wdth_in => wdth_in,
       wr_blk => wr_blk,
       x => x
  );


end test_trig_1blk;
