// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module NIM_CLKS(MASTER_CLK, clk_out0, reset, locked);
  input MASTER_CLK;
  output clk_out0;
  input reset;
  output locked;
endmodule
