--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    04:44:19 07/30/2014 
-- Design Name:    stib
-- Module Name:    vipic_test - RTL
-- Project Name:   STIB firmware for VIPIC readout
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Deserializes data from 16 pixel groups
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

entity vipic_test is
  port (
    sout : out std_logic_vector(3 downto 0);
    serial_clk : in std_logic;
    rstrobe : in std_logic;
    write_strobe : in std_logic;
    busy : out std_logic;
    address : in std_logic_vector(7 downto 0);
    count : in std_logic_vector(3 downto 0);
    mask : in std_logic_vector(15 downto 0)
  );
end vipic_test;

architecture RTL of vipic_test is

  signal test_busy : std_logic := '0';
  signal bit_count : unsigned(3 downto 0) := "0000";
  type dout_array_t is array(15 downto 0) of std_logic_vector(15 downto 0);
  signal dout : dout_array_t;

begin

  process ( serial_clk ) begin
    if ( serial_clk'event and serial_clk = '1' ) then
      if ( bit_count = "0000" ) then
        if ( test_busy = '1' ) then
          test_busy <= write_strobe;
          for i in 0 to 15 loop
            dout(i) <= "1111111100000010";
          end loop;
        elsif ( write_strobe = '1' ) then
          test_busy <= '1';
          for i in 0 to 15 loop
            if ( mask(i) = '1' ) then
              dout(i) <= not address & '0' & count & "010";
            else
              dout(i) <= "1111111100000010";
            end if;
          end loop;
        else
          for i in 0 to 15 loop
            dout(i) <= "1111111100000010";
          end loop;
        end if;
      else
        for i in 0 to 15 loop
          dout(i) <= '0' & dout(i)(15 downto 1);
        end loop;
      end if;
      bit_count <= bit_count + 1;
    end if;
  end process;

  busy <= test_busy;
  sout(0) <= dout(0)(0);
  sout(1) <= dout(1)(0);
  sout(2) <= dout(2)(0);
  sout(3) <= dout(3)(0);

end RTL;
