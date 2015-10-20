--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    striptbm - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Collects data from individual channels and pumps it
--                 into the fifo that is sent over Ethernet
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

entity striptbm is
  Port (
    CLK : IN STD_LOGIC;
    RESET : IN STD_LOGIC;
    DATA_AVAILABLE : IN STD_LOGIC;
    SEND_BCO : IN STD_LOGIC;
    BCO : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    BCO_COUNT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    DOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DATA_VALID : OUT STD_LOGIC;
    TOKEN_IN : IN STD_LOGIC;
    TOKEN_OUT : OUT STD_LOGIC;
    OOPS : OUT STD_LOGIC
  );
end striptbm;

architecture Behavioral of striptbm is

  TYPE state_t IS ( Idle, Running, Send_bco_low, Send_bco_high );
  SIGNAL STATE : state_t := Idle;
  SIGNAL TOKEN : STD_LOGIC;
  SIGNAL LATCHED_BCO : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL NEXT_DOUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL NEXT_DATA_VALID : STD_LOGIC;
  SIGNAL SENT_BCO : STD_LOGIC;
  SIGNAL NEED_BCO : STD_LOGIC := '1';
  SIGNAL LATCHED_SEND_BCO : STD_LOGIC;
  SIGNAL BCO_COUNTER : UNSIGNED(6 DOWNTO 0) := "0000000";

BEGIN

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN
      IF ( RESET = '1' ) THEN
        TOKEN <= '0';
        SENT_BCO <= '0';
        STATE <= Idle;
      ELSE
        IF ( SENT_BCO = '1' AND NEED_BCO = '0' ) THEN
          SENT_BCO <= '0';
        END IF;
        CASE STATE IS
          WHEN Idle =>
            DATA_VALID <= '0';
            IF ( DATA_AVAILABLE = '1' ) THEN
              IF ( NEED_BCO = '1' AND SENT_BCO = '0' ) THEN
                TOKEN_OUT <= '0';
                LATCHED_BCO <= BCO;
                STATE <= Send_bco_low;
              ELSE
                TOKEN_OUT <= '1';
                STATE <= Running;
              END IF;
            END IF;
          WHEN Running =>
            DATA_VALID <= '0';
            IF ( TOKEN_IN = '1' ) THEN
              IF ( DATA_AVAILABLE = '1' ) THEN 
                IF ( NEED_BCO = '1' AND SENT_BCO = '0' ) THEN
                  TOKEN_OUT <= '0';
                  LATCHED_BCO  <= BCO;
                  STATE <= Send_bco_low;
                ELSE
                  TOKEN_OUT <= '1';
                  STATE <= Running;
                END IF;
              ELSE
                TOKEN_OUT <= '0';
                STATE <= Idle; 
              END IF;
            ELSE
              TOKEN_OUT <= '0';
            END IF;
          WHEN Send_bco_low =>
            DOUT <= LATCHED_BCO(23 DOWNTO 0) & X"18";
            DATA_VALID <= '1';
            TOKEN_OUT <= '0';
            STATE <= Send_bco_high;
          WHEN Send_bco_high =>
            DOUT <= LATCHED_BCO(47 DOWNTO 24) & X"28";
            DATA_VALID <= '1';
            IF ( LATCHED_BCO(24) /= BCO(24) ) THEN
              OOPS <= '1';
            ELSE
              OOPS <= '0';
            END IF;
            SENT_BCO <= '1';
            TOKEN_OUT <= '1';
            STATE <= Running;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( BCO(0) ) BEGIN
    IF ( BCO(0)'EVENT AND BCO(0) = '1' ) THEN
      IF ( RESET = '1' ) THEN
        NEED_BCO <= '0';
      ELSE
        IF ( SENT_BCO = '1' ) THEN
          NEED_BCO <= '0';
          BCO_COUNTER <= "0000000";
        ELSIF ( BCO_COUNTER = UNSIGNED(BCO_COUNT(7 DOWNTO 1)) ) THEN
          NEED_BCO <= SEND_BCO;
          BCO_COUNTER <= "0000000";
        ELSE
          BCO_COUNTER <= BCO_COUNTER + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS;

END Behavioral;
