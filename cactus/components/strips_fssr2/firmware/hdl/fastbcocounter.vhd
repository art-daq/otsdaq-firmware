----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:01:50 10/17/2013 
-- Design Name: 
-- Module Name:    fastbcocounter - RTL
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fastbcocounter is
    Port ( CLK : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           SCLR : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0)
         );
end fastbcocounter;

architecture RTL of fastbcocounter is
  SIGNAL COUNT : UNSIGNED(2 DOWNTO 0);
begin
  PROCESS ( CLK, SCLR, CE ) BEGIN
    IF ( CLK'EVENT AND CLK = '0' ) THEN
      IF ( SCLR = '1' ) THEN
        COUNT <= "000";
      ELSIF ( CE = '1' ) THEN
        COUNT <= COUNT + 1;
      END IF;
    END IF;
  END PROCESS;

  Q <= STD_LOGIC_VECTOR(COUNT);

end RTL;
