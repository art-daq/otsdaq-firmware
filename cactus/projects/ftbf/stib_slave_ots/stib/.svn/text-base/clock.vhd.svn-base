----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Package Name:   clock
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    This defines the interface to the clock slave.
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
library stib;
USE stib.iobus.all;

PACKAGE clock IS

  COMPONENT clock_interface IS
    PORT (
      CLK : IN STD_LOGIC;
      BUSCLK : IN STD_LOGIC;
      IOBUS : IN iobus_t;
      WRITE_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      IOBUS_READY : OUT STD_LOGIC;
      ONEPPS : OUT STD_LOGIC
    ); 
  END COMPONENT;

END PACKAGE clock;
