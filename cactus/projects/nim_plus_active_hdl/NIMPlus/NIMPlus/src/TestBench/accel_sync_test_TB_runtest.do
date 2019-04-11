SetActiveLib -work
comp -include "$dsn\src\section_counter.asf" 
comp -include "$dsn\src\acc_sync.asf" 
comp -include "$dsn\src\divide_by_8.asf" 
comp -include "$dsn\src\accel_sync_test.bde" 
comp -include "$dsn\src\TestBench\accel_sync_test_TB.vhd" 
asim +access +r TESTBENCH_FOR_accel_sync_test 
wave 
wave -noreg clk0
wave -noreg clk_13_25
wave -noreg clk_26_5
wave -noreg ctr_reset
wave -noreg reset_out
wave -noreg fs_sync_bus
wave -noreg clk_39_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\accel_sync_test_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_accel_sync_test 
