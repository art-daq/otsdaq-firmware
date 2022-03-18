--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    sendpkt - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Sends a UDP packet
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

entity sendpkt is
  generic ( id : integer := 0 );
  port (
    reset : in std_logic;
    clk : in std_logic;
    strobe : in std_logic;
    wr_clk : in std_logic;
    din : in std_logic_vector(7 downto 0);
    wr_en : in std_logic;
    clear : in std_logic;
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
end sendpkt;

architecture RTL of sendpkt is
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
  signal ipbuf_read_enable : std_logic;
  signal ipbuf_dout : std_logic_vector(7 downto 0);
  signal ipbuf_length : std_logic_vector(15 downto 0);
  signal ipbuf_cksum : std_logic_vector(15 downto 0);
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

  component ipbuf
    port (
      reset : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(7 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(7 downto 0);
      length : out std_logic_vector(15 downto 0);
      clear : in std_logic;
      cksum : out std_logic_vector(15 downto 0)
    );
  end component;

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

    ipbuf_imp : ipbuf
    port map (
      reset => reset,
      wr_clk => wr_clk,
      rd_clk => clk,
      din => din,
      wr_en => wr_en,
      rd_en => ipbuf_read_enable,
      dout => ipbuf_dout,
      length => ipbuf_length,
      clear => clear,
      cksum => ipbuf_cksum
    );

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
        internal_state <= x"ff";
        state <= idle;
      else
        case state is
          when Idle =>
            if ( strobe = '1' ) then     -- retrieve hw address from arp table or issue an arp request
              arp_strobe <= '1';         -- arptab samples on the rising edge, so it is okay to drive this here
              arp_request <= '0'; 
              cksum_clear <= '1';
              cksum_enable <= '0';
              internal_state <= x"01";
              state <= Arping;
            else
              arp_request <= '0'; 
              arp_strobe <= '0';
              request <= '0';
              cksum_clear <= '1';
              cksum_enable <= '0';
              internal_state <= x"00";
            end if;
          when Arping =>
            state <= MoreArping;   -- Extra cycle to allow arp lookup to clear flags and begin
          when MoreArping =>
            if ( arptab_found = '1' ) then
              arp_request <= '0'; 
              internal_state <= x"02";
              state <= Arped;
            elsif ( arptab_missing = '1' ) then
              internal_state <= x"03";
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
            internal_state <= x"04";
            state <= Checksum0;
          when Checksum0 =>
            cksum_clear <= '0';
            cksum_enable <= '1';
            cksum_input <= ipbuf_cksum;
            internal_state <= x"05";
            state <= Checksum1;
          when Checksum1 =>
            cksum_input <= udp_length;
            internal_state <= x"06";
            state <= Checksum2;
          when Checksum2 =>
            cksum_input <= dport;
            internal_state <= x"07";
            state <= Checksum3;
          when Checksum3 =>
            cksum_input <= sport;
            internal_state <= x"08";
            state <= Checksum4;
          when Checksum4 =>
            cksum_input <= udp_length;
            internal_state <= x"09";
            state <= Checksum5;
          when Checksum5 =>
            cksum_input <= x"0011";
            internal_state <= x"0a";
            state <= Checksum6;
          when Checksum6 =>
            cksum_input <= daddr(15 downto 0);
            internal_state <= x"0b";
            state <= Checksum7;
          when Checksum7 =>
            cksum_input <= daddr(31 downto 16);
            internal_state <= x"0c";
            state <= Checksum8;
          when Checksum8 =>
            cksum_input <= saddr(15 downto 0);
            internal_state <= x"0d";
            state <= Checksum9;
          when Checksum9 =>
            cksum_input <= saddr(31 downto 16);
            internal_state <= x"0e";
            state <= Checksum10;
          when Checksum10 =>
            cksum_input <= x"0000";
            internal_state <= x"0f";
            state <= Checksum11;
          when Checksum11 =>
            internal_state <= x"0f";
            state <= Checksum12;
          when Checksum12 =>
            cksum_enable <= '0';
            internal_state <= x"0f";
            state <= Header;
          when Header =>      --  We wait here until the header has been sent and the request acknowledged
            dout <= sport(15 downto 8);
            if ( to_integer(unsigned(enable)) = id ) then
              dout <= sport(7 downto 0);
              internal_state <= x"10";
              state <= Sport1;
            end if;
          when Sport1 =>
            dout <= dport(15 downto 8);
            internal_state <= x"11";
            state <= Dport0;
          when Dport0 =>
            dout <= dport(7 downto 0);
            internal_state <= x"12";
            state <= Dport1;
          when Dport1 =>
            dout <= udp_length(15 downto 8);
            internal_state <= x"13";
            state <= Length0;
          when Length0 =>
            dout <= udp_length(7 downto 0);
            internal_state <= x"14";
            state <= Length1;
          when Length1 =>
            dout <= not udp_cksum(15 downto 8);
            internal_state <= x"15";
            state <= Udp_checksum0;
          when Udp_checksum0 =>
            dout <= not udp_cksum(7 downto 0);
            if ( count = 0 ) then
              state <= Done;
            else
              internal_state <= x"16";
              ipbuf_read_enable <= '1';  -- FIFO output is advanced on next rising edge
              state <= Udp_checksum1;
            end if;
          when Udp_checksum1 =>
            dout <= ipbuf_dout;
            internal_state <= x"17";
            state <= Data;
          when Data =>
            dout <= ipbuf_dout;
            if ( count = 0 ) then
              internal_state <= x"18";
              ipbuf_read_enable <= '0';
              state <= Done;
            else
              count <= count - 1;
            end if;
          when Done =>
            request <= '0';
            internal_state <= x"19";
            if ( strobe = '0' ) then
              cksum_clear <= '0';
              internal_state <= x"1a";
              state <= Idle;
            end if;
-- Not sure how we would end up here, but try to go back to Idle just in case...
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

end RTL;
