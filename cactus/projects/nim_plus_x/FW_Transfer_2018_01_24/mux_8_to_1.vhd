-------------------------------------------------------------------------------
--
-- Title       : mux_8_to_1
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_04_30_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\mux_8_to_1.vhd
-- Generated   : Mon May  1 08:24:47 2017
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
--{entity {mux_8_to_1} architecture {mux_8_to_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_8_to_1 is
	 port(
	 	rst_p : in std_logic;
	 	sel_in : in STD_LOGIC_VECTOR(2 downto 0);
		 sig_in : in STD_LOGIC_VECTOR(7 downto 0);
		 out_1 : out STD_LOGIC
	     );
end mux_8_to_1;

--}} End of automatically maintained section

architecture mux_8_to_1 of mux_8_to_1 is
begin  
			p1:	process(rst_p, sig_in, sel_in)
		begin
			if rst_p = '1' then
				out_1 <= 'Z';
			elsif rst_p = '0' then
				
				case sel_in(2 downto 0) is
						when "000" =>
								out_1 <= sig_in(0);	   
						when "001" =>
								out_1 <= sig_in(1);	
						when "010" =>
								out_1 <= sig_in(2);
						when "011" =>
								out_1 <= sig_in(3);
						when "100" =>
								out_1 <= sig_in(4);
						when "101" =>
								out_1 <= sig_in(5);	   
						when "110" =>
								out_1 <= sig_in(6);
						when "111" =>
								out_1 <= sig_in(7);									
												
						when others =>
								out_1 <= 'Z';
				end case;
			else
				out_1 <= 'Z';
				
			end if;		 
		end	process p1;

	 -- enter your statements here --

end mux_8_to_1;
