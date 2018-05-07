--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixelreset - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Generates reset signals for PSI ROC hybrid interface
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

entity pixelreset is
  generic (
    n : integer := 1;
    delay : integer := 80
  );
  port (
    pclk : in  std_logic;
    do_reset : in std_logic;
    reset_mask : in  std_logic_vector (n downto 0);
    reset_busy : out std_logic;
    pixel_reset : out  std_logic_vector (n-1 downto 0);
    tbm_reset : out std_logic
  );
end pixelreset;

architecture RTL of pixelreset is
  type state_t is ( Idle,
                    Resetting,
                    Done );
  signal state : state_t := Idle;
  signal count : unsigned(31 downto 0);
begin
  process ( pclk, do_reset ) begin
    if ( pclk'event and pclk = '1' ) then
      case state is
        when Idle =>
          count <= to_unsigned(delay,32);  -- 100 ms
          if ( do_reset = '1' ) then
            reset_busy <= '1';
            pixel_reset <= reset_mask(n-1 downto 0);
            tbm_reset <= reset_mask(n);
            state <= Resetting;
          else
            reset_busy <= '0';
            pixel_reset <= ( others => '0' );
            tbm_reset <= '0';
          end if;
        when Resetting =>
          if ( count = x"00000000" ) then
            reset_busy <= '0';
            pixel_reset <= ( others => '0' );
            tbm_reset <= '0';
            state <= Done;
          else
            count <= count - 1;
          end if;
        when others =>
          if ( do_reset = '0' ) then
            state <= idle;
          end if;
      end case;
    end if;
  end process;

end RTL;
