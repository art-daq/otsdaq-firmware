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
#pta 13    STRIP_MCLKA0_PAD_P]		 LA_17  
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
set_property PACKAGE_PIN ak27 [get_ports STRIP_MCLKA_PAD_P[0]]			
set_property PACKAGE_PIN al27 [get_ports STRIP_MCLKA_PAD_N[0]]			
set_property PACKAGE_PIN aj29 [get_ports STRIP_MCLKB_PAD_P[0]]			
set_property PACKAGE_PIN ak30 [get_ports STRIP_MCLKB_PAD_N[0]]			

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

							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_P[0]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_N[0]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_P[0]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_N[0]]			

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
set_property PACKAGE_PIN aj6 [get_ports STRIP_MCLKA_PAD_P[1]]			
set_property PACKAGE_PIN ak6 [get_ports STRIP_MCLKA_PAD_N[1]]			
set_property PACKAGE_PIN p28 [get_ports STRIP_MCLKB_PAD_P[1]]			
set_property PACKAGE_PIN p29 [get_ports STRIP_MCLKB_PAD_N[1]]			

set_property PACKAGE_PIN al9 [get_ports STRIP_BCOCLK_PAD_P[1]]		
set_property PACKAGE_PIN am9 [get_ports STRIP_BCOCLK_PAD_N[1]]		
set_property PACKAGE_PIN al30 [get_ports STRIP_RESET_PAD_P[1]]		
set_property PACKAGE_PIN am30 [get_ports STRIP_RESET_PAD_N[1]]		
set_property PACKAGE_PIN an7 [get_ports STRIP_SHIFT_PAD_P[1]]		
set_property PACKAGE_PIN an6 [get_ports STRIP_SHIFT_PAD_N[1]]		
set_property PACKAGE_PIN aj11 [get_ports STRIP_SCIN_PAD_P[1]]			
set_property PACKAGE_PIN ak11 [get_ports STRIP_SCIN_PAD_N[1]]			
set_property PACKAGE_PIN aj26 [get_ports STRIP_SCOUT_PAD_P[1]]		
set_property PACKAGE_PIN ak26 [get_ports STRIP_SCOUT_PAD_N[1]]		
set_property PACKAGE_PIN an8 [get_ports STRIP_GOTHITOR_PAD_P[1]]		
set_property PACKAGE_PIN ap8 [get_ports STRIP_GOTHITOR_PAD_N[1]]		
set_property PACKAGE_PIN aj28 [get_ports STRIP_OUT1_0_PAD_P[1]]		
set_property PACKAGE_PIN ak28 [get_ports STRIP_OUT1_0_PAD_N[1]]		
set_property PACKAGE_PIN al25 [get_ports STRIP_OUT1_1_PAD_P[1]]		
set_property PACKAGE_PIN am25 [get_ports STRIP_OUT1_1_PAD_N[1]]		
set_property PACKAGE_PIN aj30 [get_ports STRIP_OUT1_2_PAD_P[1]]		
set_property PACKAGE_PIN ak31 [get_ports STRIP_OUT1_2_PAD_N[1]]		
set_property PACKAGE_PIN aj10 [get_ports STRIP_OUT1_3_PAD_P[1]]		
set_property PACKAGE_PIN ak10 [get_ports STRIP_OUT1_3_PAD_N[1]]		
set_property PACKAGE_PIN an9 [get_ports STRIP_OUT1_4_PAD_P[1]]		
set_property PACKAGE_PIN ap9 [get_ports STRIP_OUT1_4_PAD_N[1]]	
							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_P[1]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_N[1]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_P[1]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_N[1]]			

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


# PTA Connector J2 on FMC-to-PTA board
#pta 13    STRIP_MCLKA0_PAD_P]		 LA_17  
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

### These are for NE J2 to HPC-FMC on CAPTAN+
set_property PACKAGE_PIN k33 [get_ports STRIP_MCLKA_PAD_P[2]]			
set_property PACKAGE_PIN j34 [get_ports STRIP_MCLKA_PAD_N[2]]			
set_property PACKAGE_PIN u29 [get_ports STRIP_MCLKB_PAD_P[2]]			
set_property PACKAGE_PIN t29 [get_ports STRIP_MCLKB_PAD_N[2]]			

