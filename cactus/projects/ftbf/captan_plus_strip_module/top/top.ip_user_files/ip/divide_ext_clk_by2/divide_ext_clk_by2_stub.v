// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Jan 25 13:37:41 2022
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/divide_ext_clk_by2/divide_ext_clk_by2_stub.v
// Design      : divide_ext_clk_by2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module divide_ext_clk_by2(ext_clk_by2, locked, ext_clk)
/* synthesis syn_black_box black_box_pad_pin="ext_clk_by2,locked,ext_clk" */;
  output ext_clk_by2;
  output locked;
  input ext_clk;
endmodule
