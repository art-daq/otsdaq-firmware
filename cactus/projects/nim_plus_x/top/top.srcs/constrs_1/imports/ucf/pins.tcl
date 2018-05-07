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
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in40e]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets s_clk25_6e]

# From implementation error (discouraged) suggestion
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_wiz_1_BLOCK/U0/clk_in40e_clk_wiz_1]
##set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IBUFGDS_CLK40_IN_EXT_n_322]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets bs_clk_in_40MHz]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets x[2]]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in_40MHz]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK40_IN_EXT_P]


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
# Added by AGProsser to resolve bitstream generation fail
set_property PACKAGE_PIN U20 [get_ports PHY_RESET]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RESET]

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



# Added by AGProsser
# NIMPlus Comparator output pairs
set_property PACKAGE_PIN N27 [get_ports NIM_COM0_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM0_P]

set_property PACKAGE_PIN M27 [get_ports NIM_COM0_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM0_N]

set_property PACKAGE_PIN N29 [get_ports NIM_COM1_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM1_P]

set_property PACKAGE_PIN N30 [get_ports NIM_COM1_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM1_N]

set_property PACKAGE_PIN N25 [get_ports NIM_COM2_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM2_P]

set_property PACKAGE_PIN N26 [get_ports NIM_COM2_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM2_N]

set_property PACKAGE_PIN N21 [get_ports NIM_COM3_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM3_P]

set_property PACKAGE_PIN N22 [get_ports NIM_COM3_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_COM3_N]

# DAC serial interface
set_property PACKAGE_PIN M28 [get_ports DAC_SER_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_SER_CLK]

set_property PACKAGE_PIN L28 [get_ports DAC_NSYNC]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_NSYNC]

set_property PACKAGE_PIN K28 [get_ports DAC_DIN]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_DIN]

#Delayed Pulse Output
set_property PACKAGE_PIN M20 [get_ports NIM_OUT0_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT0_P]

set_property PACKAGE_PIN L20 [get_ports NIM_OUT0_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT0_N]
#Begin AGProsser 2017_03_31
# Pulse Generator Output


set_property PACKAGE_PIN J29 [get_ports NIM_OUT1_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT1_P]
 
set_property PACKAGE_PIN H29 [get_ports NIM_OUT1_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT1_N]

set_property PACKAGE_PIN B27 [get_ports BKPRSA_P]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSA_P]
 
set_property PACKAGE_PIN A27 [get_ports BKPRSA_N]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSA_N]

set_property PACKAGE_PIN H21 [get_ports BKPRSB_P]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSB_P]
 
set_property PACKAGE_PIN H22 [get_ports BKPRSB_N]
set_property IOSTANDARD LVDS_25 [get_ports BKPRSB_N]

set_property PACKAGE_PIN C29 [get_ports TRIGA_CMS_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports TRIGA_CMS_OUT_P]
 
set_property PACKAGE_PIN B29 [get_ports TRIGA_CMS_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports TRIGA_CMS_OUT_N]

set_property PACKAGE_PIN D16 [get_ports TRIGB_CMS_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports TRIGB_CMS_OUT_P]
 
set_property PACKAGE_PIN C16 [get_ports TRIGB_CMS_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports TRIGB_CMS_OUT_N]

set_property PACKAGE_PIN B18 [get_ports CLK40A_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK40A_OUT_P]
 
set_property PACKAGE_PIN A18 [get_ports CLK40A_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports CLK40A_OUT_N]

set_property PACKAGE_PIN A16 [get_ports CLK40B_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK40B_OUT_P]
 
set_property PACKAGE_PIN A17 [get_ports CLK40B_OUT_N]
set_property IOSTANDARD LVDS_25 [get_ports CLK40B_OUT_N]



#set_property PACKAGE_PIN J27 [get_ports TRIG_CMS1_OUT_P]
#set_property IOSTANDARD LVDS_25 [get_ports TRIG_CMS1_OUT_P]

set_property PACKAGE_PIN J27 [get_ports NIM_OUT2_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT2_P]

#set_property PACKAGE_PIN J28 [get_ports TRIG_CMS1_OUT_N]
#set_property IOSTANDARD LVDS_25 [get_ports TRIG_CMS1_OUT_N]

set_property PACKAGE_PIN J28 [get_ports NIM_OUT2_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT2_N]

#set_property PACKAGE_PIN L30 [get_ports CLK40_LEM_P]
#set_property IOSTANDARD LVDS_25 [get_ports CLK40_LEM_P]

#set_property PACKAGE_PIN K30 [get_ports CLK40_LEM_N]
#set_property IOSTANDARD LVDS_25 [get_ports CLK40_LEM_N]

set_property PACKAGE_PIN L30 [get_ports NIM_OUT3_P]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT3_P]

set_property PACKAGE_PIN K30 [get_ports NIM_OUT3_N]
set_property IOSTANDARD LVDS_25 [get_ports NIM_OUT3_N]

