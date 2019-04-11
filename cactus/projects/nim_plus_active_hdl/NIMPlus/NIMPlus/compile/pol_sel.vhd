-------------------------------------------------------------------------------
--
-- Title       : pol_sel
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\pol_sel.vhd
-- Generated   : Wed May  2 14:15:13 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\pol_sel.bde
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


entity pol_sel is
  port(
       sel_in : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       sig_out : out STD_LOGIC
  );
end pol_sel;

architecture pol_sel of pol_sel is

---- Signal declarations used on the diagram ----

signal NET31 : STD_LOGIC;

begin

----  Component instantiations  ----

NET31 <= not(sig_in);

sig_out <= (sig_in and not sel_in) or (NET31 and sel_in);


end pol_sel;
