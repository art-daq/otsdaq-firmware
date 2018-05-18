// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0,Vivado 2015.2" *)
module xilinx_64b_counter(CLK, CE, SCLR, Q);
  input CLK;
  input CE;
  input SCLR;
  output [63:0]Q;
endmodule
