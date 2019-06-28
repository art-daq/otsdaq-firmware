
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
set_property port_width 64 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list {b_data[0]} {b_data[1]} {b_data[2]} {b_data[3]} {b_data[4]} {b_data[5]} {b_data[6]} {b_data[7]} {b_data[8]} {b_data[9]} {b_data[10]} {b_data[11]} {b_data[12]} {b_data[13]} {b_data[14]} {b_data[15]} {b_data[16]} {b_data[17]} {b_data[18]} {b_data[19]} {b_data[20]} {b_data[21]} {b_data[22]} {b_data[23]} {b_data[24]} {b_data[25]} {b_data[26]} {b_data[27]} {b_data[28]} {b_data[29]} {b_data[30]} {b_data[31]} {b_data[32]} {b_data[33]} {b_data[34]} {b_data[35]} {b_data[36]} {b_data[37]} {b_data[38]} {b_data[39]} {b_data[40]} {b_data[41]} {b_data[42]} {b_data[43]} {b_data[44]} {b_data[45]} {b_data[46]} {b_data[47]} {b_data[48]} {b_data[49]} {b_data[50]} {b_data[51]} {b_data[52]} {b_data[53]} {b_data[54]} {b_data[55]} {b_data[56]} {b_data[57]} {b_data[58]} {b_data[59]} {b_data[60]} {b_data[61]} {b_data[62]} {b_data[63]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 4 [get_debug_ports u_ila_0_0/probe2]
connect_debug_port u_ila_0_0/probe2 [get_nets [list {NIM_BLOCK/sig_mod[0]} {NIM_BLOCK/sig_mod[1]} {NIM_BLOCK/sig_mod[2]} {NIM_BLOCK/sig_mod[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 4 [get_debug_ports u_ila_0_0/probe3]
connect_debug_port u_ila_0_0/probe3 [get_nets [list {NIM_BLOCK/ys[0]} {NIM_BLOCK/ys[1]} {NIM_BLOCK/ys[2]} {NIM_BLOCK/ys[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe4]
connect_debug_port u_ila_0_0/probe4 [get_nets [list NIM_BLOCK/acc_release]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe5]
connect_debug_port u_ila_0_0/probe5 [get_nets [list b_data_we]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe6]
connect_debug_port u_ila_0_0/probe6 [get_nets [list bmx_320]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe7]
connect_debug_port u_ila_0_0/probe7 [get_nets [list bs_clk40i]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe8]
connect_debug_port u_ila_0_0/probe8 [get_nets [list eth_interface/data_manager_blk/GEC_RX_CTRL/clear_crc_err_flag]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe9]
connect_debug_port u_ila_0_0/probe9 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/crc_err]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe10]
connect_debug_port u_ila_0_0/probe10 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/crc_err_flag]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe11]
connect_debug_port u_ila_0_0/probe11 [get_nets [list eth_interface/data_manager_blk/GEC_RX_CTRL/crc_err_flag]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe12]
connect_debug_port u_ila_0_0/probe12 [get_nets [list eth_interface/data_manager_blk/GEC_RX_CTRL/crc_err_reg]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe13]
connect_debug_port u_ila_0_0/probe13 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/ctrl_info_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe14]
connect_debug_port u_ila_0_0/probe14 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe15]
connect_debug_port u_ila_0_0/probe15 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rden]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe16]
connect_debug_port u_ila_0_0/probe16 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_info_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe17]
connect_debug_port u_ila_0_0/probe17 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/dest_busy]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe18]
connect_debug_port u_ila_0_0/probe18 [get_nets [list ei40_gen_lock]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe19]
connect_debug_port u_ila_0_0/probe19 [get_nets [list ei40_gen_lock_loss]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe20]
connect_debug_port u_ila_0_0/probe20 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/fifo_sel]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe21]
connect_debug_port u_ila_0_0/probe21 [get_nets [list fs_gen_lock]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe22]
connect_debug_port u_ila_0_0/probe22 [get_nets [list fs_gen_lock_loss]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe23]
connect_debug_port u_ila_0_0/probe23 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rden]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe24]
connect_debug_port u_ila_0_0/probe24 [get_nets [list nim_b_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe25]
connect_debug_port u_ila_0_0/probe25 [get_nets [list nim_b_fifo_full]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe26]
connect_debug_port u_ila_0_0/probe26 [get_nets [list nim_b_fifo_rden]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe27]
connect_debug_port u_ila_0_0/probe27 [get_nets [list nim_clk_lock]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe28]
connect_debug_port u_ila_0_0/probe28 [get_nets [list nim_clk_lock_loss]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe29]
connect_debug_port u_ila_0_0/probe29 [get_nets [list eth_interface/data_manager_blk/rx_data_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe30]
connect_debug_port u_ila_0_0/probe30 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/rx_data_fifo_full_flag]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe31]
connect_debug_port u_ila_0_0/probe31 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/Rx_FIFO_Reset]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe32]
connect_debug_port u_ila_0_0/probe32 [get_nets [list eth_interface/data_manager_blk/rx_fifo_reset_sig]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe33]
connect_debug_port u_ila_0_0/probe33 [get_nets [list eth_interface/data_manager_blk/rx_info_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe34]
connect_debug_port u_ila_0_0/probe34 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/rx_info_fifo_full_flag]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe35]
connect_debug_port u_ila_0_0/probe35 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/rx_protocol_err_flag]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe36]
connect_debug_port u_ila_0_0/probe36 [get_nets [list s_clk40e]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe37]
connect_debug_port u_ila_0_0/probe37 [get_nets [list selected_ext_clkg]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe38]
connect_debug_port u_ila_0_0/probe38 [get_nets [list NIM_BLOCK/sig_log]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe39]
connect_debug_port u_ila_0_0/probe39 [get_nets [list NIM_BLOCK/sig_norm]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe40]
connect_debug_port u_ila_0_0/probe40 [get_nets [list NIM_BLOCK/sync_ctrl]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe41]
connect_debug_port u_ila_0_0/probe41 [get_nets [list NIM_BLOCK/sync_w_40MHz]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe42]
connect_debug_port u_ila_0_0/probe42 [get_nets [list eth_interface/data_manager_blk/tx_ctrl_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe43]
connect_debug_port u_ila_0_0/probe43 [get_nets [list eth_interface/data_manager_blk/tx_ctrl_info_fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe44]
connect_debug_port u_ila_0_0/probe44 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_trigger]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets MASTER_CLK]
