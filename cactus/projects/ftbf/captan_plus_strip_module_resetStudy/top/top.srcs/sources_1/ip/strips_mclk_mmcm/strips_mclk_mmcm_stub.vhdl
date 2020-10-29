-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Tue Feb 25 16:04:18 2020
-- Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/strips_mclk_mmcm/strips_mclk_mmcm_stub.vhdl
-- Design      : strips_mclk_mmcm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity strips_mclk_mmcm is
  Port ( 
    CLK15NS : in STD_LOGIC;
    MCLK_A : out STD_LOGIC;
    MCLK_B : out STD_LOGIC;
    MCLK_DIV4 : out STD_LOGIC;
    MCLK_MULT3 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );

end strips_mclk_mmcm;

architecture stub of strips_mclk_mmcm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK15NS,MCLK_A,MCLK_B,MCLK_DIV4,MCLK_MULT3,reset,locked";
begin
end;
