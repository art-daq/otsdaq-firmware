--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripdacspi - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    SPI interface to DAC's on the STIB board
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

ENTITY stripdacspi IS
  PORT (
    CLK : IN STD_LOGIC;
    RESET : IN STD_LOGIC;
    STROBE : IN STD_LOGIC;
    BUSY : OUT STD_LOGIC;
    SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    DIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    DOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    CS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    SDI : OUT STD_LOGIC;
    SDO : IN STD_LOGIC;
    SCLK : OUT STD_LOGIC
  );
END stripdacspi;

architecture RTL of stripdacspi is

  TYPE state_t IS ( Idle, Address, Write, About_to_read, Read, Done );
  SIGNAL STATE : state_t := Idle;
  SIGNAL LATCHED_STROBE : STD_LOGIC;
  SIGNAL IBIT : INTEGER RANGE 0 TO 7;
  SIGNAL JBIT : INTEGER RANGE 0 TO 7;
begin

  PROCESS ( CLK, RESET, STROBE ) BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN   -- SPI transitions occur on falling edge of SCLK
      IF ( RESET = '1' ) THEN
        STATE <= Idle;
        CS <= "0000";
        SDI <= '0';
        BUSY <= '0';
      ELSE
        CASE STATE IS
          WHEN Idle =>
            IF ( LATCHED_STROBE = '1' ) THEN
              CS <= SEL;
              IBIT <= 6;
              JBIT <= 0;
              SDI <= ADDR(7);
              STATE <= Address;
              BUSY <= '1';
            ELSE
              CS <= "0000";
              SDI <= '0';
              BUSY <= '0';
            END IF;
          WHEN Address =>
            SDI <= ADDR(IBIT);
            IF ( IBIT = 0 ) THEN
              IF ( ADDR(7) = '1' ) THEN
                STATE <= About_to_read;
              ELSE
                IBIT <= 7;
                STATE <= Write;
              END IF;
            ELSE
              IBIT <= IBIT - 1;
            END IF;
          WHEN Write =>
            SDI <= DIN(IBIT);
            IF ( IBIT = 0 ) THEN
              STATE <= Done;
            ELSE
              IBIT <= IBIT - 1;
            END IF;
          WHEN About_to_read =>
            JBIT <= 7;
            STATE <= Read;
          WHEN Read =>
            SDI <= '0';
            IF ( JBIT = 0 ) THEN
              CS <= "0000";
              STATE <= Idle;
            ELSE
              JBIT <= JBIT - 1;
            END IF;
          WHEN Done =>
            CS <= "0000";
            STATE <= Idle;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN
      IF ( RESET = '1' ) THEN
        LATCHED_STROBE <= '0';
        DOUT <= X"00";
      ELSE
        LATCHED_STROBE <= STROBE;
        IF ( STATE = Read ) THEN
          DOUT(JBIT) <= SDO;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  SCLK <= CLK WHEN STATE /= Idle ELSE '0';

end RTL;
