--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9J.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:32
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9J.sch" u9J.vhf
--Design Name: u9J
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

entity u9J is
   port ( BUSCC_00DN_01S_PORT    : in    std_logic; 
          BUSCC_00DP_00S_PORT    : in    std_logic; 
          BUSCC_01DN_03S_PORT    : in    std_logic; 
          BUSCC_01DP_02S_PORT    : in    std_logic; 
          BUSCC_02DN_05S_PORT    : in    std_logic; 
          BUSCC_02DP_04S_PORT    : in    std_logic; 
          BUSCC_03DN_07S_PORT    : in    std_logic; 
          BUSCC_03DP_06S_PORT    : in    std_logic; 
          BUSCC_04DN_09S_PORT    : in    std_logic; 
          BUSCC_04DP_08S_PORT    : in    std_logic; 
          BUSCC_05DN_11S_PORT    : in    std_logic; 
          BUSCC_05DP_10S_PORT    : in    std_logic; 
          BUSCC_06DN_13S_PORT    : in    std_logic; 
          BUSCC_06DP_12S_PORT    : in    std_logic; 
          BUSCC_07DN_15S_PORT    : in    std_logic; 
          BUSCC_07DP_14S_PORT    : in    std_logic; 
          BUSCHS_04DN_09S_PORT   : in    std_logic; 
          BUSCHS_04DP_08S_PORT   : in    std_logic; 
          BUSC_28DN_57S_PORT     : in    std_logic; 
          BUSC_28DP_56S_PORT     : in    std_logic; 
          BUSC_29DN_59S_PORT     : in    std_logic; 
          BUSC_29DP_58S_PORT     : in    std_logic; 
          BUSC_30DN_61S_PORT     : in    std_logic; 
          BUSC_30DP_60S_PORT     : in    std_logic; 
          BUSC_31DN_63S_PORT     : in    std_logic; 
          BUSC_31DP_62S_PORT     : in    std_logic; 
          BUSDHS_04DN_09S_PORT   : in    std_logic; 
          BUSDHS_04DP_08S_PORT   : in    std_logic; 
          BUSD_00DN_01S_PORT     : in    std_logic; 
          BUSD_00DP_00S_PORT     : in    std_logic; 
          BUSD_01DN_03S_PORT     : in    std_logic; 
          BUSD_01DP_02S_PORT     : in    std_logic; 
          BUSD_02DN_05S_PORT     : in    std_logic; 
          BUSD_02DP_04S_PORT     : in    std_logic; 
          BUSD_03DN_07S_PORT     : in    std_logic; 
          BUSD_03DP_06S_PORT     : in    std_logic; 
          BUSD_04DN_09S_PORT     : in    std_logic; 
          BUSD_04DP_08S_PORT     : in    std_logic; 
          BUSD_05DN_11S_PORT     : in    std_logic; 
          BUSD_05DP_10S_PORT     : in    std_logic; 
          BUSD_06DN_13S_PORT     : in    std_logic; 
          BUSD_06DP_12S_PORT     : in    std_logic; 
          BUSD_07DN_15S_PORT     : in    std_logic; 
          BUSD_07DP_14S_PORT     : in    std_logic; 
          BUSD_28DN_57S_PORT     : in    std_logic; 
          BUSD_28DP_56S_PORT     : in    std_logic; 
          BUSD_29DN_59S_PORT     : in    std_logic; 
          BUSD_29DP_58S_PORT     : in    std_logic; 
          BUSD_30DN_61S_PORT     : in    std_logic; 
          BUSD_30DP_60S_PORT     : in    std_logic; 
          BUSD_31DN_63S_PORT     : in    std_logic; 
          BUSD_31DP_62S_PORT     : in    std_logic; 
          GENERAL_12DN_25S_PORT  : in    std_logic; 
          GENERAL_12DP_24S_PORT  : in    std_logic; 
          GENERAL_14DN_29S_PORT  : in    std_logic; 
          GENERAL_14DP_28S_PORT  : in    std_logic; 
          GENERAL_15DN_31S_PORT  : in    std_logic; 
          GENERAL_15DP_30S_PORT  : in    std_logic; 
          INTERNAL_07DN_15S_PORT : in    std_logic; 
          INTERNAL_07DP_14S_PORT : in    std_logic; 
          INTERNAL_08DN_17S_PORT : in    std_logic; 
          INTERNAL_08DP_16S_PORT : in    std_logic; 
          INTERNAL_09DN_19S_PORT : in    std_logic; 
          INTERNAL_09DP_18S_PORT : in    std_logic; 
          BUSCC_00DN_01S_NET     : out   std_logic; 
          BUSCC_00DP_00S_NET     : out   std_logic; 
          BUSCC_01DN_03S_NET     : out   std_logic; 
          BUSCC_01DP_02S_NET     : out   std_logic; 
          BUSCC_02DN_05S_NET     : out   std_logic; 
          BUSCC_02DP_04S_NET     : out   std_logic; 
          BUSCC_03DN_07S_NET     : out   std_logic; 
          BUSCC_03DP_06S_NET     : out   std_logic; 
          BUSCC_04DN_09S_NET     : out   std_logic; 
          BUSCC_04DP_08S_NET     : out   std_logic; 
          BUSCC_05DN_11S_NET     : out   std_logic; 
          BUSCC_05DP_10S_NET     : out   std_logic; 
          BUSCC_06DN_13S_NET     : out   std_logic; 
          BUSCC_06DP_12S_NET     : out   std_logic; 
          BUSCC_07DN_15S_NET     : out   std_logic; 
          BUSCC_07DP_14S_NET     : out   std_logic; 
          BUSCHS_04DN_09S_NET    : out   std_logic; 
          BUSCHS_04DP_08S_NET    : out   std_logic; 
          BUSC_28DN_57S_NET      : out   std_logic; 
          BUSC_28DP_56S_NET      : out   std_logic; 
          BUSC_29DN_59S_NET      : out   std_logic; 
          BUSC_29DP_58S_NET      : out   std_logic; 
          BUSC_30DN_61S_NET      : out   std_logic; 
          BUSC_30DP_60S_NET      : out   std_logic; 
          BUSC_31DN_63S_NET      : out   std_logic; 
          BUSC_31DP_62S_NET      : out   std_logic; 
          BUSDHS_04DN_09S_NET    : out   std_logic; 
          BUSDHS_04DP_08S_NET    : out   std_logic; 
          BUSD_00DN_01S_NET      : out   std_logic; 
          BUSD_00DP_00S_NET      : out   std_logic; 
          BUSD_01DN_03S_NET      : out   std_logic; 
          BUSD_01DP_02S_NET      : out   std_logic; 
          BUSD_02DN_05S_NET      : out   std_logic; 
          BUSD_02DP_04S_NET      : out   std_logic; 
          BUSD_03DN_07S_NET      : out   std_logic; 
          BUSD_03DP_06S_NET      : out   std_logic; 
          BUSD_04DN_09S_NET      : out   std_logic; 
          BUSD_04DP_08S_NET      : out   std_logic; 
          BUSD_05DN_11S_NET      : out   std_logic; 
          BUSD_05DP_10S_NET      : out   std_logic; 
          BUSD_06DN_13S_NET      : out   std_logic; 
          BUSD_06DP_12S_NET      : out   std_logic; 
          BUSD_07DN_15S_NET      : out   std_logic; 
          BUSD_07DP_14S_NET      : out   std_logic; 
          BUSD_28DN_57S_NET      : out   std_logic; 
          BUSD_28DP_56S_NET      : out   std_logic; 
          BUSD_29DN_59S_NET      : out   std_logic; 
          BUSD_29DP_58S_NET      : out   std_logic; 
          BUSD_30DN_61S_NET      : out   std_logic; 
          BUSD_30DP_60S_NET      : out   std_logic; 
          BUSD_31DN_63S_NET      : out   std_logic; 
          BUSD_31DP_62S_NET      : out   std_logic; 
          GENERAL_12DN_25S_NET   : out   std_logic; 
          GENERAL_12DP_24S_NET   : out   std_logic; 
          GENERAL_14DN_29S_NET   : out   std_logic; 
          GENERAL_14DP_28S_NET   : out   std_logic; 
          GENERAL_15DN_31S_NET   : out   std_logic; 
          GENERAL_15DP_30S_NET   : out   std_logic; 
          INTERNAL_07DN_15S_NET  : out   std_logic; 
          INTERNAL_07DP_14S_NET  : out   std_logic; 
          INTERNAL_08DN_17S_NET  : out   std_logic; 
          INTERNAL_08DP_16S_NET  : out   std_logic; 
          INTERNAL_09DN_19S_NET  : out   std_logic; 
          INTERNAL_09DP_18S_NET  : out   std_logic);
