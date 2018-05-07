--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    iobus_interface - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Interface between MicroBlaze LMB and slaves
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library stib;
use stib.iobus.all;

ENTITY iobus_interface IS
  GENERIC (
    NSLAVE : INTEGER := 1
  );
  PORT (
    CLK : IN STD_LOGIC;
    MASTER : IN iobus_t;
    IO_READ_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IO_READY : OUT STD_LOGIC;
    SLAVE : OUT iobus_array_t(NSLAVE-1 DOWNTO 0);
    IO_WRITE_DATA : IN data_array_t(NSLAVE-1 DOWNTO 0);
    SLAVE_READY : IN ready_array_t(NSLAVE-1 DOWNTO 0)
  );
END iobus_interface;

ARCHITECTURE RTL OF iobus_interface IS
  SIGNAL READY : STD_LOGIC;
  SIGNAL NOT_READY : STD_LOGIC;
BEGIN

  G: FOR I IN 0 TO NSLAVE-1 GENERATE
    slave(I).IO_Addr_strobe <= master.IO_Addr_strobe;
    slave(I).IO_Read_strobe <= master.IO_Read_strobe;
    slave(I).IO_Write_strobe <= master.IO_Write_strobe;
    slave(I).IO_Address <= master.IO_Address;
    slave(I).IO_Byte_Enable <= master.IO_Byte_Enable;
    slave(I).IO_Write_Data <= master.IO_Write_Data;
  END GENERATE;

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN
      NOT_READY <= master.IO_Addr_strobe;
    END IF;
  END PROCESS;

  PROCESS ( SLAVE_READY, IO_WRITE_DATA, NOT_READY )
    VARIABLE READY : STD_LOGIC;
    VARIABLE DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  BEGIN
    READY := NOT_READY;
    DATA := X"F8F8F8F8";
    FOR I IN 0 TO NSLAVE-1 LOOP
      IF ( SLAVE_READY(I) = '1' ) THEN
        READY := '1';
        DATA := IO_WRITE_DATA(I);
        EXIT;
      END IF;
    END LOOP;
    IO_READY <= READY;
    IO_READ_DATA <= DATA;
  END PROCESS;

END RTL;
