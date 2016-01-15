SetActiveLib -work
comp -include "$DSN\compile\gec_rx_ctl_8.vhd" 
comp -include "$DSN\src\TestBench\gec_rx_ctl_8_TB.vhd" 
asim TESTBENCH_FOR_gec_rx_ctl_8 
wave 
wave -noreg block_en
wave -noreg clock
wave -noreg data_fifo_full
wave -noreg data_fifo_wrerr
wave -noreg gec_user_crc_err
wave -noreg gec_user_rx_data_out
wave -noreg gec_user_rx_size_out
wave -noreg gec_user_rx_valid_out
wave -noreg reset_n
wave -noreg crc_err_flag
wave -noreg data_fifo_q_w_data
wave -noreg data_fifo_wren
wave -noreg info_fifo_wr_data
wave -noreg info_fifo_wren
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\gec_rx_ctl_8_TB_tim_cfg.vhd" 
# asim TIMING_FOR_gec_rx_ctl_8 
