--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixeli2c - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    i2c interface for PSI46 ROC
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

entity pixeli2c is
  generic (
    n : integer := 1
  );
  port (
    pclk : in std_logic;
    pclk2x : in std_logic;
    strobe : in std_logic;
    busy : out std_logic;
    sel : in std_logic_vector(n-1 downto 0);
    len : in std_logic_vector(7 downto 0);
    restart : in std_logic;
    data : in std_logic_vector(31 downto 0);
    sda : out std_logic_vector(n-1 downto 0)
  );
end pixeli2c;

architecture RTL of pixeli2c is

  type State_t is ( Idle, SendStart, SendData, ExtraBit, SendRestart, SendStop, Stopping );
  signal state : State_t := Idle;
  signal latched_strobe : std_logic;
  signal sda_bit : std_logic := '1';
  signal mask : std_logic_vector(n-1 downto 0);
  signal ibit : integer range 0 to 31;
  signal jbit : integer range 0 to 31;
begin

  process ( pclk2x, strobe ) begin
    if ( pclk2x'event and pclk2x = '0' ) then
      case state is
        when Idle =>
          mask <= ( others => '1' );
          busy <= '0';
          sda_bit <= '1';
          if ( strobe = '1' ) then
            mask <= not sel;
            ibit <= to_integer(unsigned(len(2 downto 0)&"000")-1);
            jbit <= 1;
            state <= sendstart;
            busy <= '1';
          end if;
        when SendStart =>
          if ( pclk = '1' ) then
            sda_bit <= '0';
            state <= SendData;
          end if;
        when SendData =>
          if ( pclk = '0' ) then
            sda_bit <= data(ibit);
            if ( to_unsigned(ibit,3) = 4 or to_unsigned(ibit,3) = 0 ) then
              state <= ExtraBit;
            else
              ibit <= ibit - 1;
              jbit <= jbit + 1;
            end if;
          end if;
        when ExtraBit =>
          if ( pclk = '0' ) then
            sda_bit <= not data(ibit);
            if ( ibit = 0 ) then
              state <= Stopping;
            elsif ( jbit = 8 and restart = '1' ) then
              state <= SendRestart;
            else
              ibit <= ibit - 1;
              jbit <= jbit + 1;
              state <= SendData;
            end if;
          end if;
        when SendRestart =>
          if ( pclk = '0' ) then
            sda_bit <= '1';
            ibit <= ibit - 1;
            jbit <= jbit + 1;
            state <= SendStart;
          end if;
        when Stopping =>
          if ( pclk = '0' ) then
            sda_bit <= '0';
            state <= SendStop;
          end if;
	when SendStop =>
          if ( pclk = '1' ) then
            sda_bit <= '1';
          end if;
          if ( latched_strobe = '0' ) then
            state <= Idle;
          end if;
      end case;
    end if;
  end process;

  sda <= mask when sda_bit = '0' else ( others => '1' );

end RTL;
