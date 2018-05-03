----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:02 12/09/2009 
-- Design Name: 
-- Module Name:    stack_adc_samples - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stack_adc_samples is
    Port ( samples : in  STD_LOGIC_VECTOR (47 downto 0);
           samples_we : in  STD_LOGIC_VECTOR (3 downto 0);
           mclk : in  STD_LOGIC;
           adc_burst_data : out  STD_LOGIC_VECTOR (63 downto 0);
           adc_burst_we : out  STD_LOGIC;
           plaq_sel : in  STD_LOGIC_VECTOR (1 downto 0));
end stack_adc_samples;

architecture Behavioral of stack_adc_samples is

	signal count : integer range 0 to 7 := 0;
	
	signal id : STD_LOGIC_VECTOR (3 downto 0) := x"0"; 
	signal burst_data_sig : STD_LOGIC_VECTOR (59 downto 0); 
begin


	adc_burst_data(3 downto 0) <= id;
	adc_burst_data(63 downto 4) <= burst_data_sig;
	
	process(mclk)
	begin
	
		if rising_edge(mclk) then
		
			adc_burst_we <= '0';
			
			if samples_we(conv_integer(plaq_sel)) = '1' then -- correct we received
			
				burst_data_sig(59 downto 48) <= samples(12*(conv_integer(plaq_sel)) + 11 downto 12*(conv_integer(plaq_sel)));								
				burst_data_sig(47 downto 0) <= burst_data_sig(59 downto 12);  --shift samples down
				
				count <= count + 1;
				if count >= 4 then --reset
					count <= 0;
					adc_burst_we <= '1';
					id <= id + 1;
				end if;
			end if;
		
		end if;	
	
	end process;


end Behavioral;

