--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    vipicstream - RTL
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vipicstream is
  port (
    reset : in std_logic;
    enable : in std_logic;
    flush : in std_logic;
    packet_size : in std_logic_vector(4 downto 0);
    idle_count : in std_logic_vector(1 downto 0);
    clk : in std_logic;
    din : in std_logic_vector(31 downto 0);
    write_enable : in std_logic;
    status : out std_logic_vector(31 downto 0);
    words_dumped : out std_logic_vector(31 downto 0);
    stream_rclk : in std_logic;
    stream_read_enable : in std_logic;
    stream_dout : out std_logic_vector(7 downto 0);
    stream_length : out std_logic_vector(15 downto 0);
    stream_cksum : out std_logic_vector(15 downto 0);
    stream_strobe : out std_logic;
    stream_ready : in std_logic
  );
end vipicstream;

architecture RTL of vipicstream is

  component streamipbuf
  port (
    rst : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    din : in std_logic_vector(31 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(7 downto 0);
    full : out std_logic;
    empty : out std_logic;
    prog_full : out std_logic
  );
  end component;

  component packetfifo
  port (
    clk : in std_logic;
    rst : in std_logic;
    din : in std_logic_vector(31 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(31 downto 0);
    full : out std_logic;
    empty : out std_logic
  );
  end component;

  signal count : unsigned(8 downto 0);
  signal enabled : std_logic;
  signal empty : std_logic;
  signal full : std_logic;
  signal strobe : std_logic;
  signal last_strobe : std_logic;
  signal input_data : std_logic_vector(31 downto 0);
  signal carry_checksum : std_logic;
  signal streaming : std_logic;
  signal fifo_dout : std_logic_vector(7 downto 0);
  signal term_count : unsigned(8 downto 0);
  signal word_count : unsigned(8 downto 0) := "000010000";
-- Initial value of TERM_COUNT is replaced by STRIP_CSR field after first packet has been transmitted
  signal idle : unsigned(7 downto 0) := x"00";
  signal dump_count : unsigned(31 downto 0) := x"00000000";
  signal stuffed : std_logic;
  signal ever_stuffed : std_logic := '0';

  signal prog_full : std_logic;
  signal packet_fifo_re : std_logic := '0';
  signal cksum_length_input : std_logic_vector(31 downto 0);
  signal cksum_length_output : std_logic_vector(31 downto 0);
  signal packet_fifo_we : std_logic;
  signal packet_fifo_full : std_logic;
  signal packet_fifo_empty : std_logic;
  signal send_packet : std_logic := '0';
  signal latched_stream_ready : std_logic := '0';
  type send_state_t is ( Ready, Read_fifo, Sending_packet );
  signal send_state : send_state_t := Ready;
  signal packet_strobe : std_logic;
  signal add_low : std_logic_vector(15 downto 0);
  signal add_high : std_logic_vector(15 downto 0);
  signal next_cksum_carry : unsigned(16 downto 0);
  signal next_cksum_carry_one : unsigned(16 downto 0);
  signal next_cksum : unsigned(16 downto 0);
  signal cksum : unsigned(16 downto 0);
  signal cksum_carry : unsigned(16 downto 0);
  signal cksum_carry_one : unsigned(16 downto 0);
  signal state : std_logic_vector(7 downto 0) := x"00";

begin

  streamipbuf_imp : streamipbuf
  port map (
    rst => reset,
    wr_clk => clk,
    rd_clk => stream_rclk,
    din => input_data,
    wr_en => streaming,
    rd_en => stream_read_enable,
    dout => fifo_dout,
    full => full,
    empty => empty,
    prog_full => prog_full
  );
  
  packetfifo_imp : packetfifo
  port map (
    rst => reset,
    clk => clk,
    din => cksum_length_input,
    wr_en => packet_fifo_we,
    rd_en => packet_fifo_re,
    dout => cksum_length_output,
    full => packet_fifo_full,
    empty => packet_fifo_empty
  );

  process ( clk ) begin
    if ( clk'event and clk = '1' ) then
      if ( reset = '1' ) then
        idle <= ( others => '0' );
        count <= ( others => '0' );
        next_cksum <= ( others => '0' );
        carry_checksum <= '0';
        strobe <= '0';
        ever_stuffed <= '0';
        dump_count <= ( others => '0' );
        state(3 downto 0) <= "0000";
      elsif ( stuffed = '1' ) then
        ever_stuffed <= '1';
        dump_count <= dump_count + 1;
        state(3 downto 0) <= "1111";
      elsif ( streaming = '1' ) then
        idle <= ( others => '0' );
        add_high <= input_data(31 downto 16);
        if ( next_cksum_carry(16) = '1' ) then
          next_cksum <= '0' & next_cksum_carry_one(15 downto 0);
        else
          next_cksum <= next_cksum_carry;
        end if;
        carry_checksum <= '1';
        if ( count = term_count ) then
          count <= ( others => '0' );
          cksum_length_input(15 downto 0) <= "00000" & std_logic_vector(word_count) & "00";
          state(3 downto 0) <= "0001";
          strobe <= '1';
        elsif ( count = "000000001" ) then
          strobe <= '0';
          state(3 downto 0) <= "0010";
          count <= "000000010";
        else
          state(3 downto 0) <= "0011";
          count <= count + 1;
        end if;
      else
        if ( idle /= x"ff" ) then
          idle <= idle + 1;
        end if;
        carry_checksum <= '0';
        state(3 downto 0) <= "0100";     -- normal idle state
        strobe <= '0';
      end if;
    end if;
  end process;

  process ( clk )
    variable next_word_count : integer;
  begin
    if ( clk'event and clk = '0' ) then
      enabled <= enable;    -- this is set in the iobus clock domain
      words_dumped <= std_logic_vector(dump_count);  -- this is registered to help isolate clock domains
      if ( reset = '1' ) then
        cksum <= ( others => '0' );
        send_state <= ready;
        packet_strobe <= '0';
        last_strobe <= '0';
        state(7 downto 4) <= "0000";
      else
        if ( strobe = '1' and strobe /= last_strobe ) then
          next_word_count := 16*to_integer(unsigned(packet_size)+1);
          if ( next_word_count > 350 ) then
            next_word_count := 350;
          end if;
          word_count <= to_unsigned(next_word_count,9);
          if ( cksum_carry(16) = '1' ) then
            cksum_length_input(31 downto 16) <= std_logic_vector(cksum_carry_one(15 downto 0));
          else
            cksum_length_input(31 downto 16) <= std_logic_vector(cksum_carry(15 downto 0));
          end if;
          packet_fifo_we <= '1';
          cksum <= ( others => '0' );
          state(5 downto 4) <= "01";
        else
          if ( packet_fifo_we = '1' ) then
            packet_fifo_we <= '0';
          end if;
          if ( carry_checksum = '1' ) then
            if ( cksum_carry(16) = '1' ) then
              cksum <= '0' & cksum_carry_one(15 downto 0);
            else
              cksum <= '0' & cksum_carry(15 downto 0);
            end if;
          end if;
          state(5 downto 4) <= "10";    -- normal idle state
        end if;
        last_strobe <= strobe;
        case send_state is
          when ready =>
            if ( packet_fifo_empty = '0' and stream_ready = '1' ) then
              packet_fifo_re <= '1';
              packet_strobe <= '1';
              state(7 downto 6) <= "01";
              send_state <= read_fifo;
            else
              packet_strobe <= '0';
              state(7 downto 6) <= "00";     -- normal idle state
            end if;
          when read_fifo =>
            packet_fifo_re <= '0';
            packet_strobe <= '1';
            state(7 downto 6) <= "10";
            send_state <= sending_packet;
          when sending_packet =>
            if ( stream_ready = '0' ) then
              packet_strobe <= '0';
              state(7 downto 6) <= "11";
              send_state <= ready;
            else
              packet_strobe <= '1';
            end if;
        end case;
      end if;
    end if;
  end process;

  next_cksum_carry <= cksum + unsigned('0' & input_data(15 downto 0));
  next_cksum_carry_one <= cksum + unsigned('0' & input_data(15 downto 0)) + to_unsigned(1,17);
  cksum_carry <= next_cksum + unsigned('0' & add_high);
  cksum_carry_one <= next_cksum + unsigned('0' & add_high) + to_unsigned(1,17);

  stream_strobe <= packet_strobe;
  input_data <= din;
  status <= state &
            ever_stuffed & prog_full & full & empty &
            packet_strobe & stream_ready & packet_fifo_full & packet_fifo_empty &
            std_logic_vector(idle(7 downto 0)) &
            std_logic_vector(count(7 downto 0));
  stream_dout <= fifo_dout;
--  stuffed <= write_enable and enabled and full;
  stuffed <= packet_fifo_we and packet_fifo_full;
--  streaming <= write_enable and enabled and not full;
  streaming <= write_enable and enabled and not prog_full;
  term_count <= word_count-1;
  
  stream_length <= cksum_length_output(15 downto 0);
  stream_cksum <= cksum_length_output(31 downto 16);

end RTL;
