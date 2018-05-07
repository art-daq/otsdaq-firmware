--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixelmatch - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    matches patterns on pixel input
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

entity pixelmatch is
  port (
    rst : in std_logic;
    pclk : in std_logic;
    enable : in std_logic;
    din : in std_logic_vector(3 downto 0);
    trigger : in std_logic;
    pattern0 : in std_logic_vector(14 downto 0);
    pattern1 : in std_logic_vector(14 downto 0);
    clear : in std_logic;
    trig_count : out std_logic_vector(15 downto 0);
    header_count : out std_logic_vector(15 downto 0);
    match_count0 : out std_logic_vector(15 downto 0);
    match_count1 : out std_logic_vector(15 downto 0)
  );
end pixelmatch;

architecture RTL of pixelmatch is
  type counter_array_t is array(3 downto 0) of unsigned(15 downto 0);
  signal counter : counter_array_t := ( x"0000", x"0000", x"0000", x"0000" );
  signal header : std_logic;
  signal match0 : std_logic;
  signal match1 : std_logic;
  signal input_pipe : std_logic_vector(23 downto 0);
  signal pattern : std_logic_vector(23 downto 0);
  signal trigger_pipe : std_logic_vector(3 downto 0);
  signal trigger_match : std_logic;

begin
  process ( pclk, rst ) begin
    if ( pclk'event and pclk = '1' ) then
      if ( rst = '1' ) then
        counter(0) <= x"0000";
        counter(1) <= x"0000";
        counter(2) <= x"0000";
        counter(3) <= x"0000";
      elsif ( clear = '1' ) then
        counter(0) <= x"0000";
        counter(1) <= x"0000";
        counter(2) <= x"0000";
        counter(3) <= x"0000";
      else
        if ( trigger_match = '1' ) then
          counter(0) <= counter(0) + 1;
        end if;
        if ( enable = '1' ) then
          input_pipe <= pattern;
          if ( header = '1' ) then
            counter(1) <= counter(1) + 1;
          end if;
          if ( match0 = '1' ) then
            counter(2) <= counter(2) + 1;
          end if;
          if ( match1 = '1' ) then
            counter(3) <= counter(3) + 1;
          end if;
        end if;
      end if;
      trigger_pipe <= trigger_pipe(2 downto 0) & trigger;
    end if;
  end process;
  pattern <= input_pipe(19 downto 0) & din;
  header <= '1' when pattern(11 downto 3) = "011111111" else '0';
  match0 <= '1' when pattern(23 downto 9) = pattern0 else '0';
  match1 <= '1' when pattern(23 downto 9) = pattern1 else '0';
  trigger_match <= '1' when trigger_pipe = "0110" else '0';

  trig_count <= std_logic_vector(counter(0));
  header_count <= std_logic_vector(counter(1));
  match_count0 <= std_logic_vector(counter(2));
  match_count1 <= std_logic_vector(counter(3));

end RTL;
