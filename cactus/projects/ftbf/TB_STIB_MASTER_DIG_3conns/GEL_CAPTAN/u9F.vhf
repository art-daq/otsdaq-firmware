--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9F.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:26
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9F.sch" u9F.vhf
--Design Name: u9F
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

entity u9F is
   port ( BUSDD_00DN_01S_PORT   : in    std_logic; 
          BUSDD_00DP_00S_PORT   : in    std_logic; 
          BUSDD_01DN_03S_PORT   : in    std_logic; 
          BUSDD_01DP_02S_PORT   : in    std_logic; 
          BUSDD_02DN_05S_PORT   : in    std_logic; 
          BUSDD_02DP_04S_PORT   : in    std_logic; 
          BUSDD_03DN_07S_PORT   : in    std_logic; 
          BUSDD_03DP_06S_PORT   : in    std_logic; 
          BUSDD_04DN_09S_PORT   : in    std_logic; 
          BUSDD_04DP_08S_PORT   : in    std_logic; 
          BUSDD_05DN_11S_PORT   : in    std_logic; 
          BUSDD_05DP_10S_PORT   : in    std_logic; 
          BUSDD_06DN_13S_PORT   : in    std_logic; 
          BUSDD_06DP_12S_PORT   : in    std_logic; 
          BUSDD_07DN_15S_PORT   : in    std_logic; 
          BUSDD_07DP_14S_PORT   : in    std_logic; 
          BUSD_08DN_17S_PORT    : in    std_logic; 
          BUSD_08DP_16S_PORT    : in    std_logic; 
          BUSD_09DN_19S_PORT    : in    std_logic; 
          BUSD_09DP_18S_PORT    : in    std_logic; 
          BUSD_10DN_21S_PORT    : in    std_logic; 
          BUSD_10DP_20S_PORT    : in    std_logic; 
          BUSD_11DN_23S_PORT    : in    std_logic; 
          BUSD_11DP_22S_PORT    : in    std_logic; 
          BUSD_12DN_25S_PORT    : in    std_logic; 
          BUSD_12DP_24S_PORT    : in    std_logic; 
          BUSD_13DN_27S_PORT    : in    std_logic; 
          BUSD_13DP_26S_PORT    : in    std_logic; 
          BUSD_14DN_29S_PORT    : in    std_logic; 
          BUSD_14DP_28S_PORT    : in    std_logic; 
          BUSD_15DN_31S_PORT    : in    std_logic; 
          BUSD_15DP_30S_PORT    : in    std_logic; 
          BUSD_16DN_33S_PORT    : in    std_logic; 
          BUSD_16DP_32S_PORT    : in    std_logic; 
          BUSD_17DN_35S_PORT    : in    std_logic; 
          BUSD_17DP_34S_PORT    : in    std_logic; 
          BUSD_18DN_37S_PORT    : in    std_logic; 
          BUSD_18DP_36S_PORT    : in    std_logic; 
          BUSD_19DN_39S_PORT    : in    std_logic; 
          BUSD_19DP_38S_PORT    : in    std_logic; 
          BUSD_20DN_41S_PORT    : in    std_logic; 
          BUSD_20DP_40S_PORT    : in    std_logic; 
          BUSD_21DN_43S_PORT    : in    std_logic; 
          BUSD_21DP_42S_PORT    : in    std_logic; 
          BUSD_22DN_45S_PORT    : in    std_logic; 
          BUSD_22DP_44S_PORT    : in    std_logic; 
          BUSD_23DN_47S_PORT    : in    std_logic; 
          BUSD_23DP_46S_PORT    : in    std_logic; 
          BUSD_24DN_49S_PORT    : in    std_logic; 
          BUSD_24DP_48S_PORT    : in    std_logic; 
          BUSD_25DN_51S_PORT    : in    std_logic; 
          BUSD_25DP_50S_PORT    : in    std_logic; 
          BUSD_26DN_53S_PORT    : in    std_logic; 
          BUSD_26DP_52S_PORT    : in    std_logic; 
          BUSD_27DN_55S_PORT    : in    std_logic; 
          BUSD_27DP_54S_PORT    : in    std_logic; 
          GENERAL_00DN_01S_PORT : in    std_logic; 
          GENERAL_00DP_00S_PORT : in    std_logic; 
          GENERAL_01DN_03S_PORT : in    std_logic; 
          GENERAL_01DP_02S_PORT : in    std_logic; 
          GENERAL_02DN_05S_PORT : in    std_logic; 
          GENERAL_02DP_04S_PORT : in    std_logic; 
          GENERAL_03DN_07S_PORT : in    std_logic; 
          GENERAL_03DP_06S_NET  : in    std_logic; 
          BUSDD_00DN_01S_NET    : out   std_logic; 
          BUSDD_00DP_00S_NET    : out   std_logic; 
          BUSDD_01DN_03S_NET    : out   std_logic; 
          BUSDD_01DP_02S_NET    : out   std_logic; 
          BUSDD_02DN_05S_NET    : out   std_logic; 
          BUSDD_02DP_04S_NET    : out   std_logic; 
          BUSDD_03DN_07S_NET    : out   std_logic; 
          BUSDD_03DP_06S_NET    : out   std_logic; 
          BUSDD_04DN_09S_NET    : out   std_logic; 
          BUSDD_04DP_08S_NET    : out   std_logic; 
          BUSDD_05DN_11S_NET    : out   std_logic; 
          BUSDD_05DP_10S_NET    : out   std_logic; 
          BUSDD_06DN_13S_NET    : out   std_logic; 
          BUSDD_06DP_12S_NET    : out   std_logic; 
          BUSDD_07DN_15S_NET    : out   std_logic; 
          BUSDD_07DP_14S_NET    : out   std_logic; 
          BUSD_08DN_17S_NET     : out   std_logic; 
          BUSD_08DP_16S_NET     : out   std_logic; 
          BUSD_09DN_19S_NET     : out   std_logic; 
          BUSD_09DP_18S_NET     : out   std_logic; 
          BUSD_10DN_21S_NET     : out   std_logic; 
          BUSD_10DP_20S_NET     : out   std_logic; 
          BUSD_11DN_23S_NET     : out   std_logic; 
          BUSD_11DP_22S_NET     : out   std_logic; 
          BUSD_12DN_25S_NET     : out   std_logic; 
          BUSD_12DP_24S_NET     : out   std_logic; 
          BUSD_13DN_27S_NET     : out   std_logic; 
          BUSD_13DP_26S_NET     : out   std_logic; 
          BUSD_14DN_29S_NET     : out   std_logic; 
          BUSD_14DP_28S_NET     : out   std_logic; 
          BUSD_15DN_31S_NET     : out   std_logic; 
          BUSD_15DP_30S_NET     : out   std_logic; 
          BUSD_16DN_33S_NET     : out   std_logic; 
          BUSD_16DP_32S_NET     : out   std_logic; 
          BUSD_17DN_35S_NET     : out   std_logic; 
          BUSD_17DP_34S_NET     : out   std_logic; 
          BUSD_18DN_37S_NET     : out   std_logic; 
          BUSD_18DP_36S_NET     : out   std_logic; 
          BUSD_19DN_39S_NET     : out   std_logic; 
          BUSD_19DP_38S_NET     : out   std_logic; 
          BUSD_20DN_41S_NET     : out   std_logic; 
          BUSD_20DP_40S_NET     : out   std_logic; 
          BUSD_21DN_43S_NET     : out   std_logic; 
          BUSD_21DP_42S_NET     : out   std_logic; 
          BUSD_22DN_45S_NET     : out   std_logic; 
          BUSD_22DP_44S_NET     : out   std_logic; 
          BUSD_23DN_47S_NET     : out   std_logic; 
          BUSD_23DP_46S_NET     : out   std_logic; 
          BUSD_24DN_49S_NET     : out   std_logic; 
          BUSD_24DP_48S_NET     : out   std_logic; 
          BUSD_25DN_51S_NET     : out   std_logic; 
          BUSD_25DP_50S_NET     : out   std_logic; 
          BUSD_26DN_53S_NET     : out   std_logic; 
          BUSD_26DP_52S_NET     : out   std_logic; 
          BUSD_27DN_55S_NET     : out   std_logic; 
          BUSD_27DP_54S_NET     : out   std_logic; 
          GENERAL_00DN_01S_NET  : out   std_logic; 
          GENERAL_00DP_00S_NET  : out   std_logic; 
          GENERAL_01DN_03S_NET  : out   std_logic; 
          GENERAL_01DP_02S_NET  : out   std_logic; 
          GENERAL_02DN_05S_NET  : out   std_logic; 
          GENERAL_02DP_04S_NET  : out   std_logic; 
          GENERAL_03DN_07S_NET  : out   std_logic; 
          GENERAL_03DP_06S_PORT : out   std_logic);
