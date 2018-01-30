-------------------------------------------------------------------------------
--
-- Title       : nim_plus_block_test_1
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\nim_plus_block_test_1.vhd
-- Generated   : Wed Aug 17 09:53:49 2016
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\nim_plus_block_test_1.bde
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
use nim_plus_package_1.all;


entity nim_plus_block_test_1 is
  port(
       DAC_clk : in STD_LOGIC;
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       rx_wren : in STD_LOGIC;
       tx_clk : in STD_LOGIC;
       rx_addr : in STD_LOGIC_VECTOR(31 downto 0);
       rx_data : in STD_LOGIC_VECTOR(15 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       dac_out : out STD_LOGIC;
       s_out : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sync : out STD_LOGIC;
       read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end nim_plus_block_test_1;

architecture nim_plus_block_test_1 of nim_plus_block_test_1 is

---- Component declarations -----

component DAC_Control
  port (
       blk_data_in : in STD_LOGIC_VECTOR(15 downto 0);
       clock : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       wr_blk_p : in STD_LOGIC;
       wr_dac_p : in STD_LOGIC;
       dac_out : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sync : out STD_LOGIC;
       wr_error : out STD_LOGIC
  );
end component;
component decode_addr_NIM_Plus
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component decode_addr_NIM_Plus_1
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component decode_addr_NIM_Plus_2
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component decode_addr_NIM_Plus_3
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component decode_addr_NIM_Plus_4
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component ld_array_4_v2
  port (
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       dis_ops : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(7 downto 0);
       ld_cmd_in : in STD_LOGIC_VECTOR(3 downto 0);
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       wr_cmd : in STD_LOGIC_VECTOR(3 downto 0);
       s_out : out STD_LOGIC
  );
end component;
component read_decode
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       dac_ctl : in STD_LOGIC_VECTOR(7 downto 0);
       dac_data : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_1 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_2 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_3 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_4 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_o : in STD_LOGIC_VECTOR(15 downto 0);
       lcw_1 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_2 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_3 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_4 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_o : in STD_LOGIC_VECTOR(7 downto 0);
       pw_1 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_2 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_3 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_4 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_o : in STD_LOGIC_VECTOR(7 downto 0);
       rden : in STD_LOGIC;
       sl_ctl : in STD_LOGIC_VECTOR(7 downto 0);
       sl_data : in STD_LOGIC_VECTOR(15 downto 0);
       read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component reg_16
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(15 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component reg_32
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(31 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component reg_8
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(7 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component sel_block
  port (
       blk_en : in STD_LOGIC;
       en_term : in STD_LOGIC_VECTOR(15 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       sig_out : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal dac_ctl_reset : STD_LOGIC;
signal ld_arr_rst_p : STD_LOGIC;
signal ld_arr_rst_p_1 : STD_LOGIC;
signal ld_arr_rst_p_2 : STD_LOGIC;
signal ld_arr_rst_p_3 : STD_LOGIC;
signal ld_arr_rst_p_4 : STD_LOGIC;
signal NET2714 : STD_LOGIC;
signal NET3755 : STD_LOGIC;
signal sel_reset : STD_LOGIC;
signal sig_log : STD_LOGIC;
signal sig_out : STD_LOGIC;
signal blk_data_in_s : STD_LOGIC_VECTOR (15 downto 0);
signal blk_wr_en : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_1 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_2 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_3 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_4 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS3731 : STD_LOGIC_VECTOR (31 downto 0);
signal dac_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal ld_reg : STD_LOGIC_VECTOR (15 downto 0);
signal ld_reg_1 : STD_LOGIC_VECTOR (15 downto 0);
signal ld_reg_2 : STD_LOGIC_VECTOR (15 downto 0);
signal ld_reg_3 : STD_LOGIC_VECTOR (15 downto 0);
signal ld_reg_4 : STD_LOGIC_VECTOR (15 downto 0);
signal ld_wr_in : STD_LOGIC_VECTOR (7 downto 0);
signal ld_wr_in_1 : STD_LOGIC_VECTOR (7 downto 0);
signal ld_wr_in_2 : STD_LOGIC_VECTOR (7 downto 0);
signal ld_wr_in_3 : STD_LOGIC_VECTOR (7 downto 0);
signal ld_wr_in_4 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_1 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_2 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_3 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_4 : STD_LOGIC_VECTOR (7 downto 0);
signal sel_blk_en_term : STD_LOGIC_VECTOR (15 downto 0);
signal sel_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal sig_mod : STD_LOGIC_VECTOR (3 downto 0);

begin

----  Component instantiations  ----

U1 : ld_array_4_v2
  port map(
       dl(0) => ld_reg(8),
       dl(1) => ld_reg(9),
       dl(2) => ld_reg(10),
       dl(3) => ld_reg(11),
       dl(4) => ld_reg(12),
       dl(5) => ld_reg(13),
       dl(6) => ld_reg(14),
       dl(7) => ld_reg(15),
       ld_cmd_in(0) => ld_wr_in(4),
       ld_cmd_in(1) => ld_wr_in(5),
       ld_cmd_in(2) => ld_wr_in(6),
       ld_cmd_in(3) => ld_wr_in(7),
       wr_cmd(0) => ld_wr_in(0),
       wr_cmd(1) => ld_wr_in(1),
       wr_cmd(2) => ld_wr_in(2),
       wr_cmd(3) => ld_wr_in(3),
       clk0 => clk0,
       clk1 => clk1,
       clk2 => clk2,
       clk3 => clk3,
       dis_ops => pulse_ctl(1),
       rst_p => ld_arr_rst_p,
       s_out => sig_out,
       sig_in => sig_log
  );

U10 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => sel_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en(6)
  );

U11 : DAC_Control
  port map(
       blk_data_in => blk_data_in_s,
       clock => DAC_clk,
       dac_out => dac_out,
       reset_p => dac_ctl_reset,
       sclk => sclk,
       sync => sync,
       wr_blk_p => dac_ctl(1),
       wr_dac_p => dac_ctl(2)
  );

dac_ctl_reset <= reset_out or dac_ctl(0);

U13 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => blk_data_in_s,
       reset_p => reset_out,
       wr_en => blk_wr_en(0)
  );

U14 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => dac_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en(1)
  );

U15 : ld_array_4_v2
  port map(
       dl(0) => ld_reg_1(8),
       dl(1) => ld_reg_1(9),
       dl(2) => ld_reg_1(10),
       dl(3) => ld_reg_1(11),
       dl(4) => ld_reg_1(12),
       dl(5) => ld_reg_1(13),
       dl(6) => ld_reg_1(14),
       dl(7) => ld_reg_1(15),
       ld_cmd_in(0) => ld_wr_in_1(4),
       ld_cmd_in(1) => ld_wr_in_1(5),
       ld_cmd_in(2) => ld_wr_in_1(6),
       ld_cmd_in(3) => ld_wr_in_1(7),
       wr_cmd(0) => ld_wr_in_1(0),
       wr_cmd(1) => ld_wr_in_1(1),
       wr_cmd(2) => ld_wr_in_1(2),
       wr_cmd(3) => ld_wr_in_1(3),
       clk0 => clk0,
       clk1 => clk1,
       clk2 => clk2,
       clk3 => clk3,
       dis_ops => pulse_ctl_1(1),
       rst_p => ld_arr_rst_p_1,
       s_out => sig_mod(0),
       sig_in => x(0)
  );

U16 : ld_array_4_v2
  port map(
       dl(0) => ld_reg_2(8),
       dl(1) => ld_reg_2(9),
       dl(2) => ld_reg_2(10),
       dl(3) => ld_reg_2(11),
       dl(4) => ld_reg_2(12),
       dl(5) => ld_reg_2(13),
       dl(6) => ld_reg_2(14),
       dl(7) => ld_reg_2(15),
       ld_cmd_in(0) => ld_wr_in_2(4),
       ld_cmd_in(1) => ld_wr_in_2(5),
       ld_cmd_in(2) => ld_wr_in_2(6),
       ld_cmd_in(3) => ld_wr_in_2(7),
       wr_cmd(0) => ld_wr_in_2(0),
       wr_cmd(1) => ld_wr_in_2(1),
       wr_cmd(2) => ld_wr_in_2(2),
       wr_cmd(3) => ld_wr_in_2(3),
       clk0 => clk0,
       clk1 => clk1,
       clk2 => clk2,
       clk3 => clk3,
       dis_ops => pulse_ctl_2(1),
       rst_p => ld_arr_rst_p_2,
       s_out => sig_mod(1),
       sig_in => x(1)
  );

U17 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(2)
  );

U18 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => ld_wr_in_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(3)
  );

U19 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => pulse_ctl_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(4)
  );

U2 : decode_addr_NIM_Plus
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en,
       wr_en => rx_wren
  );

