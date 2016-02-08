-------------------------------------------------------------------------------
--
-- Title       : Checksum Calc
-- Design      : ethernet_controller
-- Author      : Ryan Rivera
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : d:\Projects\otsdaq\OtS Ethernet MAC firmware\ActiveHDL_proj\ethernet_controller\compile\ip_checksum_calc.vhd
-- Generated   : 01/29/16 09:46:18
-- From        : d:/Projects/otsdaq/OtS Ethernet MAC firmware/ActiveHDL_proj/ethernet_controller/src/ip_checksum_calc.asf
-- By          : FSM2VHDL ver. 5.0.7.2
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ip_checksum_calc is 
	port (
		addrsDest: in STD_LOGIC_VECTOR (7 downto 0);
		addrsSrc: in STD_LOGIC_VECTOR (7 downto 0);
		clk: in STD_LOGIC;
		icmp_mode: in STD_LOGIC;
		length: in STD_LOGIC_VECTOR (10 downto 0);
		reset: in STD_LOGIC;
		trigger: in STD_LOGIC;
		cs: out STD_LOGIC_VECTOR (15 downto 0));
end ip_checksum_calc;

architecture ip_checksum_calc_arch of ip_checksum_calc is

-- diagram signals declarations
signal cs_sig: STD_LOGIC_VECTOR (16 downto 0);
signal dest_sig: STD_LOGIC_VECTOR (16 downto 0);
signal length_sig: STD_LOGIC_VECTOR (16 downto 0);
signal src_sig: STD_LOGIC_VECTOR (16 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S10, S6, S7
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin

-- concurrent signals assignments

-- Diagram ACTION
--intermediates
length_sig <= "00" & x"0" &length;
src_sig <= '0' & x"00" & addrsSrc;
dest_sig <= '0' & x"00" & addrsDest;

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clk)
begin
	if clk'event and clk = '1' then
		if reset = '1' then
			Sreg0 <= S10;
			-- Set default values for outputs, signals and variables
			-- ...
			cs <= not cs_sig(15 downto 0);
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S1 =>
					if (icmp_mode = '0') then -- normal udp mode
						cs_sig <= '0' & x"85F9";
						-- was 85F9 -- ttl/protocol := x8011
					else					  -- icmp ping mode
						cs_sig <= '0' & x"85E9";
						-- ttl/protocol := x8001
					end if;
					Sreg0 <= S2;
				when S2 =>
					cs_sig <= cs_sig + length_sig;
					Sreg0 <= S3;
				when S3 =>
					if cs_sig(16) = '1' then
					  	cs_sig(15 downto 0) <= cs_sig(15 downto 0) + 1;
					  	cs_sig(16) <= '0';
					end if;
					Sreg0 <= S4;
				when S4 =>
					cs_sig <= cs_sig + src_sig;
					Sreg0 <= S5;
				when S5 =>
					if cs_sig(16) = '1' then
					  	cs_sig(15 downto 0) <= cs_sig(15 downto 0) + 1;
					  	cs_sig(16) <= '0';
					end if;
					Sreg0 <= S6;
				when S10 =>
					cs <= not cs_sig(15 downto 0);
					if trigger = '1' then
						Sreg0 <= S1;
					end if;
				when S6 =>
					cs_sig <= cs_sig + dest_sig;
					Sreg0 <= S7;
				when S7 =>
					if cs_sig(16) = '1' then
					  	cs_sig(15 downto 0) <= cs_sig(15 downto 0) + 1;
					  	cs_sig(16) <= '0';
					end if;
					Sreg0 <= S10;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

end ip_checksum_calc_arch;
