# constraints for CAPTAN+
# Modified Mar 2016 by rrivera at fnal dot gov


#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
#set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
#set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
#set_property CONFIG_VOLTAGE 3.3 [current_design]
#set_property CFGBVS VCCO [current_design]
#set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design] 
#set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design] 

####################################################################################
# Constraints from file : 'TOP_LEVEL.ucf'
####################################################################################
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets MASTER_CLK]



set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXCLK]
set_property PACKAGE_PIN Y30 [get_ports PHY_RXCLK]

#set_property PACKAGE_PIN AA30 [get_ports USER_CLOCK]
#set_property IOSTANDARD LVCMOS33 [get_ports USER_CLOCK]

set_property PACKAGE_PIN V31 [get_ports PHY_RXCTL_RXDV]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXCTL_RXDV]

#RGMII uses the CTL line
#set_property PACKAGE_PIN AA32 [get_ports PHY_RXER]
#set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXER]

set_property PACKAGE_PIN V24 [get_ports PHY_RXD0]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD0]
set_property PACKAGE_PIN W25 [get_ports PHY_RXD1]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD1]
set_property PACKAGE_PIN W24 [get_ports PHY_RXD2]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD2]
set_property PACKAGE_PIN Y28 [get_ports PHY_RXD3]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD3]
set_property PACKAGE_PIN Y25 [get_ports PHY_RXD4]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD4]
set_property PACKAGE_PIN AA25 [get_ports PHY_RXD5]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD5]
set_property PACKAGE_PIN AA24 [get_ports PHY_RXD6]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD6]
set_property PACKAGE_PIN AB25 [get_ports PHY_RXD7]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RXD7]

set_property PACKAGE_PIN Y31 [get_ports PHY_TXC_GTXCLK]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXC_GTXCLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PHY_TXC_GTXCLK]

set_property PACKAGE_PIN V32 [get_ports PHY_TXCTL_TXEN]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXCTL_TXEN]

set_property PACKAGE_PIN V33 [get_ports PHY_TXER]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXER]

set_property PACKAGE_PIN W28 [get_ports PHY_TXD0]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD0]
set_property PACKAGE_PIN W26 [get_ports PHY_TXD1]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD1]
set_property PACKAGE_PIN Y32 [get_ports PHY_TXD2]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD2]
set_property PACKAGE_PIN AA28 [get_ports PHY_TXD3]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD3]
set_property PACKAGE_PIN AA27 [get_ports PHY_TXD4]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD4]
set_property PACKAGE_PIN AB27 [get_ports PHY_TXD5]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD5]
set_property PACKAGE_PIN AB26 [get_ports PHY_TXD6]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD6]
set_property PACKAGE_PIN AC31 [get_ports PHY_TXD7]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_TXD7]


set_property PACKAGE_PIN Y33 [get_ports PHY_RESET]
set_property IOSTANDARD LVCMOS33 [get_ports PHY_RESET]

#set_property  PACKAGE_PIN AA34 [get_ports WATCHDOG_IN]
#set_property IOSTANDARD LVCMOS33 [get_ports WATCHDOG_IN]

set_property PACKAGE_PIN Y26 [get_ports FLASH_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports FLASH_CLK]
								  
								  
								  
								  
