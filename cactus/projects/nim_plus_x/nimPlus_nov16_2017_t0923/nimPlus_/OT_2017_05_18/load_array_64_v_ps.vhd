-------------------------------------------------------------------------------
--
-- Title       : load_array_64_v_ps
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_16_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\load_array_64_v_ps.vhd
-- Generated   : Wed May 17 16:07:28 2017
-- From        : U:/PREP/PREP_Modernization/Firmware_Backups/Aldec_Backups/One_Phase_Designs/AGP_2017_05_16_NIMPlus_OT_320MHz_1Phase/NIMPlus/NIMPlus/src/load_array_64_v_ps.bde
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


entity load_array_64_v_ps is
  port(
       clk : in STD_LOGIC;
       fs_sync_in : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       v_ps_hold_in : in STD_LOGIC;
       w_ext_in : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(63 downto 0);
       s_out : out STD_LOGIC;
       v_ps_ld_ct_out : out STD_LOGIC
  );
end load_array_64_v_ps;

architecture load_array_64_v_ps of load_array_64_v_ps is

---- Component declarations -----

component Load_array_section_16
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(15 downto 0);
       ld : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       w_in : in STD_LOGIC;
       s_out : out STD_LOGIC
  );
end component;
component load_ctl_1_phase_4ps_fs_sync
  port (
       clk : in STD_LOGIC;
       fs_sync_in : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       v_ps_hold_in : in STD_LOGIC;
       load_out : out STD_LOGIC;
       ps_ld_ct : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal clk0 : STD_LOGIC;
signal ld,ld_first : STD_LOGIC;
signal s_out_31_16 : STD_LOGIC;
signal s_out_47_32 : STD_LOGIC;
signal s_out_63_48 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : Load_array_section_16
  port map(
       dl(0) => dl(48),
       dl(1) => dl(49),
       dl(2) => dl(50),
       dl(3) => dl(51),
       dl(4) => dl(52),
       dl(5) => dl(53),
       dl(6) => dl(54),
       dl(7) => dl(55),
       dl(8) => dl(56),
       dl(9) => dl(57),
       dl(10) => dl(58),
       dl(11) => dl(59),
       dl(12) => dl(60),
       dl(13) => dl(61),
       dl(14) => dl(62),
       dl(15) => dl(63),
       clk => clk0,
       ld => ld,
       rst_p => rst_p,
       s_out => s_out_63_48,
       w_in => w_ext_in
  );

U2 : Load_array_section_16
  port map(
       dl(0) => dl(32),
       dl(1) => dl(33),
       dl(2) => dl(34),
       dl(3) => dl(35),
       dl(4) => dl(36),
       dl(5) => dl(37),
       dl(6) => dl(38),
       dl(7) => dl(39),
       dl(8) => dl(40),
       dl(9) => dl(41),
       dl(10) => dl(42),
       dl(11) => dl(43),
       dl(12) => dl(44),
       dl(13) => dl(45),
       dl(14) => dl(46),
       dl(15) => dl(47),
       clk => clk0,
       ld => ld,
       rst_p => rst_p,
       s_out => s_out_47_32,
       w_in => s_out_63_48
  );

U3 : Load_array_section_16
  port map(
       dl(0) => dl(16),
       dl(1) => dl(17),
       dl(2) => dl(18),
       dl(3) => dl(19),
       dl(4) => dl(20),
       dl(5) => dl(21),
       dl(6) => dl(22),
       dl(7) => dl(23),
       dl(8) => dl(24),
       dl(9) => dl(25),
       dl(10) => dl(26),
       dl(11) => dl(27),
       dl(12) => dl(28),
       dl(13) => dl(29),
       dl(14) => dl(30),
       dl(15) => dl(31),
       clk => clk0,
       ld => ld,
       rst_p => rst_p,
       s_out => s_out_31_16,
       w_in => s_out_47_32
  );

U4 : Load_array_section_16
  port map(
       dl(0) => dl(0),
       dl(1) => dl(1),
       dl(2) => dl(2),
       dl(3) => dl(3),
       dl(4) => dl(4),
       dl(5) => dl(5),
       dl(6) => dl(6),
       dl(7) => dl(7),
       dl(8) => dl(8),
       dl(9) => dl(9),
       dl(10) => dl(10),
       dl(11) => dl(11),
       dl(12) => dl(12),
       dl(13) => dl(13),
       dl(14) => dl(14),
       dl(15) => dl(15),
       clk => clk0,
       ld => ld,
       rst_p => rst_p,
       s_out => s_out,
       w_in => s_out_31_16
  );
  
  process(clk0)
  begin
    if rising_edge(clk0) then
        ld <= ld_first;
    end if;
   end process;

U9 : load_ctl_1_phase_4ps_fs_sync
  port map(
       clk => clk0,
       fs_sync_in => fs_sync_in,
       load_out => ld_first,
       ps_ld_ct => v_ps_ld_ct_out,
       reset_p => rst_p,
       sig_in => sig_in,
       v_ps_hold_in => v_ps_hold_in
  );


---- Terminal assignment ----

    -- Inputs terminals
	clk0 <= clk;


end load_array_64_v_ps;
