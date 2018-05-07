----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Package Name:   gbe
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    This defines the interface to the GbE slave.
--                 Its main purpose is to define the functions
--                 used to parse the generic parameters.
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
use IEEE.NUMERIC_STD.all;
library stib;
USE stib.iobus.all;

PACKAGE gbe IS

  FUNCTION char_to_digit( C : CHARACTER ) RETURN NATURAL;
  FUNCTION char_to_hex_digit( C : CHARACTER ) RETURN STD_LOGIC_VECTOR;
  FUNCTION string_to_hwaddr( ADDR : STRING ) RETURN STD_LOGIC_VECTOR;
  FUNCTION string_to_ipaddr( ADDR : STRING ) RETURN STD_LOGIC_VECTOR;

  COMPONENT gbe_interface IS
    GENERIC (
      MAC_ADDRESS : STRING := "00:00:00:00:00:00";
      IP_ADDRESS : STRING := "0.0.0.0";
      NETMASK : STRING := "0.0.0.0";
      GATEWAY : STRING := "0.0.0.0";
      JUMPERS : BOOLEAN := FALSE;
      DHCP : BOOLEAN := FALSE
    );
    PORT (
      RESET : OUT STD_LOGIC;
      RXCLK : IN STD_LOGIC;
      RXD : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      RXDV : IN STD_LOGIC;
      RXER : IN STD_LOGIC;
      TXCLK : OUT STD_LOGIC;
      TXD : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      TXEN : OUT STD_LOGIC;
      TXER : OUT STD_LOGIC;
      JUMPERED_ADDRESS : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      BUSCLK : IN STD_LOGIC;
      IOBUS : IN iobus_t;
      WRITE_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      IOBUS_READY : OUT STD_LOGIC;
      INTERRUPT : OUT STD_LOGIC;
      STREAM_READ_ENABLE : OUT STD_LOGIC;
      STREAM_DOUT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      STREAM_LENGTH : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STREAM_CKSUM : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STREAM_STROBE : IN STD_LOGIC;
      STREAM_READY : OUT STD_LOGIC;
      DEBUG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    ); 
  END COMPONENT;

END PACKAGE gbe;

PACKAGE BODY gbe IS

  FUNCTION char_to_digit( C : CHARACTER ) RETURN NATURAL IS
  BEGIN
    CASE C IS
      WHEN '0' => RETURN 0;
      WHEN '1' => RETURN 1;
      WHEN '2' => RETURN 2;
      WHEN '3' => RETURN 3;
      WHEN '4' => RETURN 4;
      WHEN '5' => RETURN 5;
      WHEN '6' => RETURN 6;
      WHEN '7' => RETURN 7;
      WHEN '8' => RETURN 8;
      WHEN '9' => RETURN 9;
      WHEN OTHERS => ASSERT FALSE REPORT "Bad decimal digit" SEVERITY FAILURE;
    END CASE;
    RETURN 0;
  END char_to_digit;

  FUNCTION char_to_hex_digit( C : CHARACTER ) RETURN STD_LOGIC_VECTOR IS
  BEGIN
    CASE C IS
      WHEN '0' => RETURN X"0";
      WHEN '1' => RETURN X"1";
      WHEN '2' => RETURN X"2";
      WHEN '3' => RETURN X"3";
      WHEN '4' => RETURN X"4";
      WHEN '5' => RETURN X"5";
      WHEN '6' => RETURN X"6";
      WHEN '7' => RETURN X"7";
      WHEN '8' => RETURN X"8";
      WHEN '9' => RETURN X"9";
      WHEN 'a' => RETURN X"A";
      WHEN 'A' => RETURN X"A";
      WHEN 'b' => RETURN X"B";
      WHEN 'B' => RETURN X"B";
      WHEN 'c' => RETURN X"C";
      WHEN 'C' => RETURN X"C";
      WHEN 'd' => RETURN X"D";
      WHEN 'D' => RETURN X"D";
      WHEN 'e' => RETURN X"E";
      WHEN 'E' => RETURN X"E";
      WHEN 'f' => RETURN X"F";
      WHEN 'F' => RETURN X"F";
      WHEN OTHERS => ASSERT FALSE REPORT "Bad hex digit" SEVERITY FAILURE;
    END CASE;
    RETURN X"0";
  END char_to_hex_digit;

  FUNCTION string_to_hwaddr( ADDR : STRING ) RETURN STD_LOGIC_VECTOR IS
    VARIABLE BYTE_INDEX : NATURAL := 0;
    VARIABLE NIBBLE_INDEX : NATURAL := 0;
    VARIABLE INDEX : NATURAL := 0;
    VARIABLE HWADDR : STD_LOGIC_VECTOR(47 DOWNTO 0) := ( OTHERS => '0' );
  BEGIN
    IF ( ADDR'LENGTH = 17 ) THEN
      L: FOR I IN ADDR'REVERSE_RANGE LOOP
        IF ( ADDR(I) = ':' ) THEN
          BYTE_INDEX := BYTE_INDEX + 1;
          NIBBLE_INDEX := 0;
        ELSE
          INDEX := ( BYTE_INDEX * 8 ) + ( NIBBLE_INDEX * 4 );
          HWADDR(INDEX+3 DOWNTO INDEX) := char_to_hex_digit(ADDR(I));
          NIBBLE_INDEX := NIBBLE_INDEX + 1;
        END IF;
      END LOOP L;
    ELSE
      ASSERT FALSE REPORT "Bad MAC address format" SEVERITY FAILURE;
    END IF;
    RETURN HWADDR;
  END string_to_hwaddr;

  FUNCTION string_to_ipaddr( ADDR : STRING ) RETURN STD_LOGIC_VECTOR IS
    VARIABLE BYTE_INDEX : NATURAL := 0;
    VARIABLE TMP : NATURAL := 0;
    VARIABLE MULT : NATURAL := 1;
    VARIABLE INDEX : NATURAL := 0;
    VARIABLE IPADDR : STD_LOGIC_VECTOR(31 DOWNTO 0) := ( OTHERS => '0' );
  BEGIN
    L: FOR I IN ADDR'REVERSE_RANGE LOOP
      IF ( ADDR(I) = '.' ) THEN
        BYTE_INDEX := BYTE_INDEX + 1;
        MULT := 1;
        TMP := 0;
      ELSE
        TMP := TMP + MULT * char_to_digit(ADDR(I));
        INDEX := BYTE_INDEX * 8;
        IPADDR(INDEX+7 DOWNTO INDEX) := STD_LOGIC_VECTOR(TO_UNSIGNED(TMP,8));
        MULT := MULT * 10;
      END IF;
    END LOOP L;
    RETURN IPADDR;
  END string_to_ipaddr;

END gbe;
