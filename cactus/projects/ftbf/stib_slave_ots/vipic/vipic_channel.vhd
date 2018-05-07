--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    04:44:19 07/30/2014 
-- Design Name:    stib
-- Module Name:    vipic_channel - RTL
-- Project Name:   STIB firmware for VIPIC readout
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Deserializes data from one pixel group
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

library UNISIM;
use UNISIM.VComponents.all;

entity vipic_channel is
  generic (
    channel : integer := 0;
    iobdelay_value : integer := 0
  );
  port (
    sin : in std_logic;
    sclk : in std_logic;
    invert : in std_logic;
    sclk_enable : in std_logic;
    serial_clk : in std_logic;
    ts_clk : in std_logic;
    sync : out std_logic;
    ts : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(31 downto 0);
    dv : out std_logic;
    ack : in std_logic;
    do_idelay : in std_logic;
    idelay_rst : in std_logic;
    idelay_inc : in std_logic;
    idelay_tap : out std_logic_vector(5 downto 0);
    debug : out std_logic_vector(7 downto 0)
  );
end vipic_channel;

architecture RTL of vipic_channel is

  signal q : std_logic_vector(7 downto 0);
  signal latched_ts : std_logic_vector(7 downto 0);
  signal latched_byte : std_logic_vector(7 downto 0);
  signal word : std_logic_vector(15 downto 0);
  signal serdes_input : std_logic;
  signal rin : std_logic;
  signal valid : std_logic := '0';
  signal linksync : std_logic := '0';
  signal tap : unsigned(5 downto 0) := to_unsigned(iobdelay_value,6);

  type state_t is ( Idle, WaitStart, Reading );
  signal state : state_t := Idle;
  signal count : unsigned(3 downto 0);
  signal empty : std_logic;
begin

  idly_imp : idelay
  generic map (
    iobdelay_type => "VARIABLE",
    iobdelay_value => iobdelay_value
  )
  port map (
    i => sin,
    o => serdes_input,
    c => sclk,
    ce => do_idelay,
    inc => idelay_inc,
    rst => idelay_rst
  );
  rin <= serdes_input xor invert;

--  This is a desparate measure... it looks like the serial lines
--  are inverted, but it is not clear why.
--  rin <= not serdes_input;

  process ( sclk, do_idelay ) begin
    if ( sclk'event and sclk = '1' ) then
      if ( do_idelay = '1' ) then
        if ( idelay_rst = '1' ) then
          tap <= "000000";
        elsif ( idelay_inc = '1' ) then
          tap <= tap + 1;
        else
          tap <= tap - 1;
        end if;
      end if;
    end if;
  end process;
  idelay_tap <= std_logic_vector(tap);

  process ( sclk ) begin
    if ( sclk'event and sclk = '1' ) then
      case state is
        when Idle =>
          word <= ( others => '0' );
          if ( ack = '1' ) then
            valid <= '0';
            empty <= '0';
          end if;
          if ( sclk_enable = '1' ) then
            count <= ( others => '0' );
            state <= WaitStart;
          end if;
        when WaitStart =>
          if ( ack = '1' ) then
            valid <= '0';
            empty <= '0';
          end if;
          if ( word(15 downto 13) = "010" ) then
            state <= Reading;
            linksync <= '1';
            count <= "0011";
          else
            count <= count + 1;
            if ( count = "1111" ) then
              state <= Idle;
              linksync <= '0';
            end if;
          end if;
          word <= rin & word(15 downto 1);
        when Reading =>
          if ( count = "1111" ) then
            if ( invert = '1' ) then
              dout <= "0000" & not std_logic_vector(to_unsigned(channel,4)) & ts & word;
            else
              dout <= "0000" & std_logic_vector(to_unsigned(channel,4)) & ts & word;
            end if;
            if ( word(15 downto 3) /= "0000000000000" ) then
              valid <= '1';
              empty <= '0';
            else
              valid <= '0';
              empty <= '1';
            end if;
            state <= Idle;
          else
            if ( ack = '1' ) then
              valid <= '0';
              empty <= '0';
            end if;
            word <= rin & word(15 downto 1);
            count <= count + 1;
          end if;
      end case;
    end if;
  end process;

  dv <= valid;
  sync <= linksync;
  debug <= linksync & valid & ts_clk & empty & ack & rin & serial_clk & sclk;

end RTL;
