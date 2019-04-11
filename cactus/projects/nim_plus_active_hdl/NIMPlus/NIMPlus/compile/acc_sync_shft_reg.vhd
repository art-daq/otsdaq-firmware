-------------------------------------------------------------------------------
--
-- Title       : acc_sync_shft_reg
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_17_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\acc_sync_shft_reg.vhd
-- Generated   : Wed May 23 11:27:21 2018
-- From        : C:\AGP_2018_05_17_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\acc_sync_shft_reg.bde
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


entity acc_sync_shft_reg is
  port(
       clk0 : in STD_LOGIC;
       ld_w_1 : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       ld : in STD_LOGIC_VECTOR(7 downto 0);
       ld_f : in STD_LOGIC_VECTOR(23 downto 0);
       clk_39_out : out STD_LOGIC;
       f_out : out STD_LOGIC
  );
end acc_sync_shft_reg;

architecture acc_sync_shft_reg of acc_sync_shft_reg is

---- Component declarations -----

component dmux_ff
  port (
       D0 : in STD_LOGIC;
       D1 : in STD_LOGIC;
       S0 : in STD_LOGIC;
       clk : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal f12 : STD_LOGIC;
signal f16 : STD_LOGIC;
signal f20 : STD_LOGIC;
signal f4 : STD_LOGIC;
signal f8 : STD_LOGIC;
signal GND : STD_LOGIC;
signal NET1371 : STD_LOGIC;
signal NET1397 : STD_LOGIC;
signal NET1420 : STD_LOGIC;
signal NET1470 : STD_LOGIC;
signal NET149 : STD_LOGIC;
signal NET1491 : STD_LOGIC;
signal NET1512 : STD_LOGIC;
signal NET1733 : STD_LOGIC;
signal NET1759 : STD_LOGIC;
signal NET1782 : STD_LOGIC;
signal NET1832 : STD_LOGIC;
signal NET1853 : STD_LOGIC;
signal NET1874 : STD_LOGIC;
signal NET2095 : STD_LOGIC;
signal NET2121 : STD_LOGIC;
signal NET2144 : STD_LOGIC;
signal NET2194 : STD_LOGIC;
signal NET2215 : STD_LOGIC;
signal NET2236 : STD_LOGIC;
signal NET274 : STD_LOGIC;
signal NET314 : STD_LOGIC;
signal NET354 : STD_LOGIC;
signal NET37 : STD_LOGIC;
signal NET515 : STD_LOGIC;
signal NET541 : STD_LOGIC;
signal NET564 : STD_LOGIC;
signal NET617 : STD_LOGIC;
signal NET638 : STD_LOGIC;
signal NET659 : STD_LOGIC;
signal NET76 : STD_LOGIC;
signal NET831 : STD_LOGIC;
signal NET857 : STD_LOGIC;
signal NET880 : STD_LOGIC;
signal NET933 : STD_LOGIC;
signal NET954 : STD_LOGIC;
signal NET975 : STD_LOGIC;
signal q11 : STD_LOGIC;
signal q15 : STD_LOGIC;
signal q19 : STD_LOGIC;
signal q3 : STD_LOGIC;
signal q7 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : dmux_ff
  port map(
       D0 => GND,
       D1 => ld(7),
       S0 => ld_w_1,
       clk => clk0,
       q => NET37,
       rst_p => rst_p
  );

U10 : dmux_ff
  port map(
       D0 => NET274,
       D1 => ld(2),
       S0 => ld_w_1,
       clk => clk0,
       q => NET314,
       rst_p => rst_p
  );

U11 : dmux_ff
  port map(
       D0 => NET314,
       D1 => ld(1),
       S0 => ld_w_1,
       clk => clk0,
       q => NET354,
       rst_p => rst_p
  );

U12 : dmux_ff
  port map(
       D0 => NET354,
       D1 => ld(0),
       S0 => ld_w_1,
       clk => clk0,
       q => q7,
       rst_p => rst_p
  );

U14 : dmux_ff
  port map(
       D0 => q7,
       D1 => ld(7),
       S0 => ld_w_1,
       clk => clk0,
       q => NET515,
       rst_p => rst_p
  );

U15 : dmux_ff
  port map(
       D0 => NET515,
       D1 => ld(6),
       S0 => ld_w_1,
       clk => clk0,
       q => NET541,
       rst_p => rst_p
  );

U16 : dmux_ff
  port map(
       D0 => NET541,
       D1 => ld(5),
       S0 => ld_w_1,
       clk => clk0,
       q => NET564,
       rst_p => rst_p
  );

U17 : dmux_ff
  port map(
       D0 => NET564,
       D1 => ld(4),
       S0 => ld_w_1,
       clk => clk0,
       q => q11,
       rst_p => rst_p
  );

U18 : dmux_ff
  port map(
       D0 => q11,
       D1 => ld(3),
       S0 => ld_w_1,
       clk => clk0,
       q => NET617,
       rst_p => rst_p
  );

U19 : dmux_ff
  port map(
       D0 => NET617,
       D1 => ld(2),
       S0 => ld_w_1,
       clk => clk0,
       q => NET638,
       rst_p => rst_p
  );

U20 : dmux_ff
  port map(
       D0 => NET638,
       D1 => ld(1),
       S0 => ld_w_1,
       clk => clk0,
       q => NET659,
       rst_p => rst_p
  );

U21 : dmux_ff
  port map(
       D0 => NET659,
       D1 => ld(0),
       S0 => ld_w_1,
       clk => clk0,
       q => q15,
       rst_p => rst_p
  );

U22 : dmux_ff
  port map(
       D0 => q15,
       D1 => ld(7),
       S0 => ld_w_1,
       clk => clk0,
       q => NET831,
       rst_p => rst_p
  );

U23 : dmux_ff
  port map(
       D0 => NET831,
       D1 => ld(6),
       S0 => ld_w_1,
       clk => clk0,
       q => NET857,
       rst_p => rst_p
  );

U24 : dmux_ff
  port map(
       D0 => NET857,
       D1 => ld(5),
       S0 => ld_w_1,
       clk => clk0,
       q => NET880,
       rst_p => rst_p
  );

U25 : dmux_ff
  port map(
       D0 => NET880,
       D1 => ld(4),
       S0 => ld_w_1,
       clk => clk0,
       q => q19,
       rst_p => rst_p
  );

U26 : dmux_ff
  port map(
       D0 => q19,
       D1 => ld(3),
       S0 => ld_w_1,
       clk => clk0,
       q => NET933,
       rst_p => rst_p
  );

U27 : dmux_ff
  port map(
       D0 => NET933,
       D1 => ld(2),
       S0 => ld_w_1,
       clk => clk0,
       q => NET954,
       rst_p => rst_p
  );

U28 : dmux_ff
  port map(
       D0 => NET954,
       D1 => ld(1),
       S0 => ld_w_1,
       clk => clk0,
       q => NET975,
       rst_p => rst_p
  );

U29 : dmux_ff
  port map(
       D0 => NET975,
       D1 => ld(0),
       S0 => ld_w_1,
       clk => clk0,
       q => clk_39_out,
       rst_p => rst_p
  );

U30 : dmux_ff
  port map(
       D0 => GND,
       D1 => ld_f(23),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1371,
       rst_p => rst_p
  );

U31 : dmux_ff
  port map(
       D0 => NET1371,
       D1 => ld_f(22),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1397,
       rst_p => rst_p
  );

U32 : dmux_ff
  port map(
       D0 => NET1397,
       D1 => ld_f(21),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1420,
       rst_p => rst_p
  );

U33 : dmux_ff
  port map(
       D0 => NET1420,
       D1 => ld_f(20),
       S0 => ld_w_1,
       clk => clk0,
       q => f20,
       rst_p => rst_p
  );

U34 : dmux_ff
  port map(
       D0 => f20,
       D1 => ld_f(19),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1470,
       rst_p => rst_p
  );

U35 : dmux_ff
  port map(
       D0 => NET1470,
       D1 => ld_f(18),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1491,
       rst_p => rst_p
  );

U36 : dmux_ff
  port map(
       D0 => NET1491,
       D1 => ld_f(17),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1512,
       rst_p => rst_p
  );

U37 : dmux_ff
  port map(
       D0 => NET1512,
       D1 => ld_f(16),
       S0 => ld_w_1,
       clk => clk0,
       q => f16,
       rst_p => rst_p
  );

U38 : dmux_ff
  port map(
       D0 => f16,
       D1 => ld_f(15),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1733,
       rst_p => rst_p
  );

U39 : dmux_ff
  port map(
       D0 => NET1733,
       D1 => ld_f(14),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1759,
       rst_p => rst_p
  );

U40 : dmux_ff
  port map(
       D0 => NET1759,
       D1 => ld_f(13),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1782,
       rst_p => rst_p
  );

U41 : dmux_ff
  port map(
       D0 => NET1782,
       D1 => ld_f(12),
       S0 => ld_w_1,
       clk => clk0,
       q => f12,
       rst_p => rst_p
  );

U42 : dmux_ff
  port map(
       D0 => f12,
       D1 => ld_f(11),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1832,
       rst_p => rst_p
  );

U43 : dmux_ff
  port map(
       D0 => NET1832,
       D1 => ld_f(10),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1853,
       rst_p => rst_p
  );

U44 : dmux_ff
  port map(
       D0 => NET1853,
       D1 => ld_f(9),
       S0 => ld_w_1,
       clk => clk0,
       q => NET1874,
       rst_p => rst_p
  );

U45 : dmux_ff
  port map(
       D0 => NET1874,
       D1 => ld_f(8),
       S0 => ld_w_1,
       clk => clk0,
       q => f8,
       rst_p => rst_p
  );

U46 : dmux_ff
  port map(
       D0 => f8,
       D1 => ld_f(7),
       S0 => ld_w_1,
       clk => clk0,
       q => NET2095,
       rst_p => rst_p
  );

U47 : dmux_ff
  port map(
       D0 => NET2095,
       D1 => ld_f(6),
       S0 => ld_w_1,
       clk => clk0,
       q => NET2121,
       rst_p => rst_p
  );

U48 : dmux_ff
  port map(
       D0 => NET2121,
       D1 => ld_f(5),
       S0 => ld_w_1,
       clk => clk0,
       q => NET2144,
       rst_p => rst_p
  );

U49 : dmux_ff
  port map(
       D0 => NET2144,
       D1 => ld_f(4),
       S0 => ld_w_1,
       clk => clk0,
       q => f4,
       rst_p => rst_p
  );

U50 : dmux_ff
  port map(
       D0 => f4,
       D1 => ld_f(3),
       S0 => ld_w_1,
       clk => clk0,
       q => NET2194,
       rst_p => rst_p
  );

U51 : dmux_ff
  port map(
       D0 => NET2194,
       D1 => ld_f(2),
       S0 => ld_w_1,
       clk => clk0,
       q => NET2215,
       rst_p => rst_p
  );

U52 : dmux_ff
  port map(
       D0 => NET2215,
       D1 => ld_f(1),
       S0 => ld_w_1,
       clk => clk0,
       q => NET2236,
       rst_p => rst_p
  );

U53 : dmux_ff
  port map(
       D0 => NET2236,
       D1 => ld_f(0),
       S0 => ld_w_1,
       clk => clk0,
       q => f_out,
       rst_p => rst_p
  );

U6 : dmux_ff
  port map(
       D0 => NET37,
       D1 => ld(6),
       S0 => ld_w_1,
       clk => clk0,
       q => NET76,
       rst_p => rst_p
  );

U7 : dmux_ff
  port map(
       D0 => NET76,
       D1 => ld(5),
       S0 => ld_w_1,
       clk => clk0,
       q => NET149,
       rst_p => rst_p
  );

U8 : dmux_ff
  port map(
       D0 => NET149,
       D1 => ld(4),
       S0 => ld_w_1,
       clk => clk0,
       q => q3,
       rst_p => rst_p
  );

U9 : dmux_ff
  port map(
       D0 => q3,
       D1 => ld(3),
       S0 => ld_w_1,
       clk => clk0,
       q => NET274,
       rst_p => rst_p
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;

end acc_sync_shft_reg;
