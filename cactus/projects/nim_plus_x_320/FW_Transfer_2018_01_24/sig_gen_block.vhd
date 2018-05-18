-------------------------------------------------------------------------------
--
-- Title       : sig_gen_block
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\sig_gen_block.vhd
-- Generated   : Wed May 10 14:39:00 2017
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\src\sig_gen_block.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
--use nim_plus_package_1.all;


entity sig_gen_block is
  port(
       clk_in : in STD_LOGIC;
       cyc_in : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       start_enable : in STD_LOGIC;
       period_hi : in STD_LOGIC_VECTOR(15 downto 0);
       period_lo : in STD_LOGIC_VECTOR(15 downto 0);
       pulse_count : in STD_LOGIC_VECTOR(15 downto 0);
       err_out : out STD_LOGIC;
       pulse_out : out STD_LOGIC
  );
end sig_gen_block;

architecture sig_gen_block of sig_gen_block is

begin

end sig_gen_block;
