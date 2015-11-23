-- SCRIPT COMMENT OUT --------------------------------------------------------------------------------

-- SCRIPT COMMENT OUT -- IMPORTANT!! IMPORTANT!! 				
-- SCRIPT COMMENT OUT -- It's very important to note!!!   	
-- SCRIPT COMMENT OUT -- 										
-- SCRIPT COMMENT OUT -- The script that moves these files into a Firmware project will 		   
-- SCRIPT COMMENT OUT --  remove all "--- " comments.. 												
-- SCRIPT COMMENT OUT -- and will remove completely any text before "SCRIPT COMMENT OUT" 

--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripstream - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    
--
-- Dependencies:   Formats hit data to be streamed out over the network
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stripstream is
  GENERIC ( N : INTEGER := 1 );
  PORT (
    RESET : IN STD_LOGIC;
    ENABLE : IN STD_LOGIC;
    FLUSH : IN STD_LOGIC;
    PACKET_SIZE : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    IDLE_COUNT : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    CLK : IN STD_LOGIC;
    DIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    WRITE_ENABLE : IN STD_LOGIC;
    STATUS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    WORDS_DUMPED : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STREAM_RCLK : IN STD_LOGIC;
    STREAM_READ_ENABLE : IN STD_LOGIC;
    STREAM_DOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    STREAM_LENGTH : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    STREAM_CKSUM : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    STREAM_STROBE : OUT STD_LOGIC;
    STREAM_READY : IN STD_LOGIC
  );
end stripstream;

architecture Behavioral of stripstream is

  COMPONENT streamipbuf
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC
  );
  END COMPONENT;

  COMPONENT packetfifo
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
  END COMPONENT;

  SIGNAL COUNT : UNSIGNED(8 DOWNTO 0);
  SIGNAL ENABLED : STD_LOGIC;
  SIGNAL EMPTY : STD_LOGIC;
  SIGNAL FULL : STD_LOGIC;
  SIGNAL STROBE : STD_LOGIC;
  SIGNAL LAST_STROBE : STD_LOGIC;
  SIGNAL INPUT_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL CARRY_CHECKSUM : STD_LOGIC;
  SIGNAL STREAMING : STD_LOGIC;
  SIGNAL FIFO_DOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL TERM_COUNT : UNSIGNED(8 DOWNTO 0);
  SIGNAL WORD_COUNT : UNSIGNED(8 DOWNTO 0) := "000010000";
-- Initial value of TERM_COUNT is replaced by STRIP_CSR field after first packet has been transmitted
  SIGNAL IDLE : UNSIGNED(7 DOWNTO 0) := X"00";
  SIGNAL DUMP_COUNT : UNSIGNED(31 DOWNTO 0) := X"00000000";
  SIGNAL STUFFED : STD_LOGIC;
  SIGNAL EVER_STUFFED : STD_LOGIC := '0';

  SIGNAL PROG_FULL : STD_LOGIC;
  SIGNAL PACKET_FIFO_RE : STD_LOGIC := '0';
  SIGNAL CKSUM_LENGTH_INPUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL CKSUM_LENGTH_OUTPUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL PACKET_FIFO_WE : STD_LOGIC;
  SIGNAL PACKET_FIFO_FULL : STD_LOGIC;
  SIGNAL PACKET_FIFO_EMPTY : STD_LOGIC;
  SIGNAL SEND_PACKET : STD_LOGIC := '0';
  SIGNAL LATCHED_STREAM_READY : STD_LOGIC := '0';
  TYPE Send_state_t IS ( Ready, Read_fifo, Sending_packet );
  SIGNAL SEND_STATE : Send_state_t := Ready;
  SIGNAL PACKET_STROBE : STD_LOGIC;
  SIGNAL ADD_LOW : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL ADD_HIGH : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL NEXT_CKSUM_CARRY : UNSIGNED(16 DOWNTO 0);
  SIGNAL NEXT_CKSUM_CARRY_ONE : UNSIGNED(16 DOWNTO 0);
  SIGNAL NEXT_CKSUM : UNSIGNED(16 DOWNTO 0);
  SIGNAL CKSUM : UNSIGNED(16 DOWNTO 0);
  SIGNAL CKSUM_CARRY : UNSIGNED(16 DOWNTO 0);
  SIGNAL CKSUM_CARRY_ONE : UNSIGNED(16 DOWNTO 0);
  SIGNAL STATE : STD_LOGIC_VECTOR(7 DOWNTO 0) := X"00";
  
  signal dummydummy : std_logic_vector(23 downto 0);
