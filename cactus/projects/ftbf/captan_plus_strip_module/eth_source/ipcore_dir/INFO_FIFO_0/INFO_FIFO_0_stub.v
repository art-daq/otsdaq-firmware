// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Mon Mar 18 22:16:28 2019
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode synth_stub
//               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/ftbf/kc705_strip_module/eth_source/ipcore_dir/INFO_FIFO_0/INFO_FIFO_0_stub.v
// Design      : INFO_FIFO_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v12_0,Vivado 2015.2" *)
module INFO_FIFO_0(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[15:0],wr_en,rd_en,dout[15:0],full,empty" */;
  input clk;
  input srst;
  input [15:0]din;
  input wr_en;
  input rd_en;
  output [15:0]dout;
  output full;
  output empty;
endmodule
