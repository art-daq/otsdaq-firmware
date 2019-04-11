SetActiveLib -work
comp -include "$dsn\src\d_ff.asf" 
comp -include "$dsn\src\TestBench\d_ff_TB.vhd" 
asim +access +r TESTBENCH_FOR_d_ff 
wave 
wave -noreg clk
wave -noreg dl
wave -noreg rst_p
wave -noreg q
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\d_ff_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_d_ff 
