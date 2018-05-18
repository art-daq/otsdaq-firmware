// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_1(clk_in40e, clk_out320e, clk_out265, clk_out1325, clk_out53, reset, locked);
  input clk_in40e;
  output clk_out320e;
  output clk_out265;
  output clk_out1325;
  output clk_out53;
  input reset;
  output locked;
endmodule
