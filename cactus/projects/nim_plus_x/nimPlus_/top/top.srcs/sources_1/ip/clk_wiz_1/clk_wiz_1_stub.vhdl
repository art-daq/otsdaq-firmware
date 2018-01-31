-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Tue Jan 30 15:28:53 2018
-- Host        : rulinux04.dhcp.fnal.gov running 64-bit Scientific Linux release 7.2 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/cmstestbeam/ots/otsdaq-firmware/cactus/projects/nim_plus_x/nimPlus_nov16_2017_t0923/nimPlus_/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.vhdl
-- Design      : clk_wiz_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_1 is
  Port ( 
    clk_in40e : in STD_LOGIC;
    clk_out320e : out STD_LOGIC;
    clk_out265 : out STD_LOGIC;
    clk_out1325 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );

end clk_wiz_1;

architecture stub of clk_wiz_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in40e,clk_out320e,clk_out265,clk_out1325,reset,locked";
begin
end;
