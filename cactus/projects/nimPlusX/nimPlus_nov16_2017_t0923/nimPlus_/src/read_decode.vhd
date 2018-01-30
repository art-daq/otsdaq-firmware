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

entity read_decode is
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
		 
		 ovfl_16 : in std_logic_vector (15 downto 0);
		 count_out : in std_logic_vector (31 downto 0);		 
		 
		 in_count_0 : in std_logic_vector (31 downto 0);	  
		 in_count_1 : in std_logic_vector (31 downto 0);
		 in_count_2 : in std_logic_vector (31 downto 0);
		 in_count_3 : in std_logic_vector (31 downto 0);
		 ctr_resets : in std_logic_vector (15 downto 0);
		 ctr_enables : in std_logic_vector (15 downto 0);
		 
		 del_ct : in std_logic_vector (127 downto 0);
		 
		 s_del_path : in std_logic_vector(7 downto 0);

		 dur_ct : in std_logic_vector (127 downto 0);		 
		 
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end read_decode;

--}} End of automatically maintained section

architecture read_decode of read_decode is

constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
constant h_16: STD_LOGIC_VECTOR (15 downto 0) := "ZZZZZZZZZZZZZZZZ";   
constant z_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";

begin
	
	p1:	process(rden, addr)
	begin
			if rden = '0' then
				read_data_out <= h_16 & h_16;	 -- High impedance on output
			elsif rden = '1' and
				addr(31 downto 24) = z_8 and
				addr(23 downto 17) = "0000000" then
				
				case addr(16 downto 0) is
						when "00000000000000000" =>	-- dac_data
							read_data_out(15 downto 0) <= dac_data;
							read_data_out(31 downto 16) <= 	z_16;		 
						
						when "00000000000000001" =>	-- dac_ctl
							read_data_out(7 downto 0) <= dac_ctl;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000000000000010" =>
							read_data_out(15 downto 0) <= dlr_o;
							read_data_out(31 downto 16) <= 	z_16;
							
						when "00000000000000011" =>
							read_data_out(7 downto 0) <= lcw_o;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000000000000100" =>
							read_data_out(7 downto 0) <= pw_o;
							read_data_out(31 downto 8) <= 	z_16 & z_8; 
							
						when "00000000000000101" =>
							read_data_out <= h_16 & h_16;	 -- High impedance on output 
						
						when "00000000000000110" =>
							read_data_out(7 downto 0) <= sl_ctl;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000000000000111" =>
							read_data_out(15 downto 0) <= sl_data;
							read_data_out(31 downto 16) <= 	z_16;	 
-- Define channels							
						when "00000000100000010" =>  -- channel 1
							read_data_out(15 downto 0) <= dlr_1;
							read_data_out(31 downto 16) <= 	z_16;
							
						when "00000000100000011" =>
							read_data_out(7 downto 0) <= lcw_1;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000000100000100" =>
							read_data_out(7 downto 0) <= pw_1;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000001000000010" =>  -- channel 2
							read_data_out(15 downto 0) <= dlr_2;
							read_data_out(31 downto 16) <= 	z_16;
							
						when "00000001000000011" =>
							read_data_out(7 downto 0) <= lcw_2;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000001000000100" =>
							read_data_out(7 downto 0) <= pw_2;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000001100000010" =>  -- channel 3
							read_data_out(15 downto 0) <= dlr_3;
							read_data_out(31 downto 16) <= 	z_16;
							
						when "00000001100000011" =>
							read_data_out(7 downto 0) <= lcw_3;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000001100000100" =>
							read_data_out(7 downto 0) <= pw_3;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000010000000010" =>  -- channel 4
							read_data_out(15 downto 0) <= dlr_4;
							read_data_out(31 downto 16) <= 	z_16;
							
						when "00000010000000011" =>
							read_data_out(7 downto 0) <= lcw_4;
							read_data_out(31 downto 8) <= 	z_16 & z_8;
							
						when "00000010000000100" =>
							read_data_out(7 downto 0) <= pw_4;
							read_data_out(31 downto 8) <= 	z_16 & z_8;	
							
						when "00000100000000011" =>
							read_data_out(15 downto 0) <= ovfl_16;
							read_data_out(31 downto 16) <= 	z_16;	
							
						when "00000100000000100" =>
							read_data_out(31 downto 0) <= 	count_out;	
						
						when "00000100000010100" =>
							read_data_out(31 downto 0) <= 	in_count_0;
	
						when "00000100000100100" =>
							read_data_out(31 downto 0) <= 	in_count_1;
	
						when "00000100000110100" =>
							read_data_out(31 downto 0) <= 	in_count_2;
	
						when "00000100001000100" =>
							read_data_out(31 downto 0) <= 	in_count_3;	  
						
						when "11000000000000000" =>
							read_data_out(31 downto 16) <= 	z_16;
							read_data_out(15 downto 0) <= ctr_resets;
							
						when "11000000000000001" =>
							read_data_out(31 downto 16) <= 	z_16;
							read_data_out(15 downto 0) <= ctr_enables;
-- Begin Decoding for start stop counters	
						when "11000000000001010" =>
							read_data_out(31 downto 0) <= del_ct(31 downto 0);
						when "11000000000001011" =>
							read_data_out(31 downto 0) <= del_ct(63 downto 32);
						when "11000000000001100" =>
							read_data_out(31 downto 0) <= del_ct(95 downto 64);
						when "11000000000001101" =>
						read_data_out(31 downto 0) <= del_ct(127 downto 96);
-- End Decoding for start stop counters							
						when "11000000000001110" =>
							read_data_out(31 downto 0) <= z_16 & z_8 & s_del_path(7 downto 0);
-- Begin Decoding for start stop duration counters	
						when "11000000000011010" =>
							read_data_out(31 downto 0) <= dur_ct(31 downto 0);
						when "11000000000011011" =>
							read_data_out(31 downto 0) <= dur_ct(63 downto 32);
						when "11000000000011100" =>
							read_data_out(31 downto 0) <= dur_ct(95 downto 64);
						when "11000000000011101" =>
						read_data_out(31 downto 0) <= dur_ct(127 downto 96);
-- End Decoding for start stop duration counters	   
	
						when others =>
								read_data_out <= h_16 & h_16;	 -- High impedance on output
				end case;
			end if;		 
		end	process p1;
	 -- enter your statements here --

end read_decode;