BEGIN
		   
	streamipbuf_imp : entity inferredFifo 							 				   																			-- SCRIPT COMMENT OUT
		GENERIC MAP ( width => 32, depth => 128, addr => 7)																										-- SCRIPT COMMENT OUT
  PORT MAP (																																					-- SCRIPT COMMENT OUT
    RESET => RESET,																																				-- SCRIPT COMMENT OUT
    WCLOCK => CLK,																																				-- SCRIPT COMMENT OUT
    RCLOCK => STREAM_RCLK,																																		-- SCRIPT COMMENT OUT
    DATA => INPUT_DATA,																																			-- SCRIPT COMMENT OUT
    WE => STREAMING,																																			-- SCRIPT COMMENT OUT
    RE => STREAM_READ_ENABLE,																																	-- SCRIPT COMMENT OUT
    FULL => FULL,																																				-- SCRIPT COMMENT OUT
    EMPTY => EMPTY,															   																					-- SCRIPT COMMENT OUT
	Q(31 downto 8) => dummydummy,																																-- SCRIPT COMMENT OUT
    Q(7 downto 0) => FIFO_DOUT   --- NOTE: this is broken, inferredFifo doens't handle size mismatch, but RAR doesn't care for checking out interface?			-- SCRIPT COMMENT OUT
  );	   																																						-- SCRIPT COMMENT OUT
  PROG_FULL	<= FULL;		-- NOTE: this is not the same functionality that Matthew intended																	-- SCRIPT COMMENT OUT
																																								-- SCRIPT COMMENT OUT
  	
  
  ---  
---  streamipbuf_imp : streamipbuf
---  PORT MAP (
---    rst => RESET,
---    wr_clk => CLK,
---    rd_clk => STREAM_RCLK,
---    din => INPUT_DATA,
---    wr_en => STREAMING,
---    rd_en => STREAM_READ_ENABLE,
---    dout => FIFO_DOUT,
---    full => FULL,
---    empty => EMPTY,
---    prog_full => PROG_FULL
---  );
  			  
	packetfifo_imp : entity inferredFifo 							-- SCRIPT COMMENT OUT 				   
		GENERIC MAP ( width => 32, depth => 16, addr => 4)			-- SCRIPT COMMENT OUT
  PORT MAP (														-- SCRIPT COMMENT OUT
    RESET => RESET,													-- SCRIPT COMMENT OUT
    WCLOCK => CLK,													-- SCRIPT COMMENT OUT
    RCLOCK => CLK,													-- SCRIPT COMMENT OUT
    DATA => CKSUM_LENGTH_INPUT,										-- SCRIPT COMMENT OUT
    WE => PACKET_FIFO_WE,											-- SCRIPT COMMENT OUT
    RE => PACKET_FIFO_RE,											-- SCRIPT COMMENT OUT
    FULL => PACKET_FIFO_FULL,										-- SCRIPT COMMENT OUT
    EMPTY => PACKET_FIFO_EMPTY,										-- SCRIPT COMMENT OUT
    Q => CKSUM_LENGTH_OUTPUT   										-- SCRIPT COMMENT OUT
  );	   															-- SCRIPT COMMENT OUT
  PROG_FULL	<= FULL;												-- SCRIPT COMMENT OUT

  
  
  ---  

