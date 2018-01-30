-------------------------------------------------------------------------------
--
-- Title       : nim_plus_block_v4
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\compile\nim_plus_block_v4.vhd
-- Generated   : Thu Apr 27 10:46:46 2017
-- From        : c:\NIM_Plus\AGP_2016\NIMPlus\NIMPlus\src\nim_plus_block_v4.bde
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


entity nim_plus_block_v4 is
  port(
       DAC_clk : in STD_LOGIC;
       bkpa : in STD_LOGIC;
       bkpb : in STD_LOGIC;
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       clk_40DCM : in STD_LOGIC;
       fst_clk_in : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       rx_wren : in STD_LOGIC;
       tx_clk : in STD_LOGIC;
       rx_addr : in STD_LOGIC_VECTOR(31 downto 0);
       rx_data : in STD_LOGIC_VECTOR(31 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       b_wr_out : out STD_LOGIC;
       dac_out : out STD_LOGIC;
       s_out : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sg_pout : out STD_LOGIC;
       sync : out STD_LOGIC;
       trig_cms : out STD_LOGIC;
       trig_cms1 : out STD_LOGIC;
       trig_cms2 : out STD_LOGIC;
       b_read : out STD_LOGIC_VECTOR(63 downto 0);
       read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end nim_plus_block_v4;

architecture nim_plus_block_v4 of nim_plus_block_v4 is

---- Component declarations -----

component b_fifo_mux
  port (
       rst_p : in STD_LOGIC;
       s_addr : in STD_LOGIC;
       wd_in0 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in1 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in2 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in3 : in STD_LOGIC_VECTOR(31 downto 0);
       b_fifo_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component cntrs_2_b_fifo
  port (
       clk : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       b_wr : out STD_LOGIC;
       fin_wr : out STD_LOGIC;
       mux_dir : out STD_LOGIC
  );
end component;
component count32
  port (
       clock : in STD_LOGIC;
       clr_count : in STD_LOGIC;
       cout_en_p : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       count_out : out STD_LOGIC_VECTOR(31 downto 0);
       ovrflow : out STD_LOGIC
  );
end component;
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
component decode_addr_NIM_Plus_ctrs
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component fs_sync_module
  port (
       MHz_40 : in STD_LOGIC;
       clock_320MHz : in STD_LOGIC;
       reset_async_p : in STD_LOGIC;
       reset_master_p : in STD_LOGIC;
       sel_sync_in : in STD_LOGIC_VECTOR(7 downto 0);
       sel_sync_out : out STD_LOGIC
  );
end component;
component HGCAL_Veto_w_Rearm
  port (
       clk : in STD_LOGIC;
       en_rearm : in STD_LOGIC;
       high_period : in STD_LOGIC_VECTOR(7 downto 0);
       reset_p : in STD_LOGIC;
       start_in : in STD_LOGIC;
       trig_out : out STD_LOGIC
  );
end component;
component ld_array_4_v2_1_phase
  port (
       clk0 : in STD_LOGIC;
       dis_ops : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(31 downto 0);
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       s_out : out STD_LOGIC
  );
end component;
component ld_array_4_v_ps
  port (
       clk0 : in STD_LOGIC;
       clk1 : in STD_LOGIC;
       clk2 : in STD_LOGIC;
       clk3 : in STD_LOGIC;
       dis_ops : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(7 downto 0);
       ld_cmd_in : in STD_LOGIC_VECTOR(3 downto 0);
       ps_cnt_in : in STD_LOGIC_VECTOR(31 downto 0);
       ps_en : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       rst_ps : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       wr_cmd : in STD_LOGIC_VECTOR(3 downto 0);
       ct_lsb : out STD_LOGIC;
       evt_ct_mon : out STD_LOGIC;
       ps_block_out_n : out STD_LOGIC;
       s_out : out STD_LOGIC
  );
end component;
component no_del_mux
  port (
       rst_p : in STD_LOGIC;
       s_addr : in STD_LOGIC_VECTOR(1 downto 0);
       sigin : in STD_LOGIC_VECTOR(1 downto 0);
       tsig_out : out STD_LOGIC
  );
end component;
component read_decode
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       count_out : in STD_LOGIC_VECTOR(31 downto 0);
       ctr_enables : in STD_LOGIC_VECTOR(15 downto 0);
       ctr_resets : in STD_LOGIC_VECTOR(15 downto 0);
       dac_ctl : in STD_LOGIC_VECTOR(7 downto 0);
       dac_data : in STD_LOGIC_VECTOR(15 downto 0);
       del_ct : in STD_LOGIC_VECTOR(127 downto 0);
       dlr_1 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_2 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_3 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_4 : in STD_LOGIC_VECTOR(15 downto 0);
       dlr_o : in STD_LOGIC_VECTOR(15 downto 0);
       dur_ct : in STD_LOGIC_VECTOR(127 downto 0);
       in_count_0 : in STD_LOGIC_VECTOR(31 downto 0);
       in_count_1 : in STD_LOGIC_VECTOR(31 downto 0);
       in_count_2 : in STD_LOGIC_VECTOR(31 downto 0);
       in_count_3 : in STD_LOGIC_VECTOR(31 downto 0);
       lcw_1 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_2 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_3 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_4 : in STD_LOGIC_VECTOR(7 downto 0);
       lcw_o : in STD_LOGIC_VECTOR(7 downto 0);
       ovfl_16 : in STD_LOGIC_VECTOR(15 downto 0);
       pw_1 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_2 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_3 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_4 : in STD_LOGIC_VECTOR(7 downto 0);
       pw_o : in STD_LOGIC_VECTOR(7 downto 0);
       rden : in STD_LOGIC;
       s_del_path : in STD_LOGIC_VECTOR(7 downto 0);
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
       rst_p : in STD_LOGIC;
       x : in STD_LOGIC_VECTOR(3 downto 0);
       sig_out : out STD_LOGIC
  );
end component;
component sig_gen_prog
  port (
       clk : in STD_LOGIC;
       p_count : in STD_LOGIC_VECTOR(31 downto 0);
       p_hi : in STD_LOGIC_VECTOR(31 downto 0);
       p_lo : in STD_LOGIC_VECTOR(31 downto 0);
       reset_p : in STD_LOGIC;
       start_en : in STD_LOGIC;
       err_out : out STD_LOGIC;
       p_out : out STD_LOGIC
  );
end component;
component start_sig_mux
  port (
       rst_p : in STD_LOGIC;
       s_addr : in STD_LOGIC_VECTOR(2 downto 0);
       sigin : in STD_LOGIC_VECTOR(4 downto 0);
       tsig_out : out STD_LOGIC
  );
end component;
component stsp_counter
  port (
       clk : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       stp : in STD_LOGIC;
       strt : in STD_LOGIC;
       count_out : out STD_LOGIC_VECTOR(31 downto 0);
       ovr : out STD_LOGIC
  );
end component;
component test_mux
  port (
       rst_p : in STD_LOGIC;
       s_addr : in STD_LOGIC_VECTOR(7 downto 0);
       sigtestin : in STD_LOGIC_VECTOR(31 downto 0);
       tsig_out : out STD_LOGIC
  );
end component;
component veto_count
  port (
       clk : in STD_LOGIC;
       count_in : in STD_LOGIC_VECTOR(31 downto 0);
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       veto_out_n : out STD_LOGIC
  );
end component;
component decode_addr_NIM_Plus
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

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal bkpress : STD_LOGIC;
signal b_wr_out_b : STD_LOGIC;
signal ct_lsb : STD_LOGIC;
signal dac_ctl_reset : STD_LOGIC;
signal evt_ct_mon : STD_LOGIC;
signal ld_arr_rst_p : STD_LOGIC;
signal ld_arr_rst_p_1 : STD_LOGIC;
signal ld_arr_rst_p_2 : STD_LOGIC;
signal ld_arr_rst_p_3 : STD_LOGIC;
signal ld_arr_rst_p_4 : STD_LOGIC;
signal mux_dir : STD_LOGIC;
signal NET12133 : STD_LOGIC;
signal NET14556 : STD_LOGIC;
signal NET14569 : STD_LOGIC;
signal NET14592 : STD_LOGIC;
signal NET14618 : STD_LOGIC;
signal NET16680 : STD_LOGIC;
signal NET16842 : STD_LOGIC;
signal NET17043 : STD_LOGIC;
signal NET17201 : STD_LOGIC;
signal NET17286 : STD_LOGIC;
signal NET17374 : STD_LOGIC;
signal NET17723 : STD_LOGIC;
signal NET17811 : STD_LOGIC;
signal NET17984 : STD_LOGIC;
signal NET18073 : STD_LOGIC;
signal NET18610 : STD_LOGIC;
signal NET19104 : STD_LOGIC;
signal NET19137 : STD_LOGIC;
signal NET19190 : STD_LOGIC;
signal NET19293 : STD_LOGIC;
signal NET5065 : STD_LOGIC;
signal NET5210 : STD_LOGIC;
signal NET9478 : STD_LOGIC;
signal NET9526 : STD_LOGIC;
signal out_cnt_rst : STD_LOGIC;
signal ps_block_out_n : STD_LOGIC;
signal ps_en_all : STD_LOGIC;
signal rst_sgprog_p : STD_LOGIC;
signal sel_reset : STD_LOGIC;
signal sgp : STD_LOGIC;
signal sg_mid : STD_LOGIC;
signal sg_out_s : STD_LOGIC;
signal sig_cms : STD_LOGIC;
signal sig_cms1 : STD_LOGIC;
signal sig_cms2 : STD_LOGIC;
signal sig_log : STD_LOGIC;
signal sig_mod_mux_b : STD_LOGIC;
signal sig_norm : STD_LOGIC;
signal sync_w_40MHz : STD_LOGIC;
signal veto_out_n : STD_LOGIC;
signal veto_out_n1 : STD_LOGIC;
signal veto_out_n2 : STD_LOGIC;
signal veto_out_p1 : STD_LOGIC;
signal veto_out_p2 : STD_LOGIC;
signal blk_data_in_s : STD_LOGIC_VECTOR (15 downto 0);
signal blk_wr_en : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_1 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_2 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_3 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_4 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_cts : STD_LOGIC_VECTOR (31 downto 0);
signal BUS10839 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS16747 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS18923 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS18999 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS5198 : STD_LOGIC_VECTOR (31 downto 0);
signal ctr_clears : STD_LOGIC_VECTOR (15 downto 0);
signal ctr_enables : STD_LOGIC_VECTOR (15 downto 0);
signal ctr_resets : STD_LOGIC_VECTOR (15 downto 0);
signal dac_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal del_ct : STD_LOGIC_VECTOR (127 downto 0);
signal dur_ct : STD_LOGIC_VECTOR (127 downto 0);
signal fs_sync_bus : STD_LOGIC_VECTOR (15 downto 0);
signal in_ev_ctr_1 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_2 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_3 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_4 : STD_LOGIC_VECTOR (31 downto 0);
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
signal mux_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal out_ev_ctr : STD_LOGIC_VECTOR (31 downto 0);
signal out_wd : STD_LOGIC_VECTOR (31 downto 0);
signal overflow : STD_LOGIC_VECTOR (15 downto 0);
signal pcnt : STD_LOGIC_VECTOR (31 downto 0);
signal phi : STD_LOGIC_VECTOR (31 downto 0);
signal plo : STD_LOGIC_VECTOR (31 downto 0);
signal ps_cnt : STD_LOGIC_VECTOR (31 downto 0);
signal pulse_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_1 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_2 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_3 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_4 : STD_LOGIC_VECTOR (7 downto 0);
signal sel_blk_en_term : STD_LOGIC_VECTOR (15 downto 0);
signal sel_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal sigmux : STD_LOGIC_VECTOR (31 downto 0);
signal sig_d_0 : STD_LOGIC_VECTOR (1 downto 0);
signal sig_d_1 : STD_LOGIC_VECTOR (1 downto 0);
signal sig_d_2 : STD_LOGIC_VECTOR (1 downto 0);
signal sig_d_3 : STD_LOGIC_VECTOR (1 downto 0);
signal sig_mod : STD_LOGIC_VECTOR (3 downto 0);
signal sig_mod_d : STD_LOGIC_VECTOR (3 downto 0);
signal sp_signl_sel : STD_LOGIC_VECTOR (7 downto 0);
signal start_sig_sel : STD_LOGIC_VECTOR (15 downto 0);
signal stop_sig_sel : STD_LOGIC_VECTOR (15 downto 0);
signal stop_tim_sig : STD_LOGIC_VECTOR (3 downto 0);
signal stop_tim_sig_in : STD_LOGIC_VECTOR (4 downto 0);
signal stop_tim_sig_n : STD_LOGIC_VECTOR (3 downto 0);
signal s_del_path : STD_LOGIC_VECTOR (7 downto 0);
signal tim_sig : STD_LOGIC_VECTOR (3 downto 0);
signal tim_sig_in : STD_LOGIC_VECTOR (4 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : ld_array_4_v_ps
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
       ct_lsb => ct_lsb,
       dis_ops => pulse_ctl(1),
       evt_ct_mon => evt_ct_mon,
       ps_block_out_n => ps_block_out_n,
       ps_cnt_in => ps_cnt,
       ps_en => ps_en_all,
       rst_p => ld_arr_rst_p,
       rst_ps => ctr_resets(15),
       s_out => sig_norm,
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

tim_sig_in(3) <= x(3);

tim_sig_in(4) <= sgp;

U102 : start_sig_mux
  port map(
       s_addr(0) => stop_sig_sel(0),
       s_addr(1) => stop_sig_sel(1),
       s_addr(2) => stop_sig_sel(2),
       rst_p => reset_out,
       sigin => stop_tim_sig_in,
       tsig_out => stop_tim_sig(0)
  );

U103 : start_sig_mux
  port map(
       s_addr(0) => stop_sig_sel(4),
       s_addr(1) => stop_sig_sel(5),
       s_addr(2) => stop_sig_sel(6),
       rst_p => reset_out,
       sigin => stop_tim_sig_in,
       tsig_out => stop_tim_sig(1)
  );

U104 : start_sig_mux
  port map(
       s_addr(0) => stop_sig_sel(8),
       s_addr(1) => stop_sig_sel(9),
       s_addr(2) => stop_sig_sel(10),
       rst_p => reset_out,
       sigin => stop_tim_sig_in,
       tsig_out => stop_tim_sig(2)
  );

U105 : start_sig_mux
  port map(
       s_addr(0) => stop_sig_sel(12),
       s_addr(1) => stop_sig_sel(13),
       s_addr(2) => stop_sig_sel(14),
       rst_p => reset_out,
       sigin => stop_tim_sig_in,
       tsig_out => stop_tim_sig(3)
  );

U106 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => stop_sig_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(10)
  );

stop_tim_sig_in(0) <= x(0);

stop_tim_sig_in(1) <= x(1);

stop_tim_sig_in(2) <= x(2);

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

stop_tim_sig_in(3) <= x(3);

stop_tim_sig_in(4) <= sgp;

U112 : reg_8
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
       q => s_del_path,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(14)
  );

U113 : no_del_mux
  port map(
       s_addr(0) => s_del_path(0),
       s_addr(1) => s_del_path(1),
       rst_p => reset_out,
       sigin => sig_d_0,
       tsig_out => sig_mod_d(0)
  );

U114 : no_del_mux
  port map(
       s_addr(0) => s_del_path(2),
       s_addr(1) => s_del_path(3),
       rst_p => reset_out,
       sigin => sig_d_1,
       tsig_out => sig_mod_d(1)
  );

U115 : no_del_mux
  port map(
       s_addr(0) => s_del_path(4),
       s_addr(1) => s_del_path(5),
       rst_p => reset_out,
       sigin => sig_d_2,
       tsig_out => sig_mod_d(2)
  );

U116 : no_del_mux
  port map(
       s_addr(0) => s_del_path(6),
       s_addr(1) => s_del_path(7),
       rst_p => reset_out,
       sigin => sig_d_3,
       tsig_out => sig_mod_d(3)
  );

sig_d_0(0) <= sig_mod(0);

sig_d_0(1) <= x(0);

sig_d_1(0) <= sig_mod(1);

dac_ctl_reset <= reset_out or dac_ctl(0);

sig_d_1(1) <= x(1);

sig_d_3(0) <= sig_mod(3);

sig_d_3(1) <= x(3);

sig_d_2(0) <= sig_mod(2);

sig_d_2(1) <= x(2);

sg_mid <= (sg_out_s and not sp_signl_sel(0)) or (NET16680 and sp_signl_sel(0));

U126 : reg_8
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
       q => BUS16747,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(12)
  );

