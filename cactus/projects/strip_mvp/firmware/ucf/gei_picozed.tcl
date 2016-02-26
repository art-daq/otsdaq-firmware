# constratins for PicoZed
# Created Aug 2015 by rrivera at fnal dot gov



####################################################################################
# PTA Connector definitions
####################################################################################

# PTA Connector J2 on FMC-to-PTA board
#pta 13    STRIP_MCLKA0_PAD_P]		    
#pta 14    STRIP_MCLKA0_PAD_N]		    
#pta 19    STRIP_MCLKB0_PAD_P]		    
#pta 20    STRIP_MCLKB0_PAD_N]		    
                                     
#pta 25    STRIP_BCOCLK_PAD_P<0>]	
#pta 26    STRIP_BCOCLK_PAD_N<0>]	
#pta 43    STRIP_RESET_PAD_P<0>]	
#pta 44    STRIP_RESET_PAD_N<0>]	
#pta 37    STRIP_SHIFT_PAD_P<0>]	
#pta 38    STRIP_SHIFT_PAD_N<0>]	
#pta 35    STRIP_SCIN_PAD_P<0>]		    
#pta 36    STRIP_SCIN_PAD_N<0>]		    
#pta 47    STRIP_SCOUT_PAD_P<0>]	
#pta 48    STRIP_SCOUT_PAD_N<0>]	
#pta 5     STRIP_GOTHITOR_PAD_P<0>]	    
#pta 6     STRIP_GOTHITOR_PAD_N<0>]	    
#pta 49    STRIP_OUT1_0_PAD_P<0>]	
#pta 50    STRIP_OUT1_0_PAD_N<0>]	
#pta 45    STRIP_OUT1_1_PAD_P<0>]	
#pta 46    STRIP_OUT1_1_PAD_N<0>]	
#pta 39    STRIP_OUT1_2_PAD_P<0>]	
#pta 40    STRIP_OUT1_2_PAD_N<0>]	
#pta 33    STRIP_OUT1_3_PAD_P<0>]	
#pta 34    STRIP_OUT1_3_PAD_N<0>]	
#pta 27    STRIP_OUT1_4_PAD_P<0>]	
#pta 28    STRIP_OUT1_4_PAD_N<0>]	
set_property PACKAGE_PIN L5 [get_ports STRIP_MCLKA0_PAD_P]			
set_property PACKAGE_PIN L4 [get_ports STRIP_MCLKA0_PAD_N]			
set_property PACKAGE_PIN B4 [get_ports STRIP_MCLKB0_PAD_P]			
set_property PACKAGE_PIN B3 [get_ports STRIP_MCLKB0_PAD_N]			

set_property PACKAGE_PIN J8 [get_ports STRIP_BCOCLK_PAD_P[0]]		
set_property PACKAGE_PIN K8 [get_ports STRIP_BCOCLK_PAD_N[0]]		
set_property PACKAGE_PIN A7 [get_ports STRIP_RESET_PAD_P[0]]		
set_property PACKAGE_PIN A6 [get_ports STRIP_RESET_PAD_N[0]]		
set_property PACKAGE_PIN A5 [get_ports STRIP_SHIFT_PAD_P[0]]		
set_property PACKAGE_PIN A4 [get_ports STRIP_SHIFT_PAD_N[0]]		
set_property PACKAGE_PIN N6 [get_ports STRIP_SCIN_PAD_P[0]]			
set_property PACKAGE_PIN N5 [get_ports STRIP_SCIN_PAD_N[0]]			
set_property PACKAGE_PIN C8 [get_ports STRIP_SCOUT_PAD_P[0]]		
set_property PACKAGE_PIN B8 [get_ports STRIP_SCOUT_PAD_N[0]]		
set_property PACKAGE_PIN U2 [get_ports STRIP_GOTHITOR_PAD_P[0]]		
set_property PACKAGE_PIN U1 [get_ports STRIP_GOTHITOR_PAD_N[0]]		
set_property PACKAGE_PIN B7 [get_ports STRIP_OUT1_0_PAD_P[0]]		
set_property PACKAGE_PIN B6 [get_ports STRIP_OUT1_0_PAD_N[0]]		
set_property PACKAGE_PIN G8 [get_ports STRIP_OUT1_1_PAD_P[0]]		
set_property PACKAGE_PIN G7 [get_ports STRIP_OUT1_1_PAD_N[0]]		
set_property PACKAGE_PIN F7 [get_ports STRIP_OUT1_2_PAD_P[0]]		
set_property PACKAGE_PIN E7 [get_ports STRIP_OUT1_2_PAD_N[0]]		
set_property PACKAGE_PIN M8 [get_ports STRIP_OUT1_3_PAD_P[0]]		
set_property PACKAGE_PIN M7 [get_ports STRIP_OUT1_3_PAD_N[0]]		
set_property PACKAGE_PIN D7 [get_ports STRIP_OUT1_4_PAD_P[0]]		
set_property PACKAGE_PIN D6 [get_ports STRIP_OUT1_4_PAD_N[0]]		

