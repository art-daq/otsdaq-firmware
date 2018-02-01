



#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list MASTER_CLK]]
#set_property port_width 8 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {PHY_TXD_sig[0]} {PHY_TXD_sig[1]} {PHY_TXD_sig[2]} {PHY_TXD_sig[3]} {PHY_TXD_sig[4]} {PHY_TXD_sig[5]} {PHY_TXD_sig[6]} {PHY_TXD_sig[7]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 64 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {b_data[0]} {b_data[1]} {b_data[2]} {b_data[3]} {b_data[4]} {b_data[5]} {b_data[6]} {b_data[7]} {b_data[8]} {b_data[9]} {b_data[10]} {b_data[11]} {b_data[12]} {b_data[13]} {b_data[14]} {b_data[15]} {b_data[16]} {b_data[17]} {b_data[18]} {b_data[19]} {b_data[20]} {b_data[21]} {b_data[22]} {b_data[23]} {b_data[24]} {b_data[25]} {b_data[26]} {b_data[27]} {b_data[28]} {b_data[29]} {b_data[30]} {b_data[31]} {b_data[32]} {b_data[33]} {b_data[34]} {b_data[35]} {b_data[36]} {b_data[37]} {b_data[38]} {b_data[39]} {b_data[40]} {b_data[41]} {b_data[42]} {b_data[43]} {b_data[44]} {b_data[45]} {b_data[46]} {b_data[47]} {b_data[48]} {b_data[49]} {b_data[50]} {b_data[51]} {b_data[52]} {b_data[53]} {b_data[54]} {b_data[55]} {b_data[56]} {b_data[57]} {b_data[58]} {b_data[59]} {b_data[60]} {b_data[61]} {b_data[62]} {b_data[63]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 4 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list {nim_input[0]} {nim_input[1]} {nim_input[2]} {nim_input[3]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 32 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list {NIM_BLOCK/out_ctr_2[0]} {NIM_BLOCK/out_ctr_2[1]} {NIM_BLOCK/out_ctr_2[2]} {NIM_BLOCK/out_ctr_2[3]} {NIM_BLOCK/out_ctr_2[4]} {NIM_BLOCK/out_ctr_2[5]} {NIM_BLOCK/out_ctr_2[6]} {NIM_BLOCK/out_ctr_2[7]} {NIM_BLOCK/out_ctr_2[8]} {NIM_BLOCK/out_ctr_2[9]} {NIM_BLOCK/out_ctr_2[10]} {NIM_BLOCK/out_ctr_2[11]} {NIM_BLOCK/out_ctr_2[12]} {NIM_BLOCK/out_ctr_2[13]} {NIM_BLOCK/out_ctr_2[14]} {NIM_BLOCK/out_ctr_2[15]} {NIM_BLOCK/out_ctr_2[16]} {NIM_BLOCK/out_ctr_2[17]} {NIM_BLOCK/out_ctr_2[18]} {NIM_BLOCK/out_ctr_2[19]} {NIM_BLOCK/out_ctr_2[20]} {NIM_BLOCK/out_ctr_2[21]} {NIM_BLOCK/out_ctr_2[22]} {NIM_BLOCK/out_ctr_2[23]} {NIM_BLOCK/out_ctr_2[24]} {NIM_BLOCK/out_ctr_2[25]} {NIM_BLOCK/out_ctr_2[26]} {NIM_BLOCK/out_ctr_2[27]} {NIM_BLOCK/out_ctr_2[28]} {NIM_BLOCK/out_ctr_2[29]} {NIM_BLOCK/out_ctr_2[30]} {NIM_BLOCK/out_ctr_2[31]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 64 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list {NIM_BLOCK/cnt64_simp_out[0]} {NIM_BLOCK/cnt64_simp_out[1]} {NIM_BLOCK/cnt64_simp_out[2]} {NIM_BLOCK/cnt64_simp_out[3]} {NIM_BLOCK/cnt64_simp_out[4]} {NIM_BLOCK/cnt64_simp_out[5]} {NIM_BLOCK/cnt64_simp_out[6]} {NIM_BLOCK/cnt64_simp_out[7]} {NIM_BLOCK/cnt64_simp_out[8]} {NIM_BLOCK/cnt64_simp_out[9]} {NIM_BLOCK/cnt64_simp_out[10]} {NIM_BLOCK/cnt64_simp_out[11]} {NIM_BLOCK/cnt64_simp_out[12]} {NIM_BLOCK/cnt64_simp_out[13]} {NIM_BLOCK/cnt64_simp_out[14]} {NIM_BLOCK/cnt64_simp_out[15]} {NIM_BLOCK/cnt64_simp_out[16]} {NIM_BLOCK/cnt64_simp_out[17]} {NIM_BLOCK/cnt64_simp_out[18]} {NIM_BLOCK/cnt64_simp_out[19]} {NIM_BLOCK/cnt64_simp_out[20]} {NIM_BLOCK/cnt64_simp_out[21]} {NIM_BLOCK/cnt64_simp_out[22]} {NIM_BLOCK/cnt64_simp_out[23]} {NIM_BLOCK/cnt64_simp_out[24]} {NIM_BLOCK/cnt64_simp_out[25]} {NIM_BLOCK/cnt64_simp_out[26]} {NIM_BLOCK/cnt64_simp_out[27]} {NIM_BLOCK/cnt64_simp_out[28]} {NIM_BLOCK/cnt64_simp_out[29]} {NIM_BLOCK/cnt64_simp_out[30]} {NIM_BLOCK/cnt64_simp_out[31]} {NIM_BLOCK/cnt64_simp_out[32]} {NIM_BLOCK/cnt64_simp_out[33]} {NIM_BLOCK/cnt64_simp_out[34]} {NIM_BLOCK/cnt64_simp_out[35]} {NIM_BLOCK/cnt64_simp_out[36]} {NIM_BLOCK/cnt64_simp_out[37]} {NIM_BLOCK/cnt64_simp_out[38]} {NIM_BLOCK/cnt64_simp_out[39]} {NIM_BLOCK/cnt64_simp_out[40]} {NIM_BLOCK/cnt64_simp_out[41]} {NIM_BLOCK/cnt64_simp_out[42]} {NIM_BLOCK/cnt64_simp_out[43]} {NIM_BLOCK/cnt64_simp_out[44]} {NIM_BLOCK/cnt64_simp_out[45]} {NIM_BLOCK/cnt64_simp_out[46]} {NIM_BLOCK/cnt64_simp_out[47]} {NIM_BLOCK/cnt64_simp_out[48]} {NIM_BLOCK/cnt64_simp_out[49]} {NIM_BLOCK/cnt64_simp_out[50]} {NIM_BLOCK/cnt64_simp_out[51]} {NIM_BLOCK/cnt64_simp_out[52]} {NIM_BLOCK/cnt64_simp_out[53]} {NIM_BLOCK/cnt64_simp_out[54]} {NIM_BLOCK/cnt64_simp_out[55]} {NIM_BLOCK/cnt64_simp_out[56]} {NIM_BLOCK/cnt64_simp_out[57]} {NIM_BLOCK/cnt64_simp_out[58]} {NIM_BLOCK/cnt64_simp_out[59]} {NIM_BLOCK/cnt64_simp_out[60]} {NIM_BLOCK/cnt64_simp_out[61]} {NIM_BLOCK/cnt64_simp_out[62]} {NIM_BLOCK/cnt64_simp_out[63]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 32 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list {NIM_BLOCK/out_ctr_3[0]} {NIM_BLOCK/out_ctr_3[1]} {NIM_BLOCK/out_ctr_3[2]} {NIM_BLOCK/out_ctr_3[3]} {NIM_BLOCK/out_ctr_3[4]} {NIM_BLOCK/out_ctr_3[5]} {NIM_BLOCK/out_ctr_3[6]} {NIM_BLOCK/out_ctr_3[7]} {NIM_BLOCK/out_ctr_3[8]} {NIM_BLOCK/out_ctr_3[9]} {NIM_BLOCK/out_ctr_3[10]} {NIM_BLOCK/out_ctr_3[11]} {NIM_BLOCK/out_ctr_3[12]} {NIM_BLOCK/out_ctr_3[13]} {NIM_BLOCK/out_ctr_3[14]} {NIM_BLOCK/out_ctr_3[15]} {NIM_BLOCK/out_ctr_3[16]} {NIM_BLOCK/out_ctr_3[17]} {NIM_BLOCK/out_ctr_3[18]} {NIM_BLOCK/out_ctr_3[19]} {NIM_BLOCK/out_ctr_3[20]} {NIM_BLOCK/out_ctr_3[21]} {NIM_BLOCK/out_ctr_3[22]} {NIM_BLOCK/out_ctr_3[23]} {NIM_BLOCK/out_ctr_3[24]} {NIM_BLOCK/out_ctr_3[25]} {NIM_BLOCK/out_ctr_3[26]} {NIM_BLOCK/out_ctr_3[27]} {NIM_BLOCK/out_ctr_3[28]} {NIM_BLOCK/out_ctr_3[29]} {NIM_BLOCK/out_ctr_3[30]} {NIM_BLOCK/out_ctr_3[31]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 32 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list {NIM_BLOCK/out_ctr_1[0]} {NIM_BLOCK/out_ctr_1[1]} {NIM_BLOCK/out_ctr_1[2]} {NIM_BLOCK/out_ctr_1[3]} {NIM_BLOCK/out_ctr_1[4]} {NIM_BLOCK/out_ctr_1[5]} {NIM_BLOCK/out_ctr_1[6]} {NIM_BLOCK/out_ctr_1[7]} {NIM_BLOCK/out_ctr_1[8]} {NIM_BLOCK/out_ctr_1[9]} {NIM_BLOCK/out_ctr_1[10]} {NIM_BLOCK/out_ctr_1[11]} {NIM_BLOCK/out_ctr_1[12]} {NIM_BLOCK/out_ctr_1[13]} {NIM_BLOCK/out_ctr_1[14]} {NIM_BLOCK/out_ctr_1[15]} {NIM_BLOCK/out_ctr_1[16]} {NIM_BLOCK/out_ctr_1[17]} {NIM_BLOCK/out_ctr_1[18]} {NIM_BLOCK/out_ctr_1[19]} {NIM_BLOCK/out_ctr_1[20]} {NIM_BLOCK/out_ctr_1[21]} {NIM_BLOCK/out_ctr_1[22]} {NIM_BLOCK/out_ctr_1[23]} {NIM_BLOCK/out_ctr_1[24]} {NIM_BLOCK/out_ctr_1[25]} {NIM_BLOCK/out_ctr_1[26]} {NIM_BLOCK/out_ctr_1[27]} {NIM_BLOCK/out_ctr_1[28]} {NIM_BLOCK/out_ctr_1[29]} {NIM_BLOCK/out_ctr_1[30]} {NIM_BLOCK/out_ctr_1[31]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 32 [get_debug_ports u_ila_0/probe7]
#connect_debug_port u_ila_0/probe7 [get_nets [list {NIM_BLOCK/out_ctr_4[0]} {NIM_BLOCK/out_ctr_4[1]} {NIM_BLOCK/out_ctr_4[2]} {NIM_BLOCK/out_ctr_4[3]} {NIM_BLOCK/out_ctr_4[4]} {NIM_BLOCK/out_ctr_4[5]} {NIM_BLOCK/out_ctr_4[6]} {NIM_BLOCK/out_ctr_4[7]} {NIM_BLOCK/out_ctr_4[8]} {NIM_BLOCK/out_ctr_4[9]} {NIM_BLOCK/out_ctr_4[10]} {NIM_BLOCK/out_ctr_4[11]} {NIM_BLOCK/out_ctr_4[12]} {NIM_BLOCK/out_ctr_4[13]} {NIM_BLOCK/out_ctr_4[14]} {NIM_BLOCK/out_ctr_4[15]} {NIM_BLOCK/out_ctr_4[16]} {NIM_BLOCK/out_ctr_4[17]} {NIM_BLOCK/out_ctr_4[18]} {NIM_BLOCK/out_ctr_4[19]} {NIM_BLOCK/out_ctr_4[20]} {NIM_BLOCK/out_ctr_4[21]} {NIM_BLOCK/out_ctr_4[22]} {NIM_BLOCK/out_ctr_4[23]} {NIM_BLOCK/out_ctr_4[24]} {NIM_BLOCK/out_ctr_4[25]} {NIM_BLOCK/out_ctr_4[26]} {NIM_BLOCK/out_ctr_4[27]} {NIM_BLOCK/out_ctr_4[28]} {NIM_BLOCK/out_ctr_4[29]} {NIM_BLOCK/out_ctr_4[30]} {NIM_BLOCK/out_ctr_4[31]}]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe8]
#connect_debug_port u_ila_0/probe8 [get_nets [list b_data_we]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe9]
#connect_debug_port u_ila_0/probe9 [get_nets [list bmx_40]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe10]
#connect_debug_port u_ila_0/probe10 [get_nets [list NIM_BLOCK/clk_39_out]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe11]
#connect_debug_port u_ila_0/probe11 [get_nets [list ei40_gen_lock]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe12]
#connect_debug_port u_ila_0/probe12 [get_nets [list fs_gen_lock]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe13]
#connect_debug_port u_ila_0/probe13 [get_nets [list nim_clk_lock]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe14]
#connect_debug_port u_ila_0/probe14 [get_nets [list ot_ps_lock]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe15]
#connect_debug_port u_ila_0/probe15 [get_nets [list NIM_BLOCK/out_cnt_rst]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe16]
#connect_debug_port u_ila_0/probe16 [get_nets [list PHY_TXEN_sig]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe17]
#connect_debug_port u_ila_0/probe17 [get_nets [list s_clk25_6e]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe18]
#connect_debug_port u_ila_0/probe18 [get_nets [list s_nim_out0]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe19]
#connect_debug_port u_ila_0/probe19 [get_nets [list s_nim_out1]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe20]
#connect_debug_port u_ila_0/probe20 [get_nets [list s_nim_out2]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe21]
#connect_debug_port u_ila_0/probe21 [get_nets [list s_nim_out3]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe22]
#connect_debug_port u_ila_0/probe22 [get_nets [list NIM_BLOCK/sig_log]]
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe23]
#connect_debug_port u_ila_0/probe23 [get_nets [list eth_interface/ec_wrapper/ethernet_controller/DecipherBlock/udp_data_valid]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets MASTER_CLK]









