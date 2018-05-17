#
#Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
#
debug::add_scope template.lib 1
set_param chipscope.flow 0
set part xc7a200tffg1156-2
set ip_vlnv xilinx.com:ip:ila:5.1
set ip_module_name u_ila_0_0_CV
set params [list {PARAM_VALUE.ALL_PROBE_SAME_MU} {true} {PARAM_VALUE.ALL_PROBE_SAME_MU_CNT} {1} {PARAM_VALUE.C_ADV_TRIGGER} {false} {PARAM_VALUE.C_DATA_DEPTH} {1024} {PARAM_VALUE.C_EN_STRG_QUAL} {false} {PARAM_VALUE.C_INPUT_PIPE_STAGES} {0} {PARAM_VALUE.C_NUM_OF_PROBES} {33} {PARAM_VALUE.C_PROBE0_WIDTH} {32} {PARAM_VALUE.C_PROBE10_WIDTH} {1} {PARAM_VALUE.C_PROBE11_WIDTH} {1} {PARAM_VALUE.C_PROBE12_WIDTH} {1} {PARAM_VALUE.C_PROBE13_WIDTH} {1} {PARAM_VALUE.C_PROBE14_WIDTH} {1} {PARAM_VALUE.C_PROBE15_WIDTH} {1} {PARAM_VALUE.C_PROBE16_WIDTH} {1} {PARAM_VALUE.C_PROBE17_WIDTH} {1} {PARAM_VALUE.C_PROBE18_WIDTH} {1} {PARAM_VALUE.C_PROBE19_WIDTH} {1} {PARAM_VALUE.C_PROBE1_WIDTH} {4} {PARAM_VALUE.C_PROBE20_WIDTH} {1} {PARAM_VALUE.C_PROBE21_WIDTH} {1} {PARAM_VALUE.C_PROBE22_WIDTH} {1} {PARAM_VALUE.C_PROBE23_WIDTH} {1} {PARAM_VALUE.C_PROBE24_WIDTH} {1} {PARAM_VALUE.C_PROBE25_WIDTH} {1} {PARAM_VALUE.C_PROBE26_WIDTH} {1} {PARAM_VALUE.C_PROBE27_WIDTH} {1} {PARAM_VALUE.C_PROBE28_WIDTH} {1} {PARAM_VALUE.C_PROBE29_WIDTH} {1} {PARAM_VALUE.C_PROBE2_WIDTH} {4} {PARAM_VALUE.C_PROBE30_WIDTH} {1} {PARAM_VALUE.C_PROBE31_WIDTH} {1} {PARAM_VALUE.C_PROBE32_WIDTH} {1} {PARAM_VALUE.C_PROBE3_WIDTH} {4} {PARAM_VALUE.C_PROBE4_WIDTH} {1} {PARAM_VALUE.C_PROBE5_WIDTH} {1} {PARAM_VALUE.C_PROBE6_WIDTH} {1} {PARAM_VALUE.C_PROBE7_WIDTH} {1} {PARAM_VALUE.C_PROBE8_WIDTH} {1} {PARAM_VALUE.C_PROBE9_WIDTH} {1} {PARAM_VALUE.C_TRIGIN_EN} {0} {PARAM_VALUE.C_TRIGOUT_EN} {0}]
set output_xci {/home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.runs/impl_1/.Xil/Vivado-12770-rulinux03.dhcp.fnal.gov/u_ila_0_0_CV.0/out/result.xci}
set output_dcp {/home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.runs/impl_1/.Xil/Vivado-12770-rulinux03.dhcp.fnal.gov/u_ila_0_0_CV.0/out/result.dcp}
set output_dir {/home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.runs/impl_1/.Xil/Vivado-12770-rulinux03.dhcp.fnal.gov/u_ila_0_0_CV.0/out}
set ip_repo_paths /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.cache/ip
set ip_output_repo /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.cache/ip
set ip_cache_permissions {read write}

set oopbus_ip_repo_paths [get_param chipscope.oopbus_ip_repo_paths]

source {/opt/local/xilinx/Vivado/2015.2/scripts/ip/ipxchipscope.tcl}

set failed [catch {ipx::chipscope::gen_and_synth_ip $part $ip_vlnv $ip_module_name $params $output_xci $output_dcp $output_dir $ip_repo_paths $ip_output_repo $ip_cache_permissions $oopbus_ip_repo_paths} errMessage]

if { $failed } {
  puts "Caught exception:"
  puts "$errMessage"
  exit 1
}
