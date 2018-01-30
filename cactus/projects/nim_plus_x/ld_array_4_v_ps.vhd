-------------------------------------------------------------------------------
--
-- Title       : ld_array_4_v_ps
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\ld_array_4_v_ps.vhd
-- Generated   : Wed May 10 14:38:56 2017
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\ld_array_4_v_ps.bde
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


entity ld_array_4_v_ps is
  port(
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       dis_ops : in STD_LOGIC;
       ps_en : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       rst_ps : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(7 downto 0);
       ld_cmd_in : in STD_LOGIC_VECTOR(3 downto 0);
       ps_cnt_in : in STD_LOGIC_VECTOR(31 downto 0);
       wr_cmd : in STD_LOGIC_VECTOR(3 downto 0);
       ct_lsb : out STD_LOGIC;
       evt_ct_mon : out STD_LOGIC;
       ps_block_out_n : out STD_LOGIC;
       s_out : out STD_LOGIC
  );
end ld_array_4_v_ps;

architecture ld_array_4_v_ps of ld_array_4_v_ps is

---- Component declarations -----

component d_ff
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
  );
end component;
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
component load_controller_v_ps
  port (
       clk : in STD_LOGIC;
       disable_ops : in STD_LOGIC;
       inhib_in : in STD_LOGIC_VECTOR(2 downto 0);
       load_cmd_in : in STD_LOGIC_VECTOR(3 downto 0);
       ps_en : in STD_LOGIC;
       release_in : in STD_LOGIC_VECTOR(2 downto 0);
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       wr_cmd : in STD_LOGIC;
       inhib_out : out STD_LOGIC;
       load_cmd_out : out STD_LOGIC_VECTOR(3 downto 0);
       load_cmd_out_ps : out STD_LOGIC_VECTOR(3 downto 0);
       release_out : out STD_LOGIC
  );
