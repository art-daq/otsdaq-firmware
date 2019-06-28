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
        sel     : in STD_LOGIC;
        
        e_160   : in STD_LOGIC;
        e_40    : in STD_LOGIC;
        e_53    : in STD_LOGIC;
        e_26    : in STD_LOGIC;
        e_13    : in STD_LOGIC;
        e_6     : in STD_LOGIC;
               
        i_160   : in STD_LOGIC;        
        i_40    : in STD_LOGIC;        
        i_53    : in STD_LOGIC;        
        i_26    : in STD_LOGIC;        
        i_13    : in STD_LOGIC;        
        i_6     : in STD_LOGIC;
        
        out_160 : out STD_LOGIC;
        out_40  : out STD_LOGIC;
        out_53  : out STD_LOGIC;
        out_26  : out STD_LOGIC;
        out_13  : out STD_LOGIC;
        out_6   : out STD_LOGIC
    );
end clk_mux_2_to_1_x_2;

--}} End of automatically maintained section

architecture clk_mux_2_to_1_x_2 of clk_mux_2_to_1_x_2 is
begin

    out_160     <= e_160 when sel = '1' else i_160;
    out_40      <= e_40  when sel = '1' else i_40 ;
    out_53      <= e_53  when sel = '1' else i_53 ;
    out_26      <= e_26  when sel = '1' else i_26 ;
    out_13      <= e_13  when sel = '1' else i_13 ;
    out_6       <= e_6   when sel = '1' else i_6  ;

end clk_mux_2_to_1_x_2;
