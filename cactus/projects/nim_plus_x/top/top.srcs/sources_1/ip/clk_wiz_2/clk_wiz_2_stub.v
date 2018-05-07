// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon May  7 13:07:14 2018
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode synth_stub
//               /home/rrivera/Desktop/nim_plus_x/top/top.srcs/sources_1/ip/clk_wiz_2/clk_wiz_2_stub.v
// Design      : clk_wiz_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_2(clk_39_in, clk_39_adj, psclk, psen, psincdec, psdone, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_39_in,clk_39_adj,psclk,psen,psincdec,psdone,reset,locked" */;
  input clk_39_in;
  output clk_39_adj;
  input psclk;
  input psen;
  input psincdec;
  output psdone;
  input reset;
  output locked;
endmodule
