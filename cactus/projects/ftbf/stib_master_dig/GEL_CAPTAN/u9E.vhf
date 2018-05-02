--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9E.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9E.sch" u9E.vhf
--Design Name: u9E
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

entity u9E is
   port ( BUSBHS_00DN_01S_PORT  : in    std_logic; 
          BUSBHS_00DP_00S_PORT  : in    std_logic; 
          BUSBHS_01DN_03S_PORT  : in    std_logic; 
          BUSBHS_01DP_02S_PORT  : in    std_logic; 
          BUSBHS_02DN_05S_PORT  : in    std_logic; 
          BUSBHS_02DP_04S_PORT  : in    std_logic; 
          BUSBHS_03DN_07S_PORT  : in    std_logic; 
          BUSBHS_03DP_06S_PORT  : in    std_logic; 
          BUSBHS_04DN_09S_PORT  : in    std_logic; 
          BUSBHS_04DP_08S_PORT  : in    std_logic; 
          GENERAL_17DN_35S_PORT : in    std_logic; 
          GENERAL_17DP_34S_PORT : in    std_logic; 
          JTAG_TCK2_PORT        : in    std_logic; 
          JTAG_TDI2_PORT        : in    std_logic; 
          JTAG_TDO2_PORT        : in    std_logic; 
          JTAG_TMS2_PORT        : in    std_logic; 
          BUSBHS_00DN_01S_NET   : out   std_logic; 
          BUSBHS_00DP_00S_NET   : out   std_logic; 
          BUSBHS_01DN_03S_NET   : out   std_logic; 
          BUSBHS_01DP_02S_NET   : out   std_logic; 
          BUSBHS_02DN_05S_NET   : out   std_logic; 
          BUSBHS_02DP_04S_NET   : out   std_logic; 
          BUSBHS_03DN_07S_NET   : out   std_logic; 
          BUSBHS_03DP_06S_NET   : out   std_logic; 
          BUSBHS_04DN_09S_NET   : out   std_logic; 
          BUSBHS_04DP_08S_NET   : out   std_logic; 
          GENERAL_17DN_35S_NET  : out   std_logic; 
          GENERAL_17DP_34S_NET  : out   std_logic; 
          JTAG_TCK2_NET         : out   std_logic; 
          JTAG_TDI2_NET         : out   std_logic; 
          JTAG_TDO2_NET         : out   std_logic; 
          JTAG_TMS2_NET         : out   std_logic);
end u9E;

architecture BEHAVIORAL of u9E is
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
   XLXI_1814 : IBUF
      port map (I=>JTAG_TDI2_PORT,
                O=>JTAG_TDI2_NET);
   
   XLXI_1815 : IBUF
      port map (I=>JTAG_TCK2_PORT,
                O=>JTAG_TCK2_NET);
   
   XLXI_1816 : IBUF
      port map (I=>JTAG_TMS2_PORT,
                O=>JTAG_TMS2_NET);
   
   XLXI_1817 : IBUF
      port map (I=>BUSBHS_00DP_00S_PORT,
                O=>BUSBHS_00DP_00S_NET);
   
   XLXI_1818 : IBUF
      port map (I=>BUSBHS_00DN_01S_PORT,
                O=>BUSBHS_00DN_01S_NET);
   
   XLXI_1819 : IBUF
      port map (I=>BUSBHS_01DP_02S_PORT,
                O=>BUSBHS_01DP_02S_NET);
   
   XLXI_1820 : IBUF
      port map (I=>BUSBHS_01DN_03S_PORT,
                O=>BUSBHS_01DN_03S_NET);
   
   XLXI_1821 : IBUF
      port map (I=>BUSBHS_02DP_04S_PORT,
                O=>BUSBHS_02DP_04S_NET);
   
   XLXI_1822 : IBUF
      port map (I=>JTAG_TDO2_PORT,
                O=>JTAG_TDO2_NET);
   
   XLXI_1823 : IBUF
      port map (I=>BUSBHS_03DP_06S_PORT,
                O=>BUSBHS_03DP_06S_NET);
   
   XLXI_1824 : IBUF
      port map (I=>BUSBHS_03DN_07S_PORT,
                O=>BUSBHS_03DN_07S_NET);
   
   XLXI_1825 : IBUF
      port map (I=>BUSBHS_04DP_08S_PORT,
                O=>BUSBHS_04DP_08S_NET);
   
   XLXI_1826 : IBUF
      port map (I=>BUSBHS_04DN_09S_PORT,
                O=>BUSBHS_04DN_09S_NET);
   
   XLXI_1827 : IBUF
      port map (I=>GENERAL_17DP_34S_PORT,
                O=>GENERAL_17DP_34S_NET);
   
   XLXI_1828 : IBUF
      port map (I=>BUSBHS_02DN_05S_PORT,
                O=>BUSBHS_02DN_05S_NET);
   
   XLXI_1829 : IBUF
      port map (I=>GENERAL_17DN_35S_PORT,
                O=>GENERAL_17DN_35S_NET);
   
end BEHAVIORAL;


