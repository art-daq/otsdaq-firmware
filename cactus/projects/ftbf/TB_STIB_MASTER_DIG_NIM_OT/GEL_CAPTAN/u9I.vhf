--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9I.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:30
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9I.sch" u9I.vhf
--Design Name: u9I
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

entity u9I is
   port ( BUSBB_00DP_00S_NET    : in    std_logic; 
          BUSBB_01DP_02S_NET    : in    std_logic; 
          BUSBB_02DN_05S_PORT   : in    std_logic; 
          BUSBB_02DP_04S_NET    : in    std_logic; 
          BUSBB_03DP_06S_NET    : in    std_logic; 
          BUSBB_04DP_08S_NET    : in    std_logic; 
          BUSBB_05DN_11S_PORT   : in    std_logic; 
          BUSBB_05DP_10S_PORT   : in    std_logic; 
          BUSBB_06DN_13S_PORT   : in    std_logic; 
          BUSBB_06DP_12S_PORT   : in    std_logic; 
          BUSBB_07DN_15S_PORT   : in    std_logic; 
          BUSBB_07DP_14S_PORT   : in    std_logic; 
          BUSB_08DN_17S_PORT    : in    std_logic; 
          BUSB_08DP_16S_PORT    : in    std_logic; 
          BUSB_09DN_19S_PORT    : in    std_logic; 
          BUSB_09DP_18S_PORT    : in    std_logic; 
          BUSB_10DN_21S_PORT    : in    std_logic; 
          BUSB_10DP_20S_PORT    : in    std_logic; 
          BUSB_11DN_23S_PORT    : in    std_logic; 
          BUSB_11DP_22S_PORT    : in    std_logic; 
          BUSB_12DN_25S_PORT    : in    std_logic; 
          BUSB_12DP_24S_PORT    : in    std_logic; 
          BUSB_13DN_27S_PORT    : in    std_logic; 
          BUSB_13DP_26S_PORT    : in    std_logic; 
          BUSB_14DN_29S_PORT    : in    std_logic; 
          BUSB_14DP_28S_PORT    : in    std_logic; 
          BUSB_15DN_31S_PORT    : in    std_logic; 
          BUSB_15DP_30S_PORT    : in    std_logic; 
          BUSB_16DN_33S_PORT    : in    std_logic; 
          BUSB_16DP_32S_PORT    : in    std_logic; 
          BUSB_17DN_35S_PORT    : in    std_logic; 
          BUSB_17DP_34S_PORT    : in    std_logic; 
          BUSB_18DN_37S_PORT    : in    std_logic; 
          BUSB_18DP_36S_PORT    : in    std_logic; 
          BUSB_19DN_39S_PORT    : in    std_logic; 
          BUSB_19DP_38S_PORT    : in    std_logic; 
          BUSB_20DN_41S_PORT    : in    std_logic; 
          BUSB_20DP_40S_PORT    : in    std_logic; 
          BUSB_21DN_43S_PORT    : in    std_logic; 
          BUSB_21DP_42S_PORT    : in    std_logic; 
          BUSB_22DN_45S_PORT    : in    std_logic; 
          BUSB_22DP_44S_PORT    : in    std_logic; 
          BUSB_23DN_47S_PORT    : in    std_logic; 
          BUSB_23DP_46S_PORT    : in    std_logic; 
          BUSB_24DN_49S_PORT    : in    std_logic; 
          BUSB_24DP_48S_PORT    : in    std_logic; 
          BUSB_25DN_51S_PORT    : in    std_logic; 
          BUSB_25DP_50S_PORT    : in    std_logic; 
          BUSB_26DN_53S_PORT    : in    std_logic; 
          BUSB_26DP_52S_PORT    : in    std_logic; 
          BUSB_27DN_55S_PORT    : in    std_logic; 
          BUSB_27DP_54S_PORT    : in    std_logic; 
          GENERAL_13DN_27S_PORT : in    std_logic; 
          GENERAL_13DP_26S_PORT : in    std_logic; 
          JTAG_TCK_IO_PORT      : in    std_logic; 
          JTAG_TDI_IO_PORT      : in    std_logic; 
          JTAG_TDO_IO_PORT      : in    std_logic; 
          JTAG_TMS_IO_PORT      : in    std_logic; 
          PRIMARY_CLK_PORT      : in    std_logic; 
          SECONDARY_CLK_PORT    : in    std_logic; 
          BUSBB_00DN_01S_PORT   : out   std_logic; 
          BUSBB_00DP_00S_PORT   : out   std_logic; 
          BUSBB_01DN_03S_PORT   : out   std_logic; 
          BUSBB_01DP_02S_PORT   : out   std_logic; 
          BUSBB_02DN_05S_NET    : out   std_logic; 
          BUSBB_02DP_04S_PORT   : out   std_logic; 
          BUSBB_03DN_07S_PORT   : out   std_logic; 
          BUSBB_03DP_06S_PORT   : out   std_logic; 
          BUSBB_04DN_09S_PORT   : out   std_logic; 
          BUSBB_04DP_08S_PORT   : out   std_logic; 
          BUSBB_05DP_10S_NET    : out   std_logic; 
          BUSBB_06DN_13S_NET    : out   std_logic; 
          BUSBB_06DP_12S_NET    : out   std_logic; 
          BUSBB_07DN_15S_NET    : out   std_logic; 
          BUSBB_07DP_14S_NET    : out   std_logic; 
          BUSB_08DN_17S_NET     : out   std_logic; 
          BUSB_08DP_16S_NET     : out   std_logic; 
          BUSB_09DN_19S_NET     : out   std_logic; 
          BUSB_09DP_18S_NET     : out   std_logic; 
          BUSB_10DN_21S_NET     : out   std_logic; 
          BUSB_10DP_20S_NET     : out   std_logic; 
          BUSB_11DN_23S_NET     : out   std_logic; 
          BUSB_11DP_22S_NET     : out   std_logic; 
          BUSB_12DN_25S_NET     : out   std_logic; 
          BUSB_12DP_24S_NET     : out   std_logic; 
          BUSB_13DN_27S_NET     : out   std_logic; 
          BUSB_13DP_26S_NET     : out   std_logic; 
          BUSB_14DN_29S_NET     : out   std_logic; 
          BUSB_14DP_28S_NET     : out   std_logic; 
          BUSB_15DN_31S_NET     : out   std_logic; 
          BUSB_15DP_30S_NET     : out   std_logic; 
          BUSB_16DN_33S_NET     : out   std_logic; 
          BUSB_16DP_32S_NET     : out   std_logic; 
          BUSB_17DN_35S_NET     : out   std_logic; 
          BUSB_17DP_34S_NET     : out   std_logic; 
          BUSB_18DN_37S_NET     : out   std_logic; 
          BUSB_18DP_36S_NET     : out   std_logic; 
          BUSB_19DN_39S_NET     : out   std_logic; 
          BUSB_19DP_38S_NET     : out   std_logic; 
          BUSB_20DN_41S_NET     : out   std_logic; 
          BUSB_20DP_40S_NET     : out   std_logic; 
          BUSB_21DN_43S_NET     : out   std_logic; 
          BUSB_21DP_42S_NET     : out   std_logic; 
          BUSB_22DN_45S_NET     : out   std_logic; 
          BUSB_22DP_44S_NET     : out   std_logic; 
          BUSB_23DN_47S_NET     : out   std_logic; 
          BUSB_23DP_46S_NET     : out   std_logic; 
          BUSB_24DN_49S_NET     : out   std_logic; 
          BUSB_24DP_48S_NET     : out   std_logic; 
          BUSB_25DN_51S_NET     : out   std_logic; 
          BUSB_25DP_50S_NET     : out   std_logic; 
          BUSB_26DN_53S_NET     : out   std_logic; 
          BUSB_26DP_52S_NET     : out   std_logic; 
          BUSB_27DN_55S_NET     : out   std_logic; 
          BUSB_27DP_54S_NET     : out   std_logic; 
          GENERAL_13DN_27S_NET  : out   std_logic; 
          GENERAL_13DP_26S_NET  : out   std_logic; 
          JTAG_TCK_IO_NET       : out   std_logic; 
          JTAG_TDI_IO_NET       : out   std_logic; 
          JTAG_TDO_IO_NET       : out   std_logic; 
          JTAG_TMS_IO_NET       : out   std_logic; 
          PRIMARY_CLK_NET       : out   std_logic; 
          SECONDARY_CLK_NET     : out   std_logic);
