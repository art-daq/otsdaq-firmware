-------------------------------------------------------------------------------
--
-- Title       : reg_read_decode_p
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\reg_read_decode_p.vhd
-- Generated   : Tue Jan 30 11:09:39 2018
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\reg_read_decode_p.bde
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


entity reg_read_decode_p is
  port(
       clk0 : in STD_LOGIC;
       rden : in STD_LOGIC;
       rdaddr : in STD_LOGIC_VECTOR(31 downto 0);
       sig0 : in STD_LOGIC_VECTOR(63 downto 0);
       sig1 : in STD_LOGIC_VECTOR(63 downto 0);
       sig10 : in STD_LOGIC_VECTOR(63 downto 0);
       sig11 : in STD_LOGIC_VECTOR(63 downto 0);
       sig12 : in STD_LOGIC_VECTOR(63 downto 0);
       sig13 : in STD_LOGIC_VECTOR(63 downto 0);
       sig14 : in STD_LOGIC_VECTOR(63 downto 0);
       sig15 : in STD_LOGIC_VECTOR(63 downto 0);
       sig16 : in STD_LOGIC_VECTOR(63 downto 0);
       sig17 : in STD_LOGIC_VECTOR(63 downto 0);
       sig18 : in STD_LOGIC_VECTOR(63 downto 0);
       sig19 : in STD_LOGIC_VECTOR(63 downto 0);
       sig2 : in STD_LOGIC_VECTOR(63 downto 0);
       sig20 : in STD_LOGIC_VECTOR(63 downto 0);
       sig21 : in STD_LOGIC_VECTOR(63 downto 0);
       sig22 : in STD_LOGIC_VECTOR(63 downto 0);
       sig23 : in STD_LOGIC_VECTOR(63 downto 0);
       sig24 : in STD_LOGIC_VECTOR(63 downto 0);
       sig25 : in STD_LOGIC_VECTOR(63 downto 0);
       sig26 : in STD_LOGIC_VECTOR(63 downto 0);
       sig27 : in STD_LOGIC_VECTOR(63 downto 0);
       sig28 : in STD_LOGIC_VECTOR(63 downto 0);
       sig29 : in STD_LOGIC_VECTOR(63 downto 0);
       sig3 : in STD_LOGIC_VECTOR(63 downto 0);
       sig30 : in STD_LOGIC_VECTOR(63 downto 0);
       sig31 : in STD_LOGIC_VECTOR(63 downto 0);
       sig4 : in STD_LOGIC_VECTOR(63 downto 0);
       sig5 : in STD_LOGIC_VECTOR(63 downto 0);
       sig6 : in STD_LOGIC_VECTOR(63 downto 0);
       sig7 : in STD_LOGIC_VECTOR(63 downto 0);
       sig8 : in STD_LOGIC_VECTOR(63 downto 0);
       sig9 : in STD_LOGIC_VECTOR(63 downto 0);
       out64 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end reg_read_decode_p;

architecture reg_read_decode_p of reg_read_decode_p is

---- Component declarations -----

component read_decode_p
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       rd_0 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_1 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_10 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_11 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_12 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_13 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_14 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_15 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_16 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_17 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_18 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_19 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_2 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_20 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_21 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_22 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_23 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_24 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_25 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_26 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_27 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_28 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_29 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_3 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_30 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_31 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_4 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_5 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_6 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_7 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_8 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_9 : in STD_LOGIC_VECTOR(63 downto 0);
       rden : in STD_LOGIC;
       read_data_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component reg_64
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(63 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal en : STD_LOGIC;
signal GND : STD_LOGIC;
signal rst : STD_LOGIC;
signal rd0 : STD_LOGIC_VECTOR (63 downto 0);
signal rd1 : STD_LOGIC_VECTOR (63 downto 0);
signal rd10 : STD_LOGIC_VECTOR (63 downto 0);
signal rd11 : STD_LOGIC_VECTOR (63 downto 0);
signal rd12 : STD_LOGIC_VECTOR (63 downto 0);
signal rd13 : STD_LOGIC_VECTOR (63 downto 0);
signal rd14 : STD_LOGIC_VECTOR (63 downto 0);
signal rd15 : STD_LOGIC_VECTOR (63 downto 0);
signal rd16 : STD_LOGIC_VECTOR (63 downto 0);
signal rd17 : STD_LOGIC_VECTOR (63 downto 0);
signal rd18 : STD_LOGIC_VECTOR (63 downto 0);
signal rd19 : STD_LOGIC_VECTOR (63 downto 0);
signal rd2 : STD_LOGIC_VECTOR (63 downto 0);
signal rd20 : STD_LOGIC_VECTOR (63 downto 0);
signal rd21 : STD_LOGIC_VECTOR (63 downto 0);
signal rd22 : STD_LOGIC_VECTOR (63 downto 0);
signal rd23 : STD_LOGIC_VECTOR (63 downto 0);
signal rd24 : STD_LOGIC_VECTOR (63 downto 0);
signal rd25 : STD_LOGIC_VECTOR (63 downto 0);
signal rd26 : STD_LOGIC_VECTOR (63 downto 0);
signal rd27 : STD_LOGIC_VECTOR (63 downto 0);
signal rd28 : STD_LOGIC_VECTOR (63 downto 0);
signal rd29 : STD_LOGIC_VECTOR (63 downto 0);
signal rd3 : STD_LOGIC_VECTOR (63 downto 0);
signal rd30 : STD_LOGIC_VECTOR (63 downto 0);
signal rd31 : STD_LOGIC_VECTOR (63 downto 0);
signal rd4 : STD_LOGIC_VECTOR (63 downto 0);
signal rd5 : STD_LOGIC_VECTOR (63 downto 0);
signal rd6 : STD_LOGIC_VECTOR (63 downto 0);
signal rd7 : STD_LOGIC_VECTOR (63 downto 0);
signal rd8 : STD_LOGIC_VECTOR (63 downto 0);
signal rd9 : STD_LOGIC_VECTOR (63 downto 0);

begin

----  Component instantiations  ----

U1 : read_decode_p
  port map(
       addr => rdaddr,
       rd_0 => rd0,
       rd_1 => rd1,
       rd_10 => rd10,
       rd_11 => rd11,
       rd_12 => rd12,
       rd_13 => rd13,
       rd_14 => rd14,
       rd_15 => rd15,
       rd_16 => rd16,
       rd_17 => rd17,
       rd_18 => rd18,
       rd_19 => rd19,
       rd_2 => rd2,
       rd_20 => rd20,
       rd_21 => rd21,
       rd_22 => rd22,
       rd_23 => rd23,
       rd_24 => rd24,
       rd_25 => rd25,
       rd_26 => rd26,
       rd_27 => rd27,
       rd_28 => rd28,
       rd_29 => rd29,
       rd_3 => rd3,
       rd_30 => rd30,
       rd_31 => rd31,
       rd_4 => rd4,
       rd_5 => rd5,
       rd_6 => rd6,
       rd_7 => rd7,
       rd_8 => rd8,
       rd_9 => rd9,
       rden => rden,
       read_data_out => out64
  );

U10 : reg_64
  port map(
       clk => clk0,
       d => sig6,
       q => rd6,
       reset_p => rst,
       wr_en => en
  );

U11 : reg_64
  port map(
       clk => clk0,
       d => sig7,
       q => rd7,
       reset_p => rst,
       wr_en => en
  );

U12 : reg_64
  port map(
       clk => clk0,
       d => sig8,
       q => rd8,
       reset_p => rst,
       wr_en => en
  );

U13 : reg_64
  port map(
       clk => clk0,
       d => sig9,
       q => rd9,
       reset_p => rst,
       wr_en => en
  );

U14 : reg_64
  port map(
       clk => clk0,
       d => sig10,
       q => rd10,
       reset_p => rst,
       wr_en => en
  );

U15 : reg_64
  port map(
       clk => clk0,
       d => sig11,
       q => rd11,
       reset_p => rst,
       wr_en => en
  );

U16 : reg_64
  port map(
       clk => clk0,
       d => sig12,
       q => rd12,
       reset_p => rst,
       wr_en => en
  );

U17 : reg_64
  port map(
       clk => clk0,
       d => sig13,
       q => rd13,
       reset_p => rst,
       wr_en => en
  );

U18 : reg_64
  port map(
       clk => clk0,
       d => sig14,
       q => rd14,
       reset_p => rst,
       wr_en => en
  );

U19 : reg_64
  port map(
       clk => clk0,
       d => sig15,
       q => rd15,
       reset_p => rst,
       wr_en => en
  );

U2 : reg_64
  port map(
       clk => clk0,
       d => sig0,
       q => rd0,
       reset_p => rst,
       wr_en => en
  );

U20 : reg_64
  port map(
       clk => clk0,
       d => sig16,
       q => rd16,
       reset_p => rst,
       wr_en => en
  );

U21 : reg_64
  port map(
       clk => clk0,
       d => sig17,
       q => rd17,
       reset_p => rst,
       wr_en => en
  );

U22 : reg_64
  port map(
       clk => clk0,
       d => sig18,
       q => rd18,
       reset_p => rst,
       wr_en => en
  );

U23 : reg_64
  port map(
       clk => clk0,
       d => sig19,
       q => rd19,
       reset_p => rst,
       wr_en => en
  );

U24 : reg_64
  port map(
       clk => clk0,
       d => sig20,
       q => rd20,
       reset_p => rst,
       wr_en => en
  );

U25 : reg_64
  port map(
       clk => clk0,
       d => sig21,
       q => rd21,
       reset_p => rst,
       wr_en => en
  );

U26 : reg_64
  port map(
       clk => clk0,
       d => sig22,
       q => rd22,
       reset_p => rst,
       wr_en => en
  );

U27 : reg_64
  port map(
       clk => clk0,
       d => sig23,
       q => rd23,
       reset_p => rst,
       wr_en => en
  );

U28 : reg_64
  port map(
       clk => clk0,
       d => sig24,
       q => rd24,
       reset_p => rst,
       wr_en => en
  );

U29 : reg_64
  port map(
       clk => clk0,
       d => sig25,
       q => rd25,
       reset_p => rst,
       wr_en => en
  );

en <= not(GND);

U30 : reg_64
  port map(
       clk => clk0,
       d => sig26,
       q => rd26,
       reset_p => rst,
       wr_en => en
  );

U31 : reg_64
  port map(
       clk => clk0,
       d => sig27,
       q => rd27,
       reset_p => rst,
       wr_en => en
  );

U32 : reg_64
  port map(
       clk => clk0,
       d => sig28,
       q => rd28,
       reset_p => rst,
       wr_en => en
  );

U33 : reg_64
  port map(
       clk => clk0,
       d => sig29,
       q => rd29,
       reset_p => rst,
       wr_en => en
  );

U34 : reg_64
  port map(
       clk => clk0,
       d => sig30,
       q => rd30,
       reset_p => rst,
       wr_en => en
  );

U35 : reg_64
  port map(
       clk => clk0,
       d => sig31,
       q => rd31,
       reset_p => rst,
       wr_en => en
  );

rst <= GND;

U5 : reg_64
  port map(
       clk => clk0,
       d => sig1,
       q => rd1,
       reset_p => rst,
       wr_en => en
  );

U6 : reg_64
  port map(
       clk => clk0,
       d => sig2,
       q => rd2,
       reset_p => rst,
       wr_en => en
  );

U7 : reg_64
  port map(
       clk => clk0,
       d => sig3,
       q => rd3,
       reset_p => rst,
       wr_en => en
  );

U8 : reg_64
  port map(
       clk => clk0,
       d => sig4,
       q => rd4,
       reset_p => rst,
       wr_en => en
  );

U9 : reg_64
  port map(
       clk => clk0,
       d => sig5,
       q => rd5,
       reset_p => rst,
       wr_en => en
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;

end reg_read_decode_p;
