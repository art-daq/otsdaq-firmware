-------------------------------------------------------------------------------
--
-- Title       : bfifomux_w_ctlr
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\bfifomux_w_ctlr.vhd
-- Generated   : Wed Jan 31 14:47:52 2018
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_30_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\bfifomux_w_ctlr.bde
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


entity bfifomux_w_ctlr is
  port(
       burst_full_ext : in STD_LOGIC;
       clk0 : in STD_LOGIC;
       ext_rst : in STD_LOGIC;
       trig_sig_in : in STD_LOGIC;
       wd0 : in STD_LOGIC_VECTOR(31 downto 0);
       wd1 : in STD_LOGIC_VECTOR(31 downto 0);
       wd2 : in STD_LOGIC_VECTOR(31 downto 0);
       wd3 : in STD_LOGIC_VECTOR(31 downto 0);
       wd4 : in STD_LOGIC_VECTOR(31 downto 0);
       wd5 : in STD_LOGIC_VECTOR(31 downto 0);
       burst_wr_out : out STD_LOGIC;
       fin_wr : out STD_LOGIC;
       out64 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end bfifomux_w_ctlr;

architecture bfifomux_w_ctlr of bfifomux_w_ctlr is

---- Component declarations -----

component clkd_b_fifo_mux
  port (
       clk0 : in STD_LOGIC;
       cwd0 : in STD_LOGIC_VECTOR(31 downto 0);
       cwd1 : in STD_LOGIC_VECTOR(31 downto 0);
       cwd2 : in STD_LOGIC_VECTOR(31 downto 0);
       cwd3 : in STD_LOGIC_VECTOR(31 downto 0);
       cwd4 : in STD_LOGIC_VECTOR(31 downto 0);
       cwd5 : in STD_LOGIC_VECTOR(31 downto 0);
       latched : in STD_LOGIC;
       restp : in STD_LOGIC;
       burst_w_out : out STD_LOGIC;
       out64 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component cntrs_2_b_fifo
  port (
       b_fifo_full_p : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       b_wr : out STD_LOGIC;
       fin_wr : out STD_LOGIC;
       latch_sig : out STD_LOGIC;
       mux_dir : out STD_LOGIC_VECTOR(1 downto 0)
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

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
signal latch_en : STD_LOGIC;
signal rstbuf : STD_LOGIC;
signal cw20 : STD_LOGIC_VECTOR (31 downto 0);
signal cwd0 : STD_LOGIC_VECTOR (31 downto 0);
signal cwd1 : STD_LOGIC_VECTOR (31 downto 0);
signal cwd3 : STD_LOGIC_VECTOR (31 downto 0);
signal cwd4 : STD_LOGIC_VECTOR (31 downto 0);
signal cwd5 : STD_LOGIC_VECTOR (31 downto 0);

    attribute mark_debug : string;
    attribute mark_debug of latch_en : signal is "true";

begin

----  Component instantiations  ----

U1 : reg_32
  port map(
       clk => clk0,
       d => wd0,
       q => cwd0,
       reset_p => rstbuf,
       wr_en => latch_en
  );

U10 : clkd_b_fifo_mux
  port map(
       burst_w_out => burst_wr_out,
       clk0 => clk0,
       cwd0 => cwd0,
       cwd1 => cwd1,
       cwd2 => cw20,
       cwd3 => cwd3,
       cwd4 => cwd4,
       cwd5 => cwd5,
       latched => latch_en,
       out64 => out64,
       restp => ext_rst
  );

U2 : reg_32
  port map(
       clk => clk0,
       d => wd1,
       q => cwd1,
       reset_p => rstbuf,
       wr_en => latch_en
  );

U3 : reg_32
  port map(
       clk => clk0,
       d => wd2,
       q => cw20,
       reset_p => rstbuf,
       wr_en => latch_en
  );

U4 : reg_32
  port map(
       clk => clk0,
       d => wd3,
       q => cwd3,
       reset_p => rstbuf,
       wr_en => latch_en
  );

U5 : reg_32
  port map(
       clk => clk0,
       d => wd4,
       q => cwd4,
       reset_p => rstbuf,
       wr_en => latch_en
  );

U6 : reg_32
  port map(
       clk => clk0,
       d => wd5,
       q => cwd5,
       reset_p => rstbuf,
       wr_en => latch_en
  );

rstbuf <= GND;

U9 : cntrs_2_b_fifo
  port map(
       b_fifo_full_p => burst_full_ext,
       clk => clk0,
       fin_wr => fin_wr,
       latch_sig => latch_en,
       reset_p => ext_rst,
       sig_in => trig_sig_in
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;

end bfifomux_w_ctlr;