#set_property PACKAGE_PIN Y28 [get_ports CLK40_IN_EXT_P]
#set_property IOSTANDARD LVDS_25 [get_ports CLK40_IN_EXT_P]

#set_property PACKAGE_PIN AA28 [get_ports CLK40_IN_EXT_N]
#set_property IOSTANDARD LVDS_25 [get_ports CLK40_IN_EXT_N]

set_property PACKAGE_PIN Y28 [get_ports CLK25_6_IN_EXT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK25_6_IN_EXT_P]

set_property PACKAGE_PIN AA28 [get_ports CLK25_6_IN_EXT_N]
set_property IOSTANDARD LVDS_25 [get_ports CLK25_6_IN_EXT_N]

#Begin Trig53 Trig40 RJ45s
set_property PACKAGE_PIN AD4 [get_ports TRIG53_0_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_0_P]

set_property PACKAGE_PIN AD3 [get_ports TRIG53_0_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_0_N]

set_property PACKAGE_PIN AE5 [get_ports TRIG53_1_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_1_P]

set_property PACKAGE_PIN AF5 [get_ports TRIG53_1_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_1_N]

set_property PACKAGE_PIN AC5 [get_ports TRIG53_2_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_2_P]

set_property PACKAGE_PIN AC4 [get_ports TRIG53_2_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_2_N]

set_property PACKAGE_PIN AD6 [get_ports TRIG53_3_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_3_P]

set_property PACKAGE_PIN AE6 [get_ports TRIG53_3_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_3_N]

set_property PACKAGE_PIN AF3 [get_ports TRIG53_4_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_4_P]

set_property PACKAGE_PIN AF2 [get_ports TRIG53_4_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_4_N]

set_property PACKAGE_PIN AG4 [get_ports TRIG53_5_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_5_P]

set_property PACKAGE_PIN AG3 [get_ports TRIG53_5_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_5_N]

set_property PACKAGE_PIN AE10 [get_ports TRIG53_6_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_6_P]

set_property PACKAGE_PIN AF10 [get_ports TRIG53_6_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_6_N]

set_property PACKAGE_PIN AD12 [get_ports TRIG53_7_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_7_P]

set_property PACKAGE_PIN AD11 [get_ports TRIG53_7_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_7_N]

set_property PACKAGE_PIN AK11 [get_ports TRIG53_8_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_8_P]

set_property PACKAGE_PIN AK10 [get_ports TRIG53_8_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_8_N]

set_property PACKAGE_PIN AH11 [get_ports TRIG53_9_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_9_P]

set_property PACKAGE_PIN AJ11 [get_ports TRIG53_9_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_9_N]

set_property PACKAGE_PIN AK14 [get_ports TRIG53_10_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_10_P]

set_property PACKAGE_PIN AK13 [get_ports TRIG53_10_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_10_N]

set_property PACKAGE_PIN AJ13 [get_ports TRIG53_11_P]
set_property IOSTANDARD LVDS [get_ports TRIG53_11_P]

set_property PACKAGE_PIN AJ12 [get_ports TRIG53_11_N]
set_property IOSTANDARD LVDS [get_ports TRIG53_11_N]

set_property PACKAGE_PIN AG2 [get_ports TRIG40_0_P]
set_property IOSTANDARD LVDS [get_ports TRIG40_0_P]

set_property PACKAGE_PIN AH1 [get_ports TRIG40_0_N]
set_property IOSTANDARD LVDS [get_ports TRIG40_0_N]

set_property PACKAGE_PIN AJ1 [get_ports TRIG40_1_P]
set_property IOSTANDARD LVDS [get_ports TRIG40_1_P]

set_property PACKAGE_PIN AK1 [get_ports TRIG40_1_N]
set_property IOSTANDARD LVDS [get_ports TRIG40_1_N]

set_property PACKAGE_PIN AF7 [get_ports TRIG40_2_P]
set_property IOSTANDARD LVDS [get_ports TRIG40_2_P]

set_property PACKAGE_PIN AG7 [get_ports TRIG40_2_N]
set_property IOSTANDARD LVDS [get_ports TRIG40_2_N]

set_property PACKAGE_PIN AG13 [get_ports TRIG40_3_P]
set_property IOSTANDARD LVDS [get_ports TRIG40_3_P]

set_property PACKAGE_PIN AH12 [get_ports TRIG40_3_N]
set_property IOSTANDARD LVDS [get_ports TRIG40_3_N]

set_property PACKAGE_PIN AA8 [get_ports TRIG40_4_P]
set_property IOSTANDARD LVDS [get_ports TRIG40_4_P]

set_property PACKAGE_PIN AB8 [get_ports TRIG40_4_N]
set_property IOSTANDARD LVDS [get_ports TRIG40_4_N]

set_property PACKAGE_PIN Y11 [get_ports TRIG40_5_P]
set_property IOSTANDARD LVDS [get_ports TRIG40_5_P]

set_property PACKAGE_PIN Y10 [get_ports TRIG40_5_N]
set_property IOSTANDARD LVDS [get_ports TRIG40_5_N]

set_property PACKAGE_PIN AC2 [get_ports CLCK53_0_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_0_P]

