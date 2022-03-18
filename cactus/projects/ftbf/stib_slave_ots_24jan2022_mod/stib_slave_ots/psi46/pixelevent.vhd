--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixelevent - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Buffers pixel hits and event header for PSI46dig ROC
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pixelevent is
  generic (
    channel : integer := 0
  );
  port (
    rst : in std_logic;
    pclk : in std_logic;
    trigger : in std_logic;
    latch_bco : out std_logic;
    bco_counter : in std_logic_vector(7 downto 0);
    enable : in std_logic;
    din : in std_logic_vector(3 downto 0);
    dv : in std_logic;
    start_event : in std_logic;
    end_event : in std_logic;
    valid : out std_logic;
    empty : out std_logic_vector(2 downto 0);
    full : out std_logic_vector(2 downto 0);
    count : out std_logic_vector(7 downto 0);
    rclk : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(31 downto 0);
    err : out std_logic
  );
end pixelevent;

architecture RTL of pixelevent is

  component pixelhitfifo
  port (
    rst : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    din : in std_logic_vector(23 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(23 downto 0);
    full : out std_logic;
    empty : out std_logic
  );
  end component;

  component pixeleventfifo
  port (
    rst : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    din : in std_logic_vector(15 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(15 downto 0);
    full : out std_logic;
    empty : out std_logic
  );
  end component;

  component eventbcofifo
  port (
    rst : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    din : in std_logic_vector(7 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(7 downto 0);
    full : out std_logic;
    empty : out std_logic
  );
  end component;

  signal fifo_error : std_logic := '0';
  signal trig_pipe : std_logic_vector(3 downto 0);
  signal trig : std_logic;
  signal hit_count : unsigned(7 downto 0);
  signal stopping : std_logic;
  signal hit_fifo_empty : std_logic;
  signal hit_fifo_full : std_logic;
  signal event_fifo_empty : std_logic;
  signal event_fifo_full : std_logic;
  signal got_hit : std_logic;
  signal got_header : std_logic;
  signal pixel_hit : std_logic_vector(23 downto 0);
  signal header_data : std_logic_vector(15 downto 0);
  signal hit_bits : unsigned(2 downto 0) := "111";
  signal hit_data : std_logic_vector(23 downto 0);
  signal hit_fifo_output : std_logic_vector(23 downto 0);
  signal read_fifo : std_logic;
  signal zero_count : std_logic;
  signal read_count : unsigned(7 downto 0) := ( others => '0' );
  signal write_event_header : std_logic;
  signal read_header_fifo : std_logic;
  signal read_header : std_logic := '1';
  signal event_fifo_output : std_logic_vector(23 downto 0);
  signal fifo_data : std_logic_vector(31 downto 0);
  signal bco_fifo_output : std_logic_vector(7 downto 0);
  signal bco_fifo_empty : std_logic;
  signal bco_fifo_full : std_logic;

begin

  hitfifo_imp : pixelhitfifo
  port map (
    rst => rst,
    wr_clk => pclk,
    rd_clk => rclk,
    din => hit_data,
    wr_en => got_hit,
    rd_en => read_fifo,
    dout => hit_fifo_output,
    full => hit_fifo_full,
    empty => hit_fifo_empty
  );

  evtfifo_imp : pixeleventfifo
  port map (
    rst => rst,
    wr_clk => pclk,
    rd_clk => rclk,
    din => header_data,
    wr_en => write_event_header,
    rd_en => read_header_fifo,
    dout => event_fifo_output(23 downto 8),
    full => event_fifo_full,
    empty => event_fifo_empty
  );

  bcofifo_imp : eventbcofifo
  port map (
    rst => rst,
    wr_clk => pclk,
    rd_clk => rclk,
    din => bco_counter,
    wr_en => trig,
    rd_en => read_header_fifo,
    dout => event_fifo_output(7 downto 0),
    full => bco_fifo_full,
    empty => bco_fifo_empty
  );

  process ( pclk, trigger ) begin
    if ( pclk'event and pclk = '1' ) then
      if ( rst = '1' ) then
        fifo_error <= '0';
      elsif ( enable = '1' ) then
        if ( start_event = '1' ) then
          hit_count <= ( others => '0' );
          stopping <= '0';
        elsif ( end_event = '1' ) then
          stopping <= '1';
        end if;
        if ( hit_bits = "100" ) then
          hit_count <= hit_count + 1;
        end if;
      end if;
      trig_pipe <= trig_pipe(2 downto 0) & trigger;
    end if;
  end process;

  process ( pclk, dv, din ) begin
    if ( pclk'event and pclk = '1' ) then
      if ( rst = '1' ) then
        hit_bits <= "111";
      elsif ( enable = '1' ) then
        if ( dv = '1' ) then
          if ( pixel_hit(7 downto 0) & din(3 downto 2) = "0111111110" ) then
            hit_bits <= "111";
            got_header <= '1';
          else
            if ( hit_bits = "101" ) then
              hit_bits <= "000";
            else
              hit_bits <= hit_bits + 1;
            end if;
            got_header <= '0';
          end if;
          pixel_hit <= pixel_hit(19 downto 0) & din;
        else
          got_header <= '0';
          hit_bits <= "111";
        end if;
      end if;
    end if;
  end process;

  process ( rclk, rst ) begin
    if ( rclk'event and rclk = '1' ) then
      if ( rst = '1' ) then
        read_count <= ( others => '0' );
        read_header <= '1';
      elsif ( rd_en = '1' ) then
        if ( read_header = '1' ) then
          if ( fifo_data(31) = '0' ) then
            read_header <= '0';
          end if;
        elsif ( fifo_data(31) = '1' ) then
          read_header <= '1';
        end if;
      end if;
    end if;
  end process;

  read_header_fifo <= rd_en when read_header = '1' and event_fifo_empty = '0' else '0';
  read_fifo <= rd_en when read_header = '0' and hit_fifo_empty = '0' else '0';

  err <= fifo_error;
  got_hit <= '1' when hit_bits = "101" else '0';
  write_event_header <= ( got_hit or got_header ) and stopping;
  header_data <= zero_count & "000" & std_logic_vector(to_unsigned(channel,4)) & std_logic_vector(hit_count);
  trig <= enable when trig_pipe = "0110" else '0';
  latch_bco <= trig;
  hit_data <= stopping & pixel_hit(23 downto 5) & pixel_hit(3 downto 0);
  valid <= not event_fifo_empty when read_header = '1' else not hit_fifo_empty;
  zero_count <= '1' when hit_count = "00000000" else '0';
  fifo_data <= event_fifo_output & x"0a" when read_header = '1' else hit_fifo_output & x"06";
  dout <= fifo_data;
  empty <= event_fifo_empty & bco_fifo_empty & hit_fifo_empty;
  full <= event_fifo_full & bco_fifo_full & hit_fifo_full;
  count <= event_fifo_output(23 downto 16);

end RTL;
