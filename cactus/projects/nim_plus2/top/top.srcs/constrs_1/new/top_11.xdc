
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
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {NIM_BLOCK_b/ys[0]} {NIM_BLOCK_b/ys[1]} {NIM_BLOCK_b/ys[2]} {NIM_BLOCK_b/ys[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {NIM_BLOCK_b/sig_mod[0]} {NIM_BLOCK_b/sig_mod[1]} {NIM_BLOCK_b/sig_mod[2]} {NIM_BLOCK_b/sig_mod[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {nim_plus_b_outputs[0]} {nim_plus_b_outputs[1]} {nim_plus_b_outputs[2]} {nim_plus_b_outputs[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 4 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {nim_plus_b_inputs[0]} {nim_plus_b_inputs[1]} {nim_plus_b_inputs[2]} {nim_plus_b_inputs[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {nim_plus_a_outputs[0]} {nim_plus_a_outputs[1]} {nim_plus_a_outputs[2]} {nim_plus_a_outputs[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 4 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {nim_plus_a_inputs[0]} {nim_plus_a_inputs[1]} {nim_plus_a_inputs[2]} {nim_plus_a_inputs[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {nim_outputs[0]} {nim_outputs[1]} {nim_outputs[2]} {nim_outputs[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {nim_inputs[0]} {nim_inputs[1]} {nim_inputs[2]} {nim_inputs[3]} {nim_inputs[4]} {nim_inputs[5]} {nim_inputs[6]} {nim_inputs[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 64 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {b_data[0]} {b_data[1]} {b_data[2]} {b_data[3]} {b_data[4]} {b_data[5]} {b_data[6]} {b_data[7]} {b_data[8]} {b_data[9]} {b_data[10]} {b_data[11]} {b_data[12]} {b_data[13]} {b_data[14]} {b_data[15]} {b_data[16]} {b_data[17]} {b_data[18]} {b_data[19]} {b_data[20]} {b_data[21]} {b_data[22]} {b_data[23]} {b_data[24]} {b_data[25]} {b_data[26]} {b_data[27]} {b_data[28]} {b_data[29]} {b_data[30]} {b_data[31]} {b_data[32]} {b_data[33]} {b_data[34]} {b_data[35]} {b_data[36]} {b_data[37]} {b_data[38]} {b_data[39]} {b_data[40]} {b_data[41]} {b_data[42]} {b_data[43]} {b_data[44]} {b_data[45]} {b_data[46]} {b_data[47]} {b_data[48]} {b_data[49]} {b_data[50]} {b_data[51]} {b_data[52]} {b_data[53]} {b_data[54]} {b_data[55]} {b_data[56]} {b_data[57]} {b_data[58]} {b_data[59]} {b_data[60]} {b_data[61]} {b_data[62]} {b_data[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {NIM_BLOCK_a/ys[0]} {NIM_BLOCK_a/ys[1]} {NIM_BLOCK_a/ys[2]} {NIM_BLOCK_a/ys[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 4 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {NIM_BLOCK_a/sig_mod[0]} {NIM_BLOCK_a/sig_mod[1]} {NIM_BLOCK_a/sig_mod[2]} {NIM_BLOCK_a/sig_mod[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 11 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[0]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[1]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[2]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[3]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[4]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[5]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[6]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[7]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[8]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[9]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_tx_size_in[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[0]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[1]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[2]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[3]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[4]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[5]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[6]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/tx_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 16 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[0]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[1]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[2]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[3]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[4]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[5]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[6]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[7]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[8]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[9]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[10]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[11]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[12]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[13]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[14]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rd_data[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 64 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[0]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[1]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[2]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[3]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[4]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[5]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[6]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[7]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[8]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[9]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[10]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[11]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[12]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[13]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[14]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[15]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[16]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[17]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[18]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[19]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[20]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[21]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[22]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[23]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[24]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[25]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[26]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[27]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[28]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[29]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[30]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[31]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[32]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[33]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[34]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[35]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[36]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[37]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[38]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[39]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[40]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[41]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[42]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[43]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[44]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[45]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[46]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[47]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[48]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[49]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[50]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[51]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[52]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[53]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[54]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[55]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[56]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[57]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[58]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[59]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[60]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[61]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[62]} {eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rd_data[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list NIM_BLOCK_b/acc_release]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list NIM_BLOCK_a/acc_release]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list b_data_we]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list bmx_320]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list bs_clk40i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list eth_interface/data_manager_blk/GEC_RX_CTRL/clear_crc_err_flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list NIM_BLOCK_b/clk_13_25]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list NIM_BLOCK_a/clk_13_25]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list NIM_BLOCK_a/clk_26_5]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list NIM_BLOCK_b/clk_26_5]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/crc_err]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/crc_err_flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list eth_interface/data_manager_blk/GEC_RX_CTRL/crc_err_flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list eth_interface/data_manager_blk/GEC_RX_CTRL/crc_err_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/ctrl_info_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_fifo_rden]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/data_info_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/dest_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list ei40_gen_lock]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list ei40_gen_lock_loss]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list external_clk40]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/fifo_sel]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list fs_gen_lock]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list fs_gen_lock_loss]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/info_fifo_rden]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list nim_b_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list nim_b_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list nim_b_fifo_rden]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list nim_clk_lock]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list nim_clk_lock_loss]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list {nimplus2_input_mux_sel_reg_n_161_[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list eth_interface/data_manager_blk/rx_data_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/rx_data_fifo_full_flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/Rx_FIFO_Reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 1 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list eth_interface/data_manager_blk/rx_fifo_reset_sig]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe64]
set_property port_width 1 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list eth_interface/data_manager_blk/rx_info_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe65]
set_property port_width 1 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/rx_info_fifo_full_flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe66]
set_property port_width 1 [get_debug_ports u_ila_0/probe66]
connect_debug_port u_ila_0/probe66 [get_nets [list eth_interface/data_manager_blk/RAM_COMM_DEC/rx_protocol_err_flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe67]
set_property port_width 1 [get_debug_ports u_ila_0/probe67]
connect_debug_port u_ila_0/probe67 [get_nets [list s_clk40e]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe68]
set_property port_width 1 [get_debug_ports u_ila_0/probe68]
connect_debug_port u_ila_0/probe68 [get_nets [list selected_ext_clkg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe69]
set_property port_width 1 [get_debug_ports u_ila_0/probe69]
connect_debug_port u_ila_0/probe69 [get_nets [list NIM_BLOCK_a/sig_log]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe70]
set_property port_width 1 [get_debug_ports u_ila_0/probe70]
connect_debug_port u_ila_0/probe70 [get_nets [list NIM_BLOCK_b/sig_log]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe71]
set_property port_width 1 [get_debug_ports u_ila_0/probe71]
connect_debug_port u_ila_0/probe71 [get_nets [list NIM_BLOCK_a/sig_norm]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe72]
set_property port_width 1 [get_debug_ports u_ila_0/probe72]
connect_debug_port u_ila_0/probe72 [get_nets [list NIM_BLOCK_b/sig_norm]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe73]
set_property port_width 1 [get_debug_ports u_ila_0/probe73]
connect_debug_port u_ila_0/probe73 [get_nets [list NIM_BLOCK_a/sync_ctrl]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe74]
set_property port_width 1 [get_debug_ports u_ila_0/probe74]
connect_debug_port u_ila_0/probe74 [get_nets [list NIM_BLOCK_b/sync_ctrl]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe75]
set_property port_width 1 [get_debug_ports u_ila_0/probe75]
connect_debug_port u_ila_0/probe75 [get_nets [list NIM_BLOCK_b/sync_w_40MHz]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe76]
set_property port_width 1 [get_debug_ports u_ila_0/probe76]
connect_debug_port u_ila_0/probe76 [get_nets [list NIM_BLOCK_a/sync_w_40MHz]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe77]
set_property port_width 1 [get_debug_ports u_ila_0/probe77]
connect_debug_port u_ila_0/probe77 [get_nets [list eth_interface/data_manager_blk/tx_ctrl_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe78]
set_property port_width 1 [get_debug_ports u_ila_0/probe78]
connect_debug_port u_ila_0/probe78 [get_nets [list eth_interface/data_manager_blk/tx_ctrl_info_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe79]
set_property port_width 1 [get_debug_ports u_ila_0/probe79]
connect_debug_port u_ila_0/probe79 [get_nets [list eth_interface/data_manager_blk/GEC_TX_SEQ_CTL/user_trigger]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets MASTER_CLK]
