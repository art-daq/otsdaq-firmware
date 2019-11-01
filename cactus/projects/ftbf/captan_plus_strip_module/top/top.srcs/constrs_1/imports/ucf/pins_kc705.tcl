# constratins for CAPTAN+
# Modified Nov 2019 by rrivera at fnal dot gov



####################################################################################
# PTA Connector definitions
####################################################################################

# J46 on KC705 (the XADC connector)
#XADC_GPIO_1    EXT_CLK_PAD_P    #SE_HB_01 PTA-J4 pins 5/6
#XADC_GPIO_0    EXT_CLK_PAD_N
#XADC_GPIO_3    EXT_TRIG_PAD_P  #SE_HB_02 PTA-J4 pins 9/10 
#XADC_GPIO_2    EXT_TRIG_PAD_N

set_property PACKAGE_PIN ac24 [get_ports EXT_CLK_PAD_P]	 		
set_property PACKAGE_PIN ad24 [get_ports EXT_CLK_PAD_N]			
set_property PACKAGE_PIN ag24 [get_ports EXT_TRIG_PAD_P]			
set_property PACKAGE_PIN ah24 [get_ports EXT_TRIG_PAD_N]	

set_property IOSTANDARD LVDS_25 [get_ports EXT_CLK_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports EXT_CLK_PAD_N]			
set_property IOSTANDARD LVDS_25 [get_ports EXT_TRIG_PAD_P]			
set_property IOSTANDARD LVDS_25 [get_ports EXT_TRIG_PAD_N]	

	

# PTA Connector J2 on FMC-to-PTA board
#pta 13    STRIP_MCLKA0_PAD_P]		 LA_18   
#pta 14    STRIP_MCLKA0_PAD_N]		    
#pta 19    STRIP_MCLKB0_PAD_P]		 CLK1_M2C   
#pta 20    STRIP_MCLKB0_PAD_N]		    
                                     
#pta 25    STRIP_BCOCLK_PAD_P<0>]	 LA_23
#pta 26    STRIP_BCOCLK_PAD_N<0>]	
#pta 43    STRIP_RESET_PAD_P<0>]	 LA_30
#pta 44    STRIP_RESET_PAD_N<0>]	
#pta 37    STRIP_SHIFT_PAD_P<0>]	 LA_28
#pta 38    STRIP_SHIFT_PAD_N<0>]	
#pta 35    STRIP_SCIN_PAD_P<0>]		  LA_27
#pta 36    STRIP_SCIN_PAD_N<0>]		    
#pta 47    STRIP_SCOUT_PAD_P<0>]	 LA_32 
#pta 48    STRIP_SCOUT_PAD_N<0>]	
#pta 5     STRIP_GOTHITOR_PAD_P<0>]	   LA_18
#pta 6     STRIP_GOTHITOR_PAD_N<0>]	    
#pta 49    STRIP_OUT1_0_PAD_P<0>]	 LA_33
#pta 50    STRIP_OUT1_0_PAD_N<0>]	
#pta 45    STRIP_OUT1_1_PAD_P<0>]	 LA_31
#pta 46    STRIP_OUT1_1_PAD_N<0>]	
#pta 39    STRIP_OUT1_2_PAD_P<0>]	 LA_29
#pta 40    STRIP_OUT1_2_PAD_N<0>]	
#pta 33    STRIP_OUT1_3_PAD_P<0>]	 LA_26
#pta 34    STRIP_OUT1_3_PAD_N<0>]	
#pta 27    STRIP_OUT1_4_PAD_P<0>]	 LA_24
#pta 28    STRIP_OUT1_4_PAD_N<0>]	

### These are for SE J2 to HPC-FMC on CAPTAN+
set_property PACKAGE_PIN ap25 [get_ports STRIP_MCLKA0_PAD_P]			
set_property PACKAGE_PIN ap26 [get_ports STRIP_MCLKA0_PAD_N]			
set_property PACKAGE_PIN aj29 [get_ports STRIP_MCLKB0_PAD_P]			
set_property PACKAGE_PIN ak30 [get_ports STRIP_MCLKB0_PAD_N]			

set_property PACKAGE_PIN am27 [get_ports STRIP_BCOCLK_PAD_P[0]]		
set_property PACKAGE_PIN an27 [get_ports STRIP_BCOCLK_PAD_N[0]]		
set_property PACKAGE_PIN al34 [get_ports STRIP_RESET_PAD_P[0]]		
set_property PACKAGE_PIN am34 [get_ports STRIP_RESET_PAD_N[0]]		
set_property PACKAGE_PIN an34 [get_ports STRIP_SHIFT_PAD_P[0]]		
set_property PACKAGE_PIN ap34 [get_ports STRIP_SHIFT_PAD_N[0]]		
set_property PACKAGE_PIN aj33 [get_ports STRIP_SCIN_PAD_P[0]]			
set_property PACKAGE_PIN aj34 [get_ports STRIP_SCIN_PAD_N[0]]			
set_property PACKAGE_PIN aj31 [get_ports STRIP_SCOUT_PAD_P[0]]		
set_property PACKAGE_PIN ak32 [get_ports STRIP_SCOUT_PAD_N[0]]		
set_property PACKAGE_PIN ap25 [get_ports STRIP_GOTHITOR_PAD_P[0]]		
set_property PACKAGE_PIN ap26 [get_ports STRIP_GOTHITOR_PAD_N[0]]		
set_property PACKAGE_PIN ak33 [get_ports STRIP_OUT1_0_PAD_P[0]]		
set_property PACKAGE_PIN al33 [get_ports STRIP_OUT1_0_PAD_N[0]]		
set_property PACKAGE_PIN al32 [get_ports STRIP_OUT1_1_PAD_P[0]]		
set_property PACKAGE_PIN am32 [get_ports STRIP_OUT1_1_PAD_N[0]]		
set_property PACKAGE_PIN an33 [get_ports STRIP_OUT1_2_PAD_P[0]]		
set_property PACKAGE_PIN ap33 [get_ports STRIP_OUT1_2_PAD_N[0]]		
set_property PACKAGE_PIN ap29 [get_ports STRIP_OUT1_3_PAD_P[0]]		
set_property PACKAGE_PIN ap30 [get_ports STRIP_OUT1_3_PAD_N[0]]		
set_property PACKAGE_PIN am31 [get_ports STRIP_OUT1_4_PAD_P[0]]		
set_property PACKAGE_PIN an32 [get_ports STRIP_OUT1_4_PAD_N[0]]	

							   

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
#pta 13    STRIP_MCLKA1_PAD_P]		     LA_00
#pta 14    STRIP_MCLKA1_PAD_N]		    
#pta 19    STRIP_MCLKB1_PAD_P]		     CLK0_M2C
#pta 20    STRIP_MCLKB1_PAD_N]		    
                                     
