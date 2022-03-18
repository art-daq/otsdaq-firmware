// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Wed Dec 22 10:08:13 2021
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode funcsim
//               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/trigbuf/trigbuf_sim_netlist.v
// Design      : trigbuf
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "trigbuf,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module trigbuf
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [3:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [3:0]dina;
  wire [3:0]doutb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [3:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.51815 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "trigbuf.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "4" *) 
  (* C_READ_WIDTH_B = "4" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "4" *) 
  (* C_WRITE_WIDTH_B = "4" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  trigbuf_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[3:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[3:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21440)
`pragma protect data_block
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
of8hA1dJCg8=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
