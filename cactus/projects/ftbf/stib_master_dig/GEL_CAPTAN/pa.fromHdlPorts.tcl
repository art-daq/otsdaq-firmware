
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

hdi::project new -name dig_mac -dir "C:/Documents and Settings/uplegger/Desktop/test beam MAR 2011/CMS_TB_DUAL_MASTER_FROM_64/GEL_CAPTAN/planAhead_run_1"
hdi::project setArch -name dig_mac -arch virtex4
hdi::design setOptions -project dig_mac -top netlist_1_EMPTY
hdi::param set -name project.paUcfFile -svalue "TOP_LEVEL.ucf"
hdi::floorplan new -name floorplan_1 -part xc4vlx25ff668-10 -project dig_mac
hdi::port import -project dig_mac -verilog {dig_mac_pa_ports.v work}
hdi::pconst import -project dig_mac -floorplan floorplan_1 -file "TOP_LEVEL.ucf"
