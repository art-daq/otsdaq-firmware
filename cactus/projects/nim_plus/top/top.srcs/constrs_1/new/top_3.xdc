




connect_debug_port u_ila_0_0/probe8 [get_nets [list {NIM_BLOCK/U1/inhib_in3_orig[0]} {NIM_BLOCK/U1/inhib_in3_orig[1]} {NIM_BLOCK/U1/inhib_in3_orig[2]}]]
connect_debug_port u_ila_0_0/probe9 [get_nets [list {NIM_BLOCK/U1/release_in0[0]} {NIM_BLOCK/U1/release_in0[1]} {NIM_BLOCK/U1/release_in0[2]}]]
connect_debug_port u_ila_0_0/probe10 [get_nets [list {NIM_BLOCK/U1/inhib_in1[0]} {NIM_BLOCK/U1/inhib_in1[1]} {NIM_BLOCK/U1/inhib_in1[2]}]]
connect_debug_port u_ila_0_0/probe11 [get_nets [list {NIM_BLOCK/U1/release_in3[0]} {NIM_BLOCK/U1/release_in3[1]} {NIM_BLOCK/U1/release_in3[2]}]]
connect_debug_port u_ila_0_0/probe13 [get_nets [list {NIM_BLOCK/U1/inhib[3]}]]
connect_debug_port u_ila_0_0/probe14 [get_nets [list {NIM_BLOCK/U1/inhib_in3[0]} {NIM_BLOCK/U1/inhib_in3[1]} {NIM_BLOCK/U1/inhib_in3[2]}]]
connect_debug_port u_ila_0_0/probe15 [get_nets [list {NIM_BLOCK/U1/inhib_in0[0]} {NIM_BLOCK/U1/inhib_in0[1]} {NIM_BLOCK/U1/inhib_in0[2]}]]
connect_debug_port u_ila_0_0/probe16 [get_nets [list {NIM_BLOCK/U1/ld_orig[0]} {NIM_BLOCK/U1/ld_orig[2]} {NIM_BLOCK/U1/ld_orig[3]}]]
connect_debug_port u_ila_0_0/probe17 [get_nets [list {NIM_BLOCK/U1/release_in2_orig[0]} {NIM_BLOCK/U1/release_in2_orig[1]} {NIM_BLOCK/U1/release_in2_orig[2]}]]
connect_debug_port u_ila_0_0/probe18 [get_nets [list {NIM_BLOCK/U1/release_in1[0]} {NIM_BLOCK/U1/release_in1[1]} {NIM_BLOCK/U1/release_in1[2]}]]
connect_debug_port u_ila_0_0/probe19 [get_nets [list {NIM_BLOCK/U1/release[2]}]]

