--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    streampkt - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    streams data on UDP packets
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--  This version inserts the payload checksum as the UDP checksum.
--  It will not transmit frames!!!
--
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity streampkt is
  generic ( id : integer := 0 );
  port (
    reset : in std_logic;
    clk : in std_logic;
    ipbuf_read_enable : out std_logic;
    ipbuf_dout : in std_logic_vector(7 downto 0);
    ipbuf_length : in std_logic_vector(15 downto 0);
    ipbuf_cksum : in std_logic_vector(15 downto 0);
    strobe : in std_logic;
    ready : out std_logic;
    saddr : in std_logic_vector(31 downto 0);
    daddr : in std_logic_vector(31 downto 0);
    sport : in std_logic_vector(15 downto 0);
    dport : in std_logic_vector(15 downto 0);
    arp_strobe : out std_logic;
    arptab_found : in std_logic;
    arptab_missing : in std_logic;
    issue_arp_request : out std_logic;
    protocol : out std_logic_vector(7 downto 0);
    length : out std_logic_vector(15 downto 0);
    ip_header_checksum : in std_logic_vector(15 downto 0);
    dout : out std_logic_vector(7 downto 0);
    request : out std_logic;
    enable : in std_logic_vector(2 downto 0);
    payload_checksum : out std_logic_vector(15 downto 0);
    internal_state : out std_logic_vector(7 downto 0)   -- used for debugging
  );
end streampkt;

architecture RTL of streampkt is
  type State_t is ( Idle,
                    Arping,
                    MoreArping,
                    Arped,
                    Checksum0,
                    Checksum1,
                    Checksum2,
                    Checksum3,
                    Checksum4,
                    Checksum5,
                    Checksum6,
                    Checksum7,
                    Checksum8,
                    Checksum9,
                    Checksum10,
                    Checksum11,
                    Checksum12,
                    Header,
                    Sport1,
                    Dport0,
                    Dport1,
                    Length0,
                    Length1,
                    Udp_checksum0,
                    Udp_checksum1,
                    Data,
                    Done
                  );

  signal state : State_t := Idle;
  signal arp_request : std_logic;
  signal udp_length : std_logic_vector(15 downto 0);
  signal cksum_enable : std_logic;
  signal cksum_clear : std_logic;
  signal carry_high : std_logic;
  signal carry_low : std_logic;
  signal cksum_input : std_logic_vector(15 downto 0);
  signal udp_cksum : std_logic_vector(15 downto 0);
  signal count : unsigned(15 downto 0);
  signal latched_strobe : std_logic;

  component add8
    port (
      a : in std_logic_vector(7 downto 0);
      b : in std_logic_vector(7 downto 0);
      clk : in std_logic;
      c_in : in std_logic;
      ce : in std_logic;
      sclr : in std_logic;
      c_out : out std_logic;
      s : out std_logic_vector(7 downto 0)
    );
  end component;

