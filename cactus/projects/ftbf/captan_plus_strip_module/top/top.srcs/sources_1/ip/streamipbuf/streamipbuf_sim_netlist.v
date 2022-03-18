// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Wed Dec 22 10:08:20 2021
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode funcsim
//               /data/rrivera/otsdaq-firmware/cactus/projects/ftbf/captan_plus_strip_module/top/top.srcs/sources_1/ip/streamipbuf/streamipbuf_sim_netlist.v
// Design      : streamipbuf
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "streamipbuf,fifo_generator_v13_2_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module streamipbuf
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    prog_full);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output prog_full;

  wire [31:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [11:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "1" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "0" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1021" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1020" *) 
  (* C_PROG_FULL_TYPE = "2" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "12" *) 
  (* C_RD_DEPTH = "4096" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "12" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  streamipbuf_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[11:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata(1'b0),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module streamipbuf_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module streamipbuf_xpm_cdc_async_rst__1
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module streamipbuf_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module streamipbuf_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module streamipbuf_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module streamipbuf_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 123120)
`pragma protect data_block
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
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
