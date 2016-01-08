--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripdac - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Interface to DAC data bus
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
--
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY stripdac IS
  PORT (
    RESET : IN STD_LOGIC;
    STROBE : IN STD_LOGIC;
    ENABLE : IN STD_LOGIC;
    BUSY : OUT STD_LOGIC;
    BCOCLK : IN STD_LOGIC;
    BCO : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    BCO_MATCH : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    BCO_MASK : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    BCO_PERIOD : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    VALUE : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    DELAY : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    RATE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    CLK : IN STD_LOGIC;
    DATACLK : OUT STD_LOGIC;
    BUSAB : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END stripdac;

architecture RTL of stripdac is

  TYPE state_t IS ( Idle, Ready, Pulse, Done );
  SIGNAL STATE : state_t := Idle;

  SIGNAL MASKED_BCO : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL DELAYED : STD_LOGIC;
  SIGNAL RAMPING : STD_LOGIC;
  SIGNAL FINISHED : STD_LOGIC;
  SIGNAL COUNT : UNSIGNED(11 DOWNTO 0) := X"000";
  SIGNAL DAC : SIGNED(11 DOWNTO 0);
  SIGNAL DIVCLK : STD_LOGIC := '0';
  SIGNAL DELTA : SIGNED(3 DOWNTO 0);
begin

  PROCESS ( BCOCLK ) BEGIN
    IF ( BCOCLK'EVENT AND BCOCLK = '0' ) THEN
      IF ( RESET = '1' ) THEN
        STATE <= Idle;
        BUSY <= '0';
      ELSE
        CASE STATE IS
          WHEN Idle =>
            IF ( STROBE = '1' OR ENABLE = '1' ) THEN
              BUSY <= '1';
              STATE <= Ready;
            END IF;
          WHEN Ready =>
            IF ( MASKED_BCO = BCO_MATCH ) THEN
              STATE <= Pulse;
            END IF;
          WHEN Pulse =>
            IF ( FINISHED = '1' ) THEN
              STATE <= Done;
            END IF;
          WHEN Done =>
            IF ( ENABLE = '0' ) THEN
              IF ( STROBE = '0' ) THEN
                BUSY <= '0';
                STATE <= Idle;
              END IF;
            ELSE
              STATE <= Ready;
            END IF;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN
      IF ( STATE = Pulse ) THEN
        IF ( DELAYED = '0' ) THEN
          IF ( COUNT = X"000" ) THEN
            DELAYED <= '1';
          ELSE
            COUNT <= COUNT - 1;
          END IF;
        END IF;
      ELSE
        DELAYED <= '0';
        COUNT <= UNSIGNED(DELAY);
      END IF;
      DIVCLK <= NOT DIVCLK;
    END IF;
  END PROCESS;

  PROCESS ( DIVCLK ) BEGIN
    IF ( DIVCLK'EVENT AND DIVCLK = '1' ) THEN
      IF ( DELAYED = '1' ) THEN
        IF ( RAMPING = '0' ) THEN
          DAC <= SIGNED(VALUE);
          IF ( RATE = "0000" ) THEN
            DELTA <= "0001";
          ELSE
            DELTA <= SIGNED(RATE);
          END IF;
          RAMPING <= '1';
        ELSIF ( FINISHED = '0' ) THEN
          IF ( ABS(DAC) < ABS(DELTA) ) THEN
            DAC <= ( OTHERS => '0' );
            FINISHED <= '1';
          ELSE
            DAC <= DAC + DELTA;
          END IF;
        END IF;
      ELSE
        RAMPING <= '0';
        FINISHED <= '0';
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( DIVCLK ) BEGIN
    IF ( DIVCLK'EVENT AND DIVCLK = '0' ) THEN
      BUSAB <= STD_LOGIC_VECTOR(DAC);
    END IF;
  END PROCESS;

  MASKED_BCO <= BCO AND BCO_MASK;
  DATACLK <= DIVCLK;

end RTL;
