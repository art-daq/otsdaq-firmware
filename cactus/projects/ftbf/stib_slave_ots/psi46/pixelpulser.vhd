--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixelpulser - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    generates cal/trig pulses
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

entity pixelpulser is
  port (
    rst : in std_logic;
    pclk : in std_logic;
    start : in std_logic;
    busy : out std_logic;
    count : in std_logic_vector(15 downto 0);
    bco_match : in std_logic_vector(7 downto 0);
    bco : in std_logic_vector(7 downto 0);
    do_cal : out std_logic;
    do_trig : out std_logic;
    tbm_busy : in std_logic
  );
end pixelpulser;

architecture RTL of pixelpulser is
  type state_t is ( Idle, GetReady, FirePulser, NextPulse, Done );
  signal state : state_t;
  signal remaining : unsigned(15 downto 0);
begin
  process ( pclk, rst ) begin
    if ( pclk'event and pclk = '1' ) then
      if ( rst = '1' ) then
        state <= Idle;
      else 
        case state is
          when Idle =>
            do_cal <= '0';
            do_trig <= '0';
            if ( start = '1' ) then
              busy <= '1';
              if ( count = x"0000" ) then
                state <= Done;
              else
                remaining <= unsigned(count)-1;
                state <= GetReady;
              end if;
            end if;
          when GetReady =>
            if ( tbm_busy = '0' and bco = bco_match ) then
              state <= FirePulser;
            end if;
          when FirePulser =>
            do_cal <= '1';
            do_trig <= '1';
            if ( tbm_busy = '1' ) then
              state <= NextPulse;
            end if;
          when NextPulse =>
            do_cal <= '0';
            do_trig <= '0';
            if ( tbm_busy = '0' ) then
              if ( remaining = x"0000" ) then
                state <= Done;
              else
                remaining <= remaining - 1;
                state <= GetReady;
              end if;
            end if;
          when Done =>
            if ( start = '0' ) then
              busy <= '0';
              state <= Idle;
            end if;
        end case;
      end if;
    end if;
  end process;

end RTL;
