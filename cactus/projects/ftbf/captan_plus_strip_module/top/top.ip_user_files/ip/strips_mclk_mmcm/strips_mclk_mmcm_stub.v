// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Wed Dec 22 10:04:57 2021
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/strips_mclk_mmcm/strips_mclk_mmcm_stub.v
// Design      : strips_mclk_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module strips_mclk_mmcm(MCLK_A, MCLK_B, MCLK_DIV4, MCLK_MULT3, reset, 
  locked, CLK15NS)
/* synthesis syn_black_box black_box_pad_pin="MCLK_A,MCLK_B,MCLK_DIV4,MCLK_MULT3,reset,locked,CLK15NS" */;
  output MCLK_A;
  output MCLK_B;
  output MCLK_DIV4;
  output MCLK_MULT3;
  input reset;
  output locked;
  input CLK15NS;
endmodule
