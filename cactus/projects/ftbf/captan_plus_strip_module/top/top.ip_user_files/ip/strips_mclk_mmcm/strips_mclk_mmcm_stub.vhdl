-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Wed Dec 22 10:04:57 2021
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/strips_mclk_mmcm/strips_mclk_mmcm_stub.vhdl
-- Design      : strips_mclk_mmcm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity strips_mclk_mmcm is
  Port ( 
    MCLK_A : out STD_LOGIC;
    MCLK_B : out STD_LOGIC;
    MCLK_DIV4 : out STD_LOGIC;
    MCLK_MULT3 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    CLK15NS : in STD_LOGIC
  );

end strips_mclk_mmcm;

architecture stub of strips_mclk_mmcm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "MCLK_A,MCLK_B,MCLK_DIV4,MCLK_MULT3,reset,locked,CLK15NS";
begin
end;
