





create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list WRCLK]]
set_property port_width 64 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {s_b_read[0]} {s_b_read[1]} {s_b_read[2]} {s_b_read[3]} {s_b_read[4]} {s_b_read[5]} {s_b_read[6]} {s_b_read[7]} {s_b_read[8]} {s_b_read[9]} {s_b_read[10]} {s_b_read[11]} {s_b_read[12]} {s_b_read[13]} {s_b_read[14]} {s_b_read[15]} {s_b_read[16]} {s_b_read[17]} {s_b_read[18]} {s_b_read[19]} {s_b_read[20]} {s_b_read[21]} {s_b_read[22]} {s_b_read[23]} {s_b_read[24]} {s_b_read[25]} {s_b_read[26]} {s_b_read[27]} {s_b_read[28]} {s_b_read[29]} {s_b_read[30]} {s_b_read[31]} {s_b_read[32]} {s_b_read[33]} {s_b_read[34]} {s_b_read[35]} {s_b_read[36]} {s_b_read[37]} {s_b_read[38]} {s_b_read[39]} {s_b_read[40]} {s_b_read[41]} {s_b_read[42]} {s_b_read[43]} {s_b_read[44]} {s_b_read[45]} {s_b_read[46]} {s_b_read[47]} {s_b_read[48]} {s_b_read[49]} {s_b_read[50]} {s_b_read[51]} {s_b_read[52]} {s_b_read[53]} {s_b_read[54]} {s_b_read[55]} {s_b_read[56]} {s_b_read[57]} {s_b_read[58]} {s_b_read[59]} {s_b_read[60]} {s_b_read[61]} {s_b_read[62]} {s_b_read[63]}]]
create_debug_port u_ila_0 probe
set_property port_width 64 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {NIM_BLOCK/sig_output_counts[0]} {NIM_BLOCK/sig_output_counts[1]} {NIM_BLOCK/sig_output_counts[2]} {NIM_BLOCK/sig_output_counts[3]} {NIM_BLOCK/sig_output_counts[4]} {NIM_BLOCK/sig_output_counts[5]} {NIM_BLOCK/sig_output_counts[6]} {NIM_BLOCK/sig_output_counts[7]} {NIM_BLOCK/sig_output_counts[8]} {NIM_BLOCK/sig_output_counts[9]} {NIM_BLOCK/sig_output_counts[10]} {NIM_BLOCK/sig_output_counts[11]} {NIM_BLOCK/sig_output_counts[12]} {NIM_BLOCK/sig_output_counts[13]} {NIM_BLOCK/sig_output_counts[14]} {NIM_BLOCK/sig_output_counts[15]} {NIM_BLOCK/sig_output_counts[16]} {NIM_BLOCK/sig_output_counts[17]} {NIM_BLOCK/sig_output_counts[18]} {NIM_BLOCK/sig_output_counts[19]} {NIM_BLOCK/sig_output_counts[20]} {NIM_BLOCK/sig_output_counts[21]} {NIM_BLOCK/sig_output_counts[22]} {NIM_BLOCK/sig_output_counts[23]} {NIM_BLOCK/sig_output_counts[24]} {NIM_BLOCK/sig_output_counts[25]} {NIM_BLOCK/sig_output_counts[26]} {NIM_BLOCK/sig_output_counts[27]} {NIM_BLOCK/sig_output_counts[28]} {NIM_BLOCK/sig_output_counts[29]} {NIM_BLOCK/sig_output_counts[30]} {NIM_BLOCK/sig_output_counts[31]} {NIM_BLOCK/sig_output_counts[32]} {NIM_BLOCK/sig_output_counts[33]} {NIM_BLOCK/sig_output_counts[34]} {NIM_BLOCK/sig_output_counts[35]} {NIM_BLOCK/sig_output_counts[36]} {NIM_BLOCK/sig_output_counts[37]} {NIM_BLOCK/sig_output_counts[38]} {NIM_BLOCK/sig_output_counts[39]} {NIM_BLOCK/sig_output_counts[40]} {NIM_BLOCK/sig_output_counts[41]} {NIM_BLOCK/sig_output_counts[42]} {NIM_BLOCK/sig_output_counts[43]} {NIM_BLOCK/sig_output_counts[44]} {NIM_BLOCK/sig_output_counts[45]} {NIM_BLOCK/sig_output_counts[46]} {NIM_BLOCK/sig_output_counts[47]} {NIM_BLOCK/sig_output_counts[48]} {NIM_BLOCK/sig_output_counts[49]} {NIM_BLOCK/sig_output_counts[50]} {NIM_BLOCK/sig_output_counts[51]} {NIM_BLOCK/sig_output_counts[52]} {NIM_BLOCK/sig_output_counts[53]} {NIM_BLOCK/sig_output_counts[54]} {NIM_BLOCK/sig_output_counts[55]} {NIM_BLOCK/sig_output_counts[56]} {NIM_BLOCK/sig_output_counts[57]} {NIM_BLOCK/sig_output_counts[58]} {NIM_BLOCK/sig_output_counts[59]} {NIM_BLOCK/sig_output_counts[60]} {NIM_BLOCK/sig_output_counts[61]} {NIM_BLOCK/sig_output_counts[62]} {NIM_BLOCK/sig_output_counts[63]}]]
create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {NIM_BLOCK/burst_wr_in[0]} {NIM_BLOCK/burst_wr_in[1]} {NIM_BLOCK/burst_wr_in[2]} {NIM_BLOCK/burst_wr_in[3]}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list NIM_BLOCK/U121/latch_en]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list NIM_BLOCK/U123/latch_en]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list NIM_BLOCK/out_cnt_rst]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list s_nim_out0]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list s_nim_out1]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list s_nim_out2]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list s_nim_out3]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list NIM_BLOCK/sig_log]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list NIM_BLOCK/trig_sig2]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list NIM_BLOCK/b_wr_out]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets WRCLK]
