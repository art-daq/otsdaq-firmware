// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Wed Dec 22 10:08:12 2021
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/trigbuf/trigbuf_stub.v
// Design      : trigbuf
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *)
module trigbuf(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[7:0],dina[3:0],clkb,addrb[7:0],doutb[3:0]" */;
  input clka;
  input [0:0]wea;
  input [7:0]addra;
  input [3:0]dina;
  input clkb;
  input [7:0]addrb;
  output [3:0]doutb;
endmodule
