# constraints for CAPTAN+
# Modified Mar 2016 by rrivera at fnal dot gov


set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design] 
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design] 
#set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]

#NW LA 00 and 01 
#set_property PACKAGE_PIN L12 [get_ports COINC_PULSE_0_P]
#set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_0_P]
#set_property PACKAGE_PIN K12 [get_ports COINC_PULSE_0_N]
#set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_0_N]

#set_property PACKAGE_PIN H11 [get_ports COINC_PULSE_1_P]
#set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_1_P]
#set_property PACKAGE_PIN G11 [get_ports COINC_PULSE_1_N]
#set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_1_N]
set_property PACKAGE_PIN AD27 [get_ports COINC_PULSE_0_P]
set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_0_P]
set_property PACKAGE_PIN AD28 [get_ports COINC_PULSE_0_N]
set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_0_N]

set_property PACKAGE_PIN AE28 [get_ports COINC_PULSE_1_P]
set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_1_P]
set_property PACKAGE_PIN AF28 [get_ports COINC_PULSE_1_N]
set_property IOSTANDARD LVDS_25 [get_ports COINC_PULSE_1_N]


# constraints for CAPTAN+X
# Modified Mar 2016 by rrivera at fnal dot gov



####################################################################################
# Constraints from file : 'TOP_LEVEL.ucf'
####################################################################################
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets MASTER_CLK]



set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCLK]
set_property PACKAGE_PIN T26 [get_ports PHY_RXCLK]

set_property PACKAGE_PIN U27 [get_ports USER_CLOCK]
set_property IOSTANDARD LVCMOS25 [get_ports USER_CLOCK]

set_property PACKAGE_PIN W19 [get_ports PHY_RXCTL_RXDV]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCTL_RXDV]

#RGMII uses the CTL line
#set_property PACKAGE_PIN V26 [get_ports PHY_RXER]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXER]

set_property PACKAGE_PIN V29 [get_ports PHY_RXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD0]
set_property PACKAGE_PIN V30 [get_ports PHY_RXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD1]
set_property PACKAGE_PIN V25 [get_ports PHY_RXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD2]
set_property PACKAGE_PIN W26 [get_ports PHY_RXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD3]
set_property PACKAGE_PIN W23 [get_ports PHY_RXD4]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD4]
set_property PACKAGE_PIN W24 [get_ports PHY_RXD5]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD5]
set_property PACKAGE_PIN U22 [get_ports PHY_RXD6]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD6]
set_property PACKAGE_PIN U23 [get_ports PHY_RXD7]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD7]

set_property PACKAGE_PIN T27 [get_ports PHY_TXC_GTXCLK]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXC_GTXCLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PHY_TXC_GTXCLK]

set_property PACKAGE_PIN R19 [get_ports PHY_TXCTL_TXEN]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXCTL_TXEN]

set_property PACKAGE_PIN R23 [get_ports PHY_TXER]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXER]

set_property PACKAGE_PIN P28 [get_ports PHY_TXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD0]
set_property PACKAGE_PIN P27 [get_ports PHY_TXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD1]
set_property PACKAGE_PIN R29 [get_ports PHY_TXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD2]
set_property PACKAGE_PIN P29 [get_ports PHY_TXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD3]
set_property PACKAGE_PIN T23 [get_ports PHY_TXD4]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD4]
set_property PACKAGE_PIN T22 [get_ports PHY_TXD5]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD5]
set_property PACKAGE_PIN T21 [get_ports PHY_TXD6]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD6]
set_property PACKAGE_PIN T20 [get_ports PHY_TXD7]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD7]


set_property PACKAGE_PIN U20 [get_ports PHY_RESET]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RESET]


#set_property PACKAGE_PIN R24 [get_ports FLASH_CLK]
#set_property IOSTANDARD LVCMOS25 [get_ports FLASH_CLK]


