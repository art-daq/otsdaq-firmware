--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9H.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:29
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9H.sch" u9H.vhf
--Design Name: u9H
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

entity u9H is
   port ( BUSCHS_00DN_01S_PORT  : in    std_logic; 
          BUSCHS_00DP_00S_PORT  : in    std_logic; 
          BUSCHS_01DN_03S_PORT  : in    std_logic; 
          BUSCHS_01DP_02S_PORT  : in    std_logic; 
          BUSCHS_02DN_05S_PORT  : in    std_logic; 
          BUSCHS_02DP_04S_PORT  : in    std_logic; 
          BUSCHS_03DN_07S_PORT  : in    std_logic; 
          BUSCHS_03DP_06S_PORT  : in    std_logic; 
          BUSC_00DN_01S_PORT    : in    std_logic; 
          BUSC_00DP_00S_PORT    : in    std_logic; 
          BUSC_01DN_03S_PORT    : in    std_logic; 
          BUSC_01DP_02S_PORT    : in    std_logic; 
          BUSC_02DN_05S_PORT    : in    std_logic; 
          BUSC_02DP_04S_PORT    : in    std_logic; 
          BUSC_03DN_07S_PORT    : in    std_logic; 
          BUSC_03DP_06S_PORT    : in    std_logic; 
          BUSC_04DN_09S_PORT    : in    std_logic; 
          BUSC_04DP_08S_PORT    : in    std_logic; 
          BUSC_05DN_11S_PORT    : in    std_logic; 
          BUSC_05DP_10S_PORT    : in    std_logic; 
          BUSC_06DN_13S_PORT    : in    std_logic; 
          BUSC_06DP_12S_PORT    : in    std_logic; 
          BUSC_07DN_15S_PORT    : in    std_logic; 
          BUSC_07DP_14S_PORT    : in    std_logic; 
          BUSC_08DN_17S_PORT    : in    std_logic; 
          BUSC_08DP_16S_PORT    : in    std_logic; 
          BUSC_09DN_19S_PORT    : in    std_logic; 
          BUSC_09DP_18S_PORT    : in    std_logic; 
          BUSC_10DN_21S_PORT    : in    std_logic; 
          BUSC_10DP_20S_PORT    : in    std_logic; 
          BUSC_11DN_23S_PORT    : in    std_logic; 
          BUSC_11DP_22S_PORT    : in    std_logic; 
          BUSC_12DN_25S_PORT    : in    std_logic; 
          BUSC_12DP_24S_PORT    : in    std_logic; 
          BUSC_13DN_27S_PORT    : in    std_logic; 
          BUSC_13DP_26S_PORT    : in    std_logic; 
          BUSC_14DN_29S_NET     : in    std_logic; 
          BUSC_14DP_28S_NET     : in    std_logic; 
          BUSC_15DN_31S_NET     : in    std_logic; 
          BUSC_15DP_30S_NET     : in    std_logic; 
          BUSC_16DN_33S_NET     : in    std_logic; 
          BUSC_16DP_32S_PORT    : in    std_logic; 
          BUSC_17DN_35S_PORT    : in    std_logic; 
          BUSC_17DP_34S_PORT    : in    std_logic; 
          BUSC_18DN_37S_PORT    : in    std_logic; 
          BUSC_18DP_36S_PORT    : in    std_logic; 
          BUSC_19DN_39S_PORT    : in    std_logic; 
          BUSC_19DP_38S_PORT    : in    std_logic; 
          BUSC_20DN_41S_PORT    : in    std_logic; 
          BUSC_20DP_40S_PORT    : in    std_logic; 
          BUSC_21DN_43S_NET_out : in    std_logic; 
          BUSC_21DN_43S_NET_tri : in    std_logic; 
          BUSC_21DP_42S_PORT    : in    std_logic; 
          BUSC_22DN_45S_PORT    : in    std_logic; 
          BUSC_22DP_44S_PORT    : in    std_logic; 
          BUSC_23DN_47S_PORT    : in    std_logic; 
          BUSC_23DP_46S_PORT    : in    std_logic; 
          BUSC_24DN_49S_NET     : in    std_logic; 
          BUSC_24DP_48S_NET     : in    std_logic; 
          BUSC_25DN_51S_NET     : in    std_logic; 
          BUSC_25DP_50S_NET     : in    std_logic; 
          BUSC_26DN_53S_NET     : in    std_logic; 
          BUSC_26DP_52S_PORT    : in    std_logic; 
          BUSC_27DN_55S_NET     : in    std_logic; 
          BUSC_27DP_54S_PORT    : in    std_logic; 
          BUSCHS_00DN_01S_NET   : out   std_logic; 
          BUSCHS_00DP_00S_NET   : out   std_logic; 
          BUSCHS_01DN_03S_NET   : out   std_logic; 
          BUSCHS_01DP_02S_NET   : out   std_logic; 
          BUSCHS_02DN_05S_NET   : out   std_logic; 
          BUSCHS_02DP_04S_NET   : out   std_logic; 
          BUSCHS_03DN_07S_NET   : out   std_logic; 
          BUSCHS_03DP_06S_NET   : out   std_logic; 
          BUSC_00DN_01S_NET     : out   std_logic; 
          BUSC_00DP_00S_NET     : out   std_logic; 
          BUSC_01DN_03S_NET     : out   std_logic; 
          BUSC_01DP_02S_NET     : out   std_logic; 
          BUSC_02DN_05S_NET     : out   std_logic; 
          BUSC_02DP_04S_NET     : out   std_logic; 
          BUSC_03DN_07S_NET     : out   std_logic; 
          BUSC_03DP_06S_NET     : out   std_logic; 
          BUSC_04DN_09S_NET     : out   std_logic; 
          BUSC_04DP_08S_NET     : out   std_logic; 
          BUSC_05DN_11S_NET     : out   std_logic; 
          BUSC_05DP_10S_NET     : out   std_logic; 
          BUSC_06DN_13S_NET     : out   std_logic; 
          BUSC_06DP_12S_NET     : out   std_logic; 
          BUSC_07DN_15S_NET     : out   std_logic; 
          BUSC_07DP_14S_NET     : out   std_logic; 
          BUSC_08DN_17S_NET     : out   std_logic; 
          BUSC_08DP_16S_NET     : out   std_logic; 
          BUSC_09DN_19S_NET     : out   std_logic; 
          BUSC_09DP_18S_NET     : out   std_logic; 
          BUSC_10DN_21S_NET     : out   std_logic; 
          BUSC_10DP_20S_NET     : out   std_logic; 
          BUSC_11DN_23S_NET     : out   std_logic; 
          BUSC_11DP_22S_NET     : out   std_logic; 
          BUSC_12DN_25S_NET     : out   std_logic; 
          BUSC_12DP_24S_NET     : out   std_logic; 
          BUSC_13DN_27S_NET     : out   std_logic; 
          BUSC_13DP_26S_NET     : out   std_logic; 
          BUSC_14DN_29S_PORT    : out   std_logic; 
          BUSC_14DP_28S_PORT    : out   std_logic; 
          BUSC_15DN_31S_PORT    : out   std_logic; 
          BUSC_15DP_30S_PORT    : out   std_logic; 
          BUSC_16DN_33S_PORT    : out   std_logic; 
          BUSC_16DP_32S_NET     : out   std_logic; 
          BUSC_17DN_35S_NET     : out   std_logic; 
          BUSC_17DP_34S_NET     : out   std_logic; 
          BUSC_18DN_37S_NET     : out   std_logic; 
          BUSC_18DP_36S_NET     : out   std_logic; 
          BUSC_19DN_39S_NET     : out   std_logic; 
          BUSC_19DP_38S_NET     : out   std_logic; 
          BUSC_20DN_41S_NET     : out   std_logic; 
          BUSC_20DP_40S_NET     : out   std_logic; 
          BUSC_21DN_43S_NET_in  : out   std_logic; 
          BUSC_21DP_42S_NET     : out   std_logic; 
          BUSC_22DN_45S_NET     : out   std_logic; 
          BUSC_22DP_44S_NET     : out   std_logic; 
          BUSC_23DN_47S_NET     : out   std_logic; 
          BUSC_23DP_46S_NET     : out   std_logic; 
          BUSC_24DN_49S_PORT    : out   std_logic; 
          BUSC_24DP_48S_PORT    : out   std_logic; 
          BUSC_25DN_51S_PORT    : out   std_logic; 
          BUSC_25DP_50S_PORT    : out   std_logic; 
          BUSC_26DN_53S_PORT    : out   std_logic; 
          BUSC_26DP_52S_NET     : out   std_logic; 
          BUSC_27DN_55S_PORT    : out   std_logic; 
          BUSC_27DP_54S_NET     : out   std_logic; 
          BUSC_21DN_43S_PORT    : inout std_logic);
