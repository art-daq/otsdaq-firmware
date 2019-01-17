-------------------------------------------------------------------------------
--
-- Title       : dmux_ff
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_17_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\dmux_ff.vhd
-- Generated   : Wed May 23 10:25:38 2018
-- From        : C:\AGP_2018_05_17_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\dmux_ff.bde
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


entity dmux_ff is
  port(
       D0 : in STD_LOGIC;
       D1 : in STD_LOGIC;
       S0 : in STD_LOGIC;
       clk : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
  );
end dmux_ff;

architecture dmux_ff of dmux_ff is

---- Component declarations -----

component d_ff
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET7 : STD_LOGIC;

begin

----  Component instantiations  ----

NET7 <= (D0 and not S0) or (D1 and S0);

U2 : d_ff
  port map(
       clk => clk,
       dl => NET7,
       q => q,
       rst_p => rst_p
  );


end dmux_ff;