end component;
component presecaler_count
  port (
       clk : in STD_LOGIC;
       count_in : in STD_LOGIC_VECTOR(31 downto 0);
       reset_p : in STD_LOGIC;
       ct_lsb : out STD_LOGIC;
       prescale_block_n : out STD_LOGIC
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal evt_ct : STD_LOGIC;
signal GND : STD_LOGIC;
signal NET10028 : STD_LOGIC;
signal NET10037 : STD_LOGIC;
signal NET10046 : STD_LOGIC;
signal NET10055 : STD_LOGIC;
signal NET10296 : STD_LOGIC;
signal sig_sync_0 : STD_LOGIC;
signal sig_sync_1 : STD_LOGIC;
signal sig_sync_2 : STD_LOGIC;
signal sig_sync_3 : STD_LOGIC;
signal w : STD_LOGIC;
signal w1 : STD_LOGIC;
signal w2 : STD_LOGIC;
signal w3 : STD_LOGIC;
signal w4 : STD_LOGIC;
signal w5 : STD_LOGIC;
signal w6 : STD_LOGIC;
signal w7 : STD_LOGIC;
signal x : STD_LOGIC;
signal x1 : STD_LOGIC;
signal x2 : STD_LOGIC;
signal x3 : STD_LOGIC;
signal x4 : STD_LOGIC;
signal x5 : STD_LOGIC;
signal x6 : STD_LOGIC;
signal x7 : STD_LOGIC;
signal y : STD_LOGIC;
signal y1 : STD_LOGIC;
signal y2 : STD_LOGIC;
signal y3 : STD_LOGIC;
signal y4 : STD_LOGIC;
signal y5 : STD_LOGIC;
signal y6 : STD_LOGIC;
signal y7 : STD_LOGIC;
signal z : STD_LOGIC;
signal z1 : STD_LOGIC;
signal z2 : STD_LOGIC;
signal z3 : STD_LOGIC;
signal z4 : STD_LOGIC;
signal z5 : STD_LOGIC;
signal z6 : STD_LOGIC;
signal z7 : STD_LOGIC;
signal inhib : STD_LOGIC_VECTOR (3 downto 0);
signal inhib_in0 : STD_LOGIC_VECTOR (2 downto 0);
signal inhib_in1 : STD_LOGIC_VECTOR (2 downto 0);
signal inhib_in2 : STD_LOGIC_VECTOR (2 downto 0);
signal inhib_in3 : STD_LOGIC_VECTOR (2 downto 0);
signal la_0 : STD_LOGIC_VECTOR (3 downto 0);
signal la_1 : STD_LOGIC_VECTOR (3 downto 0);
signal la_2 : STD_LOGIC_VECTOR (3 downto 0);
signal la_3 : STD_LOGIC_VECTOR (3 downto 0);
signal la_ps_0 : STD_LOGIC_VECTOR (3 downto 0);
signal la_ps_1 : STD_LOGIC_VECTOR (3 downto 0);
signal la_ps_2 : STD_LOGIC_VECTOR (3 downto 0);
signal la_ps_3 : STD_LOGIC_VECTOR (3 downto 0);
signal ld : STD_LOGIC_VECTOR (3 downto 0);
signal release : STD_LOGIC_VECTOR (3 downto 0);
signal release_in0 : STD_LOGIC_VECTOR (2 downto 0);
signal release_in1 : STD_LOGIC_VECTOR (2 downto 0);
signal release_in2 : STD_LOGIC_VECTOR (2 downto 0);
signal release_in3 : STD_LOGIC_VECTOR (2 downto 0);

begin

----  Component instantiations  ----

U1 : ff_la
  port map(
       clk => clk0,
       dl => dl(7),
       ds => GND,
       ld => ld(0),
       q => w7,
       rst_p => rst_p
  );

U10 : ff_la
  port map(
       clk => clk1,
       dl => dl(7),
       ds => GND,
       ld => ld(1),
       q => x7,
       rst_p => rst_p
  );

U11 : ff_la
  port map(
       clk => clk1,
       dl => dl(6),
       ds => x7,
       ld => ld(1),
       q => x6,
       rst_p => rst_p
  );

U12 : ff_la
  port map(
       clk => clk1,
       dl => dl(5),
       ds => x6,
       ld => ld(1),
       q => x5,
       rst_p => rst_p
  );

U13 : ff_la
  port map(
       clk => clk1,
       dl => dl(4),
       ds => x5,
       ld => ld(1),
       q => x4,
       rst_p => rst_p
  );

inhib_in1(0) <= inhib(0);

U15 : ff_la
  port map(
       clk => clk1,
       dl => dl(3),
       ds => x4,
       ld => ld(1),
       q => x3,
       rst_p => rst_p
  );

U16 : ff_la
  port map(
       clk => clk1,
       dl => dl(2),
       ds => x3,
       ld => ld(1),
       q => x2,
       rst_p => rst_p
  );

U17 : ff_la
  port map(
       clk => clk1,
       dl => dl(1),
       ds => x2,
       ld => ld(1),
       q => x1,
       rst_p => rst_p
  );

U18 : ff_la
  port map(
       clk => clk1,
       dl => dl(0),
       ds => x1,
       ld => ld(1),
       q => x,
       rst_p => rst_p
  );

U19 : ff_la
  port map(
       clk => clk2,
       dl => dl(7),
       ds => GND,
       ld => ld(2),
       q => y7,
       rst_p => rst_p
  );

U2 : ff_la
  port map(
       clk => clk0,
       dl => dl(6),
       ds => w7,
       ld => ld(0),
       q => w6,
       rst_p => rst_p
  );

U20 : ff_la
  port map(
       clk => clk2,
       dl => dl(6),
       ds => y7,
       ld => ld(2),
       q => y6,
       rst_p => rst_p
  );

U21 : ff_la
  port map(
       clk => clk2,
       dl => dl(5),
       ds => y6,
       ld => ld(2),
       q => y5,
       rst_p => rst_p
  );

U22 : ff_la
  port map(
       clk => clk2,
       dl => dl(4),
       ds => y5,
       ld => ld(2),
       q => y4,
       rst_p => rst_p
  );

ld(2) <= la_3(2) or la_2(2) or la_1(2) or la_0(2);

U24 : ff_la
  port map(
       clk => clk2,
       dl => dl(3),
       ds => y4,
       ld => ld(2),
       q => y3,
       rst_p => rst_p
  );

U25 : ff_la
  port map(
       clk => clk2,
       dl => dl(2),
       ds => y3,
       ld => ld(2),
       q => y2,
       rst_p => rst_p
  );

U26 : ff_la
  port map(
       clk => clk2,
       dl => dl(1),
       ds => y2,
       ld => ld(2),
       q => y1,
       rst_p => rst_p
  );

U27 : ff_la
  port map(
       clk => clk2,
       dl => dl(0),
       ds => y1,
       ld => ld(2),
       q => y,
       rst_p => rst_p
  );

U28 : ff_la
  port map(
       clk => clk3,
       dl => dl(7),
       ds => GND,
       ld => ld(3),
       q => z7,
       rst_p => rst_p
  );

U29 : ff_la
  port map(
       clk => clk3,
       dl => dl(6),
       ds => z7,
       ld => ld(3),
       q => z6,
       rst_p => rst_p
  );

U3 : ff_la
  port map(
       clk => clk0,
       dl => dl(5),
       ds => w6,
       ld => ld(0),
       q => w5,
       rst_p => rst_p
  );

U30 : ff_la
  port map(
       clk => clk3,
       dl => dl(5),
       ds => z6,
       ld => ld(3),
       q => z5,
       rst_p => rst_p
  );

U31 : ff_la
  port map(
       clk => clk3,
       dl => dl(4),
       ds => z5,
       ld => ld(3),
       q => z4,
       rst_p => rst_p
  );

ld(3) <= la_3(3) or la_2(3) or la_1(3) or la_0(3);

U33 : ff_la
  port map(
       clk => clk3,
       dl => dl(3),
       ds => z4,
       ld => ld(3),
       q => z3,
       rst_p => rst_p
  );

U34 : ff_la
  port map(
       clk => clk3,
       dl => dl(2),
       ds => z3,
       ld => ld(3),
       q => z2,
       rst_p => rst_p
  );

U35 : ff_la
  port map(
       clk => clk3,
       dl => dl(1),
       ds => z2,
       ld => ld(3),
       q => z1,
       rst_p => rst_p
  );

U36 : ff_la
  port map(
       clk => clk3,
       dl => dl(0),
       ds => z1,
       ld => ld(3),
       q => z,
       rst_p => rst_p
  );

inhib_in1(1) <= inhib(2);

ld(1) <= la_3(1) or la_2(1) or la_1(1) or la_0(1);

inhib_in2(0) <= inhib(0);

U4 : ff_la
  port map(
       clk => clk0,
       dl => dl(4),
       ds => w5,
       ld => ld(0),
       q => w4,
       rst_p => rst_p
  );

inhib_in3(0) <= inhib(0);

inhib_in2(1) <= inhib(1);

inhib_in2(2) <= inhib(3);

U43 : load_controller_v_ps
  port map(
       clk => clk0,
       disable_ops => dis_ops,
       inhib_in => inhib_in0,
       inhib_out => inhib(0),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_0,
       load_cmd_out_ps => la_ps_0,
       ps_en => ps_en,
       release_in => release_in0,
       release_out => release(0),
       reset_p => rst_p,
       sig_in => sig_sync_0,
       wr_cmd => wr_cmd(0)
  );

inhib_in3(1) <= inhib(1);

inhib_in3(2) <= inhib(2);

U46 : load_controller_v_ps
  port map(
       clk => clk1,
       disable_ops => dis_ops,
       inhib_in => inhib_in1,
       inhib_out => inhib(1),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_1,
       load_cmd_out_ps => la_ps_1,
       ps_en => ps_en,
       release_in => release_in1,
       release_out => release(1),
       reset_p => rst_p,
       sig_in => sig_sync_1,
       wr_cmd => wr_cmd(1)
  );

s_out <= z or y or x or w;

U48 : load_controller_v_ps
  port map(
       clk => clk2,
       disable_ops => dis_ops,
       inhib_in => inhib_in2,
       inhib_out => inhib(2),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_2,
       load_cmd_out_ps => la_ps_2,
       ps_en => ps_en,
       release_in => release_in2,
       release_out => release(2),
       reset_p => rst_p,
       sig_in => sig_sync_2,
       wr_cmd => wr_cmd(2)
  );

release_in0(0) <= release(1);

U5 : ff_la
  port map(
       clk => clk0,
       dl => dl(3),
       ds => w4,
       ld => ld(0),
       q => w3,
       rst_p => rst_p
  );

release_in0(1) <= release(2);

release_in0(2) <= release(3);

inhib_in1(2) <= inhib(3);

inhib_in0(0) <= inhib(1);

inhib_in0(1) <= inhib(2);

inhib_in0(2) <= inhib(3);

U56 : load_controller_v_ps
  port map(
       clk => clk3,
       disable_ops => dis_ops,
       inhib_in => inhib_in3,
       inhib_out => inhib(3),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_3,
       load_cmd_out_ps => la_ps_3,
       ps_en => ps_en,
       release_in => release_in3,
       release_out => release(3),
       reset_p => rst_p,
       sig_in => sig_sync_3,
       wr_cmd => wr_cmd(3)
  );

release_in1(0) <= release(0);

release_in1(1) <= release(2);

release_in1(2) <= release(3);

U6 : ff_la
  port map(
       clk => clk0,
       dl => dl(2),
       ds => w3,
       ld => ld(0),
       q => w2,
       rst_p => rst_p
  );

release_in2(0) <= release(0);

release_in2(1) <= release(1);

release_in2(2) <= release(3);

release_in3(0) <= release(0);

release_in3(1) <= release(1);

release_in3(2) <= release(2);

U66 : d_ff
  port map(
       clk => clk0,
       dl => sig_in,
       q => sig_sync_0,
       rst_p => rst_p
  );

U67 : d_ff
  port map(
       clk => clk1,
       dl => sig_in,
       q => sig_sync_1,
       rst_p => rst_p
  );

U68 : d_ff
  port map(
       clk => clk2,
       dl => sig_in,
       q => sig_sync_2,
       rst_p => rst_p
  );

U69 : d_ff
  port map(
       clk => clk3,
       dl => sig_in,
       q => sig_sync_3,
       rst_p => rst_p
  );

U7 : ff_la
  port map(
       clk => clk0,
       dl => dl(1),
       ds => w2,
       ld => ld(0),
       q => w1,
       rst_p => rst_p
  );

NET10028 <= la_ps_0(3) or la_ps_0(2) or la_ps_0(1) or la_ps_0(0);

NET10046 <= la_ps_1(3) or la_ps_1(2) or la_ps_1(1) or la_ps_1(0);

NET10055 <= la_ps_2(3) or la_ps_2(2) or la_ps_2(1) or la_ps_2(0);

NET10037 <= la_ps_3(3) or la_ps_3(2) or la_ps_3(1) or la_ps_3(0);

evt_ct <= NET10037 or NET10055 or NET10046 or NET10028;

U75 : presecaler_count
  port map(
       clk => evt_ct,
       count_in => ps_cnt_in,
       ct_lsb => ct_lsb,
       prescale_block_n => ps_block_out_n,
       reset_p => NET10296
  );

NET10296 <= rst_p or rst_ps;

evt_ct_mon <= evt_ct;

U8 : ff_la
  port map(
       clk => clk0,
       dl => dl(0),
       ds => w1,
       ld => ld(0),
       q => w,
       rst_p => rst_p
  );

ld(0) <= la_3(0) or la_2(0) or la_1(0) or la_0(0);


---- Power , ground assignment ----

GND <= GND_CONSTANT;

end ld_array_4_v_ps;
