-------------------------------------------------------------------------------
--
-- Title       : pipetest
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\pipetest.vhd
-- Generated   : Wed May  2 14:14:51 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\pipetest.bde
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


entity pipetest is 
end pipetest;

architecture pipetest of pipetest is

---- Component declarations -----

component pipe_line_8
  port (
       clk_in : in STD_LOGIC;
       data_in : in STD_LOGIC;
       reset_n : in STD_LOGIC;
       p : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : pipe_line_8
  port map(
       clk_in => Dangling_Input_Signal,
       data_in => Dangling_Input_Signal,
       reset_n => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end pipetest;
