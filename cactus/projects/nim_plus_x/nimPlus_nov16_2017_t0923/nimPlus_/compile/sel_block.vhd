-------------------------------------------------------------------------------
--
-- Title       : sel_block
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\sel_block.vhd
-- Generated   : Fri Feb 24 14:41:01 2017
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\sel_block.bde
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


entity sel_block is
  port(
       blk_en : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       en_term : in STD_LOGIC_VECTOR(15 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       sig_out : out STD_LOGIC
  );
end sel_block;

architecture sel_block of sel_block is

---- Signal declarations used on the diagram ----

signal rst_n : STD_LOGIC;
signal sig_term : STD_LOGIC;
signal mterm : STD_LOGIC_VECTOR (3 downto 0);
signal raw_term : STD_LOGIC_VECTOR (15 downto 0);
signal term : STD_LOGIC_VECTOR (15 downto 0);
signal xn : STD_LOGIC_VECTOR (3 downto 0);

begin

----  Component instantiations  ----

rst_n <= not(rst_p);

term(2) <= en_term(2) and raw_term(2);

raw_term(3) <= xn(3) and xn(2) and x(1) and x(0);

term(3) <= en_term(3) and raw_term(3);

raw_term(4) <= xn(3) and x(2) and xn(1) and xn(0);

term(4) <= en_term(4) and raw_term(4);

raw_term(5) <= xn(3) and x(2) and xn(1) and x(0);

term(5) <= en_term(5) and raw_term(5);

raw_term(6) <= xn(3) and x(2) and x(1) and xn(0);

term(6) <= en_term(6) and raw_term(6);

raw_term(7) <= xn(3) and x(2) and x(1) and x(0);

xn(0) <= not(rst_n and x(0));

term(7) <= en_term(7) and raw_term(7);

raw_term(8) <= x(3) and xn(2) and xn(1) and xn(0);

term(8) <= en_term(8) and raw_term(8);

raw_term(9) <= x(3) and xn(2) and xn(1) and x(0);

term(9) <= en_term(9) and raw_term(9);

raw_term(10) <= x(3) and xn(2) and x(1) and xn(0);

term(10) <= en_term(10) and raw_term(10);

raw_term(11) <= x(3) and xn(2) and x(1) and x(0);

term(11) <= en_term(11) and raw_term(11);

raw_term(12) <= x(3) and x(2) and xn(1) and xn(0);

xn(1) <= not(rst_n and x(1));

term(12) <= en_term(12) and raw_term(12);

raw_term(13) <= x(3) and x(2) and xn(1) and x(0);

term(13) <= en_term(13) and raw_term(13);

raw_term(14) <= x(3) and x(2) and x(1) and xn(0);

term(14) <= en_term(14) and raw_term(14);

raw_term(15) <= x(3) and x(2) and x(1) and x(0);

term(15) <= en_term(15) and raw_term(15);

mterm(0) <= term(3) or term(2) or term(1) or term(0);

mterm(1) <= term(7) or term(6) or term(5) or term(4);

mterm(2) <= term(11) or term(10) or term(9) or term(8);

xn(2) <= not(rst_n and x(2));

mterm(3) <= term(15) or term(14) or term(13) or term(12);

sig_term <= mterm(3) or mterm(2) or mterm(1) or mterm(0);

sig_out <= blk_en and sig_term;

xn(3) <= not(rst_n and x(3));

raw_term(0) <= xn(3) and xn(2) and xn(1) and xn(0);

term(0) <= en_term(0) and raw_term(0);

raw_term(1) <= xn(3) and xn(2) and xn(1) and x(0);

term(1) <= en_term(1) and raw_term(1);

raw_term(2) <= xn(3) and xn(2) and x(1) and xn(0);


end sel_block;
