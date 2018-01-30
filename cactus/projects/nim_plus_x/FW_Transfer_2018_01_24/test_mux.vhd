-------------------------------------------------------------------------------
--
-- Title       : test_mux
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\test_mux.vhd
-- Generated   : Wed Feb 22 14:12:24 2017
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {test_mux} architecture {test_mux}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity test_mux is
	 port(
	 	sigtestin : in STD_LOGIC_VECTOR(31 downto 0); 
		 rst_p : in STD_LOGIC;
		 s_addr : in STD_LOGIC_VECTOR(7 downto 0);
		 tsig_out: out std_logic
	     );
end test_mux;

--}} End of automatically maintained section

architecture test_mux of test_mux is
begin

	-- enter your statements here --	
		p1:	process(sigtestin, s_addr, rst_p)
		begin
			if rst_p = '1' then
				tsig_out <= '0';
			elsif rst_p = '0' then
				
				case s_addr(7 downto 0) is
						when "00000000" =>
								tsig_out <= sigtestin(0);	   -- operational output; normal mode
						when "00000001" =>
								tsig_out <= sigtestin(1);		-- raw inputs x(0)
						when "00000010" =>
								tsig_out <= sigtestin(2);
						when "00000011" =>
								tsig_out <= sigtestin(3);
						when "00000100" =>
								tsig_out <= sigtestin(4);
						when "00000101" =>
								tsig_out <= sigtestin(5);	   -- delayed inputs  smodin(0)
						when "00000110" =>
								tsig_out <= sigtestin(6);
						when "00000111" =>
								tsig_out <= sigtestin(7);	
						when "00001000" =>
								tsig_out <= sigtestin(8);
						when "00001001" =>
								tsig_out <= sigtestin(9);		 -- logic select output before output delay
						when "00001010" =>
								tsig_out <= sigtestin(10);
						when "00001011" =>
								tsig_out <= sigtestin(11);
						when "00001100" =>
								tsig_out <= sigtestin(12);								
						when "00001101" =>
								tsig_out <= sigtestin(13);								
						when "00001110" =>
								tsig_out <= sigtestin(14);								
						when "00001111" =>
								tsig_out <= sigtestin(15);								
						when "00010000" =>
								tsig_out <= sigtestin(16);								
						when "00010001" =>
								tsig_out <= sigtestin(17);								
						when "00010010" =>
								tsig_out <= sigtestin(17);								
						when "00010011" =>
								tsig_out <= sigtestin(19);								
						when "00010100" =>
								tsig_out <= sigtestin(20);	
						when "00010101" =>
								tsig_out <= sigtestin(21);								
						when "00010110" =>
								tsig_out <= sigtestin(22);								
						when "00010111" =>
								tsig_out <= sigtestin(23);								
						when "00011000" =>
								tsig_out <= sigtestin(24);																
						when "00011001" =>
								tsig_out <= sigtestin(25);								
						when "00011010" =>
								tsig_out <= sigtestin(26);								
						when "00011011" =>
								tsig_out <= sigtestin(27);								
						when "00011100" =>
								tsig_out <= sigtestin(28);										
						when "00011101" =>
								tsig_out <= sigtestin(29);								
						when "00011110" =>
								tsig_out <= sigtestin(30);								
						when "00011111" =>
								tsig_out <= sigtestin(31);								
										
								
						when others =>
								tsig_out <= '0';
				end case;
			else
				tsig_out <= '0';
				
			end if;		 
		end	process p1;


end test_mux;