NET16842 <= x(3) and x(2);

U128 : reg_8
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
       q => sp_signl_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(13)
  );

NET17043 <= ctr_resets(7) or reset_out;

U13 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => blk_data_in_s,
       reset_p => reset_out,
       wr_en => blk_wr_en(0)
  );

U130 : stsp_counter
  port map(
       count_out(0) => dur_ct(0),
       count_out(1) => dur_ct(1),
       count_out(2) => dur_ct(2),
       count_out(3) => dur_ct(3),
       count_out(4) => dur_ct(4),
       count_out(5) => dur_ct(5),
       count_out(6) => dur_ct(6),
       count_out(7) => dur_ct(7),
       count_out(8) => dur_ct(8),
       count_out(9) => dur_ct(9),
       count_out(10) => dur_ct(10),
       count_out(11) => dur_ct(11),
       count_out(12) => dur_ct(12),
       count_out(13) => dur_ct(13),
       count_out(14) => dur_ct(14),
       count_out(15) => dur_ct(15),
       count_out(16) => dur_ct(16),
       count_out(17) => dur_ct(17),
       count_out(18) => dur_ct(18),
       count_out(19) => dur_ct(19),
       count_out(20) => dur_ct(20),
       count_out(21) => dur_ct(21),
       count_out(22) => dur_ct(22),
       count_out(23) => dur_ct(23),
       count_out(24) => dur_ct(24),
       count_out(25) => dur_ct(25),
       count_out(26) => dur_ct(26),
       count_out(27) => dur_ct(27),
       count_out(28) => dur_ct(28),
       count_out(29) => dur_ct(29),
       count_out(30) => dur_ct(30),
       count_out(31) => dur_ct(31),
       clk => clk1,
       ovr => overflow(9),
       rst_p => NET17043,
       stp => stop_tim_sig_n(0),
       strt => tim_sig(0)
  );

