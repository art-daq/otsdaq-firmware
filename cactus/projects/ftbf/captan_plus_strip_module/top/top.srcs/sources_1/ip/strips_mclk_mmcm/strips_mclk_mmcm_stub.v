// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Fri Nov  1 11:27:12 2019
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode synth_stub
//               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/strips_mclk_mmcm/strips_mclk_mmcm_stub.v
// Design      : strips_mclk_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module strips_mclk_mmcm(CLK15NS, MCLK_A, MCLK_B, MCLK_DIV4, MCLK_MULT3, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="CLK15NS,MCLK_A,MCLK_B,MCLK_DIV4,MCLK_MULT3,reset,locked" */;
  input CLK15NS;
  output MCLK_A;
  output MCLK_B;
  output MCLK_DIV4;
  output MCLK_MULT3;
  input reset;
  output locked;
endmodule
