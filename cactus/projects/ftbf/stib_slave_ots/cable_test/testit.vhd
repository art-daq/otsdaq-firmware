--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    22:05:55 11/06/2013 
-- Design Name:    stib
-- Module Name:    testit - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Latches fault in matched pattern
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity testit is
  port (
    clk : in std_logic;
    din : in std_logic;
    test : in std_logic;
    clear : in std_logic;
    fault : out std_logic
  );
end testit;

architecture rtl of testit is

  signal mismatch : std_logic := '0';

begin

  process ( clk, din ) begin
    if ( clk'event and clk = '1' ) then
      if ( clear = '1' ) then
        mismatch <= '0';
      else
        if ( din /= test ) then
          mismatch <= '1';
        end if;
      end if;
    end if;
  end process;
  fault <= mismatch;

end rtl;