stop_tim_sig_n(0) <= not(stop_tim_sig(0));

U132 : stsp_counter
  port map(
       count_out(0) => dur_ct(32),
       count_out(1) => dur_ct(33),
       count_out(2) => dur_ct(34),
       count_out(3) => dur_ct(35),
       count_out(4) => dur_ct(36),
       count_out(5) => dur_ct(37),
       count_out(6) => dur_ct(38),
       count_out(7) => dur_ct(39),
       count_out(8) => dur_ct(40),
       count_out(9) => dur_ct(41),
       count_out(10) => dur_ct(42),
       count_out(11) => dur_ct(43),
       count_out(12) => dur_ct(44),
       count_out(13) => dur_ct(45),
       count_out(14) => dur_ct(46),
       count_out(15) => dur_ct(47),
       count_out(16) => dur_ct(48),
       count_out(17) => dur_ct(49),
       count_out(18) => dur_ct(50),
       count_out(19) => dur_ct(51),
       count_out(20) => dur_ct(52),
       count_out(21) => dur_ct(53),
       count_out(22) => dur_ct(54),
       count_out(23) => dur_ct(55),
       count_out(24) => dur_ct(56),
       count_out(25) => dur_ct(57),
       count_out(26) => dur_ct(58),
       count_out(27) => dur_ct(59),
       count_out(28) => dur_ct(60),
       count_out(29) => dur_ct(61),
       count_out(30) => dur_ct(62),
       count_out(31) => dur_ct(63),
       clk => clk1,
       ovr => overflow(10),
       rst_p => NET17201,
       stp => stop_tim_sig_n(1),
       strt => tim_sig(1)
  );

