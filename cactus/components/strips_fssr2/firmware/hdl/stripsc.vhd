--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripsc - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Slow controls interface to strip sensor hybrids
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

entity stripsc is
  Generic ( N : integer := 1 );
  Port (
    CLK : in  STD_LOGIC;
    STROBE : IN STD_LOGIC;
    BUSY : OUT STD_LOGIC;
    RAW : IN STD_LOGIC;
    BCO : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    BCO_SYNC : IN STD_LOGIC;
    BCO_ZERO : IN STD_LOGIC;
    CHIPID : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    ADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    INST : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    COUNT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    SEL : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    MASK : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    BITS_IN : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    BITS_OUT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    SHIFT : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    SCIN : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    SCOUT : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0)
  );
end stripsc;

architecture Behavioral of stripsc is
  TYPE state_t is ( Idle,
                    Wait_bcozero,
                    Chip_id0,
                    Chip_id1,
                    Chip_id2,
                    Chip_id3,
                    Chip_id4,
                    Addr0,
                    Addr1,
                    Addr2,
                    Addr3,
                    Addr4,
                    Inst0,
                    Inst1,
                    Inst2,
                    SkipReading,
                    SkipWriting,
                    Reading,
                    Writing,
                    Rawbits,
                    Done );
  SIGNAL STATE : state_t := Idle;
  SIGNAL IBIT : INTEGER RANGE 0 TO 128;
  SIGNAL NBIT : INTEGER RANGE 0 TO 255;
  SIGNAL ISEL : INTEGER RANGE 0 TO N-1;
  SIGNAL DOUT : STD_LOGIC;
  SIGNAL NEXT_SHIFT : STD_LOGIC := '0';
  SIGNAL SC_SHIFT : STD_LOGIC;
  SIGNAL EXTRA_HALF_CYCLE : STD_LOGIC;
  SIGNAL LATCHED_STROBE : STD_LOGIC;
  SIGNAL LAST_BCO : STD_LOGIC_VECTOR(7 DOWNTO 0);
  CONSTANT BCO_TRIGGER : STD_LOGIC_VECTOR(7 DOWNTO 0) := X"F0";
-- This positions the falling SHIFT edge to coincide with BCO = 0.
	
		
--    attribute mark_debug : string;
--    attribute mark_debug of BCO_SYNC : signal is "true";
--    attribute mark_debug of RAW : signal is "true";
--    attribute mark_debug of BCO_ZERO : signal is "true";
--    attribute mark_debug of BCO : signal is "true";
--    attribute mark_debug of IBIT : signal is "true";
--    attribute mark_debug of NBIT : signal is "true";
--    attribute mark_debug of ISEL : signal is "true";

