----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    22:50:42 11/01/2013 
-- Design Name:    stib
-- Module Name:    trigprim - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    processes trigger primitives
--
-- Dependencies:   chip_fifo
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity trigprim is
  generic (
    datatype : std_logic_vector(7 downto 0) := x"f8"
  );
  port (
    reset : in std_logic;
    trig_input : in  std_logic_vector(1 downto 0);
    enable_input : in std_logic_vector(1 downto 0);
    fbcoclk : in  std_logic;
    bcoclk : in  std_logic;
    bco : in  std_logic_vector (7 downto 0);
    fbco : in  std_logic_vector (2 downto 0);
    bco_trim : in std_logic_vector(3 downto 0);
    fbco_trim_0 : in std_logic_vector(3 downto 0);
    trig_mask_0 : in  std_logic_vector (7 downto 0);
    fbco_trim_1 : in std_logic_vector(3 downto 0);
    trig_mask_1 : in  std_logic_vector (7 downto 0);
    trig_output : out  std_logic;
    send_trig : in std_logic;
    spy_data : out std_logic_vector(31 downto 0);
    spy_data_valid : out std_logic;
    rdclk : in std_logic;                   -- reads the data fifo
    fifo_empty : out std_logic;             -- data fifo empty flag
    dout : out std_logic_vector(31 downto 0);  -- fifo output
    token_in : in std_logic;                -- token in
    token_out : out std_logic;              -- token out
    dout_valid : out std_logic             -- asserted when data is being read
  );
end trigprim;

architecture Behavioral of trigprim is

  COMPONENT chip_fifo
    PORT (
      rst : IN STD_LOGIC;
      wr_clk : IN STD_LOGIC;
      rd_clk : IN STD_LOGIC;
      din : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
      wr_en : IN STD_LOGIC;
      rd_en : IN STD_LOGIC;
      dout : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
      full : OUT STD_LOGIC;
      empty : OUT STD_LOGIC
    );
  END COMPONENT;
 
  constant pipeline_length : integer := 16;
  type trigger_pipeline_t is array(1 downto 0) of std_logic_vector(pipeline_length-1 downto 0);
  type trigger_time_pattern_t is array(1 downto 0) of std_logic_vector(7 downto 0);
  signal triggered : std_logic_vector(1 downto 0);
  signal trigger_input_pipeline : trigger_pipeline_t;
  signal trigger_pattern : trigger_time_pattern_t;
  signal trimmed_bco : std_logic_vector(7 downto 0);
  signal latched_trigger_input : std_logic_vector(1 downto 0);
 
  signal trigger_fifo_we : std_logic;
  signal trigger_fifo_data : std_logic_vector(35 downto 0);

  signal trigger_pipe_0 : std_logic_vector(7 downto 0);
  signal trigger_pipe_1 : std_logic_vector(7 downto 0);
  SIGNAL READ_ENABLE : STD_LOGIC;
  SIGNAL TOKEN : STD_LOGIC;
  SIGNAL NEXT_TOKEN_OUT : STD_LOGIC;
  SIGNAL TRIG_FIFO_EMPTY : STD_LOGIC;
  SIGNAL TRIG_FIFO_FULL : STD_LOGIC;
  SIGNAL FIFO_OUTPUT : STD_LOGIC_VECTOR(35 DOWNTO 0);

