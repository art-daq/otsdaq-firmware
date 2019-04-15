-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : NIMPlus
-- Author      : Alan Prosser
-- Company     : Fermilab
--
-------------------------------------------------------------------------------
--
-- File        : P:\CAPTAN\NIMPlus_Archive\AGP_2019_04_10_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\sig_gen_prog.vhd
-- Generated   : 04/10/19 11:03:33
-- From        : P:\CAPTAN\NIMPlus_Archive\AGP_2019_04_10_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\sig_gen_prog.asf
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

entity sig_gen_prog is 
	port (
		clk: in STD_LOGIC;
		p_count: in STD_LOGIC_VECTOR (27 downto 0);
		p_hi: in STD_LOGIC_VECTOR (31 downto 0);
		p_lo: in STD_LOGIC_VECTOR (31 downto 0);
		reset_p: in STD_LOGIC;
		start_en: in STD_LOGIC;
		err_out: out STD_LOGIC;
		p_out: out STD_LOGIC);
end sig_gen_prog;

architecture sig_gen_prog_arch of sig_gen_prog is

constant u_28: STD_LOGIC_VECTOR (27 downto 0) := "0000000000000000000000000001";
constant u_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
constant z_28: STD_LOGIC_VECTOR (27 downto 0) := "0000000000000000000000000000";
constant z_32: STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
-- diagram signals declarations
signal cond_reg: STD_LOGIC_VECTOR (2 downto 0);
signal p_count_r: STD_LOGIC_VECTOR (27 downto 0);
signal p_hi_r: STD_LOGIC_VECTOR (31 downto 0);
signal p_lo_r: STD_LOGIC_VECTOR (31 downto 0);

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S1, S2, S3, S4, S5, S7, S8
);
-- attribute ENUM_ENCODING of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals
signal int_err_out, next_err_out: STD_LOGIC;
signal int_p_out, next_p_out: STD_LOGIC;
signal next_cond_reg: STD_LOGIC_VECTOR (2 downto 0);
signal next_p_count_r: STD_LOGIC_VECTOR (27 downto 0);
signal next_p_hi_r: STD_LOGIC_VECTOR (31 downto 0);
signal next_p_lo_r: STD_LOGIC_VECTOR (31 downto 0);

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (cond_reg, int_err_out, int_p_out, p_count, p_count_r, p_hi, p_hi_r, p_lo, p_lo_r, start_en, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	next_err_out <= int_err_out;
	next_p_out <= int_p_out;
	next_p_count_r <= p_count_r;
	next_p_hi_r <= p_hi_r;
	next_p_lo_r <= p_lo_r;
	next_cond_reg <= cond_reg;
	case Sreg0 is
		when S1 =>
			if start_en = '0' then
				NextState_Sreg0 <= S1;
				next_p_out <= '0';
				next_err_out <= '0';
			elsif start_en = '1' then
				NextState_Sreg0 <= S2;
				next_p_count_r <= z_28;
				next_p_hi_r <= z_32;
				next_p_lo_r <= z_32;
				next_p_out <= '0';
				next_cond_reg(1) <= '1';
				-- Starting
				if (p_count = z_28) then
				  next_cond_reg(0) <= '1';
				  -- Infinite loop
				else
				  next_cond_reg(0) <= '0';
				  -- Finite number
				end if;
			end if;
		when S2 =>
			if start_en = '0' then
				NextState_Sreg0 <= S1;
				next_p_out <= '0';
			elsif p_hi = z_32 or 
				p_lo = z_32 then
				NextState_Sreg0 <= S3;
				next_err_out <= '1';
				next_p_out <= '0';
			else
				NextState_Sreg0 <= S4;
				next_p_count_r <= p_count_r + u_28;
			end if;
		when S3 =>
			if start_en = '1' then
				NextState_Sreg0 <= S3;
				next_err_out <= '1';
				next_p_out <= '0';
			elsif start_en = '0' then
				NextState_Sreg0 <= S1;
				next_p_out <= '0';
				next_err_out <= '0';
			end if;
		when S4 =>
			if p_hi_r < p_hi then
				NextState_Sreg0 <= S4;
				next_p_hi_r <= p_hi_r + u_32;
				next_p_out <= '1';
			elsif p_hi_r = p_hi then
				NextState_Sreg0 <= S5;
				next_p_out <= '0';
				if (p_count_r < p_count) then
				  next_cond_reg(1) <= '1';
				else
				  next_cond_reg(1) <= '0';
				end if;
			end if;
		when S5 =>
			if p_lo_r = p_lo then
				NextState_Sreg0 <= S7;
				-- p_count_r <= p_count_r + u_28;
				if (p_count_r = p_count) then
				    next_cond_reg(1) <= '0';
				end if;
			elsif p_lo_r < p_lo then
				NextState_Sreg0 <= S5;
				next_p_out <= '0';
				next_p_lo_r <= p_lo_r + u_32;
			end if;
		when S7 =>
			if --(p_count_r < p_count and p_count /= z_28) --or p_count = z_28
				(cond_reg(0) = '0' and cond_reg(1) = '1') or
				cond_reg(0) = '1' then
				NextState_Sreg0 <= S2;
				next_p_hi_r <= z_32;
				next_p_lo_r <= z_32;
			elsif --p_count_r = p_count and  --p_count /= z_28
				cond_reg(0) = '0' and
				cond_reg(1) = '0' then
				NextState_Sreg0 <= S8;
				next_p_out <= '0';
			end if;
		when S8 =>
			if start_en = '0' then
				NextState_Sreg0 <= S1;
			elsif start_en = '1' then
				NextState_Sreg0 <= S8;
				next_p_out <= '0';
			end if;
--vhdl_cover_off
		when others =>
			null;
--vhdl_cover_on
	end case;
end process;

------------------------------------
-- Current State Logic (sequential)
------------------------------------
Sreg0_CurrentState: process (clk)
begin
	if clk'event and clk = '1' then
		if reset_p = '1' then
			Sreg0 <= S1;
		else
			Sreg0 <= NextState_Sreg0;
		end if;
	end if;
end process;

------------------------------------
-- Registered Outputs Logic
------------------------------------
Sreg0_RegOutput: process (clk)
begin
	if clk'event and clk = '1' then
		if reset_p = '1' then
			-- p_count_r <= 		-- Initialization in the reset state or default value required!
			-- p_hi_r <= 		-- Initialization in the reset state or default value required!
			-- p_lo_r <= 		-- Initialization in the reset state or default value required!
			-- cond_reg <= 		-- Initialization in the reset state or default value required!
			int_err_out <= '0';
			int_p_out <= '0';
		else
			p_count_r <= next_p_count_r;
			p_hi_r <= next_p_hi_r;
			p_lo_r <= next_p_lo_r;
			cond_reg <= next_cond_reg;
			int_err_out <= next_err_out;
			int_p_out <= next_p_out;
		end if;
	end if;
end process;

-- Copy temporary signals to target output ports
err_out <= int_err_out;
p_out <= int_p_out;

end sig_gen_prog_arch;
