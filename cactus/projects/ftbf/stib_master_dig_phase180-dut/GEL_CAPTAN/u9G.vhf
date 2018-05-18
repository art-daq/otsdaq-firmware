--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9G.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9G.sch" u9G.vhf
--Design Name: u9G
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

entity u9G is
   port ( BUSAHS_00DN_01S_PORT : in    std_logic; 
          BUSAHS_00DP_00S_PORT : in    std_logic; 
          BUSAHS_01DN_03S_PORT : in    std_logic; 
          BUSAHS_01DP_02S_PORT : in    std_logic; 
          BUSAHS_02DN_05S_NET  : in    std_logic; 
          BUSAHS_02DP_04S_PORT : in    std_logic; 
          BUSAHS_03DN_07S_PORT : in    std_logic; 
          BUSAHS_03DP_06S_PORT : in    std_logic; 
          BUSA_00DN_01S_PORT   : in    std_logic; 
          BUSA_00DP_00S_PORT   : in    std_logic; 
          BUSA_01DN_03S_PORT   : in    std_logic; 
          BUSA_01DP_02S_PORT   : in    std_logic; 
          BUSA_02DN_05S_PORT   : in    std_logic; 
          BUSA_02DP_04S_PORT   : in    std_logic; 
          BUSA_03DN_07S_PORT   : in    std_logic; 
          BUSA_03DP_06S_PORT   : in    std_logic; 
          BUSA_04DN_09S_PORT   : in    std_logic; 
          BUSA_04DP_08S_PORT   : in    std_logic; 
          BUSA_05DN_11S_PORT   : in    std_logic; 
          BUSA_05DP_10S_PORT   : in    std_logic; 
          BUSA_06DN_13S_PORT   : in    std_logic; 
          BUSA_06DP_12S_PORT   : in    std_logic; 
          BUSA_07DN_15S_PORT   : in    std_logic; 
          BUSA_07DP_14S_PORT   : in    std_logic; 
          BUSA_08DN_17S_PORT   : in    std_logic; 
          BUSA_08DP_16S_PORT   : in    std_logic; 
          BUSA_09DN_19S_PORT   : in    std_logic; 
          BUSA_09DP_18S_PORT   : in    std_logic; 
          BUSA_10DN_21S_PORT   : in    std_logic; 
          BUSA_10DP_20S_PORT   : in    std_logic; 
          BUSA_11DN_23S_PORT   : in    std_logic; 
          BUSA_11DP_22S_PORT   : in    std_logic; 
          BUSA_12DN_25S_PORT   : in    std_logic; 
          BUSA_12DP_24S_PORT   : in    std_logic; 
          BUSA_13DN_27S_PORT   : in    std_logic; 
          BUSA_13DP_26S_PORT   : in    std_logic; 
          BUSA_14DN_29S_PORT   : in    std_logic; 
          BUSA_14DP_28S_PORT   : in    std_logic; 
          BUSA_15DN_31S_PORT   : in    std_logic; 
          BUSA_15DP_30S_PORT   : in    std_logic; 
          BUSA_16DN_33S_PORT   : in    std_logic; 
          BUSA_16DP_32S_PORT   : in    std_logic; 
          BUSA_17DN_35S_PORT   : in    std_logic; 
          BUSA_17DP_34S_PORT   : in    std_logic; 
          BUSA_18DN_37S_PORT   : in    std_logic; 
          BUSA_18DP_36S_PORT   : in    std_logic; 
          BUSA_19DN_39S_PORT   : in    std_logic; 
          BUSA_19DP_38S_PORT   : in    std_logic; 
          BUSA_20DN_41S_PORT   : in    std_logic; 
          BUSA_20DP_40S_PORT   : in    std_logic; 
          BUSA_21DN_43S_PORT   : in    std_logic; 
          BUSA_21DP_42S_PORT   : in    std_logic; 
          BUSA_22DN_45S_PORT   : in    std_logic; 
          BUSA_22DP_44S_PORT   : in    std_logic; 
          BUSA_23DN_47S_PORT   : in    std_logic; 
          BUSA_23DP_46S_PORT   : in    std_logic; 
          BUSA_24DN_49S_PORT   : in    std_logic; 
          BUSA_24DP_48S_PORT   : in    std_logic; 
          BUSA_25DN_51S_PORT   : in    std_logic; 
          BUSA_25DP_50S_PORT   : in    std_logic; 
          BUSA_26DN_53S_PORT   : in    std_logic; 
          BUSA_26DP_52S_PORT   : in    std_logic; 
          BUSA_27DN_55S_PORT   : in    std_logic; 
          BUSA_27DP_54S_PORT   : in    std_logic; 
          BUSAHS_00DPN_NET     : out   std_logic; 
          BUSAHS_01DPN_NET     : out   std_logic; 
          BUSAHS_02DN_05S_PORT : out   std_logic; 
          BUSAHS_02DP_04S_NET  : out   std_logic; 
          BUSAHS_03DN_07S_NET  : out   std_logic; 
          BUSAHS_03DP_06S_NET  : out   std_logic; 
          BUSA_00DN_01S_NET    : out   std_logic; 
          BUSA_00DP_00S_NET    : out   std_logic; 
          BUSA_01DN_03S_NET    : out   std_logic; 
          BUSA_01DP_02S_NET    : out   std_logic; 
          BUSA_02DN_05S_NET    : out   std_logic; 
          BUSA_02DP_04S_NET    : out   std_logic; 
          BUSA_03DN_07S_NET    : out   std_logic; 
          BUSA_03DP_06S_NET    : out   std_logic; 
          BUSA_04DN_09S_NET    : out   std_logic; 
          BUSA_04DP_08S_NET    : out   std_logic; 
          BUSA_05DN_11S_NET    : out   std_logic; 
          BUSA_05DP_10S_NET    : out   std_logic; 
          BUSA_06DN_13S_NET    : out   std_logic; 
          BUSA_06DP_12S_NET    : out   std_logic; 
          BUSA_07DN_15S_NET    : out   std_logic; 
          BUSA_07DP_14S_NET    : out   std_logic; 
          BUSA_08DN_17S_NET    : out   std_logic; 
          BUSA_08DP_16S_NET    : out   std_logic; 
          BUSA_09DPN_NET       : out   std_logic; 
          BUSA_10DPN_NET       : out   std_logic; 
          BUSA_11DN_23S_NET    : out   std_logic; 
          BUSA_11DP_22S_NET    : out   std_logic; 
          BUSA_12DN_25S_NET    : out   std_logic; 
          BUSA_12DP_24S_NET    : out   std_logic; 
          BUSA_13DN_27S_NET    : out   std_logic; 
          BUSA_13DP_26S_NET    : out   std_logic; 
          BUSA_14DN_29S_NET    : out   std_logic; 
          BUSA_14DP_28S_NET    : out   std_logic; 
          BUSA_15DN_31S_NET    : out   std_logic; 
          BUSA_15DP_30S_NET    : out   std_logic; 
          BUSA_16DPN_32S_NET   : out   std_logic; 
          BUSA_17DPN_32S_NET   : out   std_logic; 
          BUSA_18DPN_32S_NET   : out   std_logic; 
          BUSA_19DPN_32S_NET   : out   std_logic; 
          BUSA_20DPN_32S_NET   : out   std_logic; 
          BUSA_21DPN_32S_NET   : out   std_logic; 
          BUSA_22DPN_32S_NET   : out   std_logic; 
          BUSA_23DPN_32S_NET   : out   std_logic; 
          BUSA_24DN_49S_NET    : out   std_logic; 
          BUSA_24DP_48S_NET    : out   std_logic; 
          BUSA_25DN_51S_NET    : out   std_logic; 
          BUSA_25DP_50S_NET    : out   std_logic; 
          BUSA_26DN_53S_NET    : out   std_logic; 
          BUSA_26DP_52S_NET    : out   std_logic; 
          BUSA_27DN_55S_NET    : out   std_logic; 
          BUSA_27DP_54S_NET    : out   std_logic);