NET17201 <= ctr_resets(8) or reset_out;

stop_tim_sig_n(1) <= not(stop_tim_sig(1));

U135 : stsp_counter
  port map(
       count_out(0) => dur_ct(64),
       count_out(1) => dur_ct(65),
       count_out(2) => dur_ct(66),
       count_out(3) => dur_ct(67),
       count_out(4) => dur_ct(68),
       count_out(5) => dur_ct(69),
       count_out(6) => dur_ct(70),
       count_out(7) => dur_ct(71),
       count_out(8) => dur_ct(72),
       count_out(9) => dur_ct(73),
       count_out(10) => dur_ct(74),
       count_out(11) => dur_ct(75),
       count_out(12) => dur_ct(76),
       count_out(13) => dur_ct(77),
       count_out(14) => dur_ct(78),
       count_out(15) => dur_ct(79),
       count_out(16) => dur_ct(80),
       count_out(17) => dur_ct(81),
       count_out(18) => dur_ct(82),
       count_out(19) => dur_ct(83),
       count_out(20) => dur_ct(84),
       count_out(21) => dur_ct(85),
       count_out(22) => dur_ct(86),
       count_out(23) => dur_ct(87),
       count_out(24) => dur_ct(88),
       count_out(25) => dur_ct(89),
       count_out(26) => dur_ct(90),
       count_out(27) => dur_ct(91),
       count_out(28) => dur_ct(92),
       count_out(29) => dur_ct(93),
       count_out(30) => dur_ct(94),
       count_out(31) => dur_ct(95),
       clk => clk1,
       ovr => overflow(11),
       rst_p => NET17286,
       stp => stop_tim_sig_n(2),
       strt => tim_sig(2)
  );

NET17286 <= ctr_resets(9) or reset_out;

stop_tim_sig_n(2) <= not(stop_tim_sig(2));

