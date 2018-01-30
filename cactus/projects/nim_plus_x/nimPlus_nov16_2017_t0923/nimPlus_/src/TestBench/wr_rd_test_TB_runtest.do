SetActiveLib -work
comp -include "$dsn\src\decode_addr_8_regs.vhd" 
comp -include "$dsn\src\reg_32.asf" 
comp -include "$dsn\src\rd_test_decode.vhd" 
comp -include "$dsn\src\wr_test.bde" 
comp -include "$dsn\src\wr_rd_test.bde" 
comp -include "$dsn\src\TestBench\wr_rd_test_TB.vhd" 
asim +access +r TESTBENCH_FOR_wr_rd_test 
wave 
wave -noreg OEI_reg_wr
wave -noreg clk_in
wave -noreg OEI_addr
wave -noreg d_in
wave -noreg read_data_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\wr_rd_test_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_wr_rd_test 