set_property PACKAGE_PIN l32 [get_ports STRIP_BCOCLK_PAD_P[2]]		
set_property PACKAGE_PIN k32 [get_ports STRIP_BCOCLK_PAD_N[2]]		
set_property PACKAGE_PIN l27 [get_ports STRIP_RESET_PAD_P[2]]		
set_property PACKAGE_PIN k27 [get_ports STRIP_RESET_PAD_N[2]]		
set_property PACKAGE_PIN k26 [get_ports STRIP_SHIFT_PAD_P[2]]		
set_property PACKAGE_PIN j26 [get_ports STRIP_SHIFT_PAD_N[2]]		
set_property PACKAGE_PIN g29 [get_ports STRIP_SCIN_PAD_P[2]]			
set_property PACKAGE_PIN g30 [get_ports STRIP_SCIN_PAD_N[2]]			
set_property PACKAGE_PIN p24 [get_ports STRIP_SCOUT_PAD_P[2]]		
set_property PACKAGE_PIN n24 [get_ports STRIP_SCOUT_PAD_N[2]]		
set_property PACKAGE_PIN h33 [get_ports STRIP_GOTHITOR_PAD_P[2]]		
set_property PACKAGE_PIN g34 [get_ports STRIP_GOTHITOR_PAD_N[2]]		
set_property PACKAGE_PIN n26 [get_ports STRIP_OUT1_0_PAD_P[2]]		
set_property PACKAGE_PIN m27 [get_ports STRIP_OUT1_0_PAD_N[2]]		
set_property PACKAGE_PIN k23 [get_ports STRIP_OUT1_1_PAD_P[2]]		
set_property PACKAGE_PIN j23 [get_ports STRIP_OUT1_1_PAD_N[2]]		
set_property PACKAGE_PIN g24 [get_ports STRIP_OUT1_2_PAD_P[2]]		
set_property PACKAGE_PIN g25 [get_ports STRIP_OUT1_2_PAD_N[2]]		
set_property PACKAGE_PIN r26 [get_ports STRIP_OUT1_3_PAD_P[2]]		
set_property PACKAGE_PIN p26 [get_ports STRIP_OUT1_3_PAD_N[2]]		
set_property PACKAGE_PIN h26 [get_ports STRIP_OUT1_4_PAD_P[2]]		
set_property PACKAGE_PIN g26 [get_ports STRIP_OUT1_4_PAD_N[2]]	

							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_P[2]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_N[2]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_P[2]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_N[2]]			

set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_P[2]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_N[2]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_N[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_P[2]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_N[2]]	




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

### These are for NE J1 to HPC-FMC on CAPTAN+
set_property PACKAGE_PIN u34 [get_ports STRIP_MCLKA_PAD_P[3]]			
set_property PACKAGE_PIN t34 [get_ports STRIP_MCLKA_PAD_N[3]]			
set_property PACKAGE_PIN l28 [get_ports STRIP_MCLKB_PAD_P[3]]			
set_property PACKAGE_PIN k28 [get_ports STRIP_MCLKB_PAD_N[3]]			