connect_debug_port u_ila_0/probe0 [get_nets [list NIM_BLOCK/U1/release_out]]
connect_debug_port u_ila_3/probe3 [get_nets [list {NIM_BLOCK/ld_reg[0]} {NIM_BLOCK/ld_reg[1]} {NIM_BLOCK/ld_reg[2]} {NIM_BLOCK/ld_reg[3]} {NIM_BLOCK/ld_reg[4]} {NIM_BLOCK/ld_reg[5]} {NIM_BLOCK/ld_reg[6]} {NIM_BLOCK/ld_reg[7]} {NIM_BLOCK/ld_reg[8]} {NIM_BLOCK/ld_reg[9]} {NIM_BLOCK/ld_reg[10]} {NIM_BLOCK/ld_reg[11]} {NIM_BLOCK/ld_reg[12]} {NIM_BLOCK/ld_reg[13]} {NIM_BLOCK/ld_reg[14]} {NIM_BLOCK/ld_reg[15]}]]
connect_debug_port u_ila_3/probe4 [get_nets [list {NIM_BLOCK/ld_wr_in[0]} {NIM_BLOCK/ld_wr_in[1]} {NIM_BLOCK/ld_wr_in[2]} {NIM_BLOCK/ld_wr_in[3]} {NIM_BLOCK/ld_wr_in[4]} {NIM_BLOCK/ld_wr_in[5]} {NIM_BLOCK/ld_wr_in[6]} {NIM_BLOCK/ld_wr_in[7]}]]
connect_debug_port u_ila_3/probe5 [get_nets [list {NIM_BLOCK/blk_wr_en[0]} {NIM_BLOCK/blk_wr_en[1]} {NIM_BLOCK/blk_wr_en[2]} {NIM_BLOCK/blk_wr_en[3]} {NIM_BLOCK/blk_wr_en[4]} {NIM_BLOCK/blk_wr_en[5]} {NIM_BLOCK/blk_wr_en[6]} {NIM_BLOCK/blk_wr_en[7]}]]
connect_debug_port u_ila_3/probe6 [get_nets [list {NIM_BLOCK/sel_blk_en_term[0]} {NIM_BLOCK/sel_blk_en_term[1]} {NIM_BLOCK/sel_blk_en_term[2]} {NIM_BLOCK/sel_blk_en_term[3]} {NIM_BLOCK/sel_blk_en_term[4]} {NIM_BLOCK/sel_blk_en_term[5]} {NIM_BLOCK/sel_blk_en_term[6]} {NIM_BLOCK/sel_blk_en_term[7]} {NIM_BLOCK/sel_blk_en_term[8]} {NIM_BLOCK/sel_blk_en_term[9]} {NIM_BLOCK/sel_blk_en_term[10]} {NIM_BLOCK/sel_blk_en_term[11]} {NIM_BLOCK/sel_blk_en_term[12]} {NIM_BLOCK/sel_blk_en_term[13]} {NIM_BLOCK/sel_blk_en_term[14]} {NIM_BLOCK/sel_blk_en_term[15]}]]
connect_debug_port u_ila_3/probe7 [get_nets [list {NIM_BLOCK/sel_ctl[0]} {NIM_BLOCK/sel_ctl[1]} {NIM_BLOCK/sel_ctl[2]} {NIM_BLOCK/sel_ctl[3]} {NIM_BLOCK/sel_ctl[4]} {NIM_BLOCK/sel_ctl[5]} {NIM_BLOCK/sel_ctl[6]} {NIM_BLOCK/sel_ctl[7]}]]
connect_debug_port u_ila_3/probe9 [get_nets [list {NIM_BLOCK/pulse_ctl[0]} {NIM_BLOCK/pulse_ctl[1]} {NIM_BLOCK/pulse_ctl[2]} {NIM_BLOCK/pulse_ctl[3]} {NIM_BLOCK/pulse_ctl[4]} {NIM_BLOCK/pulse_ctl[5]} {NIM_BLOCK/pulse_ctl[6]} {NIM_BLOCK/pulse_ctl[7]}]]
connect_debug_port u_ila_3/probe11 [get_nets [list NIM_BLOCK/ld_arr_rst_p]]

