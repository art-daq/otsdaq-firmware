# constraints for CAPTAN+X
# Modified Mar 2016 by rrivera at fnal dot gov
# Modified last May 10 2016 aprosser@fnal.gov
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design] 
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design] 
#set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]



####################################################################################
# Constraints from file : 'TOP_LEVEL.ucf'
####################################################################################
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets MASTER_CLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_wiz_1_BLOCK/U0/clk_in40e_clk_wiz_1]
##set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IBUFGDS_CLK40_IN_EXT_n_322]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets bs_clk_in_40MHz]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets x[2]]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in_40MHz]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK40_IN_EXT_P]


set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCLK]
set_property PACKAGE_PIN Y30 [get_ports PHY_RXCLK]

set_property PACKAGE_PIN AA30 [get_ports USER_CLOCK]
set_property IOSTANDARD LVCMOS25 [get_ports USER_CLOCK]

set_property PACKAGE_PIN V31 [get_ports PHY_RXCTL_RXDV]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCTL_RXDV]

#RGMII uses the CTL line
#set_property PACKAGE_PIN V26 [get_ports PHY_RXER]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXER]

set_property PACKAGE_PIN V24 [get_ports PHY_RXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD0]
set_property PACKAGE_PIN W25 [get_ports PHY_RXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD1]
set_property PACKAGE_PIN W24 [get_ports PHY_RXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD2]
set_property PACKAGE_PIN Y28 [get_ports PHY_RXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD3]
set_property PACKAGE_PIN Y25 [get_ports PHY_RXD4]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD4]
set_property PACKAGE_PIN AA25 [get_ports PHY_RXD5]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD5]
set_property PACKAGE_PIN AA24 [get_ports PHY_RXD6]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD6]
set_property PACKAGE_PIN AB25 [get_ports PHY_RXD7]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD7]
# Added by AGProsser to resolve bitstream generation fail
set_property PACKAGE_PIN Y33 [get_ports PHY_RESET]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RESET]

set_property PACKAGE_PIN Y31 [get_ports PHY_TXC_GTXCLK]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXC_GTXCLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PHY_TXC_GTXCLK]

set_property PACKAGE_PIN V32 [get_ports PHY_TXCTL_TXEN]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXCTL_TXEN]

set_property PACKAGE_PIN V33 [get_ports PHY_TXER]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXER]

set_property PACKAGE_PIN W28 [get_ports PHY_TXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD0]
set_property PACKAGE_PIN W26 [get_ports PHY_TXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD1]
set_property PACKAGE_PIN Y32 [get_ports PHY_TXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD2]
set_property PACKAGE_PIN AA28 [get_ports PHY_TXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD3]
set_property PACKAGE_PIN AA27 [get_ports PHY_TXD4]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD4]
set_property PACKAGE_PIN AB27 [get_ports PHY_TXD5]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD5]
set_property PACKAGE_PIN AB26 [get_ports PHY_TXD6]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD6]
set_property PACKAGE_PIN AC31 [get_ports PHY_TXD7]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD7]

# Above supplied by Ryan for CAPTAN+

# Added by AGProsser

# NIMPlus Comparator output pairs


set_property PACKAGE_PIN AL30 [get_ports NIM_COM1_P]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM1_P]
##Above was 0

#set_property PACKAGE_PIN AM30 [get_ports NIM_COM1_N]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM1_N]
##Above was 0

#set_property PACKAGE_PIN AJ30 [get_ports NIM_COM0_P]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM0_P]
##Above was 1
#set_property PACKAGE_PIN AK31 [get_ports NIM_COM0_N]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM0_N]
##Above was 1
#set_property PACKAGE_PIN AJ26 [get_ports NIM_COM3_P]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM3_P]
##Above was 2
#set_property PACKAGE_PIN AK26 [get_ports NIM_COM3_N]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM3_N]
##Above was 2
#set_property PACKAGE_PIN AL25 [get_ports NIM_COM2_P]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM2_P]
##Above was 3
#set_property PACKAGE_PIN AM25 [get_ports NIM_COM2_N]
#set_property IOSTANDARD LVDS_25 [get_ports NIM_COM2_N]
##Above was 3


set_property PACKAGE_PIN AN8 [get_ports NIM_COM1_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM1_P]
#Above was 0

set_property PACKAGE_PIN AP8 [get_ports NIM_COM1_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM1_N]
#Above was 0