set_property PACKAGE_PIN n34 [get_ports STRIP_BCOCLK_PAD_P[3]]		
set_property PACKAGE_PIN m34 [get_ports STRIP_BCOCLK_PAD_N[3]]		
set_property PACKAGE_PIN m30 [get_ports STRIP_RESET_PAD_P[3]]		
set_property PACKAGE_PIN m31 [get_ports STRIP_RESET_PAD_N[3]]		
set_property PACKAGE_PIN r31 [get_ports STRIP_SHIFT_PAD_P[3]]		
set_property PACKAGE_PIN p31 [get_ports STRIP_SHIFT_PAD_N[3]]		
set_property PACKAGE_PIN u25 [get_ports STRIP_SCIN_PAD_P[3]]			
set_property PACKAGE_PIN t25 [get_ports STRIP_SCIN_PAD_N[3]]			
set_property PACKAGE_PIN l33 [get_ports STRIP_SCOUT_PAD_P[3]]		
set_property PACKAGE_PIN l34 [get_ports STRIP_SCOUT_PAD_N[3]]		
set_property PACKAGE_PIN n29 [get_ports STRIP_GOTHITOR_PAD_P[3]]		
set_property PACKAGE_PIN m29 [get_ports STRIP_GOTHITOR_PAD_N[3]]		
set_property PACKAGE_PIN j24 [get_ports STRIP_OUT1_0_PAD_P[3]]		
set_property PACKAGE_PIN h24 [get_ports STRIP_OUT1_0_PAD_N[3]]		
set_property PACKAGE_PIN l29 [get_ports STRIP_OUT1_1_PAD_P[3]]		
set_property PACKAGE_PIN l30 [get_ports STRIP_OUT1_1_PAD_N[3]]		
set_property PACKAGE_PIN r25 [get_ports STRIP_OUT1_2_PAD_P[3]]		
set_property PACKAGE_PIN p25 [get_ports STRIP_OUT1_2_PAD_N[3]]		
set_property PACKAGE_PIN h31 [get_ports STRIP_OUT1_3_PAD_P[3]]		
set_property PACKAGE_PIN g31 [get_ports STRIP_OUT1_3_PAD_N[3]]		
set_property PACKAGE_PIN u26 [get_ports STRIP_OUT1_4_PAD_P[3]]		
set_property PACKAGE_PIN u27 [get_ports STRIP_OUT1_4_PAD_N[3]]	
							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_P[3]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_N[3]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_P[3]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_N[3]]			

set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_P[3]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_N[3]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_N[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_P[3]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_N[3]]	


# PTA Connector J2 on FMC-to-PTA board
#pta 13    STRIP_MCLKA0_PAD_P]		 LA_17  
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

### These are for SW J2 to HPC-FMC on CAPTAN+
set_property PACKAGE_PIN w6 [get_ports STRIP_MCLKA_PAD_P[4]]			
set_property PACKAGE_PIN y6 [get_ports STRIP_MCLKA_PAD_N[4]]			
set_property PACKAGE_PIN r6 [get_ports STRIP_MCLKB_PAD_P[4]]			
set_property PACKAGE_PIN r5 [get_ports STRIP_MCLKB_PAD_N[4]]			

set_property PACKAGE_PIN u10 [get_ports STRIP_BCOCLK_PAD_P[4]]		
set_property PACKAGE_PIN t10 [get_ports STRIP_BCOCLK_PAD_N[4]]		
set_property PACKAGE_PIN an1 [get_ports STRIP_RESET_PAD_P[4]]		
set_property PACKAGE_PIN ap1 [get_ports STRIP_RESET_PAD_N[4]]		
set_property PACKAGE_PIN al2 [get_ports STRIP_SHIFT_PAD_P[4]]		
set_property PACKAGE_PIN am1 [get_ports STRIP_SHIFT_PAD_N[4]]		
set_property PACKAGE_PIN ab10 [get_ports STRIP_SCIN_PAD_P[4]]			
set_property PACKAGE_PIN ab9 [get_ports STRIP_SCIN_PAD_N[4]]			
set_property PACKAGE_PIN an4 [get_ports STRIP_SCOUT_PAD_P[4]]		
set_property PACKAGE_PIN ap4 [get_ports STRIP_SCOUT_PAD_N[4]]		
set_property PACKAGE_PIN v9 [get_ports STRIP_GOTHITOR_PAD_P[4]]		
set_property PACKAGE_PIN v8 [get_ports STRIP_GOTHITOR_PAD_N[4]]		
set_property PACKAGE_PIN an3 [get_ports STRIP_OUT1_0_PAD_P[4]]		
set_property PACKAGE_PIN ap3 [get_ports STRIP_OUT1_0_PAD_N[4]]		
set_property PACKAGE_PIN am2 [get_ports STRIP_OUT1_1_PAD_P[4]]		
set_property PACKAGE_PIN an2 [get_ports STRIP_OUT1_1_PAD_N[4]]		
set_property PACKAGE_PIN ak3 [get_ports STRIP_OUT1_2_PAD_P[4]]		
set_property PACKAGE_PIN al3 [get_ports STRIP_OUT1_2_PAD_N[4]]		
set_property PACKAGE_PIN aa10 [get_ports STRIP_OUT1_3_PAD_P[4]]		
set_property PACKAGE_PIN aa9 [get_ports STRIP_OUT1_3_PAD_N[4]]		
set_property PACKAGE_PIN ak2 [get_ports STRIP_OUT1_4_PAD_P[4]]		
set_property PACKAGE_PIN ak1 [get_ports STRIP_OUT1_4_PAD_N[4]]	

							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_P[4]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_N[4]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_P[4]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_N[4]]			

