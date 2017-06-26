# Created Feb 2016 by rrivera at fnal dot gov


# In xdc, all clocks are related by default. This differs from ucf, where clocks are unrelated unless specified otherwise. As a result, you may now see cross-clock paths that were previously unconstrained in ucf. Commented out xdc false path constraints have been generated and can be uncommented, should you wish to remove these new paths. These commands are located after the last clock definition

create_clock -name PHY_RXCLK -period 8.000 [get_ports PHY_RXCLK]
create_clock -name CLK15NS -period 16.000 [get_pins CLK15NS_bufg/O]
create_clock -name CLK5MHZ -period 256.000 [get_pins CLK5MHz_bufg/O]

set_false_path -from [get_clocks CLK5MHZ] -to [get_clocks [list PHY_RXCLK   CLK15NS]]
set_false_path -from [get_clocks CLK15NS] -to [get_clocks [list PHY_RXCLK   CLK5MHZ]]
set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list CLK5MHZ   CLK15NS]]
