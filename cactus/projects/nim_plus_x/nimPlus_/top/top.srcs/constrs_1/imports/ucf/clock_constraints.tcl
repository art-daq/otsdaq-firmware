# constraints for NIM+
# Created Feb 2016 by rrivera at fnal dot gov
# Edited Jan 2018 by rrivera at fnal dot gov

#give lots of time for static read (should have address setup for 64)
#set_max_delay 32.00 -through [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U311/*)}]

#give time through output muxes to counters
set_max_delay 32.00 -through [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U43/*)}]  -to [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U351/*)}]
set_max_delay 32.00 -through [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U127/*)}] -to [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U353/*)}]
set_max_delay 32.00 -through [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U187/*)}] -to [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U355/*)}]
set_max_delay 32.00 -through [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U197/*)}] -to [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ NIM_BLOCK/U357/*)}]


# In xdc, all clocks are related by default. This differs from ucf, where clocks are unrelated unless specified otherwise. As a result, you may now see cross-clock paths that were previously unconstrained in ucf. Commented out xdc false path constraints have been generated and can be uncommented, should you wish to remove these new paths. These commands are located after the last clock definition

create_clock -name PHY_RXCLK -period 8.000 [get_ports PHY_RXCLK]

#create_clock -name CLK_40e -period 25.000 [get_pins CLK_40e_bufg/O]
#create_clock -name CLK_40i -period 25.000 [get_pins CLK_40i_bufg/O]

#create_clock -name CLK_40eP -period 25.000 [get_ports CLK40_IN_EXT_P]

#create_clock -name CLK_320e -period 3.125 [get_pins CLK_320e_bufg/O]
#create_clock -name CLK_320i -period 3.125 [get_pins CLK_320i_bufg/O]

#create_clock -name CLK_bmx_320 -period 3.14465 [get_pins CLK_mx_320_bufg/O]
create_clock -name CLK_bmx_320 -period 3.125 [get_pins CLK_mx_320_bufg/O]
#Actually 318 MHz
create_clock -name CLK_bmx_40 -period 25 [get_pins CLK_mx_40_bufg/O]
#create_clock -name CLK_bmx_40 -period 25.1572 [get_pins CLK_mx_40_bufg/O]
#Actually 39.75 MHz
#create_clock -name CLK_bmx_13_25 -period 75.4716 [get_pins CLK_1325_bufg/O]
#Actually 318 MHz
#create_clock -name CLK_bmx_26_5 -period 37.7358 [get_pins CLK_265_bufg/O]
#Actually 39.75 MHz

create_clock -name DAC_SER_CLK -period 160.000 [get_ports DAC_SER_CLK]

create_clock -name DAC_IN_CLK -period 80.000 [get_pins DAC_CLK_bufg/O]

#set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list CLK_40e CLK_40i CLK_320e CLK_320i CLK_bmx_320 CLK_bmx_40 DAC_SER_CLK DAC_IN_CLK]]

#set_false_path -from [get_clocks CLK_40e] -to [get_clocks [list CLK_40i CLK_320i PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks CLK_40i] -to [get_clocks [list CLK_40e CLK_320e PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks CLK_320e] -to [get_clocks [list CLK_40i CLK_320i PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks CLK_320i] -to [get_clocks [list CLK_40e CLK_320e PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks CLK_bmx_320] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks CLK_bmx_40] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]

#set_false_path -from [get_clocks DAC_SER_CLK] -to [get_clocks [list CLK_bmx_320 CLK_bmx_40 CLK_40e CLK_320e CLK_40i CLK_320i PHY_RXCLK DAC_IN_CLK]]
#set_false_path -from [get_clocks DAC_IN_CLK] -to [get_clocks [list CLK_bmx_320 CLK_bmx_40 CLK_40e CLK_320e CLK_40i CLK_320i PHY_RXCLK DAC_SER_CLK]]

set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list CLK_bmx_320 CLK_bmx_40 DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks clkout40_clk_wiz_0] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks CLK_40eP] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
##set_false_path -from [get_clocks CLK_40eN] -to [get_clocks [list CLK_40e CLK_320e PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
##set_false_path -from [get_clocks CLK_320e] -to [get_clocks [list CLK_40i CLK_320i PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
##set_false_path -from [get_clocks CLK_320i] -to [get_clocks [list CLK_40e CLK_320e PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
set_false_path -from [get_clocks CLK_bmx_320] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
set_false_path -from [get_clocks CLK_bmx_40] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]

#set_false_path -from [get_clocks CLK_bmx_13_25] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]
#set_false_path -from [get_clocks CLK_bmx_26_5] -to [get_clocks [list PHY_RXCLK DAC_SER_CLK DAC_IN_CLK]]

set_false_path -from [get_clocks DAC_SER_CLK] -to [get_clocks [list CLK_bmx_320 CLK_bmx_40 PHY_RXCLK DAC_IN_CLK]]
set_false_path -from [get_clocks DAC_IN_CLK] -to [get_clocks [list CLK_bmx_320 CLK_bmx_40 PHY_RXCLK DAC_SER_CLK]]