U138 : stsp_counter
  port map(
       count_out(0) => dur_ct(96),
       count_out(1) => dur_ct(97),
       count_out(2) => dur_ct(98),
       count_out(3) => dur_ct(99),
       count_out(4) => dur_ct(100),
       count_out(5) => dur_ct(101),
       count_out(6) => dur_ct(102),
       count_out(7) => dur_ct(103),
       count_out(8) => dur_ct(104),
       count_out(9) => dur_ct(105),
       count_out(10) => dur_ct(106),
       count_out(11) => dur_ct(107),
       count_out(12) => dur_ct(108),
       count_out(13) => dur_ct(109),
       count_out(14) => dur_ct(110),
       count_out(15) => dur_ct(111),
       count_out(16) => dur_ct(112),
       count_out(17) => dur_ct(113),
       count_out(18) => dur_ct(114),
       count_out(19) => dur_ct(115),
       count_out(20) => dur_ct(116),
       count_out(21) => dur_ct(117),
       count_out(22) => dur_ct(118),
       count_out(23) => dur_ct(119),
       count_out(24) => dur_ct(120),
       count_out(25) => dur_ct(121),
       count_out(26) => dur_ct(122),
       count_out(27) => dur_ct(123),
       count_out(28) => dur_ct(124),
       count_out(29) => dur_ct(125),
       count_out(30) => dur_ct(126),
       count_out(31) => dur_ct(127),
       clk => clk1,
       ovr => overflow(12),
       rst_p => NET17374,
       stp => stop_tim_sig_n(3),
       strt => tim_sig(3)
  );

NET17374 <= ctr_resets(10) or reset_out;

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

stop_tim_sig_n(3) <= not(stop_tim_sig(3));

NET17723 <= NET18073 or sp_signl_sel(1);

NET17811 <= reset_out or ctr_resets(11);

NET17984 <= not(sg_mid);

sg_pout <= (sg_mid and not sp_signl_sel(2)) or (NET17984 and sp_signl_sel(2));

U145 : ld_array_4_v2_1_phase
  port map(
       clk0 => clk_40DCM,
       dis_ops => pulse_ctl(1),
       dl => out_wd,
       rst_p => ld_arr_rst_p,
       s_out => sig_cms,
       sig_in => sig_norm
  );

U146 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => out_wd,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(16)
  );

ps_en_all <= not(NET18610);

trig_cms <= sig_cms;

NET18610 <= bkpress and fs_sync_bus(9);

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

NET19137 <= veto_out_p2 or pulse_ctl(1);

trig_cms1 <= sig_cms1;

U152 : ld_array_4_v2_1_phase
  port map(
       clk0 => clk_40DCM,
       dis_ops => NET19137,
       dl => out_wd,
       rst_p => ld_arr_rst_p,
       s_out => sig_cms2,
       sig_in => sig_norm
  );

veto_out_p2 <= not(veto_out_n2);

trig_cms2 <= sig_cms2;

U155 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => BUS18923,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(17)
  );

U156 : veto_count
  port map(
       clk => clk0,
       count_in => BUS18923,
       reset_p => ctr_resets(14),
       sig_in => sig_norm,
       veto_out_n => veto_out_n1
  );

U157 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => BUS18999,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(18)
  );

U158 : veto_count
  port map(
       clk => clk0,
       count_in => BUS18999,
       reset_p => ctr_resets(14),
       sig_in => sig_norm,
       veto_out_n => veto_out_n2
  );

veto_out_p1 <= not(veto_out_n1);

U16 : decode_addr_NIM_Plus_1
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_1,
       wr_en => rx_wren
  );

NET19104 <= veto_out_p1 or pulse_ctl(1);

NET19190 <= ctr_resets(1) or reset_out;

U162 : count32
  port map(
       clock => sig_cms1,
       clr_count => ctr_clears(1),
       count_out => in_ev_ctr_1,
       cout_en_p => ctr_enables(1),
       ovrflow => overflow(5),
       reset_p => NET19190
  );

NET19293 <= ctr_resets(2) or reset_out;

U164 : count32
  port map(
       clock => sig_cms2,
       clr_count => ctr_clears(2),
       count_out => in_ev_ctr_2,
       cout_en_p => ctr_enables(2),
       ovrflow => overflow(6),
       reset_p => NET19293
  );

sigmux(14) <= veto_out_n2;

U166 : b_fifo_mux
  port map(
       wd_in1(0) => Dangling_Input_Signal,
       wd_in1(1) => Dangling_Input_Signal,
       wd_in1(2) => Dangling_Input_Signal,
       wd_in1(3) => Dangling_Input_Signal,
       wd_in1(4) => Dangling_Input_Signal,
       wd_in1(5) => Dangling_Input_Signal,
       wd_in1(6) => Dangling_Input_Signal,
       wd_in1(7) => Dangling_Input_Signal,
       wd_in1(8) => Dangling_Input_Signal,
       wd_in1(9) => Dangling_Input_Signal,
       wd_in1(10) => Dangling_Input_Signal,
       wd_in1(11) => Dangling_Input_Signal,
       wd_in1(12) => Dangling_Input_Signal,
       wd_in1(13) => Dangling_Input_Signal,
       wd_in1(14) => Dangling_Input_Signal,
       wd_in1(15) => Dangling_Input_Signal,
       wd_in1(16) => Dangling_Input_Signal,
       wd_in1(17) => Dangling_Input_Signal,
       wd_in1(18) => Dangling_Input_Signal,
       wd_in1(19) => Dangling_Input_Signal,
       wd_in1(20) => Dangling_Input_Signal,
       wd_in1(21) => Dangling_Input_Signal,
       wd_in1(22) => Dangling_Input_Signal,
       wd_in1(23) => Dangling_Input_Signal,
       wd_in1(24) => Dangling_Input_Signal,
       wd_in1(25) => Dangling_Input_Signal,
       wd_in1(26) => Dangling_Input_Signal,
       wd_in1(27) => Dangling_Input_Signal,
       wd_in1(28) => Dangling_Input_Signal,
       wd_in1(29) => Dangling_Input_Signal,
       wd_in1(30) => Dangling_Input_Signal,
       wd_in1(31) => Dangling_Input_Signal,
       b_fifo_out => b_read,
       rst_p => out_cnt_rst,
       s_addr => mux_dir,
       wd_in0 => out_ev_ctr,
       wd_in2 => in_ev_ctr_1,
       wd_in3 => in_ev_ctr_2
  );

