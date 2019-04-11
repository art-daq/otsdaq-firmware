-------------------------------------------------------------------------------
--
-- Title       : wr_rd_test
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\wr_rd_test.vhd
-- Generated   : Wed May  2 14:14:55 2018
-- From        : C:\AGP_2018_05_02_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\wr_rd_test.bde
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


entity wr_rd_test is
  port(
       OEI_reg_wr : in STD_LOGIC;
       clk_in : in STD_LOGIC;
       OEI_addr : in STD_LOGIC_VECTOR(31 downto 0);
       d_in : in STD_LOGIC_VECTOR(31 downto 0);
       read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end wr_rd_test;

architecture wr_rd_test of wr_rd_test is

---- Component declarations -----

component rd_test_decode
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_0 : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_1 : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_2 : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_3 : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_4 : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_5 : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_6 : in STD_LOGIC_VECTOR(31 downto 0);
       data_in_7 : in STD_LOGIC_VECTOR(31 downto 0);
       read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component wr_test
  port (
       OEI_addr : in STD_LOGIC_VECTOR(31 downto 0);
       OEI_reg_wr : in STD_LOGIC;
       clk_in : in STD_LOGIC;
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
end component;

---- Signal declarations used on the diagram ----

signal r0 : STD_LOGIC_VECTOR(31 downto 0);
signal r1 : STD_LOGIC_VECTOR(31 downto 0);
signal r2 : STD_LOGIC_VECTOR(31 downto 0);
signal r3 : STD_LOGIC_VECTOR(31 downto 0);
signal r4 : STD_LOGIC_VECTOR(31 downto 0);
signal r5 : STD_LOGIC_VECTOR(31 downto 0);
signal r6 : STD_LOGIC_VECTOR(31 downto 0);
signal r7 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U1 : wr_test
  port map(
       OEI_addr => OEI_addr,
       OEI_reg_wr => OEI_reg_wr,
       clk_in => clk_in,
       d_in => d_in,
       reg_out_0 => r0,
       reg_out_1 => r1,
       reg_out_2 => r2,
       reg_out_3 => r3,
       reg_out_4 => r4,
       reg_out_5 => r5,
       reg_out_6 => r6,
       reg_out_7 => r7
  );

U2 : rd_test_decode
  port map(
       addr => OEI_addr,
       data_in_0 => r0,
       data_in_1 => r1,
       data_in_2 => r2,
       data_in_3 => r3,
       data_in_4 => r4,
       data_in_5 => r5,
       data_in_6 => r6,
       data_in_7 => r7,
       read_data_out => read_data_out
  );


end wr_rd_test;
