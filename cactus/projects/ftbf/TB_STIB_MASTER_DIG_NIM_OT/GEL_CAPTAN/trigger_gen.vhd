									   														  ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:36 08/08/2008 
-- Design Name: 
-- Module Name:    trigger_gen - Behavioral 
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

entity trigger_gen is
    Port ( clock_40 : in  STD_LOGIC;
           token_in : in  STD_LOGIC;
           psi_trigger : out  STD_LOGIC;
			  delay_in1 : in  STD_LOGIC_VECTOR(7 downto 0); -- clock edges between Inject (1-width) pulse and token_in
			  delay_in2 : in  STD_LOGIC_VECTOR(7 downto 0); -- clock edges between Trigger (2-width) pulse and token_in
			  we : in std_logic;
			  we_clk : in std_logic;
           reset_n : in  STD_LOGIC);
end trigger_gen;

architecture Behavioral of trigger_gen is

signal psi_trigger1_sig : std_logic;
signal psi_trigger2_sig1 : std_logic;
signal psi_trigger2_sig2 : std_logic;
signal old_token_in : std_logic;
signal delay_reg1 : STD_LOGIC_VECTOR(7 downto 0);
signal delay_count1 : STD_LOGIC_VECTOR(7 downto 0);
signal delay_reg2 : STD_LOGIC_VECTOR(7 downto 0);
signal delay_count2 : STD_LOGIC_VECTOR(7 downto 0);	 
signal start_count1 : std_logic; 
signal start_count2 : std_logic;
begin

	psi_trigger <= psi_trigger2_sig1 or psi_trigger2_sig2 or psi_trigger1_sig;
	
	main:process(reset_n,clock_40)
	begin
		if reset_n = '0' then 
			psi_trigger1_sig <= '0';
			psi_trigger2_sig1 <= '0';
			psi_trigger2_sig2 <= '0';
			delay_count1 <= (others => '0');			
			delay_count2 <= (others => '0'); 
			start_count1 <= '0';	 
			start_count2 <= '0';
		elsif falling_edge(clock_40) then
			psi_trigger2_sig2 <= psi_trigger2_sig1;
			old_token_in <= token_in;
			
				-- for the 2 clock width portion of psi_trigger signal		 
		
			
			if psi_trigger2_sig1 = '0' and delay_reg2 /= x"00" then
				if token_in = '1' and old_token_in = '0' then
					delay_count2 <= (1=>'1', others => '0');		
					start_count2 <= '1';
				elsif start_count2 = '1' then
					if delay_count2 < delay_reg2 then
						delay_count2 <= delay_count2 + 1;
					else
						psi_trigger2_sig1 <= '1';	
						start_count2 <= '0';  
					end if;
				end if;
			end if;		
			
			if psi_trigger2_sig1 = '1' then 
				psi_trigger2_sig1 <= '0';
			end if;
			
				-- for the 1 clock width portion of psi_trigger signal
			if psi_trigger1_sig = '0' and delay_reg1 /= x"00" then
				if token_in = '1' and old_token_in = '0' then
					delay_count1 <= (1=>'1', others => '0');	
					start_count1 <= '1';
				elsif start_count1 = '1' then
					if delay_count1 < delay_reg1 then
						delay_count1 <= delay_count1 + 1;
					else
						psi_trigger1_sig <= '1';
						start_count1 <= '0';  
					end if;
				end if;
			end if;		
			
			if psi_trigger1_sig = '1' then 
				psi_trigger1_sig <= '0';
			end if;
			
		end if;
	
	end process;
	
	program:process(we_clk,reset_n) --programming process
	begin
		if reset_n = '0' then
			delay_reg1 <= (others => '0');
			delay_reg2 <= (others => '0');
		elsif we = '1' and rising_edge(we_clk) then
			delay_reg1 <= delay_in1;
			delay_reg2 <= delay_in2;
		end if;
	end process;

end Behavioral;

