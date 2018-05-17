#
#Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
#
debug::add_scope template.lib 1
set_param chipscope.flow 0
set part xc7a200tffg1156-2
set ip_vlnv xilinx.com:ip:xsdbm:1.1
set ip_module_name dbg_hub_CV
set params [list {PARAM_VALUE.C_CLK_INPUT_FREQ_HZ} {300000000} {PARAM_VALUE.C_ENABLE_CLK_DIVIDER} {false} {PARAM_VALUE.C_USER_SCAN_CHAIN} {1} {PARAM_VALUE.C_USE_EXT_BSCAN} {0} {PARAM_VALUE.C_XSDB_NUM_SLAVES} {1}]
set output_xci {/home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.runs/impl_1/.Xil/Vivado-12770-rulinux03.dhcp.fnal.gov/dbg_hub_CV.0/out/result.xci}
set output_dcp {/home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.runs/impl_1/.Xil/Vivado-12770-rulinux03.dhcp.fnal.gov/dbg_hub_CV.0/out/result.dcp}
set output_dir {/home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus/top/top.runs/impl_1/.Xil/Vivado-12770-rulinux03.dhcp.fnal.gov/dbg_hub_CV.0/out}
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
