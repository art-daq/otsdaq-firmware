# constratins for PicoZed
# Created Aug 2015 by rrivera at fnal dot gov



####################################################################################
# PTA Connector definitions
####################################################################################

# J46 on KC705 (the XADC connector)
#XADC_GPIO_1    EXT_CLK_PAD_P
#XADC_GPIO_0    EXT_CLK_PAD_N
#XADC_GPIO_3    EXT_TRIG_PAD_P
#XADC_GPIO_2    EXT_TRIG_PAD_N
set_property PACKAGE_PIN aa25 [get_ports EXT_CLK_PAD_P]			
set_property PACKAGE_PIN ab25 [get_ports EXT_CLK_PAD_N]			
set_property PACKAGE_PIN aa27 [get_ports EXT_TRIG_PAD_P]			
set_property PACKAGE_PIN ab28 [get_ports EXT_TRIG_PAD_N]	

set_property IOSTANDARD LVDS_25 [get_ports EXT_CLK_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports EXT_CLK_PAD_N]			
set_property IOSTANDARD LVDS_25 [get_ports EXT_TRIG_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports EXT_TRIG_PAD_N]	

	

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

set_property PACKAGE_PIN ab27 [get_ports STRIP_MCLKA0_PAD_P]			
set_property PACKAGE_PIN ac27 [get_ports STRIP_MCLKA0_PAD_N]			
set_property PACKAGE_PIN ag29 [get_ports STRIP_MCLKB0_PAD_P]			
set_property PACKAGE_PIN ah29 [get_ports STRIP_MCLKB0_PAD_N]			

set_property PACKAGE_PIN ah26 [get_ports STRIP_BCOCLK_PAD_P[0]]		
set_property PACKAGE_PIN ah27 [get_ports STRIP_BCOCLK_PAD_N[0]]		
set_property PACKAGE_PIN ab29 [get_ports STRIP_RESET_PAD_P[0]]		
set_property PACKAGE_PIN ab30 [get_ports STRIP_RESET_PAD_N[0]]		
set_property PACKAGE_PIN ae30 [get_ports STRIP_SHIFT_PAD_P[0]]		
set_property PACKAGE_PIN af30 [get_ports STRIP_SHIFT_PAD_N[0]]		
set_property PACKAGE_PIN aj28 [get_ports STRIP_SCIN_PAD_P[0]]			
set_property PACKAGE_PIN aj29 [get_ports STRIP_SCIN_PAD_N[0]]			
set_property PACKAGE_PIN y30 [get_ports STRIP_SCOUT_PAD_P[0]]		
set_property PACKAGE_PIN aa30 [get_ports STRIP_SCOUT_PAD_N[0]]		
set_property PACKAGE_PIN ad27 [get_ports STRIP_GOTHITOR_PAD_P[0]]		
set_property PACKAGE_PIN ad28 [get_ports STRIP_GOTHITOR_PAD_N[0]]		
set_property PACKAGE_PIN ac29 [get_ports STRIP_OUT1_0_PAD_P[0]]		
set_property PACKAGE_PIN ac30 [get_ports STRIP_OUT1_0_PAD_N[0]]		
set_property PACKAGE_PIN ad29 [get_ports STRIP_OUT1_1_PAD_P[0]]		
set_property PACKAGE_PIN ae29 [get_ports STRIP_OUT1_1_PAD_N[0]]		
set_property PACKAGE_PIN ae28 [get_ports STRIP_OUT1_2_PAD_P[0]]		
set_property PACKAGE_PIN af28 [get_ports STRIP_OUT1_2_PAD_N[0]]		
set_property PACKAGE_PIN ak29 [get_ports STRIP_OUT1_3_PAD_P[0]]		
set_property PACKAGE_PIN ak30 [get_ports STRIP_OUT1_3_PAD_N[0]]		
set_property PACKAGE_PIN ag30 [get_ports STRIP_OUT1_4_PAD_P[0]]		
set_property PACKAGE_PIN ah30 [get_ports STRIP_OUT1_4_PAD_N[0]]	

							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA0_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA0_PAD_N]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB0_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB0_PAD_N]			