end u9F;

architecture BEHAVIORAL of u9F is
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
   
   attribute IOSTANDARD of XLXI_2976 : label is "LVCMOS25";
begin
   XLXI_1846 : IBUF
      port map (I=>BUSDD_00DP_00S_PORT,
                O=>BUSDD_00DP_00S_NET);
   
   XLXI_1847 : IBUF
      port map (I=>BUSDD_01DP_02S_PORT,
                O=>BUSDD_01DP_02S_NET);
   
   XLXI_1848 : IBUF
      port map (I=>BUSDD_01DN_03S_PORT,
                O=>BUSDD_01DN_03S_NET);
   
   XLXI_1849 : IBUF
      port map (I=>BUSDD_02DP_04S_PORT,
                O=>BUSDD_02DP_04S_NET);
   
   XLXI_1850 : IBUF
      port map (I=>BUSDD_02DN_05S_PORT,
                O=>BUSDD_02DN_05S_NET);
   
   XLXI_1851 : IBUF
      port map (I=>BUSDD_03DP_06S_PORT,
                O=>BUSDD_03DP_06S_NET);
   
   XLXI_1852 : IBUF
      port map (I=>BUSDD_03DN_07S_PORT,
                O=>BUSDD_03DN_07S_NET);
   
   XLXI_1853 : IBUF
      port map (I=>BUSDD_05DP_10S_PORT,
                O=>BUSDD_05DP_10S_NET);
   
   XLXI_1854 : IBUF
      port map (I=>BUSDD_00DN_01S_PORT,
                O=>BUSDD_00DN_01S_NET);
   
   XLXI_1855 : IBUF
      port map (I=>BUSDD_04DP_08S_PORT,
                O=>BUSDD_04DP_08S_NET);
   
   XLXI_1856 : IBUF
      port map (I=>BUSDD_04DN_09S_PORT,
                O=>BUSDD_04DN_09S_NET);
   
   XLXI_1857 : IBUF
      port map (I=>BUSDD_06DP_12S_PORT,
                O=>BUSDD_06DP_12S_NET);
   
   XLXI_1858 : IBUF
      port map (I=>BUSDD_06DN_13S_PORT,
                O=>BUSDD_06DN_13S_NET);
   
   XLXI_1860 : IBUF
      port map (I=>BUSDD_05DN_11S_PORT,
                O=>BUSDD_05DN_11S_NET);
   
   XLXI_1862 : IBUF
      port map (I=>BUSDD_07DP_14S_PORT,
                O=>BUSDD_07DP_14S_NET);
   
   XLXI_1863 : IBUF
      port map (I=>BUSD_08DP_16S_PORT,
                O=>BUSD_08DP_16S_NET);
   
   XLXI_1864 : IBUF
      port map (I=>BUSD_08DN_17S_PORT,
                O=>BUSD_08DN_17S_NET);
   
   XLXI_1865 : IBUF
      port map (I=>BUSD_09DP_18S_PORT,
                O=>BUSD_09DP_18S_NET);
   
   XLXI_1866 : IBUF
      port map (I=>BUSD_09DN_19S_PORT,
                O=>BUSD_09DN_19S_NET);
   
   XLXI_1867 : IBUF
      port map (I=>BUSD_10DP_20S_PORT,
                O=>BUSD_10DP_20S_NET);
   
   XLXI_1868 : IBUF
      port map (I=>BUSD_10DN_21S_PORT,
                O=>BUSD_10DN_21S_NET);
   
   XLXI_1869 : IBUF
      port map (I=>BUSD_11DP_22S_PORT,
                O=>BUSD_11DP_22S_NET);
   
   XLXI_1870 : IBUF
      port map (I=>BUSDD_07DN_15S_PORT,
                O=>BUSDD_07DN_15S_NET);
   
   XLXI_1871 : IBUF
      port map (I=>BUSD_12DP_24S_PORT,
                O=>BUSD_12DP_24S_NET);
   
   XLXI_1872 : IBUF
      port map (I=>BUSD_12DN_25S_PORT,
                O=>BUSD_12DN_25S_NET);
   
   XLXI_1873 : IBUF
      port map (I=>BUSD_13DP_26S_PORT,
                O=>BUSD_13DP_26S_NET);
   
   XLXI_1874 : IBUF
      port map (I=>BUSD_13DN_27S_PORT,
                O=>BUSD_13DN_27S_NET);
   
   XLXI_1875 : IBUF
      port map (I=>GENERAL_01DP_02S_PORT,
                O=>GENERAL_01DP_02S_NET);
   
   XLXI_1876 : IBUF
      port map (I=>BUSD_11DN_23S_PORT,
                O=>BUSD_11DN_23S_NET);
   
   XLXI_1879 : IBUF
      port map (I=>BUSD_14DP_28S_PORT,
                O=>BUSD_14DP_28S_NET);
   
   XLXI_1880 : IBUF
      port map (I=>BUSD_14DN_29S_PORT,
                O=>BUSD_14DN_29S_NET);
   
   XLXI_1881 : IBUF
      port map (I=>BUSD_15DP_30S_PORT,
                O=>BUSD_15DP_30S_NET);
   
   XLXI_1882 : IBUF
      port map (I=>BUSD_15DN_31S_PORT,
                O=>BUSD_15DN_31S_NET);
   
   XLXI_1883 : IBUF
      port map (I=>BUSD_16DP_32S_PORT,
                O=>BUSD_16DP_32S_NET);
   
   XLXI_1884 : IBUF
      port map (I=>BUSD_16DN_33S_PORT,
                O=>BUSD_16DN_33S_NET);
   
   XLXI_1886 : IBUF
      port map (I=>GENERAL_02DN_05S_PORT,
                O=>GENERAL_02DN_05S_NET);
   
   XLXI_1887 : IBUF
      port map (I=>BUSD_18DP_36S_PORT,
                O=>BUSD_18DP_36S_NET);
   
   XLXI_1888 : IBUF
      port map (I=>BUSD_18DN_37S_PORT,
                O=>BUSD_18DN_37S_NET);
   
   XLXI_1889 : IBUF
      port map (I=>BUSD_19DP_38S_PORT,
                O=>BUSD_19DP_38S_NET);
   
   XLXI_1890 : IBUF
      port map (I=>BUSD_19DN_39S_PORT,
                O=>BUSD_19DN_39S_NET);
   
   XLXI_1891 : IBUF
      port map (I=>BUSD_20DP_40S_PORT,
                O=>BUSD_20DP_40S_NET);
   
   XLXI_1892 : IBUF
      port map (I=>BUSD_17DN_35S_PORT,
                O=>BUSD_17DN_35S_NET);
   
   XLXI_1893 : IBUF
      port map (I=>BUSD_20DN_41S_PORT,
                O=>BUSD_20DN_41S_NET);
   
   XLXI_1895 : IBUF
      port map (I=>BUSD_21DP_42S_PORT,
                O=>BUSD_21DP_42S_NET);
   
   XLXI_1896 : IBUF
      port map (I=>BUSD_21DN_43S_PORT,
                O=>BUSD_21DN_43S_NET);
   
   XLXI_1897 : IBUF
      port map (I=>BUSD_22DP_44S_PORT,
                O=>BUSD_22DP_44S_NET);
   
   XLXI_1898 : IBUF
      port map (I=>BUSD_22DN_45S_PORT,
                O=>BUSD_22DN_45S_NET);
   
   XLXI_1899 : IBUF
      port map (I=>BUSD_23DP_46S_PORT,
                O=>BUSD_23DP_46S_NET);
   
   XLXI_1900 : IBUF
      port map (I=>BUSD_23DN_47S_PORT,
                O=>BUSD_23DN_47S_NET);
   
   XLXI_1901 : IBUF
      port map (I=>BUSD_24DP_48S_PORT,
                O=>BUSD_24DP_48S_NET);
   
   XLXI_1903 : IBUF
      port map (I=>BUSD_25DP_50S_PORT,
                O=>BUSD_25DP_50S_NET);
   
   XLXI_1904 : IBUF
      port map (I=>BUSD_25DN_51S_PORT,
                O=>BUSD_25DN_51S_NET);
   
   XLXI_1905 : IBUF
      port map (I=>BUSD_26DP_52S_PORT,
                O=>BUSD_26DP_52S_NET);
   
   XLXI_1906 : IBUF
      port map (I=>BUSD_26DN_53S_PORT,
                O=>BUSD_26DN_53S_NET);
   
   XLXI_1907 : IBUF
      port map (I=>BUSD_27DP_54S_PORT,
                O=>BUSD_27DP_54S_NET);
   
   XLXI_1908 : IBUF
      port map (I=>BUSD_24DN_49S_PORT,
                O=>BUSD_24DN_49S_NET);
   
   XLXI_1909 : IBUF
      port map (I=>BUSD_27DN_55S_PORT,
                O=>BUSD_27DN_55S_NET);
   
   XLXI_2919 : IBUF
      port map (I=>GENERAL_00DP_00S_PORT,
                O=>GENERAL_00DP_00S_NET);
   
   XLXI_2920 : IBUF
      port map (I=>GENERAL_00DN_01S_PORT,
                O=>GENERAL_00DN_01S_NET);
   
   XLXI_2921 : IBUF
      port map (I=>GENERAL_02DP_04S_PORT,
                O=>GENERAL_02DP_04S_NET);
   
   XLXI_2922 : IBUF
      port map (I=>GENERAL_01DN_03S_PORT,
                O=>GENERAL_01DN_03S_NET);
   
   XLXI_2924 : IBUF
      port map (I=>GENERAL_03DN_07S_PORT,
                O=>GENERAL_03DN_07S_NET);
   
   XLXI_2975 : IBUF
      port map (I=>BUSD_17DP_34S_PORT,
                O=>BUSD_17DP_34S_NET);
   
   XLXI_2976 : OBUF
      port map (I=>GENERAL_03DP_06S_NET,
                O=>GENERAL_03DP_06S_PORT);
   
end BEHAVIORAL;


