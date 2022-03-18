--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    ipbuf - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Implements a FIFO that computes the length and
--                 the 16-bit ones's compliment checksum as data is
--                 shifted in.
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

entity ipbuf is
  port ( reset : in std_logic;
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
end ipbuf;

architecture RTL of ipbuf is

  signal high_byte : std_logic;
  signal sum : unsigned(17 downto 0);
--  signal addend : std_logic_vector(7 downto 0);
  signal clear_fifo : std_logic;

  signal fifo_full : std_logic;
  signal fifo_empty : std_logic;
  signal fifo_valid : std_logic;
  signal fifo_write_count : std_logic_vector(9 downto 0);
  signal write_count : unsigned(9 downto 0);

  component fb
    port (
      rst : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(7 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(7 downto 0);
      full : out std_logic;
      empty : out std_logic;
      valid : out std_logic
    );
  end component;

begin

  ipfb_imp : fb
  port map (
    rst => clear_fifo,
    wr_clk => wr_clk,
    rd_clk => rd_clk,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => fifo_full,
    empty => fifo_empty,
    valid => fifo_valid
  );
 
  process ( wr_clk, wr_en, clear, reset )
  begin 
    if ( wr_clk'event and wr_clk = '1' ) then
      if ( reset = '1' ) then
        high_byte <= '1';
        sum <= ( others => '0' );
        write_count <= ( others => '0' );
      elsif ( clear = '1' ) then
        high_byte <= '1';
        sum <= ( others => '0' );
        write_count <= ( others => '0' );
      elsif ( wr_en = '1' ) then
        if ( high_byte = '0' ) then
          sum <= "00" & sum(15 downto 0) + unsigned(x"00"&din) + sum(17 downto 16);
        else
          sum <= "00" & sum(15 downto 0) + unsigned(din&x"00") + sum(17 downto 16);
        end if;
        high_byte <= not high_byte;
        write_count <= write_count + 1;
      else
        sum <= "00" & sum(15 downto 0) + sum(17 downto 16);
      end if;
    end if;
  end process;

  clear_fifo <= reset or clear;
  cksum <= std_logic_vector(sum(15 downto 0));
  length(15 downto 13) <= fifo_valid & fifo_full & fifo_empty;
  length(12 downto 0) <= std_logic_vector(unsigned("000"&write_count)) when fifo_valid = '1' else ( others => '0' );
  
end RTL;
