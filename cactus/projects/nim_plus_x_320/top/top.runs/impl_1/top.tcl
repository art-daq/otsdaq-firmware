proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.cache/wt [current_project]
  set_property parent.project_path /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.xpr [current_project]
  set_property ip_repo_paths /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.cache/ip [current_project]
  set_property ip_output_repo /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.cache/ip [current_project]
  add_files -quiet /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/synth_1/top.dcp
  add_files -quiet /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/NIM_CLKS_synth_1/NIM_CLKS.dcp
  set_property netlist_only true [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/NIM_CLKS_synth_1/NIM_CLKS.dcp]
  add_files -quiet /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp
  set_property netlist_only true [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp]
  add_files -quiet /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/clk_wiz_1_synth_1/clk_wiz_1.dcp
  set_property netlist_only true [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/clk_wiz_1_synth_1/clk_wiz_1.dcp]
  add_files -quiet /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/clk_wiz_2_synth_1/clk_wiz_2.dcp
  set_property netlist_only true [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/clk_wiz_2_synth_1/clk_wiz_2.dcp]
  add_files -quiet /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/xilinx_64b_counter_synth_1/xilinx_64b_counter.dcp
  set_property netlist_only true [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.runs/xilinx_64b_counter_synth_1/xilinx_64b_counter.dcp]
  read_xdc -mode out_of_context -ref NIM_CLKS -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_ooc.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_ooc.xdc]
  read_xdc -prop_thru_buffers -ref NIM_CLKS -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_board.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS_board.xdc]
  read_xdc -ref NIM_CLKS -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/NIM_CLKS/NIM_CLKS.xdc]
  read_xdc -mode out_of_context -ref clk_wiz_0 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
  read_xdc -ref clk_wiz_0 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
  read_xdc -mode out_of_context -ref clk_wiz_1 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_ooc.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_1 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_board.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_board.xdc]
  read_xdc -ref clk_wiz_1 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1.xdc]
  read_xdc -mode out_of_context -ref clk_wiz_2 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_2/clk_wiz_2_ooc.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_2/clk_wiz_2_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_2 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_2/clk_wiz_2_board.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_2/clk_wiz_2_board.xdc]
  read_xdc -ref clk_wiz_2 -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_2/clk_wiz_2.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/clk_wiz_2/clk_wiz_2.xdc]
  read_xdc -mode out_of_context -ref xilinx_64b_counter -cells U0 /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/xilinx_64b_counter/xilinx_64b_counter_ooc.xdc
  set_property processing_order EARLY [get_files /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/sources_1/ip/xilinx_64b_counter/xilinx_64b_counter_ooc.xdc]
  read_xdc -unmanaged /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/constrs_1/imports/ucf/pins.tcl
  read_xdc -unmanaged /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/constrs_1/imports/ucf/clock_constraints.tcl
  read_xdc /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus_x_320/top/top.srcs/constrs_1/new/top_12.xdc
  link_design -top top -part xc7k325tffg900-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force top_opt.dcp
  catch {report_drc -file top_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file top.hwdef}
  place_design 
  write_checkpoint -force top_placed.dcp
  catch { report_io -file top_io_placed.rpt }
  catch { report_utilization -file top_utilization_placed.rpt -pb top_utilization_placed.pb }
  catch { report_control_sets -verbose -file top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force top_routed.dcp
  catch { report_drc -file top_drc_routed.rpt -pb top_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file top_timing_summary_routed.rpt -rpx top_timing_summary_routed.rpx }
  catch { report_power -file top_power_routed.rpt -pb top_power_summary_routed.pb }
  catch { report_route_status -file top_route_status.rpt -pb top_route_status.pb }
  catch { report_clock_utilization -file top_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force top.bit 
  catch { write_sysdef -hwdef top.hwdef -bitfile top.bit -meminfo top.mmi -ltxfile debug_nets.ltx -file top.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

