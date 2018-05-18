-------------------------------------------------------------------------------
--
-- Title       : ld_array_4_v3
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\ld_array_4_v3.vhd
-- Generated   : Tue Aug  9 15:05:20 2016
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\ld_array_4_v3.bde
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
use work.nim_plus_package_1.all;


entity ld_array_4_v3 is
  port(
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       dis_ops : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(7 downto 0);
       ld_cmd_in : in STD_LOGIC_VECTOR(3 downto 0);
       wr_cmd : in STD_LOGIC_VECTOR(3 downto 0);
       s_out : out STD_LOGIC;
       cnt_out : out STD_LOGIC_VECTOR(255 downto 0)
  );
end ld_array_4_v3;

architecture ld_array_4_v3 of ld_array_4_v3 is

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
component load_controller_3
  port (
       clk : in STD_LOGIC;
       disable_ops : in STD_LOGIC;
       inhib_in : in STD_LOGIC_VECTOR(2 downto 0);
       load_cmd_in : in STD_LOGIC_VECTOR(3 downto 0);
       release_in : in STD_LOGIC_VECTOR(2 downto 0);
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       wr_cmd : in STD_LOGIC;
       cnt_out : out STD_LOGIC_VECTOR(63 downto 0);
       inhib_out : out STD_LOGIC;
       load_cmd_out : out STD_LOGIC_VECTOR(3 downto 0);
       release_out : out STD_LOGIC
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
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
signal ld : STD_LOGIC_VECTOR (3 downto 0);
signal release : STD_LOGIC_VECTOR (3 downto 0);
signal release_in0 : STD_LOGIC_VECTOR (2 downto 0);
signal release_in1 : STD_LOGIC_VECTOR (2 downto 0);
signal release_in2 : STD_LOGIC_VECTOR (2 downto 0);
signal release_in3 : STD_LOGIC_VECTOR (2 downto 0);

attribute mark_debug : string;
attribute mark_debug of inhib : signal is "true";
attribute mark_debug of release : signal is "true";

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

U43 : load_controller_3
  port map(
       cnt_out(0) => cnt_out(0),
       cnt_out(1) => cnt_out(1),
       cnt_out(2) => cnt_out(2),
       cnt_out(3) => cnt_out(3),
       cnt_out(4) => cnt_out(4),
       cnt_out(5) => cnt_out(5),
       cnt_out(6) => cnt_out(6),
       cnt_out(7) => cnt_out(7),
       cnt_out(8) => cnt_out(8),
       cnt_out(9) => cnt_out(9),
       cnt_out(10) => cnt_out(10),
       cnt_out(11) => cnt_out(11),
       cnt_out(12) => cnt_out(12),
       cnt_out(13) => cnt_out(13),
       cnt_out(14) => cnt_out(14),
       cnt_out(15) => cnt_out(15),
       cnt_out(16) => cnt_out(16),
       cnt_out(17) => cnt_out(17),
       cnt_out(18) => cnt_out(18),
       cnt_out(19) => cnt_out(19),
       cnt_out(20) => cnt_out(20),
       cnt_out(21) => cnt_out(21),
       cnt_out(22) => cnt_out(22),
       cnt_out(23) => cnt_out(23),
       cnt_out(24) => cnt_out(24),
       cnt_out(25) => cnt_out(25),
       cnt_out(26) => cnt_out(26),
       cnt_out(27) => cnt_out(27),
       cnt_out(28) => cnt_out(28),
       cnt_out(29) => cnt_out(29),
       cnt_out(30) => cnt_out(30),
       cnt_out(31) => cnt_out(31),
       cnt_out(32) => cnt_out(32),
       cnt_out(33) => cnt_out(33),
       cnt_out(34) => cnt_out(34),
       cnt_out(35) => cnt_out(35),
       cnt_out(36) => cnt_out(36),
       cnt_out(37) => cnt_out(37),
       cnt_out(38) => cnt_out(38),
       cnt_out(39) => cnt_out(39),
       cnt_out(40) => cnt_out(40),
       cnt_out(41) => cnt_out(41),
       cnt_out(42) => cnt_out(42),
       cnt_out(43) => cnt_out(43),
       cnt_out(44) => cnt_out(44),
       cnt_out(45) => cnt_out(45),
       cnt_out(46) => cnt_out(46),
       cnt_out(47) => cnt_out(47),
       cnt_out(48) => cnt_out(48),
       cnt_out(49) => cnt_out(49),
       cnt_out(50) => cnt_out(50),
       cnt_out(51) => cnt_out(51),
       cnt_out(52) => cnt_out(52),
       cnt_out(53) => cnt_out(53),
       cnt_out(54) => cnt_out(54),
       cnt_out(55) => cnt_out(55),
       cnt_out(56) => cnt_out(56),
       cnt_out(57) => cnt_out(57),
       cnt_out(58) => cnt_out(58),
       cnt_out(59) => cnt_out(59),
       cnt_out(60) => cnt_out(60),
       cnt_out(61) => cnt_out(61),
       cnt_out(62) => cnt_out(62),
       cnt_out(63) => cnt_out(63),
       clk => clk0,
       disable_ops => dis_ops,
       inhib_in => inhib_in0,
       inhib_out => inhib(0),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_0,
       release_in => release_in0,
       release_out => release(0),
       reset_p => rst_p,
       sig_in => sig_in,
       wr_cmd => wr_cmd(0)
  );

inhib_in3(1) <= inhib(1);

inhib_in3(2) <= inhib(2);

U46 : load_controller_3
  port map(
       cnt_out(0) => cnt_out(64),
       cnt_out(1) => cnt_out(65),
       cnt_out(2) => cnt_out(66),
       cnt_out(3) => cnt_out(67),
       cnt_out(4) => cnt_out(68),
       cnt_out(5) => cnt_out(69),
       cnt_out(6) => cnt_out(70),
       cnt_out(7) => cnt_out(71),
       cnt_out(8) => cnt_out(72),
       cnt_out(9) => cnt_out(73),
       cnt_out(10) => cnt_out(74),
       cnt_out(11) => cnt_out(75),
       cnt_out(12) => cnt_out(76),
       cnt_out(13) => cnt_out(77),
       cnt_out(14) => cnt_out(78),
       cnt_out(15) => cnt_out(79),
       cnt_out(16) => cnt_out(80),
       cnt_out(17) => cnt_out(81),
       cnt_out(18) => cnt_out(82),
       cnt_out(19) => cnt_out(83),
       cnt_out(20) => cnt_out(84),
       cnt_out(21) => cnt_out(85),
       cnt_out(22) => cnt_out(86),
       cnt_out(23) => cnt_out(87),
       cnt_out(24) => cnt_out(88),
       cnt_out(25) => cnt_out(89),
       cnt_out(26) => cnt_out(90),
       cnt_out(27) => cnt_out(91),
       cnt_out(28) => cnt_out(92),
       cnt_out(29) => cnt_out(93),
       cnt_out(30) => cnt_out(94),
       cnt_out(31) => cnt_out(95),
       cnt_out(32) => cnt_out(96),
       cnt_out(33) => cnt_out(97),
       cnt_out(34) => cnt_out(98),
       cnt_out(35) => cnt_out(99),
       cnt_out(36) => cnt_out(100),
       cnt_out(37) => cnt_out(101),
       cnt_out(38) => cnt_out(102),
       cnt_out(39) => cnt_out(103),
       cnt_out(40) => cnt_out(104),
       cnt_out(41) => cnt_out(105),
       cnt_out(42) => cnt_out(106),
       cnt_out(43) => cnt_out(107),
       cnt_out(44) => cnt_out(108),
       cnt_out(45) => cnt_out(109),
       cnt_out(46) => cnt_out(110),
       cnt_out(47) => cnt_out(111),
       cnt_out(48) => cnt_out(112),
       cnt_out(49) => cnt_out(113),
       cnt_out(50) => cnt_out(114),
       cnt_out(51) => cnt_out(115),
       cnt_out(52) => cnt_out(116),
       cnt_out(53) => cnt_out(117),
       cnt_out(54) => cnt_out(118),
       cnt_out(55) => cnt_out(119),
       cnt_out(56) => cnt_out(120),
       cnt_out(57) => cnt_out(121),
       cnt_out(58) => cnt_out(122),
       cnt_out(59) => cnt_out(123),
       cnt_out(60) => cnt_out(124),
       cnt_out(61) => cnt_out(125),
       cnt_out(62) => cnt_out(126),
       cnt_out(63) => cnt_out(127),
       clk => clk1,
       disable_ops => dis_ops,
       inhib_in => inhib_in1,
       inhib_out => inhib(1),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_1,
       release_in => release_in1,
       release_out => release(1),
       reset_p => rst_p,
       sig_in => sig_in,
       wr_cmd => wr_cmd(1)
  );

s_out <= z or y or x or w;

U48 : load_controller_3
  port map(
       cnt_out(0) => cnt_out(128),
       cnt_out(1) => cnt_out(129),
       cnt_out(2) => cnt_out(130),
       cnt_out(3) => cnt_out(131),
       cnt_out(4) => cnt_out(132),
       cnt_out(5) => cnt_out(133),
       cnt_out(6) => cnt_out(134),
       cnt_out(7) => cnt_out(135),
       cnt_out(8) => cnt_out(136),
       cnt_out(9) => cnt_out(137),
       cnt_out(10) => cnt_out(138),
       cnt_out(11) => cnt_out(139),
       cnt_out(12) => cnt_out(140),
       cnt_out(13) => cnt_out(141),
       cnt_out(14) => cnt_out(142),
       cnt_out(15) => cnt_out(143),
       cnt_out(16) => cnt_out(144),
       cnt_out(17) => cnt_out(145),
       cnt_out(18) => cnt_out(146),
       cnt_out(19) => cnt_out(147),
       cnt_out(20) => cnt_out(148),
       cnt_out(21) => cnt_out(149),
       cnt_out(22) => cnt_out(150),
       cnt_out(23) => cnt_out(151),
       cnt_out(24) => cnt_out(152),
       cnt_out(25) => cnt_out(153),
       cnt_out(26) => cnt_out(154),
       cnt_out(27) => cnt_out(155),
       cnt_out(28) => cnt_out(156),
       cnt_out(29) => cnt_out(157),
       cnt_out(30) => cnt_out(158),
       cnt_out(31) => cnt_out(159),
       cnt_out(32) => cnt_out(160),
       cnt_out(33) => cnt_out(161),
       cnt_out(34) => cnt_out(162),
       cnt_out(35) => cnt_out(163),
       cnt_out(36) => cnt_out(164),
       cnt_out(37) => cnt_out(165),
       cnt_out(38) => cnt_out(166),
       cnt_out(39) => cnt_out(167),
       cnt_out(40) => cnt_out(168),
       cnt_out(41) => cnt_out(169),
       cnt_out(42) => cnt_out(170),
       cnt_out(43) => cnt_out(171),
       cnt_out(44) => cnt_out(172),
       cnt_out(45) => cnt_out(173),
       cnt_out(46) => cnt_out(174),
       cnt_out(47) => cnt_out(175),
       cnt_out(48) => cnt_out(176),
       cnt_out(49) => cnt_out(177),
       cnt_out(50) => cnt_out(178),
       cnt_out(51) => cnt_out(179),
       cnt_out(52) => cnt_out(180),
       cnt_out(53) => cnt_out(181),
       cnt_out(54) => cnt_out(182),
       cnt_out(55) => cnt_out(183),
       cnt_out(56) => cnt_out(184),
       cnt_out(57) => cnt_out(185),
       cnt_out(58) => cnt_out(186),
       cnt_out(59) => cnt_out(187),
       cnt_out(60) => cnt_out(188),
       cnt_out(61) => cnt_out(189),
       cnt_out(62) => cnt_out(190),
       cnt_out(63) => cnt_out(191),
       clk => clk2,
       disable_ops => dis_ops,
       inhib_in => inhib_in2,
       inhib_out => inhib(2),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_2,
       release_in => release_in2,
       release_out => release(2),
       reset_p => rst_p,
       sig_in => sig_in,
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

U56 : load_controller_3
  port map(
       cnt_out(0) => cnt_out(192),
       cnt_out(1) => cnt_out(193),
       cnt_out(2) => cnt_out(194),
       cnt_out(3) => cnt_out(195),
       cnt_out(4) => cnt_out(196),
       cnt_out(5) => cnt_out(197),
       cnt_out(6) => cnt_out(198),
       cnt_out(7) => cnt_out(199),
       cnt_out(8) => cnt_out(200),
       cnt_out(9) => cnt_out(201),
       cnt_out(10) => cnt_out(202),
       cnt_out(11) => cnt_out(203),
       cnt_out(12) => cnt_out(204),
       cnt_out(13) => cnt_out(205),
       cnt_out(14) => cnt_out(206),
       cnt_out(15) => cnt_out(207),
       cnt_out(16) => cnt_out(208),
       cnt_out(17) => cnt_out(209),
       cnt_out(18) => cnt_out(210),
       cnt_out(19) => cnt_out(211),
       cnt_out(20) => cnt_out(212),
       cnt_out(21) => cnt_out(213),
       cnt_out(22) => cnt_out(214),
       cnt_out(23) => cnt_out(215),
       cnt_out(24) => cnt_out(216),
       cnt_out(25) => cnt_out(217),
       cnt_out(26) => cnt_out(218),
       cnt_out(27) => cnt_out(219),
       cnt_out(28) => cnt_out(220),
       cnt_out(29) => cnt_out(221),
       cnt_out(30) => cnt_out(222),
       cnt_out(31) => cnt_out(223),
       cnt_out(32) => cnt_out(224),
       cnt_out(33) => cnt_out(225),
       cnt_out(34) => cnt_out(226),
       cnt_out(35) => cnt_out(227),
       cnt_out(36) => cnt_out(228),
       cnt_out(37) => cnt_out(229),
       cnt_out(38) => cnt_out(230),
       cnt_out(39) => cnt_out(231),
       cnt_out(40) => cnt_out(232),
       cnt_out(41) => cnt_out(233),
       cnt_out(42) => cnt_out(234),
       cnt_out(43) => cnt_out(235),
       cnt_out(44) => cnt_out(236),
       cnt_out(45) => cnt_out(237),
       cnt_out(46) => cnt_out(238),
       cnt_out(47) => cnt_out(239),
       cnt_out(48) => cnt_out(240),
       cnt_out(49) => cnt_out(241),
       cnt_out(50) => cnt_out(242),
       cnt_out(51) => cnt_out(243),
       cnt_out(52) => cnt_out(244),
       cnt_out(53) => cnt_out(245),
       cnt_out(54) => cnt_out(246),
       cnt_out(55) => cnt_out(247),
       cnt_out(56) => cnt_out(248),
       cnt_out(57) => cnt_out(249),
       cnt_out(58) => cnt_out(250),
       cnt_out(59) => cnt_out(251),
       cnt_out(60) => cnt_out(252),
       cnt_out(61) => cnt_out(253),
       cnt_out(62) => cnt_out(254),
       cnt_out(63) => cnt_out(255),
       clk => clk3,
       disable_ops => dis_ops,
       inhib_in => inhib_in3,
       inhib_out => inhib(3),
       load_cmd_in => ld_cmd_in,
       load_cmd_out => la_3,
       release_in => release_in3,
       release_out => release(3),
       reset_p => rst_p,
       sig_in => sig_in,
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

U7 : ff_la
  port map(
       clk => clk0,
       dl => dl(1),
       ds => w2,
       ld => ld(0),
       q => w1,
       rst_p => rst_p
  );

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

end ld_array_4_v3;