set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_P[0]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_N[0]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_N[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_P[0]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_N[0]]	




# PTA Connector J1 on FMC-to-PTA board
#pta 13    STRIP_MCLKA1_PAD_P]		    
#pta 14    STRIP_MCLKA1_PAD_N]		    
#pta 19    STRIP_MCLKB1_PAD_P]		    
#pta 20    STRIP_MCLKB1_PAD_N]		    
                                     
#pta 25    STRIP_BCOCLK_PAD_P<1>]	
#pta 26    STRIP_BCOCLK_PAD_N<1>]	
#pta 43    STRIP_RESET_PAD_P<1>]	
#pta 44    STRIP_RESET_PAD_N<1>]	
#pta 37    STRIP_SHIFT_PAD_P<1>]	
#pta 38    STRIP_SHIFT_PAD_N<1>]	
#pta 35    STRIP_SCIN_PAD_P<1>]		    
#pta 36    STRIP_SCIN_PAD_N<1>]		    
#pta 47    STRIP_SCOUT_PAD_P<1>]	
#pta 48    STRIP_SCOUT_PAD_N<1>]	
#pta 5     STRIP_GOTHITOR_PAD_P<1>]	    
#pta 6     STRIP_GOTHITOR_PAD_N<1>]	    
#pta 49    STRIP_OUT1_0_PAD_P<1>]	
#pta 50    STRIP_OUT1_0_PAD_N<1>]	
#pta 45    STRIP_OUT1_1_PAD_P<1>]	
#pta 46    STRIP_OUT1_1_PAD_N<1>]	
#pta 39    STRIP_OUT1_2_PAD_P<1>]	
#pta 40    STRIP_OUT1_2_PAD_N<1>]	
#pta 33    STRIP_OUT1_3_PAD_P<1>]	
#pta 34    STRIP_OUT1_3_PAD_N<1>]	
#pta 27    STRIP_OUT1_4_PAD_P<1>]	
#pta 28    STRIP_OUT1_4_PAD_N<1>]	

### These are for J1 to LPC-FMC on KC705
set_property PACKAGE_PIN ad23 [get_ports STRIP_MCLKA1_PAD_P]			
set_property PACKAGE_PIN ae24 [get_ports STRIP_MCLKA1_PAD_N]			
set_property PACKAGE_PIN af22 [get_ports STRIP_MCLKB1_PAD_P]			
set_property PACKAGE_PIN ag23 [get_ports STRIP_MCLKB1_PAD_N]			

set_property PACKAGE_PIN ak20 [get_ports STRIP_BCOCLK_PAD_P[1]]		
set_property PACKAGE_PIN ak21 [get_ports STRIP_BCOCLK_PAD_N[1]]		
set_property PACKAGE_PIN ab24 [get_ports STRIP_RESET_PAD_P[1]]		
set_property PACKAGE_PIN ac25 [get_ports STRIP_RESET_PAD_N[1]]		
set_property PACKAGE_PIN ae25 [get_ports STRIP_SHIFT_PAD_P[1]]		
set_property PACKAGE_PIN af25 [get_ports STRIP_SHIFT_PAD_N[1]]		
set_property PACKAGE_PIN aj24 [get_ports STRIP_SCIN_PAD_P[1]]			
set_property PACKAGE_PIN ak25 [get_ports STRIP_SCIN_PAD_N[1]]			
set_property PACKAGE_PIN ac24 [get_ports STRIP_SCOUT_PAD_P[1]]		
set_property PACKAGE_PIN ad24 [get_ports STRIP_SCOUT_PAD_N[1]]		
set_property PACKAGE_PIN ae23 [get_ports STRIP_GOTHITOR_PAD_P[1]]		
set_property PACKAGE_PIN af23 [get_ports STRIP_GOTHITOR_PAD_N[1]]		
set_property PACKAGE_PIN ac22 [get_ports STRIP_OUT1_0_PAD_P[1]]		
set_property PACKAGE_PIN ad22 [get_ports STRIP_OUT1_0_PAD_N[1]]		
set_property PACKAGE_PIN ad21 [get_ports STRIP_OUT1_1_PAD_P[1]]		
set_property PACKAGE_PIN ae21 [get_ports STRIP_OUT1_1_PAD_N[1]]		
set_property PACKAGE_PIN aa20 [get_ports STRIP_OUT1_2_PAD_P[1]]		
set_property PACKAGE_PIN ab20 [get_ports STRIP_OUT1_2_PAD_N[1]]		
set_property PACKAGE_PIN ak23 [get_ports STRIP_OUT1_3_PAD_P[1]]		
set_property PACKAGE_PIN ak24 [get_ports STRIP_OUT1_3_PAD_N[1]]		
set_property PACKAGE_PIN ag25 [get_ports STRIP_OUT1_4_PAD_P[1]]		
set_property PACKAGE_PIN ah25 [get_ports STRIP_OUT1_4_PAD_N[1]]	