create_debug_core u_ila_0_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0_0]
set_property port_width 1 [get_debug_ports u_ila_0_0/clk]
connect_debug_port u_ila_0_0/clk [get_nets [list clk0]]
set_property port_width 4 [get_debug_ports u_ila_0_0/probe0]
connect_debug_port u_ila_0_0/probe0 [get_nets [list {nim_input[0]} {nim_input[1]} {nim_input[2]} {nim_input[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 4 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list {NIM_BLOCK/sig_mod[0]} {NIM_BLOCK/sig_mod[1]} {NIM_BLOCK/sig_mod[2]} {NIM_BLOCK/sig_mod[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe2]
connect_debug_port u_ila_0_0/probe2 [get_nets [list {NIM_BLOCK/U1/inhib_in2[0]} {NIM_BLOCK/U1/inhib_in2[1]} {NIM_BLOCK/U1/inhib_in2[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe3]
connect_debug_port u_ila_0_0/probe3 [get_nets [list {NIM_BLOCK/U1/inhib_in3[0]} {NIM_BLOCK/U1/inhib_in3[1]} {NIM_BLOCK/U1/inhib_in3[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe4]
connect_debug_port u_ila_0_0/probe4 [get_nets [list {NIM_BLOCK/U1/inhib_in0[0]} {NIM_BLOCK/U1/inhib_in0[1]} {NIM_BLOCK/U1/inhib_in0[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe5]
connect_debug_port u_ila_0_0/probe5 [get_nets [list {NIM_BLOCK/U1/inhib_in1[0]} {NIM_BLOCK/U1/inhib_in1[1]} {NIM_BLOCK/U1/inhib_in1[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe6]
connect_debug_port u_ila_0_0/probe6 [get_nets [list {NIM_BLOCK/U1/ld_orig[0]} {NIM_BLOCK/U1/ld_orig[2]} {NIM_BLOCK/U1/ld_orig[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe7]
connect_debug_port u_ila_0_0/probe7 [get_nets [list {NIM_BLOCK/U1/release_in1[0]} {NIM_BLOCK/U1/release_in1[1]} {NIM_BLOCK/U1/release_in1[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe8]
connect_debug_port u_ila_0_0/probe8 [get_nets [list {NIM_BLOCK/U1/release_in2[0]} {NIM_BLOCK/U1/release_in2[1]} {NIM_BLOCK/U1/release_in2[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe9]
connect_debug_port u_ila_0_0/probe9 [get_nets [list {NIM_BLOCK/U1/release_in3[0]} {NIM_BLOCK/U1/release_in3[1]} {NIM_BLOCK/U1/release_in3[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe10]
connect_debug_port u_ila_0_0/probe10 [get_nets [list {NIM_BLOCK/U1/release_in0[0]} {NIM_BLOCK/U1/release_in0[1]} {NIM_BLOCK/U1/release_in0[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe11]
connect_debug_port u_ila_0_0/probe11 [get_nets [list NIM_BLOCK/U1/U48/int_release_out_i_1_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe12]
connect_debug_port u_ila_0_0/probe12 [get_nets [list NIM_BLOCK/U1/U56/int_release_out_i_1_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe13]
connect_debug_port u_ila_0_0/probe13 [get_nets [list NIM_BLOCK/U1/U43/int_release_out_i_1_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe14]
connect_debug_port u_ila_0_0/probe14 [get_nets [list NIM_BLOCK/U1/U46/int_release_out_i_1_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe15]
connect_debug_port u_ila_0_0/probe15 [get_nets [list NIM_BLOCK/U1/U43/int_release_out_i_3_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe16]
connect_debug_port u_ila_0_0/probe16 [get_nets [list NIM_BLOCK/U1/U56/int_release_out_i_3_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe17]
connect_debug_port u_ila_0_0/probe17 [get_nets [list NIM_BLOCK/U1/U48/int_release_out_i_3_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe18]
connect_debug_port u_ila_0_0/probe18 [get_nets [list NIM_BLOCK/U1/U46/int_release_out_i_3_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe19]
connect_debug_port u_ila_0_0/probe19 [get_nets [list NIM_BLOCK/U1/U43/int_release_out_i_4_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe20]
connect_debug_port u_ila_0_0/probe20 [get_nets [list NIM_BLOCK/U1/U46/int_release_out_i_4_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe21]
connect_debug_port u_ila_0_0/probe21 [get_nets [list NIM_BLOCK/U1/U48/int_release_out_i_4_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe22]
connect_debug_port u_ila_0_0/probe22 [get_nets [list NIM_BLOCK/U1/U56/int_release_out_i_4_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe23]
connect_debug_port u_ila_0_0/probe23 [get_nets [list NIM_BLOCK/U1/U56/int_release_out_i_5_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe24]
connect_debug_port u_ila_0_0/probe24 [get_nets [list NIM_BLOCK/U1/U46/int_release_out_i_5_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe25]
connect_debug_port u_ila_0_0/probe25 [get_nets [list NIM_BLOCK/U1/U43/int_release_out_i_5_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe26]
connect_debug_port u_ila_0_0/probe26 [get_nets [list NIM_BLOCK/U1/U48/int_release_out_i_5_n_1]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe27]
connect_debug_port u_ila_0_0/probe27 [get_nets [list NIM_BLOCK/U1/ld]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe28]
connect_debug_port u_ila_0_0/probe28 [get_nets [list MASTER_CLK]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe29]
connect_debug_port u_ila_0_0/probe29 [get_nets [list NIM_BLOCK/U1/U46/next_release_out]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe30]
connect_debug_port u_ila_0_0/probe30 [get_nets [list NIM_BLOCK/U1/U48/next_release_out]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe31]
connect_debug_port u_ila_0_0/probe31 [get_nets [list NIM_BLOCK/U1/U56/next_release_out]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe32]
connect_debug_port u_ila_0_0/probe32 [get_nets [list NIM_BLOCK/U1/U43/next_release_out]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe33]
connect_debug_port u_ila_0_0/probe33 [get_nets [list nim_out]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe34]
connect_debug_port u_ila_0_0/probe34 [get_nets [list NIM_BLOCK/sig_log]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk0]
