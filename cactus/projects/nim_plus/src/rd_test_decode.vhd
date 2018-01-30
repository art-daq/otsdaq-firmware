-------------------------------------------------------------------------------
--
-- Title       : rd_test_decode
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\rd_test_decode.vhd
-- Generated   : Thu Apr 28 12:51:32 2016
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
--{entity {rd_test_decode} architecture {rd_test_decode}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rd_test_decode is
	port(	  

		 
		data_in_0 : in STD_LOGIC_VECTOR(31 downto 0);
		data_in_1 : in STD_LOGIC_VECTOR(31 downto 0);
		data_in_2 : in STD_LOGIC_VECTOR(31 downto 0);
		data_in_3 : in STD_LOGIC_VECTOR(31 downto 0);
		data_in_4 : in STD_LOGIC_VECTOR(31 downto 0);
		data_in_5 : in STD_LOGIC_VECTOR(31 downto 0);
		data_in_6 : in STD_LOGIC_VECTOR(31 downto 0);
		data_in_7 : in STD_LOGIC_VECTOR(31 downto 0);
		 
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end rd_test_decode;

--}} End of automatically maintained section

architecture rd_test_decode of rd_test_decode is
-- constant h_16: STD_LOGIC_VECTOR (15 downto 0) := "ZZZZZZZZZZZZZZZZ";   
constant z_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";

begin
	
	p1:	process(addr, data_in_0, data_in_1, data_in_2, data_in_3, data_in_4, data_in_5, data_in_6, data_in_7)
	begin
			
			if	addr(31 downto 16) = z_16 and
				addr(15 downto 11) = "00000" then
				
				case addr(10 downto 0) is
						when "00000000000" =>	
							read_data_out <= data_in_0;		 
						
						when "00000000001" =>	
							read_data_out <= data_in_1;
							
						when "00000000010" =>
							read_data_out <= data_in_2;
							
						when "00000000011" =>
							read_data_out <= data_in_3;
							
						when "00000000100" =>
							read_data_out <= data_in_4; 
							
						when "00000000101" =>
							read_data_out <= data_in_5;
						
						when "00000000110" =>
							read_data_out <= data_in_6;
							
						when "00000000111" =>
							read_data_out <= data_in_7;	 
							
						when others =>
								read_data_out <= z_16 & z_16;	 -- High impedance on output
					end case; 
			else 	   
				read_data_out <= z_16 & z_16;
			end if;		 
		end	process p1;
	 -- enter your statements here --

end rd_test_decode;
