-------------------------------------------------------------------------------
--
-- Title       : ld_array_4_v2_1_phase
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\ld_array_1_phase_4ps.vhd
-- Generated   : Wed May 10 14:44:31 2017
-- From        : U:/PREP/PREP_Modernization/Firmware_Backups/Aldec_Backups/One_Phase_Designs/AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase/NIMPlus/NIMPlus/src/ld_array_1_phase_4ps.bde
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


entity ld_array_1_phase_4ps is
  port(
       clk0 : in STD_LOGIC;
       fs_sync_in : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       v_ps_hold_in : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(31 downto 0);
       s_out : out STD_LOGIC;
       v_ps_ld_ct_out : out STD_LOGIC
  );
end ld_array_1_phase_4ps;

architecture ld_array_1_phase_4ps of ld_array_1_phase_4ps is

---- Component declarations -----

component ff_la
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC;
       ds : in STD_LOGIC;
       ld : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
  );
end component;
component load_ctl_1_phase_4ps_fs_sync
  port (
       clk : in STD_LOGIC;
       fs_sync_in : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       v_ps_hold_in : in STD_LOGIC;
       load_out : out STD_LOGIC;
       ps_ld_ct : out STD_LOGIC
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
signal ld : STD_LOGIC;
signal w0 : STD_LOGIC;
signal w1 : STD_LOGIC;
signal w10 : STD_LOGIC;
signal w11 : STD_LOGIC;
signal w12 : STD_LOGIC;
signal w13 : STD_LOGIC;
signal w14 : STD_LOGIC;
signal w15 : STD_LOGIC;
signal w16 : STD_LOGIC;
signal w17 : STD_LOGIC;
signal w18 : STD_LOGIC;
signal w19 : STD_LOGIC;
signal w2 : STD_LOGIC;
signal w20 : STD_LOGIC;
signal w21 : STD_LOGIC;
signal w22 : STD_LOGIC;
signal w23 : STD_LOGIC;
signal w24 : STD_LOGIC;
signal w25 : STD_LOGIC;
signal w26 : STD_LOGIC;
signal w27 : STD_LOGIC;
signal w28 : STD_LOGIC;
signal w29 : STD_LOGIC;
signal w3 : STD_LOGIC;
signal w30 : STD_LOGIC;
signal w4 : STD_LOGIC;
signal w5 : STD_LOGIC;
signal w6 : STD_LOGIC;
signal w7 : STD_LOGIC;
signal w8 : STD_LOGIC;
signal w9 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : ff_la
  port map(
       clk => clk0,
       dl => dl(31),
       ds => GND,
       ld => ld,
       q => w30,
       rst_p => rst_p
  );

U10 : ff_la
  port map(
       clk => clk0,
       dl => dl(23),
       ds => w23,
       ld => ld,
       q => w22,
       rst_p => rst_p
  );

U11 : ff_la
  port map(
       clk => clk0,
       dl => dl(22),
       ds => w22,
       ld => ld,
       q => w21,
       rst_p => rst_p
  );

U12 : ff_la
  port map(
       clk => clk0,
       dl => dl(21),
       ds => w21,
       ld => ld,
       q => w20,
       rst_p => rst_p
  );

U13 : ff_la
  port map(
       clk => clk0,
       dl => dl(20),
       ds => w20,
       ld => ld,
       q => w19,
       rst_p => rst_p
  );

U15 : ff_la
  port map(
       clk => clk0,
       dl => dl(19),
       ds => w19,
       ld => ld,
       q => w18,
       rst_p => rst_p
  );

U16 : ff_la
  port map(
       clk => clk0,
       dl => dl(18),
       ds => w18,
       ld => ld,
       q => w17,
       rst_p => rst_p
  );

U17 : ff_la
  port map(
       clk => clk0,
       dl => dl(17),
       ds => w17,
       ld => ld,
       q => w16,
       rst_p => rst_p
  );

U18 : ff_la
  port map(
       clk => clk0,
       dl => dl(16),
       ds => w16,
       ld => ld,
       q => w15,
       rst_p => rst_p
  );

U19 : ff_la
  port map(
       clk => clk0,
       dl => dl(15),
       ds => w15,
       ld => ld,
       q => w14,
       rst_p => rst_p
  );

U2 : ff_la
  port map(
       clk => clk0,
       dl => dl(30),
       ds => w30,
       ld => ld,
       q => w29,
       rst_p => rst_p
  );

U20 : ff_la
  port map(
       clk => clk0,
       dl => dl(14),
       ds => w14,
       ld => ld,
       q => w13,
       rst_p => rst_p
  );

U21 : ff_la
  port map(
       clk => clk0,
       dl => dl(13),
       ds => w13,
       ld => ld,
       q => w12,
       rst_p => rst_p
  );

U22 : ff_la
  port map(
       clk => clk0,
       dl => dl(12),
       ds => w12,
       ld => ld,
       q => w11,
       rst_p => rst_p
  );

U24 : ff_la
  port map(
       clk => clk0,
       dl => dl(11),
       ds => w11,
       ld => ld,
       q => w10,
       rst_p => rst_p
  );

U25 : ff_la
  port map(
       clk => clk0,
       dl => dl(10),
       ds => w10,
       ld => ld,
       q => w9,
       rst_p => rst_p
  );

U26 : ff_la
  port map(
       clk => clk0,
       dl => dl(9),
       ds => w9,
       ld => ld,
       q => w8,
       rst_p => rst_p
  );

U27 : ff_la
  port map(
       clk => clk0,
       dl => dl(8),
       ds => w8,
       ld => ld,
       q => w7,
       rst_p => rst_p
  );

U28 : ff_la
  port map(
       clk => clk0,
       dl => dl(7),
       ds => w7,
       ld => ld,
       q => w6,
       rst_p => rst_p
  );

U29 : ff_la
  port map(
       clk => clk0,
       dl => dl(6),
       ds => w6,
       ld => ld,
       q => w5,
       rst_p => rst_p
  );

U3 : ff_la
  port map(
       clk => clk0,
       dl => dl(29),
       ds => w29,
       ld => ld,
       q => w28,
       rst_p => rst_p
  );

U30 : ff_la
  port map(
       clk => clk0,
       dl => dl(5),
       ds => w5,
       ld => ld,
       q => w4,
       rst_p => rst_p
  );

U31 : ff_la
  port map(
       clk => clk0,
       dl => dl(4),
       ds => w4,
       ld => ld,
       q => w3,
       rst_p => rst_p
  );

U33 : ff_la
  port map(
       clk => clk0,
       dl => dl(3),
       ds => w3,
       ld => ld,
       q => w2,
       rst_p => rst_p
  );

U34 : ff_la
  port map(
       clk => clk0,
       dl => dl(2),
       ds => w2,
       ld => ld,
       q => w1,
       rst_p => rst_p
  );

U35 : ff_la
  port map(
       clk => clk0,
       dl => dl(1),
       ds => w1,
       ld => ld,
       q => w0,
       rst_p => rst_p
  );

U36 : ff_la
  port map(
       clk => clk0,
       dl => dl(0),
       ds => w0,
       ld => ld,
       q => s_out,
       rst_p => rst_p
  );

U4 : ff_la
  port map(
       clk => clk0,
       dl => dl(28),
       ds => w28,
       ld => ld,
       q => w27,
       rst_p => rst_p
  );

U5 : ff_la
  port map(
       clk => clk0,
       dl => dl(27),
       ds => w27,
       ld => ld,
       q => w26,
       rst_p => rst_p
  );

U6 : ff_la
  port map(
       clk => clk0,
       dl => dl(26),
       ds => w26,
       ld => ld,
       q => w25,
       rst_p => rst_p
  );

U7 : ff_la
  port map(
       clk => clk0,
       dl => dl(25),
       ds => w25,
       ld => ld,
       q => w24,
       rst_p => rst_p
  );

U8 : ff_la
  port map(
       clk => clk0,
       dl => dl(24),
       ds => w24,
       ld => ld,
       q => w23,
       rst_p => rst_p
  );

U9 : load_ctl_1_phase_4ps_fs_sync
  port map(
       clk => clk0,
       fs_sync_in => fs_sync_in,
       load_out => ld,
       ps_ld_ct => v_ps_ld_ct_out,
       reset_p => rst_p,
       sig_in => sig_in,
       v_ps_hold_in => v_ps_hold_in
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;

end ld_array_1_phase_4ps;
