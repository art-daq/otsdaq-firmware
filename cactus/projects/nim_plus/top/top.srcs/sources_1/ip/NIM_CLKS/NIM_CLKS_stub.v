// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Fri Jun 23 10:09:21 2017
// Host        : CD-129671 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/nimPlus_CAPTAN_+_Artix_160/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_stub.v
// Design      : NIM_CLKS
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
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
