-------------------------------------------------------------------------------
--
-- Title       : start_sig_mux
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\start_sig_mux.vhd
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
--{entity {start_sig_mux} architecture {start_sig_mux}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity start_sig_mux is
	 port(
	 	sigin : in STD_LOGIC_VECTOR(4 downto 0); 
		 rst_p : in STD_LOGIC;
		 s_addr : in STD_LOGIC_VECTOR(2 downto 0);
		 tsig_out: out std_logic
	     );
end start_sig_mux;

--}} End of automatically maintained section

architecture start_sig_mux of start_sig_mux is
begin

	-- enter your statements here --	
		p1:	process(sigin, s_addr, rst_p)
		begin
			if rst_p = '1' then
				tsig_out <= '0';
			elsif rst_p = '0' then
				
				case s_addr(2 downto 0) is
						when "000" =>
								tsig_out <= sigin(0);	   -- ch 0 is start signal	(e.g., x(0))
						when "001" =>
								tsig_out <= sigin(1);		-- ch 1 is start signal
						when "010" =>
								tsig_out <= sigin(2);		-- ch 2 is start signal
						when "011" =>
								tsig_out <= sigin(3);	   -- ch 3 is start signal
						when "100" =>
								tsig_out <= sigin(4);	  -- ch 4 is start signal (use with signal generator for test mode
						when others =>
								tsig_out <= '0';
				end case;
			else
				tsig_out <= '0';
				
			end if;		 
		end	process p1;


end start_sig_mux;
