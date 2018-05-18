-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Vertex_model
-- Author      : aprosser
-- Company     : CD_CEPA_ESE
--
-------------------------------------------------------------------------------
--
-- File        : u:\Serial Powering Architecture\CMS_Proposal\FPGA_Firmware\CMS_Tracker_Power\Vertex_model\compile\Test_Beam_Token_Gen.vhd
-- Generated   : 12/03/09 01:16:14
-- From        : u:\Serial Powering Architecture\CMS_Proposal\FPGA_Firmware\CMS_Tracker_Power\Vertex_model\src\Test_Beam_Token_Gen.asf
-- By          : FSM2VHDL ver. 5.0.0.9
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

entity test_beam_token_gen is 
	port (
		block_enable: in STD_LOGIC;
		clock: in STD_LOGIC;
		fifo_empty: in STD_LOGIC;
		reset: in STD_LOGIC;
		token_in: in STD_LOGIC;
		er_tk_in: out STD_LOGIC;
		er_tk_out: out STD_LOGIC;
		fifo_read: out STD_LOGIC;
		token_circ: out STD_LOGIC;
		token_out: out STD_LOGIC);
end test_beam_token_gen;

architecture test_beam_token_gen of Test_Beam_Token_Gen is

constant one_11b: STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
constant t_max: STD_LOGIC_VECTOR (10 downto 0) := "11111111111";
constant zero_11b: STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
-- diagram signals declarations
signal t_count: STD_LOGIC_VECTOR (10 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    idle, wt_4_req, wt_4_tkn
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clock)
begin
	if clock'event and clock = '1' then
		if reset = '1' then	
			Sreg0 <= idle;
			-- Set default values for outputs, signals and variables
			-- ...
			token_out <= '0';
			er_tk_in <= '0';
			er_tk_out <= '0';
			fifo_read <= '0';
			token_circ <= '0';
			t_count <= zero_11b;
-- Inputs:
-- 1. block_enable
--       must = 1 to operate block
-- 2. token_in
--		 signal that carries returning
--       token to the block
--       active high (token is returned)
-- 3. fifo_empty
--	     high level indicates that there
--       is at least 1 token request stacked
-- 4. reset
--       resets block and clears error flags
--		 active high
-- 5. clock
-- 		 state machine clock
--		 activity triggered on rising edge
--
-- Outputs:
-- 1. token_out
-- 	  	 active high
--		 token delivered to plaquette
-- 2. fifo_read
--		 active high
--		 used to read the FIFO with FIFO read clock
--		 FIFO read clock must be synchronous with
--		 state machine clock of this block
-- 3. token_circ
--		 active high
--		 Indicates that a token is circulating
--		 (has been issued but not returned)
-- 4. er_tk_in
--		 active high
--		 Persistant error flag that a token_in
--		 was received when no token was
--		 circulating
-- 5. er_tk_out
--		 active high
-- 		 Persistant error flag indicating that
-- 		 an issued token was not returned
-- 		 when the block goes from enabled to
--		 disabled
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when idle =>
					if block_enable = '1' then	
						Sreg0 <= wt_4_req;
						token_out <= '0';
						er_tk_in <= '0';
						er_tk_out <= '0';
						fifo_read <= '0';
					elsif block_enable = '0' then	
						Sreg0 <= idle;
						token_out <= '0';
						fifo_read <= '0';
					end if;
				when wt_4_req =>
					if block_enable = '0' then	
						Sreg0 <= idle;
					elsif fifo_empty = '0' then	-- See Action below
						Sreg0 <= wt_4_tkn;
						-- Action below
						token_out <= '1';
						-- Deliver the token
						fifo_read <= '1';
						-- Decrement the pseudo FIFO
						token_circ <= '1';
						-- Token is circulating
						if (token_in = '1') then
						-- A token arrived with none
						-- having been issued and not returned
						  er_tk_in <= '1';
						end if;
					elsif fifo_empty = '1' then	-- No requests pending in the psuedo FIFO
						Sreg0 <= wt_4_req;
						if (token_in = '1') then
						-- A token arrived with none
						-- having been issued and not returned
						  er_tk_in <= '1';
						end if;
					end if;
				when wt_4_tkn =>
					if block_enable = '1' and
						(token_in = '1' or t_count >= t_max) then	
						Sreg0 <= wt_4_req;
						token_out <= '0';
						fifo_read <= '0';
						token_circ <= '0';
						-- Token has been returned
						if (t_count = t_max) then
						  er_tk_out <= '1';
						-- set error flag
						end if;
						t_count <= zero_11b;
						-- initialize counter again
					elsif block_enable = '0' then	
						Sreg0 <= idle;
						er_tk_out <= '1';
					elsif block_enable = '1' and
						(token_in = '0' and t_count < t_max) then	
						Sreg0 <= wt_4_tkn;
						token_out <= '0';
						fifo_read <= '0';
						t_count <= t_count + one_11b;
					end if;
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

end Test_Beam_Token_Gen;
