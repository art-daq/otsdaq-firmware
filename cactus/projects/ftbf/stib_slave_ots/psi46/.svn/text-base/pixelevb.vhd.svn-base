--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixelevb - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Builds events for PSI46dig ROC readout
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

entity pixelevb is
  generic (
    n : integer := 1
  );
  port (
    rst : in std_logic;
    pclk : in std_logic;
    trigger : in std_logic;
    bco_counter : in std_logic_vector(47 downto 0);
    trigger_number : in std_logic_vector(39 downto 0);
    enable_mask : in std_logic_vector(n-1 downto 0);
    data_available : in std_logic_vector(n-1 downto 0);
    read_enable : out std_logic_vector(n-1 downto 0);
    din0 : in std_logic_vector(31 downto 0);
    din1 : in std_logic_vector(31 downto 0);
    valid : out std_logic;
    rclk : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(31 downto 0)
  );
end pixelevb;

architecture RTL of pixelevb is

  function next_channel( i : integer;
                         m : std_logic_vector ) return integer is
    variable j : natural := i + 1;
  begin
    while ( j < m'length and m(j) = '0' ) loop
      j := j + 1;
    end loop;
    return j;
  end next_channel;

  function first_channel( m : std_logic_vector ) return integer is
    variable j : natural := 0;
  begin
    while ( j < m'length and m(j) = '0' ) loop
      j := j + 1;
    end loop;
    return j;
  end first_channel;

  component pixelbcofifo
  port (
    rst : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    din : in std_logic_vector(87 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(87 downto 0);
    full : out std_logic;
    empty : out std_logic
  );
  end component;

  type din_array_t is array(n-1 downto 0) of std_logic_vector(31 downto 0);
  signal din : din_array_t;
  type state_t is ( Idle, SendBco, SendTrig0, SendTrig1, Event );
  signal state : state_t := Idle;
  signal i : integer range 0 to n-1;
  signal last_word : std_logic;
  signal more_data : std_logic;
  signal trig_bco : std_logic_vector(87 downto 0);
  signal read_bco : std_logic;
  signal bco_word : std_logic_vector(31 downto 0);
  signal trig_word0 : std_logic_vector(31 downto 0);
  signal trig_word1 : std_logic_vector(31 downto 0);
  signal bco_empty : std_logic;
  signal bco_full : std_logic;
  signal trig : std_logic;
  signal trig_and_bco : std_logic_vector(87 downto 0);

begin

  bcofifo_imp : pixelbcofifo
  port map (
    rst => rst,
    wr_clk => pclk,
    rd_clk => rclk,
    din => trig_and_bco,
    wr_en => trig,
    rd_en => read_bco,
    dout => trig_bco,
    full => bco_full,
    empty => bco_empty
  );

  process ( rclk ) begin
    if ( rclk'event and rclk = '1' ) then
      if ( rst = '1' ) then
        state <= Idle;
      else
        if ( rd_en = '1' ) then
          case state is
            when Idle =>
              if ( more_data = '1' ) then
                i <= first_channel(enable_mask);
                bco_word <= trig_bco(47 downto 24) & x"28";
                trig_word0 <= trig_bco(63 downto 48) & trig_bco(7 downto 0) & x"a8";
                trig_word1 <= trig_bco(87 downto 64) & x"b8";
                read_bco <= '1';
                state <= SendBco;
              else
                state <= Idle;
              end if;
            when SendBco =>
              state <= SendTrig0;
            when SendTrig0 =>
              state <= SendTrig1;
            when SendTrig1 =>
              state <= Event;
            when Event =>
              if ( last_word = '1' ) then
                if ( next_channel(i,enable_mask) = n ) then
                  state <= Idle;
                else
                  i <= next_channel(i,enable_mask);
                end if;
              end if;
          end case;
        end if;
        if ( read_bco = '1' ) then
          read_bco <= '0';
        end if;
      end if;
    end if;
  end process;

  read_enable(0) <= rd_en when state = Event and i = 0 else '0';
  read_enable(1) <= rd_en when state = Event and i = 1 else '0';  -- assumes n=2

  din(0) <= din0;
  din(1) <= din1;                                          -- assumes n=2
  trig_and_bco <= trigger_number & bco_counter;

  dout <= trig_bco(23 downto 0) & x"18" when state = Idle else
          bco_word when state = SendBco else
          trig_word0 when state = SendTrig0 else
          trig_word1 when state = SendTrig1 else
          din(i) when state = Event else ( others => '0' );
  last_word <= din(i)(31);
  more_data <= '1' when enable_mask /= "00" and ( data_available and enable_mask ) = enable_mask else '0';    -- assumes n=2
  valid <= more_data;
  trig <= trigger when enable_mask /= "00" else '0';

end RTL;
