create_generated_clock -source [get_ports MASTER_CLK] -edges {1 2 3} -edge_shift {0.000 -2.438 -4.875} [get_ports -no_traverse clkout320]
create_generated_clock -source [get_ports MASTER_CLK] -edges {1 2 3} -edge_shift {0.000 8.500 17.000} [get_ports -no_traverse clkout40]
