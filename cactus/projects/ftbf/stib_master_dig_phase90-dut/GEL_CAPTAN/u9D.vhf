--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9D.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9D.sch" u9D.vhf
--Design Name: u9D
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

entity u9D is
   port ( BUSDHS_00DN_01S_PORT  : in    std_logic; 
          BUSDHS_00DP_00S_PORT  : in    std_logic; 
          BUSDHS_01DN_03S_PORT  : in    std_logic; 
          BUSDHS_01DP_02S_PORT  : in    std_logic; 
          BUSDHS_02DN_05S_PORT  : in    std_logic; 
          BUSDHS_02DP_04S_PORT  : in    std_logic; 
          BUSDHS_03DN_07S_PORT  : in    std_logic; 
          BUSDHS_03DP_06S_PORT  : in    std_logic; 
          GENERAL_04DN_09S_PORT : in    std_logic; 
          GENERAL_04DP_08S_PORT : in    std_logic; 
          GENERAL_05DN_11S_PORT : in    std_logic; 
          GENERAL_05DP_10S_PORT : in    std_logic; 
          JTAG_TCK4_PORT        : in    std_logic; 
          JTAG_TDI4_PORT        : in    std_logic; 
          JTAG_TDO4_PORT        : in    std_logic; 
          JTAG_TMS4_PORT        : in    std_logic; 
          BUSDHS_00DN_01S_NET   : out   std_logic; 
          BUSDHS_00DP_00S_NET   : out   std_logic; 
          BUSDHS_01DN_03S_NET   : out   std_logic; 
          BUSDHS_01DP_02S_NET   : out   std_logic; 
          BUSDHS_02DN_05S_NET   : out   std_logic; 
          BUSDHS_02DP_04S_NET   : out   std_logic; 
          BUSDHS_03DN_07S_NET   : out   std_logic; 
          BUSDHS_03DP_06S_NET   : out   std_logic; 
          GENERAL_04DN_09S_NET  : out   std_logic; 
          GENERAL_04DP_08S_NET  : out   std_logic; 
          GENERAL_05DN_11S_NET  : out   std_logic; 
          GENERAL_05DP_10S_NET  : out   std_logic; 
          JTAG_TCK4_NET         : out   std_logic; 
          JTAG_TDI4_NET         : out   std_logic; 
          JTAG_TDO4_NET         : out   std_logic; 
          JTAG_TMS4_NET         : out   std_logic);
end u9D;

architecture BEHAVIORAL of u9D is
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
   XLXI_1798 : IBUF
      port map (I=>JTAG_TDI4_PORT,
                O=>JTAG_TDI4_NET);
   
   XLXI_1799 : IBUF
      port map (I=>JTAG_TCK4_PORT,
                O=>JTAG_TCK4_NET);
   
   XLXI_1800 : IBUF
      port map (I=>JTAG_TMS4_PORT,
                O=>JTAG_TMS4_NET);
   
   XLXI_1801 : IBUF
      port map (I=>BUSDHS_00DP_00S_PORT,
                O=>BUSDHS_00DP_00S_NET);
   
   XLXI_1802 : IBUF
      port map (I=>BUSDHS_00DN_01S_PORT,
                O=>BUSDHS_00DN_01S_NET);
   
   XLXI_1803 : IBUF
      port map (I=>BUSDHS_01DP_02S_PORT,
                O=>BUSDHS_01DP_02S_NET);
   
   XLXI_1804 : IBUF
      port map (I=>BUSDHS_01DN_03S_PORT,
                O=>BUSDHS_01DN_03S_NET);
   
   XLXI_1805 : IBUF
      port map (I=>BUSDHS_02DP_04S_PORT,
                O=>BUSDHS_02DP_04S_NET);
   
   XLXI_1806 : IBUF
      port map (I=>JTAG_TDO4_PORT,
                O=>JTAG_TDO4_NET);
   
   XLXI_1807 : IBUF
      port map (I=>BUSDHS_03DP_06S_PORT,
                O=>BUSDHS_03DP_06S_NET);
   
   XLXI_1808 : IBUF
      port map (I=>BUSDHS_03DN_07S_PORT,
                O=>BUSDHS_03DN_07S_NET);
   
   XLXI_1811 : IBUF
      port map (I=>GENERAL_05DP_10S_PORT,
                O=>GENERAL_05DP_10S_NET);
   
   XLXI_1812 : IBUF
      port map (I=>BUSDHS_02DN_05S_PORT,
                O=>BUSDHS_02DN_05S_NET);
   
   XLXI_1813 : IBUF
      port map (I=>GENERAL_05DN_11S_PORT,
                O=>GENERAL_05DN_11S_NET);
   
   XLXI_2977 : IBUF
      port map (I=>GENERAL_04DP_08S_PORT,
                O=>GENERAL_04DP_08S_NET);
   
   XLXI_2978 : IBUF
      port map (I=>GENERAL_04DN_09S_PORT,
                O=>GENERAL_04DN_09S_NET);
   
end BEHAVIORAL;


