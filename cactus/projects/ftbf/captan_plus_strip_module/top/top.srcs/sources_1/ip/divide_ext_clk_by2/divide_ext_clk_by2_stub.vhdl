-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Tue Jan 25 13:37:41 2022
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/divide_ext_clk_by2/divide_ext_clk_by2_stub.vhdl
-- Design      : divide_ext_clk_by2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divide_ext_clk_by2 is
  Port ( 
    ext_clk_by2 : out STD_LOGIC;
    locked : out STD_LOGIC;
    ext_clk : in STD_LOGIC
  );

end divide_ext_clk_by2;

architecture stub of divide_ext_clk_by2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ext_clk_by2,locked,ext_clk";
begin
end;
