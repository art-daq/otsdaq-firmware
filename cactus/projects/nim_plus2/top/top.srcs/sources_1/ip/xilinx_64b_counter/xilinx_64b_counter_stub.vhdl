-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Thu Jan 17 12:38:08 2019
-- Host        : rulinux03.dhcp.fnal.gov running 64-bit Scientific Linux Fermi release 6.9 (Ramsey)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/nim_plus2/top/top.srcs/sources_1/ip/xilinx_64b_counter/xilinx_64b_counter_stub.vhdl
-- Design      : xilinx_64b_counter
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinx_64b_counter is
  Port ( 
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end xilinx_64b_counter;

architecture stub of xilinx_64b_counter is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,CE,SCLR,Q[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_counter_binary_v12_0,Vivado 2015.2";
begin
end;
