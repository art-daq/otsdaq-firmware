-------------------------------------------------------------------------------
--
-- Title       : trig_test
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\trig_test.vhd
-- Generated   : Wed May 10 14:38:04 2017
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\trig_test.bde
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


entity trig_test is
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
end trig_test;

architecture trig_test of trig_test is

---- Component declarations -----

component sel_block
  port (
       blk_en : in STD_LOGIC;
       en_term : in STD_LOGIC_VECTOR(15 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       sig_out : out STD_LOGIC
  );
end component;
component trig_blk
  port (
       clk : in STD_LOGIC;
       dlay : in STD_LOGIC_VECTOR(7 downto 0);
       oe : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       s_in : in STD_LOGIC;
       wdth : in STD_LOGIC_VECTOR(7 downto 0);
       wr_blk : in STD_LOGIC;
       busy_n : out STD_LOGIC;
       s_out : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal pulse_e : STD_LOGIC;
signal sig_c : STD_LOGIC;
signal sysrst_n : STD_LOGIC;
signal bsy : STD_LOGIC_VECTOR (3 downto 0);
signal sig : STD_LOGIC_VECTOR (3 downto 0);
signal s_out : STD_LOGIC_VECTOR (3 downto 0);

begin

----  Component instantiations  ----

U1 : sel_block
  port map(
       blk_en => pulse_e,
       en_term => e,
       sig_out => sig_c,
       x => x
  );

sig(1) <= bsy(3) and bsy(2) and bsy(0) and s_out(1);

U12 : trig_blk
  port map(
       busy_n => bsy(1),
       clk => clk_1,
       dlay => dlay_in,
       oe => en_output,
       reset_p => sysreset,
       s_in => sig_c,
       s_out => s_out(1),
       wdth => wdth_in,
       wr_blk => wr_blk
  );

U13 : trig_blk
  port map(
       busy_n => bsy(2),
       clk => clk_2,
       dlay => dlay_in,
       oe => en_output,
       reset_p => sysreset,
       s_in => sig_c,
       s_out => s_out(2),
       wdth => wdth_in,
       wr_blk => wr_blk
  );

U14 : trig_blk
  port map(
       busy_n => bsy(3),
       clk => clk_3,
       dlay => dlay_in,
       oe => en_output,
       reset_p => sysreset,
       s_in => sig_c,
       s_out => s_out(3),
       wdth => wdth_in,
       wr_blk => wr_blk
  );

sig(0) <= bsy(3) and bsy(2) and bsy(1) and s_out(0);

sig(2) <= bsy(3) and bsy(1) and bsy(0) and s_out(2);

sig(3) <= bsy(2) and bsy(1) and bsy(0) and s_out(3);

trg_sig <= sig(3) or sig(2) or sig(1) or sig(0);

U2 : trig_blk
  port map(
       busy_n => bsy(0),
       clk => clk_0,
       dlay => dlay_in,
       oe => en_output,
       reset_p => sysreset,
       s_in => sig_c,
       s_out => s_out(0),
       wdth => wdth_in,
       wr_blk => wr_blk
  );

pulse_e <= en_pulses and sysrst_n;

sysrst_n <= not(sysreset);


end trig_test;
