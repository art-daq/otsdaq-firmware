-------------------------------------------------------------------------------
--
-- Title       : Fub1
-- Design      : PsiDecoder
-- Author      : Desktop Support
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : c:\Documents and Settings\rrivera\Desktop\CAPTAN FIRMWARE\PsiDecoder\PsiDecoder\src\data_out_mux.vhd
-- Generated   : Wed Mar 11 14:40:01 2009
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
--{entity {Fub1} architecture {data_out_mux}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity data_out_mux is
	port(														
		MASTER_CLK : in std_logic;		  
		reset : in std_logic;
		DEBUG_SAMPLE : in STD_LOGIC_VECTOR(1 downto 0);
		debug_sm_data : in STD_LOGIC_VECTOR(8 downto 0);
		wr_en : in STD_LOGIC;
		managed_data : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		hit_data_we : in STD_LOGIC;
		hit_data : in STD_LOGIC_VECTOR(pulse_height_bits_P+chip_id_bits_P+13-1 downto 0);	 		 
		DATA_OUT : out STD_LOGIC_VECTOR(pulse_height_bits_P+chip_id_bits_P+13 downto 0);
		DATA_OUT_WR : out STD_LOGIC
	     );
end data_out_mux;

--}} End of automatically maintained section

architecture data_out_mux_arch of data_out_mux is					   

	constant top_managed_data : std_logic_vector(pulse_height_bits_P+chip_id_bits_P+13-adc_bits_p-1 downto 0) := (others => '0');	 
	constant top_debug_sm : std_logic_vector(pulse_height_bits_P+chip_id_bits_P+13-10 downto 0) := (others => '0');		   
	constant number_to_output : integer	 range 255 downto 0 := 182;
	signal debug_wr : std_logic; 
	signal counter : integer range 255 downto 0 := 0;
begin
	
	   -- DEBUG_SAMPLE:
	-- "00" is normal data mode
	-- "01" is debug sample data
	-- "1X" is debug state machine
	
	DATA_OUT_WR <= hit_data_we when DEBUG_SAMPLE = "00" else 
		debug_wr; 
		
	DATA_OUT <= '0' & hit_data when DEBUG_SAMPLE = "00" else 
		'1' & top_managed_data & managed_data when DEBUG_SAMPLE = "01" else
		'1' & top_debug_sm & debug_sm_data;
			   
	-- only about <number_to_output> samples after ultrablack
	process(MASTER_CLK)
	begin		 
		if rising_edge(MASTER_CLK) then	  
			debug_wr <= '0'; 
			
			if reset = '1' then
				counter <= 0;
			elsif wr_en = '1' then
				if counter = 0 and managed_data < "0110010000" then -- after lower than 400, output next <number_to_output> wr_en's
					counter <= counter + 1;
					debug_wr <= '1';
				elsif counter /= 0 then
					
					if counter = number_to_output then
						counter <= 0;
					else
						counter <= counter + 1;
						debug_wr <= '1';
					end if;	 
					
				end if;
			end if;
		end if;
	end process;

end data_out_mux_arch;
