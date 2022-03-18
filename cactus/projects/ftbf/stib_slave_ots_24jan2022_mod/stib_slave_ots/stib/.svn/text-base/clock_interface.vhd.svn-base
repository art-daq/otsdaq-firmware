--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    clock_interface - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    clock slave to hang from the MicroBlaze LMB
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
library stib;
use stib.iobus.ALL;
use stib.clock.ALL;

use IEEE.NUMERIC_STD.ALL;

entity clock_interface is
  PORT (
    CLK : IN STD_LOGIC;
    BUSCLK : IN STD_LOGIC;
    IOBUS : IN iobus_t;
    WRITE_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IOBUS_READY : OUT STD_LOGIC;
    ONEPPS : OUT STD_LOGIC
  );
end clock_interface;

architecture RTL of clock_interface is

  CONSTANT BASE_ADDRESS : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"C200";
  CONSTANT ADDRESS_MASK : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"FFFF";

  CONSTANT ADDRESS_CLOCK_CSR : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0000";
  CONSTANT ADDRESS_CLOCK_TIME : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0004";

  SIGNAL MASKED_ADDRESS : STD_LOGIC_VECTOR(15 DOWNTO 0);
  
  SIGNAL CLOCK_CSR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL CLOCK_LOAD_TIME : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
  SIGNAL CLOCK_TIME : UNSIGNED(31 DOWNTO 0);
  SIGNAL FAST_COUNTER : UNSIGNED(27 DOWNTO 0) := X"0000000";
  SIGNAL CLOCK_LOAD_DONE : STD_LOGIC := '0';
  SIGNAL CLOCK_LOAD_NOW : STD_LOGIC := '0';

--
--  The following modulus is for a 15 ns input clock period.
--
  CONSTANT FAST_MODULUS : UNSIGNED(27 DOWNTO 0) := X"3f940aa";

begin
  PROCESS ( BUSCLK) BEGIN
    IF ( BUSCLK'EVENT AND BUSCLK= '1' ) THEN
      IF ( CLOCK_LOAD_DONE = '1' ) THEN
        CLOCK_LOAD_NOW <= '0';
        CLOCK_LOAD_TIME <= ( OTHERS => '0' );
      END IF;
      IF ( IOBUS.IO_Addr_strobe = '1' and MASKED_ADDRESS = BASE_ADDRESS ) THEN
        IOBUS_READY <= '1';
        CASE IOBUS.IO_Address(15 DOWNTO 0) IS
          WHEN ADDRESS_CLOCK_CSR =>
            IF ( IOBUS.IO_Write_strobe = '1' ) THEN
              CLOCK_CSR <= IOBUS.IO_Write_Data;
            ELSIF ( IOBUS.IO_Read_strobe = '1' ) THEN
              WRITE_DATA <= CLOCK_CSR;
            END IF;
          WHEN ADDRESS_CLOCK_TIME =>
            IF ( IOBUS.IO_Write_strobe = '1' ) THEN
              CLOCK_LOAD_NOW <= '1';
              CLOCK_LOAD_TIME <= IOBUS.IO_Write_Data;
            ELSIF ( IOBUS.IO_Read_strobe = '1' ) THEN
              WRITE_DATA <= STD_LOGIC_VECTOR(CLOCK_TIME);
            END IF;
          WHEN OTHERS =>
            IF ( IOBUS.IO_Read_strobe = '1' ) THEN
              WRITE_DATA <= ( OTHERS => '0' );
            END IF;
        END CASE;
      ELSE
        IOBUS_READY <= '0';
      END IF;
    END IF;
  END PROCESS;

  PROCESS ( CLK, CLOCK_LOAD_NOW ) BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN
      IF ( CLOCK_LOAD_NOW = '1' ) THEN
        CLOCK_TIME <= UNSIGNED(CLOCK_LOAD_TIME);
        CLOCK_LOAD_DONE <= '1';
      ELSE
        CLOCK_LOAD_DONE <= '0';
      END IF;

      IF ( FAST_COUNTER = FAST_MODULUS ) THEN
        FAST_COUNTER <= ( OTHERS => '0' );
        CLOCK_TIME <= CLOCK_TIME + 1;
      ELSE
        FAST_COUNTER <= FAST_COUNTER + 1;
      END IF;
    END IF;
  END PROCESS;

  MASKED_ADDRESS <= IOBUS.IO_Address(31 DOWNTO 16) AND ADDRESS_MASK;
  ONEPPS <= '1' WHEN FAST_COUNTER(27 DOWNTO 24) = "0011" ELSE '0';

end RTL;
