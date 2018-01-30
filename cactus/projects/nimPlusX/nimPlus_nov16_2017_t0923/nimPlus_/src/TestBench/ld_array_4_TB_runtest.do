SetActiveLib -work
comp -include "$dsn\src\ff_la.asf" 
comp -include "$dsn\src\load_controller_2.asf" 
comp -include "$dsn\src\ld_array_4_v2.bde" 
comp -include "$dsn\src\TestBench\ld_array_4_TB.vhd" 
asim +access +r TESTBENCH_FOR_ld_array_4 
wave 
wave -noreg clk0
wave -noreg clk1
wave -noreg clk2
wave -noreg clk3
wave -noreg dis_ops
wave -noreg rst_p
wave -noreg sig_in
wave -noreg dl
wave -noreg ld_cmd_in
wave -noreg wr_cmd
wave -noreg s_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\ld_array_4_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_ld_array_4 
