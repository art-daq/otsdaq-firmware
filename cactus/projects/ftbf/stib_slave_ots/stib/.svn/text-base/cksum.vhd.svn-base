--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    cksum - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Computes 16-bit one's compliment checksum
--
-- Dependencies:   add8
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cksum is
  Port ( DIN : in  STD_LOGIC_VECTOR (7 downto 0);
         CLK : in  STD_LOGIC;
         ENABLE : in  STD_LOGIC;
         CHECKSUM : out  STD_LOGIC_VECTOR (15 downto 0)
       );
end cksum;

architecture RTL of cksum is

  SIGNAL SUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
  
  SIGNAL ENABLE_HIGH : STD_LOGIC;
  SIGNAL ENABLE_LOW : STD_LOGIC;
  SIGNAL CARRY_LOW : STD_LOGIC;
  SIGNAL CARRY_HIGH : STD_LOGIC;
  SIGNAL CLEAR : STD_LOGIC;
  
  COMPONENT add8
  PORT (
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clk : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    c_out : OUT STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

begin

  sum_low : add8
  PORT MAP (
    A => DIN,
    B => SUM(7 DOWNTO 0),
    S => SUM(7 DOWNTO 0),
    CLK => CLK,
    CE => ENABLE_LOW,
    SCLR => CLEAR,
    C_OUT => CARRY_LOW,
    C_IN => CARRY_HIGH
  );
  sum_high : add8
  PORT MAP (
    A => DIN,
    B => SUM(15 DOWNTO 8),
    S => SUM(15 DOWNTO 8),
    CLK => CLK,
    CE => ENABLE_HIGH,
    SCLR => CLEAR,
    C_OUT => CARRY_HIGH,
    C_IN => CARRY_LOW
  );
  PROCESS ( CLK, ENABLE ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN
      IF ( ENABLE = '0' ) THEN
        ENABLE_HIGH <= '1';
      ELSE
        ENABLE_HIGH <= NOT ENABLE_HIGH;
      END IF;
    END IF;
  END PROCESS;
  CLEAR <= NOT ENABLE;
  ENABLE_LOW <= NOT ENABLE_HIGH;
  CHECKSUM <= NOT SUM;
end RTL;