end u9I;

architecture BEHAVIORAL of u9I is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute BOX_TYPE    : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   attribute DIFF_TERM   : string ;
   signal BUSBB_00DN_01S_NET    : std_logic;
   signal BUSBB_01DN_03S_NET    : std_logic;
   signal BUSBB_03DN_07S_NET    : std_logic;
   signal BUSBB_04DN_09S_NET    : std_logic;
   signal BUSBB_05DN_11S_NET    : std_logic;
   component IBUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component OBUFDS
      port ( I  : in    std_logic; 
             O  : out   std_logic; 
             OB : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUFDS : component is "DEFAULT";
   attribute CAPACITANCE of OBUFDS : component is "DONT_CARE";
   attribute BOX_TYPE of OBUFDS : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component IBUFDS
      -- synopsys translate_off
      generic( DIFF_TERM : boolean :=  FALSE);
      -- synopsys translate_on
      port ( I  : in    std_logic; 
             IB : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFDS : component is "DEFAULT";
   attribute CAPACITANCE of IBUFDS : component is "DONT_CARE";
   attribute DIFF_TERM of IBUFDS : component is "FALSE";
   attribute BOX_TYPE of IBUFDS : component is "BLACK_BOX";
   
   attribute DIFF_TERM of XLXI_2858 : label is "TRUE";
begin
   XLXI_34 : IBUFG
      port map (I=>PRIMARY_CLK_PORT,
                O=>PRIMARY_CLK_NET);
   
   XLXI_2223 : IBUF
      port map (I=>BUSBB_02DN_05S_PORT,
                O=>BUSBB_02DN_05S_NET);
   
   XLXI_2230 : IBUF
      port map (I=>BUSBB_06DP_12S_PORT,
                O=>BUSBB_06DP_12S_NET);
   
   XLXI_2232 : IBUF
      port map (I=>BUSBB_06DN_13S_PORT,
                O=>BUSBB_06DN_13S_NET);
   
   XLXI_2233 : IBUF
      port map (I=>BUSBB_07DP_14S_PORT,
                O=>BUSBB_07DP_14S_NET);
   
   XLXI_2234 : IBUF
      port map (I=>BUSB_08DP_16S_PORT,
                O=>BUSB_08DP_16S_NET);
   
   XLXI_2235 : IBUF
      port map (I=>BUSB_08DN_17S_PORT,
                O=>BUSB_08DN_17S_NET);
   
   XLXI_2236 : IBUF
      port map (I=>BUSB_09DP_18S_PORT,
                O=>BUSB_09DP_18S_NET);
   
   XLXI_2237 : IBUF
      port map (I=>BUSB_09DN_19S_PORT,
                O=>BUSB_09DN_19S_NET);
   
   XLXI_2238 : IBUF
      port map (I=>BUSB_10DP_20S_PORT,
                O=>BUSB_10DP_20S_NET);
   
   XLXI_2239 : IBUF
      port map (I=>BUSB_10DN_21S_PORT,
                O=>BUSB_10DN_21S_NET);
   
   XLXI_2240 : IBUF
      port map (I=>BUSB_11DP_22S_PORT,
                O=>BUSB_11DP_22S_NET);
   
   XLXI_2241 : IBUF
      port map (I=>BUSBB_07DN_15S_PORT,
                O=>BUSBB_07DN_15S_NET);
   
   XLXI_2242 : IBUF
      port map (I=>BUSB_12DP_24S_PORT,
                O=>BUSB_12DP_24S_NET);
   
   XLXI_2243 : IBUF
      port map (I=>BUSB_12DN_25S_PORT,
                O=>BUSB_12DN_25S_NET);
   
   XLXI_2244 : IBUF
      port map (I=>BUSB_13DP_26S_PORT,
                O=>BUSB_13DP_26S_NET);
   
   XLXI_2245 : IBUF
      port map (I=>BUSB_13DN_27S_PORT,
                O=>BUSB_13DN_27S_NET);
   
   XLXI_2246 : IBUF
      port map (I=>GENERAL_13DP_26S_PORT,
                O=>GENERAL_13DP_26S_NET);
   
   XLXI_2247 : IBUF
      port map (I=>BUSB_11DN_23S_PORT,
                O=>BUSB_11DN_23S_NET);
   
   XLXI_2248 : IBUF
      port map (I=>GENERAL_13DN_27S_PORT,
                O=>GENERAL_13DN_27S_NET);
   
   XLXI_2252 : IBUF
      port map (I=>BUSB_16DP_32S_PORT,
                O=>BUSB_16DP_32S_NET);
   
   XLXI_2253 : IBUF
      port map (I=>BUSB_16DN_33S_PORT,
                O=>BUSB_16DN_33S_NET);
   
   XLXI_2254 : IBUF
      port map (I=>BUSB_17DP_34S_PORT,
                O=>BUSB_17DP_34S_NET);
   
   XLXI_2255 : IBUF
      port map (I=>BUSB_17DN_35S_PORT,
                O=>BUSB_17DN_35S_NET);
   
   XLXI_2256 : IBUF
      port map (I=>BUSB_18DP_36S_PORT,
                O=>BUSB_18DP_36S_NET);
   
   XLXI_2258 : IBUF
      port map (I=>BUSB_19DP_38S_PORT,
                O=>BUSB_19DP_38S_NET);
   
   XLXI_2259 : IBUF
      port map (I=>BUSB_19DN_39S_PORT,
                O=>BUSB_19DN_39S_NET);
   
   XLXI_2260 : IBUF
      port map (I=>BUSB_20DP_40S_PORT,
                O=>BUSB_20DP_40S_NET);
   
   XLXI_2261 : IBUF
      port map (I=>BUSB_20DN_41S_PORT,
                O=>BUSB_20DN_41S_NET);
   
   XLXI_2262 : IBUF
      port map (I=>JTAG_TMS_IO_PORT,
                O=>JTAG_TMS_IO_NET);
   
   XLXI_2263 : IBUF
      port map (I=>BUSB_18DN_37S_PORT,
                O=>BUSB_18DN_37S_NET);
   
   XLXI_2264 : IBUF
      port map (I=>JTAG_TDI_IO_PORT,
                O=>JTAG_TDI_IO_NET);
   
   XLXI_2265 : IBUF
      port map (I=>JTAG_TDO_IO_PORT,
                O=>JTAG_TDO_IO_NET);
   
   XLXI_2266 : IBUF
      port map (I=>BUSB_21DP_42S_PORT,
                O=>BUSB_21DP_42S_NET);
   
   XLXI_2267 : IBUF
      port map (I=>BUSB_21DN_43S_PORT,
                O=>BUSB_21DN_43S_NET);
   
   XLXI_2268 : IBUF
      port map (I=>BUSB_22DP_44S_PORT,
                O=>BUSB_22DP_44S_NET);
   
   XLXI_2269 : IBUF
      port map (I=>BUSB_22DN_45S_PORT,
                O=>BUSB_22DN_45S_NET);
   
   XLXI_2270 : IBUF
      port map (I=>BUSB_23DP_46S_PORT,
                O=>BUSB_23DP_46S_NET);
   
   XLXI_2271 : IBUF
      port map (I=>BUSB_23DN_47S_PORT,
                O=>BUSB_23DN_47S_NET);
   
   XLXI_2273 : IBUF
      port map (I=>JTAG_TCK_IO_PORT,
                O=>JTAG_TCK_IO_NET);
   
   XLXI_2274 : IBUF
      port map (I=>BUSB_25DP_50S_PORT,
                O=>BUSB_25DP_50S_NET);
   
   XLXI_2275 : IBUF
      port map (I=>BUSB_25DN_51S_PORT,
                O=>BUSB_25DN_51S_NET);
   
   XLXI_2277 : IBUF
      port map (I=>BUSB_26DN_53S_PORT,
                O=>BUSB_26DN_53S_NET);
   
   XLXI_2278 : IBUF
      port map (I=>BUSB_27DP_54S_PORT,
                O=>BUSB_27DP_54S_NET);
   
   XLXI_2279 : IBUF
      port map (I=>BUSB_24DN_49S_PORT,
                O=>BUSB_24DN_49S_NET);
   
   XLXI_2280 : IBUF
      port map (I=>BUSB_27DN_55S_PORT,
                O=>BUSB_27DN_55S_NET);
   
   XLXI_2805 : IBUFG
      port map (I=>SECONDARY_CLK_PORT,
                O=>SECONDARY_CLK_NET);
   
   XLXI_2824 : IBUF
      port map (I=>BUSB_14DP_28S_PORT,
                O=>BUSB_14DP_28S_NET);
   
   XLXI_2825 : IBUF
      port map (I=>BUSB_14DN_29S_PORT,
                O=>BUSB_14DN_29S_NET);
   
   XLXI_2826 : IBUF
      port map (I=>BUSB_15DP_30S_PORT,
                O=>BUSB_15DP_30S_NET);
   
   XLXI_2827 : IBUF
      port map (I=>BUSB_15DN_31S_PORT,
                O=>BUSB_15DN_31S_NET);
   
   XLXI_2849 : IBUF
      port map (I=>BUSB_26DP_52S_PORT,
                O=>BUSB_26DP_52S_NET);
   
   XLXI_2850 : IBUF
      port map (I=>BUSB_24DP_48S_PORT,
                O=>BUSB_24DP_48S_NET);
   
   XLXI_2852 : OBUFDS
      port map (I=>BUSBB_00DP_00S_NET,
                O=>BUSBB_00DP_00S_PORT,
                OB=>BUSBB_00DN_01S_PORT);
   
   XLXI_2853 : OBUFDS
      port map (I=>BUSBB_01DP_02S_NET,
                O=>BUSBB_01DP_02S_PORT,
                OB=>BUSBB_01DN_03S_PORT);
   
   XLXI_2854 : OBUF
      port map (I=>BUSBB_02DP_04S_NET,
                O=>BUSBB_02DP_04S_PORT);
   
   XLXI_2857 : OBUFDS
      port map (I=>BUSBB_04DP_08S_NET,
                O=>BUSBB_04DP_08S_PORT,
                OB=>BUSBB_04DN_09S_PORT);
   
   XLXI_2858 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSBB_05DP_10S_PORT,
                IB=>BUSBB_05DN_11S_PORT,
                O=>BUSBB_05DP_10S_NET);
   
   XLXI_2859 : OBUFDS
      port map (I=>BUSBB_03DP_06S_NET,
                O=>BUSBB_03DP_06S_PORT,
                OB=>BUSBB_03DN_07S_PORT);
   
end BEHAVIORAL;