ld_arr_rst_p_1 <= reset_out or pulse_ctl_1(0);

U21 : decode_addr_NIM_Plus_1
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_1,
       wr_en => rx_wren
  );

U22 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(2)
  );

U23 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => ld_wr_in_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(3)
  );

U24 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => pulse_ctl_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(4)
  );

ld_arr_rst_p_2 <= reset_out or pulse_ctl_2(0);

U26 : decode_addr_NIM_Plus_2
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_2,
       wr_en => rx_wren
  );

U27 : ld_array_4_v2
  port map(
       dl(0) => ld_reg_3(8),
       dl(1) => ld_reg_3(9),
       dl(2) => ld_reg_3(10),
       dl(3) => ld_reg_3(11),
       dl(4) => ld_reg_3(12),
       dl(5) => ld_reg_3(13),
       dl(6) => ld_reg_3(14),
       dl(7) => ld_reg_3(15),
       ld_cmd_in(0) => ld_wr_in_3(4),
       ld_cmd_in(1) => ld_wr_in_3(5),
       ld_cmd_in(2) => ld_wr_in_3(6),
       ld_cmd_in(3) => ld_wr_in_3(7),
       wr_cmd(0) => ld_wr_in_3(0),
       wr_cmd(1) => ld_wr_in_3(1),
       wr_cmd(2) => ld_wr_in_3(2),
       wr_cmd(3) => ld_wr_in_3(3),
       clk0 => clk0,
       clk1 => clk1,
       clk2 => clk2,
       clk3 => clk3,
       dis_ops => pulse_ctl_3(1),
       rst_p => ld_arr_rst_p_3,
       s_out => sig_mod(2),
       sig_in => x(2)
  );

