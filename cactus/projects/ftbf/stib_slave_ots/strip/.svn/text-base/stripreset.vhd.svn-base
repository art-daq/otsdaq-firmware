--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripreset - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Generates reset signals for strip sensor hybrid interface
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

entity stripreset is
  generic ( n : integer := 1 );
  port (
    clk : in  std_logic;
    do_reset : in std_logic_vector(7 downto 0);
    reset_mask : in  std_logic_vector (n-1 downto 0);
    reset_busy : out std_logic;
    fssr_reset : out  std_logic_vector (n-1 downto 0);
    fifo_reset : out std_logic_vector (n-1 downto 0);
    error_reset : out std_logic_vector (n-1 downto 0);
    link_reset : out std_logic_vector (n-1 downto 0);
    dac_reset : out std_logic
  );
end stripreset;

architecture RTL of stripreset is
  TYPE state_t is ( Idle,
                    Resetting,
                    Done );
  signal state : state_t := Idle;
  signal count : unsigned(2 downto 0);
  signal action : std_logic_vector(7 downto 0);

begin

  process ( clk, do_reset ) begin
    if ( clk'event and clk = '1' ) then
      action <= do_reset;
      case state is
        when Idle =>
          count <= "111";
          if ( action /= x"00" ) then
            reset_busy <= '1';
            if ( action(7) = '1' ) then
              fssr_reset <= reset_mask;
            else
              fssr_reset <= ( others => '0' );
            end if;
            if ( action(6) = '1' ) then
              fifo_reset <= reset_mask; 
            else
              fifo_reset <= ( others => '0' );
            end if;
            if ( action(5) = '1' ) then
              error_reset <= reset_mask; 
            else
              error_reset <= ( others => '0' );
            end if;
            if ( action(4) = '1' ) then
              link_reset <= reset_mask; 
            else
              link_reset <= ( others => '0' );
            end if;
            if ( action(3) = '1' ) then
              dac_reset <= '1';
            else
              dac_reset <= '0';
            end if;
            state <= Resetting;
          else
            reset_busy <= '0';
            fssr_reset <= ( others => '0' );
            fifo_reset <= ( others => '0' );
            error_reset <= ( others => '0' );
            link_reset <= ( others => '0' );
            dac_reset <= '0';
            state <= Idle;
          end if;
        when Resetting =>
          if ( count = "000" ) then
            reset_busy <= '0';
            fssr_reset <= ( others => '0' );
            fifo_reset <= ( others => '0' );
            error_reset <= ( others => '0' );
            link_reset <= ( others => '0' );
            dac_reset <= '0';
            state <= Done;
          else
            count <= count - 1;
            state <= Resetting;
          end if;
        when Done =>
          if ( action = x"00" ) then
            state <= Idle;
          else
            state <= Done;
          end if;
      end case;
    end if;
  end process;

end RTL;
