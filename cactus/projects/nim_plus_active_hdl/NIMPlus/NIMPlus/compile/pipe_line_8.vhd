-------------------------------------------------------------------------------
--
-- Title       : pipe_line_8
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\compile\pipe_line_8.vhd
-- Generated   : Wed May  2 14:06:14 2018
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_05_02_NIMPlus_jw121_320MHz_1Phase_Accel_Sync_T_C_RJ45\NIMPlus\NIMPlus\src\pipe_line_8.bde
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


entity pipe_line_8 is
  port(
       clk_in : in STD_LOGIC;
       data_in : in STD_LOGIC;
       reset_n : in STD_LOGIC;
       p : out STD_LOGIC_VECTOR(7 downto 0)
  );
end pipe_line_8;

architecture pipe_line_8 of pipe_line_8 is

---- Component declarations -----

component flip_flop
  port (
       clock : in STD_LOGIC;
       d : in STD_LOGIC;
       reset_n : in STD_LOGIC;
       q : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal q : STD_LOGIC_VECTOR(7 downto 0);

begin

----  Component instantiations  ----

U1 : flip_flop
  port map(
       clock => clk_in,
       d => data_in,
       q => q(0),
       reset_n => reset_n
  );

p(1) <= q(1);

p(2) <= q(2);

p(3) <= q(3);

p(4) <= q(4);

p(5) <= q(5);

p(6) <= q(6);

p(7) <= q(7);

U2 : flip_flop
  port map(
       clock => clk_in,
       d => q(0),
       q => q(1),
       reset_n => reset_n
  );

U3 : flip_flop
  port map(
       clock => clk_in,
       d => q(1),
       q => q(2),
       reset_n => reset_n
  );

U4 : flip_flop
  port map(
       clock => clk_in,
       d => q(2),
       q => q(3),
       reset_n => reset_n
  );

U5 : flip_flop
  port map(
       clock => clk_in,
       d => q(3),
       q => q(4),
       reset_n => reset_n
  );

U6 : flip_flop
  port map(
       clock => clk_in,
       d => q(4),
       q => q(5),
       reset_n => reset_n
  );

U7 : flip_flop
  port map(
       clock => clk_in,
       d => q(5),
       q => q(6),
       reset_n => reset_n
  );

U8 : flip_flop
  port map(
       clock => clk_in,
       d => q(6),
       q => q(7),
       reset_n => reset_n
  );

p(0) <= q(0);


end pipe_line_8;
