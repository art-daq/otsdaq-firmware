-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Thu Jan 17 12:38:08 2019
-- Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_stub.vhdl
-- Design      : NIM_CLKS
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NIM_CLKS is
  Port ( 
    MASTER_CLK : in STD_LOGIC;
    clk_out0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC
  );

end NIM_CLKS;

architecture stub of NIM_CLKS is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "MASTER_CLK,clk_out0,reset,locked";
begin
end;