#NET "STRIP_BCOCLK_PAD_P<5>" LOC = H22;      #pta 25
#NET "STRIP_BCOCLK_PAD_N<5>" LOC = H21;      #pta 26
#NET "STRIP_RESET_PAD_P<5>" LOC = J21;       #pta 43
#NET "STRIP_RESET_PAD_N<5>" LOC = J20;       #pta 44
#NET "STRIP_SHIFT_PAD_P<5>" LOC = E21;       #pta 37
#NET "STRIP_SHIFT_PAD_N<5>" LOC = D21;       #pta 38
#NET "STRIP_SCIN_PAD_P<5>" LOC = A20;        #pta 35
#NET "STRIP_SCIN_PAD_N<5>" LOC = A19;        #pta 36
#NET "STRIP_SCOUT_PAD_P<5>" LOC = J26;       #pta 47
#NET "STRIP_SCOUT_PAD_N<5>" LOC = J25;       #pta 48
#NET "STRIP_GOTHITOR_PAD_P<5>" LOC = B13;    #pta 5
#NET "STRIP_GOTHITOR_PAD_N<5>" LOC = B12;    #pta 6
#NET "STRIP_OUT1_0_PAD_P<5>" LOC = H26;      #pta 49
#NET "STRIP_OUT1_0_PAD_N<5>" LOC = H25;      #pta 50
#NET "STRIP_OUT1_1_PAD_P<5>" LOC = J23;      #pta 45
#NET "STRIP_OUT1_1_PAD_N<5>" LOC = J22;      #pta 46
#NET "STRIP_OUT1_2_PAD_P<5>" LOC = K24;      #pta 39
#NET "STRIP_OUT1_2_PAD_N<5>" LOC = K23;      #pta 40
#NET "STRIP_OUT1_3_PAD_P<5>" LOC = D22;      #pta 33
#NET "STRIP_OUT1_3_PAD_N<5>" LOC = C22;      #pta 34
#NET "STRIP_OUT1_4_PAD_P<5>" LOC = D24;      #pta 27
#NET "STRIP_OUT1_4_PAD_N<5>" LOC = C24;      #pta 28

####################################################################################
# end PTA connector definitions
####################################################################################



####################################################################################
# Constraints from file : 'TOP_LEVEL.ucf'
####################################################################################
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets MASTER_CLK]



set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCLK]
set_property PACKAGE_PIN AB18 [get_ports PHY_RXCLK]

#set_property PACKAGE_PIN U9 [get_ports USER_CLOCK]
#set_property IOSTANDARD LVCMOS25 [get_ports USER_CLOCK]

set_property PACKAGE_PIN AB19 [get_ports PHY_RXCTL_DV]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXCTL_DV]

#RGMII uses the CTL line
#set_property PACKAGE_PIN V26 [get_ports PHY_RXER]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXER]

set_property PACKAGE_PIN AB21 [get_ports PHY_RXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD0]
set_property PACKAGE_PIN AB22 [get_ports PHY_RXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD1]
set_property PACKAGE_PIN AA19 [get_ports PHY_RXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD2]
set_property PACKAGE_PIN AA20 [get_ports PHY_RXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD3]

