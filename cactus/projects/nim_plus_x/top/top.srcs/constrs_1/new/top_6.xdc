set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk0]]
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {NIM_BLOCK/U1/inhib_in2[0]} {NIM_BLOCK/U1/inhib_in2[1]} {NIM_BLOCK/U1/inhib_in2[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {NIM_BLOCK/U1/inhib_in3[0]} {NIM_BLOCK/U1/inhib_in3[1]} {NIM_BLOCK/U1/inhib_in3[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {NIM_BLOCK/U1/inhib_in0[0]} {NIM_BLOCK/U1/inhib_in0[1]} {NIM_BLOCK/U1/inhib_in0[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {NIM_BLOCK/U1/inhib_in1[0]} {NIM_BLOCK/U1/inhib_in1[1]} {NIM_BLOCK/U1/inhib_in1[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {NIM_BLOCK/U1/ld_orig[0]} {NIM_BLOCK/U1/ld_orig[2]} {NIM_BLOCK/U1/ld_orig[3]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {NIM_BLOCK/U1/release_in1[0]} {NIM_BLOCK/U1/release_in1[1]} {NIM_BLOCK/U1/release_in1[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {NIM_BLOCK/U1/release_in2[0]} {NIM_BLOCK/U1/release_in2[1]} {NIM_BLOCK/U1/release_in2[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {NIM_BLOCK/U1/release_in3[0]} {NIM_BLOCK/U1/release_in3[1]} {NIM_BLOCK/U1/release_in3[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {NIM_BLOCK/U1/release_in0[0]} {NIM_BLOCK/U1/release_in0[1]} {NIM_BLOCK/U1/release_in0[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list NIM_BLOCK/U1/ld]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list nim_out]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list NIM_BLOCK/sig_log]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk0]
