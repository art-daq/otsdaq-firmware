SetActiveLib -work
comp -include "$dsn\compile\pulse_combine.vhd" 
comp -include "$dsn\src\TestBench\pulse_combine_TB.vhd" 
asim +access +r TESTBENCH_FOR_pulse_combine 
wave 
wave -noreg oe
wave -noreg e
wave -noreg x
wave -noreg y
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\pulse_combine_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_pulse_combine 
