# constraints for CAPTAN+X
# Modified Mar 2016 by rrivera at fnal dot gov



####################################################################################
# Constraints from file : 'TOP_LEVEL.ucf'
####################################################################################
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets MASTER_CLK]



set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXCLK]
set_property PACKAGE_PIN T26 [get_ports PHY_RXCLK]

#set_property PACKAGE_PIN U27 [get_ports USER_CLOCK]
#set_property IOSTANDARD LVCMOS33 [get_ports USER_CLOCK]

set_property PACKAGE_PIN W19 [get_ports PHY_RXCTL_RXDV]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXCTL_RXDV]

#RGMII uses the CTL line
#set_property PACKAGE_PIN V26 [get_ports PHY_RXER]
#set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXER]

set_property PACKAGE_PIN V29 [get_ports PHY_RXD0]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD0]
set_property PACKAGE_PIN V30 [get_ports PHY_RXD1]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD1]
set_property PACKAGE_PIN V25 [get_ports PHY_RXD2]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD2]
set_property PACKAGE_PIN W26 [get_ports PHY_RXD3]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD3]
set_property PACKAGE_PIN W23 [get_ports PHY_RXD4]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD4]
set_property PACKAGE_PIN W24 [get_ports PHY_RXD5]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD5]
set_property PACKAGE_PIN U22 [get_ports PHY_RXD6]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD6]
set_property PACKAGE_PIN U23 [get_ports PHY_RXD7]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD7]

set_property PACKAGE_PIN T27 [get_ports PHY_TXC_GTXCLK]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXC_GTXCLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PHY_TXC_GTXCLK]

set_property PACKAGE_PIN R19 [get_ports PHY_TXCTL_TXEN]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXCTL_TXEN]

set_property PACKAGE_PIN R23 [get_ports PHY_TXER]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXER]

set_property PACKAGE_PIN P28 [get_ports PHY_TXD0]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD0]
set_property PACKAGE_PIN P27 [get_ports PHY_TXD1]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD1]
set_property PACKAGE_PIN R29 [get_ports PHY_TXD2]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD2]
set_property PACKAGE_PIN P29 [get_ports PHY_TXD3]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD3]
set_property PACKAGE_PIN T23 [get_ports PHY_TXD4]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD4]
set_property PACKAGE_PIN T22 [get_ports PHY_TXD5]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD5]
set_property PACKAGE_PIN T21 [get_ports PHY_TXD6]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD6]
set_property PACKAGE_PIN T20 [get_ports PHY_TXD7]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD7]


set_property PACKAGE_PIN U20 [get_ports PHY_RESET]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RESET]


#Created by Constraints Editor (xc4vlx25-ff668-10) - 2011/09/17

# All timing constraint translations are rough conversions, intended to act as a template for further manual refinement. The translations should not be expected to produce semantically identical results to the original ucf. Each xdc timing constraint must be manually inspected and verified to ensure it captures the desired intent

# In xdc, all clocks are related by default. This differs from ucf, where clocks are unrelated unless specified otherwise. As a result, you may now see cross-clock paths that were previously unconstrained in ucf. Commented out xdc false path constraints have been generated and can be uncommented, should you wish to remove these new paths. These commands are located after the last clock definition

# D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.ucf:66
create_clock -name PHY_RXCLK -period 8.000 [get_ports PHY_RXCLK]
create_clock -name CLK15NS -period 16.000 [get_pins CLK15NS_bufg/O]
create_clock -name CLK5MHZ -period 256.000 [get_pins CLK5MHz_bufg/O]

set_false_path -from [get_clocks CLK5MHZ] -to [get_clocks [list PHY_RXCLK   CLK15NS]]
set_false_path -from [get_clocks CLK15NS] -to [get_clocks [list PHY_RXCLK   CLK5MHZ]]
set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list CLK5MHZ   CLK15NS]]