end u9G;

architecture BEHAVIORAL of u9G is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute DIFF_TERM   : string ;
   attribute BOX_TYPE    : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   signal BUSA_16DN_33S_NET    : std_logic;
   signal BUSA_16DP_32S_NET    : std_logic;
   signal BUSA_17DN_35S_NET    : std_logic;
   signal BUSA_17DP_34S_NET    : std_logic;
   signal BUSA_18DN_37S_NET    : std_logic;
   signal BUSA_18DP_36S_NET    : std_logic;
   signal BUSA_19DN_39S_NET    : std_logic;
   signal BUSA_19DP_38S_NET    : std_logic;
   signal BUSA_20DN_41S_NET    : std_logic;
   signal BUSA_20DP_40S_NET    : std_logic;
   signal BUSA_21DN_43S_NET    : std_logic;
   signal BUSA_21DP_42S_NET    : std_logic;
   signal BUSA_22DN_45S_NET    : std_logic;
   signal BUSA_22DP_44S_NET    : std_logic;
   signal BUSA_23DN_47S_NET    : std_logic;
   signal BUSA_23DP_46S_NET    : std_logic;
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
   
   attribute DIFF_TERM of ADC_IBUFDS1 : label is "TRUE";
   attribute DIFF_TERM of ADC_IBUFDS2 : label is "TRUE";
   attribute DIFF_TERM of ADC_IBUFDS3 : label is "TRUE";
   attribute IOSTANDARD of XLXI_2996 : label is "LVCMOS25";
   attribute DRIVE of XLXI_2996 : label is "6";
   attribute DIFF_TERM of XLXI_2998 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3005 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3006 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3007 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3008 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3009 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3010 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3011 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3012 : label is "TRUE";
