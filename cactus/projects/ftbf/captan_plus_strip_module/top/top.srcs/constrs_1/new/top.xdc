








create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list MASTER_CLK]]
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {strip_imp/G[2].chipserdes4_imp/ddr_bitslip_count[0]} {strip_imp/G[2].chipserdes4_imp/ddr_bitslip_count[1]} {strip_imp/G[2].chipserdes4_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {strip_imp/G[0].chipserdes4_imp/iddrq[0]} {strip_imp/G[0].chipserdes4_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {strip_imp/G[1].chipserdes3_imp/iddrq[0]} {strip_imp/G[1].chipserdes3_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {strip_imp/G[0].chipserdes0_imp/iddrq[0]} {strip_imp/G[0].chipserdes0_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {strip_imp/G[3].chipserdes2_imp/ddr_bitslip_count[0]} {strip_imp/G[3].chipserdes2_imp/ddr_bitslip_count[1]} {strip_imp/G[3].chipserdes2_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {strip_imp/G[3].chipserdes1_imp/iddrq[0]} {strip_imp/G[3].chipserdes1_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 64 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {b_data[0]} {b_data[1]} {b_data[2]} {b_data[3]} {b_data[4]} {b_data[5]} {b_data[6]} {b_data[7]} {b_data[8]} {b_data[9]} {b_data[10]} {b_data[11]} {b_data[12]} {b_data[13]} {b_data[14]} {b_data[15]} {b_data[16]} {b_data[17]} {b_data[18]} {b_data[19]} {b_data[20]} {b_data[21]} {b_data[22]} {b_data[23]} {b_data[24]} {b_data[25]} {b_data[26]} {b_data[27]} {b_data[28]} {b_data[29]} {b_data[30]} {b_data[31]} {b_data[32]} {b_data[33]} {b_data[34]} {b_data[35]} {b_data[36]} {b_data[37]} {b_data[38]} {b_data[39]} {b_data[40]} {b_data[41]} {b_data[42]} {b_data[43]} {b_data[44]} {b_data[45]} {b_data[46]} {b_data[47]} {b_data[48]} {b_data[49]} {b_data[50]} {b_data[51]} {b_data[52]} {b_data[53]} {b_data[54]} {b_data[55]} {b_data[56]} {b_data[57]} {b_data[58]} {b_data[59]} {b_data[60]} {b_data[61]} {b_data[62]} {b_data[63]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {strip_imp/G[2].chipserdes1_imp/iddrq[0]} {strip_imp/G[2].chipserdes1_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {strip_imp/G[3].chipserdes3_imp/ddr_bitslip_count[0]} {strip_imp/G[3].chipserdes3_imp/ddr_bitslip_count[1]} {strip_imp/G[3].chipserdes3_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {strip_imp/G[1].chipserdes3_imp/ddr_bitslip_count[0]} {strip_imp/G[1].chipserdes3_imp/ddr_bitslip_count[1]} {strip_imp/G[1].chipserdes3_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {strip_imp/G[2].chipserdes3_imp/iddrq[0]} {strip_imp/G[2].chipserdes3_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {strip_imp/G[1].chipserdes4_imp/ddr_bitslip_count[0]} {strip_imp/G[1].chipserdes4_imp/ddr_bitslip_count[1]} {strip_imp/G[1].chipserdes4_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {strip_imp/G[1].chipserdes4_imp/iddrq[0]} {strip_imp/G[1].chipserdes4_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {PHY_TXD_sig[0]} {PHY_TXD_sig[1]} {PHY_TXD_sig[2]} {PHY_TXD_sig[3]} {PHY_TXD_sig[4]} {PHY_TXD_sig[5]} {PHY_TXD_sig[6]} {PHY_TXD_sig[7]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {strip_imp/G[3].chipserdes0_imp/iddrq[0]} {strip_imp/G[3].chipserdes0_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {strip_imp/G[0].chipserdes3_imp/iddrq[0]} {strip_imp/G[0].chipserdes3_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {strip_imp/G[1].chipserdes2_imp/iddrq[0]} {strip_imp/G[1].chipserdes2_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {strip_imp/G[0].chipserdes1_imp/ddr_bitslip_count[0]} {strip_imp/G[0].chipserdes1_imp/ddr_bitslip_count[1]} {strip_imp/G[0].chipserdes1_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {strip_imp/G[0].chipserdes3_imp/ddr_bitslip_count[0]} {strip_imp/G[0].chipserdes3_imp/ddr_bitslip_count[1]} {strip_imp/G[0].chipserdes3_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {strip_imp/G[1].chipserdes2_imp/ddr_bitslip_count[0]} {strip_imp/G[1].chipserdes2_imp/ddr_bitslip_count[1]} {strip_imp/G[1].chipserdes2_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {eth_interface/ec_wrapper/rx_data_handled[0]} {eth_interface/ec_wrapper/rx_data_handled[1]} {eth_interface/ec_wrapper/rx_data_handled[2]} {eth_interface/ec_wrapper/rx_data_handled[3]} {eth_interface/ec_wrapper/rx_data_handled[4]} {eth_interface/ec_wrapper/rx_data_handled[5]} {eth_interface/ec_wrapper/rx_data_handled[6]} {eth_interface/ec_wrapper/rx_data_handled[7]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {strip_imp/G[3].chipserdes0_imp/ddr_bitslip_count[0]} {strip_imp/G[3].chipserdes0_imp/ddr_bitslip_count[1]} {strip_imp/G[3].chipserdes0_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {strip_imp/G[3].chipserdes4_imp/ddr_bitslip_count[0]} {strip_imp/G[3].chipserdes4_imp/ddr_bitslip_count[1]} {strip_imp/G[3].chipserdes4_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {strip_imp/G[2].chipserdes2_imp/iddrq[0]} {strip_imp/G[2].chipserdes2_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {strip_imp/G[1].chipserdes1_imp/iddrq[0]} {strip_imp/G[1].chipserdes1_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {strip_imp/G[3].chipserdes4_imp/iddrq[0]} {strip_imp/G[3].chipserdes4_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {strip_imp/G[1].chipserdes1_imp/ddr_bitslip_count[0]} {strip_imp/G[1].chipserdes1_imp/ddr_bitslip_count[1]} {strip_imp/G[1].chipserdes1_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {strip_imp/G[0].chipserdes0_imp/ddr_bitslip_count[0]} {strip_imp/G[0].chipserdes0_imp/ddr_bitslip_count[1]} {strip_imp/G[0].chipserdes0_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {strip_imp/G[1].chipserdes0_imp/ddr_bitslip_count[0]} {strip_imp/G[1].chipserdes0_imp/ddr_bitslip_count[1]} {strip_imp/G[1].chipserdes0_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {strip_imp/G[3].chipserdes3_imp/iddrq[0]} {strip_imp/G[3].chipserdes3_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {strip_imp/G[0].chipserdes2_imp/ddr_bitslip_count[0]} {strip_imp/G[0].chipserdes2_imp/ddr_bitslip_count[1]} {strip_imp/G[0].chipserdes2_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {strip_imp/G[0].chipserdes2_imp/iddrq[0]} {strip_imp/G[0].chipserdes2_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {strip_imp/G[1].chipserdes0_imp/iddrq[0]} {strip_imp/G[1].chipserdes0_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {strip_imp/G[0].chipserdes4_imp/ddr_bitslip_count[0]} {strip_imp/G[0].chipserdes4_imp/ddr_bitslip_count[1]} {strip_imp/G[0].chipserdes4_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {strip_imp/G[3].chipserdes1_imp/ddr_bitslip_count[0]} {strip_imp/G[3].chipserdes1_imp/ddr_bitslip_count[1]} {strip_imp/G[3].chipserdes1_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {strip_imp/G[0].chipserdes1_imp/iddrq[0]} {strip_imp/G[0].chipserdes1_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {eth_interface/ec_wrapper/ethernet_controller/self_addr[0]} {eth_interface/ec_wrapper/ethernet_controller/self_addr[1]} {eth_interface/ec_wrapper/ethernet_controller/self_addr[2]} {eth_interface/ec_wrapper/ethernet_controller/self_addr[3]} {eth_interface/ec_wrapper/ethernet_controller/self_addr[4]} {eth_interface/ec_wrapper/ethernet_controller/self_addr[5]} {eth_interface/ec_wrapper/ethernet_controller/self_addr[6]} {eth_interface/ec_wrapper/ethernet_controller/self_addr[7]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {strip_imp/G[3].chipserdes2_imp/iddrq[0]} {strip_imp/G[3].chipserdes2_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {strip_imp/G[2].chipserdes4_imp/iddrq[0]} {strip_imp/G[2].chipserdes4_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 2 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {strip_imp/G[2].chipserdes0_imp/iddrq[0]} {strip_imp/G[2].chipserdes0_imp/iddrq[1]}]]
create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {STRIP_SCIN[0]} {STRIP_SCIN[1]} {STRIP_SCIN[2]} {STRIP_SCIN[3]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {strip_imp/G[2].chipserdes3_imp/ddr_bitslip_count[0]} {strip_imp/G[2].chipserdes3_imp/ddr_bitslip_count[1]} {strip_imp/G[2].chipserdes3_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {strip_imp/G[2].chipserdes0_imp/ddr_bitslip_count[0]} {strip_imp/G[2].chipserdes0_imp/ddr_bitslip_count[1]} {strip_imp/G[2].chipserdes0_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {strip_imp/G[2].chipserdes1_imp/ddr_bitslip_count[0]} {strip_imp/G[2].chipserdes1_imp/ddr_bitslip_count[1]} {strip_imp/G[2].chipserdes1_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {strip_imp/G[2].chipserdes2_imp/ddr_bitslip_count[0]} {strip_imp/G[2].chipserdes2_imp/ddr_bitslip_count[1]} {strip_imp/G[2].chipserdes2_imp/ddr_bitslip_count[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {strip_imp/G[0].chipserdes1_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {strip_imp/G[2].chipserdes1_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {strip_imp/G[1].chipserdes3_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {strip_imp/G[2].chipserdes2_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {strip_imp/G[3].chipserdes1_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {strip_imp/G[0].chipserdes3_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {strip_imp/G[1].chipserdes0_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {strip_imp/G[0].chipserdes2_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {strip_imp/G[1].chipserdes4_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {strip_imp/G[3].chipserdes2_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list {strip_imp/G[2].chipserdes4_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {strip_imp/G[2].chipserdes0_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list {strip_imp/G[1].chipserdes1_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list {strip_imp/G[3].chipserdes4_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list {strip_imp/G[0].chipserdes0_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list {strip_imp/G[1].chipserdes2_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list {strip_imp/G[2].chipserdes3_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list {strip_imp/G[3].chipserdes3_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list {strip_imp/G[3].chipserdes0_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list {strip_imp/G[0].chipserdes4_imp/ALIGNED}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list b_data_alert]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe66]
connect_debug_port u_ila_0/probe66 [get_nets [list b_data_we]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe67]
connect_debug_port u_ila_0/probe67 [get_nets [list CLK15NS]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe68]
connect_debug_port u_ila_0/probe68 [get_nets [list {strip_imp/G[0].chipserdes3_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe69]
connect_debug_port u_ila_0/probe69 [get_nets [list {strip_imp/G[1].chipserdes2_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe70]
connect_debug_port u_ila_0/probe70 [get_nets [list {strip_imp/G[0].chipserdes2_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe71]
connect_debug_port u_ila_0/probe71 [get_nets [list {strip_imp/G[1].chipserdes1_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe72]
connect_debug_port u_ila_0/probe72 [get_nets [list {strip_imp/G[3].chipserdes0_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe73]
connect_debug_port u_ila_0/probe73 [get_nets [list {strip_imp/G[0].chipserdes1_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe74]
connect_debug_port u_ila_0/probe74 [get_nets [list {strip_imp/G[2].chipserdes1_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe75]
connect_debug_port u_ila_0/probe75 [get_nets [list {strip_imp/G[2].chipserdes3_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe76]
connect_debug_port u_ila_0/probe76 [get_nets [list {strip_imp/G[0].chipserdes0_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe77]
connect_debug_port u_ila_0/probe77 [get_nets [list {strip_imp/G[2].chipserdes4_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe78]
connect_debug_port u_ila_0/probe78 [get_nets [list {strip_imp/G[0].chipserdes4_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe79]
connect_debug_port u_ila_0/probe79 [get_nets [list {strip_imp/G[1].chipserdes0_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe80]
connect_debug_port u_ila_0/probe80 [get_nets [list {strip_imp/G[2].chipserdes0_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe81]
connect_debug_port u_ila_0/probe81 [get_nets [list {strip_imp/G[3].chipserdes4_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe82]
connect_debug_port u_ila_0/probe82 [get_nets [list {strip_imp/G[3].chipserdes3_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe83]
connect_debug_port u_ila_0/probe83 [get_nets [list {strip_imp/G[1].chipserdes4_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe84]
connect_debug_port u_ila_0/probe84 [get_nets [list {strip_imp/G[3].chipserdes2_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe85]
connect_debug_port u_ila_0/probe85 [get_nets [list {strip_imp/G[3].chipserdes1_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe86]
connect_debug_port u_ila_0/probe86 [get_nets [list {strip_imp/G[2].chipserdes2_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe87]
connect_debug_port u_ila_0/probe87 [get_nets [list {strip_imp/G[1].chipserdes3_imp/DATA_LOST}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe88]
connect_debug_port u_ila_0/probe88 [get_nets [list {strip_imp/G[1].chipserdes4_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe89]
connect_debug_port u_ila_0/probe89 [get_nets [list {strip_imp/G[2].chipserdes3_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe90]
connect_debug_port u_ila_0/probe90 [get_nets [list {strip_imp/G[2].chipserdes4_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe91]
connect_debug_port u_ila_0/probe91 [get_nets [list {strip_imp/G[2].chipserdes0_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe92]
connect_debug_port u_ila_0/probe92 [get_nets [list {strip_imp/G[3].chipserdes2_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe93]
connect_debug_port u_ila_0/probe93 [get_nets [list {strip_imp/G[3].chipserdes1_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe94]
connect_debug_port u_ila_0/probe94 [get_nets [list {strip_imp/G[1].chipserdes3_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe95]
connect_debug_port u_ila_0/probe95 [get_nets [list {strip_imp/G[3].chipserdes3_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe96]
connect_debug_port u_ila_0/probe96 [get_nets [list {strip_imp/G[0].chipserdes4_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe97]
connect_debug_port u_ila_0/probe97 [get_nets [list {strip_imp/G[1].chipserdes1_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe98]
connect_debug_port u_ila_0/probe98 [get_nets [list {strip_imp/G[3].chipserdes4_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe99]
connect_debug_port u_ila_0/probe99 [get_nets [list {strip_imp/G[1].chipserdes2_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe100]
connect_debug_port u_ila_0/probe100 [get_nets [list {strip_imp/G[3].chipserdes0_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe101]
connect_debug_port u_ila_0/probe101 [get_nets [list {strip_imp/G[2].chipserdes2_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe102]
connect_debug_port u_ila_0/probe102 [get_nets [list {strip_imp/G[0].chipserdes1_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe103]
connect_debug_port u_ila_0/probe103 [get_nets [list {strip_imp/G[0].chipserdes0_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe104]
connect_debug_port u_ila_0/probe104 [get_nets [list {strip_imp/G[0].chipserdes3_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe105]
connect_debug_port u_ila_0/probe105 [get_nets [list {strip_imp/G[1].chipserdes0_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe106]
connect_debug_port u_ila_0/probe106 [get_nets [list {strip_imp/G[0].chipserdes2_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe107]
connect_debug_port u_ila_0/probe107 [get_nets [list {strip_imp/G[2].chipserdes1_imp/DATA_VALID}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe108]
connect_debug_port u_ila_0/probe108 [get_nets [list strip_imp/stripclk_imp/dcm_mclk_locked]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe109]
connect_debug_port u_ila_0/probe109 [get_nets [list {strip_imp/G[3].chipserdes4_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe110]
connect_debug_port u_ila_0/probe110 [get_nets [list {strip_imp/G[2].chipserdes4_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe111]
connect_debug_port u_ila_0/probe111 [get_nets [list {strip_imp/G[0].chipserdes2_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe112]
connect_debug_port u_ila_0/probe112 [get_nets [list {strip_imp/G[3].chipserdes2_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe113]
connect_debug_port u_ila_0/probe113 [get_nets [list {strip_imp/G[0].chipserdes4_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe114]
connect_debug_port u_ila_0/probe114 [get_nets [list {strip_imp/G[1].chipserdes0_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe115]
connect_debug_port u_ila_0/probe115 [get_nets [list {strip_imp/G[2].chipserdes0_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe116]
connect_debug_port u_ila_0/probe116 [get_nets [list {strip_imp/G[2].chipserdes3_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe117]
connect_debug_port u_ila_0/probe117 [get_nets [list {strip_imp/G[3].chipserdes1_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe118]
connect_debug_port u_ila_0/probe118 [get_nets [list {strip_imp/G[2].chipserdes2_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe119]
connect_debug_port u_ila_0/probe119 [get_nets [list {strip_imp/G[1].chipserdes1_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe120]
connect_debug_port u_ila_0/probe120 [get_nets [list {strip_imp/G[0].chipserdes0_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe121]
connect_debug_port u_ila_0/probe121 [get_nets [list {strip_imp/G[3].chipserdes0_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe122]
connect_debug_port u_ila_0/probe122 [get_nets [list {strip_imp/G[0].chipserdes3_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe123]
connect_debug_port u_ila_0/probe123 [get_nets [list {strip_imp/G[0].chipserdes1_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe124]
connect_debug_port u_ila_0/probe124 [get_nets [list {strip_imp/G[1].chipserdes2_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe125]
connect_debug_port u_ila_0/probe125 [get_nets [list {strip_imp/G[1].chipserdes4_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe126]
connect_debug_port u_ila_0/probe126 [get_nets [list {strip_imp/G[3].chipserdes3_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe127]
connect_debug_port u_ila_0/probe127 [get_nets [list {strip_imp/G[2].chipserdes1_imp/DLYCE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe128]
connect_debug_port u_ila_0/probe128 [get_nets [list {strip_imp/G[1].chipserdes3_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe129]
connect_debug_port u_ila_0/probe129 [get_nets [list {strip_imp/G[1].chipserdes0_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe130]
connect_debug_port u_ila_0/probe130 [get_nets [list {strip_imp/G[3].chipserdes1_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe131]
connect_debug_port u_ila_0/probe131 [get_nets [list {strip_imp/G[0].chipserdes4_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe132]
connect_debug_port u_ila_0/probe132 [get_nets [list {strip_imp/G[0].chipserdes2_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe133]
connect_debug_port u_ila_0/probe133 [get_nets [list {strip_imp/G[2].chipserdes1_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe134]
connect_debug_port u_ila_0/probe134 [get_nets [list {strip_imp/G[3].chipserdes4_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe135]
connect_debug_port u_ila_0/probe135 [get_nets [list {strip_imp/G[2].chipserdes2_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe136]
connect_debug_port u_ila_0/probe136 [get_nets [list {strip_imp/G[3].chipserdes2_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe137]
connect_debug_port u_ila_0/probe137 [get_nets [list {strip_imp/G[0].chipserdes3_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe138]
connect_debug_port u_ila_0/probe138 [get_nets [list {strip_imp/G[1].chipserdes1_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe139]
connect_debug_port u_ila_0/probe139 [get_nets [list {strip_imp/G[2].chipserdes3_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe140]
connect_debug_port u_ila_0/probe140 [get_nets [list {strip_imp/G[1].chipserdes4_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe141]
connect_debug_port u_ila_0/probe141 [get_nets [list {strip_imp/G[2].chipserdes4_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe142]
connect_debug_port u_ila_0/probe142 [get_nets [list {strip_imp/G[3].chipserdes0_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe143]
connect_debug_port u_ila_0/probe143 [get_nets [list {strip_imp/G[2].chipserdes0_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe144]
connect_debug_port u_ila_0/probe144 [get_nets [list {strip_imp/G[0].chipserdes1_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe145]
connect_debug_port u_ila_0/probe145 [get_nets [list {strip_imp/G[1].chipserdes2_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe146]
connect_debug_port u_ila_0/probe146 [get_nets [list {strip_imp/G[3].chipserdes3_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe147]
connect_debug_port u_ila_0/probe147 [get_nets [list {strip_imp/G[0].chipserdes0_imp/ENABLE}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe148]
connect_debug_port u_ila_0/probe148 [get_nets [list eth_strobe_mask]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe149]
connect_debug_port u_ila_0/probe149 [get_nets [list ext_clk]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe150]
connect_debug_port u_ila_0/probe150 [get_nets [list ext_cmd]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe151]
connect_debug_port u_ila_0/probe151 [get_nets [list {strip_imp/G[2].strip_fifo_imp/FIFO_FULL}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe152]
connect_debug_port u_ila_0/probe152 [get_nets [list {strip_imp/G[0].strip_fifo_imp/FIFO_FULL}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe153]
connect_debug_port u_ila_0/probe153 [get_nets [list {strip_imp/G[1].strip_fifo_imp/FIFO_FULL}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe154]
connect_debug_port u_ila_0/probe154 [get_nets [list {strip_imp/G[3].strip_fifo_imp/FIFO_FULL}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe155]
connect_debug_port u_ila_0/probe155 [get_nets [list HALT]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe156]
connect_debug_port u_ila_0/probe156 [get_nets [list eth_interface/ec_wrapper/ethernet_controller/DecipherBlock/is_arp_reply]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe157]
connect_debug_port u_ila_0/probe157 [get_nets [list eth_interface/ec_wrapper/ethernet_controller/is_arp_req]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe158]
connect_debug_port u_ila_0/probe158 [get_nets [list eth_interface/ec_wrapper/ethernet_controller/DecipherBlock/is_icmp_ping_sig]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe159]
connect_debug_port u_ila_0/probe159 [get_nets [list eth_interface/ec_wrapper/ethernet_controller/DecipherBlock/is_ip_sig]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe160]
connect_debug_port u_ila_0/probe160 [get_nets [list eth_interface/ec_wrapper/ethernet_controller/DecipherBlock/is_udp_sig23_out]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe161]
connect_debug_port u_ila_0/probe161 [get_nets [list masked_rx_wren]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe162]
connect_debug_port u_ila_0/probe162 [get_nets [list masked_tx_rden]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe163]
connect_debug_port u_ila_0/probe163 [get_nets [list PHY_TXEN_sig]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe164]
connect_debug_port u_ila_0/probe164 [get_nets [list strip_imp/stripclk_imp/reset]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe165]
connect_debug_port u_ila_0/probe165 [get_nets [list strip_imp/reset_busy]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe166]
connect_debug_port u_ila_0/probe166 [get_nets [list eth_interface/ec_wrapper/rx_dv_handled]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe167]
connect_debug_port u_ila_0/probe167 [get_nets [list rx_wren]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe168]
connect_debug_port u_ila_0/probe168 [get_nets [list strip_imp/sc_busy]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe169]
connect_debug_port u_ila_0/probe169 [get_nets [list strip_imp/something_busy]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe170]
connect_debug_port u_ila_0/probe170 [get_nets [list START]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe171]
connect_debug_port u_ila_0/probe171 [get_nets [list strip_bwe]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe172]
connect_debug_port u_ila_0/probe172 [get_nets [list strip_clocks_locked]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe173]
connect_debug_port u_ila_0/probe173 [get_nets [list {strip_imp/G[2].strip_fifo_imp/STRIP_FIFO_EMPTY}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe174]
connect_debug_port u_ila_0/probe174 [get_nets [list {strip_imp/G[3].strip_fifo_imp/STRIP_FIFO_EMPTY}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe175]
connect_debug_port u_ila_0/probe175 [get_nets [list {strip_imp/G[1].strip_fifo_imp/STRIP_FIFO_EMPTY}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe176]
connect_debug_port u_ila_0/probe176 [get_nets [list {strip_imp/G[0].strip_fifo_imp/STRIP_FIFO_EMPTY}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe177]
connect_debug_port u_ila_0/probe177 [get_nets [list strip_ready_and]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe178]
connect_debug_port u_ila_0/probe178 [get_nets [list {strip_imp/G[2].chipserdes0_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe179]
connect_debug_port u_ila_0/probe179 [get_nets [list {strip_imp/G[3].chipserdes4_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe180]
connect_debug_port u_ila_0/probe180 [get_nets [list {strip_imp/G[1].chipserdes0_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe181]
connect_debug_port u_ila_0/probe181 [get_nets [list {strip_imp/G[0].chipserdes2_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe182]
connect_debug_port u_ila_0/probe182 [get_nets [list {strip_imp/G[3].chipserdes1_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe183]
connect_debug_port u_ila_0/probe183 [get_nets [list {strip_imp/G[3].chipserdes2_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe184]
connect_debug_port u_ila_0/probe184 [get_nets [list {strip_imp/G[1].chipserdes3_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe185]
connect_debug_port u_ila_0/probe185 [get_nets [list {strip_imp/G[2].chipserdes3_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe186]
connect_debug_port u_ila_0/probe186 [get_nets [list {strip_imp/G[2].chipserdes2_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe187]
connect_debug_port u_ila_0/probe187 [get_nets [list {strip_imp/G[1].chipserdes2_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe188]
connect_debug_port u_ila_0/probe188 [get_nets [list {strip_imp/G[1].chipserdes1_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe189]
connect_debug_port u_ila_0/probe189 [get_nets [list {strip_imp/G[0].chipserdes3_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe190]
connect_debug_port u_ila_0/probe190 [get_nets [list {strip_imp/G[2].chipserdes1_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe191]
connect_debug_port u_ila_0/probe191 [get_nets [list {strip_imp/G[1].chipserdes4_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe192]
connect_debug_port u_ila_0/probe192 [get_nets [list {strip_imp/G[3].chipserdes0_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe193]
connect_debug_port u_ila_0/probe193 [get_nets [list {strip_imp/G[0].chipserdes1_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe194]
connect_debug_port u_ila_0/probe194 [get_nets [list {strip_imp/G[3].chipserdes3_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe195]
connect_debug_port u_ila_0/probe195 [get_nets [list {strip_imp/G[0].chipserdes0_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe196]
connect_debug_port u_ila_0/probe196 [get_nets [list {strip_imp/G[2].chipserdes4_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe197]
connect_debug_port u_ila_0/probe197 [get_nets [list {strip_imp/G[0].chipserdes4_imp/SYNC_ERROR}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe198]
connect_debug_port u_ila_0/probe198 [get_nets [list strip_imp/trigproc_imp/trig_fifo_we]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe199]
connect_debug_port u_ila_0/probe199 [get_nets [list TRIGGER]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe200]
connect_debug_port u_ila_0/probe200 [get_nets [list strip_imp/trigproc_imp/trigger_state]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe201]
connect_debug_port u_ila_0/probe201 [get_nets [list tx_rden]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe202]
connect_debug_port u_ila_0/probe202 [get_nets [list {strip_imp/G[2].chipserdes2_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe203]
connect_debug_port u_ila_0/probe203 [get_nets [list {strip_imp/G[1].chipserdes2_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe204]
connect_debug_port u_ila_0/probe204 [get_nets [list {strip_imp/G[1].chipserdes4_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe205]
connect_debug_port u_ila_0/probe205 [get_nets [list {strip_imp/G[1].chipserdes3_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe206]
connect_debug_port u_ila_0/probe206 [get_nets [list {strip_imp/G[2].chipserdes1_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe207]
connect_debug_port u_ila_0/probe207 [get_nets [list {strip_imp/G[0].chipserdes3_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe208]
connect_debug_port u_ila_0/probe208 [get_nets [list {strip_imp/G[3].chipserdes0_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe209]
connect_debug_port u_ila_0/probe209 [get_nets [list {strip_imp/G[0].chipserdes1_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe210]
connect_debug_port u_ila_0/probe210 [get_nets [list {strip_imp/G[3].chipserdes3_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe211]
connect_debug_port u_ila_0/probe211 [get_nets [list {strip_imp/G[0].chipserdes0_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe212]
connect_debug_port u_ila_0/probe212 [get_nets [list {strip_imp/G[2].chipserdes4_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe213]
connect_debug_port u_ila_0/probe213 [get_nets [list {strip_imp/G[0].chipserdes4_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe214]
connect_debug_port u_ila_0/probe214 [get_nets [list {strip_imp/G[2].chipserdes0_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe215]
connect_debug_port u_ila_0/probe215 [get_nets [list {strip_imp/G[3].chipserdes4_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe216]
connect_debug_port u_ila_0/probe216 [get_nets [list {strip_imp/G[1].chipserdes0_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe217]
connect_debug_port u_ila_0/probe217 [get_nets [list {strip_imp/G[3].chipserdes1_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe218]
connect_debug_port u_ila_0/probe218 [get_nets [list {strip_imp/G[0].chipserdes2_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe219]
connect_debug_port u_ila_0/probe219 [get_nets [list {strip_imp/G[3].chipserdes2_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe220]
connect_debug_port u_ila_0/probe220 [get_nets [list {strip_imp/G[1].chipserdes1_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe221]
connect_debug_port u_ila_0/probe221 [get_nets [list {strip_imp/G[2].chipserdes3_imp/VALID_SET_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe222]
connect_debug_port u_ila_0/probe222 [get_nets [list {strip_imp/G[0].chipserdes3_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe223]
connect_debug_port u_ila_0/probe223 [get_nets [list {strip_imp/G[1].chipserdes2_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe224]
connect_debug_port u_ila_0/probe224 [get_nets [list {strip_imp/G[0].chipserdes0_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe225]
connect_debug_port u_ila_0/probe225 [get_nets [list {strip_imp/G[3].chipserdes0_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe226]
connect_debug_port u_ila_0/probe226 [get_nets [list {strip_imp/G[0].chipserdes1_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe227]
connect_debug_port u_ila_0/probe227 [get_nets [list {strip_imp/G[1].chipserdes4_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe228]
connect_debug_port u_ila_0/probe228 [get_nets [list {strip_imp/G[1].chipserdes3_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe229]
connect_debug_port u_ila_0/probe229 [get_nets [list {strip_imp/G[2].chipserdes4_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe230]
connect_debug_port u_ila_0/probe230 [get_nets [list {strip_imp/G[0].chipserdes4_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe231]
connect_debug_port u_ila_0/probe231 [get_nets [list {strip_imp/G[3].chipserdes3_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe232]
connect_debug_port u_ila_0/probe232 [get_nets [list {strip_imp/G[0].chipserdes2_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe233]
connect_debug_port u_ila_0/probe233 [get_nets [list {strip_imp/G[1].chipserdes0_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe234]
connect_debug_port u_ila_0/probe234 [get_nets [list {strip_imp/G[2].chipserdes0_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe235]
connect_debug_port u_ila_0/probe235 [get_nets [list {strip_imp/G[3].chipserdes4_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe236]
connect_debug_port u_ila_0/probe236 [get_nets [list {strip_imp/G[3].chipserdes1_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe237]
connect_debug_port u_ila_0/probe237 [get_nets [list {strip_imp/G[3].chipserdes2_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe238]
connect_debug_port u_ila_0/probe238 [get_nets [list {strip_imp/G[2].chipserdes1_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe239]
connect_debug_port u_ila_0/probe239 [get_nets [list {strip_imp/G[2].chipserdes3_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe240]
connect_debug_port u_ila_0/probe240 [get_nets [list {strip_imp/G[2].chipserdes2_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe241]
connect_debug_port u_ila_0/probe241 [get_nets [list {strip_imp/G[1].chipserdes1_imp/VALID_STRIP_NUMBER}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe242]
connect_debug_port u_ila_0/probe242 [get_nets [list {strip_imp/G[0].chipserdes3_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe243]
connect_debug_port u_ila_0/probe243 [get_nets [list {strip_imp/G[1].chipserdes4_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe244]
connect_debug_port u_ila_0/probe244 [get_nets [list {strip_imp/G[1].chipserdes3_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe245]
connect_debug_port u_ila_0/probe245 [get_nets [list {strip_imp/G[3].chipserdes0_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe246]
connect_debug_port u_ila_0/probe246 [get_nets [list {strip_imp/G[2].chipserdes4_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe247]
connect_debug_port u_ila_0/probe247 [get_nets [list {strip_imp/G[0].chipserdes1_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe248]
connect_debug_port u_ila_0/probe248 [get_nets [list {strip_imp/G[1].chipserdes2_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe249]
connect_debug_port u_ila_0/probe249 [get_nets [list {strip_imp/G[3].chipserdes3_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe250]
connect_debug_port u_ila_0/probe250 [get_nets [list {strip_imp/G[2].chipserdes0_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe251]
connect_debug_port u_ila_0/probe251 [get_nets [list {strip_imp/G[0].chipserdes0_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe252]
connect_debug_port u_ila_0/probe252 [get_nets [list {strip_imp/G[1].chipserdes1_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe253]
connect_debug_port u_ila_0/probe253 [get_nets [list {strip_imp/G[1].chipserdes0_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe254]
connect_debug_port u_ila_0/probe254 [get_nets [list {strip_imp/G[0].chipserdes2_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe255]
connect_debug_port u_ila_0/probe255 [get_nets [list {strip_imp/G[0].chipserdes4_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe256]
connect_debug_port u_ila_0/probe256 [get_nets [list {strip_imp/G[3].chipserdes1_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe257]
connect_debug_port u_ila_0/probe257 [get_nets [list {strip_imp/G[3].chipserdes4_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe258]
connect_debug_port u_ila_0/probe258 [get_nets [list {strip_imp/G[2].chipserdes1_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe259]
connect_debug_port u_ila_0/probe259 [get_nets [list {strip_imp/G[2].chipserdes3_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe260]
connect_debug_port u_ila_0/probe260 [get_nets [list {strip_imp/G[2].chipserdes2_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe261]
connect_debug_port u_ila_0/probe261 [get_nets [list {strip_imp/G[3].chipserdes2_imp/VALID_SYNC_WORD}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe262]
connect_debug_port u_ila_0/probe262 [get_nets [list {strip_imp/G[0].chipserdes0_imp/RESET}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe263]
connect_debug_port u_ila_0/probe263 [get_nets [list {strip_imp/G[1].chipserdes0_imp/RESET}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe264]
connect_debug_port u_ila_0/probe264 [get_nets [list {strip_imp/G[2].chipserdes0_imp/RESET}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe265]
connect_debug_port u_ila_0/probe265 [get_nets [list {strip_imp/G[3].chipserdes0_imp/RESET}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets MASTER_CLK]