end u9J;

architecture BEHAVIORAL of u9J is
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
   XLXI_2158 : IBUF
      port map (I=>BUSC_31DP_62S_PORT,
                O=>BUSC_31DP_62S_NET);
   
   XLXI_2160 : IBUF
      port map (I=>BUSCC_00DP_00S_PORT,
                O=>BUSCC_00DP_00S_NET);
   
   XLXI_2162 : IBUF
      port map (I=>BUSCC_01DP_02S_PORT,
                O=>BUSCC_01DP_02S_NET);
   
   XLXI_2163 : IBUF
      port map (I=>BUSCC_01DN_03S_PORT,
                O=>BUSCC_01DN_03S_NET);
   
   XLXI_2164 : IBUF
      port map (I=>BUSCC_02DP_04S_PORT,
                O=>BUSCC_02DP_04S_NET);
   
   XLXI_2165 : IBUF
      port map (I=>BUSCC_02DN_05S_PORT,
                O=>BUSCC_02DN_05S_NET);
   
   XLXI_2166 : IBUF
      port map (I=>GENERAL_12DP_24S_PORT,
                O=>GENERAL_12DP_24S_NET);
   
   XLXI_2167 : IBUF
      port map (I=>BUSCC_00DN_01S_PORT,
                O=>BUSCC_00DN_01S_NET);
   
   XLXI_2168 : IBUF
      port map (I=>GENERAL_12DN_25S_PORT,
                O=>GENERAL_12DN_25S_NET);
   
   XLXI_2169 : IBUF
      port map (I=>BUSD_30DP_60S_PORT,
                O=>BUSD_30DP_60S_NET);
   
   XLXI_2170 : IBUF
      port map (I=>BUSD_29DP_58S_PORT,
                O=>BUSD_29DP_58S_NET);
   
   XLXI_2171 : IBUF
      port map (I=>BUSD_29DN_59S_PORT,
                O=>BUSD_29DN_59S_NET);
   
   XLXI_2172 : IBUF
      port map (I=>BUSD_00DP_00S_PORT,
                O=>BUSD_00DP_00S_NET);
   
   XLXI_2173 : IBUF
      port map (I=>BUSD_00DN_01S_PORT,
                O=>BUSD_00DN_01S_NET);
   
   XLXI_2174 : IBUF
      port map (I=>BUSD_28DP_56S_PORT,
                O=>BUSD_28DP_56S_NET);
   
   XLXI_2175 : IBUF
      port map (I=>BUSD_28DN_57S_PORT,
                O=>BUSD_28DN_57S_NET);
   
   XLXI_2176 : IBUF
      port map (I=>BUSD_01DP_02S_PORT,
                O=>BUSD_01DP_02S_NET);
   
   XLXI_2177 : IBUF
      port map (I=>BUSD_30DN_61S_PORT,
                O=>BUSD_30DN_61S_NET);
   
   XLXI_2178 : IBUF
      port map (I=>BUSD_02DP_04S_PORT,
                O=>BUSD_02DP_04S_NET);
   
   XLXI_2179 : IBUF
      port map (I=>BUSD_02DN_05S_PORT,
                O=>BUSD_02DN_05S_NET);
   
   XLXI_2180 : IBUF
      port map (I=>BUSD_31DP_62S_PORT,
                O=>BUSD_31DP_62S_NET);
   
   XLXI_2181 : IBUF
      port map (I=>BUSD_31DN_63S_PORT,
                O=>BUSD_31DN_63S_NET);
   
   XLXI_2182 : IBUF
      port map (I=>BUSDHS_04DP_08S_PORT,
                O=>BUSDHS_04DP_08S_NET);
   
   XLXI_2183 : IBUF
      port map (I=>BUSD_01DN_03S_PORT,
                O=>BUSD_01DN_03S_NET);
   
   XLXI_2184 : IBUF
      port map (I=>BUSDHS_04DN_09S_PORT,
                O=>BUSDHS_04DN_09S_NET);
   
   XLXI_2185 : IBUF
      port map (I=>INTERNAL_07DP_14S_PORT,
                O=>INTERNAL_07DP_14S_NET);
   
   XLXI_2186 : IBUF
      port map (I=>BUSD_03DP_06S_PORT,
                O=>BUSD_03DP_06S_NET);
   
   XLXI_2187 : IBUF
      port map (I=>BUSD_03DN_07S_PORT,
                O=>BUSD_03DN_07S_NET);
   
   XLXI_2188 : IBUF
      port map (I=>BUSD_04DP_08S_PORT,
                O=>BUSD_04DP_08S_NET);
   
   XLXI_2189 : IBUF
      port map (I=>BUSD_04DN_09S_PORT,
                O=>BUSD_04DN_09S_NET);
   
   XLXI_2190 : IBUF
      port map (I=>BUSD_05DP_10S_PORT,
                O=>BUSD_05DP_10S_NET);
   
   XLXI_2191 : IBUF
      port map (I=>BUSD_05DN_11S_PORT,
                O=>BUSD_05DN_11S_NET);
   
   XLXI_2192 : IBUF
      port map (I=>BUSD_06DP_12S_PORT,
                O=>BUSD_06DP_12S_NET);
   
   XLXI_2193 : IBUF
      port map (I=>INTERNAL_07DN_15S_PORT,
                O=>INTERNAL_07DN_15S_NET);
   
   XLXI_2194 : IBUF
      port map (I=>BUSD_07DP_14S_PORT,
                O=>BUSD_07DP_14S_NET);
   
   XLXI_2195 : IBUF
      port map (I=>BUSD_07DN_15S_PORT,
                O=>BUSD_07DN_15S_NET);
   
   XLXI_2196 : IBUF
      port map (I=>INTERNAL_08DP_16S_PORT,
                O=>INTERNAL_08DP_16S_NET);
   
   XLXI_2197 : IBUF
      port map (I=>INTERNAL_08DN_17S_PORT,
                O=>INTERNAL_08DN_17S_NET);
   
   XLXI_2198 : IBUF
      port map (I=>INTERNAL_09DP_18S_PORT,
                O=>INTERNAL_09DP_18S_NET);
   
   XLXI_2199 : IBUF
      port map (I=>BUSD_06DN_13S_PORT,
                O=>BUSD_06DN_13S_NET);
   
   XLXI_2200 : IBUF
      port map (I=>INTERNAL_09DN_19S_PORT,
                O=>INTERNAL_09DN_19S_NET);
   
   XLXI_2201 : IBUF
      port map (I=>BUSCHS_04DP_08S_PORT,
                O=>BUSCHS_04DP_08S_NET);
   
   XLXI_2202 : IBUF
      port map (I=>BUSCC_03DP_06S_PORT,
                O=>BUSCC_03DP_06S_NET);
   
   XLXI_2203 : IBUF
      port map (I=>BUSCC_03DN_07S_PORT,
                O=>BUSCC_03DN_07S_NET);
   
   XLXI_2204 : IBUF
      port map (I=>BUSCC_04DP_08S_PORT,
                O=>BUSCC_04DP_08S_NET);
   
   XLXI_2205 : IBUF
      port map (I=>BUSCC_04DN_09S_PORT,
                O=>BUSCC_04DN_09S_NET);
   
   XLXI_2206 : IBUF
      port map (I=>BUSCC_05DP_10S_PORT,
                O=>BUSCC_05DP_10S_NET);
   
   XLXI_2207 : IBUF
      port map (I=>BUSCC_05DN_11S_PORT,
                O=>BUSCC_05DN_11S_NET);
   
   XLXI_2208 : IBUF
      port map (I=>BUSCC_06DP_12S_PORT,
                O=>BUSCC_06DP_12S_NET);
   
   XLXI_2209 : IBUF
      port map (I=>BUSCHS_04DN_09S_PORT,
                O=>BUSCHS_04DN_09S_NET);
   
   XLXI_2210 : IBUF
      port map (I=>BUSCC_07DP_14S_PORT,
                O=>BUSCC_07DP_14S_NET);
   
   XLXI_2211 : IBUF
      port map (I=>BUSCC_07DN_15S_PORT,
                O=>BUSCC_07DN_15S_NET);
   
   XLXI_2212 : IBUF
      port map (I=>GENERAL_14DP_28S_PORT,
                O=>GENERAL_14DP_28S_NET);
   
   XLXI_2213 : IBUF
      port map (I=>GENERAL_14DN_29S_PORT,
                O=>GENERAL_14DN_29S_NET);
   
   XLXI_2214 : IBUF
      port map (I=>GENERAL_15DP_30S_PORT,
                O=>GENERAL_15DP_30S_NET);
   
   XLXI_2215 : IBUF
      port map (I=>BUSCC_06DN_13S_PORT,
                O=>BUSCC_06DN_13S_NET);
   
   XLXI_2216 : IBUF
      port map (I=>GENERAL_15DN_31S_PORT,
                O=>GENERAL_15DN_31S_NET);
   
   XLXI_2912 : IBUF
      port map (I=>BUSC_31DN_63S_PORT,
                O=>BUSC_31DN_63S_NET);
   
   XLXI_2913 : IBUF
      port map (I=>BUSC_28DP_56S_PORT,
                O=>BUSC_28DP_56S_NET);
   
   XLXI_2914 : IBUF
      port map (I=>BUSC_29DP_58S_PORT,
                O=>BUSC_29DP_58S_NET);
   
   XLXI_2915 : IBUF
      port map (I=>BUSC_29DN_59S_PORT,
                O=>BUSC_29DN_59S_NET);
   
   XLXI_2916 : IBUF
      port map (I=>BUSC_30DP_60S_PORT,
                O=>BUSC_30DP_60S_NET);
   
   XLXI_2917 : IBUF
      port map (I=>BUSC_30DN_61S_PORT,
                O=>BUSC_30DN_61S_NET);
   
   XLXI_2918 : IBUF
      port map (I=>BUSC_28DN_57S_PORT,
                O=>BUSC_28DN_57S_NET);
   
end BEHAVIORAL;


