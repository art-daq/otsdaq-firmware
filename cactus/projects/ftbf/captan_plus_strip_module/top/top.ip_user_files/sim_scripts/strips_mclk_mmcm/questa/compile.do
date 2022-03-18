vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -sv "+incdir+../../../ipstatic" \
"/data/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/data/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/data/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic" \
"../../../../top.srcs/sources_1/ip/strips_mclk_mmcm/strips_mclk_mmcm_clk_wiz.v" \
"../../../../top.srcs/sources_1/ip/strips_mclk_mmcm/strips_mclk_mmcm.v" \

vlog -work xil_defaultlib \
"glbl.v"

