-------------------------------------------------------------------------------
--
-- Title       : Comparator
-- Design      : PsiDecoder
-- Author      : Desktop Support
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\PsiDecoder\PsiDecoder\src\Comparator.vhd
-- Generated   : Mon Feb 16 14:54:42 2009
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
--{entity {Comparator} architecture {Comparator}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity Comparator is
	 port(
		 managed_data : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 ublack_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level0_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level1_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level2_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level3_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level4_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 MASTER_CLOCK : in STD_LOGIC; 
		 wr_en : in STD_LOGIC;		   
		 clk_en : out STD_LOGIC;							  
		 at_chip_zero : in STD_LOGIC;		 
		 translated_levels : out STD_LOGIC_VECTOR(2 downto 0);
		 raw_data : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0); 
		 next_chip : out STD_LOGIC
	     );
end Comparator;

--}} End of automatically maintained section

architecture Comparator of Comparator is

	signal ublack_mem_sig : STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
	signal level0_mem_sig : STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
	signal level1_mem_sig : STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
	signal level2_mem_sig : STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
	signal level3_mem_sig : STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
	signal level4_mem_sig : STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
	signal clk_en_sig : std_logic;	
	signal next_chip_sig : std_logic;	   
	signal FOR_DEBUG : std_logic;
begin			  					  			   
	
	clk_en <= clk_en_sig;  
	next_chip <= next_chip_sig;
	
	process(MASTER_CLOCK)
	begin
		if rising_edge(MASTER_CLOCK) then	  					  
			
			FOR_DEBUG <= '0';
			
			
			clk_en_sig <= wr_en; --delay by one clock for state machine	   
			
			raw_data <= managed_data;
			if managed_data <= ublack_mem_sig then
				translated_levels <= "000";
			elsif managed_data <= level0_mem_sig then
				translated_levels <= "001";
			elsif managed_data <= level1_mem_sig then
				translated_levels <= "010";
			elsif managed_data <= level2_mem_sig then
				translated_levels <= "011";
			elsif managed_data <= level3_mem_sig then
				translated_levels <= "100";
			elsif managed_data <= level4_mem_sig then 
				translated_levels <= "101";
			else
				translated_levels <= "110";
			end if;				  
			
			next_chip_sig <= '0';
			if managed_data <= ublack_mem then --from next chip levels	 
				translated_levels <= "000";
				next_chip_sig <= '1';		
			end if;		 
			
			if (clk_en_sig = '1' and next_chip_sig = '1') or at_chip_zero = '1' then -- latch memory levels (at_chip_zero case is used as the initial startup case)
				ublack_mem_sig <= ublack_mem; 
				level0_mem_sig <= level0_mem;
				level1_mem_sig <= level1_mem;
				level2_mem_sig <= level2_mem;
				level3_mem_sig <= level3_mem;
				level4_mem_sig <= level4_mem;		
				
				FOR_DEBUG <= '1';
			end if;
					 	   				
		end if;		
	end process;
end Comparator;
