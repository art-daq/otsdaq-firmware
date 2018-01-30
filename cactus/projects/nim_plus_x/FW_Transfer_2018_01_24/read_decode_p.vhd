-------------------------------------------------------------------------------
--
-- Title       : read_decode_p
-- Design      : NIMPlus
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\ead_decode_p.vhd
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

entity read_decode_p is
	port(	  
	
		 rden : in std_logic;
		 
	 	 rd_0 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_1 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_2 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_3 : in STD_LOGIC_VECTOR(63 downto 0);
	 	 rd_4 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_5 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_6 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_7 : in STD_LOGIC_VECTOR(63 downto 0);
	 	 rd_8 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_9 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_10 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_11 : in STD_LOGIC_VECTOR(63 downto 0);
	 	 rd_12 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_13 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_14 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_15 : in STD_LOGIC_VECTOR(63 downto 0);
	 	 rd_16 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_17 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_18 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_19 : in STD_LOGIC_VECTOR(63 downto 0);
	 	 rd_20 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_21 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_22 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_23 : in STD_LOGIC_VECTOR(63 downto 0);
	 	 rd_24 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_25 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_26 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_27 : in STD_LOGIC_VECTOR(63 downto 0);
	 	 rd_28 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_29 : in STD_LOGIC_VECTOR(63 downto 0); 
		 rd_30 : in STD_LOGIC_VECTOR(63 downto 0); 	  
		 rd_31 : in STD_LOGIC_VECTOR(63 downto 0);		 
		 		 
		 
		 addr : in STD_LOGIC_VECTOR(31 downto 0);
		 read_data_out: out STD_LOGIC_VECTOR(63 downto 0)
	     );
end read_decode_p;

--}} End of automatically maintained section

architecture read_decode_p of read_decode_p is

constant z_8: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
constant h_16: STD_LOGIC_VECTOR (15 downto 0) := "ZZZZZZZZZZZZZZZZ";   
constant z_16: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
      
       signal addrDebug,dataDebug : STD_LOGIC_VECTOR(7 downto 0);
       signal read_data_out_sig : STD_LOGIC_VECTOR(63 downto 0);
              
       attribute mark_debug : string;
       attribute mark_debug of addrDebug : signal is "true";
       attribute mark_debug of dataDebug : signal is "true";
     
   begin
       addrDebug <= addr(7 downto 0);
       dataDebug <= read_data_out_sig(7 downto 0);
       read_data_out <= read_data_out_sig;
    
	p1:	process(--rden, 
	rd_0, rd_1, rd_2, rd_3, rd_4, rd_5, rd_6, rd_7, rd_8, rd_9, rd_10, rd_11, rd_12, rd_13, rd_14, rd_15, rd_16, rd_17, rd_18, rd_19, rd_20, rd_21, rd_22, rd_23, rd_24, rd_25, rd_26, rd_27, rd_28, rd_29, rd_30, rd_31, addr)
	begin
			--if rden = '0' then
			--	read_data_out_sig <= h_16 & h_16 & h_16 & h_16;	 -- High impedance on output
			--elsif rden = '1' then -- and
				--addr(31 downto 16) = z_16 and
				--addr(15 downto 8) = z_8 then
				
				case addr(7 downto 0) is
						when "00000000" =>
							read_data_out_sig(63 downto 0) <= rd_0(63 downto 0);		 
						when "00000001" =>
							read_data_out_sig(63 downto 0) <= rd_1(63 downto 0);
						when "00000010" =>
							read_data_out_sig(63 downto 0) <= rd_2(63 downto 0);   
						when "00000011" =>
							read_data_out_sig(63 downto 0) <= rd_3(63 downto 0);
						when "00000100" =>
							read_data_out_sig(63 downto 0) <= rd_4(63 downto 0);	
						when "00000101" =>
							read_data_out_sig(63 downto 0) <= rd_5(63 downto 0);
						when "00000110" =>
							read_data_out_sig(63 downto 0) <= rd_6(63 downto 0);
						when "00000111" =>
							read_data_out_sig(63 downto 0) <= rd_7(63 downto 0);   	 -- Channels 0 - 7
						
						when "00001000" =>
							read_data_out_sig(63 downto 0) <= rd_8(63 downto 0);		 
						when "00001001" =>
							read_data_out_sig(63 downto 0) <= rd_9(63 downto 0);
						when "00001010" =>
							read_data_out_sig(63 downto 0) <= rd_10(63 downto 0);   
						when "00001011" =>
							read_data_out_sig(63 downto 0) <= rd_11(63 downto 0);
						when "00001100" =>
							read_data_out_sig(63 downto 0) <= rd_12(63 downto 0);	
						when "00001101" =>
							read_data_out_sig(63 downto 0) <= rd_13(63 downto 0);
						when "00001110" =>
							read_data_out_sig(63 downto 0) <= rd_14(63 downto 0);
						when "00001111" =>
							read_data_out_sig(63 downto 0) <= rd_15(63 downto 0);		   		-- Channels 8 - 15

						when "00010000" =>
							read_data_out_sig(63 downto 0) <= rd_16(63 downto 0);		 
						when "00010001" =>
							read_data_out_sig(63 downto 0) <= rd_17(63 downto 0);
						when "00010010" =>
							read_data_out_sig(63 downto 0) <= rd_18(63 downto 0);   
						when "00010011" =>
							read_data_out_sig(63 downto 0) <= rd_19(63 downto 0);
						when "00010100" =>
							read_data_out_sig(63 downto 0) <= rd_20(63 downto 0);	
						when "00010101" =>
							read_data_out_sig(63 downto 0) <= rd_21(63 downto 0);
						when "00010110" =>
							read_data_out_sig(63 downto 0) <= rd_22(63 downto 0);
						when "00010111" =>
							read_data_out_sig(63 downto 0) <= rd_23(63 downto 0);   		-- Channels 16 - 23
						
						when "00011000" =>
							read_data_out_sig(63 downto 0) <= rd_24(63 downto 0);		 
						when "00011001" =>
							read_data_out_sig(63 downto 0) <= rd_25(63 downto 0);
						when "00011010" =>
							read_data_out_sig(63 downto 0) <= rd_26(63 downto 0);   
						when "00011011" =>
							read_data_out_sig(63 downto 0) <= rd_27(63 downto 0);
						when "00011100" =>
							read_data_out_sig(63 downto 0) <= rd_28(63 downto 0);	
						when "00011101" =>
							read_data_out_sig(63 downto 0) <= rd_29(63 downto 0);
						when "00011110" =>
							read_data_out_sig(63 downto 0) <= rd_30(63 downto 0);
						when "00011111" =>
							read_data_out_sig(63 downto 0) <= rd_31(63 downto 0);		-- Channels 24 - 31					
						
						
						
						when others =>
								read_data_out_sig <= z_16 & z_16 & z_16 & z_16;	 -- High impedance on output
				end case;
			--end if;		 
		end	process p1;
	 -- enter your statements here --

end read_decode_p;
