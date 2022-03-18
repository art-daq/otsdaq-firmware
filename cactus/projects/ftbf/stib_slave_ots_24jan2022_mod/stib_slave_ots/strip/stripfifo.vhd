--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripfifo - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Concentrates data from the 5 chips on a hybrid into
--                 a single 32-bit wide FIFO
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

entity stripfifo is
  Port (
    CLK : IN STD_LOGIC;
    RESET : IN STD_LOGIC;
    DIN1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DIN2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DIN3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DIN4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DIN5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DATA_VALID : IN STD_LOGIC_VECTOR(5 DOWNTO 1);
    ACK : OUT STD_LOGIC_VECTOR(5 DOWNTO 1);
    SPY_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    SPY_DATA_VALID : OUT STD_LOGIC;
    RDCLK : IN STD_LOGIC;
    FIFO_EMPTY : OUT STD_LOGIC;
    DOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TOKEN_IN : IN STD_LOGIC;
    TOKEN_OUT : OUT STD_LOGIC;
    DOUT_VALID : OUT STD_LOGIC;
    TRIG_ENABLE : IN STD_LOGIC;
    TRIG_CLK : OUT STD_LOGIC;
    TRIG_ADDR : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    TRIG_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
end stripfifo;

architecture Behavioral of stripfifo is

  COMPONENT chip_fifo 
    PORT (
      RST : IN STD_LOGIC;
      WR_CLK : IN STD_LOGIC;
      RD_CLK : IN STD_LOGIC;
      DIN : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
      WR_EN : IN STD_LOGIC;
      RD_EN : IN STD_LOGIC;
      DOUT : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
      EMPTY : OUT STD_LOGIC;
      FULL : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL FIFO_INPUT : STD_LOGIC_VECTOR(35 DOWNTO 0);
  SIGNAL FIFO_OUTPUT : STD_LOGIC_VECTOR(35 DOWNTO 0);
  SIGNAL SPY_FIFO_OUTPUT : STD_LOGIC_VECTOR(35 DOWNTO 0);
  SIGNAL FIFO_WE : STD_LOGIC;
  SIGNAL FIFO_FULL : STD_LOGIC;
  SIGNAL STRIP_FIFO_EMPTY, strip_fifo_empty_latch, strip_fifo_empty_latchAND : STD_LOGIC;

  SIGNAL TOKEN : STD_LOGIC;
  SIGNAL READ_ENABLE : STD_LOGIC;
  SIGNAL BUFFERED_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL CHECK_TRIGGER : STD_LOGIC;
  SIGNAL CHECKED_TRIGGER : STD_LOGIC;
  SIGNAL TRIGGERED_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  signal local_fifo_reset : std_logic;
BEGIN

	local_fifo_reset <= reset or FIFO_FULL;
  fifo_imp : chip_fifo
  PORT MAP (
    RST => local_fifo_reset,
    WR_CLK => CLK,
    RD_CLK => RDCLK,
    DIN => FIFO_INPUT,
    WR_EN => FIFO_WE,
    RD_EN => READ_ENABLE,
    FULL => FIFO_FULL,
    EMPTY => STRIP_FIFO_EMPTY,
    DOUT => FIFO_OUTPUT
  );

  PROCESS ( CLK, CHECK_TRIGGER ) BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN
      CHECKED_TRIGGER <= CHECK_TRIGGER;
      TRIGGERED_DATA <= BUFFERED_DATA;
    END IF;
  END PROCESS;

--
--  Data from the chips is asserted on the falling edge of OUTCLK
--  which is synchronous with the falling edge of MCLK.  They can sample
--  ACK and clear the VALID bits on the rising edge of MCLK.
--  

  FIFO_INPUT(35 DOWNTO 32) <= "0000";
  FIFO_INPUT(31 DOWNTO 0) <= TRIGGERED_DATA;
  FIFO_WE <= '1' WHEN ( CHECKED_TRIGGER = '1' AND ( TRIG_DATA /= "0000" OR TRIG_ENABLE = '0' ) ) ELSE '0';

  BUFFERED_DATA <= DIN1 WHEN ( DATA_VALID(1) = '1' ) ELSE
                   DIN2 WHEN ( DATA_VALID(2) = '1' ) ELSE
                   DIN3 WHEN ( DATA_VALID(3) = '1' ) ELSE
                   DIN4 WHEN ( DATA_VALID(4) = '1' ) ELSE
                   DIN5 WHEN ( DATA_VALID(5) = '1' ) ELSE ( OTHERS => '0' );
  CHECK_TRIGGER <= '1' WHEN ( DATA_VALID /= "00000" ) ELSE '0';
  TRIG_ADDR <= BUFFERED_DATA(11 DOWNTO 4);
  SPY_DATA <= FIFO_INPUT(31 DOWNTO 0);
  SPY_DATA_VALID <= FIFO_WE;

  ACK <= "00001" WHEN DATA_VALID(1) = '1' ELSE
         "00010" WHEN DATA_VALID(2) = '1' ELSE
         "00100" WHEN DATA_VALID(3) = '1' ELSE
         "01000" WHEN DATA_VALID(4) = '1' ELSE
         "10000" WHEN DATA_VALID(5) = '1' ELSE "00000"; 

  PROCESS ( RDCLK ) BEGIN
    IF ( RDCLK'EVENT AND RDCLK = '1' ) THEN
		strip_fifo_empty_latch <= STRIP_FIFO_EMPTY; --delay reading behavior by 1 clk RAR
	 
	 
      IF ( RESET = '1' ) THEN
        TOKEN <= '0';
		  DOUT_VALID <= '0'; --RAR
      ELSE
        IF ( strip_fifo_empty_latchAND = '0' ) THEN
          IF ( TOKEN_IN = '1' ) THEN
            TOKEN <= '1';
            DOUT_VALID <= '1';
          ELSE
            TOKEN <= '0';
            DOUT_VALID <= '0';
          END IF;
        ELSE
          TOKEN <= '0';
          DOUT_VALID <= '0';
        END IF;
      END IF;
    END IF;
  END PROCESS;

	strip_fifo_empty_latchAND <= strip_fifo_empty_latch or STRIP_FIFO_EMPTY; --delay reading behavior by 1 clk RAR (but get the empty feedback right away)
	
  READ_ENABLE <= TOKEN_IN AND NOT strip_fifo_empty_latchAND;
  FIFO_EMPTY <= strip_fifo_empty_latchAND;
  DOUT <= FIFO_OUTPUT(31 DOWNTO 0);
  TOKEN_OUT <= TOKEN OR TOKEN_IN WHEN strip_fifo_empty_latchAND = '1' ELSE TOKEN;

END Behavioral;
