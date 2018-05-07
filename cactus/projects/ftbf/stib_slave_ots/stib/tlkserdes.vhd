----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    07:22:16 12/15/2013 
-- Design Name:    stib
-- Package Name:   tlkserdes
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    This defines the interface to the TLK3101 serdes device
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

PACKAGE tlkserdes IS

  COMPONENT tlkserdes_interface IS
    PORT (
      BUSCLK : IN STD_LOGIC;
      IOBUS : IN iobus_t;
      WRITE_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      IOBUS_READY : OUT STD_LOGIC;
      STRIP_DATA_CLK : IN STD_LOGIC;
      STRIP_DATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      STRIP_DATA_WE : IN STD_LOGIC;
      ENABLE : OUT STD_LOGIC;
      TESTEN : OUT STD_LOGIC;
      LOOPEN : OUT STD_LOGIC;
      PRBSEN : OUT STD_LOGIC;
      LCKREFN : OUT STD_LOGIC;
      PREM : OUT STD_LOGIC;
      GTXCLK : OUT STD_LOGIC;
      RXCLK : IN STD_LOGIC;
      RXDV : IN STD_LOGIC;
      RXER : IN STD_LOGIC;
      RXD : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TXEN : OUT STD_LOGIC;
      TXER : OUT STD_LOGIC;
      TXD : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      ENABLEN : OUT STD_LOGIC;
      TXDIS : OUT STD_LOGIC;
      RATESEL : OUT STD_LOGIC;
      TXFAULT : IN STD_LOGIC;
      MODULE_ABSENT : IN STD_LOGIC;
      LOSS_OF_SYNC : IN STD_LOGIC
    ); 
  END COMPONENT;

END PACKAGE tlkserdes;
