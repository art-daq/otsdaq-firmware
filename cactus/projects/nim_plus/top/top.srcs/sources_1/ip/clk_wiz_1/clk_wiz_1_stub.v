// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue Jan 30 13:52:58 2018
// Host        : rulinux04.dhcp.fnal.gov running 64-bit Scientific Linux release 7.2 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /home/cmstestbeam/ots/otsdaq-firmware/cactus/projects/nim_plus/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.v
// Design      : clk_wiz_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_1(clk_in40e, clk_out320e, clk_out40e, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in40e,clk_out320e,clk_out40e,reset,locked" */;
  input clk_in40e;
  output clk_out320e;
  output clk_out40e;
  input reset;
  output locked;
endmodule
