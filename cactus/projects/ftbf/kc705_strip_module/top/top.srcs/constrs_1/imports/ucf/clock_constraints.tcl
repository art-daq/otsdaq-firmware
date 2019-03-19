# constraints for clocks
# Created Feb 2016 by rrivera at fnal dot gov


# In xdc, all clocks are related by default. This differs from ucf, where clocks are unrelated unless specified otherwise. As a result, you may now see cross-clock paths that were previously unconstrained in ucf. Commented out xdc false path constraints have been generated and can be uncommented, should you wish to remove these new paths. These commands are located after the last clock definition

create_clock -name PHY_RXCLK -period 8.000 [get_ports PHY_RXCLK]
create_clock -name CLK15NS -period 16.000 [get_pins CLK15NS_bufg/O]
create_clock -name CLK5MHZ -period 256.000 [get_pins CLK5MHz_bufg/O]


create_clock -name BCOCLK_FAST -period 32.000 [get_pins ext_bcoclk_bufg/O]
#strip_imp/stripclk_imp/bcoclkmux/O]
create_clock -name BCOCLK -period 64.000 [get_pins strip_imp/stripclk_imp/dcm_bco_div_inst/O]



set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets EXT_CLK_input]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK15NS]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets strip_imp/stripclk_imp/fracbcoclk]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets ext_clk]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets strip_imp/stripclk_imp/bcoclk]


set_false_path -from [get_clocks [list BCOCLK BCOCLK_FAST]] -to [get_clocks [list PHY_RXCLK   CLK5MHZ   CLK15NS    MCLK_A_strips_mclk_mmcm    MCLK_MULT3_strips_mclk_mmcm]]
set_false_path -from [get_clocks [list PHY_RXCLK   CLK5MHZ   CLK15NS    MCLK_A_strips_mclk_mmcm    MCLK_MULT3_strips_mclk_mmcm]]  -to [get_clocks [list BCOCLK BCOCLK_FAST]]

#this is supposed to be for chipscope stuff.. but it is messing up burst write pulse timing
#set_max_delay  16.000 -from [get_clocks [list MCLK_A_strips_mclk_mmcm CLK15NS CLK5MHZ]] -to [get_clocks [list PHY_RXCLK]]
#so tryin to isolate data only.. because data has 16ns to get out.
set_max_delay 16.000 -from [get_pins {strip_imp/*strip_fifo_imp/fifo_imp/*/*/*/*/*/*/*/*/RDCLK}]   -to [get_clocks [list PHY_RXCLK]]
set_max_delay 16.000 -from [get_pins strip_imp/*/TOKEN_*/C]  -to [get_clocks [list PHY_RXCLK]]

#extra delay read data from strip instance.. since a ton of delay in readback strobe user_ready signal
set_max_delay  64.000 -to [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ tx_data*)}] 
set_max_delay  64.000 -to [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ strip_imp/write_data*)}] 
#extra delay write data to strip instance.. since 2 extra clocks of delay in write strobe
set_max_delay  24.000 -from [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ eth_interface/data_manager_blk/RAM_COMM_DEC/ram_wdata*)}] -to [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ strip_imp/*)}]
#from [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ rxdata/*)}]
# -to [get_clocks [list PHY_RXCLK]]
set_false_path  -from [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ CLK15NS_bufg*)}] -to [get_clocks PHY_RXCLK]
set_false_path  -from [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ CLK5MHz_bufg*)}] -to [get_clocks PHY_RXCLK]
#clkout2 on mmcm is MCLK_DIV4_strips_mclk_mmcm
set_false_path  -from [get_pins strip_imp/stripclk_imp/strips_mclk_gen/U0/mmcm_adv_inst/CLKOUT2] -to [get_clocks PHY_RXCLK]

#for dout in serdes to chipscope
set_max_delay  -datapath_only 24.000  -from [get_cells * -hierarchical -filter {IS_PRIMITIVE == true && (NAME =~ strip_imp/*serdes*/DOUT*)}] -to [get_clocks PHY_RXCLK]

#set_false_path -from [get_clocks CLK5MHZ] -to [get_clocks [list PHY_RXCLK   CLK15NS]]
#set_false_path -from [get_clocks CLK15NS] -to [get_clocks [list PHY_RXCLK   CLK5MHZ]]
#set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list MCLK_A_strips_mclk_mmcm   MCLK_DIV4_strips_mclk_mmcm]]


#set_false_path -from [get_clocks MCLK_A_strips_mclk_mmcm] -to [get_clocks [list  PHY_RXCLK]]
#set_false_path -from [get_clocks MCLK_B_strips_mclk_mmcm] -to [get_clocks [list  PHY_RXCLK]]
#set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list MCLK_A_strips_mclk_mmcm]]
#set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list MCLK_B_strips_mclk_mmcm MCLK_MULT3_strips_mclk_mmcm]]

#set_false_path -from [get_clocks MCLK_A_strips_mclk_mmcm] -to [get_clocks [list  CLK15NS    clk_out_bcoclk_pmcd]]
#set_false_path -from [get_clocks MCLK_B_strips_mclk_mmcm] -to [get_clocks [list  CLK15NS    clk_out_bcoclk_pmcd]]
#set_false_path -from [get_clocks CLK15NS] -to [get_clocks [list  MCLK_A_strips_mclk_mmcm    MCLK_B_strips_mclk_mmcm     clk_out_bcoclk_pmcd]]