U28 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => pulse_ctl_3,
       reset_p => reset_out,
       wr_en => blk_wr_en_3(4)
  );

U29 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => ld_wr_in_3,
       reset_p => reset_out,
       wr_en => blk_wr_en_3(3)
  );

U3 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg,
       reset_p => reset_out,
       wr_en => blk_wr_en(2)
  );

U30 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_3,
       reset_p => reset_out,
       wr_en => blk_wr_en_3(2)
  );

ld_arr_rst_p_3 <= reset_out or pulse_ctl_3(0);

U32 : decode_addr_NIM_Plus_3
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_3,
       wr_en => rx_wren
  );

U33 : ld_array_4_v2
  port map(
       dl(0) => ld_reg_4(8),
       dl(1) => ld_reg_4(9),
       dl(2) => ld_reg_4(10),
       dl(3) => ld_reg_4(11),
       dl(4) => ld_reg_4(12),
       dl(5) => ld_reg_4(13),
       dl(6) => ld_reg_4(14),
       dl(7) => ld_reg_4(15),
       ld_cmd_in(0) => ld_wr_in_4(4),
       ld_cmd_in(1) => ld_wr_in_4(5),
       ld_cmd_in(2) => ld_wr_in_4(6),
       ld_cmd_in(3) => ld_wr_in_4(7),
       wr_cmd(0) => ld_wr_in_4(0),
       wr_cmd(1) => ld_wr_in_4(1),
       wr_cmd(2) => ld_wr_in_4(2),
       wr_cmd(3) => ld_wr_in_4(3),
       clk0 => clk0,
       clk1 => clk1,
       clk2 => clk2,
       clk3 => clk3,
       dis_ops => pulse_ctl_4(1),
       rst_p => ld_arr_rst_p_4,
       s_out => sig_mod(3),
       sig_in => x(3)
  );

U34 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_4(2)
  );

U35 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => ld_wr_in_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_4(3)
  );

U36 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => pulse_ctl_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_4(4)
  );

ld_arr_rst_p_4 <= reset_out or pulse_ctl_4(0);

U38 : decode_addr_NIM_Plus_4
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_4,
       wr_en => rx_wren
  );

U39 : read_decode
  port map(
       addr => rx_addr,
       dac_ctl => dac_ctl,
       dac_data => blk_data_in_s,
       dlr_1 => ld_reg_1,
       dlr_2 => ld_reg_2,
       dlr_3 => ld_reg_3,
       dlr_4 => ld_reg_4,
       dlr_o => ld_reg,
       lcw_1 => ld_wr_in_1,
       lcw_2 => ld_wr_in_2,
       lcw_3 => ld_wr_in_3,
       lcw_4 => ld_wr_in_4,
       lcw_o => ld_wr_in,
       pw_1 => pulse_ctl_1,
       pw_2 => pulse_ctl_2,
       pw_3 => pulse_ctl_3,
       pw_4 => pulse_ctl_4,
       pw_o => pulse_ctl,
       rden => NET2714,
       read_data_out => BUS3731,
       sl_ctl => sel_ctl,
       sl_data => sel_blk_en_term
  );

U4 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => ld_wr_in,
       reset_p => reset_out,
       wr_en => blk_wr_en(3)
  );

NET2714 <= not(rx_wren);

U41 : reg_32
  port map(
       clk => tx_clk,
       d => BUS3731,
       q => read_data_out,
       reset_p => reset_out,
       wr_en => NET3755
  );

NET3755 <= not(reset_out);

U5 : sel_block
  port map(
       blk_en => sel_ctl(1),
       en_term => sel_blk_en_term,
       sig_out => sig_log,
       x => x
  );

U6 : reg_8
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       clk => tx_clk,
       q => pulse_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en(4)
  );

U7 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => sel_blk_en_term,
       reset_p => sel_reset,
       wr_en => blk_wr_en(7)
  );

ld_arr_rst_p <= reset_out or pulse_ctl(0);

sel_reset <= reset_out or sel_ctl(0);


---- Terminal assignment ----

    -- Output\buffer terminals
	s_out <= sig_out;


end nim_plus_block_test_1;