#RGMII uses 4 data lines
#set_property PACKAGE_PIN W23 [get_ports PHY_RXD4]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD4]
#set_property PACKAGE_PIN W24 [get_ports PHY_RXD5]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD5]
#set_property PACKAGE_PIN U22 [get_ports PHY_RXD6]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD6]
#set_property PACKAGE_PIN U23 [get_ports PHY_RXD7]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_RXD7]

set_property PACKAGE_PIN V18 [get_ports PHY_TXC_GTXCLK]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXC_GTXCLK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PHY_TXC_GTXCLK]

set_property PACKAGE_PIN W18 [get_ports PHY_TXCTL_EN]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXCTL_EN]

#RGMII uses the CTL line
#set_property PACKAGE_PIN R23 [get_ports PHY_TXER]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXER]

set_property PACKAGE_PIN AA14 [get_ports PHY_TXD0]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD0]
set_property PACKAGE_PIN AA15 [get_ports PHY_TXD1]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD1]
set_property PACKAGE_PIN U19 [get_ports PHY_TXD2]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD2]
set_property PACKAGE_PIN V19 [get_ports PHY_TXD3]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD3]

#RGMII uses 4 data lines
#set_property PACKAGE_PIN T23 [get_ports PHY_TXD4]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD4]
#set_property PACKAGE_PIN T22 [get_ports PHY_TXD5]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD5]
#set_property PACKAGE_PIN T21 [get_ports PHY_TXD6]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD6]
#set_property PACKAGE_PIN T20 [get_ports PHY_TXD7]
#set_property IOSTANDARD LVCMOS25 [get_ports PHY_TXD7]

#Not sure where external reset should come from for PicoZed
# trying using SW3 on carrier
set_property PACKAGE_PIN V14 [get_ports PHY_RESET]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RESET]

#LED1
set_property PACKAGE_PIN Y18 [get_ports PZ_ULED_1]
set_property IOSTANDARD LVCMOS25 [get_ports PZ_ULED_1]

#LED2
#set_property PACKAGE_PIN Y19 [get_ports PZ_ULED_2]
#set_property IOSTANDARD LVCMOS25 [get_ports PZ_ULED_2]



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

set_false_path -from [get_clocks MCLK_A_strips_mclk_mmcm] -to [get_clocks [list  CLK15NS    clk_out_bcoclk_pmcd]]
set_false_path -from [get_clocks MCLK_B_strips_mclk_mmcm] -to [get_clocks [list  CLK15NS    clk_out_bcoclk_pmcd]]
set_false_path -from [get_clocks CLK15NS] -to [get_clocks [list  MCLK_A_strips_mclk_mmcm    MCLK_B_strips_mclk_mmcm     clk_out_bcoclk_pmcd]]
#set_false_path -from [get_clocks clk_out_bcoclk_pmcd] -to [get_clocks [list  CLK15NS    MCLK_A_strips_mclk_mmcm    MCLK_B_strips_mclk_mmcm  CLK5MHZ  \
#        MCLK_DIV4_strips_mclk_mmcm      MCLK_MULT3_strips_mclk_mmcm]]


#Created by Constraints Editor (xc6vlx240t-ff1156-1) - 2012/08/15
# D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.ucf:69
# A PERIOD placed on an internal net will result in a clock defined with an internal source. Any upstream source clock latency will not be analyzed
#create_clock -name user_clk -period 8.000 [get_pins XLXI_6101/O]
# D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.ucf:71
## A PERIOD placed on an internal net will result in a clock defined with an internal source. Any upstream source clock latency will not be analyzed
#create_clock -name q_tmp -period 16.000 [get_pins XLXI_6035/q_tmp_reg/Q]
### D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.ucf:73
### A PERIOD placed on an internal net will result in a clock defined with an internal source. Any upstream source clock latency will not be analyzed
#create_clock -name q_tmp_1 -period 20.000 [get_pins XLXI_6040/q_tmp_reg/Q]
### D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.ucf:75
### A PERIOD placed on an internal net will result in a clock defined with an internal source. Any upstream source clock latency will not be analyzed
#create_clock -name q_tmp_2 -period 40.000 [get_pins XLXI_6055/q_tmp_reg/Q]
### D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.ucf:77
### A PERIOD placed on an internal net will result in a clock defined with an internal source. Any upstream source clock latency will not be analyzed
#create_clock -name q_tmp_3 -period 40.000 [get_pins XLXI_6058/q_tmp_reg/Q]
### D:/Projects/OtsUDPplusX/fw_00/GEL_OtsUDP/TOP_LEVEL.ucf:79
### A PERIOD placed on an internal net will result in a clock defined with an internal source. Any upstream source clock latency will not be analyzed
#create_clock -name q_tmp_4 -period 40.000 [get_pins XLXI_6032/q_tmp_reg/Q]