#pta 25    STRIP_BCOCLK_PAD_P<1>]	     LA_06
#pta 26    STRIP_BCOCLK_PAD_N<1>]	
#pta 43    STRIP_RESET_PAD_P<1>]	      LA_13
#pta 44    STRIP_RESET_PAD_N<1>]	
#pta 37    STRIP_SHIFT_PAD_P<1>]	      LA_11
#pta 38    STRIP_SHIFT_PAD_N<1>]	
#pta 35    STRIP_SCIN_PAD_P<1>]		       LA_10
#pta 36    STRIP_SCIN_PAD_N<1>]		    
#pta 47    STRIP_SCOUT_PAD_P<1>]	      LA_15
#pta 48    STRIP_SCOUT_PAD_N<1>]	
#pta 5     STRIP_GOTHITOR_PAD_P<1>]	      LA_01
#pta 6     STRIP_GOTHITOR_PAD_N<1>]	    
#pta 49    STRIP_OUT1_0_PAD_P<1>]	      LA_16
#pta 50    STRIP_OUT1_0_PAD_N<1>]	
#pta 45    STRIP_OUT1_1_PAD_P<1>]	      LA_14
#pta 46    STRIP_OUT1_1_PAD_N<1>]	 
#pta 39    STRIP_OUT1_2_PAD_P<1>]	      LA_12
#pta 40    STRIP_OUT1_2_PAD_N<1>]	
#pta 33    STRIP_OUT1_3_PAD_P<1>]	       LA_09
#pta 34    STRIP_OUT1_3_PAD_N<1>]	
#pta 27    STRIP_OUT1_4_PAD_P<1>]	       LA_07
#pta 28    STRIP_OUT1_4_PAD_N<1>]	

### These are for SE J1 to HPC-FMC on CAPTAN+
set_property PACKAGE_PIN aj6 [get_ports STRIP_MCLKA1_PAD_P]			
set_property PACKAGE_PIN ak6 [get_ports STRIP_MCLKA1_PAD_N]			
set_property PACKAGE_PIN p28 [get_ports STRIP_MCLKB1_PAD_P]			
set_property PACKAGE_PIN p29 [get_ports STRIP_MCLKB1_PAD_N]			

set_property PACKAGE_PIN al9 [get_ports STRIP_BCOCLK_PAD_P[1]]		
set_property PACKAGE_PIN am9 [get_ports STRIP_BCOCLK_PAD_N[1]]		
set_property PACKAGE_PIN al30 [get_ports STRIP_RESET_PAD_P[1]]		
set_property PACKAGE_PIN am30 [get_ports STRIP_RESET_PAD_N[1]]		
set_property PACKAGE_PIN ae25 [get_ports STRIP_SHIFT_PAD_P[1]]		
set_property PACKAGE_PIN an7 [get_ports STRIP_SHIFT_PAD_N[1]]		
set_property PACKAGE_PIN an6 [get_ports STRIP_SCIN_PAD_P[1]]			
set_property PACKAGE_PIN aj11 [get_ports STRIP_SCIN_PAD_N[1]]			
set_property PACKAGE_PIN ak11 [get_ports STRIP_SCOUT_PAD_P[1]]		
set_property PACKAGE_PIN aj26 [get_ports STRIP_SCOUT_PAD_N[1]]		
set_property PACKAGE_PIN ak26 [get_ports STRIP_GOTHITOR_PAD_P[1]]		
set_property PACKAGE_PIN an8 [get_ports STRIP_GOTHITOR_PAD_N[1]]		
set_property PACKAGE_PIN ap8 [get_ports STRIP_OUT1_0_PAD_P[1]]		
set_property PACKAGE_PIN aj28 [get_ports STRIP_OUT1_0_PAD_N[1]]		
set_property PACKAGE_PIN ak28 [get_ports STRIP_OUT1_1_PAD_P[1]]		
set_property PACKAGE_PIN al25 [get_ports STRIP_OUT1_1_PAD_N[1]]		
set_property PACKAGE_PIN aj30 [get_ports STRIP_OUT1_2_PAD_P[1]]		
set_property PACKAGE_PIN ak31 [get_ports STRIP_OUT1_2_PAD_N[1]]		
set_property PACKAGE_PIN aj10 [get_ports STRIP_OUT1_3_PAD_P[1]]		
set_property PACKAGE_PIN ak10 [get_ports STRIP_OUT1_3_PAD_N[1]]		
set_property PACKAGE_PIN an9 [get_ports STRIP_OUT1_4_PAD_P[1]]		
set_property PACKAGE_PIN ap9 [get_ports STRIP_OUT1_4_PAD_N[1]]	
							   

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