set_property PACKAGE_PIN AC1 [get_ports CLCK53_0_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_0_N]

set_property PACKAGE_PIN AD2 [get_ports CLCK53_1_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_1_P]

set_property PACKAGE_PIN AD1 [get_ports CLCK53_1_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_1_N]

set_property PACKAGE_PIN AH4 [get_ports CLCK53_2_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_2_P]

set_property PACKAGE_PIN AJ4 [get_ports CLCK53_2_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_2_N]

set_property PACKAGE_PIN AJ6 [get_ports CLCK53_3_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_3_P]

set_property PACKAGE_PIN AK6 [get_ports CLCK53_3_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_3_N]

set_property PACKAGE_PIN AE1 [get_ports CLCK53_4_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_4_P]

set_property PACKAGE_PIN AF1 [get_ports CLCK53_4_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_4_N]

set_property PACKAGE_PIN AE4 [get_ports CLCK53_5_P]
set_property IOSTANDARD LVDS_25 [get_ports CLCK53_5_P]

set_property PACKAGE_PIN AE3 [get_ports CLCK53_5_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_5_N]

set_property PACKAGE_PIN AJ9 [get_ports CLCK53_6_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_6_P]

set_property PACKAGE_PIN AK9 [get_ports CLCK53_6_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_6_N]

set_property PACKAGE_PIN AG9 [get_ports CLCK53_7_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_7_P]

set_property PACKAGE_PIN AH9 [get_ports CLCK53_7_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_7_N]

set_property PACKAGE_PIN AH6 [get_ports CLCK53_8_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_8_P]

set_property PACKAGE_PIN AH5 [get_ports CLCK53_8_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_8_N]

set_property PACKAGE_PIN AE13 [get_ports CLCK53_9_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_9_P]

set_property PACKAGE_PIN AF13 [get_ports CLCK53_9_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_9_N]

set_property PACKAGE_PIN AH14 [get_ports CLCK53_10_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_10_P]

set_property PACKAGE_PIN AJ14 [get_ports CLCK53_10_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_10_N]

set_property PACKAGE_PIN AF12 [get_ports CLCK53_11_P]
set_property IOSTANDARD LVDS [get_ports CLCK53_11_P]

set_property PACKAGE_PIN AG12 [get_ports CLCK53_11_N]
set_property IOSTANDARD LVDS [get_ports CLCK53_11_N]

set_property PACKAGE_PIN AH2 [get_ports CLCK40_0_P]
set_property IOSTANDARD LVDS [get_ports CLCK40_0_P]

set_property PACKAGE_PIN AJ2 [get_ports CLCK40_0_N]
set_property IOSTANDARD LVDS [get_ports CLCK40_0_N]

set_property PACKAGE_PIN AJ3 [get_ports CLCK40_1_P]
set_property IOSTANDARD LVDS [get_ports CLCK40_1_P]

set_property PACKAGE_PIN AK3 [get_ports CLCK40_1_N]
set_property IOSTANDARD LVDS [get_ports CLCK40_1_N]

set_property PACKAGE_PIN AH7 [get_ports CLCK40_2_P]
set_property IOSTANDARD LVDS [get_ports CLCK40_2_P]

set_property PACKAGE_PIN AJ7 [get_ports CLCK40_2_N]
set_property IOSTANDARD LVDS [get_ports CLCK40_2_N]

set_property PACKAGE_PIN AA12 [get_ports CLCK40_3_P]
set_property IOSTANDARD LVDS_25 [get_ports CLCK40_3_P]

set_property PACKAGE_PIN AB12 [get_ports CLCK40_3_N]
set_property IOSTANDARD LVDS [get_ports CLCK40_3_N]

set_property PACKAGE_PIN AB9 [get_ports CLCK40_4_P]
set_property IOSTANDARD LVDS [get_ports CLCK40_4_P]

set_property PACKAGE_PIN AC9 [get_ports CLCK40_4_N]
set_property IOSTANDARD LVDS [get_ports CLCK40_4_N]

set_property PACKAGE_PIN AA11 [get_ports CLCK40_5_P]
set_property IOSTANDARD LVDS [get_ports CLCK40_5_P]

set_property PACKAGE_PIN AA10 [get_ports CLCK40_5_N]
set_property IOSTANDARD LVDS [get_ports CLCK40_5_N]
#End Trig53 Trig40 RJ45s

#End AGProsser 2017_03_31
#Created by Constraints Editor (xc4vlx25-ff668-10) - 2011/09/17

# All timing constraint translations are rough conversions, intended to act as a template for further manual refinement. The translations should not be expected to produce semantically identical results to the original ucf. Each xdc timing constraint must be manually inspected and verified to ensure it captures the desired intent

# In xdc, all clocks are related by default. This differs from ucf, where clocks are unrelated unless specified otherwise. As a result, you may now see cross-clock paths that were previously unconstrained in ucf. Commented out xdc false path constraints have been generated and can be uncommented, should you wish to remove these new paths. These commands are located after the last clock definition