begin
  PROCESS ( CLK, LATCHED_STROBE ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN  -- Data sheet says to aassert on the rising edge
      CASE STATE IS
        WHEN Idle =>
          IF ( LATCHED_STROBE = '1' ) THEN
            BUSY <= '1';
            NBIT <= TO_INTEGER(UNSIGNED(COUNT));
            ISEL <= TO_INTEGER(UNSIGNED(SEL));
            DOUT <= '0';
            IBIT <= 0;
            EXTRA_HALF_CYCLE <= '0';
            IF ( RAW = '0' ) THEN
              IF ( BCO_SYNC = '0' ) THEN
                NEXT_SHIFT <= '1';
                STATE <= Chip_id0;
              ELSE
                NEXT_SHIFT <= '0';
                STATE <= Wait_bcozero;
              END IF;
            ELSE
              NEXT_SHIFT <= '1';
              STATE <= Rawbits;
            END IF;
          ELSE
            DOUT <= '0';
            NEXT_SHIFT <= '0';
            EXTRA_HALF_CYCLE <= '0';
            BUSY <= '0';
          END IF;
        WHEN Wait_bcozero =>
          IF ( LAST_BCO = BCO_TRIGGER ) THEN
            NEXT_SHIFT <= '1';
            EXTRA_HALF_CYCLE <= '0';
            STATE <= Chip_id0;
          END IF;
        WHEN Chip_id0 =>
          DOUT <= CHIPID(4);
          STATE <= Chip_id1;
        WHEN Chip_id1 =>
          DOUT <= CHIPID(3);
          STATE <= Chip_id2;
        WHEN Chip_id2 =>
          DOUT <= CHIPID(2);
          STATE <= Chip_id3;
        WHEN Chip_id3 =>
          DOUT <= CHIPID(1);
          STATE <= Chip_id4;
        WHEN Chip_id4 =>
          DOUT <= CHIPID(0);
          STATE <= Addr0;
        WHEN Addr0 =>
          DOUT <= ADDR(4);
          STATE <= Addr1;
        WHEN Addr1 =>
          DOUT <= ADDR(3);
          STATE <= Addr2;
        WHEN Addr2 =>
          DOUT <= ADDR(2);
          STATE <= Addr3;
        WHEN Addr3 =>
          DOUT <= ADDR(1);
          STATE <= Addr4;
        WHEN Addr4 =>
          DOUT <= ADDR(0);
          STATE <= Inst0;
        WHEN Inst0 =>
          DOUT <= INST(2);
          STATE <= Inst1;
        WHEN Inst1 =>
          DOUT <= INST(1);
          STATE <= Inst2;
        WHEN Inst2 =>
          DOUT <= INST(0);
          IF ( NBIT /= 0 ) THEN
            IF ( INST = "100" ) THEN
              STATE <= SkipReading;   -- There is one clock cycle before data is shifted in
            ELSE
              STATE <= Writing;   -- Don't skip a clock cycle when writing
            END IF;
          ELSE
            STATE <= Done;
          END IF;
        WHEN SkipReading =>
          DOUT <= '0';
          STATE <= Reading;
        WHEN SkipWriting =>
          DOUT <= '0';
          STATE <= Writing;
        WHEN Writing =>
          DOUT <= BITS_IN(IBIT);
          IF ( IBIT = NBIT-1 ) THEN
            NEXT_SHIFT <= '0';
            STATE <= Done;
          ELSE
            IBIT <= IBIT + 1;
          END IF;
        WHEN Reading =>
          DOUT <= '0';
          IF ( IBIT = NBIT ) THEN
            STATE <= Done;
          END IF;
          IBIT <= IBIT + 1;
        WHEN Rawbits =>
          DOUT <= BITS_IN(IBIT);
          IF ( IBIT = NBIT ) THEN
            STATE <= Done;
          END IF;
          IBIT <= IBIT + 1;
        WHEN OTHERS =>
          EXTRA_HALF_CYCLE <= BCO_SYNC AND NEXT_SHIFT;
          IF ( BCO_ZERO = '0' ) THEN
            NEXT_SHIFT <= '0';
            IF ( LATCHED_STROBE = '0' ) THEN
              STATE <= Idle;
            END IF;
          ELSIF ( BCO = X"FE" ) THEN
            NEXT_SHIFT <= '0';
            IF ( LATCHED_STROBE = '0' ) THEN
              STATE <= Idle;
            END IF;
          END IF;
      END CASE;
    END IF;
  END PROCESS;

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN  -- Sample data on the falling edge
      LATCHED_STROBE <= STROBE;
      LAST_BCO <= BCO;
      SC_SHIFT <= NEXT_SHIFT;
      IF ( STATE = Chip_id0 ) THEN
        BITS_OUT <= ( OTHERS => '0' );
      ELSIF ( STATE = Reading ) THEN
        BITS_OUT(NBIT-IBIT) <= SCOUT(ISEL);
      END IF;
    END IF;
  END PROCESS;

  SHIFT <= MASK WHEN SC_SHIFT = '1' OR EXTRA_HALF_CYCLE = '1' ELSE ( OTHERS => '0' );
  SCIN <= MASK WHEN DOUT = '1' ELSE ( OTHERS => '0' );

end Behavioral;
