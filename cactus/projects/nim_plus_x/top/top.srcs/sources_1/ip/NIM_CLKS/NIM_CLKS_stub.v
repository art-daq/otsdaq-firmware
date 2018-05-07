// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon May  7 13:07:04 2018
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode synth_stub
//               /home/rrivera/Desktop/nim_plus_x/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_stub.v
// Design      : NIM_CLKS
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module NIM_CLKS(MASTER_CLK, clk_out0, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="MASTER_CLK,clk_out0,reset,locked" */;
  input MASTER_CLK;
  output clk_out0;
  input reset;
  output locked;
endmodule
