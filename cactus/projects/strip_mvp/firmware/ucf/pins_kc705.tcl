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

####################################################################################
# end PTA connector definitions
####################################################################################

