-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Mon May  7 13:12:46 2018
-- Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
-- Command     : write_vhdl -force -mode funcsim
--               /home/rrivera/Desktop/nim_plus_x/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_funcsim.vhdl
-- Design      : clk_wiz_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_1_clk_wiz_1_clk_wiz is
  port (
    clk_in40e : in STD_LOGIC;
    clk_out320e : out STD_LOGIC;
    clk_out265 : out STD_LOGIC;
    clk_out1325 : out STD_LOGIC;
    clk_out53 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_wiz_1_clk_wiz_1_clk_wiz : entity is "clk_wiz_1_clk_wiz";
end clk_wiz_1_clk_wiz_1_clk_wiz;

architecture STRUCTURE of clk_wiz_1_clk_wiz_1_clk_wiz is
  signal clk_in40e_clk_wiz_1 : STD_LOGIC;
  signal clk_out320e_clk_wiz_1 : STD_LOGIC;
  signal clk_out53_clk_wiz_1 : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_1 : STD_LOGIC;
  signal clkfbout_clk_wiz_1 : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute box_type : string;
  attribute box_type of clkf_buf : label is "PRIMITIVE";
  attribute box_type of clkin1_bufg : label is "PRIMITIVE";
  attribute box_type of clkout1_buf : label is "PRIMITIVE";
  attribute box_type of clkout4_buf : label is "PRIMITIVE";
  attribute box_type of plle2_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_wiz_1,
      O => clkfbout_buf_clk_wiz_1
    );
clkin1_bufg: unisim.vcomponents.BUFG
     port map (
      I => clk_in40e,
      O => clk_in40e_clk_wiz_1
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out320e_clk_wiz_1,
      O => clk_out320e
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out53_clk_wiz_1,
      O => clk_out53
    );
plle2_adv_inst: unisim.vcomponents.PLLE2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 18,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 18.867001,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE => 3,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 36,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 72,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 18,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      COMPENSATION => "BUF_IN",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.000000,
      REF_JITTER2 => 0.000000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => clkfbout_buf_clk_wiz_1,
      CLKFBOUT => clkfbout_clk_wiz_1,
      CLKIN1 => clk_in40e_clk_wiz_1,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKOUT0 => clk_out320e_clk_wiz_1,
      CLKOUT1 => clk_out265,
      CLKOUT2 => clk_out1325,
      CLKOUT3 => clk_out53_clk_wiz_1,
      CLKOUT4 => NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED,
      DADDR(6) => '0',
      DADDR(5) => '0',
      DADDR(4) => '0',
      DADDR(3) => '0',
      DADDR(2) => '0',
      DADDR(1) => '0',
      DADDR(0) => '0',
      DCLK => '0',
      DEN => '0',
      DI(15) => '0',
      DI(14) => '0',
      DI(13) => '0',
      DI(12) => '0',
      DI(11) => '0',
      DI(10) => '0',
      DI(9) => '0',
      DI(8) => '0',
      DI(7) => '0',
      DI(6) => '0',
      DI(5) => '0',
      DI(4) => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      DO(15 downto 0) => NLW_plle2_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle2_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
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
    clk_in40e : in STD_LOGIC;
    clk_out320e : out STD_LOGIC;
    clk_out265 : out STD_LOGIC;
    clk_out1325 : out STD_LOGIC;
    clk_out53 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clk_wiz_1 : entity is true;
  attribute core_generation_info : string;
  attribute core_generation_info of clk_wiz_1 : entity is "clk_wiz_1,clk_wiz_v5_1,{component_name=clk_wiz_1,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=PLL,num_out_clk=4,clkin1_period=18.867,clkin2_period=10.0,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}";
end clk_wiz_1;

architecture STRUCTURE of clk_wiz_1 is
begin
U0: entity work.clk_wiz_1_clk_wiz_1_clk_wiz
     port map (
      clk_in40e => clk_in40e,
      clk_out1325 => clk_out1325,
      clk_out265 => clk_out265,
      clk_out320e => clk_out320e,
      clk_out53 => clk_out53,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
