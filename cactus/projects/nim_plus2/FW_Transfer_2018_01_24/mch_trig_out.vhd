-------------------------------------------------------------------------------
--
-- Title       : mch_trig_out
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\mch_trig_out.vhd
-- Generated   : Wed May  2 14:15:41 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\mch_trig_out.bde
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


entity mch_trig_out is
  port(
       mxout : in STD_LOGIC_VECTOR(3 downto 0);
       sel : in STD_LOGIC_VECTOR(63 downto 0);
       trig_40 : out STD_LOGIC_VECTOR(5 downto 0);
       trig_53 : out STD_LOGIC_VECTOR(11 downto 0)
  );
end mch_trig_out;

architecture mch_trig_out of mch_trig_out is

---- Component declarations -----

component trig_out_mux
  port (
       mxout : in STD_LOGIC_VECTOR(3 downto 0);
       sel : in STD_LOGIC_VECTOR(1 downto 0);
       t_out : out STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

U1 : trig_out_mux
  port map(
       sel(0) => sel(0),
       sel(1) => sel(1),
       mxout => mxout,
       t_out => trig_53(0)
  );

U11 : trig_out_mux
  port map(
       sel(0) => sel(2),
       sel(1) => sel(3),
       mxout => mxout,
       t_out => trig_53(1)
  );

U12 : trig_out_mux
  port map(
       sel(0) => sel(4),
       sel(1) => sel(5),
       mxout => mxout,
       t_out => trig_53(2)
  );

U13 : trig_out_mux
  port map(
       sel(0) => sel(6),
       sel(1) => sel(7),
       mxout => mxout,
       t_out => trig_53(3)
  );

U14 : trig_out_mux
  port map(
       sel(0) => sel(8),
       sel(1) => sel(9),
       mxout => mxout,
       t_out => trig_53(4)
  );

U15 : trig_out_mux
  port map(
       sel(0) => sel(10),
       sel(1) => sel(11),
       mxout => mxout,
       t_out => trig_53(5)
  );

U16 : trig_out_mux
  port map(
       sel(0) => sel(12),
       sel(1) => sel(13),
       mxout => mxout,
       t_out => trig_53(6)
  );

U17 : trig_out_mux
  port map(
       sel(0) => sel(14),
       sel(1) => sel(15),
       mxout => mxout,
       t_out => trig_53(7)
  );

U18 : trig_out_mux
  port map(
       sel(0) => sel(16),
       sel(1) => sel(17),
       mxout => mxout,
       t_out => trig_53(8)
  );

U19 : trig_out_mux
  port map(
       sel(0) => sel(18),
       sel(1) => sel(19),
       mxout => mxout,
       t_out => trig_53(9)
  );

U20 : trig_out_mux
  port map(
       sel(0) => sel(20),
       sel(1) => sel(21),
       mxout => mxout,
       t_out => trig_53(10)
  );

U21 : trig_out_mux
  port map(
       sel(0) => sel(22),
       sel(1) => sel(23),
       mxout => mxout,
       t_out => trig_53(11)
  );

U22 : trig_out_mux
  port map(
       sel(0) => sel(24),
       sel(1) => sel(25),
       mxout => mxout,
       t_out => trig_40(0)
  );

U23 : trig_out_mux
  port map(
       sel(0) => sel(26),
       sel(1) => sel(27),
       mxout => mxout,
       t_out => trig_40(1)
  );

U24 : trig_out_mux
  port map(
       sel(0) => sel(28),
       sel(1) => sel(29),
       mxout => mxout,
       t_out => trig_40(2)
  );

U25 : trig_out_mux
  port map(
       sel(0) => sel(30),
       sel(1) => sel(31),
       mxout => mxout,
       t_out => trig_40(3)
  );

U26 : trig_out_mux
  port map(
       sel(0) => sel(32),
       sel(1) => sel(33),
       mxout => mxout,
       t_out => trig_40(4)
  );

U27 : trig_out_mux
  port map(
       sel(0) => sel(34),
       sel(1) => sel(35),
       mxout => mxout,
       t_out => trig_40(5)
  );


end mch_trig_out;
