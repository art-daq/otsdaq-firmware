
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name dig_mac -dir "C:/Users/rrivera/Desktop/CMS_TB_MASTER_/GEL_CAPTAN/planAhead_run_1" -part xc4vlx25ff668-10
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/rrivera/Desktop/CMS_TB_MASTER_/GEL_CAPTAN/TOP_LEVEL.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/rrivera/Desktop/CMS_TB_MASTER_/GEL_CAPTAN} }
set_param project.paUcfFile  "TOP_LEVEL.ucf"
add_files "TOP_LEVEL.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
