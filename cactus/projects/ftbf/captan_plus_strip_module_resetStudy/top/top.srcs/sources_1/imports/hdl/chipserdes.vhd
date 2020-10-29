--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    chipserdes - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Deserializes data from FSSR2 chips
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

ENTITY chipserdes IS
  GENERIC ( CHIPID : INTEGER := 0;
            CHANNEL : INTEGER := 0;
            IDDR_TOGGLE_SEL : std_logic := '0'; --unused
            IOBDELAY_VALUE : INTEGER := 0
  );
  PORT (
    RESET : IN STD_LOGIC;
    ENABLE : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    MCLK : IN STD_LOGIC;
    DIN : IN STD_LOGIC;
    SERDES_INPUT : OUT STD_LOGIC;
    OUTCLK : IN STD_LOGIC;
    DOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    SYNC_VALID : OUT STD_LOGIC;
    DATA_VALID : OUT STD_LOGIC;
    ACK : IN STD_LOGIC;
    DLYCE : IN STD_LOGIC;
    DLYRST : IN STD_LOGIC;
    DLYINC : IN STD_LOGIC;
    STATUS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END chipserdes;

architecture RTL of chipserdes is

  TYPE state_t IS ( Align0, Align1, Word0, Word1, Word2 );
  SIGNAL STATE : state_t := Align0;
  SIGNAL BITSLIP : STD_LOGIC;
  SIGNAL NEXT_BITSLIP : STD_LOGIC := '1';
  SIGNAL SERDES_ENABLE : STD_LOGIC := '1';
  SIGNAL Q : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ALIGNED : STD_LOGIC;
  SIGNAL VALID_SYNC : STD_LOGIC;
  SIGNAL VALID_DATA : STD_LOGIC;
  SIGNAL NEXT_VALID_DATA : STD_LOGIC;
  SIGNAL NEXT_VALID_SYNC : STD_LOGIC;
  SIGNAL GET_READY : STD_LOGIC;
  SIGNAL DATA_LOST : STD_LOGIC;
  SIGNAL ACKED : STD_LOGIC;
  SIGNAL DATA_WORD : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL FIFO_INPUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL FIFO_FULL : STD_LOGIC;
  SIGNAL FIFO_EMPTY_FLAG : STD_LOGIC;
  SIGNAL FIFO_RESET : STD_LOGIC;
  SIGNAL INTERNAL_STATE : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL TRY_AGAIN : INTEGER RANGE 0 TO 63 := 0;
  SIGNAL SHIFTOUT1 : STD_LOGIC;
  SIGNAL SHIFTOUT2 : STD_LOGIC;
  SIGNAL SERDES_RESET : STD_LOGIC;
  SIGNAL SYNC_COUNT : UNSIGNED(7 DOWNTO 0);
  SIGNAL CHIP_STATUS : STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL SYNC_ERROR : STD_LOGIC;
  SIGNAL MISSING_SYNC_COUNT : UNSIGNED(5 DOWNTO 0);

  SIGNAL LOST_SYNC_COUNT : UNSIGNED(15 DOWNTO 0);
  SIGNAL ERROR_COUNT : UNSIGNED(15 DOWNTO 0);
  SIGNAL VALID_SYNC_WORD : STD_LOGIC;
  SIGNAL VALID_DATA_WORD : STD_LOGIC;
  SIGNAL TRIMMED : STD_LOGIC := '0';

  SIGNAL VALID_STRIP_NUMBER : STD_LOGIC;
  SIGNAL VALID_SET_NUMBER : STD_LOGIC;
  
  
    SIGNAL DDLY : STD_LOGIC; --RAR


--           attribute IODELAY_GROUP : STRING;
--           attribute IODELAY_GROUP of IDELAYE2_inst: label is "serdes_idelay_group";
           
           
    attribute mark_debug : string;
    --attribute mark_debug of Q : signal is "true";
    --attribute mark_debug of DATA_WORD : signal is "true";
    --attribute mark_debug of STATE : signal is "true";
    attribute mark_debug of ALIGNED : signal is "true";
    --attribute mark_debug of INTERNAL_STATE : signal is "true";
    attribute mark_debug of NEXT_BITSLIP : signal is "true";
    --attribute mark_debug of SYNC_COUNT : signal is "true";
    attribute mark_debug of DATA_LOST : signal is "true";
    attribute mark_debug of SYNC_VALID : signal is "true";
    attribute mark_debug of CHIP_STATUS : signal is "true";
    attribute mark_debug of DOUT : signal is "true";
    attribute mark_debug of DATA_VALID : signal is "true";
    attribute mark_debug of ENABLE : signal is "true";
    --attribute mark_debug of ACK : signal is "true";
    attribute mark_debug of NEXT_VALID_DATA : signal is "true";
    attribute mark_debug of VALID_SYNC_WORD : signal is "true";
    attribute mark_debug of VALID_STRIP_NUMBER : signal is "true";
    attribute mark_debug of VALID_SET_NUMBER : signal is "true";
    
    
    
    
    
    
      SIGNAL ddr_count : UNSIGNED(2 DOWNTO 0) := (others => '0');
      SIGNAL ddr_bitslip_count : UNSIGNED(2 DOWNTO 0) := (others => '0');
      SIGNAL ddr_shr : STD_LOGIC_VECTOR(7 DOWNTO 0);
      SIGNAL ddr_old_bitslip, ddr_old_bitslip2 : STD_LOGIC;
      SIGNAL iddrq : STD_LOGIC_VECTOR(1 DOWNTO 0);
      SIGNAL iddr_dsel : STD_LOGIC;
      
      
      attribute mark_debug of iddrq : signal is "true";
      attribute mark_debug of SYNC_ERROR : signal is "true";
      attribute mark_debug of DLYCE : signal is "true";
      attribute mark_debug of BITSLIP : signal is "true";
      --attribute mark_debug of ddr_shr : signal is "true";
    
begin	 
	
	
-- IDDR attempt

    IDDR_fssr_inst : IDDR
    generic map (
        DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", -- "OPPOSITE_EDGE", "SAME_EDGE"
        -- or "SAME_EDGE_PIPELINED"
        INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
        INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
        SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC"
    port map (
        Q1 => iddrq(0), -- 1-bit output for positive edge of clock
        Q2 => iddrq(1), -- 1-bit output for negative edge of clock
        C => clk, -- 1-bit clock input
        CE => '1', -- 1-bit clock enable input
        D => DIN, -- 1-bit DDR data input
        R => '0', -- 1-bit reset
        S => '0' -- 1-bit set
    );	
    
    
    iddr_dsel <= iddrq(0) when DLYCE = '0' else iddrq(1);
    process(CLK)
    begin        
        if (rising_edge(CLK)) then
            
            ddr_shr <= iddr_dsel & ddr_shr(7 downto 1);
            ddr_count <= ddr_count + 1;
            ddr_old_bitslip <= BITSLIP;
            ddr_old_bitslip2 <= ddr_old_bitslip;
            if(ddr_old_bitslip2 = '0' and ddr_old_bitslip = '1') then
                 ddr_bitslip_count <= ddr_bitslip_count + 1;                 
            end if;
            
            if( ddr_bitslip_count = ddr_count) then 
                 Q <= ddr_shr;
            end if;        
             
        end if;
    end process;
    

  PROCESS ( OUTCLK, RESET ) BEGIN
    IF ( OUTCLK'EVENT AND OUTCLK = '1' ) THEN
      IF ( RESET = '1' ) THEN
        SERDES_RESET <= '1';
        STATE <= Align0;
        NEXT_VALID_SYNC <= '0';
        NEXT_VALID_DATA <= '0';
        ALIGNED <= '0';
        TRY_AGAIN <= 0;
        SYNC_ERROR <= '0';
        SYNC_COUNT <= ( OTHERS => '0' );
        LOST_SYNC_COUNT <= ( OTHERS => '0' );
        ERROR_COUNT <= ( OTHERS => '0' );
        MISSING_SYNC_COUNT <= ( OTHERS => '0' );
        INTERNAL_STATE <= X"0";
      ELSE
        SERDES_RESET <= '0';
        CASE STATE IS
          WHEN Align0 =>
            INTERNAL_STATE <= X"1";
            ALIGNED <= '0';
            NEXT_VALID_DATA <= '0';
            NEXT_VALID_SYNC <= '0';
            SYNC_ERROR <= '0';
            MISSING_SYNC_COUNT <= ( OTHERS => '0' );
            DATA_WORD(7 DOWNTO 0) <= Q;
            DATA_WORD(23 DOWNTO 8) <= X"0000";
            IF ( Q = "00000001" ) THEN
              NEXT_BITSLIP <= '0';
              STATE <= Align1;
            ELSE
              SYNC_COUNT <= SYNC_COUNT + 1;
              IF ( TRY_AGAIN = 0 ) THEN
                NEXT_BITSLIP <= '1';
                TRY_AGAIN <= 62;
              ELSIF (TRY_AGAIN < 10) THEN
                NEXT_BITSLIP <= '1';
                TRY_AGAIN <= TRY_AGAIN - 1;                
              ELSE
                NEXT_BITSLIP <= '0';
                TRY_AGAIN <= TRY_AGAIN - 1;
              END IF;
            END IF;
          WHEN Align1 =>
            INTERNAL_STATE <= X"2";
            ALIGNED <= '0';
            NEXT_BITSLIP <= '0';
            NEXT_VALID_SYNC <= '0';
            NEXT_VALID_DATA <= '0';
            DATA_WORD(15 DOWNTO 8) <= Q;
            IF ( Q = "00000001" ) THEN
              DATA_WORD(7 DOWNTO 0) <= "00000001";
            ELSIF ( Q(5 DOWNTO 0) = "000000" ) THEN
              STATE <= Word2;
            ELSE
              STATE <= Align0;
            END IF;
       
          WHEN Word0 =>
            INTERNAL_STATE <= X"A";
            ALIGNED <= '1';
            NEXT_VALID_SYNC <= '0';
            NEXT_VALID_DATA <= '0';
            GET_READY <= '0';
            SYNC_ERROR <= '0';
            TRY_AGAIN <= 0;
            DATA_WORD(7 DOWNTO 0) <= Q;
            STATE <= Word1;
          WHEN Word1 =>
            INTERNAL_STATE <= X"B";
            ALIGNED <= '1';
            DATA_WORD(15 DOWNTO 8) <= Q;
            NEXT_VALID_SYNC <= '0';
            NEXT_VALID_DATA <= '0';
            GET_READY <= '1';
            STATE <= Word2;
          WHEN Word2 =>
            INTERNAL_STATE <= X"C";
            DATA_WORD(23 DOWNTO 16) <= Q;
            IF ( TRIMMED = '1' ) THEN
              ALIGNED <= '0';
              NEXT_VALID_SYNC <= '0';
              NEXT_VALID_DATA <= '0';
              SYNC_ERROR <= '0';
              GET_READY <= '0';
              STATE <= Align0;
            ELSIF ( VALID_SYNC_WORD = '1' ) THEN
              ALIGNED <= '1';
              NEXT_VALID_SYNC <= '1';
              NEXT_VALID_DATA <= '0';
              SYNC_ERROR <= '0';
              GET_READY <= '0';
              MISSING_SYNC_COUNT <= ( OTHERS => '0' );
              STATE <= Word0;
            ELSIF ( VALID_DATA_WORD = '1' ) THEN
              ALIGNED <= '1';
              NEXT_VALID_SYNC <= '0';
              NEXT_VALID_DATA <= '1';
              SYNC_ERROR <= '0';
              GET_READY <= '0';
              MISSING_SYNC_COUNT <= ( OTHERS => '0' );
              STATE <= Word0;
            ELSIF ( MISSING_SYNC_COUNT = "111111" ) THEN
              ALIGNED <= '0';
              SYNC_ERROR <= '1';
              IF ( LOST_SYNC_COUNT /= X"FFFF" ) THEN
                LOST_SYNC_COUNT <= LOST_SYNC_COUNT + 1;
              END IF;
              SYNC_COUNT <= ( OTHERS => '0' );
              STATE <= Align0;
            ELSE 
              ALIGNED <= '0';
              MISSING_SYNC_COUNT <= MISSING_SYNC_COUNT + 1;
              SYNC_ERROR <= '1';
              IF ( ERROR_COUNT /= X"FFFF" ) THEN
                ERROR_COUNT <= ERROR_COUNT + 1;
              END IF;
              STATE <= Word0;
            END IF;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( OUTCLK ) BEGIN
    IF ( OUTCLK'EVENT AND OUTCLK = '0' ) THEN
      BITSLIP <= NEXT_BITSLIP;
    END IF;
  END PROCESS;

  PROCESS ( MCLK ) BEGIN
    IF ( MCLK'EVENT AND MCLK = '0' ) THEN
      IF ( RESET = '1' ) THEN
        CHIP_STATUS <= ( OTHERS => '0' );
      ELSIF ( GET_READY = '1' ) THEN
        IF ( ACKED = '0' ) THEN
          DATA_LOST <= '1';
        END IF;
      ELSIF ( NEXT_VALID_SYNC = '1' ) THEN
        DOUT <= DATA_WORD;
        SYNC_VALID <= NEXT_VALID_SYNC;
        CHIP_STATUS(5) <= DATA_WORD(23);  -- SendData
        CHIP_STATUS(4) <= DATA_WORD(22);  -- RejectHits
        CHIP_STATUS(3) <= DATA_WORD(20);  -- ActiveLines LSB
        CHIP_STATUS(2) <= DATA_WORD(19);  -- Acquire BCO mismatch
        CHIP_STATUS(1) <= DATA_WORD(17);  -- Pulsing active
        CHIP_STATUS(0) <= '0';
      ELSIF ( NEXT_VALID_DATA = '1' ) THEN
        DOUT <= DATA_WORD;
        CHIP_STATUS(0) <= '1';
        IF ( ACKED = '0' ) THEN
          SYNC_VALID <= '0';
          DATA_VALID <= ENABLE;    -- Only send data words when chip is enabled.
        ELSE
          DATA_LOST <= '0';
          SYNC_VALID <= '0';
          DATA_VALID <= '0';
        END IF;
      ELSIF ( ACKED = '1' ) THEN
        DATA_LOST <= '0';
        SYNC_VALID <= '0';
        DATA_VALID <= '0';
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( MCLK ) BEGIN
    IF ( MCLK'EVENT AND MCLK = '1' ) THEN
--      IF ( DLYCE = '1' OR DLYRST = '1' ) THEN
--        TRIMMED <= '1';
--      ELSE
--        IF ( STATE = Align1 ) THEN
--          TRIMMED <= '0';
--        END IF;
--      END IF;
      IF ( GET_READY = '1' ) THEN
        ACKED <= '0';
      ELSIF ( ACK = '1' ) THEN
        ACKED <= '1';
      END IF;
    END IF;
  END PROCESS;

--  Valid sync patterns are...
--  xxxx xxxx|xx00 0000|0000 0001
--
  VALID_SYNC_WORD <= '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 0) = STD_LOGIC_VECTOR(TO_UNSIGNED(CHIPID,3)) & "00" & x"001" ELSE '0';
  VALID_STRIP_NUMBER <= '1' WHEN Q(4 DOWNTO 1) = "0101" ELSE
                        '1' WHEN Q(4 DOWNTO 1) = "0111" ELSE
                        '1' WHEN Q(4 DOWNTO 1) = "0110" ELSE
                        '1' WHEN Q(4 DOWNTO 1) = "1110" ELSE
                        '1' WHEN Q(4 DOWNTO 1) = "1010" ELSE
                        '1' WHEN Q(4 DOWNTO 1) = "1011" ELSE
                        '1' WHEN Q(4 DOWNTO 1) = "1001" ELSE
                        '1' WHEN Q(4 DOWNTO 1) = "1101" ELSE '0';
  VALID_SET_NUMBER <= '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "01010" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "01011" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "01111" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "01110" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "01100" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "01101" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "11101" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "11100" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "10100" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "10101" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "10111" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "10110" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "10010" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "10011" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "11011" ELSE
                      '1' WHEN Q(0) & DATA_WORD(15 DOWNTO 12) = "11010" ELSE '0';
  VALID_DATA_WORD <= ( VALID_STRIP_NUMBER AND VALID_SET_NUMBER ) WHEN DATA_WORD(0) = '1' ELSE '0';
--  VALID_DATA_WORD <= ALIGNED WHEN DATA_WORD(0) = '1' ELSE '0';

  DATA_WORD(31) <= ALIGNED;
  DATA_WORD(30) <= DATA_LOST;
  DATA_WORD(29 DOWNTO 27) <= STD_LOGIC_VECTOR(TO_UNSIGNED(CHANNEL,3));
  DATA_WORD(26 DOWNTO 24) <= STD_LOGIC_VECTOR(TO_UNSIGNED(CHIPID,3));
  STATUS <= ALIGNED & SYNC_ERROR & CHIP_STATUS & INTERNAL_STATE & STD_LOGIC_VECTOR(MISSING_SYNC_COUNT) & "000000" & STD_LOGIC_VECTOR(SYNC_COUNT);

end RTL;

-- NOTE: was working for one plane.. but not gauranteed to be aligned..
--   and with 2 planes and a big chipscope.. definitely not aligned
--	process(CLK)
--	begin		
--		if (rising_edge(CLK)) then
--			ddr_shr <= DIN & ddr_shr(7 downto 1);
--			ddr_count <= ddr_count + 1;
--			ddr_old_bitslip <= BITSLIP;
--			if(ddr_old_bitslip = '0' and BITSLIP = '1') then
--			     ddr_bitslip_count <= ddr_bitslip_count + 1;			     
--			end if;
			
--			if( ddr_bitslip_count = ddr_count) then 
--			     Q <= ddr_shr;
--			end if;			
--		end if;
--	end process;
	

	
	
   -- IDELAYE2: Input Fixed or Variable Delay Element
   --           Kintex-7
   -- Xilinx HDL Language Template, version 2015.2

--   IDELAYE2_inst : IDELAYE2
--   generic map (
--      CINVCTRL_SEL => "FALSE",          -- Enable dynamic clock inversion (FALSE, TRUE)
--      DELAY_SRC => "IDATAIN",           -- Delay input (IDATAIN, DATAIN)
--      HIGH_PERFORMANCE_MODE => "TRUE", -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
--      IDELAY_TYPE => "VARIABLE",           -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
--      IDELAY_VALUE => IOBDELAY_VALUE,      -- Input delay tap setting (0-31)
--      PIPE_SEL => "FALSE",              -- Select pipelined mode, FALSE, TRUE
--      REFCLK_FREQUENCY => 200.0,        -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
--      SIGNAL_PATTERN => "DATA"          -- DATA, CLOCK input signal
--   )
--   port map (
--      CNTVALUEOUT => open, -- 5-bit output: Counter value output
--      DATAOUT => DDLY,         -- 1-bit output: Delayed data output
--      C => OUTCLK,                     -- 1-bit input: Clock input
--      CE => DLYCE,                   -- 1-bit input: Active high enable increment/decrement input
--      CINVCTRL => '0',       -- 1-bit input: Dynamic clock inversion input
--      CNTVALUEIN => (others => '0'),   -- 5-bit input: Counter value input
--      DATAIN => '0',           -- 1-bit input: Internal delay data input
--      IDATAIN => DIN,         -- 1-bit input: Data input from the I/O
--      INC => DLYINC,                 -- 1-bit input: Increment / Decrement tap delay input
--      LD => '0',                   -- 1-bit input: Load IDELAY_VALUE input
--      LDPIPEEN => '0',       -- 1-bit input: Enable PIPELINE register to load data input
--      REGRST => DLYRST            -- 1-bit input: Active-high reset tap-delay input
      
--   );

--   -- End of IDELAYE2_inst instantiation
					
--   -- ISERDESE2: Input SERial/DESerializer with Bitslip
--   --            Kintex-7
--   -- Xilinx HDL Language Template, version 2015.2

--   ISERDESE2_inst : ISERDESE2
--   generic map (
     
--      DATA_RATE => "DDR",           -- DDR, SDR
--      DATA_WIDTH => 8,              -- Parallel data width (2-8,10,14)
--      DYN_CLKDIV_INV_EN => "FALSE", -- Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
--      DYN_CLK_INV_EN => "FALSE",    -- Enable DYNCLKINVSEL inversion (FALSE, TRUE)
--      -- INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
--      INIT_Q1 => '0',
--      INIT_Q2 => '0',
--      INIT_Q3 => '0',
--      INIT_Q4 => '0',
--      INTERFACE_TYPE => "NETWORKING",   -- MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
--      IOBDELAY => "BOTH",           -- NONE, BOTH, IBUF, IFD      
--      --OBDELAY_TYPE => "VARIABLE",
--      --IOBDELAY_VALUE => IOBDELAY_VALUE,
--      NUM_CE => 1,                  -- Number of clock enables (1,2)
--      OFB_USED => "FALSE",          -- Select OFB path (FALSE, TRUE)
--      SERDES_MODE => "MASTER",      -- MASTER, SLAVE
--      -- SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
--      SRVAL_Q1 => '0',
--      SRVAL_Q2 => '0',
--      SRVAL_Q3 => '0',
--      SRVAL_Q4 => '0' 
--   )
--   port map (
--      O => SERDES_INPUT,                       -- 1-bit output: Combinatorial output
--      -- Q1 - Q8: 1-bit (each) output: Registered data outputs
--      Q1 => Q(7),
--      Q2 => Q(6),
--      Q3 => Q(5),
--      Q4 => Q(4),
--      Q5 => Q(3),
--      Q6 => Q(2),
--      Q7 => Q(1),
--      Q8 => Q(0),
--      -- SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
--      SHIFTOUT1 => open,
--      SHIFTOUT2 => open,
--      BITSLIP => BITSLIP,           -- 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
--                                    -- CLKDIV when asserted (active High). Subsequently, the data seen on the
--                                    -- Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one
--                                    -- position every time Bitslip is invoked (DDR operation is different from
--                                    -- SDR).
                                    
       

--      -- CE1, CE2: 1-bit (each) input: Data register clock enable inputs
--      CE1 => SERDES_ENABLE,          --CE1 => SERDES_ENABLE
--      CE2 => '0', 
--      CLKDIVP => '0',           -- 1-bit input: TBD
--      -- Clocks: 1-bit (each) input: ISERDESE2 clock input ports
--      CLK => MCLK,                   -- 1-bit input: High-speed clock
--      CLKB => '0',                 -- 1-bit input: High-speed secondary clock
--      CLKDIV => OUTCLK,             -- 1-bit input: Divided clock
--      OCLK => '0',                 -- 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY" 
--      -- Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
--     DYNCLKDIVSEL => '0', -- 1-bit input: Dynamic CLKDIV inversion
--     DYNCLKSEL => '0',       -- 1-bit input: Dynamic CLK/CLKB inversion
--      -- Input Data: 1-bit (each) input: ISERDESE2 data input ports
--      D => '0',                       -- 1-bit input: Data input
--      DDLY => DDLY,                 -- 1-bit input: Serial data from IDELAYE2
--      OFB => '0',                   -- 1-bit input: Data feedback from OSERDESE2
--      OCLKB => '0',               -- 1-bit input: High speed negative edge output clock
--      RST => SERDES_RESET,                   -- 1-bit input: Active high asynchronous reset
--      -- SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
--      SHIFTIN1 => '0',
--      SHIFTIN2 => '0' 
--   );

   -- End of ISERDESE2_inst instantiation
                        
                    
	
	
--  iserdes_master_imp : ISERDES
--  GENERIC MAP (
--    BITSLIP_ENABLE => TRUE,
--    DATA_RATE => "DDR",
--    DATA_WIDTH => 8,
--    INTERFACE_TYPE => "NETWORKING",
--    IOBDELAY => "BOTH",
--    IOBDELAY_TYPE => "VARIABLE",
--    IOBDELAY_VALUE => IOBDELAY_VALUE,
--    NUM_CE => 1,
--    SERDES_MODE => "MASTER"
--  )
--  PORT MAP (
--    O => SERDES_INPUT,
--    Q1 => Q(7),
--    Q2 => Q(6),
--    Q3 => Q(5),
--    Q4 => Q(4),
--    Q5 => Q(3),
--    Q6 => Q(2),
--    SHIFTOUT1 => SHIFTOUT1,
--    SHIFTOUT2 => SHIFTOUT2,
--    SHIFTIN1 => '0',
--    SHIFTIN2 => '0',
--    BITSLIP => BITSLIP,
--    CE1 => SERDES_ENABLE,
--    CLK => MCLK,
--    CLKDIV => OUTCLK,
--    D => DIN,
--    DLYCE => DLYCE,
--    DLYINC => DLYINC,
--    DLYRST => DLYRST,
--    OCLK => '0',
--    REV => '0',
--    SR => SERDES_RESET
--  );
--  iserdes_slave_imp : ISERDES
--  GENERIC MAP (
--    BITSLIP_ENABLE => TRUE,
--    DATA_RATE => "DDR",
--    DATA_WIDTH => 8,
--    INTERFACE_TYPE => "NETWORKING",
--    IOBDELAY => "BOTH",
--    IOBDELAY_TYPE => "VARIABLE",
--    IOBDELAY_VALUE => 0,
--    NUM_CE => 1,
--    SERDES_MODE => "SLAVE"
--  )
--  PORT MAP (
--    Q1 => OPEN,
--    Q2 => OPEN,
--    Q3 => Q(1),
--    Q4 => Q(0),
--    Q5 => OPEN,
--    Q6 => OPEN,
--    BITSLIP => BITSLIP,
--    CE1 => SERDES_ENABLE,
--    CLK => MCLK,
--    CLKDIV => OUTCLK,
--    DLYCE => DLYCE,
--    DLYINC => DLYINC,
--    DLYRST => DLYRST,
--    OCLK => '0',
--    REV => '0',
--    SHIFTIN1 => SHIFTOUT1,
--    SHIFTIN2 => SHIFTOUT2,
--    SHIFTOUT1 => OPEN,
--    SHIFTOUT2 => OPEN,
--    SR => SERDES_RESET
--  );