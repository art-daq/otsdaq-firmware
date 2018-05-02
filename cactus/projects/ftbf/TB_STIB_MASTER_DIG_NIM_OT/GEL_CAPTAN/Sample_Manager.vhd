-------------------------------------------------------------------------------
--
-- Title       : Sample_Manager
-- Design      : PsiDecoder
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : Sample_Manager.vhd
-- Generated   : 3/10/11
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
				   	
use PsiDecoderParameters.all;

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Sample_Manager} architecture {Sample_Manager}}

library IEEE;								  
use IEEE.STD_LOGIC_1164.all;   
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity Sample_Manager is
	 port(
		 ADC_DATA_IN : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 ADC_WR_EN : in STD_LOGIC;				
		 ublack_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 EN_MAN_SAMPLE_SEL : in STD_LOGIC;		
		 at_chip_zero : in STD_LOGIC;	-- use to reset ultrablack search
		 MAN_SAMPLE_SEL : in STD_LOGIC;	   --In automatic mode, expecting 4 samples
		 MASTER_CLOCK : in STD_LOGIC;			  
		 managed_data : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 wr_en : out STD_LOGIC
	     );
end Sample_Manager;

--}} End of automatically maintained section

architecture Sample_Manager of Sample_Manager is
	signal data_label : std_logic_vector(1 downto 0) := "00";  			  		 											   	  
	signal sample_cnt : integer	range 0 to 15 := 12;			-- must have at least black and last dac before next chip 0 ultra black.. at CCR%2==1 this should be 12 samples						   
	signal check_other_label : std_logic := '0';												   
	signal save_val : STD_LOGIC_VECTOR(adc_bits_P downto 0);		  
begin
	process( MASTER_CLOCK )
	begin
		if rising_edge(MASTER_CLOCK) then	 
			
			wr_en <= '0';					
			
			-- if MAN SAMPLE.. choose one of two as before
			-- else (auto).. auto pick best: use UB level of first chip to determine sample 0.
				-- then output average of sample 0 and 1.
	
			if ADC_WR_EN = '1' then				  
				
				data_label <= data_label + 1;
				
				if EN_MAN_SAMPLE_SEL = '1' then	  
					
					if data_label(0) = MAN_SAMPLE_SEL then
					
						managed_data <= ADC_DATA_IN;
						wr_en <= '1';	
						
					end if;					
					
				else
					
					if data_label = "00" then 	 
						save_val <= '0' & ADC_DATA_IN;
					elsif data_label = "01" then 
						save_val <= save_val + ('0' & ADC_DATA_IN);	 
					elsif data_label = "10" then 
						managed_data <= save_val(adc_bits_P downto 1); 	-- sum divided by 2			
						wr_en <= '1';			
					end if;
						
					-- find correct sample to select
					
					if sample_cnt < 12 then
						sample_cnt <= sample_cnt + 1;
					elsif ADC_DATA_IN < ublack_mem and at_chip_zero = '1' and sample_cnt = 12 then 	
						
							-- found first potential UB
						data_label <= "00";			--label next sample as 0							
						sample_cnt <= 0;	 -- reset count  
						
					end if;			
						
				end if;	
					
				
			end if;						
		end if;
	end process;
	
end Sample_Manager;