U167 : cntrs_2_b_fifo
  port map(
       b_wr => b_wr_out_b,
       clk => tx_clk,
       mux_dir => mux_dir,
       reset_p => out_cnt_rst,
       sig_in => sig_cms
  );

bkpress <= bkpb or bkpa;

sigmux(15) <= ps_en_all;

U17 : reg_8
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

sigmux(16) <= bkpa;

sigmux(17) <= bkpb;

sigmux(18) <= out_ev_ctr(0);

sigmux(19) <= in_ev_ctr_1(0);

sigmux(20) <= in_ev_ctr_2(0);

sigmux(21) <= b_wr_out_b;

b_wr_out <= b_wr_out_b;

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
       q => pulse_ctl_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(4)
  );

U19 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => ld_reg_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(2)
  );

U2 : decode_addr_NIM_Plus
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en,
       wr_en => rx_wren
  );

ld_arr_rst_p_1 <= reset_out or pulse_ctl_1(0);

U21 : ld_array_4_v2
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

U22 : reg_8
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
       q => pulse_ctl_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(4)
  );

U24 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => ld_reg_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(2)
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
       s_out => sig_mod_mux_b,
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
       q => ld_wr_in_3,
       reset_p => reset_out,
       wr_en => blk_wr_en_3(3)
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
       q => pulse_ctl_3,
       reset_p => reset_out,
       wr_en => blk_wr_en_3(4)
  );

U3 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => ld_reg,
       reset_p => reset_out,
       wr_en => blk_wr_en(2)
  );

U30 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
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

U34 : reg_8
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
       q => pulse_ctl_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_4(4)
  );

U36 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => ld_reg_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_4(2)
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
       count_out => out_ev_ctr,
       ctr_enables => ctr_enables,
       ctr_resets => ctr_resets,
       dac_ctl => dac_ctl,
       dac_data => blk_data_in_s,
       del_ct => del_ct,
       dlr_1 => ld_reg_1,
       dlr_2 => ld_reg_2,
       dlr_3 => ld_reg_3,
       dlr_4 => ld_reg_4,
       dlr_o => ld_reg,
       dur_ct => dur_ct,
       in_count_0 => in_ev_ctr_1,
       in_count_1 => in_ev_ctr_2,
       in_count_2 => in_ev_ctr_3,
       in_count_3 => in_ev_ctr_4,
       lcw_1 => ld_wr_in_1,
       lcw_2 => ld_wr_in_2,
       lcw_3 => ld_wr_in_3,
       lcw_4 => ld_wr_in_4,
       lcw_o => ld_wr_in,
       ovfl_16 => overflow,
       pw_1 => pulse_ctl_1,
       pw_2 => pulse_ctl_2,
       pw_3 => pulse_ctl_3,
       pw_4 => pulse_ctl_4,
       pw_o => pulse_ctl,
       rden => NET5065,
       read_data_out => BUS5198,
       s_del_path => s_del_path,
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

NET5065 <= not(rx_wren);

U41 : reg_32
  port map(
       clk => tx_clk,
       d => BUS5198,
       q => read_data_out,
       reset_p => reset_out,
       wr_en => NET5210
  );

NET5210 <= not(reset_out);

U43 : test_mux
  port map(
       rst_p => reset_out,
       s_addr => mux_ctl,
       sigtestin => sigmux,
       tsig_out => NET12133
  );

sigmux(1) <= x(0);

sigmux(2) <= x(1);

sigmux(3) <= x(2);

sigmux(4) <= x(3);

sigmux(5) <= sig_mod_d(0);

sigmux(6) <= sig_mod_d(1);

U5 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => sel_blk_en_term,
       reset_p => sel_reset,
       wr_en => blk_wr_en(7)
  );

sigmux(7) <= sig_mod_d(2);

sigmux(8) <= sig_mod_d(3);

sigmux(0) <= sig_norm;

sigmux(9) <= sig_log;

U54 : reg_8
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
       q => mux_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en(5)
  );

U55 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ps_cnt,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(4)
  );

U56 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => ctr_resets,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(0)
  );

U57 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => ctr_enables,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(1)
  );

U58 : count32
  port map(
       clock => sig_cms,
       clr_count => ctr_clears(0),
       count_out => out_ev_ctr,
       cout_en_p => ctr_enables(0),
       ovrflow => overflow(0),
       reset_p => out_cnt_rst
  );

U59 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => ctr_clears,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(2)
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

out_cnt_rst <= ctr_resets(0) or reset_out;

sigmux(10) <= sig_cms;

sigmux(11) <= sig_cms1;

sigmux(12) <= sig_cms2;

sigmux(13) <= veto_out_n1;

NET9478 <= ctr_resets(3) or reset_out;

U66 : count32
  port map(
       clock => sig_mod_d(2),
       clr_count => ctr_clears(3),
       count_out => in_ev_ctr_3,
       cout_en_p => ctr_enables(3),
       ovrflow => overflow(7),
       reset_p => NET9478
  );