begin

  fifo_imp : chip_fifo
  PORT MAP (
    RST => RESET,
    WR_CLK => BCOCLK,
    RD_CLK => RDCLK,
    DIN => TRIGGER_FIFO_DATA,
    WR_EN => TRIGGER_FIFO_WE,
    RD_EN => READ_ENABLE,
    FULL => TRIG_FIFO_FULL,
    EMPTY => TRIG_FIFO_EMPTY,
    DOUT => FIFO_OUTPUT
  );
 
  process ( fbcoclk, trig_input ) begin
    if ( fbcoclk'event and fbcoclk = '0' ) then
      latched_trigger_input <= trig_input;
    end if;
  end process;

  process ( latched_trigger_input, trig_input, fbcoclk ) begin
    if ( fbcoclk'event and fbcoclk = '1' ) then
      trigger_input_pipeline(0) <= trigger_input_pipeline(0)(pipeline_length-3 downto 0) &
                                   latched_trigger_input(0) & trig_input(0);
      trigger_input_pipeline(1) <= trigger_input_pipeline(1)(pipeline_length-3 downto 0) &
                                   latched_trigger_input(1) & trig_input(1);
    end if;
  end process;

  process ( bcoclk, triggered ) begin
    if ( bcoclk'event and bcoclk = '1' ) then
      if ( triggered(0) = '1' ) then
        trigger_pipe_0 <= ( trigger_pipe_0(6 downto 0) or trig_mask_0(7 downto 1) ) & trig_mask_0(0);
      else
        trigger_pipe_0 <= trigger_pipe_0(6 downto 0) & '0';
      end if;
      if ( triggered(1) = '1' ) then
        trigger_pipe_1 <= ( trigger_pipe_1(6 downto 0) or trig_mask_1(7 downto 1) ) & trig_mask_1(0);
      else
        trigger_pipe_1 <= trigger_pipe_1(6 downto 0) & '0';
      end if;
    end if;
  end process;
 
  process ( rdclk ) begin
    if ( rdclk'event and rdclk = '1' ) then
      if ( reset = '1' ) then
        token <= '0';
      else
        if ( trig_fifo_empty = '0' ) then
          if ( token_in = '1' ) then
            token <= '1';
            dout_valid <= '1';
          else
            token <= '0';
            dout_valid <= '0';
          end if;
        else
          token <= '0';
          dout_valid <= '0';
        end if;
      end if;
    end if;
  end process;

  trigger_pattern(0) <= ( others => '0' ) when enable_input(0) = '0' else
                        trigger_input_pipeline(0)(5 downto 0) &
                          latched_trigger_input(0) & trig_input(0) when fbco_trim_0 = "0000" else
                        trigger_input_pipeline(0)(6 downto 0) &
                          latched_trigger_input(0) when fbco_trim_0 = "0001" else
                        trigger_input_pipeline(0)(7 downto 0) when fbco_trim_0 = "0010" else
                        trigger_input_pipeline(0)(8 downto 1) when fbco_trim_0 = "0011" else
                        trigger_input_pipeline(0)(9 downto 2) when fbco_trim_0 = "0100" else
                        trigger_input_pipeline(0)(10 downto 3) when fbco_trim_0 = "0101" else
                        trigger_input_pipeline(0)(11 downto 4) when fbco_trim_0 = "0110" else
                        trigger_input_pipeline(0)(12 downto 5) when fbco_trim_0 = "0111" else
                        trigger_input_pipeline(0)(13 downto 6) when fbco_trim_0 = "1000" else ( others => '0' );
  trigger_pattern(1) <= ( others => '0' ) when enable_input(1) = '0' else
                        trigger_input_pipeline(1)(5 downto 0) &
                          latched_trigger_input(1) & trig_input(1) when fbco_trim_1 = "0000" else
                        trigger_input_pipeline(1)(6 downto 0) &
                          latched_trigger_input(1) when fbco_trim_1 = "0001" else
                        trigger_input_pipeline(1)(7 downto 0) when fbco_trim_1 = "0010" else
                        trigger_input_pipeline(1)(8 downto 1) when fbco_trim_1 = "0011" else
                        trigger_input_pipeline(1)(9 downto 2) when fbco_trim_1 = "0100" else
                        trigger_input_pipeline(1)(10 downto 3) when fbco_trim_1 = "0101" else
                        trigger_input_pipeline(1)(11 downto 4) when fbco_trim_1 = "0110" else
                        trigger_input_pipeline(1)(12 downto 5) when fbco_trim_1 = "0111" else
                        trigger_input_pipeline(1)(13 downto 6) when fbco_trim_1 = "1000" else ( others => '0' );

  triggered(0) <= enable_input(0) when trigger_pattern(0) /= "00000000" else '0';
  triggered(1) <= enable_input(1) when trigger_pattern(1) /= "00000000" else '0';

-- 2's compliment math for adding bco trim offset
  trimmed_bco <= std_logic_vector(unsigned(bco)+unsigned(bco_trim(2 downto 0))) when bco_trim(3) = '0' else
                 std_logic_vector(unsigned(bco)-unsigned(not bco_trim(2 downto 0))-1);

  trigger_fifo_data <= "0000" & trigger_pattern(1) & trigger_pattern(0) & trimmed_bco & datatype;
  trigger_fifo_we <= ( triggered(0) or triggered(1) ) and send_trig;
  trig_output <= ( trigger_pipe_0(7) and enable_input(0) ) or ( trigger_pipe_1(7) and enable_input(1) );

  spy_data <= trigger_pattern(1) & trigger_pattern(0) & trimmed_bco & datatype;
  spy_data_valid <= triggered(0) or triggered(1);

  fifo_empty <= trig_fifo_empty;
  dout <= fifo_output(31 downto 0);
  token_out <= token or token_in when trig_fifo_empty = '1' else token;
  read_enable <= token_in and not trig_fifo_empty;
  
end Behavioral;
