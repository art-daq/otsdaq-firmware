-------------------------------------------------------------------------------
--
-- Title       : decode_addr_NIM_Plus_1
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\decode_addr_NIM_Plus_1.vhd
-- Generated   : Thu Apr 28 12:51:32 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {read_decode} architecture {read_decode}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.nim_plus_package_1.all;

entity read_decode_3 is
	port(	  
	
		 rden : in std_logic;
		 
	 	 dac_data : in STD_LOGIC_VECTOR(15 downto 0); 
	 	 dac_ctl : in STD_LOGIC_VECTOR(7 downto 0);
		 
		 dlr_o : in STD_Logic_vector (15 downto 0);
		 lcw_o : in STd_logic_vector (7 downto 0);
		 pw_o	: in STd_logic_vector (7 downto 0);	   
		 
		 sl_data : in STD_LOGIC_VECTOR (15 downto 0);
		 sl_ctl : in STD_LOGIC_VECTOR(7 downto 0);
		 
		 dlr_1 : in STD_Logic_vector (15 downto 0);
		 lcw_1 : in STd_logic_vector (7 downto 0);
		 pw_1	: in STd_logic_vector (7 downto 0);
		 
		 dlr_2 : in STD_Logic_vector (15 downto 0);
		 lcw_2 : in STd_logic_vector (7 downto 0);
		 pw_2	: in STd_logic_vector (7 downto 0);
		 
		 dlr_3 : in STD_Logic_vector (15 downto 0);
		 lcw_3 : in STd_logic_vector (7 downto 0);
		 pw_3	: in STd_logic_vector (7 downto 0);
		 
		 dlr_4 : in STD_Logic_vector (15 downto 0);
		 lcw_4 : in STd_logic_vector (7 downto 0);
		 pw_4	: in STd_logic_vector (7 downto 0);		
		 
		 count_out : in std_logic_vector (63 downto 0);		  
		 
		 ch0_count_in : in std_logic_vector (255 downto 0);
		 ch1_count_in : in std_logic_vector (255 downto 0);
		 ch2_count_in : in std_logic_vector (255 downto 0);
		 ch3_count_in : in std_logic_vector (255 downto 0);
		 
		 c_out_sm : in std_logic_vector (255 downto 0);
		 
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 read_data_out : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end read_decode_3;

--}} End of automatically maintained section

architecture read_decode_3 of read_decode_3 is

constant h_16: STD_LOGIC_VECTOR (15 downto 0) := "ZZZZZZZZZZZZZZZZ";   

begin
	
	p1:	process(rden, addr)
	begin
			if rden = '0' then
				read_data_out <= h_16 & h_16 & h_16 & h_16;	 -- High impedance on output
			elsif rden = '1' and
				addr(31 downto 24) = z8 and
				addr(23 downto 16) = z8 and
				addr(15 downto 11) = "00000" then
				
				case addr(10 downto 0) is
						when "00000000000" =>	-- dac_data
							read_data_out(15 downto 0) <= dac_data;
							read_data_out(31 downto 16) <= 	z16;
							read_data_out(63 downto 32) <= z32;
						
						when "00000000001" =>	-- dac_ctl
							read_data_out(7 downto 0) <= dac_ctl;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when "00000000010" =>
							read_data_out(15 downto 0) <= dlr_o;
							read_data_out(31 downto 16) <= 	z16;	   
							read_data_out(63 downto 32) <= z32;
							
						when "00000000011" =>
							read_data_out(7 downto 0) <= lcw_o;
							read_data_out(31 downto 8) <= 	z16 & z8;	  
							read_data_out(63 downto 32) <= z32;
							
						when "00000000100" =>
							read_data_out(7 downto 0) <= pw_o;
							read_data_out(31 downto 8) <= 	z16 & z8; 
							read_data_out(63 downto 32) <= z32;
							
						when "00000000101" =>
							read_data_out <= h_16 & h_16 & h_16 & h_16;	 -- High impedance on output 
						
						when "00000000110" =>
							read_data_out(7 downto 0) <= sl_ctl;
							read_data_out(31 downto 8) <= 	z16 & z8;		 
							read_data_out(63 downto 32) <= z32;
							
						when "00000000111" =>
							read_data_out(15 downto 0) <= sl_data;
							read_data_out(31 downto 16) <= 	z16;	
							read_data_out(63 downto 32) <= z32;
