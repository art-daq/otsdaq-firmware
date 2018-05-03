--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1.01
--  \   \         Application : sch2vhdl
--  /   /         Filename : u9B.vhf
-- /___/   /\     Timestamp : 03/17/2009 15:43:19
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx_10_1\10.1\ISE\bin\nt\unwrapped\sch2vhdl.exe -intstyle ise -family virtex4 -flat -suppress -w "C:/Documents and Settings/rrivera/Desktop/CAPTAN FIRMWARE/CMS_TB/GEL_CAPTAN/u9B.sch" u9B.vhf
--Design Name: u9B
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

entity u9B is
   port ( GENERAL_06DN_13S_PORT : in    std_logic; 
          GENERAL_06DP_12S_PORT : in    std_logic; 
          GENERAL_07DN_15S_PORT : in    std_logic; 
          GENERAL_07DP_14S_PORT : in    std_logic; 
          GENERAL_08DN_17S_PORT : in    std_logic; 
          GENERAL_08DP_16S_PORT : in    std_logic; 
          GENERAL_09DN_19S_PORT : in    std_logic; 
          GENERAL_09DP_18S_PORT : in    std_logic; 
          GENERAL_10DN_21S_PORT : in    std_logic; 
          GENERAL_10DP_20S_PORT : in    std_logic; 
          GENERAL_11DN_23S_PORT : in    std_logic; 
          GENERAL_11DP_22S_PORT : in    std_logic; 
          JTAG_TCK1_PORT        : in    std_logic; 
          JTAG_TDI1_PORT        : in    std_logic; 
          JTAG_TDO1_PORT        : in    std_logic; 
          JTAG_TMS1_PORT        : in    std_logic; 
          GENERAL_06DN_13S_NET  : out   std_logic; 
          GENERAL_06DP_12S_NET  : out   std_logic; 
          GENERAL_07DN_15S_NET  : out   std_logic; 
          GENERAL_07DP_14S_NET  : out   std_logic; 
          GENERAL_08DN_17S_NET  : out   std_logic; 
          GENERAL_08DP_16S_NET  : out   std_logic; 
          GENERAL_09DN_19S_NET  : out   std_logic; 
          GENERAL_09DP_18S_NET  : out   std_logic; 
          GENERAL_10DN_21S_NET  : out   std_logic; 
          GENERAL_10DP_20S_NET  : out   std_logic; 
          GENERAL_11DN_23S_NET  : out   std_logic; 
          GENERAL_11DP_22S_NET  : out   std_logic; 
          JTAG_TCK1_NET         : out   std_logic; 
          JTAG_TDI1_NET         : out   std_logic; 
          JTAG_TDO1_NET         : out   std_logic; 
          JTAG_TMS1_NET         : out   std_logic);
end u9B;

architecture BEHAVIORAL of u9B is
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
   XLXI_1757 : IBUF
      port map (I=>JTAG_TDI1_PORT,
                O=>JTAG_TDI1_NET);
   
   XLXI_1758 : IBUF
      port map (I=>JTAG_TDO1_PORT,
                O=>JTAG_TDO1_NET);
   
   XLXI_1759 : IBUF
      port map (I=>JTAG_TCK1_PORT,
                O=>JTAG_TCK1_NET);
   
   XLXI_1760 : IBUF
      port map (I=>JTAG_TMS1_PORT,
                O=>JTAG_TMS1_NET);
   
   XLXI_1761 : IBUF
      port map (I=>GENERAL_06DP_12S_PORT,
                O=>GENERAL_06DP_12S_NET);
   
   XLXI_1762 : IBUF
      port map (I=>GENERAL_06DN_13S_PORT,
                O=>GENERAL_06DN_13S_NET);
   
   XLXI_1763 : IBUF
      port map (I=>GENERAL_07DP_14S_PORT,
                O=>GENERAL_07DP_14S_NET);
   
   XLXI_1764 : IBUF
      port map (I=>GENERAL_07DN_15S_PORT,
                O=>GENERAL_07DN_15S_NET);
   
   XLXI_1765 : IBUF
      port map (I=>GENERAL_08DP_16S_PORT,
                O=>GENERAL_08DP_16S_NET);
   
   XLXI_1782 : IBUF
      port map (I=>GENERAL_09DP_18S_PORT,
                O=>GENERAL_09DP_18S_NET);
   
   XLXI_1783 : IBUF
      port map (I=>GENERAL_09DN_19S_PORT,
                O=>GENERAL_09DN_19S_NET);
   
   XLXI_1784 : IBUF
      port map (I=>GENERAL_10DP_20S_PORT,
                O=>GENERAL_10DP_20S_NET);
   
   XLXI_1785 : IBUF
      port map (I=>GENERAL_10DN_21S_PORT,
                O=>GENERAL_10DN_21S_NET);
   
   XLXI_1786 : IBUF
      port map (I=>GENERAL_11DP_22S_PORT,
                O=>GENERAL_11DP_22S_NET);
   
   XLXI_1787 : IBUF
      port map (I=>GENERAL_11DN_23S_PORT,
                O=>GENERAL_11DN_23S_NET);
   
   XLXI_1789 : IBUF
      port map (I=>GENERAL_08DN_17S_PORT,
                O=>GENERAL_08DN_17S_NET);
   
end BEHAVIORAL;


