create_clock -period 25.157 [get_ports clk_39_in]
create_generated_clock -source [get_ports clk_39_in] -edges {1 2 3} -edge_shift {0.000 0.000 0.000} [get_ports -no_traverse clk_39_adj]
set_property -quiet IO_BUFFER_TYPE NONE [get_ports -quiet clk_39_in]
