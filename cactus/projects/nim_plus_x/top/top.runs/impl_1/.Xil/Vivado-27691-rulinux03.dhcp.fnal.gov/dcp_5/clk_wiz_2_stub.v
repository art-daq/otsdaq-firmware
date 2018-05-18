// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_2(clk_39_in, clk_39_adj, psclk, psen, psincdec, psdone, reset, locked);
  input clk_39_in;
  output clk_39_adj;
  input psclk;
  input psen;
  input psincdec;
  output psdone;
  input reset;
  output locked;
endmodule