## The following cross clock domain false path constraints can be uncommented in order to mimic ucf constraints behavior (see message at the beginning of this file)
#set_false_path -from [get_clocks PHY_RXCLK] -to [get_clocks [list user_clk q_tmp q_tmp_1 q_tmp_2 q_tmp_3 q_tmp_4]]
##set_false_path -from [get_clocks user_clk] -to [get_clocks [list PHY_RXCLK q_tmp q_tmp_1 q_tmp_2 q_tmp_3 q_tmp_4]]
#set_false_path -from [get_clocks q_tmp] -to [get_clocks [list PHY_RXCLK user_clk q_tmp_1 q_tmp_2 q_tmp_3 q_tmp_4]]
#set_false_path -from [get_clocks q_tmp_1] -to [get_clocks [list PHY_RXCLK user_clk q_tmp q_tmp_2 q_tmp_3 q_tmp_4]]
#set_false_path -from [get_clocks q_tmp_2] -to [get_clocks [list PHY_RXCLK user_clk q_tmp q_tmp_1 q_tmp_3 q_tmp_4]]
#set_false_path -from [get_clocks q_tmp_3] -to [get_clocks [list PHY_RXCLK user_clk q_tmp q_tmp_1 q_tmp_2 q_tmp_4]]
#set_false_path -from [get_clocks q_tmp_4] -to [get_clocks [list PHY_RXCLK user_clk q_tmp q_tmp_1 q_tmp_2 q_tmp_3]]










#set_max_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXCTL_EN] 11
#set_max_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXD*] 11 

#set_output_delay -clock PHY_RXCLK 4 [get_ports PHY_TXCTL_EN]
#set_output_delay -clock PHY_RXCLK 4 [get_ports PHY_TXD*]
#set_output_delay -clock PHY_RXCLK -2.5 [get_ports PHY_TXC_GTXCLK]

#set_max_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXCTL_EN] 7 -datapath_only
#set_max_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXD*] 7 -datapath_only
#set_max_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXC_GTXCLK] 7 -datapath_only


#set_min_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXCTL_EN] 8 
#set_min_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXD*] 7 
#set_max_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXC_GTXCLK] 8 -datapath_only
#set_min_delay -from [get_clocks PHY_RXCLK] -to [get_ports PHY_TXC_GTXCLK] 6

#set_property LOC SLICE_X1Y20 [get_cells eth_interface/GEC_blk/RGMII_Block/is_rgmii_sig_reg]
#set_property BEL BFF [get_cells eth_interface/GEC_blk/RGMII_Block/is_rgmii_sig_reg]
#set_property LOC SLICE_X1Y12 [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TX_EN_INST_0]
#set_property BEL B6LUT [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TX_EN_INST_0]
#set_property LOC SLICE_X1Y22 [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[0]_INST_0]
#set_property BEL B6LUT [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[0]_INST_0]
#set_property LOC SLICE_X0Y27 [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[1]_INST_0]
#set_property BEL A6LUT [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[1]_INST_0]
#set_property LOC SLICE_X1Y12 [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[2]_INST_0]
#set_property BEL A6LUT [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[2]_INST_0]
#set_property LOC SLICE_X1Y9 [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[3]_INST_0]
#set_property BEL A6LUT [get_cells eth_interface/GEC_blk/RGMII_Block/PHY_TXD[3]_INST_0]

