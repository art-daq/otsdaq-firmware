SetActiveLib -work
comp -include "$dsn\compile\DIG_GEC.vhd" 
comp -include "$dsn\src\TestBench\dig_gec_TB.vhd" 
asim +access +r TESTBENCH_FOR_dig_gec 
wave 
wave -noreg GMII_RX_CLK
wave -noreg GMII_RX_DV
wave -noreg GMII_RX_ER
wave -noreg reset
wave -noreg trigger
wave -noreg GMII_RXD
wave -noreg dest_addrs
wave -noreg dest_mac
wave -noreg dest_port
wave -noreg user_addrs
wave -noreg user_tx_data_in
wave -noreg user_tx_size_in
wave -noreg GMII_GTX_CLK
wave -noreg GMII_TX_EN
wave -noreg GMII_TX_ER
wave -noreg busy
wave -noreg crc_chk_en
wave -noreg crc_chk_err
wave -noreg crc_chk_init
wave -noreg crc_gen_en
wave -noreg crc_gen_init
wave -noreg crc_gen_rd
wave -noreg en_tx_data
wave -noreg src_capture
wave -noreg udp_data_valid_out
wave -noreg GMII_TXD
wave -noreg src_addrs
wave -noreg src_mac
wave -noreg src_port
wave -noreg udp_data_count
wave -noreg udp_dest_port
wave -noreg user_rx_data_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\dig_gec_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_dig_gec 
