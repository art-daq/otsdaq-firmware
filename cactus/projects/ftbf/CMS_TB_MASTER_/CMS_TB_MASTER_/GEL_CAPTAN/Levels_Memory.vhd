-------------------------------------------------------------------------------
--
-- Title       : Levels_Memory
-- Design      : PsiDecoder
-- Author      : Desktop Support
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\PsiDecoder\PsiDecoder\src\Levels_Memory.vhd
-- Generated   : Tue Feb 17 11:13:09 2009
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
--{entity {Levels_Memory} architecture {Levels_Memory}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity Levels_Memory is
	 port(
		 chip_id_rd : in STD_LOGIC_VECTOR(chip_id_bits_P-1 downto 0);
		 ULTRABLACK : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 CHIP_ID_WR : in STD_LOGIC_VECTOR(chip_id_bits_P-1 downto 0);
		 WR_EN_MEM : in STD_LOGIC;
		 MASTER_CLOCK : in STD_LOGIC;
		 RESET : in STD_LOGIC;
		 LEVEL0 : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 LEVEL1 : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 LEVEL2 : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 LEVEL3 : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 LEVEL4 : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);			  
		 ublack_mem : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level0_mem : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level1_mem : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level2_mem : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level3_mem : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
		 level4_mem : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0)
	     );
end Levels_Memory;

--}} End of automatically maintained section


-- NOTE: always readout levels ahead of current chip. The current chip levels are latched by the comparator
architecture Levels_Memory of Levels_Memory is
begin			  		  
	process (MASTER_CLOCK)
	begin
		if rising_edge(MASTER_CLOCK) then	
			if RESET='1' then 	   
				level0_mem<= (others=>'0');
				level1_mem<= (others=>'0');
				level2_mem<= (others=>'0');
				level3_mem<= (others=>'0');
				level4_mem<= (others=>'0');
				ublack_mem <= "0010000010"; -- 130 is default black level (others=>'0');	   
			elsif WR_EN_MEM = '1'then
				level0_mem<= LEVEL0;
				level1_mem<= LEVEL1;
				level2_mem<= LEVEL2;
				level3_mem<= LEVEL3;
				level4_mem<= LEVEL4;
				ublack_mem <= ULTRABLACK;	   
			end if;
		end if;	
		
	end process;

	 -- enter your statements here --

end Levels_Memory;
