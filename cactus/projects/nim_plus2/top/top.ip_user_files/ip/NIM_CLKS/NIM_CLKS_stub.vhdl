-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Thu Oct 29 15:23:08 2020
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /data/rrivera/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_stub.vhdl
-- Design      : NIM_CLKS
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NIM_CLKS is
  Port ( 
    clk_out_dac125 : out STD_LOGIC;
    clk_out_internal40 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    MASTER_CLK : in STD_LOGIC
  );

end NIM_CLKS;

architecture stub of NIM_CLKS is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out_dac125,clk_out_internal40,reset,locked,MASTER_CLK";
begin
end;
