-makelib xcelium_lib/xpm -sv \
  "/data/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/data/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/data/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../top.srcs/sources_1/ip/divide_ext_clk_by2/divide_ext_clk_by2_clk_wiz.v" \
  "../../../../top.srcs/sources_1/ip/divide_ext_clk_by2/divide_ext_clk_by2.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

