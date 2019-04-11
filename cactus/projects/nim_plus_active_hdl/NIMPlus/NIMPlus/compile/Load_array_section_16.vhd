-------------------------------------------------------------------------------
--
-- Title       : Load_array_section_16
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\Load_array_section_16.vhd
-- Generated   : Wed May  2 14:15:31 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\Load_array_section_16.bde
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


entity Load_array_section_16 is
  port(
       clk : in STD_LOGIC;
       ld : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       w_in : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(15 downto 0);
       s_out : out STD_LOGIC
  );
end Load_array_section_16;

architecture Load_array_section_16 of Load_array_section_16 is

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

---- Signal declarations used on the diagram ----

signal clk0 : STD_LOGIC;
signal w0 : STD_LOGIC;
signal w1 : STD_LOGIC;
signal w10 : STD_LOGIC;
signal w11 : STD_LOGIC;
signal w12 : STD_LOGIC;
signal w13 : STD_LOGIC;
signal w14 : STD_LOGIC;
signal w15 : STD_LOGIC;
signal w2 : STD_LOGIC;
signal w3 : STD_LOGIC;
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
       dl => dl(11),
       ds => w11,
       ld => ld,
       q => w10,
       rst_p => rst_p
  );

U10 : ff_la
  port map(
       clk => clk0,
       dl => dl(6),
       ds => w6,
       ld => ld,
       q => w5,
       rst_p => rst_p
  );

U11 : ff_la
  port map(
       clk => clk0,
       dl => dl(5),
       ds => w5,
       ld => ld,
       q => w4,
       rst_p => rst_p
  );

U12 : ff_la
  port map(
       clk => clk0,
       dl => dl(4),
       ds => w4,
       ld => ld,
       q => w3,
       rst_p => rst_p
  );

U13 : ff_la
  port map(
       clk => clk0,
       dl => dl(3),
       ds => w3,
       ld => ld,
       q => w2,
       rst_p => rst_p
  );

U14 : ff_la
  port map(
       clk => clk0,
       dl => dl(2),
       ds => w2,
       ld => ld,
       q => w1,
       rst_p => rst_p
  );

U15 : ff_la
  port map(
       clk => clk0,
       dl => dl(1),
       ds => w1,
       ld => ld,
       q => w0,
       rst_p => rst_p
  );

U16 : ff_la
  port map(
       clk => clk0,
       dl => dl(0),
       ds => w0,
       ld => ld,
       q => s_out,
       rst_p => rst_p
  );

U2 : ff_la
  port map(
       clk => clk0,
       dl => dl(10),
       ds => w10,
       ld => ld,
       q => w9,
       rst_p => rst_p
  );

U3 : ff_la
  port map(
       clk => clk0,
       dl => dl(9),
       ds => w9,
       ld => ld,
       q => w8,
       rst_p => rst_p
  );

U4 : ff_la
  port map(
       clk => clk0,
       dl => dl(8),
       ds => w8,
       ld => ld,
       q => w7,
       rst_p => rst_p
  );

U5 : ff_la
  port map(
       clk => clk0,
       dl => dl(15),
       ds => w15,
       ld => ld,
       q => w14,
       rst_p => rst_p
  );

U6 : ff_la
  port map(
       clk => clk0,
       dl => dl(14),
       ds => w14,
       ld => ld,
       q => w13,
       rst_p => rst_p
  );

U7 : ff_la
  port map(
       clk => clk0,
       dl => dl(13),
       ds => w13,
       ld => ld,
       q => w12,
       rst_p => rst_p
  );

U8 : ff_la
  port map(
       clk => clk0,
       dl => dl(12),
       ds => w12,
       ld => ld,
       q => w11,
       rst_p => rst_p
  );

U9 : ff_la
  port map(
       clk => clk0,
       dl => dl(7),
       ds => w7,
       ld => ld,
       q => w6,
       rst_p => rst_p
  );


---- Terminal assignment ----

    -- Inputs terminals
	clk0 <= clk;
	w15 <= w_in;


end Load_array_section_16;
