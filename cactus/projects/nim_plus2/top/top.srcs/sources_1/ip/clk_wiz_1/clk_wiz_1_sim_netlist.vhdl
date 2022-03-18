-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Thu Oct 29 15:23:12 2020
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode funcsim
--               /data/rrivera/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_sim_netlist.vhdl
-- Design      : clk_wiz_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_1_clk_wiz_1_clk_wiz is
  port (
    clk_out_external160 : out STD_LOGIC;
    clk_out_external13 : out STD_LOGIC;
    clk_out_external6 : out STD_LOGIC;
    clk_out_external40 : out STD_LOGIC;
    clk_out_external53 : out STD_LOGIC;
    clk_out_external26 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in_external53 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_wiz_1_clk_wiz_1_clk_wiz : entity is "clk_wiz_1_clk_wiz";
end clk_wiz_1_clk_wiz_1_clk_wiz;

architecture STRUCTURE of clk_wiz_1_clk_wiz_1_clk_wiz is
  signal clk_in_external53_clk_wiz_1 : STD_LOGIC;
  signal clk_out_external13_clk_wiz_1 : STD_LOGIC;
  signal clk_out_external160_clk_wiz_1 : STD_LOGIC;
  signal clk_out_external26_clk_wiz_1 : STD_LOGIC;
  signal clk_out_external40_clk_wiz_1 : STD_LOGIC;
  signal clk_out_external53_clk_wiz_1 : STD_LOGIC;
  signal clk_out_external6_clk_wiz_1 : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_1 : STD_LOGIC;
  signal clkfbout_clk_wiz_1 : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
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
  attribute BOX_TYPE of clkout5_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout6_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_wiz_1,
      O => clkfbout_buf_clk_wiz_1
    );
clkin1_bufg: unisim.vcomponents.BUFG
     port map (
      I => clk_in_external53,
      O => clk_in_external53_clk_wiz_1
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out_external160_clk_wiz_1,
      O => clk_out_external160
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out_external13_clk_wiz_1,
      O => clk_out_external13
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out_external6_clk_wiz_1,
      O => clk_out_external6
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out_external40_clk_wiz_1,
      O => clk_out_external40
    );
clkout5_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out_external53_clk_wiz_1,
      O => clk_out_external53
    );
clkout6_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out_external26_clk_wiz_1,
      O => clk_out_external26
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 15.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 18.868000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 5.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 60,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 120,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 20,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 15,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 30,
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
      CLKFBIN => clkfbout_buf_clk_wiz_1,
      CLKFBOUT => clkfbout_clk_wiz_1,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in_external53_clk_wiz_1,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_out_external160_clk_wiz_1,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_out_external13_clk_wiz_1,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => clk_out_external6_clk_wiz_1,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => clk_out_external40_clk_wiz_1,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => clk_out_external53_clk_wiz_1,
      CLKOUT5 => clk_out_external26_clk_wiz_1,
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
entity clk_wiz_1 is
  port (
    clk_out_external160 : out STD_LOGIC;
    clk_out_external13 : out STD_LOGIC;
    clk_out_external6 : out STD_LOGIC;
    clk_out_external40 : out STD_LOGIC;
    clk_out_external53 : out STD_LOGIC;
    clk_out_external26 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in_external53 : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clk_wiz_1 : entity is true;
end clk_wiz_1;

architecture STRUCTURE of clk_wiz_1 is
begin
inst: entity work.clk_wiz_1_clk_wiz_1_clk_wiz
     port map (
      clk_in_external53 => clk_in_external53,
      clk_out_external13 => clk_out_external13,
      clk_out_external160 => clk_out_external160,
      clk_out_external26 => clk_out_external26,
      clk_out_external40 => clk_out_external40,
      clk_out_external53 => clk_out_external53,
      clk_out_external6 => clk_out_external6,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
