----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:01 11/24/2009 
-- Design Name: 
-- Module Name:    temp_counter_buffer - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity temp_counter_buffer is
    Port ( tok_num : in  STD_LOGIC_VECTOR (79 downto 0);
           trig_num : in  STD_LOGIC_VECTOR (19 downto 0);
           read_wd0 : out  STD_LOGIC_VECTOR (63 downto 0);
           read_wd1 : out  STD_LOGIC_VECTOR (63 downto 0));
end temp_counter_buffer;

architecture Behavioral of temp_counter_buffer is

begin

	read_wd0(19 downto 0) <= trig_num;
	read_wd0(63 downto 44) <= tok_num(79 downto 60);
	read_wd1(63 downto 60) <= (others => '0');
	read_wd1(59 downto 0) <= tok_num(59 downto 0);
	

end Behavioral;