---  packetfifo_imp : packetfifo
---  PORT MAP (
---    rst => RESET,
---    clk => CLK,
---    din => CKSUM_LENGTH_INPUT,
---    wr_en => PACKET_FIFO_WE,
---    rd_en => PACKET_FIFO_RE,
---    dout => CKSUM_LENGTH_OUTPUT,
---    full => PACKET_FIFO_FULL,
---    empty => PACKET_FIFO_EMPTY
---  );

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN
      IF ( RESET = '1' ) THEN
        IDLE <= ( OTHERS => '0' );
        COUNT <= ( OTHERS => '0' );
        NEXT_CKSUM <= ( OTHERS => '0' );
        CARRY_CHECKSUM <= '0';
        STROBE <= '0';
        DUMP_COUNT <= ( OTHERS => '0' );
        STATE(3 DOWNTO 0) <= "0000";
      ELSIF ( STUFFED = '1' ) THEN
        EVER_STUFFED <= '1';
        DUMP_COUNT <= DUMP_COUNT + 1;
        STATE(3 DOWNTO 0) <= "1111";
      ELSIF ( STREAMING = '1' ) THEN
        IDLE <= ( OTHERS => '0' );
        ADD_HIGH <= INPUT_DATA(31 DOWNTO 16);
        IF ( NEXT_CKSUM_CARRY(16) = '1' ) THEN
          NEXT_CKSUM <= '0' & NEXT_CKSUM_CARRY_ONE(15 DOWNTO 0);
        ELSE
          NEXT_CKSUM <= NEXT_CKSUM_CARRY;
        END IF;
        CARRY_CHECKSUM <= '1';
        IF ( COUNT = TERM_COUNT ) THEN
          COUNT <= ( OTHERS => '0' );
          CKSUM_LENGTH_INPUT(15 DOWNTO 0) <= "00000" & STD_LOGIC_VECTOR(WORD_COUNT) & "00";
          STATE(3 DOWNTO 0) <= "0001";
          STROBE <= '1';
        ELSIF ( COUNT = "000000001" ) THEN
          STROBE <= '0';
          STATE(3 DOWNTO 0) <= "0010";
          COUNT <= "000000010";
        ELSE
          STATE(3 DOWNTO 0) <= "0011";
          COUNT <= COUNT + 1;
        END IF;
      ELSE
        IF ( IDLE /= X"FF" ) THEN
          IDLE <= IDLE + 1;
        END IF;
        CARRY_CHECKSUM <= '0';
        STATE(3 DOWNTO 0) <= "0100";     -- Normal idle state
        STROBE <= '0';
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( CLK )
    VARIABLE NEXT_WORD_COUNT : INTEGER;
  BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN
      ENABLED <= ENABLE;    -- This is set in the IOBUS clock domain
      WORDS_DUMPED <= STD_LOGIC_VECTOR(DUMP_COUNT);  -- This is registered to help isolate clock domains
      IF ( RESET = '1' ) THEN
        CKSUM <= ( OTHERS => '0' );
        SEND_STATE <= Ready;
        PACKET_STROBE <= '0';
        LAST_STROBE <= '0';
        STATE(7 DOWNTO 4) <= "0000";
      ELSE
        IF ( STROBE = '1' AND STROBE /= LAST_STROBE ) THEN
          NEXT_WORD_COUNT := 16*TO_INTEGER(UNSIGNED(PACKET_SIZE)+1);
          IF ( NEXT_WORD_COUNT > 350 ) THEN
            NEXT_WORD_COUNT := 350;
          END IF;
          WORD_COUNT <= TO_UNSIGNED(NEXT_WORD_COUNT,9);
          IF ( CKSUM_CARRY(16) = '1' ) THEN
            CKSUM_LENGTH_INPUT(31 DOWNTO 16) <= STD_LOGIC_VECTOR(CKSUM_CARRY_ONE(15 DOWNTO 0));
          ELSE
            CKSUM_LENGTH_INPUT(31 DOWNTO 16) <= STD_LOGIC_VECTOR(CKSUM_CARRY(15 DOWNTO 0));
          END IF;
          PACKET_FIFO_WE <= '1';
          CKSUM <= ( OTHERS => '0' );
          STATE(5 DOWNTO 4) <= "01";
        ELSE
          IF ( PACKET_FIFO_WE = '1' ) THEN
            PACKET_FIFO_WE <= '0';
          END IF;
          IF ( CARRY_CHECKSUM = '1' ) THEN
            IF ( CKSUM_CARRY(16) = '1' ) THEN
              CKSUM <= '0' & CKSUM_CARRY_ONE(15 DOWNTO 0);
            ELSE
              CKSUM <= '0' & CKSUM_CARRY(15 DOWNTO 0);
            END IF;
          END IF;
          STATE(5 DOWNTO 4) <= "10";    -- Normal idle state
        END IF;
        LAST_STROBE <= STROBE;
        CASE SEND_STATE IS
          WHEN Ready =>
            IF ( PACKET_FIFO_EMPTY = '0' AND STREAM_READY = '1' ) THEN
              PACKET_FIFO_RE <= '1';
              PACKET_STROBE <= '1';
              STATE(7 DOWNTO 6) <= "01";
              SEND_STATE <= Read_fifo;
            ELSE
              PACKET_STROBE <= '0';
              STATE(7 DOWNTO 6) <= "00";     -- Normal idle state
            END IF;
          WHEN Read_fifo =>
            PACKET_FIFO_RE <= '0';
            PACKET_STROBE <= '1';
            STATE(7 DOWNTO 6) <= "10";
            SEND_STATE <= Sending_packet;
          WHEN Sending_packet =>
            IF ( STREAM_READY = '0' ) THEN
              PACKET_STROBE <= '0';
              STATE(7 DOWNTO 6) <= "11";
              SEND_STATE <= Ready;
            ELSE
              PACKET_STROBE <= '1';
            END IF;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  NEXT_CKSUM_CARRY <= CKSUM + UNSIGNED('0' & INPUT_DATA(15 DOWNTO 0));
  NEXT_CKSUM_CARRY_ONE <= CKSUM + UNSIGNED('0' & INPUT_DATA(15 DOWNTO 0)) + TO_UNSIGNED(1,17);
  CKSUM_CARRY <= NEXT_CKSUM + UNSIGNED('0' & ADD_HIGH);
  CKSUM_CARRY_ONE <= NEXT_CKSUM + UNSIGNED('0' & ADD_HIGH) + TO_UNSIGNED(1,17);

  STREAM_STROBE <= PACKET_STROBE;
  INPUT_DATA <= DIN;
  STATUS <= STATE &
            EVER_STUFFED & PROG_FULL & FULL & EMPTY &
            PACKET_STROBE & STREAM_READY & PACKET_FIFO_FULL & PACKET_FIFO_EMPTY &
            STD_LOGIC_VECTOR(IDLE(7 DOWNTO 0)) &
            STD_LOGIC_VECTOR(COUNT(7 DOWNTO 0));
  STREAM_DOUT <= FIFO_DOUT;
  STUFFED <= WRITE_ENABLE AND ENABLED AND FULL;
  STREAMING <= WRITE_ENABLE AND ENABLED AND NOT FULL;
  TERM_COUNT <= WORD_COUNT-1;
  
  STREAM_LENGTH <= CKSUM_LENGTH_OUTPUT(15 DOWNTO 0);
  STREAM_CKSUM <= CKSUM_LENGTH_OUTPUT(31 DOWNTO 16);

END Behavioral;
