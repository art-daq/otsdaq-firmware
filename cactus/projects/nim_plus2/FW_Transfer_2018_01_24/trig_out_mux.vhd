-------------------------------------------------------------------------------
--
-- Title       : trig_out_mux
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\trig_out_mux.vhd
-- Generated   : Wed May  2 14:15:41 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\trig_out_mux.bde
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


entity trig_out_mux is
  port(
       mxout : in STD_LOGIC_VECTOR(3 downto 0);
       sel : in STD_LOGIC_VECTOR(1 downto 0);
       t_out : out STD_LOGIC
  );
end trig_out_mux;

architecture trig_out_mux of trig_out_mux is

---- Signal declarations used on the diagram ----

signal NET70 : STD_LOGIC;
signal NET78 : STD_LOGIC;

begin

----  Component instantiations  ----

NET70 <= (mxout(0) and not sel(0)) or (mxout(1) and sel(0));

NET78 <= (mxout(2) and not sel(1)) or (mxout(3) and sel(1));

t_out <= (NET70 and not sel(1)) or (NET78 and sel(1));


end trig_out_mux;
