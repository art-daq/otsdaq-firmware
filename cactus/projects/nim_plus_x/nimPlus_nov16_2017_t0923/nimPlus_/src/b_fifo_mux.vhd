-------------------------------------------------------------------------------
--
-- Title       : b_fifo_mux
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\b_fifo_mux.vhd
-- Generated   : Wed Apr 26 14:31:14 2017
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained		!
--   and may be overwritten
--{entity {b_fifo_mux} architecture {b_fifo_mux}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity b_fifo_mux is  
	port(
	wd_in0 : in STD_LOGIC_VECTOR(31 downto 0); 
	wd_in1 : in STD_LOGIC_VECTOR(31 downto 0);	 
	wd_in2 : in STD_LOGIC_VECTOR(31 downto 0); 
	wd_in3 : in STD_LOGIC_VECTOR(31 downto 0);
	s_addr : in STD_LOGIC;
	rst_p  : in STD_LOGIC;
	
	b_fifo_out: out std_logic_vector(63 downto 0)
	     );
end b_fifo_mux;

--}} End of automatically maintained section

architecture b_fifo_mux of b_fifo_mux is	

constant z_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";

begin

	-- enter your statements here --
			p1:	process(wd_in0, wd_in1, wd_in2, wd_in3,s_addr, rst_p)
		begin
			if rst_p = '1' then
				b_fifo_out(63 downto 0) <= z_16 & z_16 & z_16 & z_16;
			elsif rst_p = '0' then
				
				case s_addr is
						when '0' =>
							b_fifo_out(63 downto 32) <= z_16 & z_16;
							b_fifo_out(31 downto 0) <= wd_in0(31 downto 0);		 
						
						when '1' =>
							b_fifo_out(63 downto 32) <= wd_in3(31 downto 0);
							b_fifo_out(31 downto 0) <= wd_in2(31 downto 0);	
														
						when others =>
								b_fifo_out(63 downto 0) <= z_16 & z_16 & z_16 & z_16;
				end case;
			end if;		 
		end	process p1;

end b_fifo_mux;
