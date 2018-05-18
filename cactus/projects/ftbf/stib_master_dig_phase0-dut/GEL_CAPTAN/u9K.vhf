--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9K.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9K.sch" u9K.vhf
--Design Name: u9K
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

entity u9K is
   port ( BUSAA_00DN_01S_PORT    : in    std_logic; 
          BUSAA_00DP_00S_PORT    : in    std_logic; 
          BUSAA_01DN_03S_PORT    : in    std_logic; 
          BUSAA_01DP_02S_PORT    : in    std_logic; 
          BUSAA_02DN_05S_PORT    : in    std_logic; 
          BUSAA_02DP_04S_PORT    : in    std_logic; 
          BUSAA_03DN_07S_PORT    : in    std_logic; 
          BUSAA_03DP_06S_PORT    : in    std_logic; 
          BUSAA_04DN_09S_PORT    : in    std_logic; 
          BUSAA_04DP_08S_PORT    : in    std_logic; 
          BUSAA_05DN_11S_PORT    : in    std_logic; 
          BUSAA_05DP_10S_PORT    : in    std_logic; 
          BUSAA_06DN_13S_PORT    : in    std_logic; 
          BUSAA_06DP_12S_PORT    : in    std_logic; 
          BUSAA_07DN_15S_PORT    : in    std_logic; 
          BUSAA_07DP_14S_PORT    : in    std_logic; 
          BUSAHS_04DN_09S_PORT   : in    std_logic; 
          BUSAHS_04DP_08S_PORT   : in    std_logic; 
          BUSA_28DN_57S_PORT     : in    std_logic; 
          BUSA_28DP_56S_PORT     : in    std_logic; 
          BUSA_29DN_59S_PORT     : in    std_logic; 
          BUSA_29DP_58S_PORT     : in    std_logic; 
          BUSA_30DN_61S_PORT     : in    std_logic; 
          BUSA_30DP_60S_PORT     : in    std_logic; 
          BUSA_31DN_63S_PORT     : in    std_logic; 
          BUSA_31DP_62S_PORT     : in    std_logic; 
          BUSB_00DN_01S_PORT     : in    std_logic; 
          BUSB_00DP_00S_PORT     : in    std_logic; 
          BUSB_01DN_03S_PORT     : in    std_logic; 
          BUSB_01DP_02S_PORT     : in    std_logic; 
          BUSB_02DN_05S_PORT     : in    std_logic; 
          BUSB_02DP_04S_PORT     : in    std_logic; 
          BUSB_03DN_07S_PORT     : in    std_logic; 
          BUSB_03DP_06S_PORT     : in    std_logic; 
          BUSB_04DN_09S_PORT     : in    std_logic; 
          BUSB_04DP_08S_PORT     : in    std_logic; 
          BUSB_05DN_11S_PORT     : in    std_logic; 
          BUSB_05DP_10S_PORT     : in    std_logic; 
          BUSB_06DN_13S_PORT     : in    std_logic; 
          BUSB_06DP_12S_PORT     : in    std_logic; 
          BUSB_07DN_15S_PORT     : in    std_logic; 
          BUSB_07DP_14S_PORT     : in    std_logic; 
          BUSB_28DN_57S_PORT     : in    std_logic; 
          BUSB_28DP_56S_PORT     : in    std_logic; 
          BUSB_29DN_59S_PORT     : in    std_logic; 
          BUSB_29DP_58S_PORT     : in    std_logic; 
          BUSB_30DN_61S_PORT     : in    std_logic; 
          BUSB_30DP_60S_PORT     : in    std_logic; 
          BUSB_31DN_63S_PORT     : in    std_logic; 
          BUSB_31DP_62S_PORT     : in    std_logic; 
          FPGA_RESET_PORT        : in    std_logic; 
          GENERAL_16DN_33S_PORT  : in    std_logic; 
          GENERAL_16DP_32S_PORT  : in    std_logic; 
          INTERNAL_00DP_00S_PORT : in    std_logic; 
          INTERNAL_01DN_03S_PORT : in    std_logic; 
          INTERNAL_01DP_02S_PORT : in    std_logic; 
          INTERNAL_02DN_05S_NET  : in    std_logic; 
          INTERNAL_02DP_04S_PORT : in    std_logic; 
          INTERNAL_03DN_07S_NET  : in    std_logic; 
          INTERNAL_03DP_06S_PORT : in    std_logic; 
          INTERNAL_04DN_09S_PORT : in    std_logic; 
          INTERNAL_04DP_08S_PORT : in    std_logic; 
          INTERNAL_05DN_11S_PORT : in    std_logic; 
          INTERNAL_05DP_10S_PORT : in    std_logic; 
          BUSAA_00DN_01S_NET     : out   std_logic; 
          BUSAA_00DP_00S_NET     : out   std_logic; 
          BUSAA_01DN_03S_NET     : out   std_logic; 
          BUSAA_01DP_02S_NET     : out   std_logic; 
          BUSAA_02DN_05S_NET     : out   std_logic; 
          BUSAA_02DP_04S_NET     : out   std_logic; 
          BUSAA_03DN_07S_NET     : out   std_logic; 
          BUSAA_03DP_06S_NET     : out   std_logic; 
          BUSAA_04DN_09S_NET     : out   std_logic; 
          BUSAA_04DP_08S_NET     : out   std_logic; 
          BUSAA_05DN_11S_NET     : out   std_logic; 
          BUSAA_05DP_10S_NET     : out   std_logic; 
          BUSAA_06DN_13S_NET     : out   std_logic; 
          BUSAA_06DP_12S_NET     : out   std_logic; 
          BUSAA_07DN_15S_NET     : out   std_logic; 
          BUSAA_07DP_14S_NET     : out   std_logic; 
          BUSAHS_04DN_09S_NET    : out   std_logic; 
          BUSAHS_04DP_08S_NET    : out   std_logic; 
          BUSA_28DN_57S_NET      : out   std_logic; 
          BUSA_28DP_56S_NET      : out   std_logic; 
          BUSA_29DN_59S_NET      : out   std_logic; 
          BUSA_29DP_58S_NET      : out   std_logic; 
          BUSA_30DN_61S_NET      : out   std_logic; 
          BUSA_30DP_60S_NET      : out   std_logic; 
          BUSA_31DN_63S_NET      : out   std_logic; 
          BUSA_31DP_62S_NET      : out   std_logic; 
          BUSB_00DN_01S_NET      : out   std_logic; 
          BUSB_00DP_00S_NET      : out   std_logic; 
          BUSB_01DN_03S_NET      : out   std_logic; 
          BUSB_01DP_02S_NET      : out   std_logic; 
          BUSB_02DN_05S_NET      : out   std_logic; 
          BUSB_02DP_04S_NET      : out   std_logic; 
          BUSB_03DN_07S_NET      : out   std_logic; 
          BUSB_03DP_06S_NET      : out   std_logic; 
          BUSB_04DN_09S_NET      : out   std_logic; 
          BUSB_04DP_08S_NET      : out   std_logic; 
          BUSB_05DN_11S_NET      : out   std_logic; 
          BUSB_05DP_10S_NET      : out   std_logic; 
          BUSB_06DN_13S_NET      : out   std_logic; 
          BUSB_06DP_12S_NET      : out   std_logic; 
          BUSB_07DN_15S_NET      : out   std_logic; 
          BUSB_07DP_14S_NET      : out   std_logic; 
          BUSB_28DN_57S_NET      : out   std_logic; 
          BUSB_28DP_56S_NET      : out   std_logic; 
          BUSB_29DN_59S_NET      : out   std_logic; 
          BUSB_29DP_58S_NET      : out   std_logic; 
          BUSB_30DN_61S_NET      : out   std_logic; 
          BUSB_30DP_60S_NET      : out   std_logic; 
          BUSB_31DN_63S_NET      : out   std_logic; 
          BUSB_31DP_62S_NET      : out   std_logic; 
          FPGA_RESET_NET         : out   std_logic; 
          GENERAL_16DN_33S_NET   : out   std_logic; 
          GENERAL_16DP_32S_NET   : out   std_logic; 
          INTERNAL_00DP_00S_NET  : out   std_logic; 
          INTERNAL_01DN_03S_NET  : out   std_logic; 
          INTERNAL_01DP_02S_NET  : out   std_logic; 
          INTERNAL_02DN_05S_PORT : out   std_logic; 
          INTERNAL_02DP_04S_NET  : out   std_logic; 
          INTERNAL_03DN_07S_PORT : out   std_logic; 
          INTERNAL_03DP_06S_NET  : out   std_logic; 
          INTERNAL_04DN_09S_NET  : out   std_logic; 
          INTERNAL_04DP_08S_NET  : out   std_logic; 
          INTERNAL_05DN_11S_NET  : out   std_logic; 
          INTERNAL_05DP_10S_NET  : out   std_logic);