-- Add read of counters
-- Output counter (sijia's counter)
						when "00000010000" => 
						   	read_data_out(63 downto 0) <= count_out(63 downto 0);	
-- Counters on input channels
-- Channel 0
						when "00000100000" => 
						   	read_data_out(63 downto 0) <= ch0_count_in(63 downto 0);
						when "00000100001" => 
						   	read_data_out(63 downto 0) <= ch0_count_in(127 downto 64);
						when "00000100010" => 
						   	read_data_out(63 downto 0) <= ch0_count_in(191 downto 128);
						when "00000100011" => 
						   	read_data_out(63 downto 0) <= ch0_count_in(255 downto 192);
-- Channel 1
						when "00001000000" => 
						   	read_data_out(63 downto 0) <= ch1_count_in(63 downto 0);
						when "00001000001" => 
						   	read_data_out(63 downto 0) <= ch1_count_in(127 downto 64);
						when "00001000010" => 
						   	read_data_out(63 downto 0) <= ch1_count_in(191 downto 128);
						when "00001000011" => 
						   	read_data_out(63 downto 0) <= ch1_count_in(255 downto 192);
							
-- Channel 2
						when "00001100000" => 
						   	read_data_out(63 downto 0) <= ch2_count_in(63 downto 0);	
						when "00001100001" => 
						   	read_data_out(63 downto 0) <= ch2_count_in(127 downto 64);
						when "00001100010" => 
						   	read_data_out(63 downto 0) <= ch2_count_in(191 downto 128);
						when "00001100011" => 
						   	read_data_out(63 downto 0) <= ch2_count_in(255 downto 192);  
							
-- Channel 3
						when "00010000000" => 
						   	read_data_out(63 downto 0) <= ch3_count_in(63 downto 0);
						when "00010000001" => 
						   	read_data_out(63 downto 0) <= ch3_count_in(127 downto 64);					
						when "00010000010" => 
						   	read_data_out(63 downto 0) <= ch3_count_in(191 downto 128);	
						when "00010000011" => 
						   	read_data_out(63 downto 0) <= ch3_count_in(255 downto 192);		 
							
-- State Machine out count
						when "00010100000" => 
						   	read_data_out(63 downto 0) <= c_out_sm(63 downto 0);	
						when "00010100001" => 
						   	read_data_out(63 downto 0) <= c_out_sm(127 downto 64);		
						when "00010100010" => 
						   	read_data_out(63 downto 0) <= c_out_sm(191 downto 128);		
						when "00010100011" => 
						   	read_data_out(63 downto 0) <= c_out_sm(255 downto 192);
					
-- Define channels							
						when "00100000010" =>  -- channel 1
							read_data_out(15 downto 0) <= dlr_1;
							read_data_out(31 downto 16) <= 	z16;
							read_data_out(63 downto 32) <= z32;
							
						when "00100000011" =>
							read_data_out(7 downto 0) <= lcw_1;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when "00100000100" =>
							read_data_out(7 downto 0) <= pw_1;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when "01000000010" =>  -- channel 2
							read_data_out(15 downto 0) <= dlr_2;
							read_data_out(31 downto 16) <= 	z16;
							read_data_out(63 downto 32) <= z32;
							
						when "01000000011" =>
							read_data_out(7 downto 0) <= lcw_2;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when "01000000100" =>
							read_data_out(7 downto 0) <= pw_2;
							read_data_out(31 downto 8) <= 	z16 & z8;
							
						when "01100000010" =>  -- channel 3
							read_data_out(15 downto 0) <= dlr_3;
							read_data_out(31 downto 16) <= 	z16;
							read_data_out(63 downto 32) <= z32;
							
						when "01100000011" =>
							read_data_out(7 downto 0) <= lcw_3;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when "01100000100" =>
							read_data_out(7 downto 0) <= pw_3;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when "10000000010" =>  -- channel 4
							read_data_out(15 downto 0) <= dlr_4;
							read_data_out(31 downto 16) <= 	z16;
							read_data_out(63 downto 32) <= z32;
							
						when "10000000011" =>
							read_data_out(7 downto 0) <= lcw_4;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when "10000000100" =>
							read_data_out(7 downto 0) <= pw_4;
							read_data_out(31 downto 8) <= 	z16 & z8;
							read_data_out(63 downto 32) <= z32;
							
						when others =>
								read_data_out <= h_16 & h_16 & h_16 & h_16;	 -- High impedance on output
				end case;
			end if;		 
		end	process p1;
	 -- enter your statements here --

end read_decode_3;
