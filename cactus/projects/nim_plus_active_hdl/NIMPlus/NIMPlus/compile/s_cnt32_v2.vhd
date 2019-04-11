-------------------------------------------------------------------------------
--
-- Title       : s_cnt32_v2
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\s_cnt32_v2.vhd
-- Generated   : Wed May  2 14:15:40 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\s_cnt32_v2.bde
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


entity s_cnt32_v2 is
  port(
       clk0 : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sigin : in STD_LOGIC;
       out32 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end s_cnt32_v2;

architecture s_cnt32_v2 of s_cnt32_v2 is

---- Component declarations -----

component cnt32_v2
  port (
       clk : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       cnt_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component d_ff
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
signal NET62 : STD_LOGIC;
signal rstp : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : cnt32_v2
  port map(
       clk => clk0,
       cnt_out => out32,
       rst_p => rstp,
       sig_in => NET62
  );

U2 : d_ff
  port map(
       clk => clk0,
       dl => sigin,
       q => NET62,
       rst_p => GND
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;

---- Terminal assignment ----

    -- Inputs terminals
	rstp <= rst_p;


end s_cnt32_v2;
