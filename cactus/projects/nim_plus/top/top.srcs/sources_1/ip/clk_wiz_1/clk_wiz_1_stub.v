// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon May 13 11:04:47 2019
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode synth_stub
//               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.v
// Design      : clk_wiz_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_1(clk_in_external53, clk_out_external160, clk_out_external13, clk_out_external6, clk_out_external40, clk_out_external53, clk_out_external26, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in_external53,clk_out_external160,clk_out_external13,clk_out_external6,clk_out_external40,clk_out_external53,clk_out_external26,reset,locked" */;
  input clk_in_external53;
  output clk_out_external160;
  output clk_out_external13;
  output clk_out_external6;
  output clk_out_external40;
  output clk_out_external53;
  output clk_out_external26;
  input reset;
  output locked;
endmodule
