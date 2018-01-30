SetActiveLib -work
comp -include "$dsn\compile\DAC_Control.vhd" 
comp -include "$dsn\src\TestBench\dac_control_TB.vhd" 
asim +access +r TESTBENCH_FOR_dac_control 
wave 
wave -noreg blk_data_in
wave -noreg clock
wave -noreg reset_p
wave -noreg wr_blk_p
wave -noreg wr_dac_p
wave -noreg dac_out
wave -noreg sclk
wave -noreg sync
wave -noreg wr_error
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\dac_control_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_dac_control 
