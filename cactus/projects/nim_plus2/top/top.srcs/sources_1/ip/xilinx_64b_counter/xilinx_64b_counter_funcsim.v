// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue May 22 11:40:06 2018
// Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
// Command     : write_verilog -force -mode funcsim
//               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.srcs/sources_1/ip/xilinx_64b_counter/xilinx_64b_counter_funcsim.v
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
ND7ooSoT6RzRflI+qH3jrY5VD2yW3wXL+noM9W6FIbYyFYK7UHXEsYGHkE3/mQfMvpn2ow2HrR83
4u2LtEpnKmhpzPaRL1UrJiQO8I2/ChInsoNYD0itH8WNTwh7/Iv1pfT41iR66rYA70sOlyr6eCTG
AT8liCn2CxsgOs4jtpS0ATl9mBrOBF+ZLK8N8MVJDC3o5X2oV0QWQodXRhAD9mU7D92XLTCDmp/C
DyJq208tmwO0kl5wWz/QUCRaPbhWMbknq5Y6TKKns0C1n5cdvv0WpXYN7hmcwI0ZRbO4R0FN4tt5
C+5CRMk2CC4USVN/zJ9MuPQ/ta0XC1Y2wiuq9g==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
JNPRLyM2BAAYpSVMKonn92//uuP6V6s9OchT+zXHcuYysNpTSDGxYPmGgxBqPl0W4Y9OV6/0oCO2
3f5SYqgg6liN61TJEud9xeiu1CXGkw3QMHfdB6GIjJhThjxvbadVK02boYYvsAPoA7+D+cW6VzpC
xSp9f1JFna7LIrSiUnwFQg0XG75m1N1MbEz6gBKgYaz3g0COQHX6fMtspHb3a32Hcgqjl2Mx8D8v
BbysjudVUVlTyZCTCy3uUJQq/20ceZFS1+rPOY+vSEPTLnyX9dAkuktNootu0eMxggOs0p2aHB8Z
NF6pDKs50NJKL6DMleC7An7BAOhU8GA0xNHo8Q==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 24992)
`pragma protect data_block
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
mwqpb5mT0vPMDWL7os9kUlaK6hXxUOoBFBo=
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
ND7ooSoT6RzRflI+qH3jrY5VD2yW3wXL+noM9W6FIbYyFYK7UHXEsYGHkE3/mQfMvpn2ow2HrR83
4u2LtEpnKmhpzPaRL1UrJiQO8I2/ChInsoNYD0itH8WNTwh7/Iv1pfT41iR66rYA70sOlyr6eCTG
AT8liCn2CxsgOs4jtpS0ATl9mBrOBF+ZLK8N8MVJDC3o5X2oV0QWQodXRhAD9mU7D92XLTCDmp/C
DyJq208tmwO0kl5wWz/QUCRaPbhWMbknq5Y6TKKns0C1n5cdvv0WpXYN7hmcwI0ZRbO4R0FN4tt5
C+5CRMk2CC4USVN/zJ9MuPQ/ta0XC1Y2wiuq9g==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
JNPRLyM2BAAYpSVMKonn92//uuP6V6s9OchT+zXHcuYysNpTSDGxYPmGgxBqPl0W4Y9OV6/0oCO2
3f5SYqgg6liN61TJEud9xeiu1CXGkw3QMHfdB6GIjJhThjxvbadVK02boYYvsAPoA7+D+cW6VzpC
xSp9f1JFna7LIrSiUnwFQg0XG75m1N1MbEz6gBKgYaz3g0COQHX6fMtspHb3a32Hcgqjl2Mx8D8v
BbysjudVUVlTyZCTCy3uUJQq/20ceZFS1+rPOY+vSEPTLnyX9dAkuktNootu0eMxggOs0p2aHB8Z
NF6pDKs50NJKL6DMleC7An7BAOhU8GA0xNHo8Q==


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
ND7ooSoT6RzRflI+qH3jrY5VD2yW3wXL+noM9W6FIbYyFYK7UHXEsYGHkE3/mQfMvpn2ow2HrR83
4u2LtEpnKmhpzPaRL1UrJiQO8I2/ChInsoNYD0itH8WNTwh7/Iv1pfT41iR66rYA70sOlyr6eCTG
AT8liCn2CxsgOs4jtpS0ATl9mBrOBF+ZLK8N8MVJDC3o5X2oV0QWQodXRhAD9mU7D92XLTCDmp/C
DyJq208tmwO0kl5wWz/QUCRaPbhWMbknq5Y6TKKns0C1n5cdvv0WpXYN7hmcwI0ZRbO4R0FN4tt5
C+5CRMk2CC4USVN/zJ9MuPQ/ta0XC1Y2wiuq9g==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
JNPRLyM2BAAYpSVMKonn92//uuP6V6s9OchT+zXHcuYysNpTSDGxYPmGgxBqPl0W4Y9OV6/0oCO2
3f5SYqgg6liN61TJEud9xeiu1CXGkw3QMHfdB6GIjJhThjxvbadVK02boYYvsAPoA7+D+cW6VzpC
xSp9f1JFna7LIrSiUnwFQg0XG75m1N1MbEz6gBKgYaz3g0COQHX6fMtspHb3a32Hcgqjl2Mx8D8v
BbysjudVUVlTyZCTCy3uUJQq/20ceZFS1+rPOY+vSEPTLnyX9dAkuktNootu0eMxggOs0p2aHB8Z
NF6pDKs50NJKL6DMleC7An7BAOhU8GA0xNHo8Q==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10800)
`pragma protect data_block
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
WvhuSO4kny5W5Ka1Q9jQ5QnvPf23DE54BS57
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
