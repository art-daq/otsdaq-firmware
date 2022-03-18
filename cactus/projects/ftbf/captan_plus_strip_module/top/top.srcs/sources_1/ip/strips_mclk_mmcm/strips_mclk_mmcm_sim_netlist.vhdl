-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Wed Dec 22 10:04:57 2021
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode funcsim
--               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/strips_mclk_mmcm/strips_mclk_mmcm_sim_netlist.vhdl
-- Design      : strips_mclk_mmcm
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity strips_mclk_mmcm_strips_mclk_mmcm_clk_wiz is
  port (
    MCLK_A : out STD_LOGIC;
    MCLK_B : out STD_LOGIC;
    MCLK_DIV4 : out STD_LOGIC;
    MCLK_MULT3 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    CLK15NS : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of strips_mclk_mmcm_strips_mclk_mmcm_clk_wiz : entity is "strips_mclk_mmcm_clk_wiz";
end strips_mclk_mmcm_strips_mclk_mmcm_clk_wiz;

architecture STRUCTURE of strips_mclk_mmcm_strips_mclk_mmcm_clk_wiz is
  signal CLK15NS_strips_mclk_mmcm : STD_LOGIC;
  signal MCLK_A_strips_mclk_mmcm : STD_LOGIC;
  signal MCLK_B_strips_mclk_mmcm : STD_LOGIC;
  signal MCLK_DIV4_strips_mclk_mmcm : STD_LOGIC;
  signal MCLK_MULT3_strips_mclk_mmcm : STD_LOGIC;
  signal clkfbout_buf_strips_mclk_mmcm : STD_LOGIC;
  signal clkfbout_strips_mclk_mmcm : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_bufg : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout3_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout4_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_strips_mclk_mmcm,
      O => clkfbout_buf_strips_mclk_mmcm
    );
clkin1_bufg: unisim.vcomponents.BUFG
     port map (
      I => CLK15NS,
      O => CLK15NS_strips_mclk_mmcm
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => MCLK_A_strips_mclk_mmcm,
      O => MCLK_A
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => MCLK_B_strips_mclk_mmcm,
      O => MCLK_B
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => MCLK_DIV4_strips_mclk_mmcm,
      O => MCLK_DIV4
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => MCLK_MULT3_strips_mclk_mmcm,
      O => MCLK_MULT3
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 15.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 15.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 15.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 15,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 90.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 60,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 5,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "BUF_IN",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_strips_mclk_mmcm,
      CLKFBOUT => clkfbout_strips_mclk_mmcm,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => CLK15NS_strips_mclk_mmcm,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => MCLK_A_strips_mclk_mmcm,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => MCLK_B_strips_mclk_mmcm,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => MCLK_DIV4_strips_mclk_mmcm,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => MCLK_MULT3_strips_mclk_mmcm,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity strips_mclk_mmcm is
  port (
    MCLK_A : out STD_LOGIC;
    MCLK_B : out STD_LOGIC;
    MCLK_DIV4 : out STD_LOGIC;
    MCLK_MULT3 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    CLK15NS : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of strips_mclk_mmcm : entity is true;
end strips_mclk_mmcm;

architecture STRUCTURE of strips_mclk_mmcm is
begin
inst: entity work.strips_mclk_mmcm_strips_mclk_mmcm_clk_wiz
     port map (
      CLK15NS => CLK15NS,
      MCLK_A => MCLK_A,
      MCLK_B => MCLK_B,
      MCLK_DIV4 => MCLK_DIV4,
      MCLK_MULT3 => MCLK_MULT3,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
