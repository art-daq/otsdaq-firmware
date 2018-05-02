----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:56 10/21/2009 
-- Design Name: 
-- Module Name:    adc_delay_data_logic - Behavioral 
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

entity adc_delay_data_logic is

    Port ( 
			  auto_clk : in  STD_LOGIC;
			  auto_frm : in  STD_LOGIC;
			  auto_rst_clk: in  STD_LOGIC;
			  auto_rst_frm : in  STD_LOGIC;
			  auto_del : in  STD_LOGIC_VECTOR (3 downto 0);
           auto_rst : in  STD_LOGIC_VECTOR (3 downto 0);
           auto_inc_dec : in  STD_LOGIC_VECTOR (3 downto 0);
			  
			  man_rst : in  STD_LOGIC;
			  
			  man_clk_inc : in  STD_LOGIC;
			  man_clk_dec: in  STD_LOGIC;
			  man_frm_inc : in  STD_LOGIC;
			  man_frm_dec : in  STD_LOGIC;
           man_inc : in  STD_LOGIC_VECTOR (3 downto 0);  -- expected to have one mclk pulse width
           man_dec : in  STD_LOGIC_VECTOR (3 downto 0);  -- expected to have one mclk pulse width
			  
			  del_clk : out  STD_LOGIC;
			  del_frm : out  STD_LOGIC;
			  rst_clk : out  STD_LOGIC;
			  rst_frm : out  STD_LOGIC;
			  inc_dec_clk : out  STD_LOGIC;
			  inc_dec_frm : out  STD_LOGIC;
			  
           del_dat : out  STD_LOGIC_VECTOR (3 downto 0);
           rst_dat : out  STD_LOGIC_VECTOR (3 downto 0);
           inc_dec_dat : out  STD_LOGIC_VECTOR (3 downto 0));
			  
end adc_delay_data_logic;

architecture Behavioral of adc_delay_data_logic is

begin

	rst_dat(0) <= auto_rst(0) or man_rst;
	rst_dat(1) <= auto_rst(1) or man_rst;
	rst_dat(2) <= auto_rst(2) or man_rst;
	rst_dat(3) <= auto_rst(3) or man_rst;
		
	rst_clk <= auto_rst_clk or man_rst;
	rst_frm <= auto_rst_frm or man_rst;		  

	del_dat <= auto_del or man_inc or man_dec;
	inc_dec_dat <= (not man_inc and not man_dec and auto_inc_dec) or man_inc;	
	
	del_clk <= auto_clk or man_clk_inc or man_clk_dec;
	inc_dec_clk <= (not man_clk_inc and not man_clk_dec) or man_clk_inc;	
	del_frm <= auto_frm or man_frm_inc or man_frm_dec;
	inc_dec_frm <= (not man_frm_inc and not man_frm_dec) or man_frm_inc;

end Behavioral;

