
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name dig_mac -dir "D:/Projects/Testbeam I/june 2015 fws/TB_STIB_MASTER_DIG_three_conns_phase_sel/CMS_TB_MASTER_/GEL_CAPTAN/planAhead_run_2" -part xc4vlx25ff668-10
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/Projects/Testbeam I/june 2015 fws/TB_STIB_MASTER_DIG_three_conns_phase_sel/CMS_TB_MASTER_/GEL_CAPTAN/TOP_LEVEL_cs.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Projects/Testbeam I/june 2015 fws/TB_STIB_MASTER_DIG_three_conns_phase_sel/CMS_TB_MASTER_/GEL_CAPTAN} }
set_property target_constrs_file "TOP_LEVEL.ucf" [current_fileset -constrset]
add_files [list {TOP_LEVEL.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/Projects/Testbeam I/june 2015 fws/TB_STIB_MASTER_DIG_three_conns_phase_sel/CMS_TB_MASTER_/GEL_CAPTAN/TOP_LEVEL.xdl"
if {[catch {read_twx -name results_1 -file "D:/Projects/Testbeam I/june 2015 fws/TB_STIB_MASTER_DIG_three_conns_phase_sel/CMS_TB_MASTER_/GEL_CAPTAN/TOP_LEVEL.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/Projects/Testbeam I/june 2015 fws/TB_STIB_MASTER_DIG_three_conns_phase_sel/CMS_TB_MASTER_/GEL_CAPTAN/TOP_LEVEL.twx\": $eInfo"
}
