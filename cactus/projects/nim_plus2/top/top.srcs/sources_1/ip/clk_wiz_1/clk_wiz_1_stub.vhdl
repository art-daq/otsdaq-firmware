-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Thu May 23 15:30:00 2019
-- Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.vhdl
-- Design      : clk_wiz_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_1 is
  Port ( 
    clk_in_external53 : in STD_LOGIC;
    clk_out_external160 : out STD_LOGIC;
    clk_out_external13 : out STD_LOGIC;
    clk_out_external6 : out STD_LOGIC;
    clk_out_external40 : out STD_LOGIC;
    clk_out_external53 : out STD_LOGIC;
    clk_out_external26 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );

end clk_wiz_1;

architecture stub of clk_wiz_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in_external53,clk_out_external160,clk_out_external13,clk_out_external6,clk_out_external40,clk_out_external53,clk_out_external26,reset,locked";
begin
end;
