SetActiveLib -work
comp -include "$dsn\src\d_ff.asf" 
comp -include "$dsn\src\section_counter.asf" 
comp -include "$dsn\src\fs_sync_module.bde" 
comp -include "$dsn\src\TestBench\fs_sync_module_TB.vhd" 
asim +access +r TESTBENCH_FOR_fs_sync_module 
wave 
wave -noreg MHz_40
wave -noreg clock_320MHz
wave -noreg reset_async_p
wave -noreg reset_master_p
wave -noreg sel_sync_in
wave -noreg sel_sync_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fs_sync_module_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fs_sync_module 
