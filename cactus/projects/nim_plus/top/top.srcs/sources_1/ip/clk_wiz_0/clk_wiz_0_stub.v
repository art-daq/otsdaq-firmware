// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu May  2 11:03:14 2019
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode synth_stub
//               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(MASTER_CLK, clkout160, clkout40, clkout53, clkout26, clkout13, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="MASTER_CLK,clkout160,clkout40,clkout53,clkout26,clkout13,reset,locked" */;
  input MASTER_CLK;
  output clkout160;
  output clkout40;
  output clkout53;
  output clkout26;
  output clkout13;
  input reset;
  output locked;
endmodule