create_debug_core u_ila_0_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0_0]
set_property port_width 1 [get_debug_ports u_ila_0_0/clk]
connect_debug_port u_ila_0_0/clk [get_nets [list MASTER_CLK]]
set_property port_width 4 [get_debug_ports u_ila_0_0/probe0]
connect_debug_port u_ila_0_0/probe0 [get_nets [list {nim_input[0]} {nim_input[1]} {nim_input[2]} {nim_input[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list s_nim_out0]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe2]
connect_debug_port u_ila_0_0/probe2 [get_nets [list s_nim_out1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe3]
connect_debug_port u_ila_0_0/probe3 [get_nets [list s_nim_out2]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe4]
connect_debug_port u_ila_0_0/probe4 [get_nets [list s_nim_out3]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe5]
connect_debug_port u_ila_0_0/probe5 [get_nets [list ei40_gen_lock]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe6]
connect_debug_port u_ila_0_0/probe6 [get_nets [list fs_gen_lock]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe7]
connect_debug_port u_ila_0_0/probe7 [get_nets [list nim_clk_lock]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe8]
connect_debug_port u_ila_0_0/probe8 [get_nets [list s_clk40e]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe9]
connect_debug_port u_ila_0_0/probe9 [get_nets [list NIM_BLOCK/sig_log]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe10]
connect_debug_port u_ila_0_0/probe10 [get_nets [list eth_interface/ec_wrapper/ethernet_controller/DecipherBlock/udp_data_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets MASTER_CLK]
