--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    cable_interface - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Interface for testing cables
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
library stib;
use stib.iobus.ALL;

use ieee.numeric_std.all;

entity cable_interface is
  generic (
    nchan : integer := 4
  );
  port (
    busclk : in std_logic;
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    testin : in std_logic_vector(nchan-1 downto 0);
    testout : out std_logic_vector(nchan-1 downto 0)
  );
end cable_interface;

architecture RTL of cable_interface is

  component testit
  port (
    clk : in std_logic;
    din : in std_logic;
    test : in std_logic;
    clear : in std_logic;
    fault : out std_logic
  );
  end component;

  constant base_address : std_logic_vector(15 downto 0) := x"ca00";
  constant address_mask : std_logic_vector(15 downto 0) := x"ffff";

  constant address_cable_csr : std_logic_vector(15 downto 0) := x"0000";
  constant address_cable_bits : std_logic_vector(15 downto 0) := x"0004";
  constant address_cable_fault : std_logic_vector(15 downto 0) := x"0008";
  signal masked_address : std_logic_vector(15 downto 0);
  signal cable_csr : std_logic_vector(31 downto 0);
  signal write_bits : std_logic_vector(31 downto 0);
  signal read_bits : std_logic_vector(31 downto 0);
  signal fault : std_logic_vector(nchan-1 downto 0);
  signal fault_somewhere : std_logic;
  signal clear_fault : std_logic;

begin

  g: for i in 0 to nchan-1 generate
    test_imp : testit
    port map (
      clk => busclk,
      din => read_bits(i),
      test => write_bits(i),
      clear => clear_fault,
      fault => fault(i)
    );
  end generate;

  process ( busclk) begin
    if ( busclk'event and busclk= '1' ) then
      if ( iobus.io_addr_strobe = '1' and masked_address = base_address ) then
        iobus_ready <= '1';
        if ( iobus.io_write_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_cable_csr =>
              clear_fault <= iobus.io_write_data(31);
              cable_csr <= iobus.io_write_data;
            when address_cable_bits =>
              write_bits <= iobus.io_write_data;
            when others =>
          end case;
        end if;
        if ( iobus.io_read_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_cable_csr =>
              write_data <= fault_somewhere & cable_csr(30 downto 8) &
                            std_logic_vector(to_unsigned(nchan,8));
            when address_cable_bits =>
              write_data <= read_bits;
            when address_cable_fault =>
              write_data <= std_logic_vector(to_unsigned(0,32-nchan)) & fault;
            when others =>
              write_data <= x"caf8f8f8";
          end case;
        end if;
      else
        iobus_ready <= '0';
        clear_fault <= '0';
      end if;
    end if;
  end process;

  process ( fault )
    variable bad : std_logic;
  begin
    bad := '0';
    for i in 0 to nchan-1 loop
      bad := bad or fault(i);
    end loop;
    fault_somewhere <= bad;
  end process;

  masked_address <= iobus.io_address(31 downto 16) and address_mask;
  read_bits(nchan-1 downto 0) <= testin;
  read_bits(31 downto nchan) <= ( others => '0' );
  testout <= write_bits(nchan-1 downto 0);

end RTL;
