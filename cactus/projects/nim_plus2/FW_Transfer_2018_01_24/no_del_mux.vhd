-------------------------------------------------------------------------------
--
-- Title       : no_del_mux
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\no_del_mux.vhd
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
--{entity {no_del_mux} architecture {no_del_mux}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity no_del_mux is
	 port(
	 	sigin : in STD_LOGIC_VECTOR(1 downto 0); 
		 rst_p : in STD_LOGIC;
		 s_addr : in STD_LOGIC_VECTOR(1 downto 0);
		 tsig_out: out std_logic
	     );
end no_del_mux;

--}} End of automatically maintained section

architecture no_del_mux of no_del_mux is
begin

	-- enter your statements here --	
		p1:	process(sigin, s_addr, rst_p)
		begin
			if rst_p = '1' then
				tsig_out <= '0';
			elsif rst_p = '0' then
				
				case s_addr(1 downto 0) is
						when "00" =>
								tsig_out <= '0';	   		  -- no function
						when "01" =>
								tsig_out <= sigin(0);		-- delayed channel signal
						when "10" =>
								tsig_out <= sigin(1);		-- raw channel signal
						when "11" =>
								tsig_out <= sigin(0) or sigin(1);	    -- or of delayed and raw signals
						when others =>
								tsig_out <= '0';
				end case;
			else
				tsig_out <= '0';
				
			end if;		 
		end	process p1;


end no_del_mux;
