// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Oct 29 15:23:18 2020
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode funcsim
//               /data/rrivera/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/xilinx_64b_counter/xilinx_64b_counter_sim_netlist.v
// Design      : xilinx_64b_counter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xilinx_64b_counter,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module xilinx_64b_counter
   (CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [63:0]Q;

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
  xilinx_64b_counter_c_counter_binary_v12_0_13 U0
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
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xilinx_64b_counter_c_counter_binary_v12_0_13
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

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [63:0]Q;
  wire SCLR;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
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
  xilinx_64b_counter_c_counter_binary_v12_0_13_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
hkYW+OZm6k9gF5yAUfXGm/n8kfXYD6tjFQYha968Ws0SqrM/NNAjCrrtMG8kIqTbkipnmceefxNr
sB0PtSpUrw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NEPpD4CxNBVJLV3hg1agn83QnqiCz3YuR89MlVuNyQGERKVJ+uGolFDqHFzBKLQArFTiHBWivkzK
A2DQ42XdOxp30NKOgHjrjgmF+fZMjDs24rn3Ue1INLHwTS5RT84Kih7Jx/7R0dl03/COJq+33l9u
7l+ArdY7mLwqqI9iIjU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cfBwEwc95LpKuxDGqpON2gGac620iHNKrm/QNXYg3/OFA5ZQNdpdhRz4vCTQRVbOg7b1nIox6GR8
TD/cf0JW38RU0NuY+TR6CkFT19NCdy67gR6JTDdXifhr/zTKjOL5gvp0XjT9PSLwwPyDirNX4TMa
9y9X5pf4gEnt0dikHNgySZO+Qpr30MP7n6oAjuxowlf45cfmPqZthYPnIjBSCdQGBPfSF+kZ2F1N
XCDEja5xE4CQshPPodH5njadc6kj7/qp9C4PfKcyNtDug+qsws9UK25Z2IFc8vk6/15HlIkQHkXv
Wq0iHaPLidqh3035FinHyPD/FDnfGGa5Oa2qcg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QmjD3HAHcP+h0RsjR0iH8h2N6drNxei50nfQN9RC8HobMEaARq/6rKjZEhHXMSCStQeCMhyVKRmN
HM7ZrqMf3W0s/8U4QMqp3M1VuYXVjEe2PCIpvtRcMY3JngdSWOydG2dH6dDA16ehxinMKgIr0TjA
PXA+lfyX6yTs1FWrne/6ufrl6ZAPpNG7EDKQ2aHqSm8DEXT1BJYMblBfAjAajwaJmPEu1aDlQeNo
onryTiFJkKP92pcZLCCufZL8ZAJ5uMvZZxiZRsiLd0BnCfOe3rl9AON+q53U+iK11EvAkpIBT+Cc
VYb5NqVAVaqXbQrqo3+YHEW5ft3fM9kZnlFDew==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FkHW107swc8fPv4xOTlQJU6PWERObturlywl6rsGCswc/v367bmQ1Maze/8QdmUPjEYwhAcHKVMu
7U4o3CvYhmrDpYiUQdQQ0B7gAbMZbJ8MFY5jRxn7KYDk+Bi9Ov8092IdW1a51FPWEVPmF4Kn6z4E
DSqpQDL58qieEUnrU2Ltb4GLJc3NrWTLvnbvRtHUUuQWTMZTQ7WqX4iH2dZ/EICpbRjlAF50iMAS
YHuuFTRKXcIFQlKYRyeQV4nyaA5JGbb3RC3N/Q2IZjdSXqQ9EOpmdhttpxReCnsdJiD/pPCtf7ZN
d/TheLy1Va2FZR+p4MozZorVui5/FtcCwKy6aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NgZm/7Jvy0UZQRVxBVxeZ/odxMd59IlnRFHjM+6Bof6o6u4Qy4u9MOoQ3Sr2paPuGq+B+5EhdcD8
a5WGiurBrPW0qF+L2CoUJsDqz0WonRehZECQynibSUlmctvvMyr790pwb+C78gtW47p8uALYdUCJ
NhcDkV8fE3jFdDEYmfQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxQNdd2WOThZCBZEYNgXxai4jK9AqWD/GRadYnarEfzmLUfcNDUoG7DxVWHCdTVuW8i2qZpouT1H
FUHt76rzZk8vI2tFLfUbKyTaRqik1aYwOCp1ZdqbgqQEDhBRWJjGxcJuxZbSQ2z8IUgiJ0eT148+
nf9UmzvYS1jrIsN/a7K4EjyRNMk0V917y85rxdk7itlisaUw4Cm72z9slByFtALj6/077uPjcK9U
mbWm7PbXk8PT44eQeaJl990wlWvD5/8BZS6AHqjg8520Xs+jftSeB6aNqTiYxfp21FJqmexwo7cG
G3BH/DRHhP7ZIsXHqSaJJFo20Nx9VgpLuF5t2g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LsTXo20bAzEz0GPR4nPPDzxqhUFF2doLjZg/kwmcTb4cZM17FPlxYo8P99vXziNmjbCyg3qevFBz
74YWocJlcMLTM6yf9Ne9MYuTwcJ1Rz79XP0IyF89AeCoLUfkA2ReO8EVorwVAfgyUm3k/7ImOwgm
6PUgMDE+6qvqiX7luL9kSmyeyjgqKULGe6v1w6hytHOXxcSWoWirP41UsrTtNBrR0FR4eyM+FaJ7
aI9pId0oP4y/qM/36j/yBOD4Bbst1fw9Ic6yfEo78FZ3nVqhSDguKboMRGPIqrhtL/ntF1aaLL7C
htyXDWIUXvxiLVz4uCmxM1TM2GfHLvyK9qb70Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o5FB0heRXQLyeSo0J5gN+r1YcHKnJEPzQQMNo3N+feuZLjC8w4vwgtzmq4hcEo7/J75WgglP5EWZ
p5+dqAuLAu0CgqW3hZ/oUtZo9MByhUcyCYzANX+yqbaCN0a1O35bHqlX874C+KfwORfF7m1sFEle
igjooPS6UcXSxZh4QPXwOKF3R9f3BDfD99Ks1m4M3g5txOKPEBZkg1dTV7utXUtnjJz5PsqeoAb/
NsHMqENNwI8sPMpo3J1IzyWrPKeaybvbC9JEgIBunjbhNJAwAU2q8JM+FnctfR7XsG41MQ3O+TnE
2mBjDFdweRC9XeJU830pkrRB4KoT2EBLbCjpGQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32448)
`pragma protect data_block
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
XIxSCZmEUv8YftNwKrdw
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

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
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