end u9H;

architecture BEHAVIORAL of u9H is
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
   
   component IOBUF
      port ( I  : in    std_logic; 
             IO : inout std_logic; 
             O  : out   std_logic; 
             T  : in    std_logic);
   end component;
   attribute IOSTANDARD of IOBUF : component is "DEFAULT";
   attribute CAPACITANCE of IOBUF : component is "DONT_CARE";
   attribute SLEW of IOBUF : component is "SLOW";
   attribute DRIVE of IOBUF : component is "12";
   attribute BOX_TYPE of IOBUF : component is "BLACK_BOX";
   
begin
   XLXI_2025 : IBUF
      port map (I=>BUSCHS_00DP_00S_PORT,
                O=>BUSCHS_00DP_00S_NET);
   
   XLXI_2026 : IBUF
      port map (I=>BUSC_00DP_00S_PORT,
                O=>BUSC_00DP_00S_NET);
   
   XLXI_2027 : IBUF
      port map (I=>BUSC_00DN_01S_PORT,
                O=>BUSC_00DN_01S_NET);
   
   XLXI_2028 : IBUF
      port map (I=>BUSC_01DP_02S_PORT,
                O=>BUSC_01DP_02S_NET);
   
   XLXI_2029 : IBUF
      port map (I=>BUSC_01DN_03S_PORT,
                O=>BUSC_01DN_03S_NET);
   
   XLXI_2030 : IBUF
      port map (I=>BUSC_02DP_04S_PORT,
                O=>BUSC_02DP_04S_NET);
   
   XLXI_2031 : IBUF
      port map (I=>BUSC_02DN_05S_PORT,
                O=>BUSC_02DN_05S_NET);
   
   XLXI_2032 : IBUF
      port map (I=>BUSC_03DP_06S_PORT,
                O=>BUSC_03DP_06S_NET);
   
   XLXI_2033 : IBUF
      port map (I=>BUSCHS_00DN_01S_PORT,
                O=>BUSCHS_00DN_01S_NET);
   
   XLXI_2034 : IBUF
      port map (I=>BUSC_04DP_08S_PORT,
                O=>BUSC_04DP_08S_NET);
   
   XLXI_2035 : IBUF
      port map (I=>BUSC_04DN_09S_PORT,
                O=>BUSC_04DN_09S_NET);
   
   XLXI_2036 : IBUF
      port map (I=>BUSC_05DP_10S_PORT,
                O=>BUSC_05DP_10S_NET);
   
   XLXI_2037 : IBUF
      port map (I=>BUSC_05DN_11S_PORT,
                O=>BUSC_05DN_11S_NET);
   
   XLXI_2038 : IBUF
      port map (I=>BUSC_06DP_12S_PORT,
                O=>BUSC_06DP_12S_NET);
   
   XLXI_2039 : IBUF
      port map (I=>BUSC_03DN_07S_PORT,
                O=>BUSC_03DN_07S_NET);
   
   XLXI_2040 : IBUF
      port map (I=>BUSC_06DN_13S_PORT,
                O=>BUSC_06DN_13S_NET);
   
   XLXI_2041 : IBUF
      port map (I=>BUSC_07DP_14S_PORT,
                O=>BUSC_07DP_14S_NET);
   
   XLXI_2042 : IBUF
      port map (I=>BUSC_08DP_16S_PORT,
                O=>BUSC_08DP_16S_NET);
   
   XLXI_2043 : IBUF
      port map (I=>BUSC_08DN_17S_PORT,
                O=>BUSC_08DN_17S_NET);
   
   XLXI_2044 : IBUF
      port map (I=>BUSC_09DP_18S_PORT,
                O=>BUSC_09DP_18S_NET);
   
   XLXI_2045 : IBUF
      port map (I=>BUSC_09DN_19S_PORT,
                O=>BUSC_09DN_19S_NET);
   
   XLXI_2046 : IBUF
      port map (I=>BUSC_10DP_20S_PORT,
                O=>BUSC_10DP_20S_NET);
   
   XLXI_2047 : IBUF
      port map (I=>BUSC_10DN_21S_PORT,
                O=>BUSC_10DN_21S_NET);
   
   XLXI_2048 : IBUF
      port map (I=>BUSC_11DP_22S_PORT,
                O=>BUSC_11DP_22S_NET);
   
   XLXI_2049 : IBUF
      port map (I=>BUSC_07DN_15S_PORT,
                O=>BUSC_07DN_15S_NET);
   
   XLXI_2050 : IBUF
      port map (I=>BUSC_12DP_24S_PORT,
                O=>BUSC_12DP_24S_NET);
   
   XLXI_2051 : IBUF
      port map (I=>BUSC_12DN_25S_PORT,
                O=>BUSC_12DN_25S_NET);
   
   XLXI_2052 : IBUF
      port map (I=>BUSC_13DP_26S_PORT,
                O=>BUSC_13DP_26S_NET);
   
   XLXI_2053 : IBUF
      port map (I=>BUSC_13DN_27S_PORT,
                O=>BUSC_13DN_27S_NET);
   
   XLXI_2054 : IBUF
      port map (I=>BUSCHS_01DP_02S_PORT,
                O=>BUSCHS_01DP_02S_NET);
   
   XLXI_2055 : IBUF
      port map (I=>BUSC_11DN_23S_PORT,
                O=>BUSC_11DN_23S_NET);
   
   XLXI_2056 : IBUF
      port map (I=>BUSCHS_01DN_03S_PORT,
                O=>BUSCHS_01DN_03S_NET);
   
   XLXI_2064 : IBUF
      port map (I=>BUSC_18DP_36S_PORT,
                O=>BUSC_18DP_36S_NET);
   
   XLXI_2070 : IBUF
      port map (I=>BUSCHS_02DP_04S_PORT,
                O=>BUSCHS_02DP_04S_NET);
   
   XLXI_2072 : IBUF
      port map (I=>BUSCHS_02DN_05S_PORT,
                O=>BUSCHS_02DN_05S_NET);
   
   XLXI_2073 : IBUF
      port map (I=>BUSCHS_03DP_06S_PORT,
                O=>BUSCHS_03DP_06S_NET);
   
   XLXI_2081 : IBUF
      port map (I=>BUSCHS_03DN_07S_PORT,
                O=>BUSCHS_03DN_07S_NET);
   
   XLXI_2905 : IBUF
      port map (I=>BUSC_22DP_44S_PORT,
                O=>BUSC_22DP_44S_NET);
   
   XLXI_2928 : IBUF
      port map (I=>BUSC_20DP_40S_PORT,
                O=>BUSC_20DP_40S_NET);
   
   XLXI_2929 : IBUF
      port map (I=>BUSC_20DN_41S_PORT,
                O=>BUSC_20DN_41S_NET);
   
   XLXI_2930 : IBUF
      port map (I=>BUSC_19DP_38S_PORT,
                O=>BUSC_19DP_38S_NET);
   
   XLXI_2931 : IBUF
      port map (I=>BUSC_19DN_39S_PORT,
                O=>BUSC_19DN_39S_NET);
   
   XLXI_2932 : IBUF
      port map (I=>BUSC_21DP_42S_PORT,
                O=>BUSC_21DP_42S_NET);
   
   XLXI_2934 : IBUF
      port map (I=>BUSC_22DN_45S_PORT,
                O=>BUSC_22DN_45S_NET);
   
   XLXI_2935 : IBUF
      port map (I=>BUSC_23DP_46S_PORT,
                O=>BUSC_23DP_46S_NET);
   
   XLXI_2937 : IBUF
      port map (I=>BUSC_26DP_52S_PORT,
                O=>BUSC_26DP_52S_NET);
   
   XLXI_2939 : IBUF
      port map (I=>BUSC_27DP_54S_PORT,
                O=>BUSC_27DP_54S_NET);
   
   XLXI_2942 : IBUF
      port map (I=>BUSC_23DN_47S_PORT,
                O=>BUSC_23DN_47S_NET);
   
   XLXI_2943 : IBUF
      port map (I=>BUSC_18DN_37S_PORT,
                O=>BUSC_18DN_37S_NET);
   
   XLXI_2944 : IBUF
      port map (I=>BUSC_17DP_34S_PORT,
                O=>BUSC_17DP_34S_NET);
   
   XLXI_2945 : IBUF
      port map (I=>BUSC_17DN_35S_PORT,
                O=>BUSC_17DN_35S_NET);
   
   XLXI_2947 : IBUF
      port map (I=>BUSC_16DP_32S_PORT,
                O=>BUSC_16DP_32S_NET);
   
   XLXI_2950 : OBUF
      port map (I=>BUSC_27DN_55S_NET,
                O=>BUSC_27DN_55S_PORT);
   
   XLXI_2951 : OBUF
      port map (I=>BUSC_26DN_53S_NET,
                O=>BUSC_26DN_53S_PORT);
   
   XLXI_2952 : OBUF
      port map (I=>BUSC_25DN_51S_NET,
                O=>BUSC_25DN_51S_PORT);
   
   XLXI_2953 : OBUF
      port map (I=>BUSC_25DP_50S_NET,
                O=>BUSC_25DP_50S_PORT);
   
   XLXI_2954 : OBUF
      port map (I=>BUSC_24DN_49S_NET,
                O=>BUSC_24DN_49S_PORT);
   
   XLXI_2955 : OBUF
      port map (I=>BUSC_24DP_48S_NET,
                O=>BUSC_24DP_48S_PORT);
   
   XLXI_2956 : OBUF
      port map (I=>BUSC_15DN_31S_NET,
                O=>BUSC_15DN_31S_PORT);
   
   XLXI_2957 : OBUF
      port map (I=>BUSC_15DP_30S_NET,
                O=>BUSC_15DP_30S_PORT);
   
   XLXI_2958 : OBUF
      port map (I=>BUSC_14DN_29S_NET,
                O=>BUSC_14DN_29S_PORT);
   
   XLXI_2959 : OBUF
      port map (I=>BUSC_14DP_28S_NET,
                O=>BUSC_14DP_28S_PORT);
   
   XLXI_2960 : OBUF
      port map (I=>BUSC_16DN_33S_NET,
                O=>BUSC_16DN_33S_PORT);
   
   XLXI_2976 : IOBUF
      port map (I=>BUSC_21DN_43S_NET_out,
                T=>BUSC_21DN_43S_NET_tri,
                O=>BUSC_21DN_43S_NET_in,
                IO=>BUSC_21DN_43S_PORT);
   
end BEHAVIORAL;


