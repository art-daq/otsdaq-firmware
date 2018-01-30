SetActiveLib -work
comp -include "$dsn\src\trig_blk.asf" 
comp -include "$dsn\src\sel_block.bde" 
comp -include "$dsn\src\trig_test.bde" 
comp -include "$dsn\src\test_trig_1blk.bde" 
comp -include "$dsn\src\TestBench\test_trig_1blk_TB.vhd" 
asim +access +r TESTBENCH_FOR_test_trig_1blk 
wave 
wave -noreg clk_0
wave -noreg clk_1
wave -noreg clk_2
wave -noreg clk_3
wave -noreg en_output
wave -noreg en_pulses
wave -noreg sysreset
wave -noreg wr_blk
wave -noreg dlay_in
wave -noreg e
wave -noreg wdth_in
wave -noreg x
wave -noreg trg_sig
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\test_trig_1blk_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_test_trig_1blk 
