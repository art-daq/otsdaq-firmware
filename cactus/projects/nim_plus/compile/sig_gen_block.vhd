-------------------------------------------------------------------------------
--
-- Title       : sig_gen_block
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\sig_gen_block.vhd
-- Generated   : Thu Mar 30 13:44:59 2017
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\sig_gen_block.bde
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


entity sig_gen_block is
  port(
       clk_in : in STD_LOGIC;
       cyc_in : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       start_enable : in STD_LOGIC;
       period_hi : in STD_LOGIC_VECTOR(15 downto 0);
       period_lo : in STD_LOGIC_VECTOR(15 downto 0);
       pulse_count : in STD_LOGIC_VECTOR(15 downto 0);
       err_out : out STD_LOGIC;
       pulse_out : out STD_LOGIC
  );
end sig_gen_block;

architecture sig_gen_block of sig_gen_block is

---- Component declarations -----

component sig_gen_prog
  port (
       clk : in STD_LOGIC;
       cycle_in : in STD_LOGIC;
       p_count : in STD_LOGIC_VECTOR(15 downto 0);
       p_hi : in STD_LOGIC_VECTOR(15 downto 0);
       p_lo : in STD_LOGIC_VECTOR(15 downto 0);
       reset_p : in STD_LOGIC;
       start_en : in STD_LOGIC;
       err_out : out STD_LOGIC;
       p_out : out STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

U1 : sig_gen_prog
  port map(
       clk => clk_in,
       cycle_in => cyc_in,
       err_out => err_out,
       p_count => pulse_count,
       p_hi => period_hi,
       p_lo => period_lo,
       p_out => pulse_out,
       reset_p => rst_p,
       start_en => start_enable
  );


end sig_gen_block;
