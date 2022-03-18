// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Oct 29 15:23:11 2020
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /data/rrivera/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/clk_wiz_internalClocks/clk_wiz_internalClocks_stub.v
// Design      : clk_wiz_internalClocks
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_internalClocks(clk_out_internal160, clk_out_internal13, 
  clk_out_internal6, clk_out_internal26, reset, locked, clk_in_internal40)
/* synthesis syn_black_box black_box_pad_pin="clk_out_internal160,clk_out_internal13,clk_out_internal6,clk_out_internal26,reset,locked,clk_in_internal40" */;
  output clk_out_internal160;
  output clk_out_internal13;
  output clk_out_internal6;
  output clk_out_internal26;
  input reset;
  output locked;
  input clk_in_internal40;
endmodule
