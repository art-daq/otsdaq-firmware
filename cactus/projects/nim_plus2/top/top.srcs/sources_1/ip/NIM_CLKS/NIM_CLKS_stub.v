// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu Jan 23 16:12:58 2020
// Host        : CD-129669 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/bhawks/Documents/Vivado
//               Projects/nim_plus2/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_stub.v}
// Design      : NIM_CLKS
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module NIM_CLKS(MASTER_CLK, clk_out_dac125, clk_out_internal40, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="MASTER_CLK,clk_out_dac125,clk_out_internal40,reset,locked" */;
  input MASTER_CLK;
  output clk_out_dac125;
  output clk_out_internal40;
  input reset;
  output locked;
endmodule
