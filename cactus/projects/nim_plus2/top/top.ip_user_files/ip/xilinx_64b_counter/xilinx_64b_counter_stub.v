// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Oct 29 15:23:17 2020
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /data/rrivera/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/xilinx_64b_counter/xilinx_64b_counter_stub.v
// Design      : xilinx_64b_counter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *)
module xilinx_64b_counter(CLK, CE, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SCLR,Q[63:0]" */;
  input CLK;
  input CE;
  input SCLR;
  output [63:0]Q;
endmodule
