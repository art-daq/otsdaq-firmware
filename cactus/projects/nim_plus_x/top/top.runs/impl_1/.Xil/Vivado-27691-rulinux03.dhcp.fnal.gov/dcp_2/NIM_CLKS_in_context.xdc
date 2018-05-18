create_generated_clock -source [get_ports MASTER_CLK] -edges {1 2 3} -edge_shift {0.000 0.000 0.000} [get_ports -no_traverse clk_out0]