begin
   ADC_IBUFDS1 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSAHS_00DP_00S_PORT,
                IB=>BUSAHS_00DN_01S_PORT,
                O=>BUSAHS_00DPN_NET);
   
   ADC_IBUFDS2 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSAHS_01DP_02S_PORT,
                IB=>BUSAHS_01DN_03S_PORT,
                O=>BUSAHS_01DPN_NET);
   
   ADC_IBUFDS3 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_16DP_32S_PORT,
                IB=>BUSA_16DN_33S_PORT,
                O=>BUSA_16DPN_32S_NET);
   
   XLXI_1910 : IBUF
      port map (I=>BUSA_00DP_00S_PORT,
                O=>BUSA_00DP_00S_NET);
   
   XLXI_1911 : IBUF
      port map (I=>BUSA_01DP_02S_PORT,
                O=>BUSA_01DP_02S_NET);
   
   XLXI_1912 : IBUF
      port map (I=>BUSA_01DN_03S_PORT,
                O=>BUSA_01DN_03S_NET);
   
   XLXI_1913 : IBUF
      port map (I=>BUSA_02DP_04S_PORT,
                O=>BUSA_02DP_04S_NET);
   
   XLXI_1914 : IBUF
      port map (I=>BUSA_02DN_05S_PORT,
                O=>BUSA_02DN_05S_NET);
   
   XLXI_1915 : IBUF
      port map (I=>BUSA_03DP_06S_PORT,
                O=>BUSA_03DP_06S_NET);
   
   XLXI_1916 : IBUF
      port map (I=>BUSA_03DN_07S_PORT,
                O=>BUSA_03DN_07S_NET);
   
   XLXI_1917 : IBUF
      port map (I=>BUSA_04DP_08S_PORT,
                O=>BUSA_04DP_08S_NET);
   
   XLXI_1918 : IBUF
      port map (I=>BUSA_00DN_01S_PORT,
                O=>BUSA_00DN_01S_NET);
   
   XLXI_1919 : IBUF
      port map (I=>BUSA_05DP_10S_PORT,
                O=>BUSA_05DP_10S_NET);
   
   XLXI_1920 : IBUF
      port map (I=>BUSA_05DN_11S_PORT,
                O=>BUSA_05DN_11S_NET);
   
   XLXI_1921 : IBUF
      port map (I=>BUSA_06DP_12S_PORT,
                O=>BUSA_06DP_12S_NET);
   
   XLXI_1922 : IBUF
      port map (I=>BUSA_06DN_13S_PORT,
                O=>BUSA_06DN_13S_NET);
   
   XLXI_1924 : IBUF
      port map (I=>BUSA_04DN_09S_PORT,
                O=>BUSA_04DN_09S_NET);
   
   XLXI_1926 : IBUF
      port map (I=>BUSA_07DP_14S_PORT,
                O=>BUSA_07DP_14S_NET);
   
   XLXI_1933 : IBUF
      port map (I=>BUSA_11DP_22S_PORT,
                O=>BUSA_11DP_22S_NET);
   
   XLXI_1934 : IBUF
      port map (I=>BUSA_07DN_15S_PORT,
                O=>BUSA_07DN_15S_NET);
   
   XLXI_1935 : IBUF
      port map (I=>BUSA_12DP_24S_PORT,
                O=>BUSA_12DP_24S_NET);
   
   XLXI_1936 : IBUF
      port map (I=>BUSA_12DN_25S_PORT,
                O=>BUSA_12DN_25S_NET);
   
   XLXI_1937 : IBUF
      port map (I=>BUSA_13DP_26S_PORT,
                O=>BUSA_13DP_26S_NET);
   
   XLXI_1938 : IBUF
      port map (I=>BUSA_13DN_27S_PORT,
                O=>BUSA_13DN_27S_NET);
   
   XLXI_1940 : IBUF
      port map (I=>BUSA_11DN_23S_PORT,
                O=>BUSA_11DN_23S_NET);
   
   XLXI_1942 : IBUF
      port map (I=>BUSAHS_02DP_04S_PORT,
                O=>BUSAHS_02DP_04S_NET);
   
   XLXI_1943 : IBUF
      port map (I=>BUSA_14DP_28S_PORT,
                O=>BUSA_14DP_28S_NET);
   
   XLXI_1944 : IBUF
      port map (I=>BUSA_14DN_29S_PORT,
                O=>BUSA_14DN_29S_NET);
   
   XLXI_1945 : IBUF
      port map (I=>BUSA_15DP_30S_PORT,
                O=>BUSA_15DP_30S_NET);
   
   XLXI_1946 : IBUF
      port map (I=>BUSA_15DN_31S_PORT,
                O=>BUSA_15DN_31S_NET);
   
   XLXI_1958 : IBUF
      port map (I=>BUSAHS_03DP_06S_PORT,
                O=>BUSAHS_03DP_06S_NET);
   
   XLXI_1965 : IBUF
      port map (I=>BUSA_24DP_48S_PORT,
                O=>BUSA_24DP_48S_NET);
   
   XLXI_1966 : IBUF
      port map (I=>BUSAHS_03DN_07S_PORT,
                O=>BUSAHS_03DN_07S_NET);
   
   XLXI_1967 : IBUF
      port map (I=>BUSA_25DP_50S_PORT,
                O=>BUSA_25DP_50S_NET);
   
   XLXI_1968 : IBUF
      port map (I=>BUSA_25DN_51S_PORT,
                O=>BUSA_25DN_51S_NET);
   
   XLXI_1970 : IBUF
      port map (I=>BUSA_26DN_53S_PORT,
                O=>BUSA_26DN_53S_NET);
   
   XLXI_1971 : IBUF
      port map (I=>BUSA_27DP_54S_PORT,
                O=>BUSA_27DP_54S_NET);
   
   XLXI_1972 : IBUF
      port map (I=>BUSA_24DN_49S_PORT,
                O=>BUSA_24DN_49S_NET);
   
   XLXI_1973 : IBUF
      port map (I=>BUSA_27DN_55S_PORT,
                O=>BUSA_27DN_55S_NET);
   
   XLXI_2838 : IBUF
      port map (I=>BUSA_26DP_52S_PORT,
                O=>BUSA_26DP_52S_NET);
   
   XLXI_2925 : IBUF
      port map (I=>BUSA_08DP_16S_PORT,
                O=>BUSA_08DP_16S_NET);
   
   XLXI_2988 : IBUF
      port map (I=>BUSA_08DN_17S_PORT,
                O=>BUSA_08DN_17S_NET);
   
   XLXI_2996 : OBUF
      port map (I=>BUSAHS_02DN_05S_NET,
                O=>BUSAHS_02DN_05S_PORT);
   
   XLXI_2998 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_17DP_34S_PORT,
                IB=>BUSA_17DN_35S_PORT,
                O=>BUSA_17DPN_32S_NET);
   
   XLXI_3005 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_18DP_36S_PORT,
                IB=>BUSA_18DN_37S_PORT,
                O=>BUSA_18DPN_32S_NET);
   
   XLXI_3006 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_19DP_38S_PORT,
                IB=>BUSA_19DN_39S_PORT,
                O=>BUSA_19DPN_32S_NET);
   
   XLXI_3007 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_20DP_40S_PORT,
                IB=>BUSA_20DN_41S_PORT,
                O=>BUSA_20DPN_32S_NET);
   
   XLXI_3008 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_21DP_42S_PORT,
                IB=>BUSA_21DN_43S_PORT,
                O=>BUSA_21DPN_32S_NET);
   
   XLXI_3009 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_22DP_44S_PORT,
                IB=>BUSA_22DN_45S_PORT,
                O=>BUSA_22DPN_32S_NET);
   
   XLXI_3010 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_23DP_46S_PORT,
                IB=>BUSA_23DN_47S_PORT,
                O=>BUSA_23DPN_32S_NET);
   
   XLXI_3011 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_09DP_18S_PORT,
                IB=>BUSA_09DN_19S_PORT,
                O=>BUSA_09DPN_NET);
   
   XLXI_3012 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSA_10DP_20S_PORT,
                IB=>BUSA_10DN_21S_PORT,
                O=>BUSA_10DPN_NET);
   
end BEHAVIORAL;


