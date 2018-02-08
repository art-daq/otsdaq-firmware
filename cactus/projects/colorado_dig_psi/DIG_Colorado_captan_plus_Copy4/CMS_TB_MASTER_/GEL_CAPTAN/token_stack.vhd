----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:26 11/04/2009 
-- Design Name: 
-- Module Name:    token_stack - Behavioral 
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

entity token_stack is
    Port ( psi_clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inc_token : in  STD_LOGIC;  
           dec_token : in  STD_LOGIC;	
		   error : out STD_LOGIC;
           zero_tokens : out  STD_LOGIC);
end token_stack;

architecture Behavioral of token_stack is

signal count : integer range 0 to 15;	 
signal err_sig : std_logic;
	
begin
	
	error <= err_sig;
	
	process(psi_clk)
	begin
	
		if rising_edge(psi_clk) then
					
			if reset = '1' then
				
				count <= 0;		   
				err_sig <= '0';	   
				zero_tokens <= '1';
				
			else
				
				if inc_token = '1' and dec_token = '1' then -- read and write	
					
					if count = 0 then  -- illegal dec request  						
						count <= 1;			
						err_sig <= '1';						
					else
						count <= count;
					end if;				 
					
				elsif inc_token = '1' then --write only
					
					if count /= 15 then
						count <= count + 1;		  
					else  
						err_sig <= '1';
					end if;		   		
					zero_tokens <= '0';							
					
				elsif dec_token = '1' then --read only
					
					if count /= 0 then
						count <= count - 1;
					else
						err_sig <= '1';
					end if;
					
					if count = 1 then -- now zero tokens
						zero_tokens <= '1';	
					end if;
										
				end if;	
			
			end if;
		
		end if;
	
	end process;


end Behavioral;