NET9526 <= ctr_resets(4) or reset_out;

U68 : count32
  port map(
       clock => sig_mod_d(3),
       clr_count => ctr_clears(4),
       count_out => in_ev_ctr_4,
       cout_en_p => ctr_enables(4),
       ovrflow => overflow(8),
       reset_p => NET9526
  );

U69 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => pcnt,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(5)
  );

U7 : sel_block
  port map(
       blk_en => sel_ctl(1),
       en_term => sel_blk_en_term,
       rst_p => reset_out,
       sig_out => sig_log,
       x => sig_mod_d
  );

U70 : ld_array_4_v2_1_phase
  port map(
       clk0 => clk_40DCM,
       dis_ops => NET19104,
       dl => out_wd,
       rst_p => ld_arr_rst_p,
       s_out => sig_cms1,
       sig_in => sig_norm
  );

U71 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => BUS10839,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(3)
  );

U72 : veto_count
  port map(
       clk => clk0,
       count_in => BUS10839,
       reset_p => ctr_resets(14),
       sig_in => sig_norm,
       veto_out_n => veto_out_n
  );

s_out <= not(NET12133);

U74 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => phi,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(6)
  );

U75 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => plo,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(7)
  );

U76 : sig_gen_prog
  port map(
       clk => clk0,
       p_count => pcnt,
       p_hi => phi,
       p_lo => plo,
       p_out => sg_out_s,
       reset_p => rst_sgprog_p,
       start_en => ctr_enables(5)
  );

U77 : decode_addr_NIM_Plus_ctrs
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_cts,
       wr_en => rx_wren
  );

NET18073 <= not(x(1));

rst_sgprog_p <= ctr_resets(5) or reset_out;

ld_arr_rst_p <= reset_out or pulse_ctl(0);

U80 : HGCAL_Veto_w_Rearm
  port map(
       clk => clk2,
       en_rearm => NET17723,
       high_period => BUS16747,
       reset_p => NET17811,
       start_in => NET16842,
       trig_out => NET16680
  );

sig_mod(2) <= (sync_w_40MHz and not fs_sync_bus(8)) or (sig_mod_mux_b and fs_sync_bus(8));

U82 : fs_sync_module
  port map(
       MHz_40 => clk_40DCM,
       sel_sync_in(0) => fs_sync_bus(0),
       sel_sync_in(1) => fs_sync_bus(1),
       sel_sync_in(2) => fs_sync_bus(2),
       sel_sync_in(3) => fs_sync_bus(3),
       sel_sync_in(4) => fs_sync_bus(4),
       sel_sync_in(5) => fs_sync_bus(5),
       sel_sync_in(6) => fs_sync_bus(6),
       sel_sync_in(7) => fs_sync_bus(7),
       clock_320MHz => fst_clk_in,
       reset_async_p => ctr_resets(6),
       reset_master_p => reset_out,
       sel_sync_out => sync_w_40MHz
  );

U83 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => fs_sync_bus,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(8)
  );

U84 : stsp_counter
  port map(
       count_out(0) => del_ct(0),
       count_out(1) => del_ct(1),
       count_out(2) => del_ct(2),
       count_out(3) => del_ct(3),
       count_out(4) => del_ct(4),
       count_out(5) => del_ct(5),
       count_out(6) => del_ct(6),
       count_out(7) => del_ct(7),
       count_out(8) => del_ct(8),
       count_out(9) => del_ct(9),
       count_out(10) => del_ct(10),
       count_out(11) => del_ct(11),
       count_out(12) => del_ct(12),
       count_out(13) => del_ct(13),
       count_out(14) => del_ct(14),
       count_out(15) => del_ct(15),
       count_out(16) => del_ct(16),
       count_out(17) => del_ct(17),
       count_out(18) => del_ct(18),
       count_out(19) => del_ct(19),
       count_out(20) => del_ct(20),
       count_out(21) => del_ct(21),
       count_out(22) => del_ct(22),
       count_out(23) => del_ct(23),
       count_out(24) => del_ct(24),
       count_out(25) => del_ct(25),
       count_out(26) => del_ct(26),
       count_out(27) => del_ct(27),
       count_out(28) => del_ct(28),
       count_out(29) => del_ct(29),
       count_out(30) => del_ct(30),
       count_out(31) => del_ct(31),
       clk => clk1,
       ovr => overflow(1),
       rst_p => NET14556,
       stp => stop_tim_sig(0),
       strt => tim_sig(0)
  );

U85 : stsp_counter
  port map(
       count_out(0) => del_ct(32),
       count_out(1) => del_ct(33),
       count_out(2) => del_ct(34),
       count_out(3) => del_ct(35),
       count_out(4) => del_ct(36),
       count_out(5) => del_ct(37),
       count_out(6) => del_ct(38),
       count_out(7) => del_ct(39),
       count_out(8) => del_ct(40),
       count_out(9) => del_ct(41),
       count_out(10) => del_ct(42),
       count_out(11) => del_ct(43),
       count_out(12) => del_ct(44),
       count_out(13) => del_ct(45),
       count_out(14) => del_ct(46),
       count_out(15) => del_ct(47),
       count_out(16) => del_ct(48),
       count_out(17) => del_ct(49),
       count_out(18) => del_ct(50),
       count_out(19) => del_ct(51),
       count_out(20) => del_ct(52),
       count_out(21) => del_ct(53),
       count_out(22) => del_ct(54),
       count_out(23) => del_ct(55),
       count_out(24) => del_ct(56),
       count_out(25) => del_ct(57),
       count_out(26) => del_ct(58),
       count_out(27) => del_ct(59),
       count_out(28) => del_ct(60),
       count_out(29) => del_ct(61),
       count_out(30) => del_ct(62),
       count_out(31) => del_ct(63),
       clk => clk1,
       ovr => overflow(2),
       rst_p => NET14569,
       stp => stop_tim_sig(1),
       strt => tim_sig(1)
  );

