--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9C.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:21
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9C.sch" u9C.vhf
--Design Name: u9C
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity u9C is
   port ( GENERAL_18DN_37S_PORT : in    std_logic; 
          GENERAL_18DP_36S_PORT : in    std_logic; 
          GENERAL_19DN_39S_PORT : in    std_logic; 
          GENERAL_19DP_38S_PORT : in    std_logic; 
          GENERAL_20DN_41S_PORT : in    std_logic; 
          GENERAL_20DP_40S_PORT : in    std_logic; 
          GENERAL_21DN_43S_PORT : in    std_logic; 
          GENERAL_21DP_42S_PORT : in    std_logic; 
          GENERAL_22DN_45S_PORT : in    std_logic; 
          GENERAL_22DP_44S_PORT : in    std_logic; 
          GENERAL_23DN_47S_PORT : in    std_logic; 
          GENERAL_23DP_46S_PORT : in    std_logic; 
          JTAG_TCK3_PORT        : in    std_logic; 
          JTAG_TDI3_PORT        : in    std_logic; 
          JTAG_TDO3_PORT        : in    std_logic; 
          JTAG_TMS3_PORT        : in    std_logic; 
          GENERAL_18DN_37S_NET  : out   std_logic; 
          GENERAL_18DP_36S_NET  : out   std_logic; 
          GENERAL_19DN_39S_NET  : out   std_logic; 
          GENERAL_19DP_38S_NET  : out   std_logic; 
          GENERAL_20DN_41S_NET  : out   std_logic; 
          GENERAL_20DP_40S_NET  : out   std_logic; 
          GENERAL_21DN_43S_NET  : out   std_logic; 
          GENERAL_21DP_42S_NET  : out   std_logic; 
          GENERAL_22DN_45S_NET  : out   std_logic; 
          GENERAL_22DP_44S_NET  : out   std_logic; 
          GENERAL_23DN_47S_NET  : out   std_logic; 
          GENERAL_23DP_46S_NET  : out   std_logic; 
          JTAG_TCK3_NET         : out   std_logic; 
          JTAG_TDI3_NET         : out   std_logic; 
          JTAG_TDO3_NET         : out   std_logic; 
          JTAG_TMS3_NET         : out   std_logic);
end u9C;

architecture BEHAVIORAL of u9C is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute BOX_TYPE    : string ;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
begin
   XLXI_1830 : IBUF
      port map (I=>JTAG_TDI3_PORT,
                O=>JTAG_TDI3_NET);
   
   XLXI_1831 : IBUF
      port map (I=>JTAG_TCK3_PORT,
                O=>JTAG_TCK3_NET);
   
   XLXI_1832 : IBUF
      port map (I=>JTAG_TMS3_PORT,
                O=>JTAG_TMS3_NET);
   
   XLXI_1833 : IBUF
      port map (I=>GENERAL_18DP_36S_PORT,
                O=>GENERAL_18DP_36S_NET);
   
   XLXI_1834 : IBUF
      port map (I=>GENERAL_18DN_37S_PORT,
                O=>GENERAL_18DN_37S_NET);
   
   XLXI_1835 : IBUF
      port map (I=>GENERAL_19DP_38S_PORT,
                O=>GENERAL_19DP_38S_NET);
   
   XLXI_1836 : IBUF
      port map (I=>GENERAL_19DN_39S_PORT,
                O=>GENERAL_19DN_39S_NET);
   
   XLXI_1837 : IBUF
      port map (I=>GENERAL_20DP_40S_PORT,
                O=>GENERAL_20DP_40S_NET);
   
   XLXI_1838 : IBUF
      port map (I=>JTAG_TDO3_PORT,
                O=>JTAG_TDO3_NET);
   
   XLXI_1839 : IBUF
      port map (I=>GENERAL_21DP_42S_PORT,
                O=>GENERAL_21DP_42S_NET);
   
   XLXI_1840 : IBUF
      port map (I=>GENERAL_21DN_43S_PORT,
                O=>GENERAL_21DN_43S_NET);
   
   XLXI_1841 : IBUF
      port map (I=>GENERAL_22DP_44S_PORT,
                O=>GENERAL_22DP_44S_NET);
   
   XLXI_1842 : IBUF
      port map (I=>GENERAL_22DN_45S_PORT,
                O=>GENERAL_22DN_45S_NET);
   
   XLXI_1843 : IBUF
      port map (I=>GENERAL_23DP_46S_PORT,
                O=>GENERAL_23DP_46S_NET);
   
   XLXI_1844 : IBUF
      port map (I=>GENERAL_20DN_41S_PORT,
                O=>GENERAL_20DN_41S_NET);
   
   XLXI_1845 : IBUF
      port map (I=>GENERAL_23DN_47S_PORT,
                O=>GENERAL_23DN_47S_NET);
   
end BEHAVIORAL;


