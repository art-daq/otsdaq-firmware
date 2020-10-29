--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripana - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Analyzes hit data from FSSR2 chips
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

entity stripana is
  Port (
    CLEAR : IN STD_LOGIC;
    DONE : OUT STD_LOGIC;
    STRIP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    SET : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    ADC : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    TCBIT : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    CLK : IN STD_LOGIC;                            -- MCLK, to be specific
    BCOCLK : IN STD_LOGIC;
    DIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    WRITE_ENABLE : IN STD_LOGIC;
    BCO_COUNTER : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    NHIT1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    NHIT2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    NHIT3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    NHIT4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    NHIT5 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
end stripana;

architecture RTL of stripana is

  TYPE counter_array_t IS ARRAY(1 TO 5) OF UNSIGNED(31 DOWNTO 0);
  SIGNAL STRIP_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL COUNTERS : counter_array_t;
  SIGNAL BCO : UNSIGNED(31 DOWNTO 0);
  SIGNAL TERM_COUNT : STD_LOGIC;
  SIGNAL TERM_COUNT_BIT : INTEGER RANGE 0 TO 31;
  SIGNAL ICHIP : INTEGER RANGE 0 TO 5;	   -- why was this 1 to 5? RAR
BEGIN

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN   -- Data out of chipserdes is asserted on falling edge of clk
      IF ( CLEAR = '1' ) THEN
        STRIP_DATA(31) <= '0';
      ELSIF ( WRITE_ENABLE = '1' ) THEN
        STRIP_DATA <= DIN;
      ELSE
        STRIP_DATA(31) <= '0';
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN
      IF ( CLEAR = '1' ) THEN
        FOR I IN 1 TO 5 LOOP
          COUNTERS(I) <= ( OTHERS => '0' );
        END LOOP;
      ELSIF ( TERM_COUNT = '0' AND STRIP_DATA(31) = '1' ) THEN
        IF ( ( STRIP_DATA(16 DOWNTO 12) = SET ) AND
             ( STRIP_DATA(20 DOWNTO 17) = STRIP ) AND
             ( UNSIGNED(STRIP_DATA(3 DOWNTO 1)) >= UNSIGNED(ADC) ) ) THEN
          COUNTERS(ICHIP) <= COUNTERS(ICHIP) + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( BCOCLK, CLEAR ) BEGIN
    IF ( BCOCLK'EVENT AND BCOCLK = '1' ) THEN
      IF ( CLEAR = '1' ) THEN
        BCO <= ( OTHERS => '0' );
      ELSIF ( TERM_COUNT = '0' ) THEN
        BCO <= BCO + 1;
      END IF;
    END IF;
  END PROCESS;

  ICHIP <= TO_INTEGER(UNSIGNED(STRIP_DATA(26 DOWNTO 24)));
  TERM_COUNT_BIT <= TO_INTEGER(UNSIGNED(TCBIT));
  TERM_COUNT <= BCO(TERM_COUNT_BIT);
  DONE <= TERM_COUNT;
  BCO_COUNTER <= STD_LOGIC_VECTOR(BCO);
  NHIT1 <= STD_LOGIC_VECTOR(COUNTERS(1));
  NHIT2 <= STD_LOGIC_VECTOR(COUNTERS(2));
  NHIT3 <= STD_LOGIC_VECTOR(COUNTERS(3));
  NHIT4 <= STD_LOGIC_VECTOR(COUNTERS(4));
  NHIT5 <= STD_LOGIC_VECTOR(COUNTERS(5));

END RTL;
