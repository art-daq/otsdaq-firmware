-------------------------------------------------------------------------------
--
-- Title       : clk_mux_2_to_1_x_2
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_01_NIMPlus_OT_320MHz_1Phase_extclk\NIMPlus\NIMPlus\src\clk_mux_2_to_1_x_2.vhd
-- Generated   : Mon May  1 21:44:34 2017
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
--{entity {clk_mux_2_to_1_x_2} architecture {clk_mux_2_to_1_x_2}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity clk_mux_2_to_1_x_2 is
	 port(
	 	 sel : in STD_LOGIC;
		 e_320 : in STD_LOGIC;
		 i_320 : in STD_LOGIC;
		 e_40 : in STD_LOGIC;
		 i_40 : in STD_LOGIC;
		 out_320 : out STD_LOGIC;
		 out_40 : out STD_LOGIC
	     );
end clk_mux_2_to_1_x_2;

--}} End of automatically maintained section

architecture clk_mux_2_to_1_x_2 of clk_mux_2_to_1_x_2 is
begin
		p1:	process(sel, e_320, i_320, e_40, i_40)
		begin
				
				case sel is
						when '0' =>
							out_320 <= e_320;
							out_40 <= e_40;
						when '1' =>
							out_320 <= i_320;	
							out_40 <= i_40;
						when others =>
							out_320 <= i_320;	
							out_40 <= i_40;
				end case;	 
		end	process p1;
	 -- enter your statements here --

end clk_mux_2_to_1_x_2;
