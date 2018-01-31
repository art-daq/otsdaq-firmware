-------------------------------------------------------------------------------
--
-- Title       : burst_mux_8_to_1
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_04_30_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\burst_mux_8_to_1.vhd
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
--{entity {burst_mux_8_to_1} architecture {burst_mux_8_to_1}}		F

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity burst_mux_8_to_1 is
	 port(
	    rst_p : in std_logic;			 
	 
	 	sel_in : in STD_LOGIC_VECTOR(2 downto 0);
		 
		v_sig_in_0 : in STD_LOGIC_VECTOR(63 downto 0);	 
		v_sig_in_1 : in STD_LOGIC_VECTOR(63 downto 0);
		v_sig_in_2 : in STD_LOGIC_VECTOR(63 downto 0);
		v_sig_in_3 : in STD_LOGIC_VECTOR(63 downto 0);
		v_sig_in_4 : in STD_LOGIC_VECTOR(63 downto 0);	 
		v_sig_in_5 : in STD_LOGIC_VECTOR(63 downto 0);
		v_sig_in_6 : in STD_LOGIC_VECTOR(63 downto 0);
		v_sig_in_7 : in STD_LOGIC_VECTOR(63 downto 0);		 	
		w_in : in std_logic_vector(7 downto 0);  
		 
		 v_sig_out : out STD_LOGIC_VECTOR(63 downto 0);
		 w_out : out STD_LOGIC	   
		 
	     );
end burst_mux_8_to_1;

--}} End of automatically maintained section

architecture burst_mux_8_to_1 of burst_mux_8_to_1 is
begin  
			p1:	process(rst_p, v_sig_in_0, v_sig_in_1, v_sig_in_2, v_sig_in_3, v_sig_in_4, v_sig_in_5, v_sig_in_6, v_sig_in_7, w_in, sel_in)
		begin
			if rst_p = '1' then
				w_out <= '0';
				
			elsif rst_p = '0' then
				
				case sel_in(2 downto 0) is
						when "000" =>
								w_out <= w_in(0);	   
								v_sig_out <= v_sig_in_0;
						when "001" =>
								w_out <= w_in(1);	   
								v_sig_out <= v_sig_in_1;
						when "010" =>
								w_out <= w_in(2);	   
								v_sig_out <= v_sig_in_2;
						when "011" =>
								w_out <= w_in(3);	   
								v_sig_out <= v_sig_in_3;
						when "100" =>
								w_out <= w_in(4);	   
								v_sig_out <= v_sig_in_4;
						when "101" =>
								w_out <= w_in(5);	   
								v_sig_out <= v_sig_in_5;
						when "110" =>
								w_out <= w_in(6);	   
								v_sig_out <= v_sig_in_6;
						when "111" =>
								w_out <= w_in(7);	   
								v_sig_out <= v_sig_in_7;								
						when others =>
								w_out <= '0'; 
						
				end case;
			else
				w_out <= '0';			
			end if;		 
		end	process p1;

	 -- enter your statements here --

end burst_mux_8_to_1;
