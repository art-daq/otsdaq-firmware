# constraints for kc705
# Modified Mar 2016 by rrivera at fnal dot gov

#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
#set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
#set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
#set_property CONFIG_VOLTAGE 2.5 [current_design]
#set_property CFGBVS VCCO [current_design]
#set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design] 
#set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design] 

####################################################################################
# Constraints from file : 'TOP_LEVEL.ucf'
####################################################################################


set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCLK]
set_property PACKAGE_PIN U27 [get_ports PHY_RXCLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets MASTER_CLK]

#66 MHz EMCCLK flash clock
set_property PACKAGE_PIN R24 [get_ports USER_CLOCK]
set_property IOSTANDARD LVCMOS25 [get_ports USER_CLOCK]

set_property PACKAGE_PIN R28 [get_ports PHY_RXCTL_RXDV]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCTL_RXDV]

#RGMII uses the CTL line
#set_property PACKAGE_PIN V26 [get_ports PHY_RXER]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXER]

set_property PACKAGE_PIN U30 [get_ports PHY_RXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD0]
set_property PACKAGE_PIN U25 [get_ports PHY_RXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD1]
set_property PACKAGE_PIN T25 [get_ports PHY_RXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD2]
set_property PACKAGE_PIN U28 [get_ports PHY_RXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD3]
set_property PACKAGE_PIN R19 [get_ports PHY_RXD4]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD4]
set_property PACKAGE_PIN T27 [get_ports PHY_RXD5]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD5]
set_property PACKAGE_PIN T26 [get_ports PHY_RXD6]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD6]
set_property PACKAGE_PIN T28 [get_ports PHY_RXD7]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD7]

set_property PACKAGE_PIN K30 [get_ports PHY_TXC_GTXCLK]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXC_GTXCLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PHY_TXC_GTXCLK]

set_property PACKAGE_PIN M27 [get_ports PHY_TXCTL_TXEN]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXCTL_TXEN]

set_property PACKAGE_PIN N29 [get_ports PHY_TXER]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXER]

set_property PACKAGE_PIN N27 [get_ports PHY_TXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD0]
set_property PACKAGE_PIN N25 [get_ports PHY_TXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD1]
set_property PACKAGE_PIN M29 [get_ports PHY_TXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD2]
set_property PACKAGE_PIN L28 [get_ports PHY_TXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD3]
set_property PACKAGE_PIN J26 [get_ports PHY_TXD4]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD4]
set_property PACKAGE_PIN K26 [get_ports PHY_TXD5]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD5]
set_property PACKAGE_PIN L30 [get_ports PHY_TXD6]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD6]
set_property PACKAGE_PIN J28 [get_ports PHY_TXD7]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD7]


set_property PACKAGE_PIN L20 [get_ports PHY_RESET]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RESET]
