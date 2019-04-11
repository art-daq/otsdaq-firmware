SetActiveLib -work
comp -include "$dsn\compile\trig_blk.vhd" 
comp -include "$dsn\src\TestBench\trig_blk_TB.vhd" 
asim +access +r TESTBENCH_FOR_trig_blk 
wave 
wave -noreg clk
wave -noreg dlay
wave -noreg oe
wave -noreg reset_p
wave -noreg s_in
wave -noreg wdth
wave -noreg wr_blk
wave -noreg busy_out
wave -noreg s_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\trig_blk_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_trig_blk 