U86 : stsp_counter
  port map(
       count_out(0) => del_ct(64),
       count_out(1) => del_ct(65),
       count_out(2) => del_ct(66),
       count_out(3) => del_ct(67),
       count_out(4) => del_ct(68),
       count_out(5) => del_ct(69),
       count_out(6) => del_ct(70),
       count_out(7) => del_ct(71),
       count_out(8) => del_ct(72),
       count_out(9) => del_ct(73),
       count_out(10) => del_ct(74),
       count_out(11) => del_ct(75),
       count_out(12) => del_ct(76),
       count_out(13) => del_ct(77),
       count_out(14) => del_ct(78),
       count_out(15) => del_ct(79),
       count_out(16) => del_ct(80),
       count_out(17) => del_ct(81),
       count_out(18) => del_ct(82),
       count_out(19) => del_ct(83),
       count_out(20) => del_ct(84),
       count_out(21) => del_ct(85),
       count_out(22) => del_ct(86),
       count_out(23) => del_ct(87),
       count_out(24) => del_ct(88),
       count_out(25) => del_ct(89),
       count_out(26) => del_ct(90),
       count_out(27) => del_ct(91),
       count_out(28) => del_ct(92),
       count_out(29) => del_ct(93),
       count_out(30) => del_ct(94),
       count_out(31) => del_ct(95),
       clk => clk1,
       ovr => overflow(3),
       rst_p => NET14592,
       stp => stop_tim_sig(2),
       strt => tim_sig(2)
  );

U87 : stsp_counter
  port map(
       count_out(0) => del_ct(96),
       count_out(1) => del_ct(97),
       count_out(2) => del_ct(98),
       count_out(3) => del_ct(99),
       count_out(4) => del_ct(100),
       count_out(5) => del_ct(101),
       count_out(6) => del_ct(102),
       count_out(7) => del_ct(103),
       count_out(8) => del_ct(104),
       count_out(9) => del_ct(105),
       count_out(10) => del_ct(106),
       count_out(11) => del_ct(107),
       count_out(12) => del_ct(108),
       count_out(13) => del_ct(109),
       count_out(14) => del_ct(110),
       count_out(15) => del_ct(111),
       count_out(16) => del_ct(112),
       count_out(17) => del_ct(113),
       count_out(18) => del_ct(114),
       count_out(19) => del_ct(115),
       count_out(20) => del_ct(116),
       count_out(21) => del_ct(117),
       count_out(22) => del_ct(118),
       count_out(23) => del_ct(119),
       count_out(24) => del_ct(120),
       count_out(25) => del_ct(121),
       count_out(26) => del_ct(122),
       count_out(27) => del_ct(123),
       count_out(28) => del_ct(124),
       count_out(29) => del_ct(125),
       count_out(30) => del_ct(126),
       count_out(31) => del_ct(127),
       clk => clk1,
       ovr => overflow(4),
       rst_p => NET14618,
       stp => stop_tim_sig(3),
       strt => tim_sig(3)
  );

NET14556 <= ctr_resets(7) or reset_out;

NET14569 <= ctr_resets(8) or reset_out;

sel_reset <= reset_out or sel_ctl(0);

NET14592 <= ctr_resets(9) or reset_out;

NET14618 <= ctr_resets(10) or reset_out;

U92 : start_sig_mux
  port map(
       s_addr(0) => start_sig_sel(0),
       s_addr(1) => start_sig_sel(1),
       s_addr(2) => start_sig_sel(2),
       rst_p => reset_out,
       sigin => tim_sig_in,
       tsig_out => tim_sig(0)
  );

U93 : start_sig_mux
  port map(
       s_addr(0) => start_sig_sel(4),
       s_addr(1) => start_sig_sel(5),
       s_addr(2) => start_sig_sel(6),
       rst_p => reset_out,
       sigin => tim_sig_in,
       tsig_out => tim_sig(1)
  );

U94 : start_sig_mux
  port map(
       s_addr(0) => start_sig_sel(8),
       s_addr(1) => start_sig_sel(9),
       s_addr(2) => start_sig_sel(10),
       rst_p => reset_out,
       sigin => tim_sig_in,
       tsig_out => tim_sig(2)
  );

U95 : start_sig_mux
  port map(
       s_addr(0) => start_sig_sel(12),
       s_addr(1) => start_sig_sel(13),
       s_addr(2) => start_sig_sel(14),
       rst_p => reset_out,
       sigin => tim_sig_in,
       tsig_out => tim_sig(3)
  );

U96 : reg_16
  port map(
       d(0) => rx_data(0),
       d(1) => rx_data(1),
       d(2) => rx_data(2),
       d(3) => rx_data(3),
       d(4) => rx_data(4),
       d(5) => rx_data(5),
       d(6) => rx_data(6),
       d(7) => rx_data(7),
       d(8) => rx_data(8),
       d(9) => rx_data(9),
       d(10) => rx_data(10),
       d(11) => rx_data(11),
       d(12) => rx_data(12),
       d(13) => rx_data(13),
       d(14) => rx_data(14),
       d(15) => rx_data(15),
       clk => tx_clk,
       q => start_sig_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(9)
  );

tim_sig_in(0) <= x(0);

tim_sig_in(1) <= x(1);

tim_sig_in(2) <= x(2);


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end nim_plus_block_v4;