set_property PACKAGE_PIN AJ28 [get_ports NIM_COM0_P] 
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM0_P]
#Above was 1
set_property PACKAGE_PIN AK28 [get_ports NIM_COM0_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM0_N]
#Above was 1
set_property PACKAGE_PIN AL4 [get_ports NIM_COM3_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM3_P]
#Above was 2
set_property PACKAGE_PIN AM4 [get_ports NIM_COM3_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM3_N]
#Above was 2
set_property PACKAGE_PIN AL5 [get_ports NIM_COM2_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM2_P]
#Above was 3
set_property PACKAGE_PIN AM5 [get_ports NIM_COM2_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM2_N]
#Above was 3



# DAC serial interface
set_property PACKAGE_PIN AP25 [get_ports DAC_SER_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_SER_CLK]

set_property PACKAGE_PIN AP26 [get_ports DAC_NSYNC]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_NSYNC]

set_property PACKAGE_PIN AK27 [get_ports DAC_DIN]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_DIN]

#Delayed Pulse Output
set_property PACKAGE_PIN AN9 [get_ports NIM_OUT0_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT0_P]

set_property PACKAGE_PIN AP9 [get_ports NIM_OUT0_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT0_N]
#Begin AGProsser 2017_03_31
# Pulse Generator Output
set_property PACKAGE_PIN AL9 [get_ports NIM_OUT1_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT1_P]
 
set_property PACKAGE_PIN AM9 [get_ports NIM_OUT1_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT1_N]

set_property PACKAGE_PIN AC4 [get_ports BKPRSA_P]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSA_P]
 
set_property PACKAGE_PIN AC3 [get_ports BKPRSA_N]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSA_N]

set_property PACKAGE_PIN Y8 [get_ports BKPRSB_P]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSB_P]
 
set_property PACKAGE_PIN Y7 [get_ports BKPRSB_N]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSB_N]

set_property PACKAGE_PIN V2 [get_ports TRIGA_CMS_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports TRIGA_CMS_OUT_P]
 
set_property PACKAGE_PIN V1 [get_ports TRIGA_CMS_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports TRIGA_CMS_OUT_N]

set_property PACKAGE_PIN AK3 [get_ports TRIGB_CMS_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports TRIGB_CMS_OUT_P]
 
set_property PACKAGE_PIN AL3 [get_ports TRIGB_CMS_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports TRIGB_CMS_OUT_N]

set_property PACKAGE_PIN AC9 [get_ports CLK40A_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK40A_OUT_P]
 
set_property PACKAGE_PIN AC8 [get_ports CLK40A_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports CLK40A_OUT_N]

set_property PACKAGE_PIN AN3 [get_ports CLK40B_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK40B_OUT_P]
 
set_property PACKAGE_PIN AP3 [get_ports CLK40B_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports CLK40B_OUT_N]



#set_property PACKAGE_PIN J27 [get_ports TRIG_CMS1_OUT_P]
#set_property IOSTANDARD LVDS_25 [get_ports TRIG_CMS1_OUT_P]

set_property PACKAGE_PIN AJ10 [get_ports NIM_OUT2_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT2_P]

#set_property PACKAGE_PIN J28 [get_ports TRIG_CMS1_OUT_N]
#set_property IOSTANDARD LVDS_25 [get_ports TRIG_CMS1_OUT_N]

set_property PACKAGE_PIN AK10 [get_ports NIM_OUT2_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT2_N]

#set_property PACKAGE_PIN L30 [get_ports CLK40_LEM_P]
#set_property IOSTANDARD LVDS_25 [get_ports CLK40_LEM_P]

#set_property PACKAGE_PIN K30 [get_ports CLK40_LEM_N]
#set_property IOSTANDARD LVDS_25 [get_ports CLK40_LEM_N]

set_property PACKAGE_PIN AM11 [get_ports NIM_OUT3_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT3_P]

set_property PACKAGE_PIN AN11 [get_ports NIM_OUT3_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT3_N]

set_property PACKAGE_PIN AP29 [get_ports CLK40_IN_EXT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK40_IN_EXT_P]

set_property PACKAGE_PIN AP30 [get_ports CLK40_IN_EXT_N]
set_property IOSTANDARD LVDS_25 [get_ports CLK40_IN_EXT_N]

#End AGProsser 2017_03_31
#Created by Constraints Editor (xc4vlx25-ff668-10) - 2011/09/17

# All timing constraint translations are rough conversions, intended to act as a template for further manual refinement. The translations should not be expected to produce semantically identical results to the original ucf. Each xdc timing constraint must be manually inspected and verified to ensure it captures the desired intent

# In xdc, all clocks are related by default. This differs from ucf, where clocks are unrelated unless specified otherwise. As a result, you may now see cross-clock paths that were previously unconstrained in ucf. Commented out xdc false path constraints have been generated and can be uncommented, should you wish to remove these new paths. These commands are located after the last clock definition


