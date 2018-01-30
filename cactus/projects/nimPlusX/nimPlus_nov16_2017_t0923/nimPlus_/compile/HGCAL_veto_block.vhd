-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\HGCAL_veto_block.vhd
-- Generated   : Mon Apr 10 15:48:00 2017
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\HGCAL_veto_block.bde
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


entity HGCAL_veto_block is
  port(
       clk : in STD_LOGIC;
       en_rearm : in STD_LOGIC;
       reg_wr_en : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       st_in_0 : in STD_LOGIC;
       st_in_1 : in STD_LOGIC;
       d_in : in STD_LOGIC_VECTOR(7 downto 0);
       trig_out : out STD_LOGIC
  );
end HGCAL_veto_block;

architecture HGCAL_veto_block of HGCAL_veto_block is

---- Component declarations -----

component HGCAL_Veto_w_Rearm
  port (
       clk : in STD_LOGIC;
       en_rearm : in STD_LOGIC;
       high_period : in STD_LOGIC_VECTOR(7 downto 0);
       reset_p : in STD_LOGIC;
       start_in : in STD_LOGIC;
       trig_out : out STD_LOGIC
  );
end component;
component reg_8
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(7 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal start_in : STD_LOGIC;
signal per_count : STD_LOGIC_VECTOR (7 downto 0);

begin

----  Component instantiations  ----

U1 : reg_8
  port map(
       clk => clk,
       d => d_in,
       q => per_count,
       reset_p => reset_p,
       wr_en => reg_wr_en
  );

U2 : HGCAL_Veto_w_Rearm
  port map(
       clk => clk,
       en_rearm => en_rearm,
       high_period => per_count,
       reset_p => reset_p,
       start_in => start_in,
       trig_out => trig_out
  );

start_in <= st_in_1 and st_in_0;


end HGCAL_veto_block;
