package PsiDecoderParameters is

	constant chip_id_bits_P :integer:= 5;
	constant adc_bits_P :integer:= 10;
	constant pulse_height_bits_P :integer:= 10;
	type POW1_LUT is array ( integer range 0 to 5) of integer range 31 downto 0;
	constant power1_lut: POW1_LUT := (0,6,12,18,24,30);
	type POW2_LUT is array ( integer range 0 to 5) of integer range 255 downto 0;
	constant power2_lut: POW2_LUT := (0,36,72,108,144,180);
	constant ADC_CAL_SAMPLE_WAIT :integer:= 200;	   
	constant ADC_CAL_GOOD_WIDTH :integer:= 7;	
	constant ADC_CAL_RETREAT :integer:= 0;
	
end PsiDecoderParameters;