// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Wed Jan 24 22:04:04 2018
// Host        : rulinux04.dhcp.fnal.gov running 64-bit Scientific Linux release 7.2 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /home/cmstestbeam/NIMPlus/nimPlus_/nimPlus_nov16_2017_t0923/nimPlus_/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(MASTER_CLK, clkout320, clkout40, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="MASTER_CLK,clkout320,clkout40,reset,locked" */;
  input MASTER_CLK;
  output clkout320;
  output clkout40;
  input reset;
  output locked;
endmodule
