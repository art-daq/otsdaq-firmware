-------------------------------------------------------------------------------
--
-- Title       : nim_plus_block
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\nim_plus_block.vhd
-- Generated   : Wed Aug 17 09:53:45 2016
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\nim_plus_block.bde
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


entity nim_plus_block is
  port(
       DAC_clk : in STD_LOGIC;
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       rx_wren : in STD_LOGIC;
       tx_clk : in STD_LOGIC;
       rx_addr : in STD_LOGIC_VECTOR(32 downto 0);
       rx_data : in STD_LOGIC_VECTOR(15 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       dac_out : out STD_LOGIC;
       s_out : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sync : out STD_LOGIC
  );
end nim_plus_block;

architecture nim_plus_block of nim_plus_block is

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
       addr : in STD_LOGIC_VECTOR(32 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component ld_array_4
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
component reg_16
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(15 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(15 downto 0)
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
signal sel_reset : STD_LOGIC;
signal sig_log : STD_LOGIC;
signal sig_out : STD_LOGIC;
signal blk_data_in_s : STD_LOGIC_VECTOR (15 downto 0);
signal blk_wr_en : STD_LOGIC_VECTOR (7 downto 0);
signal dac_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal ld_reg : STD_LOGIC_VECTOR (15 downto 0);
signal ld_wr_in : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal sel_blk_en_term : STD_LOGIC_VECTOR (15 downto 0);
signal sel_ctl : STD_LOGIC_VECTOR (7 downto 0);

begin

----  Component instantiations  ----

U1 : ld_array_4
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

U13 : reg_8
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

U14 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => blk_data_in_s,
       reset_p => reset_out,
       wr_en => blk_wr_en(0)
  );

U2 : decode_addr_NIM_Plus
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en,
       wr_en => rx_wren
  );

U3 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => sel_blk_en_term,
       reset_p => sel_reset,
       wr_en => blk_wr_en(7)
  );

U4 : reg_16
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg,
       reset_p => reset_out,
       wr_en => blk_wr_en(2)
  );

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

U7 : reg_8
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

ld_arr_rst_p <= reset_out or pulse_ctl(0);

sel_reset <= reset_out or sel_ctl(0);


---- Terminal assignment ----

    -- Output\buffer terminals
	s_out <= sig_out;


end nim_plus_block;
