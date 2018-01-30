-------------------------------------------------------------------------------
--
-- Title       : wr_test
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\wr_test.vhd
-- Generated   : Wed Aug 17 09:53:47 2016
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\wr_test.bde
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
use nim_plus_package_1.all;


entity wr_test is
  port(
       OEI_reg_wr : in STD_LOGIC;
       clk_in : in STD_LOGIC;
       reg_reset_p : in STD_LOGIC;
       OEI_addr : in STD_LOGIC_VECTOR(31 downto 0);
       d_in : in STD_LOGIC_VECTOR(31 downto 0);
       reg_out_0 : out STD_LOGIC_VECTOR(31 downto 0);
       reg_out_1 : out STD_LOGIC_VECTOR(31 downto 0);
       reg_out_2 : out STD_LOGIC_VECTOR(31 downto 0);
       reg_out_3 : out STD_LOGIC_VECTOR(31 downto 0);
       reg_out_4 : out STD_LOGIC_VECTOR(31 downto 0);
       reg_out_5 : out STD_LOGIC_VECTOR(31 downto 0);
       reg_out_6 : out STD_LOGIC_VECTOR(31 downto 0);
       reg_out_7 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end wr_test;

architecture wr_test of wr_test is

---- Component declarations -----

component decode_addr_8_regs
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component reg_32
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(31 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal wr_en : STD_LOGIC_VECTOR (7 downto 0);

begin

----  Component instantiations  ----

U1 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_0,
       reset_p => reg_reset_p,
       wr_en => wr_en(0)
  );

U2 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_1,
       reset_p => reg_reset_p,
       wr_en => wr_en(1)
  );

U3 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_2,
       reset_p => reg_reset_p,
       wr_en => wr_en(2)
  );

U4 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_3,
       reset_p => reg_reset_p,
       wr_en => wr_en(3)
  );

U5 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_4,
       reset_p => reg_reset_p,
       wr_en => wr_en(4)
  );

U6 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_5,
       reset_p => reg_reset_p,
       wr_en => wr_en(5)
  );

U7 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_6,
       reset_p => reg_reset_p,
       wr_en => wr_en(6)
  );

U8 : reg_32
  port map(
       clk => clk_in,
       d => d_in,
       q => reg_out_7,
       reset_p => reg_reset_p,
       wr_en => wr_en(7)
  );

U9 : decode_addr_8_regs
  port map(
       addr => OEI_addr,
       blk_wr_en => wr_en,
       wr_en => OEI_reg_wr
  );


end wr_test;