set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_P[4]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_N[4]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_N[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_P[4]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_N[4]]	




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

### These are for SW J1 to HPC-FMC on CAPTAN+
set_property PACKAGE_PIN w1 [get_ports STRIP_MCLKA_PAD_P[5]]			
set_property PACKAGE_PIN y1 [get_ports STRIP_MCLKA_PAD_N[5]]			
set_property PACKAGE_PIN v4 [get_ports STRIP_MCLKB_PAD_P[5]]			
set_property PACKAGE_PIN w4 [get_ports STRIP_MCLKB_PAD_N[5]]			

set_property PACKAGE_PIN t8 [get_ports STRIP_BCOCLK_PAD_P[5]]		
set_property PACKAGE_PIN t7 [get_ports STRIP_BCOCLK_PAD_N[5]]		
set_property PACKAGE_PIN ab7 [get_ports STRIP_RESET_PAD_P[5]]		
set_property PACKAGE_PIN ab6 [get_ports STRIP_RESET_PAD_N[5]]		
set_property PACKAGE_PIN ac7 [get_ports STRIP_SHIFT_PAD_P[5]]		
set_property PACKAGE_PIN ac6 [get_ports STRIP_SHIFT_PAD_N[5]]		
set_property PACKAGE_PIN aa5 [get_ports STRIP_SCIN_PAD_P[5]]			
set_property PACKAGE_PIN aa4 [get_ports STRIP_SCIN_PAD_N[5]]			
set_property PACKAGE_PIN w9 [get_ports STRIP_SCOUT_PAD_P[5]]		
set_property PACKAGE_PIN w8 [get_ports STRIP_SCOUT_PAD_N[5]]		
set_property PACKAGE_PIN v3 [get_ports STRIP_GOTHITOR_PAD_P[5]]		
set_property PACKAGE_PIN w3 [get_ports STRIP_GOTHITOR_PAD_N[5]]		
set_property PACKAGE_PIN ac9 [get_ports STRIP_OUT1_0_PAD_P[5]]		
set_property PACKAGE_PIN ac8 [get_ports STRIP_OUT1_0_PAD_N[5]]		
set_property PACKAGE_PIN v7 [get_ports STRIP_OUT1_1_PAD_P[5]]		
set_property PACKAGE_PIN v6 [get_ports STRIP_OUT1_1_PAD_N[5]]		
set_property PACKAGE_PIN v2 [get_ports STRIP_OUT1_2_PAD_P[5]]		
set_property PACKAGE_PIN v1 [get_ports STRIP_OUT1_2_PAD_N[5]]		
set_property PACKAGE_PIN u9 [get_ports STRIP_OUT1_3_PAD_P[5]]		
set_property PACKAGE_PIN t9 [get_ports STRIP_OUT1_3_PAD_N[5]]		
set_property PACKAGE_PIN ab5 [get_ports STRIP_OUT1_4_PAD_P[5]]		
set_property PACKAGE_PIN ab4 [get_ports STRIP_OUT1_4_PAD_N[5]]	
							   

set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_P[5]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKA_PAD_N[5]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_P[5]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_MCLKB_PAD_N[5]]			

set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_BCOCLK_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_RESET_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SHIFT_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_P[5]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCIN_PAD_N[5]]			
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_SCOUT_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_GOTHITOR_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_0_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_1_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_2_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_3_PAD_N[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_P[5]]		
set_property IOSTANDARD LVDS_25 [get_ports STRIP_OUT1_4_PAD_N[5]]	





####################################################################################
# end PTA connector definitions
####################################################################################