### These are for J1 to HPC-FMC on KC705
#set_property PACKAGE_PIN b25 [get_ports STRIP_MCLKA1_PAD_P]			
#set_property PACKAGE_PIN c25 [get_ports STRIP_MCLKA1_PAD_N]			
#set_property PACKAGE_PIN c27 [get_ports STRIP_MCLKB1_PAD_P]			
#set_property PACKAGE_PIN d27 [get_ports STRIP_MCLKB1_PAD_N]			

#set_property PACKAGE_PIN h30 [get_ports STRIP_BCOCLK_PAD_P[1]]		
#set_property PACKAGE_PIN g30 [get_ports STRIP_BCOCLK_PAD_N[1]]		
#set_property PACKAGE_PIN a25 [get_ports STRIP_RESET_PAD_P[1]]		
#set_property PACKAGE_PIN a26 [get_ports STRIP_RESET_PAD_N[1]]		
#set_property PACKAGE_PIN g27 [get_ports STRIP_SHIFT_PAD_P[1]]		
#set_property PACKAGE_PIN f27 [get_ports STRIP_SHIFT_PAD_N[1]]		
#set_property PACKAGE_PIN d29 [get_ports STRIP_SCIN_PAD_P[1]]			
#set_property PACKAGE_PIN c30 [get_ports STRIP_SCIN_PAD_N[1]]			
#set_property PACKAGE_PIN c24 [get_ports STRIP_SCOUT_PAD_P[1]]		
#set_property PACKAGE_PIN b24 [get_ports STRIP_SCOUT_PAD_N[1]]		
#set_property PACKAGE_PIN d26 [get_ports STRIP_GOTHITOR_PAD_P[1]]		
#set_property PACKAGE_PIN c26 [get_ports STRIP_GOTHITOR_PAD_N[1]]		
#set_property PACKAGE_PIN b27 [get_ports STRIP_OUT1_0_PAD_P[1]]		
#set_property PACKAGE_PIN a27 [get_ports STRIP_OUT1_0_PAD_N[1]]		
#set_property PACKAGE_PIN b28 [get_ports STRIP_OUT1_1_PAD_P[1]]		
#set_property PACKAGE_PIN a28 [get_ports STRIP_OUT1_1_PAD_N[1]]		
#set_property PACKAGE_PIN c29 [get_ports STRIP_OUT1_2_PAD_P[1]]		
#set_property PACKAGE_PIN b29 [get_ports STRIP_OUT1_2_PAD_N[1]]		
#set_property PACKAGE_PIN b30 [get_ports STRIP_OUT1_3_PAD_P[1]]		
#set_property PACKAGE_PIN a30 [get_ports STRIP_OUT1_3_PAD_N[1]]		
#set_property PACKAGE_PIN e28 [get_ports STRIP_OUT1_4_PAD_P[1]]		
#set_property PACKAGE_PIN d28 [get_ports STRIP_OUT1_4_PAD_N[1]]	

							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA1_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA1_PAD_N]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB1_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB1_PAD_N]			

set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_P[1]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_N[1]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_N[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_P[1]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_N[1]]	

####################################################################################
# end PTA connector definitions
####################################################################################