begin

  sum_low : add8
  port map (
    a => cksum_input(7 downto 0),
    b => udp_cksum(7 downto 0),
    s => udp_cksum(7 downto 0),
    clk => clk,
    ce => cksum_enable,
    sclr => cksum_clear,
    c_out => carry_low,
    c_in => carry_high
  );

  sum_high : add8
  port map (
    a => cksum_input(15 downto 8),
    b => udp_cksum(15 downto 8),
    s => udp_cksum(15 downto 8),
    clk => clk,
    ce => cksum_enable,
    sclr => cksum_clear,
    c_out => carry_high,
    c_in => carry_low
  );

  process ( clk, reset, strobe ) begin
    if ( clk'event and clk = '1' ) then     -- sample data on falling edge of clock
      if ( reset = '1' ) then
        dout <= x"77";   -- we should never see this
        ipbuf_read_enable <= '0';
        request <= '0';
        cksum_clear <= '1';
        cksum_enable <= '0';
        arp_strobe <= '0';
        arp_request <= '0'; 
        ready <= '0';
        internal_state(7) <= '0';
        state <= Idle;
      else
        case state is
          when Idle =>
            if ( strobe = '1' ) then     -- retrieve hw address from arp table or issue an arp request
              arp_strobe <= '1';         -- arptab samples on the rising edge, so it is okay to drive this here
              ready <= '0';                   -- say we're busy until ready to do another packet
              arp_request <= '0'; 
              cksum_clear <= '1';
              cksum_enable <= '0';
              internal_state(7) <= '0';
              state <= Arping;
            else
              ready <= '1';                      -- ready to send any time another packet is ready
              arp_request <= '0'; 
              arp_strobe <= '0';
              request <= '0';
              cksum_clear <= '1';
              cksum_enable <= '0';
            end if;
          when Arping =>
              state <= MoreArping;   -- Extra cycle to allow arp lookup to clear flags and begin
          when MoreArping =>
            if ( arptab_found = '1' ) then
              arp_request <= '0'; 
              state <= Arped;
            elsif ( arptab_missing = '1' ) then
              arp_request <= '1'; 
--
--  Issuing the arp request does not mean that the address will
--  appear on the arptab output... we need to fix this.
--
            end if;
          when Arped =>
            arp_strobe <= '0';
            request <= '1';
            count <= "000" & unsigned(ipbuf_length(12 downto 0)) - 2;
            state <= Checksum0;
          when Checksum0 =>
            cksum_clear <= '0';
            cksum_enable <= '1';
            cksum_input <= ipbuf_cksum;
            state <= Checksum1;
          when Checksum1 =>
            cksum_input <= udp_length;
            state <= Checksum2;
          when Checksum2 =>
            cksum_input <= dport;
            state <= Checksum3;
          when Checksum3 =>
            cksum_input <= sport;
            state <= Checksum4;
          when Checksum4 =>
            cksum_input <= udp_length;
            state <= Checksum5;
          when Checksum5 =>
            cksum_input <= x"0011";
            state <= Checksum6;
          when Checksum6 =>
            cksum_input <= daddr(15 downto 0);
            state <= Checksum7;
          when Checksum7 =>
            cksum_input <= daddr(31 downto 16);
            state <= Checksum8;
          when Checksum8 =>
            cksum_input <= saddr(15 downto 0);
            state <= Checksum9;
          when Checksum9 =>
            cksum_input <= saddr(31 downto 16);
            state <= Checksum10;
          when Checksum10 =>
            cksum_input <= x"0000";
            state <= Checksum11;
          when Checksum11 =>
            cksum_input <= x"0000";
            state <= Checksum12;
          when Checksum12 =>
            cksum_input <= x"0000";
            CKSUM_ENABLE <= '0';
            state <= Header;
          when Header =>      --  We wait here until the header has been sent and the request acknowledged
            dout <= sport(15 downto 8);
            if ( to_integer(unsigned(enable)) = id ) then
              dout <= sport(7 downto 0);
              state <= Sport1;
            end if;
          when Sport1 =>
            dout <= dport(15 downto 8);
            state <= Dport0;
          when Dport0 =>
            dout <= dport(7 downto 0);
            state <= Dport1;
          when Dport1 =>
            dout <= udp_length(15 downto 8);
            state <= Length0;
          when Length0 =>
            dout <= udp_length(7 downto 0);
            state <= Length1;
          when Length1 =>
            dout <= not udp_cksum(15 downto 8);
-- Assert read enable on the FIFO in stripstream.
-- The FIFO will be advanced on the next cycle and
-- the valid data will be latched on the subsequent one.
--            ipbuf_read_enable <= '1';
            state <= Udp_checksum0;
          when Udp_checksum0 =>
            dout <= not udp_cksum(7 downto 0);
            ipbuf_read_enable <= '1';
            if ( count = 0 ) then
              state <= Done;
            else
              state <= Udp_checksum1;
            end if;
          when Udp_checksum1 =>
            dout <= ipbuf_dout;
            state <= Data;
          when Data =>
            dout <= ipbuf_dout;
            if ( count = 0 ) then
              ipbuf_read_enable <= '0';
              state <= Done;
            else
              count <= count - 1;
            end if;
          when Done =>
            request <= '0';
            if ( strobe = '0' ) then
              state <= Idle;
              cksum_clear <= '0';
            end if;
--
--  Not sure how we would end up here, but try to go back to Idle
--  just in case...  this should not be necessary since all cases
--  are covered.
--
          when others =>
            internal_state(7) <= '1';
            state <= Idle;
        end case;
      end if;
    end if;
  end process;

--  this counts the payload, the 20 byte ip header + 8 bytes for the udp header 
  length <= "000" & std_logic_vector(unsigned(ipbuf_length(12 downto 0))+28);
--  this counts the payload + 8 bytes for the udp header 
  udp_length <= "000" & std_logic_vector(unsigned(ipbuf_length(12 downto 0))+8);
  protocol <= x"11";
  payload_checksum <= ipbuf_cksum;
--  this was missing in the mjones_May2014 release...
  issue_arp_request <= arp_request;

  internal_state(6 downto 0) <= "0000000" when reset = '1' else
                                "0000001" when state = Idle and strobe = '1' else
                                "0000010" when state = Idle and strobe = '0' else
                                "0000011" when state = Arping else
                                "0000100" when state = MoreArping else
                                "0000101" when state = Arped else
                                "0000110" when state = Checksum0 else
                                "0000111" when state = Checksum1 else
                                "0001000" when state = Checksum2 else
                                "0001001" when state = Checksum3 else
                                "0001010" when state = Checksum4 else
                                "0001011" when state = Checksum5 else
                                "0001100" when state = Checksum6 else
                                "0001101" when state = Checksum7 else
                                "0001110" when state = Checksum8 else
                                "0001111" when state = Checksum9 else
                                "0010000" when state = Checksum10 else
                                "0010001" when state = Checksum11 else
                                "0010010" when state = Checksum12 else
                                "0010011" when state = Header else
                                "0010100" when state = Sport1 else
                                "0010101" when state = Dport0 else
                                "0010110" when state = Dport1 else
                                "0010111" when state = Length0 else
                                "0011000" when state = Length1 else
                                "0011001" when state = Udp_checksum0 else
                                "0011010" when state = Udp_checksum1 else
                                "0011011" when state = Data else
                                "0011100" when state = Done and strobe = '0' else
                                "0011101" when state = Done and strobe = '1' else
                                "1111111";

end RTL;
