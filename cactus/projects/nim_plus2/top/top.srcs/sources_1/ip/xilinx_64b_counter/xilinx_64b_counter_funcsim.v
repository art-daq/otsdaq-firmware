// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu Jan 17 12:38:08 2019
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode funcsim
//               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/xilinx_64b_counter/xilinx_64b_counter_funcsim.v
// Design      : xilinx_64b_counter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xilinx_64b_counter,c_counter_binary_v12_0,{}" *) (* core_generation_info = "xilinx_64b_counter,c_counter_binary_v12_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_counter_binary,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_IMPLEMENTATION=0,C_VERBOSITY=0,C_XDEVICEFAMILY=artix7,C_WIDTH=64,C_HAS_CE=1,C_HAS_SCLR=1,C_RESTRICT_COUNT=0,C_COUNT_TO=1,C_COUNT_BY=1,C_COUNT_MODE=0,C_THRESH0_VALUE=1,C_CE_OVERRIDES_SYNC=0,C_HAS_THRESH0=0,C_HAS_LOAD=0,C_LOAD_LOW=0,C_LATENCY=1,C_FB_LATENCY=0,C_AINIT_VAL=0,C_SINIT_VAL=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_counter_binary_v12_0,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module xilinx_64b_counter
   (CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [63:0]Q;

  wire CE;
  wire CLK;
  wire [63:0]Q;
  wire SCLR;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "64" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* DONT_TOUCH *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xilinx_64b_counter_c_counter_binary_v12_0 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "64" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xilinx_64b_counter_c_counter_binary_v12_0
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [63:0]L;
  output THRESH0;
  output [63:0]Q;

  wire CE;
  wire CLK;
  wire [63:0]L;
  wire LOAD;
  wire [63:0]Q;
  wire SCLR;
  wire SINIT;
  wire SSET;
  wire THRESH0;
  wire UP;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "64" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xilinx_64b_counter_c_counter_binary_v12_0_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L(L),
        .LOAD(LOAD),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET),
        .THRESH0(THRESH0),
        .UP(UP));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