end u9K;

architecture BEHAVIORAL of u9K is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute BOX_TYPE    : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
begin
   XLXI_2089 : IBUF
      port map (I=>BUSB_28DN_57S_PORT,
                O=>BUSB_28DN_57S_NET);
   
   XLXI_2090 : IBUF
      port map (I=>BUSAA_07DN_15S_PORT,
                O=>BUSAA_07DN_15S_NET);
   
   XLXI_2091 : IBUF
      port map (I=>BUSB_29DP_58S_PORT,
                O=>BUSB_29DP_58S_NET);
   
   XLXI_2092 : IBUF
      port map (I=>BUSB_29DN_59S_PORT,
                O=>BUSB_29DN_59S_NET);
   
   XLXI_2093 : IBUF
      port map (I=>BUSB_30DP_60S_PORT,
                O=>BUSB_30DP_60S_NET);
   
   XLXI_2094 : IBUF
      port map (I=>BUSB_30DN_61S_PORT,
                O=>BUSB_30DN_61S_NET);
   
   XLXI_2095 : IBUF
      port map (I=>BUSB_31DP_62S_PORT,
                O=>BUSB_31DP_62S_NET);
   
   XLXI_2096 : IBUF
      port map (I=>BUSB_31DN_63S_PORT,
                O=>BUSB_31DN_63S_NET);
   
   XLXI_2097 : IBUF
      port map (I=>BUSAA_07DP_14S_PORT,
                O=>BUSAA_07DP_14S_NET);
   
   XLXI_2098 : IBUF
      port map (I=>BUSB_00DN_01S_PORT,
                O=>BUSB_00DN_01S_NET);
   
   XLXI_2099 : IBUF
      port map (I=>BUSB_01DP_02S_PORT,
                O=>BUSB_01DP_02S_NET);
   
   XLXI_2100 : IBUF
      port map (I=>BUSB_01DN_03S_PORT,
                O=>BUSB_01DN_03S_NET);
   
   XLXI_2101 : IBUF
      port map (I=>BUSB_02DP_04S_PORT,
                O=>BUSB_02DP_04S_NET);
   
   XLXI_2102 : IBUF
      port map (I=>BUSB_02DN_05S_PORT,
                O=>BUSB_02DN_05S_NET);
   
   XLXI_2103 : IBUF
      port map (I=>BUSB_00DP_00S_PORT,
                O=>BUSB_00DP_00S_NET);
   
   XLXI_2104 : IBUF
      port map (I=>INTERNAL_04DP_08S_PORT,
                O=>INTERNAL_04DP_08S_NET);
   
   XLXI_2105 : IBUF
      port map (I=>INTERNAL_04DN_09S_PORT,
                O=>INTERNAL_04DN_09S_NET);
   
   XLXI_2109 : IBUF
      port map (I=>BUSAA_02DP_04S_PORT,
                O=>BUSAA_02DP_04S_NET);
   
   XLXI_2110 : IBUF
      port map (I=>BUSAA_02DN_05S_PORT,
                O=>BUSAA_02DN_05S_NET);
   
   XLXI_2114 : IBUF
      port map (I=>BUSAA_03DN_07S_PORT,
                O=>BUSAA_03DN_07S_NET);
   
   XLXI_2115 : IBUF
      port map (I=>BUSAA_01DP_02S_PORT,
                O=>BUSAA_01DP_02S_NET);
   
   XLXI_2116 : IBUF
      port map (I=>BUSAA_01DN_03S_PORT,
                O=>BUSAA_01DN_03S_NET);
   
   XLXI_2117 : IBUF
      port map (I=>BUSAA_00DP_00S_PORT,
                O=>BUSAA_00DP_00S_NET);
   
   XLXI_2118 : IBUF
      port map (I=>BUSAA_00DN_01S_PORT,
                O=>BUSAA_00DN_01S_NET);
   
   XLXI_2119 : IBUF
      port map (I=>BUSAA_03DP_06S_PORT,
                O=>BUSAA_03DP_06S_NET);
   
   XLXI_2120 : IBUF
      port map (I=>BUSAHS_04DP_08S_PORT,
                O=>BUSAHS_04DP_08S_NET);
   
   XLXI_2121 : IBUF
      port map (I=>BUSAHS_04DN_09S_PORT,
                O=>BUSAHS_04DN_09S_NET);
   
   XLXI_2122 : IBUF
      port map (I=>INTERNAL_05DN_11S_PORT,
                O=>INTERNAL_05DN_11S_NET);
   
   XLXI_2126 : IBUF
      port map (I=>BUSAA_04DN_09S_PORT,
                O=>BUSAA_04DN_09S_NET);
   
   XLXI_2127 : IBUF
      port map (I=>BUSAA_05DP_10S_PORT,
                O=>BUSAA_05DP_10S_NET);
   
   XLXI_2128 : IBUF
      port map (I=>BUSAA_05DN_11S_PORT,
                O=>BUSAA_05DN_11S_NET);
   
   XLXI_2129 : IBUF
      port map (I=>INTERNAL_05DP_10S_PORT,
                O=>INTERNAL_05DP_10S_NET);
   
   XLXI_2130 : IBUF
      port map (I=>BUSAA_06DN_13S_PORT,
                O=>BUSAA_06DN_13S_NET);
   
   XLXI_2131 : IBUF
      port map (I=>INTERNAL_00DP_00S_PORT,
                O=>INTERNAL_00DP_00S_NET);
   
   XLXI_2132 : IBUF
      port map (I=>FPGA_RESET_PORT,
                O=>FPGA_RESET_NET);
   
   XLXI_2133 : IBUF
      port map (I=>INTERNAL_01DP_02S_PORT,
                O=>INTERNAL_01DP_02S_NET);
   
   XLXI_2134 : IBUF
      port map (I=>INTERNAL_01DN_03S_PORT,
                O=>INTERNAL_01DN_03S_NET);
   
   XLXI_2135 : IBUF
      port map (I=>BUSAA_06DP_12S_PORT,
                O=>BUSAA_06DP_12S_NET);
   
   XLXI_2136 : IBUF
      port map (I=>BUSB_03DP_06S_PORT,
                O=>BUSB_03DP_06S_NET);
   
   XLXI_2137 : IBUF
      port map (I=>BUSB_03DN_07S_PORT,
                O=>BUSB_03DN_07S_NET);
   
   XLXI_2138 : IBUF
      port map (I=>GENERAL_16DN_33S_PORT,
                O=>GENERAL_16DN_33S_NET);
   
   XLXI_2139 : IBUF
      port map (I=>BUSB_04DP_08S_PORT,
                O=>BUSB_04DP_08S_NET);
   
   XLXI_2140 : IBUF
      port map (I=>BUSB_04DN_09S_PORT,
                O=>BUSB_04DN_09S_NET);
   
   XLXI_2141 : IBUF
      port map (I=>BUSB_05DP_10S_PORT,
                O=>BUSB_05DP_10S_NET);
   
   XLXI_2142 : IBUF
      port map (I=>BUSB_05DN_11S_PORT,
                O=>BUSB_05DN_11S_NET);
   
   XLXI_2143 : IBUF
      port map (I=>BUSB_06DP_12S_PORT,
                O=>BUSB_06DP_12S_NET);
   
   XLXI_2144 : IBUF
      port map (I=>BUSB_06DN_13S_PORT,
                O=>BUSB_06DN_13S_NET);
   
   XLXI_2145 : IBUF
      port map (I=>GENERAL_16DP_32S_PORT,
                O=>GENERAL_16DP_32S_NET);
   
   XLXI_2146 : IBUF
      port map (I=>BUSB_07DN_15S_PORT,
                O=>BUSB_07DN_15S_NET);
   
   XLXI_2147 : IBUF
      port map (I=>INTERNAL_02DP_04S_PORT,
                O=>INTERNAL_02DP_04S_NET);
   
   XLXI_2149 : IBUF
      port map (I=>INTERNAL_03DP_06S_PORT,
                O=>INTERNAL_03DP_06S_NET);
   
   XLXI_2151 : IBUF
      port map (I=>BUSB_07DP_14S_PORT,
                O=>BUSB_07DP_14S_NET);
   
   XLXI_2152 : IBUF
      port map (I=>BUSB_28DP_56S_PORT,
                O=>BUSB_28DP_56S_NET);
   
   XLXI_2812 : OBUF
      port map (I=>INTERNAL_02DN_05S_NET,
                O=>INTERNAL_02DN_05S_PORT);
   
   XLXI_2815 : OBUF
      port map (I=>INTERNAL_03DN_07S_NET,
                O=>INTERNAL_03DN_07S_PORT);
   
   XLXI_2965 : IBUF
      port map (I=>BUSA_30DP_60S_PORT,
                O=>BUSA_30DP_60S_NET);
   
   XLXI_2966 : IBUF
      port map (I=>BUSA_30DN_61S_PORT,
                O=>BUSA_30DN_61S_NET);
   
   XLXI_2967 : IBUF
      port map (I=>BUSA_29DP_58S_PORT,
                O=>BUSA_29DP_58S_NET);
   
   XLXI_2968 : IBUF
      port map (I=>BUSA_29DN_59S_PORT,
                O=>BUSA_29DN_59S_NET);
   
   XLXI_2969 : IBUF
      port map (I=>BUSA_28DP_56S_PORT,
                O=>BUSA_28DP_56S_NET);
   
   XLXI_2970 : IBUF
      port map (I=>BUSA_28DN_57S_PORT,
                O=>BUSA_28DN_57S_NET);
   
   XLXI_2974 : IBUF
      port map (I=>BUSA_31DP_62S_PORT,
                O=>BUSA_31DP_62S_NET);
   
   XLXI_2975 : IBUF
      port map (I=>BUSAA_04DP_08S_PORT,
                O=>BUSAA_04DP_08S_NET);
   
   XLXI_2976 : IBUF
      port map (I=>BUSA_31DN_63S_PORT,
                O=>BUSA_31DN_63S_NET);
   
end BEHAVIORAL;


