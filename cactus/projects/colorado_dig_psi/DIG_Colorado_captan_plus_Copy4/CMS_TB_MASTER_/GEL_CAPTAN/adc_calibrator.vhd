														 										   -------------------------------------------------------------------------------
--
-- Title       : ADC_Calibrator
-- Design      : PsiDecoder
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--				
				

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
USE ieee.std_logic_arith.all;

use PsiDecoderParameters.all;

entity ADC_Calibrator is
	port(	
		 master_clk : in STD_LOGIC;
		 rst : in STD_LOGIC;		
		 calibrate : in STD_LOGIC;		  -- single width pulse to start
		 		 											
		 adc_sample_we :  in STD_LOGIC_VECTOR(3 downto 0);  
		 adc_sample : in STD_LOGIC_VECTOR(47 downto 0);	-- 0x0BD is goal 	 
		 
		 del_clk : out STD_LOGIC;   -- connect del's to CE line of IDELAY. Set INC/DEC of IDELAY to always increment mode.
		 del_frm : out STD_LOGIC;
		 del_dat : out STD_LOGIC_VECTOR(3 downto 0); 					 
		 rst_clk : out STD_LOGIC;
		 rst_frm : out STD_LOGIC;
		 rst_dat : out STD_LOGIC_VECTOR(3 downto 0);   
		 
		 inc_dec_ch_dat : out STD_LOGIC_VECTOR(3 downto 0);	
		 
		 done : out STD_LOGIC;
		 calibrating : out STD_LOGIC;	
		 error : out STD_LOGIC
	     );
end ADC_Calibrator;

--}} End of automatically maintained section

architecture Behavioral of ADC_Calibrator is

signal count : integer range 0 to 256; -- wait after each adjustment for adc_data to settle 	
signal good_width : integer range 0 to 15; -- wait after each adjustment for adc_data to settle 
															 
type Tap_vector is array(integer range 0 to 3) of integer range 0 to 63;

signal clk_tap : integer range 0 to 63; -- maintain tap count   
signal frm_tap : integer range 0 to 63; -- maintain tap count	 
signal dat_tap : Tap_vector;												   

signal ch_to_chk : integer range 0 to 3; -- channel to check		 

type Sreg_type is (
    INIT, CHECK_CH, ADJUST, WAIT_TO_SETTLE, NO_CAL, RETREAT_ALL, COMPLETE
);		 	 

signal Sreg: Sreg_type;		 

begin		
					 
	process( master_clk )
	begin							   
		
		if rising_edge(master_clk) then		    
			
			del_clk <= '0';
			del_frm <= '0';
			del_dat <= (others => '0');	
			rst_clk <= '0';
			rst_frm <= '0';				  
			rst_dat <= (others => '0');	
			inc_dec_ch_dat <= (others => '1');	 -- 1 is increment		 
				  		
			if calibrate = '1' then									--============================================================= RESET
				
				error <= '0';	  	
				done <= '0';	  	 		   
				calibrating <= '0';	   
				Sreg <= INIT;
				
			else  								 	   --============================================================= CALIBRATE
				
				case Sreg is
					when INIT => 		
						calibrating <= '1';
						clk_tap <= 0;   
						frm_tap <= 0;   
						dat_tap(0) <= 0;	
						dat_tap(1) <= 0;	
						dat_tap(2) <= 0;	
						dat_tap(3) <= 0;	 
						
						rst_clk <= '1';
						rst_frm <= '1';
						rst_dat <= (others => '1');		   
						
						good_width <= 0;							 	    					
						count <= 0;	 
						ch_to_chk <= 0;
						Sreg <= CHECK_CH;	  
						
					when CHECK_CH =>				
					
						if adc_sample_we(ch_to_chk) = '1' then
							
							Sreg <= ADJUST;
							if adc_sample(ch_to_chk*12+11 downto ch_to_chk*12) = x"0BD" then  --good sample		 
								
								good_width <= good_width + 1;	
								
								if good_width = ADC_CAL_GOOD_WIDTH-1 then -- ch is good	  
										--check next channel
									if ch_to_chk = 3 then
										count <= 0;
										Sreg <= RETREAT_ALL;		   
									else				
										ch_to_chk <= ch_to_chk + 1;		 	  
										good_width <= 0;	 
										Sreg <= CHECK_CH;
									end if;
								end if;		  								
							else					-- bad sample	  
								good_width <= 0;
							end if;				  
							
						end if;	 			  
						
					when ADJUST =>		
					
						count <= 0;		
						Sreg <= WAIT_TO_SETTLE;	
						if dat_tap(ch_to_chk) < 63 then 
							dat_tap(ch_to_chk) <= dat_tap(ch_to_chk) + 1;	
							del_dat(ch_to_chk) <= '1';
						else			   
							if ch_to_chk = 0 then -- try frame and clock delays	  
								if clk_tap < 63 then
									clk_tap <= clk_tap + 1;
									del_clk <= '1';
								else	
									if frm_tap < 63 then
										frm_tap <= frm_tap + 1;		  
										del_frm <= '1';	
									else		  
										Sreg <= NO_CAL;	   -- total failure
														 
										frm_tap <= 0;	
										rst_frm <= '1';				 	
									end if;	 	 
									
									clk_tap <= 0;   	
									rst_clk <= '1';	  
								end if;	  
							else			  	 
								ch_to_chk <= 0;	
								good_width <= 0;
								Sreg <= ADJUST; -- current position failed for this ch, find a new good position for ch0
							end if;	   	
							
							good_width <= 0; --reset good width with dat delay wrap around
							dat_tap(ch_to_chk) <= 0;	
							rst_dat(ch_to_chk) <= '1';    
						end if;		
						
					when WAIT_TO_SETTLE =>	  
					
						if adc_sample_we(ch_to_chk) = '1' then
							if count = ADC_CAL_SAMPLE_WAIT then
								count <= 0;
								Sreg <= CHECK_CH;
							else
								count <= count + 1;
							end if;	   							  
						end if;
						
					when RETREAT_ALL =>
					
						if count = ADC_CAL_RETREAT then	
							Sreg <= COMPLETE;	
						else
							count <= count + 1;
							inc_dec_ch_dat <= x"0";
							del_dat <= x"F";
							dat_tap(0) <= dat_tap(0) - 1;	 
						end if;
						
					when NO_CAL =>
					
						error <= '1';
						calibrating <= '0';		
						
					when COMPLETE =>
					
						done <= '1';
						calibrating <= '0';
						
					when others =>
						null;	 
				end case; 	
					
			end if;		
					
		end if;	  --end master clk if	
	end process;
	
end Behavioral;