RIH7qsBBHwoQQr4uJdig7ZhkeViZ272OcGLYhCD7ao94CeVmTsSBS7T7CxVEuCfmI0rqjJYyOdH9
TrRT06UhzquuYpa5kKYbw7HtzudzGOenP6niAnssukNkqT8X78zfPXU1hBhUD9RU9wr/aC/B++6f
ermfVcZBmgxAKC4UrA1dBnU61sD0xamcAP7PEAV8z7Xw01jWno6NgpjC2KHNUPPBq+9BPbxSUtL8
9XogJb7tP0Kjz0J6YfLcY0PBeGjaiVqdtIdeic1aSUdGTwPnKSzsudAoiDz9oykGP816qggPXnq6
NqZkS5bIUnONsjSGM400oCWeBM1gTgqTY5P+/w==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
QI1gV7+ba8mhJWGP/kfq/ffukGMpWF5cjNVmAVRgNPfs9huZbkFqwj1+xahnsfdj2BqTJWtpQ+Sx
jagD/ouWfs2DRL+NaOuOe2IoquhMFxEFS2aEiXp9xefHGCbcxPixepZrlSvS4WzpN9V4dQ2W3yLS
o/Ot5G3eRP14+QsUUmivcv3I0lauqML9Mu7MZC3HJlLMKzsAs1FPWvHlxy7syZAYuQ8L7MrzV5+V
T/otFgODquCLyRzqRdD0Jz4u4pJ2+49wfjeaXBZus+ig9BSl+srDN03zox5ZmJUZf6UPXBpNebwj
pPXB5keuZPnT8rNpB+BPRbE/KdU9gDhz/e7ddA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 24992)
`pragma protect data_block
bAI1Z95U5j3wE84TeGpgzV4OqqUgYII35PfjksQ5B1zoCsFTfLjk4cGgFF8xzvO/nzg4D321NTwp
nRwyYIgox49YgiZ6GCQb66daTD+63zqQpRT84i30+1ATnSBtrZTMgwN4O+Nmp80nDjw0/EDyxQPO
jG1A6ELFaX3by9jA7ksVUuSIRzG0oZnazB8Qn3E1rUQZtInsNCy6mrOhzwIiEFMaHUIc1DoNMuCp
t7JosPTDZKdWFdsHdDxrU2/3AW51VeGG48VZ7XEPdfs+zLfNARrQw6MEo2gbfAp/uCOK42dLrjBH
WZ1hVNcmUlrQ02YZooOj2XB68Flsi8+QAcfl8P/DcTQ9tVM9FQ39wMDU/wGtpg1UE4lIJo/bSW+2
UOGIdjUWjcMb9BYe2IsIZcnKtxgovFp8y/IlIekoLgyIPtp8EKWZdBrgcTuWs1tHAe5LrXhetCgI
ZggdUAJGHh04AlMwI3K77aId5i1iXFQrXXpnRdYPy2Wue5QjbMYGg7tcOxeLfG82o4850NFBhWie
l6ma/q5Bq6jJQ0w31bccxh98Dv8cLv0ScsoV7hIfiXZoQXWhfof1kB3bmuFExYQlZwyUvz2ANRoA
d0bYwcn+XKlfAu8ju5lk+MstAnMLPSGe+fnqZTrGDcpIqPWjs7wrRWmsSaRv6ZLnsz80vqW54j4r
/5AixTdgFroaffhmmpefxV6dvIwgth6+pElgh0AGw/K4Fbv6ZrTsdUwxjSsNZYmDFR+o88Akvm2a
lUu76cPD2dQ4ns2viTbPtOrXZAs/GdnI0j6DTJ4tQrpsM7ejxRO8xrxK3XCs4NJgb8dCYZBA9E5v
rkCaxM/8+kAG3piCHoFayYGK3jOjq1/SFL3U9yfeoPKs8RWHM4dm2DC1JDeVx5yRYxtM/kYogU2i
EwH/Q+YgPfqdPFDzKiKXu9rMc3yL7RBVIIHSV7I47tfOhTeeSyHdRdySLcvQbPOiKJA8Vdw8erHZ
NI9xAq5CKWyIAIbOPOdObp4uQz6vq1BhU7xcOMpIVAly4iEhmyGH/WGIpVf168nC9GV63YwEuVFN
N6siQ1/KEowfc4BvHVxeIdckEsgTecUsslKU83I+CD7cGF3cTtHm1q50sKbqC/nXikTpXUf402YO
8hOsHo69x9sVV3bcQdKIL44KjPTMpiNNVJGRhnxJJbwlFLDagEduUwXoN87MWagxedgUSXvmgw7U
mJKX8S1OtEwStfTVd6BfGmZ7cUHQiKX4AXf7oHxkccZCqh5AwcEuaZQtDBe+vGoJ+zF9padsGVRG
RlpLjeV9bCkuGqeUwLaF0g82FsFCqf+TLTzut5q0aqpNjby0my3jcUibX5hZbKJcpwhqu2ERrrkp
xjsoNS/+gRUJNjyBnRgaqX08ShGd+6zBSLLIIWwN95C3DlFkJFjpBQlZ8JQincrvY9/uL34UL/KF
9mQ2exfDZCKwhjeN0Fdpb8kZaK+qyQ0eeeOzRy4+QECw+uWcpOHryTlzQ/c9EChRrSgZA6rpdomc
TYv++xRRiVj6FFh2QT108DbM4mpWi56BGtjH2tQKbYs+lTqMcnac+UK8TY8XdAdFm+Zl9y9KCBj4
ewEvLFFRt08+oYfSMTbAA8QzRCUcKbsKjqAX7x0Oe0uLYyO9bwIHDFXYhXwcNKHhxyxV8yMMYnuo
u5itKzEjkiuFJruoFvu7zT8PbNRqoKHS9kqzrzhD9tiVskKz+Df2fs8Z5cHvsXTlUjIpGG8MrXcf
bUtB/Sm/UfpGmxp6mfo3jnA+dgx87DnlEFSHKs8JYT1CyObPR4JRmNkwZqf/qae/3Nn5GZl2T7hN
xK/01T501I5kljYRtErH+viAzSPrL4PqXMZyfDIn5rGgWoPmUqQ53jHKCgooy0eLes1DXoVhoivM
aV8Kf6wRVTRMzkJ688pLaaZ9Ihuua7P9eKC+Ya7UoPyzyP+eQgILPGJxmJ30+dE44KGOv2HJ6rG/
WkUtzH6+WVQ8dwqrl095O9fKImHa7e9R60ib969d4xLYb8qQ7W84qCI8s40hlCzfBadMrH/OnGP2
EP8JLu8sgUCf5zN8xHQ13O8iC8exBDdJaH36jnbBrxLS6Dzx50pia5AMJSSUv4G2iqnRHHsuKXLV
P0wYkCLi8dFo0a0tBQbZcrVj96nw+mRQt7C1PlRZ+UkKlAzjHj/0o5/aHltV1X9LUzv/CK5qDEgq
Ws4hLfDdppvUUH9hxKaS8vJlf9PqtEWAGQ2GTdkIXN+fiRb9QeN34q9GqWhK+Fjo8AN8c9UpOlms
ic1IScLPqmjMsZmMajVrCDYdEQ0hSOK72XAe6MHJ2ASfBVivM2Ajzu/kTU8n4m9L8+bsygTAvp6j
S6uBvAvcw+HuuIOxm5FKEnupkhB6Bso9/HkmpZqwALL4avnHWAdk9zRxCLmiyFRqijgG/wwnYUMw
WX5SmiNM3BQE84LPDEpbfDkgqaUopEVicMm1auP7yCWyl04DdW6GMLfKswCAUJ2QWgXSlverUxgR
9yNZUoFqpQ+g86Bv2LrRcf+ecQ+brkR4i+lm1sRdPBn9t2h2IgXtfUH872N0xkWnDjlfU3gu12/3
77/0SruR5YTCMHpa4+IGFc88kxhBw6lTcujQOoWstg7FW1E9PTY42LG4RxmraZ56T6sifdOTuV7j
ArSjpZlNUbwVnR+r/mOgL8WPakvtq6umtCJMGN7p7E/jqlWMDV7geDaRBqNgkIj4UzFDVwujBqzq
7Q1vHx6PYcfI31YcSkMqZxDvhdbEHaTu7cpnXPEH25+Z+ohZRbVsEIMjgEfSy0U0l5UjznS7MHdj
hWMv70o91Y7SHurlL+2+YIpkVTdyS7Ez+XtOmuTGYPklfPwtJCtybdSmABUhiIs06FWFFMIqNlcz
qZR2DZTAp1kD9lZZ7iYxC/3+qASWLJlI9M5b4FB7qO0yAG9Jtqx8+Dfteqsnhi3d3wAKzjagFWGW
Cpap8xNGq2SHK5TgWramXyyrztXjrO7WLzhUm5pkGw4np+fWkMzt7Xx/pr168KUf5GSctI/QaGJx
DDxnwc6UOXiMDoBrJ4bsaZitODJ4Cys5BNGZlwf3xDIGuBAb40aFwSZJRwjBc+Malv+1FGL/ldlk
9ul4DOt8H2gD5OzUZDo1RT8iLY9IYaAdQ1qLjudnU9AIhb2vz7nYNZmqPUyKchHjL+7kv4Md7Xmf
SKptYUmu6wCywr9Fi7/Bm2xr8aiZ1eFpp+ylWx7Q+AfUvPbsCNvnQaNUGsu9oylMQMrFv9ZAo7RO
KGIKFAAfFm2lZvSy1L3QRpjRZ4vuIt/SNg6PaVxeYzMxwyn/T//d88Fy4C6TKRsVbPftEh2EBkDH
pvlMfxwg1uMU7IYIPRJDt0uA9SecEbQ+7KX5BuJmvu34UTuyKKGvzqsTg0fW1hReCFI6gr4Y5s8m
M9rPsDvQNzwwyx+AdlhalJUgAfGDtnPqSk6sCsQdFKCRarOyhvTbSkbIYoOfKa7PR2M8FWINXPQ4
6qnewPtoPOueOXOf/utZ4v+0N7RLUluZRBHEtdw/Q4JAs82nonWBC+SyXqzB95I7mWlZxhk2GVGE
8rJA4srXZUGkrL0pVujGB3II0rS6KJsgQvTt95y4ty8rMY6wW1Xm1e1jZ2tC7nDR3qI1lmhwwzDt
N7JmXbx6GIIDHmFybKwCvqgK2vRVfKLR5NE8fPP/kmC2TGrRAUpQvrUWbFVeUkfdtCjDHca6hkpb
s6ByqRz2Y/Scec8V097Jv+ipariyf3Q0qHAo2u81ocBkVDHI6TjDuJOiOdKTGv0z+EKrMeexU1Og
Epwo6n3nWbCyhuzFkYxxBhAiLwtlU7Wf8WUrLkExOURqkiNMmhzXBpnEzlyOM2hWWszc/cGibWAO
w5Jm+xyUzaDGuRLjKJ5rAnVwiY6ouApoes81tvKMZaeZ4NfPkC9MhvieEPUokImXfwnvUABDYAI2
RC6vYef9tUcMQKJm2+xqd6ZQ+HYlPhGoKmLieogENLr6vk0pA1vEMxzqwdHln7gVsvdC3pRgeIU8
bOTN8tqufjSYytzBEinFmerCh1RHuIFzMBL+OJiF2UC7EBA5mHr4iHrgqc+rdt+J+kMs1eNGhcoU
Lhl3B37WFLfVEWLmAHLAdZZwek2nHpPBUFujiuJYZOrWlEiKc+bXjlRFj+7GS/C+Nq7vVn0oUAjO
xGAWJ7GzjELXB7hguejZHJJLuA0/QrhMILKRHbymHItShweSmHdf56XNjRsWSGkS8bRSEiF8OC2L
J47NA237NPqF9fNS3nXW4s5pmkjiPInHXyoD9Vt1WRDI2j/oUxZ9VY5fZRBHSuSKiOB4jPz8uZIl
fhzlS+z9KE+RJ/ixqfA2vtMaabff4oNBpvX9pcpDHua2WUWLtUSRxAYtFY8hTLOE6e+7CZerklCE
9VMYeVAceaKUTNy7njeNxMaPq1J1xsQ7kMr6OKLZEsUPmfClVlV8QJmw6yPcdL4U/i6rRo7/K0CJ
OLmTKj2+VubiJdHJBngvOMoSapaJAVZYFxCUH+plgR845IiG3zdFko7CtCGbwgsEK/iQfjieBURk
kqVyDw5nKeHmj6TJiOhMlWTVD2HIUK+PS98dqG4ZUM/+I+F7Q7qQkQO33stSK/OWavuXmGhpZzbN
Yuiy6yaitB/w/lx86Rx2fCUqCiKWnxIhuuNT7Bj/X6xmmpp6rrv6cWAa9rgRc6OyNeeyPMFQQfFx
mQARTlb8wdA7fZ5Y3vd2ZacJ7nXezWYw1l60oO7wPFuLeGw6xoaKPR7BZ/tqF3zR18iJyu82RYLE
W7vxW6+SZhoZ928sfAUMLe/dLjNWnG2sHtkx344K6wxEjCU6qyLDqsP/UyOcUeV7YpsyzrYdxYnI
/1QFNZkwrVycxCprMI3gYHBdBHyZetywgv569jAokk7kAAVB1a9XZwiyIlDRcN/266RFFBuPiKXe
lliNu+2zvnmOwQHOLjK/M+T1DRJ4ANIgliVs1KV8xvOpNlsh9bNQuAuMmlrD6GFJHD5jmI8Ia8rZ
c+ylDUNIrspDiwynd7JfXnbJH8HQb6xUVTn7pBw420UaOxLcAc2oO+W4SqQDEwwoY3/dkPzuo5iW
o4/NgQV3NmDaDKuBRJUfa5deLPdoOJlG/C2mMfB5690PEWSfl76rdR1mWm4WLQt3GZRlCjIqUdB6
tfdQkA70IkLL5N1arItWl4uaQVpORNAtKCeIsUn+wVDQZkDxcxEQ6P8pk5Z9W1LXtKTjMlwfhlL/
SgeF8ktB5iQ70UIhbLYNuw6gfny33kEoZ/drwqZ7gtbf+jzsEzYWbzKH839Fxo5/KhrH7FHArVBF
o0O/5LmdaixWvrWDrS87TsCn5OrOCHxHH6IpGO7lvy1k0k1R3O3sT5nnkRPXP0/ccR/kk++iVvjm
LoE22+4vGK3okxjdtDz7UoPS/QnJ1KJQs05/AqxE9fMahfb7Wy9sUVmNO8tx2FBCLr7o8JK3yCi+
5xNc0dijYZL+jKyEuvUSYp76sv4YH5SVNu0/AUWkGxtoWbVBtkhc2EyzBEj5VlAEbt/F7xiHZagc
80f78HMAa8PyoF7yf7N5Fwl3RY978ihJFNEnV4SgjepzpyorWbCZmNPI33hBGOeXaBxGTWo/kvNT
wVG43fT38/KhcDdGsljNuBZXWEMmUdbrZvo37cOm1QNJxvCUEgNasLstAI23Fp1wWqHZtxRRk/bE
HiyzubWvfWswQQ2egjEAmIhFVCh9b1KKmV/5nFPLu6VaISfd2O+V8pa4Rcdg7IbUxWfV/UdXPaw2
Uw5xrIJ/WPuw4InKCpdx7XaX8F3WgtU0qvp2UA/Ir/aS2qKIZjL9OhPs5i8Iv/Amos+i3vLG3gCU
/NdZhy2uvKykFrWx7LCsLtGOgrWbiYoDqGy5GarPoP3LRfhf17lOrDyXXqUD1f7Fzf2MugAQOQB7
KulmeWQoxKc/MZuJlJn++GCG/hanPJoBNhb6J5XoaRuJ1Xwb8KlBk65zbuSZiZk71ByYUjt8HJde
8BpxxA/KPOldRDU690Rxa6+jeClUMZNRc4nGPoG/lYMAPy9a5WWJThra8Ih6gOwfGqXsRY9uKziW
grNCvD9ty4OHNSnbPShoxaMloJA8zDap98P1VATmiD4CqLCWUQN4fNOatgiadNzYyBRu4zGdQKpS
HV9g3DrmmN+0s6tV964EFSwsMtFt+y4635QZx/w/BVe1NsUz+MBTCZGfnQME7Zoj8gsR08TnWLvu
YIsO1qa+Z0n20RAkZ+ke2r1ZL74mmJiIjG7XXMUGrqN4TlBvTMc00UYMAoBNcm6WN5cHBooYjlbY
AFLj8cLotTY0iUhJWqnZl1kwn3weCrqEF2XYFTsYW3h+kF39O4ILWLSb51kWL1YJcHCLB3oIKa63
jZSbivD3QtbpXVHDQnHiN7ezgqWUABrw8qIjzb2qq+dPyNfZeqa5VK9eMxnqY3T+xgD2zYrSViDn
TnV9KBQ4AZ6oU2NLIOayQvaX8VxJqkjoTWE+xDgGuxlDa0Yvyy0tI4trPgJ4zhHi/UMlHyGLGW0g
Z5vLMC/0Bk0SYoRdKn6xosfcC01WAQiB/khoZBXaBJZRcEy/innbvT9BTDzJ7uhC//pgVnTfuGaG
Q5RwwkPF8zcVLJp39+dfOGdRkELmyuQbPdDUJrxTsg+nmwWHM5Ip9lXaAxLYpKld4RrfI7VzIzSQ
GUBmtW+pZ9ySjXJhJ2xtyYQ5FmmrkMF/CLpMSnxnuajcGCZZI4NmkAqNVxu7oxudz2WCDA9GAXz1
bepemJGpzorZZ2Hf1xiOE4uCtQImLt5rWCUQcQAOAli5f+e4c6+Jj/1voIY2hmwmhRyBFVrNGqUI
QLQfSJeYFDvu9tSR7cix1qR2NiX2aL80xg9LlSWXc6XQ8mVo3NIe104lvjMgudWEmGGlH4vMvnJJ
OsH1fktO6aAmPbQICztn7gFla40he9B0SkaEKGbbTyHpGhCx0uHUNvNwlWljQcrhWEPlwY0SwEqE
gLlkIDF/qCjkYS1vij28OulweEeRo80Tvl0RRKTMBY8uj7V3AwUCDwZYXNW50g3pyM7+iCL3Zp1c
fFfdx9fxj+5kXUfo73aoAwQmIWHpW70z9q0U/MUqdNEVzDfaLGEWHWUIbFaunmTSqngS0vD7aK/C
jE6cYScP8iDlu4WcI/ARbrwJ9cbAvsNgov8iDTthYCwLmY3BZ2zHScu8RNk/q5YsRvW3m+5PPnzC
RFgtoHOLzLJSrpduLx0DAYt+GyLLJSiAsvbVFsqxr7LP/YxIYckoUR0U1YmejroPRJ1cKw2cUWNO
lUSj5tzYhW4F4zqFAaCt28E3ue6rH7naGqJZ/1fK7m/x3hQiNBh+QMl/W+bMfEIgvmMdYo3vZ1yx
Byh7w5SMXl2ETc90DEQetpzFueZE9o78n/rXk0exuxYsaYVE3JT1KgMPOiZ68rZ/SSzu50dVffNG
nmXrkTzqoWRCqJ5ZrUa/kBxzSZD/5BylGna13PQeG/M+/SPhs/TKx7nBaqou1fRxOBhoQIUrgiym
SI05z/F04h64Tp1OIPY6orC2SRsM9kyqgoRjE98u36YBsrv7UvsqlKBIuj95C1nt8lDMC101N3tR
2tRc8jn6H/sSUdiSIz/j8qRFEiNx++GFjL6dPEQ65hFjHwq4AoRkuqJ+mKHGoUol5bCLWYszX2MB
KGrKvgiSWpgStcWXVuuQPcSU6QCK88Up6aDA/t2G3pj6Pt1SKC/EfnrTo+yCemonRIHP92ZlZVTV
2gtiI2RgrNTfE05hBpYg6firwOh5pIrTtnSfGFMQD8lwrzw0QLHx9cPk1OwxYA93TXg3umwbXYYb
gikEOoJF8lT7DyeYN04P2dec/q69Fr0TmBZ0JdNHFWMoSSKSrCAl5k+mouoc9H94U1LkLRnTSony
59UC5bjTwl+QK3Zkd8Fnzav6OJVT4naUhNjthHqqov9P7ZRjc8NP+JluVW3IRH+f/OQK2CXPuJxT
5dGOZ59UxnGXBNMZFkUo/ozNWB5JunAJ+CBV/3z8QZ4Ihip/7El2VaTdhC1YWthhO+xTJyXcB1oS
DKfBIqdZku8T0XL+6abaVCHkmsKJWkgS0Dxc0126Gh6Tw9O4vIav7VaO7wWK3ZFzsL1Nu+Gv0S/+
HOBgZ+tM2zvSvRhLV/s+Ejg1SefVxGoxmJIzjRXypIancWIElRB/XqlQbpdbb65JUZ7GntECnqOH
eFufs5hsgAifyvp4vtHvflVJntlSWm989yrl8unxP1GAPtG4DbebC5evuekWON9v9IpxNB5XRa3e
7xGJUAKH/wNGdKBpSurjq9zYuRABBgnBCJutyw4Uhxll8NeD8ecv+3e507CAnQYvVUgXbJ3NsiRu
fnCt29jSGn4KxwDvX5toZyawCb7NoTjHTaYlQ+R1Ls/1SkCJs1W7Qa8UdfNwz21MOZO6chTRmaqc
kJCP1NFhBb/Ol8Hf+UZ8SWtezMpO63fEQhpf5PIPbdE67IkGc25ezgrO0h8pTJZXlcTGYR14GnEX
hjGs3K/qNZg/XU8R4yVKbA3Pmp1U8yq3EYHWQeOAU/Mslux4PDKqenozggSYxqf7tXiCXFgFUun6
/3s2d+BitGjgNH8Ts5dcIVdxeWdiv9ogZsGf4PUV896jpBJ8tZwH/VdgomNJo93fEk1JQ0dAa2JW
l74A4f9PyMpYvgSu361TFkCOwzCJ7TC3DVtW2UfIIc7JNhaEneQAORgnN/dNrt3QZNfwGsubjQVh
PUJCBvThXzXqZoJ5mKC04JwbszVIX2VbbfpFm1mGixLCMBr9E/OY3drFoS1NPpJAjgJj5IPZfHGY
yKaLXf1K5ytPC7dXDcJaf7nMAZF5j1Wu4bmJQnrGNtCVJrLfYMOV8khHP4dhcyVW4ws5JRXfpw/+
FUJRfPb0I/cUl7UZyBo99RJDxjvHmtJXwrpqVkDFoQI4ihKU/MklaPdjZQa6FKI8S08a3CIXDwLv
taCEv5DG9hp2v19IXPXDav6IM618i5OGPBTA5RiMmdTTGcOvba70gab6PP+OnPj79OrKj16ueM2c
7xuRlP9TAbT4JxPEkRBaHbmd89IHHKoaexi535fraBwKdmiSslgUXgw1frTf1zblsgG2CiC6ZQOL
0u4b6t/0w0EUd66wgenl3GFGLal3HYr9CO8Rmk+IW2vaM9fmtUeYv3NK+IDLhJASf4p+zOZiHOyd
y7miHc4VHSzPQxa1iql0ba9J5SgbmTEZAgB7Pj1sn/OiDQdXtKqmR2u4us+TOhAgxZ9gM1iENKbU
APg9h7cbdRpT+ASzWpHpCdcASXme7+VVOGBLK0IJWYdcUdtBYgIE1Yi8LO8lWsEFZwOclHdOus5Q
4/sD6/rvdDMcOMjOJeN/BdBQ3juh1Y0PDKTspYmajGdFAKTIPsoMnJLoYVlXyNj4793dOhwndYWz
WSFckdt78KcbpUxfGuOWaT57r+dBvuQI+RNVObUoysw0TgV+9jHIaGbp1tocow3fp1N9bhjniYgu
oT9kGmKOzA+U3STMRTc28WKoMZ58NyCAj8kY/RC/5WWt3HT3UIlSnd9K2BQTCv8qolq2jGf2nWSl
8Q7VJS9D1zaJ3Ch4nBne7FzRL5R7voL2KVZ9SF3mNXhhoqqHO0iQAj6RRAPLqlSCjZzSf1t9Cmhk
Y6pEemXpbdPXeveM2ggSuLiv+Ee0cZJ8tad9rUmzUMqTMs9BwhULpY+uu1YGNFlhXwd0/WxcjhXi
FsCugISLhPg44zPG6orcC4dcZlHmkGE6pgrZs4sgDeKxcf22U0TOzw/yx8K0ERLk/1oVmL9EJ8m6
OP2noLWkjdWvu0uI7cf+NohGhkxDrnS+VMhPtyAik1mUNTUX8GpuPbqNMbJRv6cstdxxdu/gQqPd
E+LMilnduTlVuPtNfRmPLF2qM1tnstWOP03oBQNOm2sBDgvamhJi8s2NNg2IBaDz1lIyHIXErrOO
piLXXY/jMX6J8TaeLPCFNxi5XDPiRFcmvi+dWWKwiuahWl0i3es+/XCdvVuA89/8nhLdUllEMwtS
7pwXVD5euRuVjYvaSBFyA1ArtZzMaYVkwwqo5yOQNxqYjFy/4R4MObUjnlpAZrABydQoB3HMiR/b
iS43dGI0qGXtlpz1se0QDpv6bUfhx7DQSZiZopYOE2LZOxau2rA0ZKbvBS39hKOvb12i4Jq2C2bC
eF2Pr0VVyzz4xZI249pH0xp2b4QA1ufoQXmuy0pjJqP7whstYbEbvE9+vmsffWr6gAbAjdZ2t4i8
pFJw1/Joa1xjNg6VVna3iHnaC502oOmVrwdDEIJbmGx09pcI+s78lbMEA8SyI1glg56+WQ3XJSXv
Q1TmvjUcm/8v9SwC0ug+NGyhlqWLLq9DQKS5RAcVXDCM5br9jdZa6XmVVpX8ZAQB9/JNsDxYHD7f
T94oNgwffYfVw1r2VtqIkBYBRdcFiqx+KqsxmzUvQwR3Xbkf3hTow4FlwOFdJo+qRYJs0BsA0v2A
eTqONtxjRPSCpeuI0Jyo9O07ghODJkf6O+spIv+910M+XsxQ3zdG+PI7QovkuhDK8apABCK8jqf3
FKNfY21Cr3HK3JuhSwWKBF+l0H+qM/1+TbonWanVHrmtQOx1+6266dU7BYKEgMaNQULfSzxy7xDr
AT93D2nt7eV/Nj0FrU/KjdPIwWkEMf4ih1/jBQeyxcP4BddxGKX+8PI3KxFe2Xyb5+NO1bWXwntX
zRF3+72hnIjzQuvcoe8Fk7i/jcyggMxCumh987eWYREKBlA11j2ouyu0VPRa8zzv4fgtMDmR4pGn
zg5HBrRRJ0eicze3ivXeSDZ7SUULXoyIX4DaybdAXQcgmP8oIuvuw/mMYDyEMEGRMZea0H4ehF/w
Ahgjw1zhXBuJ7NkH62+nelEkr/ExHjDNKw52XRcXIpVCeSnCybD4IBSVGBeqN8omVzvxMuPRS1VL
hgKTB4OCT8f9l+bZNCkM7aszY7Yq/yEasvfba8GOlGoscjZta3gt9oJ2v9Vk0nsfUHR0QlcX1zUg
9gXFnRUDMKjgT5B0ST3B3B5UpxVhNnf0gX0AklY7hYND5OXWg9zDkNxhP7fakof4RAxeldMVc9V7
yOIDcrhSgq/DkGaVsO6CUM8+6FsddO2weUx+cNgx+VenjHbxEXyGZrIuB5mug7ML6oN86tfBNmOq
KMwpk58tCtGM3Xzv1s5ZKlat2S0FtIgt8JS6r17v7qypu8UHs4QryvCNEUxQb9oa9w+pTwq+RLsc
4lWzHyFCoh15Osv57545eOb6ls9bYfHxDYrsy0hkizmoh38C/ba88l6/1aFxJUMgdZab1HXTD3Dm
h22ZtMQ5otYprSIyEcmFDdNSrS4AyCWQbQHHdL6Mdop7rqrE2H0kIEmvHuK+V6wn0cKmNpBZnnCm
GiXEUNNE6vWxCiRg6K1mpvXENgWM3BVBtprjTq1ggMc604P6/Gsfyv+Pk9C8Z4s+SyQrUeN74sQr
810uxexogdy+MHMjYfmj8dP3qdg+07W4d5477lbtE17FX2hFtmq/TqH2+BsLzDAj0qYUrJjFi+9R
5AMMeG/YVbhVmwpNo0yugFzksVCg0vQJJYYWEUibJUUYdmkYBGoJNuy1Tf9Bv0LkpIkUZAmsmyLW
MCddyisPSlVQuGv4QZkEjHVcEBaeoyBNZEGjCRwv9fVqIQNszdy/yn6W5gkqWkF5YSh+7fzCFpjx
nrmWgojVeLZas8MtEBuNH5T4CkmEx2nUw/5ry1O8du/x3i9m2huQUckZ9yfjqS3yCHWplAbyDUvI
QOChj+4tS8r/pcAlUtjbysrgKN4e90uuZ2SIoW/tOtL5FvQMgODJtZXWVvDYE1hXx8uwdLVyjDI4
KNsBW4k+d5DT6RoO5OUcq5YD3q9JPucY5hhWb1RGTqSFjX1cGoxxZs2TJ50vj9UOL9nQKXzx4P5t
vwg+UGs3WNYewb2G7r7Q/zhnrJPg14/n1q08Tb9tCFcGb2ExPiXyLGvBXpMfo8tULzgyPtuNBBH1
YAHmiaXjy9o01HVc80V5LM8r4QwjDF3XwgDP1OrvLD3eYjNpEcMfox7jNljeoIvUSZOOyROeNcpc
pf45SjZKBF77QqgqLzS7mzVMOB06wJCM2Hb/gC2Y5ZVTxrANtbn1Mue64pZmUVE4PyCRcT5NvRre
sVlibNpgeNIC3GdN7e1I0HD6GMW81lHzqsiw7FyDrgUS9Tg2mZNUKo/qseJTeE7k5GpWMqKDlhTW
gvDf5XNjtuK+7UPw8wZtNV+SOkbXVyxgBkZPb9+nsuWW+lbZwm29vHpdweP7lC4MVsgOV4KM5R5Q
OMZ87gck7x4lq92mDhYRWyR0Pg8P2KieoZS4d+0DvJn3SRD/jqeBTubkFL2n7vUMfbhFUCYYN+3T
L+IHVepwkkxARZ14mdvim7qOjGoor0k/bDHs+zp+Z+O7ywXi1K63ENsfzcZaYiR4XSTYuuUkrtCl
oHh+VXLOf04Oh7HJGZ3QcctacfFspaQoTZqD6Jup54MmU949Ka5NV87gSP+tcuR6sFtp+rtjdyK+
Wjmfe5Grh8jmigTEPnSm1VXpsqU0EMsvC7HPVgkaljXxJ3spL8V8y1ZQ38tjd/Ehkl7ULhCem+gV
tPcNBrN6+aVUpMVf74SX46aRmtiSfwMOofbfGIb+IzAyQfkOYw7mvY0FjgVLMaeFZIU1Qdu6LtbV
tVpw6yyTN+LgeG6YCwkHJAUiQATB/ftAS0heykUQifq6yFYet8xMd6TPqdIIu66kxeBp8iL9ckLo
TJR+hWPCXsw0OWpOjOiJ1kHilE/5mtJ8hx30RO3MAowYe0/QllSbjivpFJutc3UBtG1Qqp8It/yj
fH6pHrlxMlBYIarXoTrxKzm6laSLajoh8a7wvL1+Cu6Izl6Kvh0BgkcljIwR1Ds52VXEmHufB5kK
AOfBDoFXm7oi5VtPoFsW80ScUeyd12oGgIm3AOlDDrhObzOTsJLRwnfhsgDbupG/Ud281PYIz6s6
BmIMa8F4bwd/8jhKrFARFrb2wPcffwpvdMUetLo9PdFZwT7aIPyBF9wv5i9d2VcYuGMfjPbiYHFz
md7ouOEJIdNMRURSM/6q9/CgUD25SXQuFIM/ypK+CfRsJ0MSGbWrpDTgeRYBD+iwHDjKaZZxwZGN
O9nUoOOBBDpFHWGZ5BWn8y0C/z77biZvDo3LoWG56LZKO/P7L6kRU65du6KJrE10tNhXlYGzzFzZ
rkJ/FtpYILkvWSK4aMnbU5tcilufdZS5wigtK6yr7uCIEoZ9nLYecnjR8jgjzFlknvlLPxorgnzx
Ak9y/8tKKriao2oY7bkkZbfm5CMqsbI/9PzyDH8BClSiUpPMhp5DHPyqod+idpUD8caw97Ji1vOw
6K25T5SyHxGMm0T2wF/FTjWqUvXkgPQ+n6vQ47XIF8c5pqp1D5e5aGTSCDUfFxjzIAfyKzlOWBrr
jLqQtwfN3d3EKu4ITUCMgy5wfGeCWVF/CBc2/d9ruqT2fjBX7itVV4EYyn0HMTOYFRzoDrPVojjx
XSafc+bAl5P/QH7Ib8nLdPn6xqd9f4b2FV03V6FXxFIBvhY3yIN1GoBiKZHyT6rg08OOjcSueUrf
W5t2i1neoexSisGG/pTZwr0Lz6y4aMI7sJDLeNFLFDLsUJ0kD8WlJZ/SGCKrcGRTVjp5llBmXXzF
PrDElcIfEhjnKkfAf7UUmbIeZLItp9kFmSByB3bEmgKEQ9yxKgNhTtVMLw99LspfiWFsBsaZeSRm
DO0C7QUcDKx6k7za2lEXp1EGVM4UGw4/B3BI8d7dBSUsp7P79aUIRCMtHe8Hwl/pyjJfxERorwBy
AxCxK96EVBnKghn83pnQ/G+eEHJOffYR50kXtOROMPs2w9Ucc1E2xH65+luRJKlPyN4mgunxt5N8
ffhiez493XvLAdKM801wXl0/p6McdygRLeKBv1LyxfyVZ78rtrwnL5MV9Nh/25KyQVytTinacRfA
IObRjRcaV+/vX3wkDkWf9cu01GXuwv6cITi3I3Ge1UCD+GTvgyMH7z673G8/ZM98eBVZqZxMHisa
QjSFZW8wvZdO4ZCC36tWjSv4TU/al+mwBL2xAH0dUChibHOqZxAk7N0C1SdMio05o7w9JRUQ5o9i
6rFxWzbwzDVlgq+ooShk/3UK1h1QZi3EhUxgFNAIaJLXYDFUpnMXXbgG2olyNYkDC7mInM2I3Yj2
B8S8lOszIxE+xYmuYxF9e/MdySO+oHQqGmPk5aXiSFZ93mcCSwxnNpBlnrkxVHglkaHjN+9JiMsO
pJLovMe+m2SS3M2JsDaoIJzRA5RcFd4WkcOhUmjRFWdJ/JvhidVuIZF/sJxlHeGZmHjNuXeRGi1V
Y9yzNUZLUJgsH85YHCbSmXUwTZ3ND5Sz/Lfexnh5zIg5oeoQuX5+LmGtZc1SSYru0Sy26KGAlDN6
9QAG7ntdiZyRrHaUEvyqfadth1qGyfejkQSz4KD7z7HN4CArCn+nrPPTDNme5gutTvsZmvfI/P1j
td5ov0Pg+NAAxp2prNEJVePQRymwMKyblKwLB/MR/eJxuUZwSTk4AEykdE3tZ42SLw025ImtsSna
ZdkPeO5Gcwdg8GHwwYXaGi78d7aZztOM0t1Fwc5A0C65nzQk2DujvjeX9MzIJbXP3pMmHRb4+k8l
ld9fnIQCxY9SUb5mCDAVMFztWNAhGQwmhHpgNcfWjS+yg5sHDhNRjK5e3xQ7+73IFD7zE+OQWDqz
ICthKuiqAOFTkL60yasNwg87qBmNiqs3wnI88O/khmY235s6KZilan4b3zyRtcrin4KN623avsTD
f2GcngBgC5LWuCYyCDQFTj5r0NNlsz1lm9fQh6HJbX7qmJtYUDw8VhzFRRbkN67qlSVHvIN3pc/r
bmQdnp/pwWtYI+I1SVCpVJIZGyD+uHzBnTdVEtgPwOOkvc0JNWsvh0hxXPWPDbjfXeieMpwRLdko
3rBUeQDGGGnnnB/m9VSubpJYKrbWhjJB7dTT+fcpTg0Sl0fzBkcU2fxT5G33+uxyEjxvPRobjElv
UJY8Q8ftf9Q8WvsK4eP6Y5hrtK8oEbO/S1SCsFaZVczN8t0mS49Lu0t7gyMIa3NBb+vYCLXmjZJ7
LN6G+kmcX4VNvtKV4kW5OlbvJSaAifVr8bM1O1IRvwpmG6DTXDfYYcSBxwfFTfOx9Vxh5T0R2ZrV
yXfgJFClDQjlQFV7/i0AtvtuEkNmxQZ1QaRMvM7ZRecRcg2ydgflVX6JSxzGc00PfY0hrtFKPOtJ
ydyoZoBm9H97nMc0TPwvKZnZFHE5+4T9eOhETpPcPExDYwdwpq0EOzHOYvokGZQh6aDlwtCjF+pD
VrT3RUtbaWNwwmA+ohpgvGHK4MS4EknuU7SImNw3JgNsgaQlhb/TbvYm6hDigre1iWXDXwPD++ka
3fLYMLbDAH7K3kZQVnGe5bP5xMj2n2exDwDemQBxPmQmOiI4KWeNdQ3fW8zafQzRpg+U8tJcscJi
pZZWoW/EAeDhiRhQO3lgaFZ8e7mnRx5WZpOFiRJieuF6QdtAe7QQc1luRk3TgBfiu6WzaSDKxdxz
RvkgtSa3sIop5s/qoWAuiZZ0yS+fcEeiNp2rnk8YAOmqPmoqxxEinlJfLcuN1zEGzfKoNLxAYO8b
ptesbUxoPIFADcKC/S7kGPhg+bP+sKs2GEnh3D7I1mlA48GGo3xngXg08F1b0r3xFFYM+boydmGL
zrb1faHSJgxOChhk0E1iKeaQYMikGeZmEr2cb2LJ9UKCvRbmTFR2m9lpA8k9YUu2CiZ551NOrsiR
JmeHg/gtZ0/ffg7gqZ+YnPL/DkhN+LlW9utc1Gs+jTreK5GCB/8554KZtRwdkPQrlWVSw0nN/k9/
KjzbbULRY8q9M8cE9g3bE13LHWhjMzDu9bpILDpVg5sDX87Cmc4/jcv/FulGEkJSyCPBY7ESzl9o
rzybX/I+EKy5J37iQQ+maZez29sXg1WDcfeJUxHYG59xP/5O3Q7r5k1rEaHIpqSfriegPbMAZPCI
DEXD17MRjtoENeEjlow+WpUJJ0Tti7PYGpxR8vsBABvC+2w7AB5PvB/2g2Ufcc1klaExkPRqVFT9
+pPXlo+jx+p54Ems1zhW2kzae9zebAxpHjdIvzpavscbesON7/UFJi3+RVJx52aNHSCgS8qxnOiP
uKm6jT0UrMF3KP4VyhyF2fCHzK7tQx562WWTXc+BVnWJo3p9tU0LgVsslVBO2RK4GL7t9w5HlWPD
cdYShDR5F21wCgvU7n7pJMkyWNSmsc63CzebsQGwMVyp+1P4U/nQmJMgqlNqdr/mrnA99hdkhYW9
nGSAAI3Sm2tOBf4VzT8Eacpk5NiPaJPFhNhfBpUwJAFYDaRLiDPUg/DpfyvSmLwA7mUgo6C9DLOp
YbbHmNtqFdMwgPUtLR6pcY4gI4RmBYgTQQeMPdAS4bY9PznG+Zf+CdEdZrCZDm5BV4NH+fYrxJoF
YeScnL1tju8C3sNTtZi9zGDIBJjepqvLHh9KkVtKjFaNu5/va/PEhQy29BFiKQ2pA/lNq6hmcVeq
Cb3gsFxg9+7FxXCb6IDZRoauamxyGNkCQfmy/z1YifuyRRRChefGUYCon8zMvPxIVZHv90IFAW0V
WE5OJZA11cNV651rUyhe9xQYtA66iEv5ZN80cWfebu6lnxS3czmUF8vij3KIJNwTkk/Ot99KR/t3
mA8kRnFWoboXRmVICw6/JVYFwgLmwzZ1F8AXxHRy59hT3CCx9IYSnVKvWeGYh4tsaH9YwhNP47mk
dGSD86sWiX7ITg9PN8ZBFGHUi+3ocXMV4cMFeOAi0BdFyTYbOb+8b8G2wEgHJoewWfLSd6ad79Uq
OhBHEFns5X3jBiQ5b/QMlJWltAKJj9tCNm7MtnP8ChTHx4ic7RiqQKZRw/l69oH9ku73+ChEupfI
ZVm3dGfxlw7E/tBVvqorYGxiQhArE3NgKxCx9c7SG9+WuRcFXVTm0INYy6YMAxxV6BUQaNaek4WB
CavmI+xuuw41eO9ug1YR9IEkvkAiEPj79204aNlwcp6Q7KemOZQbvYW1p/9i8rqyr24R5WIVgntC
pfRF+hqPMXFAIFTBjCq1IW4/LLhVX7ZP4TFsLQx7w966dcQodjy8X7MsAP8A0QvB3SSWp8Cyv8ml
Lu15Hevr7LnTWfh+9+lWuBdElIGGELHm7WdLFKaMGwyQIELnbBI3M977aqIOL6Lid+gVRB4l541B
vmv3AQFXL1Vw6xZhmkEC+lkNiO3NSxUXzxhX3xFdaAm2zvy1I6hJbq5tl/h6DYSbibGhQNDA/to7
siU9jSjArP4tFGwjO6lgJcE8st6j6SlAliLpl0mMHQotLGhJtDI3fYmkhrmafk8xuMKJoouVi6Zg
MRBUqSUAyPrgwJJBt1jfHCBP1jbUVX4uZoa7P4C4d45KsxNx29D/mL8vH/OjaQOrIQlJX5l19+D/
mvtV5Pa8bN5eZV4jZazvTTKkukh22H35yqzyrRmG0K3LLGuJjk7MZ3Jsho+mSBcFnz3zwL+jm9Wy
YRFZ0Qs2+dycqE+Kn4U4owaW8it8JG/cyMaE8YrmhDsWPo1jv/2eAvBM5TVkqTLi5FBIl41Hn0Zl
R00Zcjerc79VWNnap7FBrGYtEKAZgDfNeXy/xVL3bmlPNnu7QboBA9F/toqzzWKZ/D7rScoCB9Qi
uDVmjZWrw/hJSIuVl1Ny6koAHz9WurBVQTY++KQUavKAZusohFsFrKjIDy0mMzHiQS2Ge68plP0x
N4k4s01RDfYviDXMn2wazW5J+/5eXSVZkIoYEof1aEnd9AuPUR6dDy1T1iGn9J7srxK+IUEC7f7T
IUL30BQLIsggXkqbdtnllqvuQwQiV+GSiR2aMzrejHajAJ66QYMy2K7qPtJc9iRmUWecbD8y52l1
j3mc030ufdGCF68is39zd5/8s2qZJugMT3dTs42Gw+4LXoo72EPzCgQh5XGEx+KOA4EHDaItlH0f
DXc9m/FuKMURfLXEZSTNNqOsagU8O0LfIxvaRCM5+wtfj87vymED2gklpcuc6dxkjAGccBModfXN
e0FPAjdMQVj6hNtK5WMe1G7yrdEUK5CJOP/yv1ZPGagxfrK8UD5pHMw3s/QG7QZtvG9uyTQgZ+Ci
ImWRNr7q04nkLv5UicTeaXpnGI36V6V2Re/YlA8ILx+qvBq1oOgO8P7icdb3rm55Rj96O3nPp++A
D8ZT76tpfytXHj/gxjrW7TvinhSSWS5tZZPug5a1TNAldQdN6WPo9YqaEGIDEcWONWO8Cci6Pn4v
WNcAZ1w6i574puIIb4NRCni23hNooBeJA9d/lbpggY/1qAMfKnNF3kSlpynBQlR1Q+kZ+l8A3gZK
y3u1NDA/U/GBsBTVQjAO/qGhMg6rsIZ6wa9WNh0NZmlJqu7dBBz2UOPnsYXoL+iCw4MgrAd+ENP5
rFF0dsCm+RVxfoJwsxZy/iVcLULMzbaQvxdW8hC4QdDt99nx5en242P2MXvCRh4HQw0udZN/RmU/
W/P5r0brIafEcqP/T5WQrb/Ay5qNBXtvYVLo1IWVyA7qXyETi4fNYRwglbOjKtamRloDNy7qMtFU
6J0zEYsihoolDHnoPaf1YRCZyP7Li9ypd2vCzC8aDUVCP9fLB4mn4cCKzoG9laezECOozBmCggfW
c3TWCrMi6Dwc9xBrJEsrwkpwsE+Thx9466VaSJu3vU02hiry+dC5NSwC9UA10sScfRQuhimk7fDc
6vxzatjOxy22+93CHIjyUTsjnaNf/MWFHWXJJ2wxoJHBxDx93JfZfKAcQaglrLKP69ZBF0rFvgJw
e18B/iQEDLQp48EeZFJbj+PPmQfKX3qC+zEtL8Ya4iRp5NBRVu/T0x0lZqOErEnr19AtI3PUWrlb
0DZjL8q+ZFvmWydaECgUOzJtFBk3nQEOTAKkyRjqNzG6ufICZly2Ml+78FeDP0iDcagIZTeES4a0
5TFw/6X0TjSMIP1zjFVpQdTNZf+Use3SCvY116UlYV1icF7mVlUV2a2HELvdTPWh/EjUAkGIxkvd
ZtryPkKZTp96oI8WQKK8Q7zhAl5qJXlypi1G39WgvTBTcaboNwLmrS5+9lMPTI97liFwEYNTfvxN
ShTuH0UwR/6yBVSvNdRRnTOgloBYcKtmqA/uSHRNG8ChmF4Mr0fI4vYaQqGkdHBKSpRti9vW099U
4Q9XOdqHForBDH8LLqCE7l1zW7gJVPoYcHNQ8RVFVVTHSt5ccXx5cf48kTfENfYko5ygm/bpbQqj
R7kvrQSQuAVrsS0/fU1Civx/7VAJGUgDyH3Lfhkjg0QWOFnrDTotQ2QT6DEIxNgoRK0V+1lfaVDG
ga3H0jtox8YS5FCGaYErhjIBGr6KWgEvqFJIfVOYoIlypQyPsCNcVy6dWoaIY5SSVtvFtrQS0uT8
oWCXTVd4Nu3Ochx3ps+U9uCMLKF6gJUis+Y9lk0RV7vNMtuPzxsDBwpXpBRbRV5w0QSomNrgtAo2
e7Fb7BplDRvKfwUyYHEBAbpNubuItE3y5Pqj8ix6oUvgrS+mGUZ1j9aJHeY17TaphlGwOKH0ACl+
bsHnFr3jEAMrNXVH4SOjzpobvjkuajPkR879MwkSmrgl3OUaYy4/QKLgFPQb9agDdsfoMh2K+OlV
adZv9/O1DfhzHpj5Y+XRwV+Izu8HFGRnksOPtAKHgA/n/6M8ZG/XB47uD7wlnhGoBdjt63fshv5O
yRNh3bH2mtwO4fS2Ysk558m9MuaqiV/zLghvhiq779Uf6tjrk/N3h5wnEf7912rs7MKkkYOGW/Bw
ST0uVMIe4r4z6h3uxXsXNH1dKVGrcEFLURHeNerMsTgRBZUs0/kc+FTpFinwB4NWO88R7BBBdpUa
NmlTd2bauU9njCIqy4yKf5rA/GFzQ8a1J5o5sbEUAPG5npgPS83OlBOy9xnTh+Bw1ToaS6lBkXSR
/qBIaXE5MjxSAzTdyoEvVPCwpVGLtZO2JGmlLyEtyq8jWp5mpb50KgRQuTl74NkNmNMJRcb+1Hu+
Zd78vGzZZ4isqKyR3ZIBGaZ25ML1IExBWjwMVbqOYjJbSvixBtJFWsIc2A9KHEDWwJn9ToSTC3Tg
6W+NzTFRXBu1EoOntFrRuS0ohoc4EmiS7/P4HwlHDdgVO812MH3sstPSeX4bM6ukHirwXUzbOv0Q
Tj+fuW4wXNVMWVD5lhJvgSQbZf43BRpwd3XCh+IIXOKXz39P3s0Mo9UCOXa6rJs6TCj5bN+6eFp6
vPDoYDXLkbqu+kwQ1SgqH7w/lD3TGswMSszBtIr7t0JCvXkd9KZh5bymptltXT3XU6N+OvyIzW/O
LuA+pEuAb/CrJRZF4QhXMunQBeuED4BGPno9v1X4P8eTkh6YHLwD/Hs9WYInYR0hjCoq4X3PilBN
gQQlMAN3I3RnLniXBI+WaVjKpr+DuLK8TNSw18/bnEnCoBbBJV51Bne8FOPtReC4Kuj0r7nTufto
etYapYpYvnmSz1foqDeMPla2ju5b+CsaWOObkBg8CrLd4RLVZBIMKmGondmhAo7N9vWXzrtDOqDr
eKOxQih0HSplFffj80r+uzckWpVYyN4L4+lbKAbyOGWOfJEA4+HQOQmLi0axSsiGu+OTNCbz7dA+
5fqa6TtE/H/7AcMpz5m8/L7YgIyZ75Ytossx2AShEV0gEUYoi9iSaqIZcLCpv7WlGrnc1vSRIMy6
8WMigQPgb0aWQdDhKpZ5I4VNhfiLXL7pBjkaJi2R1RsEa4I4K+Kvj/3DbSbnJZpsDJXMEno35Dsv
W9AsVOdXqsz6vzQhqywfzoMKQ4iPQ2QyRDDfZ+Cb78XhA/ACn7XGY9nF2uUlyngYFkXG4x3f3LK4
3zPaKpmcPSIZ/gqHU49elV4Y2fCUYFkm6vPfBATjeQvA4+VmrFvoeYdBllQC8Hx9nd2lB+Mp9Dpc
NLoSKMr9hvpcnYaCAc797us0pvLjx4is7QAVYd+wqYcj+VzypJwclbmIJ/4wMTM1UR2xjt63b9H8
nsaDzeruFcsd57JZKDxit0r4B3ecJMYisqHGIzvvh2YeG2QoA/idQ37Bfpd8WAhZTXhDG4G53+NL
7+bCUjiM3URVmZIuOKC0SvZf8l6W1Adp78Kpch4NWOgXlnCDWacWetE1BRCAoxB/x3SCYf7wwEgO
U1y5nGZjRb22MVRLEVnEPVoOyYeks2gi6j2ORn6pNwVnq9esh3GDbgEqdp8xT8lMT0MiNP3itprw
vuPPXYNOKIdyFBywgiVovbRm7od7/a53fH23LRx5MK2ppkLsam/8d0rSGHe0bPN0nrOHBDbdRpvX
yJBOz9mU7haWGeMZrt+uJbwmrGfmQslvJ26UTCLs8Oyendl6/RcJw4mYlhju90FuAp59hcFTGZ/v
6v1gCr14aSvNv/9hcZcI4Vu8Qe8DiLKTWqkxCpfBnpG0wpYfgsjQc2YFAFFMrZCBzyHfKVWtZrqe
cw6aZXMqjTXXZEC74MXg3hPAtpgAPm6WsdJeFU8H+klLndjuON7HB1sLGNO4uW3j9ABm2e20d0s8
SFbmtROcKUCFtApiGXqGybJkAX8zvZuue96sGdecuIxdUf4CI+60LeAJ3zrMV3/r8dA4pyJRLbTp
CudD4m0dxGum4r6c9AttX7rk5PevXlR6a4InqOjo02O48YYwd2xXhFNOEciq464qLmfw9TMy21j4
MGDtmcu1lowtlY6MLSNt/NHT1zRhDlkMlbPf5drX7BJJWB3x40+qJFsZo2D8PhjMEdh14IEpAJTb
5v8phapsW+ggoM8O7KNbK0W3NhfJxUqnOKDjFki3gdhc/oc54js0wbcAwT/QnDZXEtjsOmgAvwmC
hq2iFafi8ZV6odv48dy4IgZH1UlvfQGPfYkuqaZYsAd5KlmwhZTCzlLLuDfvwNgYIpYmBnlL2+bd
dZ7EZSZdXvzoMILokvseQYmt4m9Owxs/2jQyhVWop6GYCHu3G3/zAyybKjb/ULwq21fAJJ/NRvQO
mgmfOr3Z6iFg+ucq8jUBO4M6xx/vt809GvaqMc78UpsFcBuXx3ox6qkF4xkbgn5OeSd8j4yC4dQz
/C8XA+hoLgzoM+umv3Bhz8sTNB7Wdl4PlziEA7v5NoM1dFjsODl/fMy4iVuNzoOA5iIuM/ZgjiFY
uVv/4Zj1No1k7ozCOZ58JMtsLZxXkQ6QSaK9L5dtXjFKuD2JCRQUgbhF1zoV42GLXs/BwU9EjqOz
VBMmf+J8F5RRnajP5VIoc0BEizAhF1WKksyjdui9TPFtf4nRVkZGej5ysGhIxQh9M8YRhWTSeGPq
MbdgV6tHAMO397dZckk6O7ANvL4gNLQUJ8P9EoNDhEeePS5Gy3mLquPvD6J0jX2zL/jBLdmGc60J
Po/nTt7epiWLlu2M8Ao01qBnEwOeemGt2YsnZatHA3jd6rMrORlluWOBhsjDMS8kiUg4lwNxw3pl
RBr7PWepq74yiP8bYmViaPZ53/ZFvr2Yfw+BOcoR7gkYYd7+s7RHXLSlAdjc/seytXXxFf5hFo27
39hsaS8nUNpWMnjS/s1tSQQCXryYfDBijLkXP0xtvlBd9uUu1i3yGtj1QKhBU9slFTldwnP6/SyO
Rj07Jlv+uhaQX7rpLqi1G4+qqpitAB4Og/YjtwQIIj671yjoOrxuWNkAeI3qT+nWG4SajlzQhgbp
PPilEYsgyLWA9yjqKi8xyizTpBpawLfs6Jjeg2qp3mSVkoqqxtQKLqcwSN+ZBC0BpCu5au9wRKwp
j9bncQQeFCglnBmBKyxQ2Zm52RW3EaUa0ntWaK4QUOH6oa98hvJ33S1tmtzGQxd+XF6h5BHnkgFY
KCZlRsIN6BrJE/q/Fu3xa4h5UQWQfUbBHJ4w2ss94ojr8Jmogpre7WWy1nuVzRubF7JYjZpmJddd
BTWNqlfKnqLEQJ+EDeI6m2G5PKAlophFN9GmV0DINxJ/lTVZKmYLGktVIFWLU7H40yYuP+3YxE8+
hzHBdhNVkz1n4P9aUYTId198vLFZoWXm5Zj6Iwake4fcSyx0l3kjwCVBjzHFzHBgzlnTLuZf/NKf
hZH2gdvtlu3TUdZqrR9A21O8oyp6PUILSWGiKxl4W4FqdfPK9Fq24kggu+yLXjB+1Qx7BwgDUEzl
ROfKhp4WObpUWaHLoI+jsY5iz9njAyr2JWUTvc7/6MCfmstwLyIxLey7EIQtxX2qRiRXubRM6mG7
0Qi9WDcqhQ0pGZ8osUVoDHZ1ERcUcQuNYxddWmZ9Qy3e1mjaBxWXXe6nQLjw90pvnmUQTV3KxuBA
qzngv5OBIPpsQwU2aNnUXPbtlgDb45ZOA2zfckLCQ+Azc/ezyUAUjOzt5VHFACFh1Yew9n3zhwUl
o8JEOyBAI7gddOR2UdavPQoxbR/5Kw38NiPHOrB9DIv2ApEQLH1ZI0b4b8zzRQ+n/q6Ub2I2h7kg
gK9PZ2pZIzTPNi7bCvCY/iBfuXMhNTbeARw3bnLFWRZ5kHGJu1xVcBaelmXQP6/BxefNQnxnlV+S
hU0VUd20WNrlWzVcIScAHmJWhmrsymcyszwZjE52NEtnQ/sn7Z90KlijhCugn26uKx//RcnpedQH
5FueVwYynmoUd7wNJ95GsqoS0RRPd20ZKiC3gZoLr1PAHc6ObNvHW6cuwgV3MMTpA4vxtrkhhTfZ
8KWm/mq6LdKKI3oVh1F0/9oGJv4UxaGODgXFYxuAzc/6/8X0pGKKBDiRk3a9liBfw/Xs/7Mv3rOq
THXHNFEosrPqfUvrwQxEdVbre5KURZD5BwAIaX1jbM8KZCY57GsRlKykBeopDmU5EqA3HUUUL51t
hhlt9nJ+3kAIhzSnTqbN89EELOjZTkIdp09h3K7T7tXO+RcuWICkdFG3bz8kkmukhE0QklgXJ/+o
T17zl8PyyRL08vpn0qiB6iT7JaYsxJ1flGpjF+I1oTwMiNbBGgmIN9gCJM2E6wJSd1+7vJ8oqycf
aECcOeji8eZzIj4QfN59G1zbg2NjvVHq7/LZCDkdDDfkBau0mPS7kV/ElGNBQaaO3cvH+o/EYvin
PYIOhh2R8iiuHat0ndL39fQ5kzhRXVIigmzpjD2aJ0i6SXPbAb6W+zlLNOdLbIpqKevON6nHlaUS
BNgB1apowHjrD/r2LzYG/7vCAAZhwRTkWimHO6i5yFhZuucqvsOZotcbxaSl8lmkMROe9/ScbzVr
ZtpNmIRx8jKaqz2CWPoZaBRP9C5Qmuhir+DC0mLvCARx4oBQv7tIwW9jkDsUq9d8hdm4nFmjIDxv
VDnO3Ec/KTIVjPp0U41VNLvinL3X1lmX/8ZJSSSo6W/B+woQAOM/frXfox40fik5vH6TeuJMrVIK
aX3cl3P2WlE/Asv9/WVycDns8WqozlzCcRh8FgsqSahYIPUCVTVv+TvGtEnRX8BPlk70q5xTpkjG
BX15XDOiWNHYn8zBzP2XYAbGuAqnTX6oyQ3LLpvLlaZjUvvWwZ212vU8YDxQcZ0QZUBrDfo9pvgd
fNsFnh16AO+Sw9JChggqmzS9gOGFzaokwdZhsagqiBhzwjzzfc0YqAknv/XLFFTDzxrQBJgG3Axd
9n0bP+llOUMDhqW0Ulp2EJnYWuVFSoLjbFLQPxD5yaw45vNeztfXT5kXrOM91YPDhFpuFOaoEwMw
VSN7Ca35KZ+UEM5RmGbS0RwyoNabM5h5pWUIunm8dZMu2q1xigQQlbssFRpHI8QeKgi6tyCTiMDR
0nq1uOTfuiM8YY9wQMpXnXBcHr3cn5bvtkScQ1qaIkn6cmpCBol76yL+93JIWgXanneHs4n6iu3K
C5bq33VBv49zPL+346SFfDR9vbRRwncRDJIz67m1G5lPyVy/Tj222B3tPgnVOanErfonlc+jHEtm
Oth8bAhxqfotRiyGCSIOiPV7JBiZvV1DJs6Yk0N7+ZfQL9pLyrmojSeEgsck8f9MqPyIZo06JdgX
0uezaFE91hLSShAx+O3iq9zQuivG31AL8yO4jj1SHZru1cKid03MSA/LtY7jfQK4bzbOKdB+IKQ2
Cpp3Lck4MBUIbWCDoWpgI/HHXkT792xVjXqhQTdbeY/MgnH447KtiO02nflIbtnFmLIGN8HYPcOo
1JN2q3izpiv7kONufH0VdX1wuHeibPMZ7MAtK9JtdY/i7ZXrW3mfI1h9iVT4/n3p8GYQ8lKh+DJN
WzySI0SyY90zY8Q+h9ZgUG0r5gl0n/pmKMkhjwIby28cyJCPUEhg/QeQVbA5hbRLFX/wKB2nr7HT
p7QK16Fa8saKT7kMGjaLm9gB6qEfpXxYZFQbRbV15zRYSVUA9noIEjMGr7qAI1Y8fq8gEKM4R0yP
bQBDKBLhW6vMhoH4UKlTXKWFwV3l0D+AJvS8Zxe1qOnA20EWwbyBLup2mT3SDpckgj2ZK+ieFwqH
4vj6pdLJIZxfnSAJNBz6ljZlU47psXMEPh3hNeIWEa3o4tJWA6OxGmbkz9CaJ/uYi066T1Byc35p
ZmoOqf4AjDYtsv8ccUgjnTnhfO187Hgi2DOqqyzlRe9XT6Iy9VYkjdk1PZb9bPJvsYNN7trHOshK
37S/CnP9uhZDZYXRXosHc2AjIPU6SmExTgM5r9cDWlNEMgko/pn+ggXOezFi4NAcu5vvVNgkSYBB
N9pBE3qNkVizCRJixmBRhwVv8ukxcRdFed1xkzydc2YHI0G+slL2KTxU7Cabxwyz19LxMsOtiosm
YKEa8U9HDkklKU7taMD1trzx3bW40PQhBqZtYMyA6Yem7xKjA2Cf/h65pHYaXc5oH6m/l/3i6b0b
JLS1Bgigu7v0zjsmEtMwCkh80sOp1onU7/9LABet5HnvY7wHib0lfKvLIz4wfPzmXO/zzTIJgl3z
2rnU1W1k8ES8xHwACrmS1PQ8aN0teu+vygOmYcc+k4y6JhW8NRR1xH2jS5G4K9ERFMACznU/RXoq
FxcbZ7OMNUx9OutsoBZ/1Nucu33HgJavvTYfMe4ShpisFFlvHjuN0keqWwnjMLwXlVtgdmAVptjO
vLe40hKhYOutszsggkA77EjQWeCsKM+U7yX8i3D9ks+D0Ptq9ocl0sCAS2FD/gR87kEcfBk/+epN
vm119VLIs3tz8+3BXXOygfqDr2synF4BZ+1xZNVFeDgRUou4Z15fapcvKHfhvOsSFRJPPPgS5KKh
tV5yn1Etof9kKZke2V+MwHtAd4ZemDrx+/X+/vRmRxz7hCbItuCyhmq6pf1+EOT036f/1Md9KXz/
KC0pEFtMmboXV1KKCxw7ZC4Knztag8xaWy9NvNO7gwGj3U2bZXsIeh0tyXzv2zrMMbCUxQnT/HmE
SuUE9Fnhq0H+FY4FMTJCTxO0lSQMdhE9vjKAhTtYjIMec4fYDyhupoM/u0CRQ37MpJIiKNIMTbNN
x9r5wOtqRGo5U2/A4b8gS6ur6l0o0rPgrX4lOJ30aiED7sjyYDeqj6Q5JVNLqrgROwBPJL9Ubb3X
4YAS9yhOv7IvN/5575rq+pNlE5c9j/pso3MxoqZc1NhrPgjH6JjnBfanImcuhtNmYeoVHxYxPjpM
SVvLelFt73UZpfLcbyjx0V7W7GcBKMcO626IZcypOK1OLHsIPTFd3iH3sN3YWfDjouWQhwHGHwuo
UEv2ow1cFGRq5bPpwWJ2JNGH1aqxK4hipd+EPV0SMzt13mmJLo68bG60ulfjpQQ7gbbJ5LyBdJF2
VlqGTJ4HTh76ln7x+MyGZ4QvMHCUyKFlykBlL+VoOo4DYNUvCdK3Iu2e8H67XZyVuoW0/XXOywOV
elAyeGd1rLI2vq3OWLBGih2jEBg0+uf7Y8JB74lxBFSiy7X94YL3TZZeQV0sbsYq6KphDXurElm3
JNg3KGz/kZYi/NtGQa3Qcalf16FX0cnniY4WNAXLcOCQXO69RtfBy8X4+PcQhKjTtW5R3mo+kKWR
oxUG3EZTvbyL6fE8WHhvChF9pmXl7w3h5xxXEIitEsZL95XTRcSe60D/K0pqJ1BmtCMNITI0rQky
gakYcQubceHwZLoZvojMb0A8Y48swBPq5menvrzAhx8Hf2XFR937Spy7gcwoKYmJ5oqp0NuBrKg2
+uqZdJuI1ZpCgwiUExgfqv/VQvEoOUDi/0DGqdDO9um1HD/bpqgIUDtlpWEZl0zqouz7vzCycaSc
+lmlRmeDgy6eKwkqqDEa7EBSpaXRx1hcPUtoma2MEb0zvl0/Zy9i3nJMaUtcXB+Y0fDR6o2CgA1U
ZDTm4CwINsSMxEzP9smCloXtbntZ4Zp0VwEjXkINU3+x+4nEy7Klij9is1zhS0vsXlrELNh+GhAa
APa0yyCxLmMQvHP1nGEEws/Fs8vgrG04kBT11ntnjFTNjx2W2QC+u6DYzZI5Vgj3G6PqbEqxOeP9
shCboekkH1UYmRvar5BkjNHA84fex03kaNuzsK5SVrUZuJxZiE+eYOHO+s+ATttR54NpONU1TQNG
HXl0GB2Wjyj1qV+Ejdjhb74wVRi4hyvYdna48G49kZ8XHPmBqycGbW/Ht4Cr2YJ7gBxR7CepIxZ0
XOx1IQQM00rw18kS0gx4qftvm3Hsu1C0KrXmGcyMu+M71wshpLIIDQuh3UrijmZ0Cy+A1dP2bZbq
mR21S8AoIl7sxtXdlo3vHDw+TD0DPWJvBzQHL9+VSto6qjv7cH0G2dizfEGZ175TWfAKnLSLfoz+
zEdrw913yfSRovw+7CCJydZRxnClwlxwvQIonQ3pS2jrypz/KHlSTBg3o1au9Co4Z1OQL9EUaAt6
PtAU3PH5ThF8qbKkG03Iyq0eco/tc5bowWZxLR7gOsxLR1K4l3xiUSAoaX0qb5MbKk/XdpY8zPHw
EwCeYaPqQ2yowb7IIpBrR7GUayhwkWSUGWEFim/TL+Vd8x8Aod6rr7PngpHDfs7yPUfLXEYR/VEW
CC7Omro7h5dyAli6vbUCexpI+1qohidnzWGg7NHSavO5R5Z/dvgSeDZF++KT6OAhdLwiEYV1nAFS
K9BXwJG00eVhk2MFY+9XJqQwYx+6Y3zXTXC2Panxgmn75P/3sn7FrQxx4SyQxQSDauv/dYAEJ6Z4
ypxXHE62cU2QmalI+ZweWNbdSxdBkxORvMbJkCrdXJlvQ/2T7d4mtPasHopTRTm58ToBO2F45QRG
kkUkD0ZixEXFiVTsFRv0nSfI7OAXdVUxzIIcfzUj5RpBNNdwjOYlnGCe/wJSoHHRcHxKkPWfZx7M
INHsxSWUaOXyodvUm2x/Z8Cw2fXfDwPHfB9dYn/Xcjz9I3kXW8rLIIinNGOGQ1b8YFRwyOyjINgK
aU58+jNBV20ooonvFc5/aTsVCioLfaKNPaVZqmby2Ecmw/eEHyETFFw0uqE5fC6Fv5eGen5A51SR
fMupbLxCeZ3Pv+VJIk2BdZXZnD4iEHaxdIBUd6a+btimeSeddcSQ8IP5ZZHe3+zTss9fo7e1ezsH
+u7nwHQsJLFj2nQpgMk4VvuLyNJrpyFiQaTIALSvnGhiVqbwILsUtvNFQTO1pZUS5vq7TurhI/lq
SxiQYG1q+U4LN671U7QdSsW556SwngPdjG1oRB02HD2lPuDltZ9EFnyfBh9hpZE73PfupyF/5CyY
qWaULUOfIEdCSG0UsaXasZ106kGOCNfyfb4A/M6mS1iZXDHPnLK2VpqSA4sWi8OefK6pvfbe2925
Ofb9S4Jbh7+tFKMZRaPqMFdMyyWzT/DZZlBXpBZOvtdRjero/T2bgcVLhxvPwtlMu1Ivdl1ojAOC
2bgs/rMkqPgZ8E9O0fn9cVCpgwAZElFJYpNm2aUXKAHvDEMrxvvK9CtCL45ui8wwsqr/kPXs+iPP
GYGOYRIAcJzukgg5QGlagxtuEvaFD51XprpisfeAOFnnnhoBb5jaQCHHaPL2VykNDKUvhKBk6IcY
wmzu+VGFgW8FBnbPum9jTKo5AFULzRI2IpH6OJTmv64MLRIR2+/+/Q4OQKlqbRUsRraWPaO1El1X
75WutPtMjqO6BbiY8+Wy5lj9tv7RZP0YlNvlBknJtor7grVAnvXcoDCw9fst8ghDEsB7ZVcahSl9
LLovYSAlTQ0wFl4i121hnEAJzzmjUN0RoWCu3xPtZAFkmQF0GYKzNb5heWA7hzMJU0S4IvJNSDsg
xMnZqSiICXJjbwt0dp8KJ6IoWCSyJ3sYgI1WMvVvSbc4IYGWC30tEoR0vDt+UIm/LENq5kZ7QoJQ
4C29vD2+HTpW4/N1vKqiGKanRyRSiE7TuFJ9WzcWx2cnGX0yqgeRHuexr7FPXsvwwyCJlAI95fU4
+MOAdr/1/1EOjfMaWaoOAttHu5+v0axj3j2P1LdYZoH2ay6bFdKvocjolzZGZ3Bog/t+iQTZnWKL
6gxYgOKlTSVHoUSjSU9BGA3pB/swUcVInvDOzskOKTPNT6lv13ahvTDLglTLpSaaERM3NAoQUvSi
U3XCxpKSNldHRo4SnTYHUZR5GYNXPkjE3U8bTmaWiETC2qQAQOT59U1KyTKcuvtiZq3mdwkZDafT
NA0BksNn3Wv9hKm60nMWDtFv4/BKIM9jKMDP3MaguFNL0Z0LiJmkxQV5/BJiXRFUz7Opu24SvYe/
nvLahllu5Zk3xPmlrUdr8oOnKolZ/hxvE4g9t23fP9f3KvCZBzX0iZRZ48a/EcBjFQGNl/QUfsbr
qSd/MtWGriQi6fjfK3WXxKoD+A+MgYl5wI3ZHsM0S25uhKm+UBQhHkCTWSLVN19eqoSW9hoyFz2x
wD6zAohfXZND1lbtUMAIOxYOFAQmVnUuxPqyIpZDgH2C+GqkQmn2ePdoHNQ8StSRCj6y54iLU8BA
ODN8pTgbFQ/VzZMLArVUw+lVG/GZruAVryY+/sF/qaVEA2V9MYQ+ooCHgLeBo8ODjO1lWg9x8+kI
TLxVeJj/s9fLTxjmBK2VtaAeD9e5gsxVmuWQljzpy3OPlzeC2BdjVKY26za32hYpLc1yaRpm6zE2
/i/xPECKg2fPE6kKva+Xy7/TMNq6H64U7Yj/XvJSOePGkdDjSZpwnm2p0nNNxfbeuaIytOvOPk1G
eUNamiqZ/d8iweDK9n5piCu4H9ihn2tbq0rpyQq/oxW6qrxMsYCKlIY+YsSt/vNei8l9pZFEybDy
X20hWeAioBPc68+eLO3n+hA7RAVKi0m3yXzpxmz/NdtAH6IRnK40NrnyQIjrLD2qdwGhQSSYryAq
iFKMwJdOr7fo++zXmXkwMzrF7sIX3frO8etpsH/cqPBH5t8fT3Bu40hjOuTtOkh4lf76Bu02/YLE
5roKxMn7XgFZTlc1wtbEB5QAXnG3bvN/CWvIx2croMQdXoOb85vlLWcCL3sG0pdQGFIG688XedEb
8+scgqfTl+lTgOvGha3fUsU1wbv7pP/W8jZtR9SC8N+GuCVLJjfDvzPKXWzJAIsBUQx527T2kLIL
Q3KQ0zOGtVitF0xgq57X9Il0a3X+4ERgblqZe/0vuwl3Qz88cHXam/8T5S06CbblQtjgo8ipQqpV
Xiz2uJTcZOUq/eNVwBGWuE/8nJUpNdhKFpWsSE1hFg7igu6aqz0pl3zUNWZdgtKhZ90QGta4CM1W
sxZWa9MLngEm/PFElrG8Zw/SY2dElNyuXSByuWXEm1/FGbuZeyehOYheUY8RX8VGRpV5DRi5xPHb
AGizErqh5DrioUkElALJIVSXpfA0HTaSBS/Y5d1axErQ20pESenNqcKC/bJGSqDn3uNuh6fK8SLB
JdgskfU+DNZxBRc/AJAxcua/GegNGdrBRXkP9rj12tyfVUBXhpZlAyM7t2i5QNZQ9Yd1GbNc+ICo
1NHLQ0Oz7z6XLAx9C/TxOHSQJd/I8QRB4HJ4wnYmpt1Szf9VjXPWJxIv0LC8q6NE0g3ATnlUVAjh
aW/3vkWmJOUhTQkyJ/nWPYmAGZ+hVQXGyTkdZtNuMdzZMCm+uw/GP5zkgVL53O7K4NhjQvJgRf/V
a/YTKEDPsbDGq9jkUaTFWxKALvwlrEyz+MKYdthNHD3nf9s1HXnwh4sJr4QJ7jk0VMFzFMWoLusX
0/4wb5Qk4kXRVH2yF0ohKpZDJm/z1BygV8r78J37NSmhfe/0EgfBTVmDSTVbHRxZ+kUi8pyfoCf4
91bCVpKLO8V8iOM08yrMuuZ2ZuMc37e8Nm4/98Rqx2zslU5XMhpv6cRZvbZwuWV39eP9ZcwrU6Qh
/Y0ON1W3io6rVSnbzEibGqL8EqiaYZgg7FyuO0Zr/JMGYKbjMek5qNkkOFVGjKUVFi0zHEadhPis
23wXowgT4hX+1XMKcI3AFUZ+v2a5kcGao2l0sG9RHpwR7229eqjF38xZhH0MUdS5RomRUaBcpAWY
Sj554aZtnR0hs8uiLdScKPeOE6ohCqayoXpjLV72drtWEbW/5Rj4M8qdxCqm3mEqVMVblIXCNOSM
MxoGJLudhOmpn7RdXVskAlHkDeRtpXwrh8S/xWqto1TN6V2nwBuFz8BOmxCu+85AhxBNQtWVgIgo
FLxymkEnmuCOV3yl1ooU0hr+RWNMK62zHo31FL8Ko8zxwHqFxT4F4BKu+Xm0ds4rChCmc1h0r5nK
Siez/hyYpaC+FAfUnPXAWTauseaV6l3Nh4RpBwmoQTVDfrK8Wv3vbg/9eu8dU5qXcS6t89/pVR1Z
B6L05ek3lNr5mxvnugWXuNKsyntuS97C4W6U/enp+54fjb36VecRRBE620lOdPUsrxvb0bIe9koV
FfrrPewdVXI3EUDYDQsOzEB1Gy2tHZQgR2GN5LvKjCUsY5KBRY9LO56CQAelnZl96HaRmNpQu8qz
0uIpOCyx4qeaLR4vfEjF/dP5w0dCut2HzVPcq5lbPgiJvG2gQ8wO30hYJsDVv709QtaouV/CSyfn
GUXOTnyPZ+ZgA5FzWrGYwvrF2t8UKPTctPrwhz0BA0Q/y++sIZNPXudjuSfv/Qh0cwmgaXY91qiA
2QiTXWUWIABx4lS2gnTi4X74ArtB+RLUfPy+TA287PZrXm66PsRuYgNz1KKhxTz9/mllgWqQLrqF
WjL9G+UD+ghM7jqSxx7uZyoghMK5hu8pomQCG6d7j/fseslNqIhDj7OcoFQzlNRddS1Q2iPr8fB5
UUMlnWPALiiTzOTPIGZwIaEwZ1PkSoq26AqThPiW7CVuwVzT9kPmoWoyMz7Y5lLZQrZCLogO+4Xh
/3hzsHccnftj7YPyyIuWAbAgWlPvFMpx46JsPS11kNG7ss3g7R6ATj3P3B39jL5Rr9qvkNHtwY5R
oGeB4jS3pxVdBrTeFL78+Jm3KTGSNP9M8uH6uzrIQ2oAj3krVb819Lp7Bfxo7EEk84kbke/eq8pS
7Mm6JMkGUEvqJbshRORtb6v61o367ouPlpsAKoN6au94jT0LaA9YEdmqXwjrmopPI42Foxs9Lw1/
ukNDJvYc7uuhcH3LZVsRrGZ/CEMy043F31Yf1GEvH49MKF8wtrgg0a+qBmxyjGXQh8eoUBbSKH0P
ILThXyb8U5C2oDQHx7PsyV2s8BebJSAOtLPHynrQfGPDKv5yQjlHW99OQdF7xkxkpdVYvAEvaiFx
LYXyRCNuN2UCiYfYMU5UVAbjwDCfoDLkAfXZrBaGZfLR2C5QL28AO298bC/CaqfnMYs7JEFzcX7j
b2s8zum4oP/Oa7gDISoTNmqQUc14DQj7tL8O7RXWyg/DAXJfXs+eT+mKfATQcVwQ90gnLnAfpNy8
JjdGJUV8QAOcV44vTTqzRmmwGSF8K8ce9XHTd/j7i/aDSaTGXelskEH7tiCc22EZElOxia9ocM04
wP7SFhnJqF70NlLpF030eXIyAHsUwHUi0T57LxU01dGGTXKnPu3E+zoSvQoOvoAN/UwZpsOYCupi
+1cBOEm6DQQoBGYSmA4YZC15hkm46s2QzxpfHfM5wnKEEEWSw942ZgwDkYsOmsQ/p9Z2044pjB1N
WVn4FtK1VhoFKZDcFlmKBjRxBPRMEMK/77KLOOam11qyUYVUjzJ1V2JvhTJHP8v/4YCO2Rf88IjY
1r0d/vlyXIs4AuscL9XyTVbB+MMJu6/LlkHJsucIcg2YSJmZqx9+xS2RxzJZebjgEGcdMD2C9H4K
JxwBvfi8emrZwbqWoWMnYoRIeCFFgaEv9O2ayXZkAoVSf7NZvXyhS2g21XBMDHG5//Yz65Pes4G8
PGcgt+1C0Y8iw7zIJ4gSJOnHkie8TlXMD4hO1h+n88nPcZFp/fIEPAajKwzbZbGI2dyzkS5f8kIT
ua3YXZ+y4DRSFE2Rfh5lW/S1elUQNkZS4rA=
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
RIH7qsBBHwoQQr4uJdig7ZhkeViZ272OcGLYhCD7ao94CeVmTsSBS7T7CxVEuCfmI0rqjJYyOdH9
TrRT06UhzquuYpa5kKYbw7HtzudzGOenP6niAnssukNkqT8X78zfPXU1hBhUD9RU9wr/aC/B++6f
ermfVcZBmgxAKC4UrA1dBnU61sD0xamcAP7PEAV8z7Xw01jWno6NgpjC2KHNUPPBq+9BPbxSUtL8
9XogJb7tP0Kjz0J6YfLcY0PBeGjaiVqdtIdeic1aSUdGTwPnKSzsudAoiDz9oykGP816qggPXnq6
NqZkS5bIUnONsjSGM400oCWeBM1gTgqTY5P+/w==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
QI1gV7+ba8mhJWGP/kfq/ffukGMpWF5cjNVmAVRgNPfs9huZbkFqwj1+xahnsfdj2BqTJWtpQ+Sx
jagD/ouWfs2DRL+NaOuOe2IoquhMFxEFS2aEiXp9xefHGCbcxPixepZrlSvS4WzpN9V4dQ2W3yLS
o/Ot5G3eRP14+QsUUmivcv3I0lauqML9Mu7MZC3HJlLMKzsAs1FPWvHlxy7syZAYuQ8L7MrzV5+V
T/otFgODquCLyRzqRdD0Jz4u4pJ2+49wfjeaXBZus+ig9BSl+srDN03zox5ZmJUZf6UPXBpNebwj
pPXB5keuZPnT8rNpB+BPRbE/KdU9gDhz/e7ddA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 1808)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
NtlHUOe6MM1p/PV12drrbV0GunfNFAMFX1RN0lgNr+rN7sdvgk4W2eSP7O5acplxmGXfRUoYQnIP
E9ycVdxD2g==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
RR/eBO0H72jaFKQhUnMcVNDU4bY8R82UfatTcvUVXDAERtdIYD6R0cRToKXax574OuBkZPzbEdds
tfMLVMggMoYjJM26JTU0xswFgJWQ++3jV5NqMCzJXv9UsqJOZsw8tH8vrCdAkauMJ+mJlkOgjGRq
tsk179rfUIuMuGMNNNY=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
m0urT1YktOTFldyCVLxe8GtDrkkWCLw9marxyt12BsF4SkU+/s5FXg+kM93e0SsGE5FqmS04134n
tnoG5XdhifA9DiqB1lQowow7WuO+GXPUDxRAqwriKjOvxfNYmiRlNQWuL0TcbXbkZooFGa0BwhYU
euAEph8dZmS86+3bULtMBfVJsF/W3DUM9TsL2VGjEy1wL2sL8/9LVBwF/yI4YDmlAvx8ZSPQOddT
dD5bKm5ZGlYDSSS6arW0Lu/v6hhOu+ZTHSPKOXVvZRHFZnqSRW762hQ1lKEXgPSy43k4MfcQmZOP
rhCXaSD3vlgnH7EF+7A2yYMIcmLr7YvDoWcDrw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
DvriFSs33CF0bAVH6O8uB2iZOrDQ50U7ADRBlmazwrJgLezS2hm0HS4L4vr42c+CJV/hvDZqiLjZ
BENFIowi6niSqc7ofAVHnt2PbldFPTDpypDuNSs0qcoQa34sv9KoJ7jUZLeLlglBwLI3eLkAtmDh
cf3yXBIrtjNKUcachJM=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LPlcR0MOIcwKiQiBeI+zQH1fkCR6PvnIh3LLTtIAYbs0MSbVsvzgRKAcoCY7Xt2wD2P1TCdnC8dX
DgVkrz4QLo0T+uQmGQpEcdLjbVwNUmhSUUf+E5mHJ251V0S8eseJqV9bS51oCqlN4HpqNuel/jd9
W0ZCCyVNaf06n0HXILF2q0+nZPU9+B4pYMZo8wXQjjfoU+H5L3VrtwY2O1ehfnjSNIW7DtN5IVaV
YFPY7EdCN+vyK8J1QYijYEZP2FSxOstecyh4vQRZvl8bTRMZwSdhat5/wTPshQDDBu/prSynB24N
w/HM/X47E135dffHfrzpkAl03R1icEJOdP13GQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
RIH7qsBBHwoQQr4uJdig7ZhkeViZ272OcGLYhCD7ao94CeVmTsSBS7T7CxVEuCfmI0rqjJYyOdH9
TrRT06UhzquuYpa5kKYbw7HtzudzGOenP6niAnssukNkqT8X78zfPXU1hBhUD9RU9wr/aC/B++6f
ermfVcZBmgxAKC4UrA1dBnU61sD0xamcAP7PEAV8z7Xw01jWno6NgpjC2KHNUPPBq+9BPbxSUtL8
9XogJb7tP0Kjz0J6YfLcY0PBeGjaiVqdtIdeic1aSUdGTwPnKSzsudAoiDz9oykGP816qggPXnq6
NqZkS5bIUnONsjSGM400oCWeBM1gTgqTY5P+/w==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
QI1gV7+ba8mhJWGP/kfq/ffukGMpWF5cjNVmAVRgNPfs9huZbkFqwj1+xahnsfdj2BqTJWtpQ+Sx
jagD/ouWfs2DRL+NaOuOe2IoquhMFxEFS2aEiXp9xefHGCbcxPixepZrlSvS4WzpN9V4dQ2W3yLS
o/Ot5G3eRP14+QsUUmivcv3I0lauqML9Mu7MZC3HJlLMKzsAs1FPWvHlxy7syZAYuQ8L7MrzV5+V
T/otFgODquCLyRzqRdD0Jz4u4pJ2+49wfjeaXBZus+ig9BSl+srDN03zox5ZmJUZf6UPXBpNebwj
pPXB5keuZPnT8rNpB+BPRbE/KdU9gDhz/e7ddA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10800)
`pragma protect data_block
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
+PkFfr/zTw9PWzKeCQRhMEef5429QxT/VfGx
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
