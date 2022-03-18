----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Package Name:   iobus
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    This defines the interface for slaves to connect
--                 to the MicroBlaze Local Memory Bus.
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

PACKAGE iobus IS

  TYPE iobus_t IS
    RECORD
      IO_Addr_Strobe : STD_LOGIC;
      IO_Read_Strobe : STD_LOGIC;
      IO_Write_Strobe : STD_LOGIC;
      IO_Address : STD_LOGIC_VECTOR(31 DOWNTO 0);
      IO_Byte_Enable : STD_LOGIC_VECTOR(3 DOWNTO 0);
      IO_Write_Data : STD_LOGIC_VECTOR(31 DOWNTO 0);
    END RECORD;
  TYPE iobus_array_t IS ARRAY(INTEGER RANGE <>) OF iobus_t;
  TYPE data_array_t IS ARRAY(INTEGER RANGE <>) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  TYPE ready_array_t IS ARRAY(INTEGER RANGE <>) OF STD_LOGIC;

  COMPONENT iobus_interface IS
    GENERIC (
      NSLAVE : INTEGER := 1
    );
    PORT (
      CLK : IN STD_LOGIC;
      MASTER : IN iobus_t;
      IO_READ_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      IO_READY : OUT STD_LOGIC;
      SLAVE : OUT iobus_array_t;
      IO_WRITE_DATA : IN data_array_t;
      SLAVE_READY : IN ready_array_t
    );
  END COMPONENT;


END PACKAGE iobus;
