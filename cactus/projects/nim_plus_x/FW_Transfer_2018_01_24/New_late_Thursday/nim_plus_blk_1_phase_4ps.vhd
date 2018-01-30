-------------------------------------------------------------------------------
--
-- Title       : nim_plus_blk_1_phase_4ps
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\compile\nim_plus_blk_1_phase_4ps.vhd
-- Generated   : Thu Jan 25 17:32:51 2018
-- From        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2018_01_19_NIMPlus_jw121_320MHz_1Phase_Accel_Sync\NIMPlus\NIMPlus\src\nim_plus_blk_1_phase_4ps.bde
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


entity nim_plus_blk_1_phase_4ps is
  port(
       DAC_clk : in STD_LOGIC;
       bkpa : in STD_LOGIC;
       bkpb : in STD_LOGIC;
       burst_full_ext : in STD_LOGIC;
       clk0 : in STD_LOGIC;
       clk_13_25 : in STD_LOGIC;
       clk_26_5 : in STD_LOGIC;
       clk_40DCM : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       rx_wren : in STD_LOGIC;
       tx_clk : in STD_LOGIC;
       clklock : in STD_LOGIC_VECTOR(7 downto 0);
       rx_addr : in STD_LOGIC_VECTOR(31 downto 0);
       rx_data : in STD_LOGIC_VECTOR(63 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       b_wr_out : out STD_LOGIC;
       ck_mx_out : out STD_LOGIC;
       clk_39_out : out STD_LOGIC;
       dac_out : out STD_LOGIC;
       muxout_1 : out STD_LOGIC;
       muxout_2 : out STD_LOGIC;
       muxout_3 : out STD_LOGIC;
       muxout_4 : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sync : out STD_LOGIC;
       b_read : out STD_LOGIC_VECTOR(63 downto 0);
       dac_clk_mgr_ctl : out STD_LOGIC_VECTOR(7 downto 0);
       read_data_out : out STD_LOGIC_VECTOR(63 downto 0);
       wiz_0_clk_mgr_ctl : out STD_LOGIC_VECTOR(7 downto 0);
       wiz_1_clk_mgr_ctl : out STD_LOGIC_VECTOR(7 downto 0);
       wiz_2_clk_mgr_ctl : out STD_LOGIC_VECTOR(7 downto 0)
  );
end nim_plus_blk_1_phase_4ps;

architecture nim_plus_blk_1_phase_4ps of nim_plus_blk_1_phase_4ps is

---- Component declarations -----

component acc_sync
  port (
       clk_13_25 : in STD_LOGIC;
       clk_26_5 : in STD_LOGIC;
       clk_in : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       release_p : out STD_LOGIC
  );
end component;
component agrgate16_1
  port (
       in0 : in STD_LOGIC;
       in1 : in STD_LOGIC;
       in10 : in STD_LOGIC;
       in11 : in STD_LOGIC;
       in12 : in STD_LOGIC;
       in13 : in STD_LOGIC;
       in14 : in STD_LOGIC;
       in15 : in STD_LOGIC;
       in2 : in STD_LOGIC;
       in3 : in STD_LOGIC;
       in4 : in STD_LOGIC;
       in5 : in STD_LOGIC;
       in6 : in STD_LOGIC;
       in7 : in STD_LOGIC;
       in8 : in STD_LOGIC;
       in9 : in STD_LOGIC;
       out16 : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component agrgate_8_by_8
  port (
       in0 : in STD_LOGIC_VECTOR(7 downto 0);
       in1 : in STD_LOGIC_VECTOR(7 downto 0);
       in2 : in STD_LOGIC_VECTOR(7 downto 0);
       in3 : in STD_LOGIC_VECTOR(7 downto 0);
       in4 : in STD_LOGIC_VECTOR(7 downto 0);
       in5 : in STD_LOGIC_VECTOR(7 downto 0);
       in6 : in STD_LOGIC_VECTOR(7 downto 0);
       in7 : in STD_LOGIC_VECTOR(7 downto 0);
       out_0 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component buf8
  port (
       b_in : in STD_LOGIC_VECTOR(7 downto 0);
       b_out : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component burst_mux_8_to_1
  port (
       rst_p : in STD_LOGIC;
       sel_in : in STD_LOGIC_VECTOR(2 downto 0);
       v_sig_in_0 : in STD_LOGIC_VECTOR(63 downto 0);
       v_sig_in_1 : in STD_LOGIC_VECTOR(63 downto 0);
       v_sig_in_2 : in STD_LOGIC_VECTOR(63 downto 0);
       v_sig_in_3 : in STD_LOGIC_VECTOR(63 downto 0);
       v_sig_in_4 : in STD_LOGIC_VECTOR(63 downto 0);
       v_sig_in_5 : in STD_LOGIC_VECTOR(63 downto 0);
       v_sig_in_6 : in STD_LOGIC_VECTOR(63 downto 0);
       v_sig_in_7 : in STD_LOGIC_VECTOR(63 downto 0);
       w_in : in STD_LOGIC_VECTOR(7 downto 0);
       v_sig_out : out STD_LOGIC_VECTOR(63 downto 0);
       w_out : out STD_LOGIC
  );
end component;
component b_fifo_mux
  port (
       rst_p : in STD_LOGIC;
       s_addr : in STD_LOGIC_VECTOR(1 downto 0);
       wd_in0 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in1 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in2 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in3 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in4 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in5 : in STD_LOGIC_VECTOR(31 downto 0);
       b_fifo_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component cnt32
  port (
       clk : in STD_LOGIC;
       ct_clr : in STD_LOGIC;
       ct_en : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       cnt_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component cnt32_v2
  port (
       clk : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       cnt_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component cnt64
  port (
       clk : in STD_LOGIC;
       ct_clr : in STD_LOGIC;
       ct_en : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       cnt_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component cntrs_2_b_fifo
  port (
       b_fifo_full_p : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       b_wr : out STD_LOGIC;
       fin_wr : out STD_LOGIC;
       mux_dir : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;
component cntrs_2_b_fifo_jw121
  port (
       b_full_p : in STD_LOGIC;
       clk : in STD_LOGIC;
       ct_en : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       b_wr : out STD_LOGIC;
       fin_wr : out STD_LOGIC
  );
end component;
component cnt_64_simp
  port (
       clk : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       out64 : out STD_LOGIC_VECTOR(63 downto 0)
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
component decode_addr_NIM_Plus_ctrs
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       wr_en : in STD_LOGIC;
       blk_wr_en : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component divide_by_8
  port (
       clock : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sigout : out STD_LOGIC
  );
end component;
component load_array_64_v_ps
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(63 downto 0);
       fs_sync_in : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       v_ps_hold_in : in STD_LOGIC;
       w_ext_in : in STD_LOGIC;
       s_out : out STD_LOGIC;
       v_ps_ld_ct_out : out STD_LOGIC
  );
end component;
component mux64_2
  port (
       in_0 : in STD_LOGIC_VECTOR(63 downto 0);
       in_1 : in STD_LOGIC_VECTOR(63 downto 0);
       sel : in STD_LOGIC;
       out64 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component mux_2_1_16ch
  port (
       in_ch0 : in STD_LOGIC_VECTOR(15 downto 0);
       in_ch1 : in STD_LOGIC_VECTOR(15 downto 0);
       sel : in STD_LOGIC;
       s_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component mux_8_to_1
  port (
       rst_p : in STD_LOGIC;
       sel_in : in STD_LOGIC_VECTOR(2 downto 0);
       sig_in : in STD_LOGIC_VECTOR(7 downto 0);
       out_1 : out STD_LOGIC
  );
end component;
component pol_sel
  port (
       sel_in : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       sig_out : out STD_LOGIC
  );
end component;
component ps_hold_count
  port (
       clk : in STD_LOGIC;
       count_in : in STD_LOGIC_VECTOR(31 downto 0);
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       ps_hold_out_p : out STD_LOGIC
  );
end component;
component read_decode_p
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       rd_0 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_1 : in STD_LOGIC_VECTOR(63 downto 0);
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
       rd_2 : in STD_LOGIC_VECTOR(63 downto 0);
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
       rd_3 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_30 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_31 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_4 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_5 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_6 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_7 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_8 : in STD_LOGIC_VECTOR(63 downto 0);
       rd_9 : in STD_LOGIC_VECTOR(63 downto 0);
       rden : in STD_LOGIC;
       read_data_out : out STD_LOGIC_VECTOR(63 downto 0)
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
component reg_64
  port (
       clk : in STD_LOGIC;
       d : in STD_LOGIC_VECTOR(63 downto 0);
       reset_p : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR(63 downto 0)
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
component scope_probe_4ch
  port (
       b_full_p : in STD_LOGIC;
       clk : in STD_LOGIC;
       disable_p : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC_VECTOR(3 downto 0);
       br_wr_out : out STD_LOGIC
  );
end component;
component section_counter
  port (
       clk : in STD_LOGIC;
       release_p : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sec_in : in STD_LOGIC_VECTOR(7 downto 0);
       sec_en : out STD_LOGIC
  );
end component;
component sel_block
  port (
       blk_en : in STD_LOGIC;
       en_term : in STD_LOGIC_VECTOR(15 downto 0);
       rst_p : in STD_LOGIC;
       x : in STD_LOGIC_VECTOR(3 downto 0);
       logterm : out STD_LOGIC_VECTOR(15 downto 0);
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
component trig_sync
  port (
       clk : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       trig_sec_in : in STD_LOGIC_VECTOR(7 downto 0);
       trig_sync_out : out STD_LOGIC
  );
end component;
component ver_code
  port (
       clk : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       v_num : out STD_LOGIC_VECTOR(31 downto 0)
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
component v_sec_32_4_in_64_out
  port (
       v_in_0 : in STD_LOGIC_VECTOR(31 downto 0);
       v_in_1 : in STD_LOGIC_VECTOR(31 downto 0);
       v_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component v_sec_60_4_in_64_out
  port (
       v_in_0 : in STD_LOGIC_VECTOR(59 downto 0);
       v_in_1 : in STD_LOGIC_VECTOR(3 downto 0);
       v_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal acc_release : STD_LOGIC;
signal bkpress : STD_LOGIC;
signal bkprout : STD_LOGIC;
signal bkprout_v1 : STD_LOGIC;
signal bkprout_v2 : STD_LOGIC;
signal burst_full_int : STD_LOGIC;
signal b_wr_out_b : STD_LOGIC;
signal cbp_a : STD_LOGIC;
signal cbp_b : STD_LOGIC;
signal dac_ctl_reset : STD_LOGIC;
signal fin_wr_out : STD_LOGIC;
signal fs_ctl_0 : STD_LOGIC;
signal fs_ctl_1 : STD_LOGIC;
signal fs_ctl_2 : STD_LOGIC;
signal GND : STD_LOGIC;
signal ld_arr_rst_p : STD_LOGIC;
signal ld_arr_rst_p_1 : STD_LOGIC;
signal ld_arr_rst_p_2 : STD_LOGIC;
signal ld_arr_rst_p_3 : STD_LOGIC;
signal ld_arr_rst_p_4 : STD_LOGIC;
signal ld_arr_rst_v1 : STD_LOGIC;
signal ld_arr_rst_v2 : STD_LOGIC;
signal muxout_2a : STD_LOGIC;
signal muxout_3a : STD_LOGIC;
signal muxout_4a : STD_LOGIC;
signal NET12133 : STD_LOGIC;
signal NET14556 : STD_LOGIC;
signal NET14569 : STD_LOGIC;
signal NET14592 : STD_LOGIC;
signal NET14618 : STD_LOGIC;
signal NET17043 : STD_LOGIC;
signal NET17201 : STD_LOGIC;
signal NET17286 : STD_LOGIC;
signal NET17374 : STD_LOGIC;
signal NET17984 : STD_LOGIC;
signal NET19190 : STD_LOGIC;
signal NET19293 : STD_LOGIC;
signal NET20962 : STD_LOGIC;
signal NET20984 : STD_LOGIC;
signal NET24020 : STD_LOGIC;
signal NET24170 : STD_LOGIC;
signal NET25266 : STD_LOGIC;
signal NET25528 : STD_LOGIC;
signal NET26456 : STD_LOGIC;
signal NET28167 : STD_LOGIC;
signal NET29461 : STD_LOGIC;
signal NET29923 : STD_LOGIC;
signal NET30246 : STD_LOGIC;
signal NET31383 : STD_LOGIC;
signal NET31653 : STD_LOGIC;
signal NET31662 : STD_LOGIC;
signal NET32014 : STD_LOGIC;
signal NET32023 : STD_LOGIC;
signal NET32032 : STD_LOGIC;
signal NET32275 : STD_LOGIC;
signal NET32369 : STD_LOGIC;
signal NET32614 : STD_LOGIC;
signal NET32706 : STD_LOGIC;
signal NET33761 : STD_LOGIC;
signal NET35351 : STD_LOGIC;
signal NET36444 : STD_LOGIC;
signal NET36449 : STD_LOGIC;
signal NET41961 : STD_LOGIC;
signal NET43804 : STD_LOGIC;
signal NET44704 : STD_LOGIC;
signal NET9478 : STD_LOGIC;
signal NET9526 : STD_LOGIC;
signal out_cnt_rst : STD_LOGIC;
signal ps_hold_0 : STD_LOGIC;
signal ps_hold_1 : STD_LOGIC;
signal ps_hold_2 : STD_LOGIC;
signal rst_sgprog_p : STD_LOGIC;
signal sel_reset : STD_LOGIC;
signal sgp : STD_LOGIC;
signal sg_out_s : STD_LOGIC;
signal sg_pout : STD_LOGIC;
signal sig_ch1 : STD_LOGIC;
signal sig_ch2 : STD_LOGIC;
signal sig_cms1 : STD_LOGIC;
signal sig_cms2 : STD_LOGIC;
signal sig_log : STD_LOGIC;
signal sig_norm : STD_LOGIC;
signal sumsig0 : STD_LOGIC;
signal sumsig1 : STD_LOGIC;
signal sumsig2 : STD_LOGIC;
signal sync_w_40MHz : STD_LOGIC;
signal sync_w_accel : STD_LOGIC;
signal veto_out_n0 : STD_LOGIC;
signal veto_out_n1 : STD_LOGIC;
signal veto_out_n2 : STD_LOGIC;
signal veto_out_p0 : STD_LOGIC;
signal veto_out_p1 : STD_LOGIC;
signal veto_out_p2 : STD_LOGIC;
signal vps_ld_ct_0 : STD_LOGIC;
signal vps_ld_ct_1 : STD_LOGIC;
signal vps_ld_ct_2 : STD_LOGIC;
signal accel_sync_bus : STD_LOGIC_VECTOR (7 downto 0);
signal blk_data_in_s : STD_LOGIC_VECTOR (15 downto 0);
signal blk_wr_en : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_1 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_2 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_3 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_4 : STD_LOGIC_VECTOR (7 downto 0);
signal blk_wr_en_cts : STD_LOGIC_VECTOR (31 downto 0);
signal bp_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal burst_mux_sel : STD_LOGIC_VECTOR (7 downto 0);
signal burst_wr_in : STD_LOGIC_VECTOR (7 downto 0);
signal BUS30353 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS34595 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS34604 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS44834 : STD_LOGIC_VECTOR (63 downto 0);
signal cnt64_simp_out : STD_LOGIC_VECTOR (63 downto 0);
signal ctr_enables : STD_LOGIC_VECTOR (15 downto 0);
signal ctr_resets : STD_LOGIC_VECTOR (15 downto 0);
signal dac_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal dcm : STD_LOGIC_VECTOR (7 downto 0);
signal del_ct : STD_LOGIC_VECTOR (127 downto 0);
signal dur_ct : STD_LOGIC_VECTOR (127 downto 0);
signal ext_clk_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal fs_sync_bus : STD_LOGIC_VECTOR (15 downto 0);
signal gate_sig_in : STD_LOGIC_VECTOR (7 downto 0);
signal in_ev_ctr_1 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_2 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_3 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_4 : STD_LOGIC_VECTOR (31 downto 0);
signal in_pol_sel : STD_LOGIC_VECTOR (7 downto 0);
signal jw121_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal jw121_data : STD_LOGIC_VECTOR (63 downto 0);
signal jw121_logic_term : STD_LOGIC_VECTOR (31 downto 0);
signal ld_reg : STD_LOGIC_VECTOR (63 downto 0);
signal ld_regv1 : STD_LOGIC_VECTOR (63 downto 0);
signal ld_regv2 : STD_LOGIC_VECTOR (63 downto 0);
signal ld_reg_1 : STD_LOGIC_VECTOR (63 downto 0);
signal ld_reg_2 : STD_LOGIC_VECTOR (63 downto 0);
signal ld_reg_3 : STD_LOGIC_VECTOR (63 downto 0);
signal ld_reg_4 : STD_LOGIC_VECTOR (63 downto 0);
signal logterm : STD_LOGIC_VECTOR (15 downto 0);
signal log_ev_ctr : STD_LOGIC_VECTOR (31 downto 0);
signal log_lat_sel : STD_LOGIC_VECTOR (7 downto 0);
signal muxin_2 : STD_LOGIC_VECTOR (7 downto 0);
signal muxin_3 : STD_LOGIC_VECTOR (7 downto 0);
signal muxin_4 : STD_LOGIC_VECTOR (7 downto 0);
signal muxsel_2 : STD_LOGIC_VECTOR (7 downto 0);
signal muxsel_3 : STD_LOGIC_VECTOR (7 downto 0);
signal muxsel_4 : STD_LOGIC_VECTOR (7 downto 0);
signal mux_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal mux_dir : STD_LOGIC_VECTOR (1 downto 0);
signal out_ev_ctr : STD_LOGIC_VECTOR (31 downto 0);
signal out_pol_sel : STD_LOGIC_VECTOR (7 downto 0);
signal overflow : STD_LOGIC_VECTOR (15 downto 0);
signal pcnt : STD_LOGIC_VECTOR (31 downto 0);
signal phi : STD_LOGIC_VECTOR (31 downto 0);
signal plo : STD_LOGIC_VECTOR (31 downto 0);
signal ps_c1 : STD_LOGIC_VECTOR (15 downto 8);
signal ps_ct0 : STD_LOGIC_VECTOR (31 downto 0);
signal ps_ct1 : STD_LOGIC_VECTOR (31 downto 0);
signal ps_ct2 : STD_LOGIC_VECTOR (31 downto 0);
signal pulse_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_1 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_2 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_3 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_4 : STD_LOGIC_VECTOR (7 downto 0);
signal rdb10 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb11 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb12 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb13 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb14 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb15 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb16 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb17 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb7 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb8 : STD_LOGIC_VECTOR (63 downto 0);
signal rdb9 : STD_LOGIC_VECTOR (63 downto 0);
signal rdd0 : STD_LOGIC_VECTOR (63 downto 0);
signal rdd1 : STD_LOGIC_VECTOR (63 downto 0);
signal rdd2 : STD_LOGIC_VECTOR (63 downto 0);
signal rd_data_out_dyn : STD_LOGIC_VECTOR (63 downto 0);
signal rd_data_out_stat : STD_LOGIC_VECTOR (63 downto 0);
signal scope_count : STD_LOGIC_VECTOR (63 downto 0);
signal scope_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal scope_out : STD_LOGIC_VECTOR (63 downto 0);
signal sel_blk_en_term : STD_LOGIC_VECTOR (15 downto 0);
signal sel_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal sigmux : STD_LOGIC_VECTOR (31 downto 0);
signal sig_event_counts : STD_LOGIC_VECTOR (63 downto 0);
signal sig_mod : STD_LOGIC_VECTOR (3 downto 0);
signal sig_v1_sel : STD_LOGIC_VECTOR (7 downto 0);
signal sig_v2_sel : STD_LOGIC_VECTOR (7 downto 0);
signal sp_signl_sel : STD_LOGIC_VECTOR (7 downto 0);
signal start_sig_sel : STD_LOGIC_VECTOR (15 downto 0);
signal stop_sig_sel : STD_LOGIC_VECTOR (15 downto 0);
signal stop_tim_sig : STD_LOGIC_VECTOR (3 downto 0);
signal stop_tim_sig_in : STD_LOGIC_VECTOR (4 downto 0);
signal stop_tim_sig_n : STD_LOGIC_VECTOR (3 downto 0);
signal tim_sig : STD_LOGIC_VECTOR (3 downto 0);
signal tim_sig_in : STD_LOGIC_VECTOR (4 downto 0);
signal veto1_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal veto2_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal veto_set_0 : STD_LOGIC_VECTOR (31 downto 0);
signal veto_set_1 : STD_LOGIC_VECTOR (31 downto 0);
signal veto_set_2 : STD_LOGIC_VECTOR (31 downto 0);
signal v_num : STD_LOGIC_VECTOR (31 downto 0);
signal w0cm : STD_LOGIC_VECTOR (7 downto 0);
signal w1cm : STD_LOGIC_VECTOR (7 downto 0);
signal w2cm : STD_LOGIC_VECTOR (7 downto 0);
signal y : STD_LOGIC_VECTOR (3 downto 0);
signal z : STD_LOGIC_VECTOR (3 downto 0);
signal z0_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z1_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z2_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z3_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z_sel : STD_LOGIC_VECTOR (15 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg,
       reset_p => reset_out,
       wr_en => blk_wr_en(2)
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

tim_sig_in(3) <= y(3);

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

stop_tim_sig_in(0) <= y(0);

stop_tim_sig_in(1) <= y(1);

stop_tim_sig_in(2) <= y(2);

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

stop_tim_sig_in(3) <= y(3);

stop_tim_sig_in(4) <= sgp;

U112 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => veto_set_0,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(27)
  );

U113 : veto_count
  port map(
       clk => clk0,
       count_in => veto_set_0,
       reset_p => NET31383,
       sig_in => sig_norm,
       veto_out_n => veto_out_n0
  );

veto_out_p0 <= not(veto_out_n0);

U115 : load_array_64_v_ps
  port map(
       clk => clk0,
       dl => ld_regv1,
       fs_sync_in => fs_ctl_1,
       rst_p => ld_arr_rst_v1,
       s_out => sig_cms1,
       sig_in => sig_ch1,
       v_ps_hold_in => sumsig1,
       v_ps_ld_ct_out => vps_ld_ct_1,
       w_ext_in => GND
  );

sumsig0 <= ps_hold_0 or NET28167;

U117 : load_array_64_v_ps
  port map(
       clk => clk0,
       dl => ld_regv2,
       fs_sync_in => fs_ctl_2,
       rst_p => ld_arr_rst_v2,
       s_out => sig_cms2,
       sig_in => sig_ch2,
       v_ps_hold_in => sumsig2,
       v_ps_ld_ct_out => vps_ld_ct_2,
       w_ext_in => GND
  );

sumsig1 <= ps_hold_1 or NET26456;

sumsig2 <= ps_hold_2 or NET25266;

dac_ctl_reset <= reset_out or dac_ctl(0);

fs_ctl_2 <= veto2_ctl(3) or sync_w_40MHz;

U121 : b_fifo_mux
  port map(
       wd_in4(0) => cnt64_simp_out(0),
       wd_in4(1) => cnt64_simp_out(1),
       wd_in4(2) => cnt64_simp_out(2),
       wd_in4(3) => cnt64_simp_out(3),
       wd_in4(4) => cnt64_simp_out(4),
       wd_in4(5) => cnt64_simp_out(5),
       wd_in4(6) => cnt64_simp_out(6),
       wd_in4(7) => cnt64_simp_out(7),
       wd_in4(8) => cnt64_simp_out(8),
       wd_in4(9) => cnt64_simp_out(9),
       wd_in4(10) => cnt64_simp_out(10),
       wd_in4(11) => cnt64_simp_out(11),
       wd_in4(12) => cnt64_simp_out(12),
       wd_in4(13) => cnt64_simp_out(13),
       wd_in4(14) => cnt64_simp_out(14),
       wd_in4(15) => cnt64_simp_out(15),
       wd_in4(16) => cnt64_simp_out(16),
       wd_in4(17) => cnt64_simp_out(17),
       wd_in4(18) => cnt64_simp_out(18),
       wd_in4(19) => cnt64_simp_out(19),
       wd_in4(20) => cnt64_simp_out(20),
       wd_in4(21) => cnt64_simp_out(21),
       wd_in4(22) => cnt64_simp_out(22),
       wd_in4(23) => cnt64_simp_out(23),
       wd_in4(24) => cnt64_simp_out(24),
       wd_in4(25) => cnt64_simp_out(25),
       wd_in4(26) => cnt64_simp_out(26),
       wd_in4(27) => cnt64_simp_out(27),
       wd_in4(28) => cnt64_simp_out(28),
       wd_in4(29) => cnt64_simp_out(29),
       wd_in4(30) => cnt64_simp_out(30),
       wd_in4(31) => cnt64_simp_out(31),
       wd_in5(0) => cnt64_simp_out(32),
       wd_in5(1) => cnt64_simp_out(33),
       wd_in5(2) => cnt64_simp_out(34),
       wd_in5(3) => cnt64_simp_out(35),
       wd_in5(4) => cnt64_simp_out(36),
       wd_in5(5) => cnt64_simp_out(37),
       wd_in5(6) => cnt64_simp_out(38),
       wd_in5(7) => cnt64_simp_out(39),
       wd_in5(8) => cnt64_simp_out(40),
       wd_in5(9) => cnt64_simp_out(41),
       wd_in5(10) => cnt64_simp_out(42),
       wd_in5(11) => cnt64_simp_out(43),
       wd_in5(12) => cnt64_simp_out(44),
       wd_in5(13) => cnt64_simp_out(45),
       wd_in5(14) => cnt64_simp_out(46),
       wd_in5(15) => cnt64_simp_out(47),
       wd_in5(16) => cnt64_simp_out(48),
       wd_in5(17) => cnt64_simp_out(49),
       wd_in5(18) => cnt64_simp_out(50),
       wd_in5(19) => cnt64_simp_out(51),
       wd_in5(20) => cnt64_simp_out(52),
       wd_in5(21) => cnt64_simp_out(53),
       wd_in5(22) => cnt64_simp_out(54),
       wd_in5(23) => cnt64_simp_out(55),
       wd_in5(24) => cnt64_simp_out(56),
       wd_in5(25) => cnt64_simp_out(57),
       wd_in5(26) => cnt64_simp_out(58),
       wd_in5(27) => cnt64_simp_out(59),
       wd_in5(28) => cnt64_simp_out(60),
       wd_in5(29) => cnt64_simp_out(61),
       wd_in5(30) => cnt64_simp_out(62),
       wd_in5(31) => cnt64_simp_out(63),
       b_fifo_out => sig_event_counts,
       rst_p => out_cnt_rst,
       s_addr => mux_dir,
       wd_in0 => out_ev_ctr,
       wd_in1 => log_ev_ctr,
       wd_in2 => in_ev_ctr_1,
       wd_in3 => in_ev_ctr_2
  );

U122 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => ps_ct0,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(28)
  );

U123 : cntrs_2_b_fifo
  port map(
       b_fifo_full_p => burst_full_int,
       b_wr => b_wr_out_b,
       clk => clk0,
       mux_dir => mux_dir,
       reset_p => out_cnt_rst,
       sig_in => sig_norm
  );

U124 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => ps_ct1,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(29)
  );

sigmux(30) <= GND;

sigmux(31) <= GND;

U127 : mux_8_to_1
  port map(
       sel_in(0) => muxsel_2(0),
       sel_in(1) => muxsel_2(1),
       sel_in(2) => muxsel_2(2),
       out_1 => muxout_2a,
       rst_p => reset_out,
       sig_in => muxin_2
  );

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
       clk => clk0,
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
       clk => clk0,
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
       clk => clk0,
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
       clk => clk0,
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

U141 : reg_8
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
       q => muxsel_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(19)
  );

muxin_2(0) <= sig_norm;

NET17984 <= not(sg_out_s);

sg_pout <= (sg_out_s and not sp_signl_sel(0)) or (NET17984 and sp_signl_sel(0));

U145 : ver_code
  port map(
       clk => tx_clk,
       rst_p => reset_out,
       v_num => v_num
  );

U146 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(16)
  );

muxin_2(1) <= sig_cms1;

U148 : pol_sel
  port map(
       sel_in => out_pol_sel(1),
       sig_in => muxout_2a,
       sig_out => muxout_2
  );

bkprout <= bkpress and bp_ctl(0);

U15 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(2)
  );

NET25528 <= z(0) and pulse_ctl(2);

U151 : reg_8
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
       q => out_pol_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(12)
  );

NET28167 <= NET25528 or bkprout or veto_out_p0 or pulse_ctl(1);

veto_out_p2 <= not(veto_out_n2);

U154 : reg_8
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
       q => in_pol_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(11)
  );

U155 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => veto_set_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(17)
  );

muxin_2(2) <= sig_cms2;

U157 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => veto_set_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(18)
  );

muxin_2(3) <= clk_40DCM;

veto_out_p1 <= not(veto_out_n1);

U16 : decode_addr_NIM_Plus_1
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_1,
       wr_en => rx_wren
  );

NET26456 <= NET24170 or bkprout_v1 or veto_out_p1 or veto1_ctl(1);

NET19190 <= reset_out or ctr_resets(1) or pulse_ctl(4);

U162 : cnt32_v2
  port map(
       clk => clk0,
       cnt_out => in_ev_ctr_2,
       rst_p => NET19293,
       sig_in => sig_cms2
  );

NET19293 <= reset_out or ctr_resets(2) or pulse_ctl(5);

sig_log <= NET20984 and NET20962;

sigmux(14) <= veto_out_n2;

U166 : ps_hold_count
  port map(
       clk => clk0,
       count_in => ps_ct0,
       ps_hold_out_p => ps_hold_0,
       reset_p => NET32014,
       sig_in => vps_ld_ct_0
  );

U167 : reg_8
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
       q => jw121_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(31)
  );

bkpress <= cbp_b or cbp_a;

sigmux(15) <= bkprout;

U17 : veto_count
  port map(
       clk => clk0,
       count_in => veto_set_2,
       reset_p => NET31653,
       sig_in => sig_cms2,
       veto_out_n => veto_out_n2
  );

sigmux(16) <= bkpa;

sigmux(17) <= bkpb;

sigmux(18) <= out_ev_ctr(0);

sigmux(19) <= in_ev_ctr_1(0);

sigmux(20) <= in_ev_ctr_2(0);

sigmux(21) <= b_wr_out_b;

NET29923 <= reset_out or jw121_ctl(0);

U177 : cnt32_v2
  port map(
       clk => clk0,
       cnt_out => in_ev_ctr_1,
       rst_p => NET19190,
       sig_in => sig_cms1
  );

U178 : pol_sel
  port map(
       sel_in => in_pol_sel(0),
       sig_in => x(0),
       sig_out => y(0)
  );

U179 : pol_sel
  port map(
       sel_in => in_pol_sel(1),
       sig_in => x(1),
       sig_out => y(1)
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
       q => pulse_ctl_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(4)
  );

U180 : pol_sel
  port map(
       sel_in => in_pol_sel(2),
       sig_in => x(2),
       sig_out => y(2)
  );

U181 : pol_sel
  port map(
       sel_in => in_pol_sel(3),
       sig_in => x(3),
       sig_out => y(3)
  );

U182 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => ps_ct2,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(30)
  );

muxin_2(4) <= sg_pout;

muxin_2(5) <= GND;

muxin_2(6) <= GND;

muxin_2(7) <= GND;

U187 : mux_8_to_1
  port map(
       sel_in(0) => muxsel_3(0),
       sel_in(1) => muxsel_3(1),
       sel_in(2) => muxsel_3(2),
       out_1 => muxout_3a,
       rst_p => reset_out,
       sig_in => muxin_3
  );

U188 : reg_8
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
       q => muxsel_3,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(20)
  );

muxin_3(0) <= sig_norm;

U19 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(2)
  );

muxin_3(1) <= sig_cms1;

muxin_3(2) <= sig_cms2;

muxin_3(3) <= clk_40DCM;

muxin_3(4) <= sg_pout;

muxin_3(5) <= GND;

muxin_3(6) <= GND;

muxin_3(7) <= GND;

U197 : mux_8_to_1
  port map(
       sel_in(0) => muxsel_4(0),
       sel_in(1) => muxsel_4(1),
       sel_in(2) => muxsel_4(2),
       out_1 => muxout_4a,
       rst_p => reset_out,
       sig_in => muxin_4
  );

U198 : reg_8
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
       q => muxsel_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(21)
  );

muxin_4(0) <= sig_norm;

U2 : decode_addr_NIM_Plus
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en,
       wr_en => rx_wren
  );

ld_arr_rst_p_1 <= reset_out or pulse_ctl_1(0);

muxin_4(1) <= sig_cms1;

muxin_4(2) <= sig_cms2;

muxin_4(3) <= clk_40DCM;

muxin_4(4) <= sg_pout;

muxin_4(5) <= GND;

muxin_4(6) <= GND;

muxin_4(7) <= GND;

NET24020 <= z(2) and veto2_ctl(2);

U208 : reg_8
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
       q => veto2_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(23)
  );

NET24170 <= z(1) and veto1_ctl(2);

U21 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_3,
       reset_p => reset_out,
       wr_en => blk_wr_en_3(2)
  );

U210 : reg_8
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
       q => veto1_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(22)
  );

U211 : reg_8
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
       q => ext_clk_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en(3)
  );

ck_mx_out <= ext_clk_ctl(0);

U213 : pol_sel
  port map(
       sel_in => out_pol_sel(3),
       sig_in => muxout_4a,
       sig_out => muxout_4
  );

U214 : pol_sel
  port map(
       sel_in => out_pol_sel(2),
       sig_in => muxout_3a,
       sig_out => muxout_3
  );

ld_arr_rst_v2 <= reset_out or pulse_ctl(5) or veto2_ctl(0);

U216 : ps_hold_count
  port map(
       clk => clk0,
       count_in => ps_ct1,
       ps_hold_out_p => ps_hold_1,
       reset_p => NET32032,
       sig_in => vps_ld_ct_1
  );

bkprout_v2 <= bkpress and bp_ctl(2);

ld_arr_rst_v1 <= reset_out or pulse_ctl(4) or veto1_ctl(0);

U219 : reg_8
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
       q => burst_mux_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(14)
  );

U22 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_regv2,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(3)
  );

sig_ch2 <= (sig_log and not sig_v2_sel(0)) or (sig_norm and sig_v2_sel(0));

bkprout_v1 <= bkpress and bp_ctl(1);

sig_ch1 <= (sig_log and not sig_v1_sel(0)) or (sig_norm and sig_v1_sel(0));

U223 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_regv1,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(2)
  );

U224 : reg_8
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
       q => sig_v2_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(25)
  );

U225 : reg_8
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
       q => sig_v1_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(24)
  );

U226 : mux_8_to_1
  port map(
       out_1 => z(0),
       rst_p => reset_out,
       sel_in => z0_sel,
       sig_in => gate_sig_in
  );

U227 : mux_8_to_1
  port map(
       out_1 => z(1),
       rst_p => reset_out,
       sel_in => z1_sel,
       sig_in => gate_sig_in
  );

U228 : mux_8_to_1
  port map(
       out_1 => z(2),
       rst_p => reset_out,
       sel_in => z2_sel,
       sig_in => gate_sig_in
  );

U229 : mux_8_to_1
  port map(
       out_1 => z(3),
       rst_p => reset_out,
       sel_in => z3_sel,
       sig_in => gate_sig_in
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

U230 : reg_8
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
       q => bp_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(26)
  );

z0_sel(0) <= z_sel(0);

z0_sel(1) <= z_sel(1);

z0_sel(2) <= z_sel(2);

z1_sel(0) <= z_sel(4);

z1_sel(1) <= z_sel(5);

z1_sel(2) <= z_sel(6);

z2_sel(0) <= z_sel(8);

z2_sel(1) <= z_sel(9);

z2_sel(2) <= z_sel(10);

U24 : load_array_64_v_ps
  port map(
       clk => clk0,
       dl => ld_reg_2,
       fs_sync_in => NET32369,
       rst_p => ld_arr_rst_p_2,
       s_out => sig_mod(1),
       sig_in => y(1),
       v_ps_hold_in => GND,
       w_ext_in => GND
  );

z3_sel(0) <= z_sel(12);

z3_sel(1) <= z_sel(13);

z3_sel(2) <= z_sel(14);

U243 : reg_16
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
       q => z_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(4)
  );

U244 : ps_hold_count
  port map(
       clk => clk0,
       count_in => ps_ct2,
       ps_hold_out_p => ps_hold_2,
       reset_p => NET32023,
       sig_in => vps_ld_ct_2
  );

U245 : burst_mux_8_to_1
  port map(
       sel_in(0) => burst_mux_sel(0),
       sel_in(1) => burst_mux_sel(1),
       sel_in(2) => burst_mux_sel(2),
       v_sig_in_3(0) => Dangling_Input_Signal,
       v_sig_in_3(1) => Dangling_Input_Signal,
       v_sig_in_3(2) => Dangling_Input_Signal,
       v_sig_in_3(3) => Dangling_Input_Signal,
       v_sig_in_3(4) => Dangling_Input_Signal,
       v_sig_in_3(5) => Dangling_Input_Signal,
       v_sig_in_3(6) => Dangling_Input_Signal,
       v_sig_in_3(7) => Dangling_Input_Signal,
       v_sig_in_3(8) => Dangling_Input_Signal,
       v_sig_in_3(9) => Dangling_Input_Signal,
       v_sig_in_3(10) => Dangling_Input_Signal,
       v_sig_in_3(11) => Dangling_Input_Signal,
       v_sig_in_3(12) => Dangling_Input_Signal,
       v_sig_in_3(13) => Dangling_Input_Signal,
       v_sig_in_3(14) => Dangling_Input_Signal,
       v_sig_in_3(15) => Dangling_Input_Signal,
       v_sig_in_3(16) => Dangling_Input_Signal,
       v_sig_in_3(17) => Dangling_Input_Signal,
       v_sig_in_3(18) => Dangling_Input_Signal,
       v_sig_in_3(19) => Dangling_Input_Signal,
       v_sig_in_3(20) => Dangling_Input_Signal,
       v_sig_in_3(21) => Dangling_Input_Signal,
       v_sig_in_3(22) => Dangling_Input_Signal,
       v_sig_in_3(23) => Dangling_Input_Signal,
       v_sig_in_3(24) => Dangling_Input_Signal,
       v_sig_in_3(25) => Dangling_Input_Signal,
       v_sig_in_3(26) => Dangling_Input_Signal,
       v_sig_in_3(27) => Dangling_Input_Signal,
       v_sig_in_3(28) => Dangling_Input_Signal,
       v_sig_in_3(29) => Dangling_Input_Signal,
       v_sig_in_3(30) => Dangling_Input_Signal,
       v_sig_in_3(31) => Dangling_Input_Signal,
       v_sig_in_3(32) => Dangling_Input_Signal,
       v_sig_in_3(33) => Dangling_Input_Signal,
       v_sig_in_3(34) => Dangling_Input_Signal,
       v_sig_in_3(35) => Dangling_Input_Signal,
       v_sig_in_3(36) => Dangling_Input_Signal,
       v_sig_in_3(37) => Dangling_Input_Signal,
       v_sig_in_3(38) => Dangling_Input_Signal,
       v_sig_in_3(39) => Dangling_Input_Signal,
       v_sig_in_3(40) => Dangling_Input_Signal,
       v_sig_in_3(41) => Dangling_Input_Signal,
       v_sig_in_3(42) => Dangling_Input_Signal,
       v_sig_in_3(43) => Dangling_Input_Signal,
       v_sig_in_3(44) => Dangling_Input_Signal,
       v_sig_in_3(45) => Dangling_Input_Signal,
       v_sig_in_3(46) => Dangling_Input_Signal,
       v_sig_in_3(47) => Dangling_Input_Signal,
       v_sig_in_3(48) => Dangling_Input_Signal,
       v_sig_in_3(49) => Dangling_Input_Signal,
       v_sig_in_3(50) => Dangling_Input_Signal,
       v_sig_in_3(51) => Dangling_Input_Signal,
       v_sig_in_3(52) => Dangling_Input_Signal,
       v_sig_in_3(53) => Dangling_Input_Signal,
       v_sig_in_3(54) => Dangling_Input_Signal,
       v_sig_in_3(55) => Dangling_Input_Signal,
       v_sig_in_3(56) => Dangling_Input_Signal,
       v_sig_in_3(57) => Dangling_Input_Signal,
       v_sig_in_3(58) => Dangling_Input_Signal,
       v_sig_in_3(59) => Dangling_Input_Signal,
       v_sig_in_3(60) => Dangling_Input_Signal,
       v_sig_in_3(61) => Dangling_Input_Signal,
       v_sig_in_3(62) => Dangling_Input_Signal,
       v_sig_in_3(63) => Dangling_Input_Signal,
       v_sig_in_4(0) => Dangling_Input_Signal,
       v_sig_in_4(1) => Dangling_Input_Signal,
       v_sig_in_4(2) => Dangling_Input_Signal,
       v_sig_in_4(3) => Dangling_Input_Signal,
       v_sig_in_4(4) => Dangling_Input_Signal,
       v_sig_in_4(5) => Dangling_Input_Signal,
       v_sig_in_4(6) => Dangling_Input_Signal,
       v_sig_in_4(7) => Dangling_Input_Signal,
       v_sig_in_4(8) => Dangling_Input_Signal,
       v_sig_in_4(9) => Dangling_Input_Signal,
       v_sig_in_4(10) => Dangling_Input_Signal,
       v_sig_in_4(11) => Dangling_Input_Signal,
       v_sig_in_4(12) => Dangling_Input_Signal,
       v_sig_in_4(13) => Dangling_Input_Signal,
       v_sig_in_4(14) => Dangling_Input_Signal,
       v_sig_in_4(15) => Dangling_Input_Signal,
       v_sig_in_4(16) => Dangling_Input_Signal,
       v_sig_in_4(17) => Dangling_Input_Signal,
       v_sig_in_4(18) => Dangling_Input_Signal,
       v_sig_in_4(19) => Dangling_Input_Signal,
       v_sig_in_4(20) => Dangling_Input_Signal,
       v_sig_in_4(21) => Dangling_Input_Signal,
       v_sig_in_4(22) => Dangling_Input_Signal,
       v_sig_in_4(23) => Dangling_Input_Signal,
       v_sig_in_4(24) => Dangling_Input_Signal,
       v_sig_in_4(25) => Dangling_Input_Signal,
       v_sig_in_4(26) => Dangling_Input_Signal,
       v_sig_in_4(27) => Dangling_Input_Signal,
       v_sig_in_4(28) => Dangling_Input_Signal,
       v_sig_in_4(29) => Dangling_Input_Signal,
       v_sig_in_4(30) => Dangling_Input_Signal,
       v_sig_in_4(31) => Dangling_Input_Signal,
       v_sig_in_4(32) => Dangling_Input_Signal,
       v_sig_in_4(33) => Dangling_Input_Signal,
       v_sig_in_4(34) => Dangling_Input_Signal,
       v_sig_in_4(35) => Dangling_Input_Signal,
       v_sig_in_4(36) => Dangling_Input_Signal,
       v_sig_in_4(37) => Dangling_Input_Signal,
       v_sig_in_4(38) => Dangling_Input_Signal,
       v_sig_in_4(39) => Dangling_Input_Signal,
       v_sig_in_4(40) => Dangling_Input_Signal,
       v_sig_in_4(41) => Dangling_Input_Signal,
       v_sig_in_4(42) => Dangling_Input_Signal,
       v_sig_in_4(43) => Dangling_Input_Signal,
       v_sig_in_4(44) => Dangling_Input_Signal,
       v_sig_in_4(45) => Dangling_Input_Signal,
       v_sig_in_4(46) => Dangling_Input_Signal,
       v_sig_in_4(47) => Dangling_Input_Signal,
       v_sig_in_4(48) => Dangling_Input_Signal,
       v_sig_in_4(49) => Dangling_Input_Signal,
       v_sig_in_4(50) => Dangling_Input_Signal,
       v_sig_in_4(51) => Dangling_Input_Signal,
       v_sig_in_4(52) => Dangling_Input_Signal,
       v_sig_in_4(53) => Dangling_Input_Signal,
       v_sig_in_4(54) => Dangling_Input_Signal,
       v_sig_in_4(55) => Dangling_Input_Signal,
       v_sig_in_4(56) => Dangling_Input_Signal,
       v_sig_in_4(57) => Dangling_Input_Signal,
       v_sig_in_4(58) => Dangling_Input_Signal,
       v_sig_in_4(59) => Dangling_Input_Signal,
       v_sig_in_4(60) => Dangling_Input_Signal,
       v_sig_in_4(61) => Dangling_Input_Signal,
       v_sig_in_4(62) => Dangling_Input_Signal,
       v_sig_in_4(63) => Dangling_Input_Signal,
       v_sig_in_5(0) => Dangling_Input_Signal,
       v_sig_in_5(1) => Dangling_Input_Signal,
       v_sig_in_5(2) => Dangling_Input_Signal,
       v_sig_in_5(3) => Dangling_Input_Signal,
       v_sig_in_5(4) => Dangling_Input_Signal,
       v_sig_in_5(5) => Dangling_Input_Signal,
       v_sig_in_5(6) => Dangling_Input_Signal,
       v_sig_in_5(7) => Dangling_Input_Signal,
       v_sig_in_5(8) => Dangling_Input_Signal,
       v_sig_in_5(9) => Dangling_Input_Signal,
       v_sig_in_5(10) => Dangling_Input_Signal,
       v_sig_in_5(11) => Dangling_Input_Signal,
       v_sig_in_5(12) => Dangling_Input_Signal,
       v_sig_in_5(13) => Dangling_Input_Signal,
       v_sig_in_5(14) => Dangling_Input_Signal,
       v_sig_in_5(15) => Dangling_Input_Signal,
       v_sig_in_5(16) => Dangling_Input_Signal,
       v_sig_in_5(17) => Dangling_Input_Signal,
       v_sig_in_5(18) => Dangling_Input_Signal,
       v_sig_in_5(19) => Dangling_Input_Signal,
       v_sig_in_5(20) => Dangling_Input_Signal,
       v_sig_in_5(21) => Dangling_Input_Signal,
       v_sig_in_5(22) => Dangling_Input_Signal,
       v_sig_in_5(23) => Dangling_Input_Signal,
       v_sig_in_5(24) => Dangling_Input_Signal,
       v_sig_in_5(25) => Dangling_Input_Signal,
       v_sig_in_5(26) => Dangling_Input_Signal,
       v_sig_in_5(27) => Dangling_Input_Signal,
       v_sig_in_5(28) => Dangling_Input_Signal,
       v_sig_in_5(29) => Dangling_Input_Signal,
       v_sig_in_5(30) => Dangling_Input_Signal,
       v_sig_in_5(31) => Dangling_Input_Signal,
       v_sig_in_5(32) => Dangling_Input_Signal,
       v_sig_in_5(33) => Dangling_Input_Signal,
       v_sig_in_5(34) => Dangling_Input_Signal,
       v_sig_in_5(35) => Dangling_Input_Signal,
       v_sig_in_5(36) => Dangling_Input_Signal,
       v_sig_in_5(37) => Dangling_Input_Signal,
       v_sig_in_5(38) => Dangling_Input_Signal,
       v_sig_in_5(39) => Dangling_Input_Signal,
       v_sig_in_5(40) => Dangling_Input_Signal,
       v_sig_in_5(41) => Dangling_Input_Signal,
       v_sig_in_5(42) => Dangling_Input_Signal,
       v_sig_in_5(43) => Dangling_Input_Signal,
       v_sig_in_5(44) => Dangling_Input_Signal,
       v_sig_in_5(45) => Dangling_Input_Signal,
       v_sig_in_5(46) => Dangling_Input_Signal,
       v_sig_in_5(47) => Dangling_Input_Signal,
       v_sig_in_5(48) => Dangling_Input_Signal,
       v_sig_in_5(49) => Dangling_Input_Signal,
       v_sig_in_5(50) => Dangling_Input_Signal,
       v_sig_in_5(51) => Dangling_Input_Signal,
       v_sig_in_5(52) => Dangling_Input_Signal,
       v_sig_in_5(53) => Dangling_Input_Signal,
       v_sig_in_5(54) => Dangling_Input_Signal,
       v_sig_in_5(55) => Dangling_Input_Signal,
       v_sig_in_5(56) => Dangling_Input_Signal,
       v_sig_in_5(57) => Dangling_Input_Signal,
       v_sig_in_5(58) => Dangling_Input_Signal,
       v_sig_in_5(59) => Dangling_Input_Signal,
       v_sig_in_5(60) => Dangling_Input_Signal,
       v_sig_in_5(61) => Dangling_Input_Signal,
       v_sig_in_5(62) => Dangling_Input_Signal,
       v_sig_in_5(63) => Dangling_Input_Signal,
       v_sig_in_6(0) => Dangling_Input_Signal,
       v_sig_in_6(1) => Dangling_Input_Signal,
       v_sig_in_6(2) => Dangling_Input_Signal,
       v_sig_in_6(3) => Dangling_Input_Signal,
       v_sig_in_6(4) => Dangling_Input_Signal,
       v_sig_in_6(5) => Dangling_Input_Signal,
       v_sig_in_6(6) => Dangling_Input_Signal,
       v_sig_in_6(7) => Dangling_Input_Signal,
       v_sig_in_6(8) => Dangling_Input_Signal,
       v_sig_in_6(9) => Dangling_Input_Signal,
       v_sig_in_6(10) => Dangling_Input_Signal,
       v_sig_in_6(11) => Dangling_Input_Signal,
       v_sig_in_6(12) => Dangling_Input_Signal,
       v_sig_in_6(13) => Dangling_Input_Signal,
       v_sig_in_6(14) => Dangling_Input_Signal,
       v_sig_in_6(15) => Dangling_Input_Signal,
       v_sig_in_6(16) => Dangling_Input_Signal,
       v_sig_in_6(17) => Dangling_Input_Signal,
       v_sig_in_6(18) => Dangling_Input_Signal,
       v_sig_in_6(19) => Dangling_Input_Signal,
       v_sig_in_6(20) => Dangling_Input_Signal,
       v_sig_in_6(21) => Dangling_Input_Signal,
       v_sig_in_6(22) => Dangling_Input_Signal,
       v_sig_in_6(23) => Dangling_Input_Signal,
       v_sig_in_6(24) => Dangling_Input_Signal,
       v_sig_in_6(25) => Dangling_Input_Signal,
       v_sig_in_6(26) => Dangling_Input_Signal,
       v_sig_in_6(27) => Dangling_Input_Signal,
       v_sig_in_6(28) => Dangling_Input_Signal,
       v_sig_in_6(29) => Dangling_Input_Signal,
       v_sig_in_6(30) => Dangling_Input_Signal,
       v_sig_in_6(31) => Dangling_Input_Signal,
       v_sig_in_6(32) => Dangling_Input_Signal,
       v_sig_in_6(33) => Dangling_Input_Signal,
       v_sig_in_6(34) => Dangling_Input_Signal,
       v_sig_in_6(35) => Dangling_Input_Signal,
       v_sig_in_6(36) => Dangling_Input_Signal,
       v_sig_in_6(37) => Dangling_Input_Signal,
       v_sig_in_6(38) => Dangling_Input_Signal,
       v_sig_in_6(39) => Dangling_Input_Signal,
       v_sig_in_6(40) => Dangling_Input_Signal,
       v_sig_in_6(41) => Dangling_Input_Signal,
       v_sig_in_6(42) => Dangling_Input_Signal,
       v_sig_in_6(43) => Dangling_Input_Signal,
       v_sig_in_6(44) => Dangling_Input_Signal,
       v_sig_in_6(45) => Dangling_Input_Signal,
       v_sig_in_6(46) => Dangling_Input_Signal,
       v_sig_in_6(47) => Dangling_Input_Signal,
       v_sig_in_6(48) => Dangling_Input_Signal,
       v_sig_in_6(49) => Dangling_Input_Signal,
       v_sig_in_6(50) => Dangling_Input_Signal,
       v_sig_in_6(51) => Dangling_Input_Signal,
       v_sig_in_6(52) => Dangling_Input_Signal,
       v_sig_in_6(53) => Dangling_Input_Signal,
       v_sig_in_6(54) => Dangling_Input_Signal,
       v_sig_in_6(55) => Dangling_Input_Signal,
       v_sig_in_6(56) => Dangling_Input_Signal,
       v_sig_in_6(57) => Dangling_Input_Signal,
       v_sig_in_6(58) => Dangling_Input_Signal,
       v_sig_in_6(59) => Dangling_Input_Signal,
       v_sig_in_6(60) => Dangling_Input_Signal,
       v_sig_in_6(61) => Dangling_Input_Signal,
       v_sig_in_6(62) => Dangling_Input_Signal,
       v_sig_in_6(63) => Dangling_Input_Signal,
       v_sig_in_7(0) => Dangling_Input_Signal,
       v_sig_in_7(1) => Dangling_Input_Signal,
       v_sig_in_7(2) => Dangling_Input_Signal,
       v_sig_in_7(3) => Dangling_Input_Signal,
       v_sig_in_7(4) => Dangling_Input_Signal,
       v_sig_in_7(5) => Dangling_Input_Signal,
       v_sig_in_7(6) => Dangling_Input_Signal,
       v_sig_in_7(7) => Dangling_Input_Signal,
       v_sig_in_7(8) => Dangling_Input_Signal,
       v_sig_in_7(9) => Dangling_Input_Signal,
       v_sig_in_7(10) => Dangling_Input_Signal,
       v_sig_in_7(11) => Dangling_Input_Signal,
       v_sig_in_7(12) => Dangling_Input_Signal,
       v_sig_in_7(13) => Dangling_Input_Signal,
       v_sig_in_7(14) => Dangling_Input_Signal,
       v_sig_in_7(15) => Dangling_Input_Signal,
       v_sig_in_7(16) => Dangling_Input_Signal,
       v_sig_in_7(17) => Dangling_Input_Signal,
       v_sig_in_7(18) => Dangling_Input_Signal,
       v_sig_in_7(19) => Dangling_Input_Signal,
       v_sig_in_7(20) => Dangling_Input_Signal,
       v_sig_in_7(21) => Dangling_Input_Signal,
       v_sig_in_7(22) => Dangling_Input_Signal,
       v_sig_in_7(23) => Dangling_Input_Signal,
       v_sig_in_7(24) => Dangling_Input_Signal,
       v_sig_in_7(25) => Dangling_Input_Signal,
       v_sig_in_7(26) => Dangling_Input_Signal,
       v_sig_in_7(27) => Dangling_Input_Signal,
       v_sig_in_7(28) => Dangling_Input_Signal,
       v_sig_in_7(29) => Dangling_Input_Signal,
       v_sig_in_7(30) => Dangling_Input_Signal,
       v_sig_in_7(31) => Dangling_Input_Signal,
       v_sig_in_7(32) => Dangling_Input_Signal,
       v_sig_in_7(33) => Dangling_Input_Signal,
       v_sig_in_7(34) => Dangling_Input_Signal,
       v_sig_in_7(35) => Dangling_Input_Signal,
       v_sig_in_7(36) => Dangling_Input_Signal,
       v_sig_in_7(37) => Dangling_Input_Signal,
       v_sig_in_7(38) => Dangling_Input_Signal,
       v_sig_in_7(39) => Dangling_Input_Signal,
       v_sig_in_7(40) => Dangling_Input_Signal,
       v_sig_in_7(41) => Dangling_Input_Signal,
       v_sig_in_7(42) => Dangling_Input_Signal,
       v_sig_in_7(43) => Dangling_Input_Signal,
       v_sig_in_7(44) => Dangling_Input_Signal,
       v_sig_in_7(45) => Dangling_Input_Signal,
       v_sig_in_7(46) => Dangling_Input_Signal,
       v_sig_in_7(47) => Dangling_Input_Signal,
       v_sig_in_7(48) => Dangling_Input_Signal,
       v_sig_in_7(49) => Dangling_Input_Signal,
       v_sig_in_7(50) => Dangling_Input_Signal,
       v_sig_in_7(51) => Dangling_Input_Signal,
       v_sig_in_7(52) => Dangling_Input_Signal,
       v_sig_in_7(53) => Dangling_Input_Signal,
       v_sig_in_7(54) => Dangling_Input_Signal,
       v_sig_in_7(55) => Dangling_Input_Signal,
       v_sig_in_7(56) => Dangling_Input_Signal,
       v_sig_in_7(57) => Dangling_Input_Signal,
       v_sig_in_7(58) => Dangling_Input_Signal,
       v_sig_in_7(59) => Dangling_Input_Signal,
       v_sig_in_7(60) => Dangling_Input_Signal,
       v_sig_in_7(61) => Dangling_Input_Signal,
       v_sig_in_7(62) => Dangling_Input_Signal,
       v_sig_in_7(63) => Dangling_Input_Signal,
       rst_p => reset_out,
       v_sig_in_0 => sig_event_counts,
       v_sig_in_1 => scope_out,
       v_sig_in_2 => jw121_data,
       v_sig_out => b_read,
       w_in => burst_wr_in,
       w_out => b_wr_out
  );

U246 : reg_8
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
       q => scope_ctl,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(15)
  );

NET29461 <= scope_ctl(0) or reset_out;

U248 : cnt64
  port map(
       clk => clk0,
       cnt_out => scope_count,
       ct_clr => scope_ctl(2),
       ct_en => scope_ctl(1),
       rst_p => NET29461
  );

U249 : v_sec_60_4_in_64_out
  port map(
       v_in_0(0) => scope_count(0),
       v_in_0(1) => scope_count(1),
       v_in_0(2) => scope_count(2),
       v_in_0(3) => scope_count(3),
       v_in_0(4) => scope_count(4),
       v_in_0(5) => scope_count(5),
       v_in_0(6) => scope_count(6),
       v_in_0(7) => scope_count(7),
       v_in_0(8) => scope_count(8),
       v_in_0(9) => scope_count(9),
       v_in_0(10) => scope_count(10),
       v_in_0(11) => scope_count(11),
       v_in_0(12) => scope_count(12),
       v_in_0(13) => scope_count(13),
       v_in_0(14) => scope_count(14),
       v_in_0(15) => scope_count(15),
       v_in_0(16) => scope_count(16),
       v_in_0(17) => scope_count(17),
       v_in_0(18) => scope_count(18),
       v_in_0(19) => scope_count(19),
       v_in_0(20) => scope_count(20),
       v_in_0(21) => scope_count(21),
       v_in_0(22) => scope_count(22),
       v_in_0(23) => scope_count(23),
       v_in_0(24) => scope_count(24),
       v_in_0(25) => scope_count(25),
       v_in_0(26) => scope_count(26),
       v_in_0(27) => scope_count(27),
       v_in_0(28) => scope_count(28),
       v_in_0(29) => scope_count(29),
       v_in_0(30) => scope_count(30),
       v_in_0(31) => scope_count(31),
       v_in_0(32) => scope_count(32),
       v_in_0(33) => scope_count(33),
       v_in_0(34) => scope_count(34),
       v_in_0(35) => scope_count(35),
       v_in_0(36) => scope_count(36),
       v_in_0(37) => scope_count(37),
       v_in_0(38) => scope_count(38),
       v_in_0(39) => scope_count(39),
       v_in_0(40) => scope_count(40),
       v_in_0(41) => scope_count(41),
       v_in_0(42) => scope_count(42),
       v_in_0(43) => scope_count(43),
       v_in_0(44) => scope_count(44),
       v_in_0(45) => scope_count(45),
       v_in_0(46) => scope_count(46),
       v_in_0(47) => scope_count(47),
       v_in_0(48) => scope_count(48),
       v_in_0(49) => scope_count(49),
       v_in_0(50) => scope_count(50),
       v_in_0(51) => scope_count(51),
       v_in_0(52) => scope_count(52),
       v_in_0(53) => scope_count(53),
       v_in_0(54) => scope_count(54),
       v_in_0(55) => scope_count(55),
       v_in_0(56) => scope_count(56),
       v_in_0(57) => scope_count(57),
       v_in_0(58) => scope_count(58),
       v_in_0(59) => scope_count(59),
       v_in_1 => y,
       v_out => scope_out
  );

ld_arr_rst_p_2 <= reset_out or pulse_ctl_2(0);

U250 : scope_probe_4ch
  port map(
       b_full_p => burst_full_int,
       br_wr_out => burst_wr_in(1),
       clk => clk0,
       disable_p => scope_ctl(3),
       rst_p => reset_out,
       sig_in => y
  );

burst_wr_in(0) <= b_wr_out_b;

U252 : cnt32
  port map(
       clk => clk0,
       cnt_out => BUS30353,
       ct_clr => jw121_ctl(3),
       ct_en => jw121_ctl(2),
       rst_p => NET30246
  );

NET30246 <= z(3) or fin_wr_out or reset_out;

U254 : v_sec_32_4_in_64_out
  port map(
       v_in_0 => BUS30353,
       v_in_1 => jw121_logic_term,
       v_out => jw121_data
  );

U255 : cntrs_2_b_fifo_jw121
  port map(
       b_full_p => burst_full_int,
       b_wr => burst_wr_in(2),
       clk => clk0,
       ct_en => jw121_ctl(1),
       fin_wr => fin_wr_out,
       reset_p => NET29923,
       sig_in => sig_log
  );

fs_ctl_1 <= veto1_ctl(3) or sync_w_40MHz;

fs_ctl_0 <= sync_w_40MHz or pulse_ctl(3);

NET31383 <= reset_out or ctr_resets(13) or pulse_ctl(0);

NET31662 <= ctr_resets(14) or reset_out or pulse_ctl(4);

U26 : decode_addr_NIM_Plus_2
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_2,
       wr_en => rx_wren
  );

NET31653 <= ctr_resets(15) or reset_out or pulse_ctl(5);

cbp_a <= bkpa and bp_ctl(3);

cbp_b <= bkpb and bp_ctl(4);

NET32014 <= reset_out or pulse_ctl(0);

NET32032 <= reset_out or pulse_ctl(4);

NET32023 <= reset_out or pulse_ctl(5);

U266 : load_array_64_v_ps
  port map(
       clk => clk0,
       dl => ld_reg,
       fs_sync_in => fs_ctl_0,
       rst_p => ld_arr_rst_p,
       s_out => sig_norm,
       sig_in => sig_log,
       v_ps_hold_in => sumsig0,
       v_ps_ld_ct_out => vps_ld_ct_0,
       w_ext_in => GND
  );

NET32369 <= not(ld_arr_rst_p_2);

NET32614 <= not(ld_arr_rst_p_3);

U269 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_4(2)
  );

U27 : load_array_64_v_ps
  port map(
       clk => clk0,
       dl => ld_reg_3,
       fs_sync_in => NET32614,
       rst_p => ld_arr_rst_p_3,
       s_out => sig_mod(2),
       sig_in => y(2),
       v_ps_hold_in => GND,
       w_ext_in => GND
  );

U270 : pol_sel
  port map(
       sel_in => out_pol_sel(7),
       sig_in => burst_full_ext,
       sig_out => burst_full_int
  );

U271 : reg_16
  port map(
       clk => clk0,
       d => logterm,
       q => BUS34604,
       reset_p => reset_out,
       wr_en => NET33761
  );

NET33761 <= not(reset_out);

U273 : reg_16
  port map(
       clk => clk0,
       d => BUS34604,
       q => BUS34595,
       reset_p => reset_out,
       wr_en => NET33761
  );

U274 : mux_2_1_16ch
  port map(
       s_out(0) => jw121_logic_term(0),
       s_out(1) => jw121_logic_term(1),
       s_out(2) => jw121_logic_term(2),
       s_out(3) => jw121_logic_term(3),
       s_out(4) => jw121_logic_term(4),
       s_out(5) => jw121_logic_term(5),
       s_out(6) => jw121_logic_term(6),
       s_out(7) => jw121_logic_term(7),
       s_out(8) => jw121_logic_term(8),
       s_out(9) => jw121_logic_term(9),
       s_out(10) => jw121_logic_term(10),
       s_out(11) => jw121_logic_term(11),
       s_out(12) => jw121_logic_term(12),
       s_out(13) => jw121_logic_term(13),
       s_out(14) => jw121_logic_term(14),
       s_out(15) => jw121_logic_term(15),
       in_ch0 => BUS34604,
       in_ch1 => BUS34595,
       sel => log_lat_sel(0)
  );

U275 : reg_8
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
       q => log_lat_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(16)
  );

gate_sig_in(0) <= y(0);

gate_sig_in(1) <= y(1);

gate_sig_in(2) <= y(2);

gate_sig_in(3) <= y(3);

NET32275 <= not(ld_arr_rst_p_1);

gate_sig_in(4) <= GND;

NET35351 <= not(GND);

gate_sig_in(5) <= GND;

gate_sig_in(6) <= GND;

gate_sig_in(7) <= NET35351;

NET36449 <= reset_out or ctr_resets(6);

U286 : acc_sync
  port map(
       clk_13_25 => clk_13_25,
       clk_26_5 => clk_26_5,
       clk_in => clk0,
       release_p => acc_release,
       reset_p => NET36449
  );

U287 : divide_by_8
  port map(
       clock => clk0,
       reset_p => sync_w_accel,
       sigout => clk_39_out
  );

U288 : trig_sync
  port map(
       trig_sec_in(0) => fs_sync_bus(0),
       trig_sec_in(1) => fs_sync_bus(1),
       trig_sec_in(2) => fs_sync_bus(2),
       trig_sec_in(3) => fs_sync_bus(3),
       trig_sec_in(4) => fs_sync_bus(4),
       trig_sec_in(5) => fs_sync_bus(5),
       trig_sec_in(6) => fs_sync_bus(6),
       trig_sec_in(7) => fs_sync_bus(7),
       clk => clk0,
       reset_p => NET36444,
       trig_sync_out => sync_w_40MHz
  );

U289 : reg_8
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
       q => dcm,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(0)
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

jw121_logic_term(16) <= GND;

jw121_logic_term(17) <= GND;

jw121_logic_term(18) <= GND;

jw121_logic_term(19) <= GND;

jw121_logic_term(20) <= GND;

jw121_logic_term(21) <= GND;

jw121_logic_term(22) <= GND;

jw121_logic_term(23) <= GND;

jw121_logic_term(24) <= GND;

jw121_logic_term(25) <= GND;

U3 : load_array_64_v_ps
  port map(
       clk => clk0,
       dl => ld_reg_1,
       fs_sync_in => NET32275,
       rst_p => ld_arr_rst_p_1,
       s_out => sig_mod(0),
       sig_in => y(0),
       v_ps_hold_in => GND,
       w_ext_in => GND
  );

U30 : load_array_64_v_ps
  port map(
       clk => clk0,
       dl => ld_reg_4,
       fs_sync_in => NET32706,
       rst_p => ld_arr_rst_p_4,
       s_out => sig_mod(3),
       sig_in => y(3),
       v_ps_hold_in => GND,
       w_ext_in => GND
  );

jw121_logic_term(26) <= GND;

jw121_logic_term(27) <= GND;

jw121_logic_term(28) <= GND;

jw121_logic_term(29) <= GND;

jw121_logic_term(30) <= GND;

jw121_logic_term(31) <= GND;

NET36444 <= acc_release or NET36449;

U307 : reg_8
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
       q => accel_sync_bus,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(7)
  );

U308 : reg_8
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
       q => w0cm,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(1)
  );

U309 : reg_8
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
       q => w1cm,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(3)
  );

ld_arr_rst_p_3 <= reset_out or pulse_ctl_3(0);

U310 : reg_8
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
       q => w2cm,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(5)
  );

U311 : read_decode_p
  port map(
       rd_18(0) => Dangling_Input_Signal,
       rd_18(1) => Dangling_Input_Signal,
       rd_18(2) => Dangling_Input_Signal,
       rd_18(3) => Dangling_Input_Signal,
       rd_18(4) => Dangling_Input_Signal,
       rd_18(5) => Dangling_Input_Signal,
       rd_18(6) => Dangling_Input_Signal,
       rd_18(7) => Dangling_Input_Signal,
       rd_18(8) => Dangling_Input_Signal,
       rd_18(9) => Dangling_Input_Signal,
       rd_18(10) => Dangling_Input_Signal,
       rd_18(11) => Dangling_Input_Signal,
       rd_18(12) => Dangling_Input_Signal,
       rd_18(13) => Dangling_Input_Signal,
       rd_18(14) => Dangling_Input_Signal,
       rd_18(15) => Dangling_Input_Signal,
       rd_18(16) => Dangling_Input_Signal,
       rd_18(17) => Dangling_Input_Signal,
       rd_18(18) => Dangling_Input_Signal,
       rd_18(19) => Dangling_Input_Signal,
       rd_18(20) => Dangling_Input_Signal,
       rd_18(21) => Dangling_Input_Signal,
       rd_18(22) => Dangling_Input_Signal,
       rd_18(23) => Dangling_Input_Signal,
       rd_18(24) => Dangling_Input_Signal,
       rd_18(25) => Dangling_Input_Signal,
       rd_18(26) => Dangling_Input_Signal,
       rd_18(27) => Dangling_Input_Signal,
       rd_18(28) => Dangling_Input_Signal,
       rd_18(29) => Dangling_Input_Signal,
       rd_18(30) => Dangling_Input_Signal,
       rd_18(31) => Dangling_Input_Signal,
       rd_18(32) => Dangling_Input_Signal,
       rd_18(33) => Dangling_Input_Signal,
       rd_18(34) => Dangling_Input_Signal,
       rd_18(35) => Dangling_Input_Signal,
       rd_18(36) => Dangling_Input_Signal,
       rd_18(37) => Dangling_Input_Signal,
       rd_18(38) => Dangling_Input_Signal,
       rd_18(39) => Dangling_Input_Signal,
       rd_18(40) => Dangling_Input_Signal,
       rd_18(41) => Dangling_Input_Signal,
       rd_18(42) => Dangling_Input_Signal,
       rd_18(43) => Dangling_Input_Signal,
       rd_18(44) => Dangling_Input_Signal,
       rd_18(45) => Dangling_Input_Signal,
       rd_18(46) => Dangling_Input_Signal,
       rd_18(47) => Dangling_Input_Signal,
       rd_18(48) => Dangling_Input_Signal,
       rd_18(49) => Dangling_Input_Signal,
       rd_18(50) => Dangling_Input_Signal,
       rd_18(51) => Dangling_Input_Signal,
       rd_18(52) => Dangling_Input_Signal,
       rd_18(53) => Dangling_Input_Signal,
       rd_18(54) => Dangling_Input_Signal,
       rd_18(55) => Dangling_Input_Signal,
       rd_18(56) => Dangling_Input_Signal,
       rd_18(57) => Dangling_Input_Signal,
       rd_18(58) => Dangling_Input_Signal,
       rd_18(59) => Dangling_Input_Signal,
       rd_18(60) => Dangling_Input_Signal,
       rd_18(61) => Dangling_Input_Signal,
       rd_18(62) => Dangling_Input_Signal,
       rd_18(63) => Dangling_Input_Signal,
       rd_19(0) => Dangling_Input_Signal,
       rd_19(1) => Dangling_Input_Signal,
       rd_19(2) => Dangling_Input_Signal,
       rd_19(3) => Dangling_Input_Signal,
       rd_19(4) => Dangling_Input_Signal,
       rd_19(5) => Dangling_Input_Signal,
       rd_19(6) => Dangling_Input_Signal,
       rd_19(7) => Dangling_Input_Signal,
       rd_19(8) => Dangling_Input_Signal,
       rd_19(9) => Dangling_Input_Signal,
       rd_19(10) => Dangling_Input_Signal,
       rd_19(11) => Dangling_Input_Signal,
       rd_19(12) => Dangling_Input_Signal,
       rd_19(13) => Dangling_Input_Signal,
       rd_19(14) => Dangling_Input_Signal,
       rd_19(15) => Dangling_Input_Signal,
       rd_19(16) => Dangling_Input_Signal,
       rd_19(17) => Dangling_Input_Signal,
       rd_19(18) => Dangling_Input_Signal,
       rd_19(19) => Dangling_Input_Signal,
       rd_19(20) => Dangling_Input_Signal,
       rd_19(21) => Dangling_Input_Signal,
       rd_19(22) => Dangling_Input_Signal,
       rd_19(23) => Dangling_Input_Signal,
       rd_19(24) => Dangling_Input_Signal,
       rd_19(25) => Dangling_Input_Signal,
       rd_19(26) => Dangling_Input_Signal,
       rd_19(27) => Dangling_Input_Signal,
       rd_19(28) => Dangling_Input_Signal,
       rd_19(29) => Dangling_Input_Signal,
       rd_19(30) => Dangling_Input_Signal,
       rd_19(31) => Dangling_Input_Signal,
       rd_19(32) => Dangling_Input_Signal,
       rd_19(33) => Dangling_Input_Signal,
       rd_19(34) => Dangling_Input_Signal,
       rd_19(35) => Dangling_Input_Signal,
       rd_19(36) => Dangling_Input_Signal,
       rd_19(37) => Dangling_Input_Signal,
       rd_19(38) => Dangling_Input_Signal,
       rd_19(39) => Dangling_Input_Signal,
       rd_19(40) => Dangling_Input_Signal,
       rd_19(41) => Dangling_Input_Signal,
       rd_19(42) => Dangling_Input_Signal,
       rd_19(43) => Dangling_Input_Signal,
       rd_19(44) => Dangling_Input_Signal,
       rd_19(45) => Dangling_Input_Signal,
       rd_19(46) => Dangling_Input_Signal,
       rd_19(47) => Dangling_Input_Signal,
       rd_19(48) => Dangling_Input_Signal,
       rd_19(49) => Dangling_Input_Signal,
       rd_19(50) => Dangling_Input_Signal,
       rd_19(51) => Dangling_Input_Signal,
       rd_19(52) => Dangling_Input_Signal,
       rd_19(53) => Dangling_Input_Signal,
       rd_19(54) => Dangling_Input_Signal,
       rd_19(55) => Dangling_Input_Signal,
       rd_19(56) => Dangling_Input_Signal,
       rd_19(57) => Dangling_Input_Signal,
       rd_19(58) => Dangling_Input_Signal,
       rd_19(59) => Dangling_Input_Signal,
       rd_19(60) => Dangling_Input_Signal,
       rd_19(61) => Dangling_Input_Signal,
       rd_19(62) => Dangling_Input_Signal,
       rd_19(63) => Dangling_Input_Signal,
       rd_20(0) => Dangling_Input_Signal,
       rd_20(1) => Dangling_Input_Signal,
       rd_20(2) => Dangling_Input_Signal,
       rd_20(3) => Dangling_Input_Signal,
       rd_20(4) => Dangling_Input_Signal,
       rd_20(5) => Dangling_Input_Signal,
       rd_20(6) => Dangling_Input_Signal,
       rd_20(7) => Dangling_Input_Signal,
       rd_20(8) => Dangling_Input_Signal,
       rd_20(9) => Dangling_Input_Signal,
       rd_20(10) => Dangling_Input_Signal,
       rd_20(11) => Dangling_Input_Signal,
       rd_20(12) => Dangling_Input_Signal,
       rd_20(13) => Dangling_Input_Signal,
       rd_20(14) => Dangling_Input_Signal,
       rd_20(15) => Dangling_Input_Signal,
       rd_20(16) => Dangling_Input_Signal,
       rd_20(17) => Dangling_Input_Signal,
       rd_20(18) => Dangling_Input_Signal,
       rd_20(19) => Dangling_Input_Signal,
       rd_20(20) => Dangling_Input_Signal,
       rd_20(21) => Dangling_Input_Signal,
       rd_20(22) => Dangling_Input_Signal,
       rd_20(23) => Dangling_Input_Signal,
       rd_20(24) => Dangling_Input_Signal,
       rd_20(25) => Dangling_Input_Signal,
       rd_20(26) => Dangling_Input_Signal,
       rd_20(27) => Dangling_Input_Signal,
       rd_20(28) => Dangling_Input_Signal,
       rd_20(29) => Dangling_Input_Signal,
       rd_20(30) => Dangling_Input_Signal,
       rd_20(31) => Dangling_Input_Signal,
       rd_20(32) => Dangling_Input_Signal,
       rd_20(33) => Dangling_Input_Signal,
       rd_20(34) => Dangling_Input_Signal,
       rd_20(35) => Dangling_Input_Signal,
       rd_20(36) => Dangling_Input_Signal,
       rd_20(37) => Dangling_Input_Signal,
       rd_20(38) => Dangling_Input_Signal,
       rd_20(39) => Dangling_Input_Signal,
       rd_20(40) => Dangling_Input_Signal,
       rd_20(41) => Dangling_Input_Signal,
       rd_20(42) => Dangling_Input_Signal,
       rd_20(43) => Dangling_Input_Signal,
       rd_20(44) => Dangling_Input_Signal,
       rd_20(45) => Dangling_Input_Signal,
       rd_20(46) => Dangling_Input_Signal,
       rd_20(47) => Dangling_Input_Signal,
       rd_20(48) => Dangling_Input_Signal,
       rd_20(49) => Dangling_Input_Signal,
       rd_20(50) => Dangling_Input_Signal,
       rd_20(51) => Dangling_Input_Signal,
       rd_20(52) => Dangling_Input_Signal,
       rd_20(53) => Dangling_Input_Signal,
       rd_20(54) => Dangling_Input_Signal,
       rd_20(55) => Dangling_Input_Signal,
       rd_20(56) => Dangling_Input_Signal,
       rd_20(57) => Dangling_Input_Signal,
       rd_20(58) => Dangling_Input_Signal,
       rd_20(59) => Dangling_Input_Signal,
       rd_20(60) => Dangling_Input_Signal,
       rd_20(61) => Dangling_Input_Signal,
       rd_20(62) => Dangling_Input_Signal,
       rd_20(63) => Dangling_Input_Signal,
       rd_21(0) => Dangling_Input_Signal,
       rd_21(1) => Dangling_Input_Signal,
       rd_21(2) => Dangling_Input_Signal,
       rd_21(3) => Dangling_Input_Signal,
       rd_21(4) => Dangling_Input_Signal,
       rd_21(5) => Dangling_Input_Signal,
       rd_21(6) => Dangling_Input_Signal,
       rd_21(7) => Dangling_Input_Signal,
       rd_21(8) => Dangling_Input_Signal,
       rd_21(9) => Dangling_Input_Signal,
       rd_21(10) => Dangling_Input_Signal,
       rd_21(11) => Dangling_Input_Signal,
       rd_21(12) => Dangling_Input_Signal,
       rd_21(13) => Dangling_Input_Signal,
       rd_21(14) => Dangling_Input_Signal,
       rd_21(15) => Dangling_Input_Signal,
       rd_21(16) => Dangling_Input_Signal,
       rd_21(17) => Dangling_Input_Signal,
       rd_21(18) => Dangling_Input_Signal,
       rd_21(19) => Dangling_Input_Signal,
       rd_21(20) => Dangling_Input_Signal,
       rd_21(21) => Dangling_Input_Signal,
       rd_21(22) => Dangling_Input_Signal,
       rd_21(23) => Dangling_Input_Signal,
       rd_21(24) => Dangling_Input_Signal,
       rd_21(25) => Dangling_Input_Signal,
       rd_21(26) => Dangling_Input_Signal,
       rd_21(27) => Dangling_Input_Signal,
       rd_21(28) => Dangling_Input_Signal,
       rd_21(29) => Dangling_Input_Signal,
       rd_21(30) => Dangling_Input_Signal,
       rd_21(31) => Dangling_Input_Signal,
       rd_21(32) => Dangling_Input_Signal,
       rd_21(33) => Dangling_Input_Signal,
       rd_21(34) => Dangling_Input_Signal,
       rd_21(35) => Dangling_Input_Signal,
       rd_21(36) => Dangling_Input_Signal,
       rd_21(37) => Dangling_Input_Signal,
       rd_21(38) => Dangling_Input_Signal,
       rd_21(39) => Dangling_Input_Signal,
       rd_21(40) => Dangling_Input_Signal,
       rd_21(41) => Dangling_Input_Signal,
       rd_21(42) => Dangling_Input_Signal,
       rd_21(43) => Dangling_Input_Signal,
       rd_21(44) => Dangling_Input_Signal,
       rd_21(45) => Dangling_Input_Signal,
       rd_21(46) => Dangling_Input_Signal,
       rd_21(47) => Dangling_Input_Signal,
       rd_21(48) => Dangling_Input_Signal,
       rd_21(49) => Dangling_Input_Signal,
       rd_21(50) => Dangling_Input_Signal,
       rd_21(51) => Dangling_Input_Signal,
       rd_21(52) => Dangling_Input_Signal,
       rd_21(53) => Dangling_Input_Signal,
       rd_21(54) => Dangling_Input_Signal,
       rd_21(55) => Dangling_Input_Signal,
       rd_21(56) => Dangling_Input_Signal,
       rd_21(57) => Dangling_Input_Signal,
       rd_21(58) => Dangling_Input_Signal,
       rd_21(59) => Dangling_Input_Signal,
       rd_21(60) => Dangling_Input_Signal,
       rd_21(61) => Dangling_Input_Signal,
       rd_21(62) => Dangling_Input_Signal,
       rd_21(63) => Dangling_Input_Signal,
       rd_22(0) => Dangling_Input_Signal,
       rd_22(1) => Dangling_Input_Signal,
       rd_22(2) => Dangling_Input_Signal,
       rd_22(3) => Dangling_Input_Signal,
       rd_22(4) => Dangling_Input_Signal,
       rd_22(5) => Dangling_Input_Signal,
       rd_22(6) => Dangling_Input_Signal,
       rd_22(7) => Dangling_Input_Signal,
       rd_22(8) => Dangling_Input_Signal,
       rd_22(9) => Dangling_Input_Signal,
       rd_22(10) => Dangling_Input_Signal,
       rd_22(11) => Dangling_Input_Signal,
       rd_22(12) => Dangling_Input_Signal,
       rd_22(13) => Dangling_Input_Signal,
       rd_22(14) => Dangling_Input_Signal,
       rd_22(15) => Dangling_Input_Signal,
       rd_22(16) => Dangling_Input_Signal,
       rd_22(17) => Dangling_Input_Signal,
       rd_22(18) => Dangling_Input_Signal,
       rd_22(19) => Dangling_Input_Signal,
       rd_22(20) => Dangling_Input_Signal,
       rd_22(21) => Dangling_Input_Signal,
       rd_22(22) => Dangling_Input_Signal,
       rd_22(23) => Dangling_Input_Signal,
       rd_22(24) => Dangling_Input_Signal,
       rd_22(25) => Dangling_Input_Signal,
       rd_22(26) => Dangling_Input_Signal,
       rd_22(27) => Dangling_Input_Signal,
       rd_22(28) => Dangling_Input_Signal,
       rd_22(29) => Dangling_Input_Signal,
       rd_22(30) => Dangling_Input_Signal,
       rd_22(31) => Dangling_Input_Signal,
       rd_22(32) => Dangling_Input_Signal,
       rd_22(33) => Dangling_Input_Signal,
       rd_22(34) => Dangling_Input_Signal,
       rd_22(35) => Dangling_Input_Signal,
       rd_22(36) => Dangling_Input_Signal,
       rd_22(37) => Dangling_Input_Signal,
       rd_22(38) => Dangling_Input_Signal,
       rd_22(39) => Dangling_Input_Signal,
       rd_22(40) => Dangling_Input_Signal,
       rd_22(41) => Dangling_Input_Signal,
       rd_22(42) => Dangling_Input_Signal,
       rd_22(43) => Dangling_Input_Signal,
       rd_22(44) => Dangling_Input_Signal,
       rd_22(45) => Dangling_Input_Signal,
       rd_22(46) => Dangling_Input_Signal,
       rd_22(47) => Dangling_Input_Signal,
       rd_22(48) => Dangling_Input_Signal,
       rd_22(49) => Dangling_Input_Signal,
       rd_22(50) => Dangling_Input_Signal,
       rd_22(51) => Dangling_Input_Signal,
       rd_22(52) => Dangling_Input_Signal,
       rd_22(53) => Dangling_Input_Signal,
       rd_22(54) => Dangling_Input_Signal,
       rd_22(55) => Dangling_Input_Signal,
       rd_22(56) => Dangling_Input_Signal,
       rd_22(57) => Dangling_Input_Signal,
       rd_22(58) => Dangling_Input_Signal,
       rd_22(59) => Dangling_Input_Signal,
       rd_22(60) => Dangling_Input_Signal,
       rd_22(61) => Dangling_Input_Signal,
       rd_22(62) => Dangling_Input_Signal,
       rd_22(63) => Dangling_Input_Signal,
       rd_23(0) => Dangling_Input_Signal,
       rd_23(1) => Dangling_Input_Signal,
       rd_23(2) => Dangling_Input_Signal,
       rd_23(3) => Dangling_Input_Signal,
       rd_23(4) => Dangling_Input_Signal,
       rd_23(5) => Dangling_Input_Signal,
       rd_23(6) => Dangling_Input_Signal,
       rd_23(7) => Dangling_Input_Signal,
       rd_23(8) => Dangling_Input_Signal,
       rd_23(9) => Dangling_Input_Signal,
       rd_23(10) => Dangling_Input_Signal,
       rd_23(11) => Dangling_Input_Signal,
       rd_23(12) => Dangling_Input_Signal,
       rd_23(13) => Dangling_Input_Signal,
       rd_23(14) => Dangling_Input_Signal,
       rd_23(15) => Dangling_Input_Signal,
       rd_23(16) => Dangling_Input_Signal,
       rd_23(17) => Dangling_Input_Signal,
       rd_23(18) => Dangling_Input_Signal,
       rd_23(19) => Dangling_Input_Signal,
       rd_23(20) => Dangling_Input_Signal,
       rd_23(21) => Dangling_Input_Signal,
       rd_23(22) => Dangling_Input_Signal,
       rd_23(23) => Dangling_Input_Signal,
       rd_23(24) => Dangling_Input_Signal,
       rd_23(25) => Dangling_Input_Signal,
       rd_23(26) => Dangling_Input_Signal,
       rd_23(27) => Dangling_Input_Signal,
       rd_23(28) => Dangling_Input_Signal,
       rd_23(29) => Dangling_Input_Signal,
       rd_23(30) => Dangling_Input_Signal,
       rd_23(31) => Dangling_Input_Signal,
       rd_23(32) => Dangling_Input_Signal,
       rd_23(33) => Dangling_Input_Signal,
       rd_23(34) => Dangling_Input_Signal,
       rd_23(35) => Dangling_Input_Signal,
       rd_23(36) => Dangling_Input_Signal,
       rd_23(37) => Dangling_Input_Signal,
       rd_23(38) => Dangling_Input_Signal,
       rd_23(39) => Dangling_Input_Signal,
       rd_23(40) => Dangling_Input_Signal,
       rd_23(41) => Dangling_Input_Signal,
       rd_23(42) => Dangling_Input_Signal,
       rd_23(43) => Dangling_Input_Signal,
       rd_23(44) => Dangling_Input_Signal,
       rd_23(45) => Dangling_Input_Signal,
       rd_23(46) => Dangling_Input_Signal,
       rd_23(47) => Dangling_Input_Signal,
       rd_23(48) => Dangling_Input_Signal,
       rd_23(49) => Dangling_Input_Signal,
       rd_23(50) => Dangling_Input_Signal,
       rd_23(51) => Dangling_Input_Signal,
       rd_23(52) => Dangling_Input_Signal,
       rd_23(53) => Dangling_Input_Signal,
       rd_23(54) => Dangling_Input_Signal,
       rd_23(55) => Dangling_Input_Signal,
       rd_23(56) => Dangling_Input_Signal,
       rd_23(57) => Dangling_Input_Signal,
       rd_23(58) => Dangling_Input_Signal,
       rd_23(59) => Dangling_Input_Signal,
       rd_23(60) => Dangling_Input_Signal,
       rd_23(61) => Dangling_Input_Signal,
       rd_23(62) => Dangling_Input_Signal,
       rd_23(63) => Dangling_Input_Signal,
       rd_24(0) => Dangling_Input_Signal,
       rd_24(1) => Dangling_Input_Signal,
       rd_24(2) => Dangling_Input_Signal,
       rd_24(3) => Dangling_Input_Signal,
       rd_24(4) => Dangling_Input_Signal,
       rd_24(5) => Dangling_Input_Signal,
       rd_24(6) => Dangling_Input_Signal,
       rd_24(7) => Dangling_Input_Signal,
       rd_24(8) => Dangling_Input_Signal,
       rd_24(9) => Dangling_Input_Signal,
       rd_24(10) => Dangling_Input_Signal,
       rd_24(11) => Dangling_Input_Signal,
       rd_24(12) => Dangling_Input_Signal,
       rd_24(13) => Dangling_Input_Signal,
       rd_24(14) => Dangling_Input_Signal,
       rd_24(15) => Dangling_Input_Signal,
       rd_24(16) => Dangling_Input_Signal,
       rd_24(17) => Dangling_Input_Signal,
       rd_24(18) => Dangling_Input_Signal,
       rd_24(19) => Dangling_Input_Signal,
       rd_24(20) => Dangling_Input_Signal,
       rd_24(21) => Dangling_Input_Signal,
       rd_24(22) => Dangling_Input_Signal,
       rd_24(23) => Dangling_Input_Signal,
       rd_24(24) => Dangling_Input_Signal,
       rd_24(25) => Dangling_Input_Signal,
       rd_24(26) => Dangling_Input_Signal,
       rd_24(27) => Dangling_Input_Signal,
       rd_24(28) => Dangling_Input_Signal,
       rd_24(29) => Dangling_Input_Signal,
       rd_24(30) => Dangling_Input_Signal,
       rd_24(31) => Dangling_Input_Signal,
       rd_24(32) => Dangling_Input_Signal,
       rd_24(33) => Dangling_Input_Signal,
       rd_24(34) => Dangling_Input_Signal,
       rd_24(35) => Dangling_Input_Signal,
       rd_24(36) => Dangling_Input_Signal,
       rd_24(37) => Dangling_Input_Signal,
       rd_24(38) => Dangling_Input_Signal,
       rd_24(39) => Dangling_Input_Signal,
       rd_24(40) => Dangling_Input_Signal,
       rd_24(41) => Dangling_Input_Signal,
       rd_24(42) => Dangling_Input_Signal,
       rd_24(43) => Dangling_Input_Signal,
       rd_24(44) => Dangling_Input_Signal,
       rd_24(45) => Dangling_Input_Signal,
       rd_24(46) => Dangling_Input_Signal,
       rd_24(47) => Dangling_Input_Signal,
       rd_24(48) => Dangling_Input_Signal,
       rd_24(49) => Dangling_Input_Signal,
       rd_24(50) => Dangling_Input_Signal,
       rd_24(51) => Dangling_Input_Signal,
       rd_24(52) => Dangling_Input_Signal,
       rd_24(53) => Dangling_Input_Signal,
       rd_24(54) => Dangling_Input_Signal,
       rd_24(55) => Dangling_Input_Signal,
       rd_24(56) => Dangling_Input_Signal,
       rd_24(57) => Dangling_Input_Signal,
       rd_24(58) => Dangling_Input_Signal,
       rd_24(59) => Dangling_Input_Signal,
       rd_24(60) => Dangling_Input_Signal,
       rd_24(61) => Dangling_Input_Signal,
       rd_24(62) => Dangling_Input_Signal,
       rd_24(63) => Dangling_Input_Signal,
       rd_25(0) => Dangling_Input_Signal,
       rd_25(1) => Dangling_Input_Signal,
       rd_25(2) => Dangling_Input_Signal,
       rd_25(3) => Dangling_Input_Signal,
       rd_25(4) => Dangling_Input_Signal,
       rd_25(5) => Dangling_Input_Signal,
       rd_25(6) => Dangling_Input_Signal,
       rd_25(7) => Dangling_Input_Signal,
       rd_25(8) => Dangling_Input_Signal,
       rd_25(9) => Dangling_Input_Signal,
       rd_25(10) => Dangling_Input_Signal,
       rd_25(11) => Dangling_Input_Signal,
       rd_25(12) => Dangling_Input_Signal,
       rd_25(13) => Dangling_Input_Signal,
       rd_25(14) => Dangling_Input_Signal,
       rd_25(15) => Dangling_Input_Signal,
       rd_25(16) => Dangling_Input_Signal,
       rd_25(17) => Dangling_Input_Signal,
       rd_25(18) => Dangling_Input_Signal,
       rd_25(19) => Dangling_Input_Signal,
       rd_25(20) => Dangling_Input_Signal,
       rd_25(21) => Dangling_Input_Signal,
       rd_25(22) => Dangling_Input_Signal,
       rd_25(23) => Dangling_Input_Signal,
       rd_25(24) => Dangling_Input_Signal,
       rd_25(25) => Dangling_Input_Signal,
       rd_25(26) => Dangling_Input_Signal,
       rd_25(27) => Dangling_Input_Signal,
       rd_25(28) => Dangling_Input_Signal,
       rd_25(29) => Dangling_Input_Signal,
       rd_25(30) => Dangling_Input_Signal,
       rd_25(31) => Dangling_Input_Signal,
       rd_25(32) => Dangling_Input_Signal,
       rd_25(33) => Dangling_Input_Signal,
       rd_25(34) => Dangling_Input_Signal,
       rd_25(35) => Dangling_Input_Signal,
       rd_25(36) => Dangling_Input_Signal,
       rd_25(37) => Dangling_Input_Signal,
       rd_25(38) => Dangling_Input_Signal,
       rd_25(39) => Dangling_Input_Signal,
       rd_25(40) => Dangling_Input_Signal,
       rd_25(41) => Dangling_Input_Signal,
       rd_25(42) => Dangling_Input_Signal,
       rd_25(43) => Dangling_Input_Signal,
       rd_25(44) => Dangling_Input_Signal,
       rd_25(45) => Dangling_Input_Signal,
       rd_25(46) => Dangling_Input_Signal,
       rd_25(47) => Dangling_Input_Signal,
       rd_25(48) => Dangling_Input_Signal,
       rd_25(49) => Dangling_Input_Signal,
       rd_25(50) => Dangling_Input_Signal,
       rd_25(51) => Dangling_Input_Signal,
       rd_25(52) => Dangling_Input_Signal,
       rd_25(53) => Dangling_Input_Signal,
       rd_25(54) => Dangling_Input_Signal,
       rd_25(55) => Dangling_Input_Signal,
       rd_25(56) => Dangling_Input_Signal,
       rd_25(57) => Dangling_Input_Signal,
       rd_25(58) => Dangling_Input_Signal,
       rd_25(59) => Dangling_Input_Signal,
       rd_25(60) => Dangling_Input_Signal,
       rd_25(61) => Dangling_Input_Signal,
       rd_25(62) => Dangling_Input_Signal,
       rd_25(63) => Dangling_Input_Signal,
       rd_26(0) => Dangling_Input_Signal,
       rd_26(1) => Dangling_Input_Signal,
       rd_26(2) => Dangling_Input_Signal,
       rd_26(3) => Dangling_Input_Signal,
       rd_26(4) => Dangling_Input_Signal,
       rd_26(5) => Dangling_Input_Signal,
       rd_26(6) => Dangling_Input_Signal,
       rd_26(7) => Dangling_Input_Signal,
       rd_26(8) => Dangling_Input_Signal,
       rd_26(9) => Dangling_Input_Signal,
       rd_26(10) => Dangling_Input_Signal,
       rd_26(11) => Dangling_Input_Signal,
       rd_26(12) => Dangling_Input_Signal,
       rd_26(13) => Dangling_Input_Signal,
       rd_26(14) => Dangling_Input_Signal,
       rd_26(15) => Dangling_Input_Signal,
       rd_26(16) => Dangling_Input_Signal,
       rd_26(17) => Dangling_Input_Signal,
       rd_26(18) => Dangling_Input_Signal,
       rd_26(19) => Dangling_Input_Signal,
       rd_26(20) => Dangling_Input_Signal,
       rd_26(21) => Dangling_Input_Signal,
       rd_26(22) => Dangling_Input_Signal,
       rd_26(23) => Dangling_Input_Signal,
       rd_26(24) => Dangling_Input_Signal,
       rd_26(25) => Dangling_Input_Signal,
       rd_26(26) => Dangling_Input_Signal,
       rd_26(27) => Dangling_Input_Signal,
       rd_26(28) => Dangling_Input_Signal,
       rd_26(29) => Dangling_Input_Signal,
       rd_26(30) => Dangling_Input_Signal,
       rd_26(31) => Dangling_Input_Signal,
       rd_26(32) => Dangling_Input_Signal,
       rd_26(33) => Dangling_Input_Signal,
       rd_26(34) => Dangling_Input_Signal,
       rd_26(35) => Dangling_Input_Signal,
       rd_26(36) => Dangling_Input_Signal,
       rd_26(37) => Dangling_Input_Signal,
       rd_26(38) => Dangling_Input_Signal,
       rd_26(39) => Dangling_Input_Signal,
       rd_26(40) => Dangling_Input_Signal,
       rd_26(41) => Dangling_Input_Signal,
       rd_26(42) => Dangling_Input_Signal,
       rd_26(43) => Dangling_Input_Signal,
       rd_26(44) => Dangling_Input_Signal,
       rd_26(45) => Dangling_Input_Signal,
       rd_26(46) => Dangling_Input_Signal,
       rd_26(47) => Dangling_Input_Signal,
       rd_26(48) => Dangling_Input_Signal,
       rd_26(49) => Dangling_Input_Signal,
       rd_26(50) => Dangling_Input_Signal,
       rd_26(51) => Dangling_Input_Signal,
       rd_26(52) => Dangling_Input_Signal,
       rd_26(53) => Dangling_Input_Signal,
       rd_26(54) => Dangling_Input_Signal,
       rd_26(55) => Dangling_Input_Signal,
       rd_26(56) => Dangling_Input_Signal,
       rd_26(57) => Dangling_Input_Signal,
       rd_26(58) => Dangling_Input_Signal,
       rd_26(59) => Dangling_Input_Signal,
       rd_26(60) => Dangling_Input_Signal,
       rd_26(61) => Dangling_Input_Signal,
       rd_26(62) => Dangling_Input_Signal,
       rd_26(63) => Dangling_Input_Signal,
       rd_27(0) => Dangling_Input_Signal,
       rd_27(1) => Dangling_Input_Signal,
       rd_27(2) => Dangling_Input_Signal,
       rd_27(3) => Dangling_Input_Signal,
       rd_27(4) => Dangling_Input_Signal,
       rd_27(5) => Dangling_Input_Signal,
       rd_27(6) => Dangling_Input_Signal,
       rd_27(7) => Dangling_Input_Signal,
       rd_27(8) => Dangling_Input_Signal,
       rd_27(9) => Dangling_Input_Signal,
       rd_27(10) => Dangling_Input_Signal,
       rd_27(11) => Dangling_Input_Signal,
       rd_27(12) => Dangling_Input_Signal,
       rd_27(13) => Dangling_Input_Signal,
       rd_27(14) => Dangling_Input_Signal,
       rd_27(15) => Dangling_Input_Signal,
       rd_27(16) => Dangling_Input_Signal,
       rd_27(17) => Dangling_Input_Signal,
       rd_27(18) => Dangling_Input_Signal,
       rd_27(19) => Dangling_Input_Signal,
       rd_27(20) => Dangling_Input_Signal,
       rd_27(21) => Dangling_Input_Signal,
       rd_27(22) => Dangling_Input_Signal,
       rd_27(23) => Dangling_Input_Signal,
       rd_27(24) => Dangling_Input_Signal,
       rd_27(25) => Dangling_Input_Signal,
       rd_27(26) => Dangling_Input_Signal,
       rd_27(27) => Dangling_Input_Signal,
       rd_27(28) => Dangling_Input_Signal,
       rd_27(29) => Dangling_Input_Signal,
       rd_27(30) => Dangling_Input_Signal,
       rd_27(31) => Dangling_Input_Signal,
       rd_27(32) => Dangling_Input_Signal,
       rd_27(33) => Dangling_Input_Signal,
       rd_27(34) => Dangling_Input_Signal,
       rd_27(35) => Dangling_Input_Signal,
       rd_27(36) => Dangling_Input_Signal,
       rd_27(37) => Dangling_Input_Signal,
       rd_27(38) => Dangling_Input_Signal,
       rd_27(39) => Dangling_Input_Signal,
       rd_27(40) => Dangling_Input_Signal,
       rd_27(41) => Dangling_Input_Signal,
       rd_27(42) => Dangling_Input_Signal,
       rd_27(43) => Dangling_Input_Signal,
       rd_27(44) => Dangling_Input_Signal,
       rd_27(45) => Dangling_Input_Signal,
       rd_27(46) => Dangling_Input_Signal,
       rd_27(47) => Dangling_Input_Signal,
       rd_27(48) => Dangling_Input_Signal,
       rd_27(49) => Dangling_Input_Signal,
       rd_27(50) => Dangling_Input_Signal,
       rd_27(51) => Dangling_Input_Signal,
       rd_27(52) => Dangling_Input_Signal,
       rd_27(53) => Dangling_Input_Signal,
       rd_27(54) => Dangling_Input_Signal,
       rd_27(55) => Dangling_Input_Signal,
       rd_27(56) => Dangling_Input_Signal,
       rd_27(57) => Dangling_Input_Signal,
       rd_27(58) => Dangling_Input_Signal,
       rd_27(59) => Dangling_Input_Signal,
       rd_27(60) => Dangling_Input_Signal,
       rd_27(61) => Dangling_Input_Signal,
       rd_27(62) => Dangling_Input_Signal,
       rd_27(63) => Dangling_Input_Signal,
       rd_28(0) => Dangling_Input_Signal,
       rd_28(1) => Dangling_Input_Signal,
       rd_28(2) => Dangling_Input_Signal,
       rd_28(3) => Dangling_Input_Signal,
       rd_28(4) => Dangling_Input_Signal,
       rd_28(5) => Dangling_Input_Signal,
       rd_28(6) => Dangling_Input_Signal,
       rd_28(7) => Dangling_Input_Signal,
       rd_28(8) => Dangling_Input_Signal,
       rd_28(9) => Dangling_Input_Signal,
       rd_28(10) => Dangling_Input_Signal,
       rd_28(11) => Dangling_Input_Signal,
       rd_28(12) => Dangling_Input_Signal,
       rd_28(13) => Dangling_Input_Signal,
       rd_28(14) => Dangling_Input_Signal,
       rd_28(15) => Dangling_Input_Signal,
       rd_28(16) => Dangling_Input_Signal,
       rd_28(17) => Dangling_Input_Signal,
       rd_28(18) => Dangling_Input_Signal,
       rd_28(19) => Dangling_Input_Signal,
       rd_28(20) => Dangling_Input_Signal,
       rd_28(21) => Dangling_Input_Signal,
       rd_28(22) => Dangling_Input_Signal,
       rd_28(23) => Dangling_Input_Signal,
       rd_28(24) => Dangling_Input_Signal,
       rd_28(25) => Dangling_Input_Signal,
       rd_28(26) => Dangling_Input_Signal,
       rd_28(27) => Dangling_Input_Signal,
       rd_28(28) => Dangling_Input_Signal,
       rd_28(29) => Dangling_Input_Signal,
       rd_28(30) => Dangling_Input_Signal,
       rd_28(31) => Dangling_Input_Signal,
       rd_28(32) => Dangling_Input_Signal,
       rd_28(33) => Dangling_Input_Signal,
       rd_28(34) => Dangling_Input_Signal,
       rd_28(35) => Dangling_Input_Signal,
       rd_28(36) => Dangling_Input_Signal,
       rd_28(37) => Dangling_Input_Signal,
       rd_28(38) => Dangling_Input_Signal,
       rd_28(39) => Dangling_Input_Signal,
       rd_28(40) => Dangling_Input_Signal,
       rd_28(41) => Dangling_Input_Signal,
       rd_28(42) => Dangling_Input_Signal,
       rd_28(43) => Dangling_Input_Signal,
       rd_28(44) => Dangling_Input_Signal,
       rd_28(45) => Dangling_Input_Signal,
       rd_28(46) => Dangling_Input_Signal,
       rd_28(47) => Dangling_Input_Signal,
       rd_28(48) => Dangling_Input_Signal,
       rd_28(49) => Dangling_Input_Signal,
       rd_28(50) => Dangling_Input_Signal,
       rd_28(51) => Dangling_Input_Signal,
       rd_28(52) => Dangling_Input_Signal,
       rd_28(53) => Dangling_Input_Signal,
       rd_28(54) => Dangling_Input_Signal,
       rd_28(55) => Dangling_Input_Signal,
       rd_28(56) => Dangling_Input_Signal,
       rd_28(57) => Dangling_Input_Signal,
       rd_28(58) => Dangling_Input_Signal,
       rd_28(59) => Dangling_Input_Signal,
       rd_28(60) => Dangling_Input_Signal,
       rd_28(61) => Dangling_Input_Signal,
       rd_28(62) => Dangling_Input_Signal,
       rd_28(63) => Dangling_Input_Signal,
       rd_29(0) => Dangling_Input_Signal,
       rd_29(1) => Dangling_Input_Signal,
       rd_29(2) => Dangling_Input_Signal,
       rd_29(3) => Dangling_Input_Signal,
       rd_29(4) => Dangling_Input_Signal,
       rd_29(5) => Dangling_Input_Signal,
       rd_29(6) => Dangling_Input_Signal,
       rd_29(7) => Dangling_Input_Signal,
       rd_29(8) => Dangling_Input_Signal,
       rd_29(9) => Dangling_Input_Signal,
       rd_29(10) => Dangling_Input_Signal,
       rd_29(11) => Dangling_Input_Signal,
       rd_29(12) => Dangling_Input_Signal,
       rd_29(13) => Dangling_Input_Signal,
       rd_29(14) => Dangling_Input_Signal,
       rd_29(15) => Dangling_Input_Signal,
       rd_29(16) => Dangling_Input_Signal,
       rd_29(17) => Dangling_Input_Signal,
       rd_29(18) => Dangling_Input_Signal,
       rd_29(19) => Dangling_Input_Signal,
       rd_29(20) => Dangling_Input_Signal,
       rd_29(21) => Dangling_Input_Signal,
       rd_29(22) => Dangling_Input_Signal,
       rd_29(23) => Dangling_Input_Signal,
       rd_29(24) => Dangling_Input_Signal,
       rd_29(25) => Dangling_Input_Signal,
       rd_29(26) => Dangling_Input_Signal,
       rd_29(27) => Dangling_Input_Signal,
       rd_29(28) => Dangling_Input_Signal,
       rd_29(29) => Dangling_Input_Signal,
       rd_29(30) => Dangling_Input_Signal,
       rd_29(31) => Dangling_Input_Signal,
       rd_29(32) => Dangling_Input_Signal,
       rd_29(33) => Dangling_Input_Signal,
       rd_29(34) => Dangling_Input_Signal,
       rd_29(35) => Dangling_Input_Signal,
       rd_29(36) => Dangling_Input_Signal,
       rd_29(37) => Dangling_Input_Signal,
       rd_29(38) => Dangling_Input_Signal,
       rd_29(39) => Dangling_Input_Signal,
       rd_29(40) => Dangling_Input_Signal,
       rd_29(41) => Dangling_Input_Signal,
       rd_29(42) => Dangling_Input_Signal,
       rd_29(43) => Dangling_Input_Signal,
       rd_29(44) => Dangling_Input_Signal,
       rd_29(45) => Dangling_Input_Signal,
       rd_29(46) => Dangling_Input_Signal,
       rd_29(47) => Dangling_Input_Signal,
       rd_29(48) => Dangling_Input_Signal,
       rd_29(49) => Dangling_Input_Signal,
       rd_29(50) => Dangling_Input_Signal,
       rd_29(51) => Dangling_Input_Signal,
       rd_29(52) => Dangling_Input_Signal,
       rd_29(53) => Dangling_Input_Signal,
       rd_29(54) => Dangling_Input_Signal,
       rd_29(55) => Dangling_Input_Signal,
       rd_29(56) => Dangling_Input_Signal,
       rd_29(57) => Dangling_Input_Signal,
       rd_29(58) => Dangling_Input_Signal,
       rd_29(59) => Dangling_Input_Signal,
       rd_29(60) => Dangling_Input_Signal,
       rd_29(61) => Dangling_Input_Signal,
       rd_29(62) => Dangling_Input_Signal,
       rd_29(63) => Dangling_Input_Signal,
       rd_30(0) => Dangling_Input_Signal,
       rd_30(1) => Dangling_Input_Signal,
       rd_30(2) => Dangling_Input_Signal,
       rd_30(3) => Dangling_Input_Signal,
       rd_30(4) => Dangling_Input_Signal,
       rd_30(5) => Dangling_Input_Signal,
       rd_30(6) => Dangling_Input_Signal,
       rd_30(7) => Dangling_Input_Signal,
       rd_30(8) => Dangling_Input_Signal,
       rd_30(9) => Dangling_Input_Signal,
       rd_30(10) => Dangling_Input_Signal,
       rd_30(11) => Dangling_Input_Signal,
       rd_30(12) => Dangling_Input_Signal,
       rd_30(13) => Dangling_Input_Signal,
       rd_30(14) => Dangling_Input_Signal,
       rd_30(15) => Dangling_Input_Signal,
       rd_30(16) => Dangling_Input_Signal,
       rd_30(17) => Dangling_Input_Signal,
       rd_30(18) => Dangling_Input_Signal,
       rd_30(19) => Dangling_Input_Signal,
       rd_30(20) => Dangling_Input_Signal,
       rd_30(21) => Dangling_Input_Signal,
       rd_30(22) => Dangling_Input_Signal,
       rd_30(23) => Dangling_Input_Signal,
       rd_30(24) => Dangling_Input_Signal,
       rd_30(25) => Dangling_Input_Signal,
       rd_30(26) => Dangling_Input_Signal,
       rd_30(27) => Dangling_Input_Signal,
       rd_30(28) => Dangling_Input_Signal,
       rd_30(29) => Dangling_Input_Signal,
       rd_30(30) => Dangling_Input_Signal,
       rd_30(31) => Dangling_Input_Signal,
       rd_30(32) => Dangling_Input_Signal,
       rd_30(33) => Dangling_Input_Signal,
       rd_30(34) => Dangling_Input_Signal,
       rd_30(35) => Dangling_Input_Signal,
       rd_30(36) => Dangling_Input_Signal,
       rd_30(37) => Dangling_Input_Signal,
       rd_30(38) => Dangling_Input_Signal,
       rd_30(39) => Dangling_Input_Signal,
       rd_30(40) => Dangling_Input_Signal,
       rd_30(41) => Dangling_Input_Signal,
       rd_30(42) => Dangling_Input_Signal,
       rd_30(43) => Dangling_Input_Signal,
       rd_30(44) => Dangling_Input_Signal,
       rd_30(45) => Dangling_Input_Signal,
       rd_30(46) => Dangling_Input_Signal,
       rd_30(47) => Dangling_Input_Signal,
       rd_30(48) => Dangling_Input_Signal,
       rd_30(49) => Dangling_Input_Signal,
       rd_30(50) => Dangling_Input_Signal,
       rd_30(51) => Dangling_Input_Signal,
       rd_30(52) => Dangling_Input_Signal,
       rd_30(53) => Dangling_Input_Signal,
       rd_30(54) => Dangling_Input_Signal,
       rd_30(55) => Dangling_Input_Signal,
       rd_30(56) => Dangling_Input_Signal,
       rd_30(57) => Dangling_Input_Signal,
       rd_30(58) => Dangling_Input_Signal,
       rd_30(59) => Dangling_Input_Signal,
       rd_30(60) => Dangling_Input_Signal,
       rd_30(61) => Dangling_Input_Signal,
       rd_30(62) => Dangling_Input_Signal,
       rd_30(63) => Dangling_Input_Signal,
       rd_31(0) => Dangling_Input_Signal,
       rd_31(1) => Dangling_Input_Signal,
       rd_31(2) => Dangling_Input_Signal,
       rd_31(3) => Dangling_Input_Signal,
       rd_31(4) => Dangling_Input_Signal,
       rd_31(5) => Dangling_Input_Signal,
       rd_31(6) => Dangling_Input_Signal,
       rd_31(7) => Dangling_Input_Signal,
       rd_31(8) => Dangling_Input_Signal,
       rd_31(9) => Dangling_Input_Signal,
       rd_31(10) => Dangling_Input_Signal,
       rd_31(11) => Dangling_Input_Signal,
       rd_31(12) => Dangling_Input_Signal,
       rd_31(13) => Dangling_Input_Signal,
       rd_31(14) => Dangling_Input_Signal,
       rd_31(15) => Dangling_Input_Signal,
       rd_31(16) => Dangling_Input_Signal,
       rd_31(17) => Dangling_Input_Signal,
       rd_31(18) => Dangling_Input_Signal,
       rd_31(19) => Dangling_Input_Signal,
       rd_31(20) => Dangling_Input_Signal,
       rd_31(21) => Dangling_Input_Signal,
       rd_31(22) => Dangling_Input_Signal,
       rd_31(23) => Dangling_Input_Signal,
       rd_31(24) => Dangling_Input_Signal,
       rd_31(25) => Dangling_Input_Signal,
       rd_31(26) => Dangling_Input_Signal,
       rd_31(27) => Dangling_Input_Signal,
       rd_31(28) => Dangling_Input_Signal,
       rd_31(29) => Dangling_Input_Signal,
       rd_31(30) => Dangling_Input_Signal,
       rd_31(31) => Dangling_Input_Signal,
       rd_31(32) => Dangling_Input_Signal,
       rd_31(33) => Dangling_Input_Signal,
       rd_31(34) => Dangling_Input_Signal,
       rd_31(35) => Dangling_Input_Signal,
       rd_31(36) => Dangling_Input_Signal,
       rd_31(37) => Dangling_Input_Signal,
       rd_31(38) => Dangling_Input_Signal,
       rd_31(39) => Dangling_Input_Signal,
       rd_31(40) => Dangling_Input_Signal,
       rd_31(41) => Dangling_Input_Signal,
       rd_31(42) => Dangling_Input_Signal,
       rd_31(43) => Dangling_Input_Signal,
       rd_31(44) => Dangling_Input_Signal,
       rd_31(45) => Dangling_Input_Signal,
       rd_31(46) => Dangling_Input_Signal,
       rd_31(47) => Dangling_Input_Signal,
       rd_31(48) => Dangling_Input_Signal,
       rd_31(49) => Dangling_Input_Signal,
       rd_31(50) => Dangling_Input_Signal,
       rd_31(51) => Dangling_Input_Signal,
       rd_31(52) => Dangling_Input_Signal,
       rd_31(53) => Dangling_Input_Signal,
       rd_31(54) => Dangling_Input_Signal,
       rd_31(55) => Dangling_Input_Signal,
       rd_31(56) => Dangling_Input_Signal,
       rd_31(57) => Dangling_Input_Signal,
       rd_31(58) => Dangling_Input_Signal,
       rd_31(59) => Dangling_Input_Signal,
       rd_31(60) => Dangling_Input_Signal,
       rd_31(61) => Dangling_Input_Signal,
       rd_31(62) => Dangling_Input_Signal,
       rd_31(63) => Dangling_Input_Signal,
       addr => rx_addr,
       rd_0 => ld_reg,
       rd_1 => ld_reg_1,
       rd_10 => rdb10,
       rd_11 => rdb11,
       rd_12 => rdb12,
       rd_13 => rdb13,
       rd_14 => rdb14,
       rd_15 => rdb15,
       rd_16 => rdb16,
       rd_17 => rdb17,
       rd_2 => ld_reg_2,
       rd_3 => ld_reg_3,
       rd_4 => ld_reg_4,
       rd_5 => ld_regv1,
       rd_6 => ld_regv2,
       rd_7 => rdb7,
       rd_8 => rdb8,
       rd_9 => rdb9,
       rden => NET41961,
       read_data_out => rd_data_out_stat
  );

NET41961 <= not(rx_wren);

U313 : agrgate_8_by_8
  port map(
       in0(0) => veto_set_0(0),
       in0(1) => veto_set_0(1),
       in0(2) => veto_set_0(2),
       in0(3) => veto_set_0(3),
       in0(4) => veto_set_0(4),
       in0(5) => veto_set_0(5),
       in0(6) => veto_set_0(6),
       in0(7) => veto_set_0(7),
       in1(0) => veto_set_0(8),
       in1(1) => veto_set_0(9),
       in1(2) => veto_set_0(10),
       in1(3) => veto_set_0(11),
       in1(4) => veto_set_0(12),
       in1(5) => veto_set_0(13),
       in1(6) => veto_set_0(14),
       in1(7) => veto_set_0(15),
       in2(0) => veto_set_0(16),
       in2(1) => veto_set_0(17),
       in2(2) => veto_set_0(18),
       in2(3) => veto_set_0(19),
       in2(4) => veto_set_0(20),
       in2(5) => veto_set_0(21),
       in2(6) => veto_set_0(22),
       in2(7) => veto_set_0(23),
       in3(0) => veto_set_0(24),
       in3(1) => veto_set_0(25),
       in3(2) => veto_set_0(26),
       in3(3) => veto_set_0(27),
       in3(4) => veto_set_0(28),
       in3(5) => veto_set_0(29),
       in3(6) => veto_set_0(30),
       in3(7) => veto_set_0(31),
       in4(0) => ps_ct0(0),
       in4(1) => ps_ct0(1),
       in4(2) => ps_ct0(2),
       in4(3) => ps_ct0(3),
       in4(4) => ps_ct0(4),
       in4(5) => ps_ct0(5),
       in4(6) => ps_ct0(6),
       in4(7) => ps_ct0(7),
       in5(0) => ps_ct0(8),
       in5(1) => ps_ct0(9),
       in5(2) => ps_ct0(10),
       in5(3) => ps_ct0(11),
       in5(4) => ps_ct0(12),
       in5(5) => ps_ct0(13),
       in5(6) => ps_ct0(14),
       in5(7) => ps_ct0(15),
       in6(0) => ps_ct0(16),
       in6(1) => ps_ct0(17),
       in6(2) => ps_ct0(18),
       in6(3) => ps_ct0(19),
       in6(4) => ps_ct0(20),
       in6(5) => ps_ct0(21),
       in6(6) => ps_ct0(22),
       in6(7) => ps_ct0(23),
       in7(0) => ps_ct0(24),
       in7(1) => ps_ct0(25),
       in7(2) => ps_ct0(26),
       in7(3) => ps_ct0(27),
       in7(4) => ps_ct0(28),
       in7(5) => ps_ct0(29),
       in7(6) => ps_ct0(30),
       in7(7) => ps_ct0(31),
       out_0 => rdb7
  );

U314 : agrgate_8_by_8
  port map(
       in0(0) => veto_set_1(0),
       in0(1) => veto_set_1(1),
       in0(2) => veto_set_1(2),
       in0(3) => veto_set_1(3),
       in0(4) => veto_set_1(4),
       in0(5) => veto_set_1(5),
       in0(6) => veto_set_1(6),
       in0(7) => veto_set_1(7),
       in1(0) => veto_set_1(8),
       in1(1) => veto_set_1(9),
       in1(2) => veto_set_1(10),
       in1(3) => veto_set_1(11),
       in1(4) => veto_set_1(12),
       in1(5) => veto_set_1(13),
       in1(6) => veto_set_1(14),
       in1(7) => veto_set_1(15),
       in2(0) => veto_set_1(16),
       in2(1) => veto_set_1(17),
       in2(2) => veto_set_1(18),
       in2(3) => veto_set_1(19),
       in2(4) => veto_set_1(20),
       in2(5) => veto_set_1(21),
       in2(6) => veto_set_1(22),
       in2(7) => veto_set_1(23),
       in3(0) => veto_set_1(24),
       in3(1) => veto_set_1(25),
       in3(2) => veto_set_1(26),
       in3(3) => veto_set_1(27),
       in3(4) => veto_set_1(28),
       in3(5) => veto_set_1(29),
       in3(6) => veto_set_1(30),
       in3(7) => veto_set_1(31),
       in4(0) => ps_ct1(0),
       in4(1) => ps_ct1(1),
       in4(2) => ps_ct1(2),
       in4(3) => ps_ct1(3),
       in4(4) => ps_ct1(4),
       in4(5) => ps_ct1(5),
       in4(6) => ps_ct1(6),
       in4(7) => ps_ct1(7),
       in6(0) => ps_ct1(16),
       in6(1) => ps_ct1(17),
       in6(2) => ps_ct1(18),
       in6(3) => ps_ct1(19),
       in6(4) => ps_ct1(20),
       in6(5) => ps_ct1(21),
       in6(6) => ps_ct1(22),
       in6(7) => ps_ct1(23),
       in7(0) => ps_ct1(24),
       in7(1) => ps_ct1(25),
       in7(2) => ps_ct1(26),
       in7(3) => ps_ct1(27),
       in7(4) => ps_ct1(28),
       in7(5) => ps_ct1(29),
       in7(6) => ps_ct1(30),
       in7(7) => ps_ct1(31),
       in5 => ps_c1,
       out_0 => rdb8
  );

U315 : agrgate_8_by_8
  port map(
       in0(0) => veto_set_2(0),
       in0(1) => veto_set_2(1),
       in0(2) => veto_set_2(2),
       in0(3) => veto_set_2(3),
       in0(4) => veto_set_2(4),
       in0(5) => veto_set_2(5),
       in0(6) => veto_set_2(6),
       in0(7) => veto_set_2(7),
       in1(0) => veto_set_2(8),
       in1(1) => veto_set_2(9),
       in1(2) => veto_set_2(10),
       in1(3) => veto_set_2(11),
       in1(4) => veto_set_2(12),
       in1(5) => veto_set_2(13),
       in1(6) => veto_set_2(14),
       in1(7) => veto_set_2(15),
       in2(0) => veto_set_2(16),
       in2(1) => veto_set_2(17),
       in2(2) => veto_set_2(18),
       in2(3) => veto_set_2(19),
       in2(4) => veto_set_2(20),
       in2(5) => veto_set_2(21),
       in2(6) => veto_set_2(22),
       in2(7) => veto_set_2(23),
       in3(0) => veto_set_2(24),
       in3(1) => veto_set_2(25),
       in3(2) => veto_set_2(26),
       in3(3) => veto_set_2(27),
       in3(4) => veto_set_2(28),
       in3(5) => veto_set_2(29),
       in3(6) => veto_set_2(30),
       in3(7) => veto_set_2(31),
       in4(0) => ps_ct2(0),
       in4(1) => ps_ct2(1),
       in4(2) => ps_ct2(2),
       in4(3) => ps_ct2(3),
       in4(4) => ps_ct2(4),
       in4(5) => ps_ct2(5),
       in4(6) => ps_ct2(6),
       in4(7) => ps_ct2(7),
       in5(0) => ps_ct2(8),
       in5(1) => ps_ct2(9),
       in5(2) => ps_ct2(10),
       in5(3) => ps_ct2(11),
       in5(4) => ps_ct2(12),
       in5(5) => ps_ct2(13),
       in5(6) => ps_ct2(14),
       in5(7) => ps_ct2(15),
       in6(0) => ps_ct2(16),
       in6(1) => ps_ct2(17),
       in6(2) => ps_ct2(18),
       in6(3) => ps_ct2(19),
       in6(4) => ps_ct2(20),
       in6(5) => ps_ct2(21),
       in6(6) => ps_ct2(22),
       in6(7) => ps_ct2(23),
       in7(0) => ps_ct2(24),
       in7(1) => ps_ct2(25),
       in7(2) => ps_ct2(26),
       in7(3) => ps_ct2(27),
       in7(4) => ps_ct2(28),
       in7(5) => ps_ct2(29),
       in7(6) => ps_ct2(30),
       in7(7) => ps_ct2(31),
       out_0 => rdb9
  );

U316 : agrgate_8_by_8
  port map(
       in0(0) => blk_data_in_s(0),
       in0(1) => blk_data_in_s(1),
       in0(2) => blk_data_in_s(2),
       in0(3) => blk_data_in_s(3),
       in0(4) => blk_data_in_s(4),
       in0(5) => blk_data_in_s(5),
       in0(6) => blk_data_in_s(6),
       in0(7) => blk_data_in_s(7),
       in1(0) => blk_data_in_s(8),
       in1(1) => blk_data_in_s(9),
       in1(2) => blk_data_in_s(10),
       in1(3) => blk_data_in_s(11),
       in1(4) => blk_data_in_s(12),
       in1(5) => blk_data_in_s(13),
       in1(6) => blk_data_in_s(14),
       in1(7) => blk_data_in_s(15),
       in3(0) => sel_blk_en_term(0),
       in3(1) => sel_blk_en_term(1),
       in3(2) => sel_blk_en_term(2),
       in3(3) => sel_blk_en_term(3),
       in3(4) => sel_blk_en_term(4),
       in3(5) => sel_blk_en_term(5),
       in3(6) => sel_blk_en_term(6),
       in3(7) => sel_blk_en_term(7),
       in4(0) => sel_blk_en_term(8),
       in4(1) => sel_blk_en_term(9),
       in4(2) => sel_blk_en_term(10),
       in4(3) => sel_blk_en_term(11),
       in4(4) => sel_blk_en_term(12),
       in4(5) => sel_blk_en_term(13),
       in4(6) => sel_blk_en_term(14),
       in4(7) => sel_blk_en_term(15),
       in6(0) => z_sel(0),
       in6(1) => z_sel(1),
       in6(2) => z_sel(2),
       in6(3) => z_sel(3),
       in6(4) => z_sel(4),
       in6(5) => z_sel(5),
       in6(6) => z_sel(6),
       in6(7) => z_sel(7),
       in7(0) => z_sel(8),
       in7(1) => z_sel(9),
       in7(2) => z_sel(10),
       in7(3) => z_sel(11),
       in7(4) => z_sel(12),
       in7(5) => z_sel(13),
       in7(6) => z_sel(14),
       in7(7) => z_sel(15),
       in2 => dac_ctl,
       in5 => sel_ctl,
       out_0 => rdb10
  );

U317 : agrgate_8_by_8
  port map(
       in5(0) => fs_sync_bus(0),
       in5(1) => fs_sync_bus(1),
       in5(2) => fs_sync_bus(2),
       in5(3) => fs_sync_bus(3),
       in5(4) => fs_sync_bus(4),
       in5(5) => fs_sync_bus(5),
       in5(6) => fs_sync_bus(6),
       in5(7) => fs_sync_bus(7),
       in6(0) => fs_sync_bus(8),
       in6(1) => fs_sync_bus(9),
       in6(2) => fs_sync_bus(10),
       in6(3) => fs_sync_bus(11),
       in6(4) => fs_sync_bus(12),
       in6(5) => fs_sync_bus(13),
       in6(6) => fs_sync_bus(14),
       in6(7) => fs_sync_bus(15),
       in0 => pulse_ctl,
       in1 => pulse_ctl_1,
       in2 => pulse_ctl_2,
       in3 => pulse_ctl_3,
       in4 => pulse_ctl_4,
       in7 => accel_sync_bus,
       out_0 => rdb11
  );

U318 : agrgate_8_by_8
  port map(
       in4(0) => ctr_resets(0),
       in4(1) => ctr_resets(1),
       in4(2) => ctr_resets(2),
       in4(3) => ctr_resets(3),
       in4(4) => ctr_resets(4),
       in4(5) => ctr_resets(5),
       in4(6) => ctr_resets(6),
       in4(7) => ctr_resets(7),
       in5(0) => ctr_resets(8),
       in5(1) => ctr_resets(9),
       in5(2) => ctr_resets(10),
       in5(3) => ctr_resets(11),
       in5(4) => ctr_resets(12),
       in5(5) => ctr_resets(13),
       in5(6) => ctr_resets(14),
       in5(7) => ctr_resets(15),
       in6(0) => ctr_enables(0),
       in6(1) => ctr_enables(1),
       in6(2) => ctr_enables(2),
       in6(3) => ctr_enables(3),
       in6(4) => ctr_enables(4),
       in6(5) => ctr_enables(5),
       in6(6) => ctr_enables(6),
       in6(7) => ctr_enables(7),
       in7(0) => ctr_enables(8),
       in7(1) => ctr_enables(9),
       in7(2) => ctr_enables(10),
       in7(3) => ctr_enables(11),
       in7(4) => ctr_enables(12),
       in7(5) => ctr_enables(13),
       in7(6) => ctr_enables(14),
       in7(7) => ctr_enables(15),
       in0 => mux_ctl,
       in1 => muxsel_2,
       in2 => muxsel_4,
       in3 => muxsel_4,
       out_0 => rdb12
  );

U319 : agrgate_8_by_8
  port map(
       in0(0) => pcnt(0),
       in0(1) => pcnt(1),
       in0(2) => pcnt(2),
       in0(3) => pcnt(3),
       in0(4) => pcnt(4),
       in0(5) => pcnt(5),
       in0(6) => pcnt(6),
       in0(7) => pcnt(7),
       in1(0) => pcnt(8),
       in1(1) => pcnt(9),
       in1(2) => pcnt(10),
       in1(3) => pcnt(11),
       in1(4) => pcnt(12),
       in1(5) => pcnt(13),
       in1(6) => pcnt(14),
       in1(7) => pcnt(15),
       in2(0) => pcnt(16),
       in2(1) => pcnt(17),
       in2(2) => pcnt(18),
       in2(3) => pcnt(19),
       in2(4) => pcnt(20),
       in2(5) => pcnt(21),
       in2(6) => pcnt(22),
       in2(7) => pcnt(23),
       in3(0) => pcnt(24),
       in3(1) => pcnt(25),
       in3(2) => pcnt(26),
       in3(3) => pcnt(27),
       in3(4) => pcnt(28),
       in3(5) => pcnt(29),
       in3(6) => pcnt(30),
       in3(7) => pcnt(31),
       in4(0) => phi(0),
       in4(1) => phi(1),
       in4(2) => phi(2),
       in4(3) => phi(3),
       in4(4) => phi(4),
       in4(5) => phi(5),
       in4(6) => phi(6),
       in4(7) => phi(7),
       in5(0) => phi(8),
       in5(1) => phi(9),
       in5(2) => phi(10),
       in5(3) => phi(11),
       in5(4) => phi(12),
       in5(5) => phi(13),
       in5(6) => phi(14),
       in5(7) => phi(15),
       in6(0) => phi(16),
       in6(1) => phi(17),
       in6(2) => phi(18),
       in6(3) => phi(19),
       in6(4) => phi(20),
       in6(5) => phi(21),
       in6(6) => phi(22),
       in6(7) => phi(23),
       in7(0) => phi(24),
       in7(1) => phi(25),
       in7(2) => phi(26),
       in7(3) => phi(27),
       in7(4) => phi(28),
       in7(5) => phi(29),
       in7(6) => phi(30),
       in7(7) => phi(31),
       out_0 => rdb13
  );

U32 : decode_addr_NIM_Plus_3
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_3,
       wr_en => rx_wren
  );

U320 : agrgate_8_by_8
  port map(
       in0(0) => plo(0),
       in0(1) => plo(1),
       in0(2) => plo(2),
       in0(3) => plo(3),
       in0(4) => plo(4),
       in0(5) => plo(5),
       in0(6) => plo(6),
       in0(7) => plo(7),
       in1(0) => plo(8),
       in1(1) => plo(9),
       in1(2) => plo(10),
       in1(3) => plo(11),
       in1(4) => plo(12),
       in1(5) => plo(13),
       in1(6) => plo(14),
       in1(7) => plo(15),
       in2(0) => plo(16),
       in2(1) => plo(17),
       in2(2) => plo(18),
       in2(3) => plo(19),
       in2(4) => plo(20),
       in2(5) => plo(21),
       in2(6) => plo(22),
       in2(7) => plo(23),
       in3(0) => plo(24),
       in3(1) => plo(25),
       in3(2) => plo(26),
       in3(3) => plo(27),
       in3(4) => plo(28),
       in3(5) => plo(29),
       in3(6) => plo(30),
       in3(7) => plo(31),
       in4 => dcm,
       in5 => w0cm,
       in6 => w1cm,
       in7 => w2cm,
       out_0 => rdb14
  );

U321 : agrgate_8_by_8
  port map(
       in0 => veto1_ctl,
       in1 => veto2_ctl,
       in2 => sig_v1_sel,
       in3 => sig_v2_sel,
       in4 => in_pol_sel,
       in5 => bp_ctl,
       in6 => burst_mux_sel,
       in7 => scope_ctl,
       out_0 => rdb15
  );

U322 : read_decode_p
  port map(
       rd_10(0) => Dangling_Input_Signal,
       rd_10(1) => Dangling_Input_Signal,
       rd_10(2) => Dangling_Input_Signal,
       rd_10(3) => Dangling_Input_Signal,
       rd_10(4) => Dangling_Input_Signal,
       rd_10(5) => Dangling_Input_Signal,
       rd_10(6) => Dangling_Input_Signal,
       rd_10(7) => Dangling_Input_Signal,
       rd_10(8) => Dangling_Input_Signal,
       rd_10(9) => Dangling_Input_Signal,
       rd_10(10) => Dangling_Input_Signal,
       rd_10(11) => Dangling_Input_Signal,
       rd_10(12) => Dangling_Input_Signal,
       rd_10(13) => Dangling_Input_Signal,
       rd_10(14) => Dangling_Input_Signal,
       rd_10(15) => Dangling_Input_Signal,
       rd_10(16) => Dangling_Input_Signal,
       rd_10(17) => Dangling_Input_Signal,
       rd_10(18) => Dangling_Input_Signal,
       rd_10(19) => Dangling_Input_Signal,
       rd_10(20) => Dangling_Input_Signal,
       rd_10(21) => Dangling_Input_Signal,
       rd_10(22) => Dangling_Input_Signal,
       rd_10(23) => Dangling_Input_Signal,
       rd_10(24) => Dangling_Input_Signal,
       rd_10(25) => Dangling_Input_Signal,
       rd_10(26) => Dangling_Input_Signal,
       rd_10(27) => Dangling_Input_Signal,
       rd_10(28) => Dangling_Input_Signal,
       rd_10(29) => Dangling_Input_Signal,
       rd_10(30) => Dangling_Input_Signal,
       rd_10(31) => Dangling_Input_Signal,
       rd_10(32) => Dangling_Input_Signal,
       rd_10(33) => Dangling_Input_Signal,
       rd_10(34) => Dangling_Input_Signal,
       rd_10(35) => Dangling_Input_Signal,
       rd_10(36) => Dangling_Input_Signal,
       rd_10(37) => Dangling_Input_Signal,
       rd_10(38) => Dangling_Input_Signal,
       rd_10(39) => Dangling_Input_Signal,
       rd_10(40) => Dangling_Input_Signal,
       rd_10(41) => Dangling_Input_Signal,
       rd_10(42) => Dangling_Input_Signal,
       rd_10(43) => Dangling_Input_Signal,
       rd_10(44) => Dangling_Input_Signal,
       rd_10(45) => Dangling_Input_Signal,
       rd_10(46) => Dangling_Input_Signal,
       rd_10(47) => Dangling_Input_Signal,
       rd_10(48) => Dangling_Input_Signal,
       rd_10(49) => Dangling_Input_Signal,
       rd_10(50) => Dangling_Input_Signal,
       rd_10(51) => Dangling_Input_Signal,
       rd_10(52) => Dangling_Input_Signal,
       rd_10(53) => Dangling_Input_Signal,
       rd_10(54) => Dangling_Input_Signal,
       rd_10(55) => Dangling_Input_Signal,
       rd_10(56) => Dangling_Input_Signal,
       rd_10(57) => Dangling_Input_Signal,
       rd_10(58) => Dangling_Input_Signal,
       rd_10(59) => Dangling_Input_Signal,
       rd_10(60) => Dangling_Input_Signal,
       rd_10(61) => Dangling_Input_Signal,
       rd_10(62) => Dangling_Input_Signal,
       rd_10(63) => Dangling_Input_Signal,
       rd_11(0) => Dangling_Input_Signal,
       rd_11(1) => Dangling_Input_Signal,
       rd_11(2) => Dangling_Input_Signal,
       rd_11(3) => Dangling_Input_Signal,
       rd_11(4) => Dangling_Input_Signal,
       rd_11(5) => Dangling_Input_Signal,
       rd_11(6) => Dangling_Input_Signal,
       rd_11(7) => Dangling_Input_Signal,
       rd_11(8) => Dangling_Input_Signal,
       rd_11(9) => Dangling_Input_Signal,
       rd_11(10) => Dangling_Input_Signal,
       rd_11(11) => Dangling_Input_Signal,
       rd_11(12) => Dangling_Input_Signal,
       rd_11(13) => Dangling_Input_Signal,
       rd_11(14) => Dangling_Input_Signal,
       rd_11(15) => Dangling_Input_Signal,
       rd_11(16) => Dangling_Input_Signal,
       rd_11(17) => Dangling_Input_Signal,
       rd_11(18) => Dangling_Input_Signal,
       rd_11(19) => Dangling_Input_Signal,
       rd_11(20) => Dangling_Input_Signal,
       rd_11(21) => Dangling_Input_Signal,
       rd_11(22) => Dangling_Input_Signal,
       rd_11(23) => Dangling_Input_Signal,
       rd_11(24) => Dangling_Input_Signal,
       rd_11(25) => Dangling_Input_Signal,
       rd_11(26) => Dangling_Input_Signal,
       rd_11(27) => Dangling_Input_Signal,
       rd_11(28) => Dangling_Input_Signal,
       rd_11(29) => Dangling_Input_Signal,
       rd_11(30) => Dangling_Input_Signal,
       rd_11(31) => Dangling_Input_Signal,
       rd_11(32) => Dangling_Input_Signal,
       rd_11(33) => Dangling_Input_Signal,
       rd_11(34) => Dangling_Input_Signal,
       rd_11(35) => Dangling_Input_Signal,
       rd_11(36) => Dangling_Input_Signal,
       rd_11(37) => Dangling_Input_Signal,
       rd_11(38) => Dangling_Input_Signal,
       rd_11(39) => Dangling_Input_Signal,
       rd_11(40) => Dangling_Input_Signal,
       rd_11(41) => Dangling_Input_Signal,
       rd_11(42) => Dangling_Input_Signal,
       rd_11(43) => Dangling_Input_Signal,
       rd_11(44) => Dangling_Input_Signal,
       rd_11(45) => Dangling_Input_Signal,
       rd_11(46) => Dangling_Input_Signal,
       rd_11(47) => Dangling_Input_Signal,
       rd_11(48) => Dangling_Input_Signal,
       rd_11(49) => Dangling_Input_Signal,
       rd_11(50) => Dangling_Input_Signal,
       rd_11(51) => Dangling_Input_Signal,
       rd_11(52) => Dangling_Input_Signal,
       rd_11(53) => Dangling_Input_Signal,
       rd_11(54) => Dangling_Input_Signal,
       rd_11(55) => Dangling_Input_Signal,
       rd_11(56) => Dangling_Input_Signal,
       rd_11(57) => Dangling_Input_Signal,
       rd_11(58) => Dangling_Input_Signal,
       rd_11(59) => Dangling_Input_Signal,
       rd_11(60) => Dangling_Input_Signal,
       rd_11(61) => Dangling_Input_Signal,
       rd_11(62) => Dangling_Input_Signal,
       rd_11(63) => Dangling_Input_Signal,
       rd_12(0) => Dangling_Input_Signal,
       rd_12(1) => Dangling_Input_Signal,
       rd_12(2) => Dangling_Input_Signal,
       rd_12(3) => Dangling_Input_Signal,
       rd_12(4) => Dangling_Input_Signal,
       rd_12(5) => Dangling_Input_Signal,
       rd_12(6) => Dangling_Input_Signal,
       rd_12(7) => Dangling_Input_Signal,
       rd_12(8) => Dangling_Input_Signal,
       rd_12(9) => Dangling_Input_Signal,
       rd_12(10) => Dangling_Input_Signal,
       rd_12(11) => Dangling_Input_Signal,
       rd_12(12) => Dangling_Input_Signal,
       rd_12(13) => Dangling_Input_Signal,
       rd_12(14) => Dangling_Input_Signal,
       rd_12(15) => Dangling_Input_Signal,
       rd_12(16) => Dangling_Input_Signal,
       rd_12(17) => Dangling_Input_Signal,
       rd_12(18) => Dangling_Input_Signal,
       rd_12(19) => Dangling_Input_Signal,
       rd_12(20) => Dangling_Input_Signal,
       rd_12(21) => Dangling_Input_Signal,
       rd_12(22) => Dangling_Input_Signal,
       rd_12(23) => Dangling_Input_Signal,
       rd_12(24) => Dangling_Input_Signal,
       rd_12(25) => Dangling_Input_Signal,
       rd_12(26) => Dangling_Input_Signal,
       rd_12(27) => Dangling_Input_Signal,
       rd_12(28) => Dangling_Input_Signal,
       rd_12(29) => Dangling_Input_Signal,
       rd_12(30) => Dangling_Input_Signal,
       rd_12(31) => Dangling_Input_Signal,
       rd_12(32) => Dangling_Input_Signal,
       rd_12(33) => Dangling_Input_Signal,
       rd_12(34) => Dangling_Input_Signal,
       rd_12(35) => Dangling_Input_Signal,
       rd_12(36) => Dangling_Input_Signal,
       rd_12(37) => Dangling_Input_Signal,
       rd_12(38) => Dangling_Input_Signal,
       rd_12(39) => Dangling_Input_Signal,
       rd_12(40) => Dangling_Input_Signal,
       rd_12(41) => Dangling_Input_Signal,
       rd_12(42) => Dangling_Input_Signal,
       rd_12(43) => Dangling_Input_Signal,
       rd_12(44) => Dangling_Input_Signal,
       rd_12(45) => Dangling_Input_Signal,
       rd_12(46) => Dangling_Input_Signal,
       rd_12(47) => Dangling_Input_Signal,
       rd_12(48) => Dangling_Input_Signal,
       rd_12(49) => Dangling_Input_Signal,
       rd_12(50) => Dangling_Input_Signal,
       rd_12(51) => Dangling_Input_Signal,
       rd_12(52) => Dangling_Input_Signal,
       rd_12(53) => Dangling_Input_Signal,
       rd_12(54) => Dangling_Input_Signal,
       rd_12(55) => Dangling_Input_Signal,
       rd_12(56) => Dangling_Input_Signal,
       rd_12(57) => Dangling_Input_Signal,
       rd_12(58) => Dangling_Input_Signal,
       rd_12(59) => Dangling_Input_Signal,
       rd_12(60) => Dangling_Input_Signal,
       rd_12(61) => Dangling_Input_Signal,
       rd_12(62) => Dangling_Input_Signal,
       rd_12(63) => Dangling_Input_Signal,
       rd_13(0) => Dangling_Input_Signal,
       rd_13(1) => Dangling_Input_Signal,
       rd_13(2) => Dangling_Input_Signal,
       rd_13(3) => Dangling_Input_Signal,
       rd_13(4) => Dangling_Input_Signal,
       rd_13(5) => Dangling_Input_Signal,
       rd_13(6) => Dangling_Input_Signal,
       rd_13(7) => Dangling_Input_Signal,
       rd_13(8) => Dangling_Input_Signal,
       rd_13(9) => Dangling_Input_Signal,
       rd_13(10) => Dangling_Input_Signal,
       rd_13(11) => Dangling_Input_Signal,
       rd_13(12) => Dangling_Input_Signal,
       rd_13(13) => Dangling_Input_Signal,
       rd_13(14) => Dangling_Input_Signal,
       rd_13(15) => Dangling_Input_Signal,
       rd_13(16) => Dangling_Input_Signal,
       rd_13(17) => Dangling_Input_Signal,
       rd_13(18) => Dangling_Input_Signal,
       rd_13(19) => Dangling_Input_Signal,
       rd_13(20) => Dangling_Input_Signal,
       rd_13(21) => Dangling_Input_Signal,
       rd_13(22) => Dangling_Input_Signal,
       rd_13(23) => Dangling_Input_Signal,
       rd_13(24) => Dangling_Input_Signal,
       rd_13(25) => Dangling_Input_Signal,
       rd_13(26) => Dangling_Input_Signal,
       rd_13(27) => Dangling_Input_Signal,
       rd_13(28) => Dangling_Input_Signal,
       rd_13(29) => Dangling_Input_Signal,
       rd_13(30) => Dangling_Input_Signal,
       rd_13(31) => Dangling_Input_Signal,
       rd_13(32) => Dangling_Input_Signal,
       rd_13(33) => Dangling_Input_Signal,
       rd_13(34) => Dangling_Input_Signal,
       rd_13(35) => Dangling_Input_Signal,
       rd_13(36) => Dangling_Input_Signal,
       rd_13(37) => Dangling_Input_Signal,
       rd_13(38) => Dangling_Input_Signal,
       rd_13(39) => Dangling_Input_Signal,
       rd_13(40) => Dangling_Input_Signal,
       rd_13(41) => Dangling_Input_Signal,
       rd_13(42) => Dangling_Input_Signal,
       rd_13(43) => Dangling_Input_Signal,
       rd_13(44) => Dangling_Input_Signal,
       rd_13(45) => Dangling_Input_Signal,
       rd_13(46) => Dangling_Input_Signal,
       rd_13(47) => Dangling_Input_Signal,
       rd_13(48) => Dangling_Input_Signal,
       rd_13(49) => Dangling_Input_Signal,
       rd_13(50) => Dangling_Input_Signal,
       rd_13(51) => Dangling_Input_Signal,
       rd_13(52) => Dangling_Input_Signal,
       rd_13(53) => Dangling_Input_Signal,
       rd_13(54) => Dangling_Input_Signal,
       rd_13(55) => Dangling_Input_Signal,
       rd_13(56) => Dangling_Input_Signal,
       rd_13(57) => Dangling_Input_Signal,
       rd_13(58) => Dangling_Input_Signal,
       rd_13(59) => Dangling_Input_Signal,
       rd_13(60) => Dangling_Input_Signal,
       rd_13(61) => Dangling_Input_Signal,
       rd_13(62) => Dangling_Input_Signal,
       rd_13(63) => Dangling_Input_Signal,
       rd_14(0) => Dangling_Input_Signal,
       rd_14(1) => Dangling_Input_Signal,
       rd_14(2) => Dangling_Input_Signal,
       rd_14(3) => Dangling_Input_Signal,
       rd_14(4) => Dangling_Input_Signal,
       rd_14(5) => Dangling_Input_Signal,
       rd_14(6) => Dangling_Input_Signal,
       rd_14(7) => Dangling_Input_Signal,
       rd_14(8) => Dangling_Input_Signal,
       rd_14(9) => Dangling_Input_Signal,
       rd_14(10) => Dangling_Input_Signal,
       rd_14(11) => Dangling_Input_Signal,
       rd_14(12) => Dangling_Input_Signal,
       rd_14(13) => Dangling_Input_Signal,
       rd_14(14) => Dangling_Input_Signal,
       rd_14(15) => Dangling_Input_Signal,
       rd_14(16) => Dangling_Input_Signal,
       rd_14(17) => Dangling_Input_Signal,
       rd_14(18) => Dangling_Input_Signal,
       rd_14(19) => Dangling_Input_Signal,
       rd_14(20) => Dangling_Input_Signal,
       rd_14(21) => Dangling_Input_Signal,
       rd_14(22) => Dangling_Input_Signal,
       rd_14(23) => Dangling_Input_Signal,
       rd_14(24) => Dangling_Input_Signal,
       rd_14(25) => Dangling_Input_Signal,
       rd_14(26) => Dangling_Input_Signal,
       rd_14(27) => Dangling_Input_Signal,
       rd_14(28) => Dangling_Input_Signal,
       rd_14(29) => Dangling_Input_Signal,
       rd_14(30) => Dangling_Input_Signal,
       rd_14(31) => Dangling_Input_Signal,
       rd_14(32) => Dangling_Input_Signal,
       rd_14(33) => Dangling_Input_Signal,
       rd_14(34) => Dangling_Input_Signal,
       rd_14(35) => Dangling_Input_Signal,
       rd_14(36) => Dangling_Input_Signal,
       rd_14(37) => Dangling_Input_Signal,
       rd_14(38) => Dangling_Input_Signal,
       rd_14(39) => Dangling_Input_Signal,
       rd_14(40) => Dangling_Input_Signal,
       rd_14(41) => Dangling_Input_Signal,
       rd_14(42) => Dangling_Input_Signal,
       rd_14(43) => Dangling_Input_Signal,
       rd_14(44) => Dangling_Input_Signal,
       rd_14(45) => Dangling_Input_Signal,
       rd_14(46) => Dangling_Input_Signal,
       rd_14(47) => Dangling_Input_Signal,
       rd_14(48) => Dangling_Input_Signal,
       rd_14(49) => Dangling_Input_Signal,
       rd_14(50) => Dangling_Input_Signal,
       rd_14(51) => Dangling_Input_Signal,
       rd_14(52) => Dangling_Input_Signal,
       rd_14(53) => Dangling_Input_Signal,
       rd_14(54) => Dangling_Input_Signal,
       rd_14(55) => Dangling_Input_Signal,
       rd_14(56) => Dangling_Input_Signal,
       rd_14(57) => Dangling_Input_Signal,
       rd_14(58) => Dangling_Input_Signal,
       rd_14(59) => Dangling_Input_Signal,
       rd_14(60) => Dangling_Input_Signal,
       rd_14(61) => Dangling_Input_Signal,
       rd_14(62) => Dangling_Input_Signal,
       rd_14(63) => Dangling_Input_Signal,
       rd_15(0) => Dangling_Input_Signal,
       rd_15(1) => Dangling_Input_Signal,
       rd_15(2) => Dangling_Input_Signal,
       rd_15(3) => Dangling_Input_Signal,
       rd_15(4) => Dangling_Input_Signal,
       rd_15(5) => Dangling_Input_Signal,
       rd_15(6) => Dangling_Input_Signal,
       rd_15(7) => Dangling_Input_Signal,
       rd_15(8) => Dangling_Input_Signal,
       rd_15(9) => Dangling_Input_Signal,
       rd_15(10) => Dangling_Input_Signal,
       rd_15(11) => Dangling_Input_Signal,
       rd_15(12) => Dangling_Input_Signal,
       rd_15(13) => Dangling_Input_Signal,
       rd_15(14) => Dangling_Input_Signal,
       rd_15(15) => Dangling_Input_Signal,
       rd_15(16) => Dangling_Input_Signal,
       rd_15(17) => Dangling_Input_Signal,
       rd_15(18) => Dangling_Input_Signal,
       rd_15(19) => Dangling_Input_Signal,
       rd_15(20) => Dangling_Input_Signal,
       rd_15(21) => Dangling_Input_Signal,
       rd_15(22) => Dangling_Input_Signal,
       rd_15(23) => Dangling_Input_Signal,
       rd_15(24) => Dangling_Input_Signal,
       rd_15(25) => Dangling_Input_Signal,
       rd_15(26) => Dangling_Input_Signal,
       rd_15(27) => Dangling_Input_Signal,
       rd_15(28) => Dangling_Input_Signal,
       rd_15(29) => Dangling_Input_Signal,
       rd_15(30) => Dangling_Input_Signal,
       rd_15(31) => Dangling_Input_Signal,
       rd_15(32) => Dangling_Input_Signal,
       rd_15(33) => Dangling_Input_Signal,
       rd_15(34) => Dangling_Input_Signal,
       rd_15(35) => Dangling_Input_Signal,
       rd_15(36) => Dangling_Input_Signal,
       rd_15(37) => Dangling_Input_Signal,
       rd_15(38) => Dangling_Input_Signal,
       rd_15(39) => Dangling_Input_Signal,
       rd_15(40) => Dangling_Input_Signal,
       rd_15(41) => Dangling_Input_Signal,
       rd_15(42) => Dangling_Input_Signal,
       rd_15(43) => Dangling_Input_Signal,
       rd_15(44) => Dangling_Input_Signal,
       rd_15(45) => Dangling_Input_Signal,
       rd_15(46) => Dangling_Input_Signal,
       rd_15(47) => Dangling_Input_Signal,
       rd_15(48) => Dangling_Input_Signal,
       rd_15(49) => Dangling_Input_Signal,
       rd_15(50) => Dangling_Input_Signal,
       rd_15(51) => Dangling_Input_Signal,
       rd_15(52) => Dangling_Input_Signal,
       rd_15(53) => Dangling_Input_Signal,
       rd_15(54) => Dangling_Input_Signal,
       rd_15(55) => Dangling_Input_Signal,
       rd_15(56) => Dangling_Input_Signal,
       rd_15(57) => Dangling_Input_Signal,
       rd_15(58) => Dangling_Input_Signal,
       rd_15(59) => Dangling_Input_Signal,
       rd_15(60) => Dangling_Input_Signal,
       rd_15(61) => Dangling_Input_Signal,
       rd_15(62) => Dangling_Input_Signal,
       rd_15(63) => Dangling_Input_Signal,
       rd_16(0) => Dangling_Input_Signal,
       rd_16(1) => Dangling_Input_Signal,
       rd_16(2) => Dangling_Input_Signal,
       rd_16(3) => Dangling_Input_Signal,
       rd_16(4) => Dangling_Input_Signal,
       rd_16(5) => Dangling_Input_Signal,
       rd_16(6) => Dangling_Input_Signal,
       rd_16(7) => Dangling_Input_Signal,
       rd_16(8) => Dangling_Input_Signal,
       rd_16(9) => Dangling_Input_Signal,
       rd_16(10) => Dangling_Input_Signal,
       rd_16(11) => Dangling_Input_Signal,
       rd_16(12) => Dangling_Input_Signal,
       rd_16(13) => Dangling_Input_Signal,
       rd_16(14) => Dangling_Input_Signal,
       rd_16(15) => Dangling_Input_Signal,
       rd_16(16) => Dangling_Input_Signal,
       rd_16(17) => Dangling_Input_Signal,
       rd_16(18) => Dangling_Input_Signal,
       rd_16(19) => Dangling_Input_Signal,
       rd_16(20) => Dangling_Input_Signal,
       rd_16(21) => Dangling_Input_Signal,
       rd_16(22) => Dangling_Input_Signal,
       rd_16(23) => Dangling_Input_Signal,
       rd_16(24) => Dangling_Input_Signal,
       rd_16(25) => Dangling_Input_Signal,
       rd_16(26) => Dangling_Input_Signal,
       rd_16(27) => Dangling_Input_Signal,
       rd_16(28) => Dangling_Input_Signal,
       rd_16(29) => Dangling_Input_Signal,
       rd_16(30) => Dangling_Input_Signal,
       rd_16(31) => Dangling_Input_Signal,
       rd_16(32) => Dangling_Input_Signal,
       rd_16(33) => Dangling_Input_Signal,
       rd_16(34) => Dangling_Input_Signal,
       rd_16(35) => Dangling_Input_Signal,
       rd_16(36) => Dangling_Input_Signal,
       rd_16(37) => Dangling_Input_Signal,
       rd_16(38) => Dangling_Input_Signal,
       rd_16(39) => Dangling_Input_Signal,
       rd_16(40) => Dangling_Input_Signal,
       rd_16(41) => Dangling_Input_Signal,
       rd_16(42) => Dangling_Input_Signal,
       rd_16(43) => Dangling_Input_Signal,
       rd_16(44) => Dangling_Input_Signal,
       rd_16(45) => Dangling_Input_Signal,
       rd_16(46) => Dangling_Input_Signal,
       rd_16(47) => Dangling_Input_Signal,
       rd_16(48) => Dangling_Input_Signal,
       rd_16(49) => Dangling_Input_Signal,
       rd_16(50) => Dangling_Input_Signal,
       rd_16(51) => Dangling_Input_Signal,
       rd_16(52) => Dangling_Input_Signal,
       rd_16(53) => Dangling_Input_Signal,
       rd_16(54) => Dangling_Input_Signal,
       rd_16(55) => Dangling_Input_Signal,
       rd_16(56) => Dangling_Input_Signal,
       rd_16(57) => Dangling_Input_Signal,
       rd_16(58) => Dangling_Input_Signal,
       rd_16(59) => Dangling_Input_Signal,
       rd_16(60) => Dangling_Input_Signal,
       rd_16(61) => Dangling_Input_Signal,
       rd_16(62) => Dangling_Input_Signal,
       rd_16(63) => Dangling_Input_Signal,
       rd_17(0) => Dangling_Input_Signal,
       rd_17(1) => Dangling_Input_Signal,
       rd_17(2) => Dangling_Input_Signal,
       rd_17(3) => Dangling_Input_Signal,
       rd_17(4) => Dangling_Input_Signal,
       rd_17(5) => Dangling_Input_Signal,
       rd_17(6) => Dangling_Input_Signal,
       rd_17(7) => Dangling_Input_Signal,
       rd_17(8) => Dangling_Input_Signal,
       rd_17(9) => Dangling_Input_Signal,
       rd_17(10) => Dangling_Input_Signal,
       rd_17(11) => Dangling_Input_Signal,
       rd_17(12) => Dangling_Input_Signal,
       rd_17(13) => Dangling_Input_Signal,
       rd_17(14) => Dangling_Input_Signal,
       rd_17(15) => Dangling_Input_Signal,
       rd_17(16) => Dangling_Input_Signal,
       rd_17(17) => Dangling_Input_Signal,
       rd_17(18) => Dangling_Input_Signal,
       rd_17(19) => Dangling_Input_Signal,
       rd_17(20) => Dangling_Input_Signal,
       rd_17(21) => Dangling_Input_Signal,
       rd_17(22) => Dangling_Input_Signal,
       rd_17(23) => Dangling_Input_Signal,
       rd_17(24) => Dangling_Input_Signal,
       rd_17(25) => Dangling_Input_Signal,
       rd_17(26) => Dangling_Input_Signal,
       rd_17(27) => Dangling_Input_Signal,
       rd_17(28) => Dangling_Input_Signal,
       rd_17(29) => Dangling_Input_Signal,
       rd_17(30) => Dangling_Input_Signal,
       rd_17(31) => Dangling_Input_Signal,
       rd_17(32) => Dangling_Input_Signal,
       rd_17(33) => Dangling_Input_Signal,
       rd_17(34) => Dangling_Input_Signal,
       rd_17(35) => Dangling_Input_Signal,
       rd_17(36) => Dangling_Input_Signal,
       rd_17(37) => Dangling_Input_Signal,
       rd_17(38) => Dangling_Input_Signal,
       rd_17(39) => Dangling_Input_Signal,
       rd_17(40) => Dangling_Input_Signal,
       rd_17(41) => Dangling_Input_Signal,
       rd_17(42) => Dangling_Input_Signal,
       rd_17(43) => Dangling_Input_Signal,
       rd_17(44) => Dangling_Input_Signal,
       rd_17(45) => Dangling_Input_Signal,
       rd_17(46) => Dangling_Input_Signal,
       rd_17(47) => Dangling_Input_Signal,
       rd_17(48) => Dangling_Input_Signal,
       rd_17(49) => Dangling_Input_Signal,
       rd_17(50) => Dangling_Input_Signal,
       rd_17(51) => Dangling_Input_Signal,
       rd_17(52) => Dangling_Input_Signal,
       rd_17(53) => Dangling_Input_Signal,
       rd_17(54) => Dangling_Input_Signal,
       rd_17(55) => Dangling_Input_Signal,
       rd_17(56) => Dangling_Input_Signal,
       rd_17(57) => Dangling_Input_Signal,
       rd_17(58) => Dangling_Input_Signal,
       rd_17(59) => Dangling_Input_Signal,
       rd_17(60) => Dangling_Input_Signal,
       rd_17(61) => Dangling_Input_Signal,
       rd_17(62) => Dangling_Input_Signal,
       rd_17(63) => Dangling_Input_Signal,
       rd_18(0) => Dangling_Input_Signal,
       rd_18(1) => Dangling_Input_Signal,
       rd_18(2) => Dangling_Input_Signal,
       rd_18(3) => Dangling_Input_Signal,
       rd_18(4) => Dangling_Input_Signal,
       rd_18(5) => Dangling_Input_Signal,
       rd_18(6) => Dangling_Input_Signal,
       rd_18(7) => Dangling_Input_Signal,
       rd_18(8) => Dangling_Input_Signal,
       rd_18(9) => Dangling_Input_Signal,
       rd_18(10) => Dangling_Input_Signal,
       rd_18(11) => Dangling_Input_Signal,
       rd_18(12) => Dangling_Input_Signal,
       rd_18(13) => Dangling_Input_Signal,
       rd_18(14) => Dangling_Input_Signal,
       rd_18(15) => Dangling_Input_Signal,
       rd_18(16) => Dangling_Input_Signal,
       rd_18(17) => Dangling_Input_Signal,
       rd_18(18) => Dangling_Input_Signal,
       rd_18(19) => Dangling_Input_Signal,
       rd_18(20) => Dangling_Input_Signal,
       rd_18(21) => Dangling_Input_Signal,
       rd_18(22) => Dangling_Input_Signal,
       rd_18(23) => Dangling_Input_Signal,
       rd_18(24) => Dangling_Input_Signal,
       rd_18(25) => Dangling_Input_Signal,
       rd_18(26) => Dangling_Input_Signal,
       rd_18(27) => Dangling_Input_Signal,
       rd_18(28) => Dangling_Input_Signal,
       rd_18(29) => Dangling_Input_Signal,
       rd_18(30) => Dangling_Input_Signal,
       rd_18(31) => Dangling_Input_Signal,
       rd_18(32) => Dangling_Input_Signal,
       rd_18(33) => Dangling_Input_Signal,
       rd_18(34) => Dangling_Input_Signal,
       rd_18(35) => Dangling_Input_Signal,
       rd_18(36) => Dangling_Input_Signal,
       rd_18(37) => Dangling_Input_Signal,
       rd_18(38) => Dangling_Input_Signal,
       rd_18(39) => Dangling_Input_Signal,
       rd_18(40) => Dangling_Input_Signal,
       rd_18(41) => Dangling_Input_Signal,
       rd_18(42) => Dangling_Input_Signal,
       rd_18(43) => Dangling_Input_Signal,
       rd_18(44) => Dangling_Input_Signal,
       rd_18(45) => Dangling_Input_Signal,
       rd_18(46) => Dangling_Input_Signal,
       rd_18(47) => Dangling_Input_Signal,
       rd_18(48) => Dangling_Input_Signal,
       rd_18(49) => Dangling_Input_Signal,
       rd_18(50) => Dangling_Input_Signal,
       rd_18(51) => Dangling_Input_Signal,
       rd_18(52) => Dangling_Input_Signal,
       rd_18(53) => Dangling_Input_Signal,
       rd_18(54) => Dangling_Input_Signal,
       rd_18(55) => Dangling_Input_Signal,
       rd_18(56) => Dangling_Input_Signal,
       rd_18(57) => Dangling_Input_Signal,
       rd_18(58) => Dangling_Input_Signal,
       rd_18(59) => Dangling_Input_Signal,
       rd_18(60) => Dangling_Input_Signal,
       rd_18(61) => Dangling_Input_Signal,
       rd_18(62) => Dangling_Input_Signal,
       rd_18(63) => Dangling_Input_Signal,
       rd_19(0) => Dangling_Input_Signal,
       rd_19(1) => Dangling_Input_Signal,
       rd_19(2) => Dangling_Input_Signal,
       rd_19(3) => Dangling_Input_Signal,
       rd_19(4) => Dangling_Input_Signal,
       rd_19(5) => Dangling_Input_Signal,
       rd_19(6) => Dangling_Input_Signal,
       rd_19(7) => Dangling_Input_Signal,
       rd_19(8) => Dangling_Input_Signal,
       rd_19(9) => Dangling_Input_Signal,
       rd_19(10) => Dangling_Input_Signal,
       rd_19(11) => Dangling_Input_Signal,
       rd_19(12) => Dangling_Input_Signal,
       rd_19(13) => Dangling_Input_Signal,
       rd_19(14) => Dangling_Input_Signal,
       rd_19(15) => Dangling_Input_Signal,
       rd_19(16) => Dangling_Input_Signal,
       rd_19(17) => Dangling_Input_Signal,
       rd_19(18) => Dangling_Input_Signal,
       rd_19(19) => Dangling_Input_Signal,
       rd_19(20) => Dangling_Input_Signal,
       rd_19(21) => Dangling_Input_Signal,
       rd_19(22) => Dangling_Input_Signal,
       rd_19(23) => Dangling_Input_Signal,
       rd_19(24) => Dangling_Input_Signal,
       rd_19(25) => Dangling_Input_Signal,
       rd_19(26) => Dangling_Input_Signal,
       rd_19(27) => Dangling_Input_Signal,
       rd_19(28) => Dangling_Input_Signal,
       rd_19(29) => Dangling_Input_Signal,
       rd_19(30) => Dangling_Input_Signal,
       rd_19(31) => Dangling_Input_Signal,
       rd_19(32) => Dangling_Input_Signal,
       rd_19(33) => Dangling_Input_Signal,
       rd_19(34) => Dangling_Input_Signal,
       rd_19(35) => Dangling_Input_Signal,
       rd_19(36) => Dangling_Input_Signal,
       rd_19(37) => Dangling_Input_Signal,
       rd_19(38) => Dangling_Input_Signal,
       rd_19(39) => Dangling_Input_Signal,
       rd_19(40) => Dangling_Input_Signal,
       rd_19(41) => Dangling_Input_Signal,
       rd_19(42) => Dangling_Input_Signal,
       rd_19(43) => Dangling_Input_Signal,
       rd_19(44) => Dangling_Input_Signal,
       rd_19(45) => Dangling_Input_Signal,
       rd_19(46) => Dangling_Input_Signal,
       rd_19(47) => Dangling_Input_Signal,
       rd_19(48) => Dangling_Input_Signal,
       rd_19(49) => Dangling_Input_Signal,
       rd_19(50) => Dangling_Input_Signal,
       rd_19(51) => Dangling_Input_Signal,
       rd_19(52) => Dangling_Input_Signal,
       rd_19(53) => Dangling_Input_Signal,
       rd_19(54) => Dangling_Input_Signal,
       rd_19(55) => Dangling_Input_Signal,
       rd_19(56) => Dangling_Input_Signal,
       rd_19(57) => Dangling_Input_Signal,
       rd_19(58) => Dangling_Input_Signal,
       rd_19(59) => Dangling_Input_Signal,
       rd_19(60) => Dangling_Input_Signal,
       rd_19(61) => Dangling_Input_Signal,
       rd_19(62) => Dangling_Input_Signal,
       rd_19(63) => Dangling_Input_Signal,
       rd_20(0) => Dangling_Input_Signal,
       rd_20(1) => Dangling_Input_Signal,
       rd_20(2) => Dangling_Input_Signal,
       rd_20(3) => Dangling_Input_Signal,
       rd_20(4) => Dangling_Input_Signal,
       rd_20(5) => Dangling_Input_Signal,
       rd_20(6) => Dangling_Input_Signal,
       rd_20(7) => Dangling_Input_Signal,
       rd_20(8) => Dangling_Input_Signal,
       rd_20(9) => Dangling_Input_Signal,
       rd_20(10) => Dangling_Input_Signal,
       rd_20(11) => Dangling_Input_Signal,
       rd_20(12) => Dangling_Input_Signal,
       rd_20(13) => Dangling_Input_Signal,
       rd_20(14) => Dangling_Input_Signal,
       rd_20(15) => Dangling_Input_Signal,
       rd_20(16) => Dangling_Input_Signal,
       rd_20(17) => Dangling_Input_Signal,
       rd_20(18) => Dangling_Input_Signal,
       rd_20(19) => Dangling_Input_Signal,
       rd_20(20) => Dangling_Input_Signal,
       rd_20(21) => Dangling_Input_Signal,
       rd_20(22) => Dangling_Input_Signal,
       rd_20(23) => Dangling_Input_Signal,
       rd_20(24) => Dangling_Input_Signal,
       rd_20(25) => Dangling_Input_Signal,
       rd_20(26) => Dangling_Input_Signal,
       rd_20(27) => Dangling_Input_Signal,
       rd_20(28) => Dangling_Input_Signal,
       rd_20(29) => Dangling_Input_Signal,
       rd_20(30) => Dangling_Input_Signal,
       rd_20(31) => Dangling_Input_Signal,
       rd_20(32) => Dangling_Input_Signal,
       rd_20(33) => Dangling_Input_Signal,
       rd_20(34) => Dangling_Input_Signal,
       rd_20(35) => Dangling_Input_Signal,
       rd_20(36) => Dangling_Input_Signal,
       rd_20(37) => Dangling_Input_Signal,
       rd_20(38) => Dangling_Input_Signal,
       rd_20(39) => Dangling_Input_Signal,
       rd_20(40) => Dangling_Input_Signal,
       rd_20(41) => Dangling_Input_Signal,
       rd_20(42) => Dangling_Input_Signal,
       rd_20(43) => Dangling_Input_Signal,
       rd_20(44) => Dangling_Input_Signal,
       rd_20(45) => Dangling_Input_Signal,
       rd_20(46) => Dangling_Input_Signal,
       rd_20(47) => Dangling_Input_Signal,
       rd_20(48) => Dangling_Input_Signal,
       rd_20(49) => Dangling_Input_Signal,
       rd_20(50) => Dangling_Input_Signal,
       rd_20(51) => Dangling_Input_Signal,
       rd_20(52) => Dangling_Input_Signal,
       rd_20(53) => Dangling_Input_Signal,
       rd_20(54) => Dangling_Input_Signal,
       rd_20(55) => Dangling_Input_Signal,
       rd_20(56) => Dangling_Input_Signal,
       rd_20(57) => Dangling_Input_Signal,
       rd_20(58) => Dangling_Input_Signal,
       rd_20(59) => Dangling_Input_Signal,
       rd_20(60) => Dangling_Input_Signal,
       rd_20(61) => Dangling_Input_Signal,
       rd_20(62) => Dangling_Input_Signal,
       rd_20(63) => Dangling_Input_Signal,
       rd_21(0) => Dangling_Input_Signal,
       rd_21(1) => Dangling_Input_Signal,
       rd_21(2) => Dangling_Input_Signal,
       rd_21(3) => Dangling_Input_Signal,
       rd_21(4) => Dangling_Input_Signal,
       rd_21(5) => Dangling_Input_Signal,
       rd_21(6) => Dangling_Input_Signal,
       rd_21(7) => Dangling_Input_Signal,
       rd_21(8) => Dangling_Input_Signal,
       rd_21(9) => Dangling_Input_Signal,
       rd_21(10) => Dangling_Input_Signal,
       rd_21(11) => Dangling_Input_Signal,
       rd_21(12) => Dangling_Input_Signal,
       rd_21(13) => Dangling_Input_Signal,
       rd_21(14) => Dangling_Input_Signal,
       rd_21(15) => Dangling_Input_Signal,
       rd_21(16) => Dangling_Input_Signal,
       rd_21(17) => Dangling_Input_Signal,
       rd_21(18) => Dangling_Input_Signal,
       rd_21(19) => Dangling_Input_Signal,
       rd_21(20) => Dangling_Input_Signal,
       rd_21(21) => Dangling_Input_Signal,
       rd_21(22) => Dangling_Input_Signal,
       rd_21(23) => Dangling_Input_Signal,
       rd_21(24) => Dangling_Input_Signal,
       rd_21(25) => Dangling_Input_Signal,
       rd_21(26) => Dangling_Input_Signal,
       rd_21(27) => Dangling_Input_Signal,
       rd_21(28) => Dangling_Input_Signal,
       rd_21(29) => Dangling_Input_Signal,
       rd_21(30) => Dangling_Input_Signal,
       rd_21(31) => Dangling_Input_Signal,
       rd_21(32) => Dangling_Input_Signal,
       rd_21(33) => Dangling_Input_Signal,
       rd_21(34) => Dangling_Input_Signal,
       rd_21(35) => Dangling_Input_Signal,
       rd_21(36) => Dangling_Input_Signal,
       rd_21(37) => Dangling_Input_Signal,
       rd_21(38) => Dangling_Input_Signal,
       rd_21(39) => Dangling_Input_Signal,
       rd_21(40) => Dangling_Input_Signal,
       rd_21(41) => Dangling_Input_Signal,
       rd_21(42) => Dangling_Input_Signal,
       rd_21(43) => Dangling_Input_Signal,
       rd_21(44) => Dangling_Input_Signal,
       rd_21(45) => Dangling_Input_Signal,
       rd_21(46) => Dangling_Input_Signal,
       rd_21(47) => Dangling_Input_Signal,
       rd_21(48) => Dangling_Input_Signal,
       rd_21(49) => Dangling_Input_Signal,
       rd_21(50) => Dangling_Input_Signal,
       rd_21(51) => Dangling_Input_Signal,
       rd_21(52) => Dangling_Input_Signal,
       rd_21(53) => Dangling_Input_Signal,
       rd_21(54) => Dangling_Input_Signal,
       rd_21(55) => Dangling_Input_Signal,
       rd_21(56) => Dangling_Input_Signal,
       rd_21(57) => Dangling_Input_Signal,
       rd_21(58) => Dangling_Input_Signal,
       rd_21(59) => Dangling_Input_Signal,
       rd_21(60) => Dangling_Input_Signal,
       rd_21(61) => Dangling_Input_Signal,
       rd_21(62) => Dangling_Input_Signal,
       rd_21(63) => Dangling_Input_Signal,
       rd_22(0) => Dangling_Input_Signal,
       rd_22(1) => Dangling_Input_Signal,
       rd_22(2) => Dangling_Input_Signal,
       rd_22(3) => Dangling_Input_Signal,
       rd_22(4) => Dangling_Input_Signal,
       rd_22(5) => Dangling_Input_Signal,
       rd_22(6) => Dangling_Input_Signal,
       rd_22(7) => Dangling_Input_Signal,
       rd_22(8) => Dangling_Input_Signal,
       rd_22(9) => Dangling_Input_Signal,
       rd_22(10) => Dangling_Input_Signal,
       rd_22(11) => Dangling_Input_Signal,
       rd_22(12) => Dangling_Input_Signal,
       rd_22(13) => Dangling_Input_Signal,
       rd_22(14) => Dangling_Input_Signal,
       rd_22(15) => Dangling_Input_Signal,
       rd_22(16) => Dangling_Input_Signal,
       rd_22(17) => Dangling_Input_Signal,
       rd_22(18) => Dangling_Input_Signal,
       rd_22(19) => Dangling_Input_Signal,
       rd_22(20) => Dangling_Input_Signal,
       rd_22(21) => Dangling_Input_Signal,
       rd_22(22) => Dangling_Input_Signal,
       rd_22(23) => Dangling_Input_Signal,
       rd_22(24) => Dangling_Input_Signal,
       rd_22(25) => Dangling_Input_Signal,
       rd_22(26) => Dangling_Input_Signal,
       rd_22(27) => Dangling_Input_Signal,
       rd_22(28) => Dangling_Input_Signal,
       rd_22(29) => Dangling_Input_Signal,
       rd_22(30) => Dangling_Input_Signal,
       rd_22(31) => Dangling_Input_Signal,
       rd_22(32) => Dangling_Input_Signal,
       rd_22(33) => Dangling_Input_Signal,
       rd_22(34) => Dangling_Input_Signal,
       rd_22(35) => Dangling_Input_Signal,
       rd_22(36) => Dangling_Input_Signal,
       rd_22(37) => Dangling_Input_Signal,
       rd_22(38) => Dangling_Input_Signal,
       rd_22(39) => Dangling_Input_Signal,
       rd_22(40) => Dangling_Input_Signal,
       rd_22(41) => Dangling_Input_Signal,
       rd_22(42) => Dangling_Input_Signal,
       rd_22(43) => Dangling_Input_Signal,
       rd_22(44) => Dangling_Input_Signal,
       rd_22(45) => Dangling_Input_Signal,
       rd_22(46) => Dangling_Input_Signal,
       rd_22(47) => Dangling_Input_Signal,
       rd_22(48) => Dangling_Input_Signal,
       rd_22(49) => Dangling_Input_Signal,
       rd_22(50) => Dangling_Input_Signal,
       rd_22(51) => Dangling_Input_Signal,
       rd_22(52) => Dangling_Input_Signal,
       rd_22(53) => Dangling_Input_Signal,
       rd_22(54) => Dangling_Input_Signal,
       rd_22(55) => Dangling_Input_Signal,
       rd_22(56) => Dangling_Input_Signal,
       rd_22(57) => Dangling_Input_Signal,
       rd_22(58) => Dangling_Input_Signal,
       rd_22(59) => Dangling_Input_Signal,
       rd_22(60) => Dangling_Input_Signal,
       rd_22(61) => Dangling_Input_Signal,
       rd_22(62) => Dangling_Input_Signal,
       rd_22(63) => Dangling_Input_Signal,
       rd_23(0) => Dangling_Input_Signal,
       rd_23(1) => Dangling_Input_Signal,
       rd_23(2) => Dangling_Input_Signal,
       rd_23(3) => Dangling_Input_Signal,
       rd_23(4) => Dangling_Input_Signal,
       rd_23(5) => Dangling_Input_Signal,
       rd_23(6) => Dangling_Input_Signal,
       rd_23(7) => Dangling_Input_Signal,
       rd_23(8) => Dangling_Input_Signal,
       rd_23(9) => Dangling_Input_Signal,
       rd_23(10) => Dangling_Input_Signal,
       rd_23(11) => Dangling_Input_Signal,
       rd_23(12) => Dangling_Input_Signal,
       rd_23(13) => Dangling_Input_Signal,
       rd_23(14) => Dangling_Input_Signal,
       rd_23(15) => Dangling_Input_Signal,
       rd_23(16) => Dangling_Input_Signal,
       rd_23(17) => Dangling_Input_Signal,
       rd_23(18) => Dangling_Input_Signal,
       rd_23(19) => Dangling_Input_Signal,
       rd_23(20) => Dangling_Input_Signal,
       rd_23(21) => Dangling_Input_Signal,
       rd_23(22) => Dangling_Input_Signal,
       rd_23(23) => Dangling_Input_Signal,
       rd_23(24) => Dangling_Input_Signal,
       rd_23(25) => Dangling_Input_Signal,
       rd_23(26) => Dangling_Input_Signal,
       rd_23(27) => Dangling_Input_Signal,
       rd_23(28) => Dangling_Input_Signal,
       rd_23(29) => Dangling_Input_Signal,
       rd_23(30) => Dangling_Input_Signal,
       rd_23(31) => Dangling_Input_Signal,
       rd_23(32) => Dangling_Input_Signal,
       rd_23(33) => Dangling_Input_Signal,
       rd_23(34) => Dangling_Input_Signal,
       rd_23(35) => Dangling_Input_Signal,
       rd_23(36) => Dangling_Input_Signal,
       rd_23(37) => Dangling_Input_Signal,
       rd_23(38) => Dangling_Input_Signal,
       rd_23(39) => Dangling_Input_Signal,
       rd_23(40) => Dangling_Input_Signal,
       rd_23(41) => Dangling_Input_Signal,
       rd_23(42) => Dangling_Input_Signal,
       rd_23(43) => Dangling_Input_Signal,
       rd_23(44) => Dangling_Input_Signal,
       rd_23(45) => Dangling_Input_Signal,
       rd_23(46) => Dangling_Input_Signal,
       rd_23(47) => Dangling_Input_Signal,
       rd_23(48) => Dangling_Input_Signal,
       rd_23(49) => Dangling_Input_Signal,
       rd_23(50) => Dangling_Input_Signal,
       rd_23(51) => Dangling_Input_Signal,
       rd_23(52) => Dangling_Input_Signal,
       rd_23(53) => Dangling_Input_Signal,
       rd_23(54) => Dangling_Input_Signal,
       rd_23(55) => Dangling_Input_Signal,
       rd_23(56) => Dangling_Input_Signal,
       rd_23(57) => Dangling_Input_Signal,
       rd_23(58) => Dangling_Input_Signal,
       rd_23(59) => Dangling_Input_Signal,
       rd_23(60) => Dangling_Input_Signal,
       rd_23(61) => Dangling_Input_Signal,
       rd_23(62) => Dangling_Input_Signal,
       rd_23(63) => Dangling_Input_Signal,
       rd_24(0) => Dangling_Input_Signal,
       rd_24(1) => Dangling_Input_Signal,
       rd_24(2) => Dangling_Input_Signal,
       rd_24(3) => Dangling_Input_Signal,
       rd_24(4) => Dangling_Input_Signal,
       rd_24(5) => Dangling_Input_Signal,
       rd_24(6) => Dangling_Input_Signal,
       rd_24(7) => Dangling_Input_Signal,
       rd_24(8) => Dangling_Input_Signal,
       rd_24(9) => Dangling_Input_Signal,
       rd_24(10) => Dangling_Input_Signal,
       rd_24(11) => Dangling_Input_Signal,
       rd_24(12) => Dangling_Input_Signal,
       rd_24(13) => Dangling_Input_Signal,
       rd_24(14) => Dangling_Input_Signal,
       rd_24(15) => Dangling_Input_Signal,
       rd_24(16) => Dangling_Input_Signal,
       rd_24(17) => Dangling_Input_Signal,
       rd_24(18) => Dangling_Input_Signal,
       rd_24(19) => Dangling_Input_Signal,
       rd_24(20) => Dangling_Input_Signal,
       rd_24(21) => Dangling_Input_Signal,
       rd_24(22) => Dangling_Input_Signal,
       rd_24(23) => Dangling_Input_Signal,
       rd_24(24) => Dangling_Input_Signal,
       rd_24(25) => Dangling_Input_Signal,
       rd_24(26) => Dangling_Input_Signal,
       rd_24(27) => Dangling_Input_Signal,
       rd_24(28) => Dangling_Input_Signal,
       rd_24(29) => Dangling_Input_Signal,
       rd_24(30) => Dangling_Input_Signal,
       rd_24(31) => Dangling_Input_Signal,
       rd_24(32) => Dangling_Input_Signal,
       rd_24(33) => Dangling_Input_Signal,
       rd_24(34) => Dangling_Input_Signal,
       rd_24(35) => Dangling_Input_Signal,
       rd_24(36) => Dangling_Input_Signal,
       rd_24(37) => Dangling_Input_Signal,
       rd_24(38) => Dangling_Input_Signal,
       rd_24(39) => Dangling_Input_Signal,
       rd_24(40) => Dangling_Input_Signal,
       rd_24(41) => Dangling_Input_Signal,
       rd_24(42) => Dangling_Input_Signal,
       rd_24(43) => Dangling_Input_Signal,
       rd_24(44) => Dangling_Input_Signal,
       rd_24(45) => Dangling_Input_Signal,
       rd_24(46) => Dangling_Input_Signal,
       rd_24(47) => Dangling_Input_Signal,
       rd_24(48) => Dangling_Input_Signal,
       rd_24(49) => Dangling_Input_Signal,
       rd_24(50) => Dangling_Input_Signal,
       rd_24(51) => Dangling_Input_Signal,
       rd_24(52) => Dangling_Input_Signal,
       rd_24(53) => Dangling_Input_Signal,
       rd_24(54) => Dangling_Input_Signal,
       rd_24(55) => Dangling_Input_Signal,
       rd_24(56) => Dangling_Input_Signal,
       rd_24(57) => Dangling_Input_Signal,
       rd_24(58) => Dangling_Input_Signal,
       rd_24(59) => Dangling_Input_Signal,
       rd_24(60) => Dangling_Input_Signal,
       rd_24(61) => Dangling_Input_Signal,
       rd_24(62) => Dangling_Input_Signal,
       rd_24(63) => Dangling_Input_Signal,
       rd_25(0) => Dangling_Input_Signal,
       rd_25(1) => Dangling_Input_Signal,
       rd_25(2) => Dangling_Input_Signal,
       rd_25(3) => Dangling_Input_Signal,
       rd_25(4) => Dangling_Input_Signal,
       rd_25(5) => Dangling_Input_Signal,
       rd_25(6) => Dangling_Input_Signal,
       rd_25(7) => Dangling_Input_Signal,
       rd_25(8) => Dangling_Input_Signal,
       rd_25(9) => Dangling_Input_Signal,
       rd_25(10) => Dangling_Input_Signal,
       rd_25(11) => Dangling_Input_Signal,
       rd_25(12) => Dangling_Input_Signal,
       rd_25(13) => Dangling_Input_Signal,
       rd_25(14) => Dangling_Input_Signal,
       rd_25(15) => Dangling_Input_Signal,
       rd_25(16) => Dangling_Input_Signal,
       rd_25(17) => Dangling_Input_Signal,
       rd_25(18) => Dangling_Input_Signal,
       rd_25(19) => Dangling_Input_Signal,
       rd_25(20) => Dangling_Input_Signal,
       rd_25(21) => Dangling_Input_Signal,
       rd_25(22) => Dangling_Input_Signal,
       rd_25(23) => Dangling_Input_Signal,
       rd_25(24) => Dangling_Input_Signal,
       rd_25(25) => Dangling_Input_Signal,
       rd_25(26) => Dangling_Input_Signal,
       rd_25(27) => Dangling_Input_Signal,
       rd_25(28) => Dangling_Input_Signal,
       rd_25(29) => Dangling_Input_Signal,
       rd_25(30) => Dangling_Input_Signal,
       rd_25(31) => Dangling_Input_Signal,
       rd_25(32) => Dangling_Input_Signal,
       rd_25(33) => Dangling_Input_Signal,
       rd_25(34) => Dangling_Input_Signal,
       rd_25(35) => Dangling_Input_Signal,
       rd_25(36) => Dangling_Input_Signal,
       rd_25(37) => Dangling_Input_Signal,
       rd_25(38) => Dangling_Input_Signal,
       rd_25(39) => Dangling_Input_Signal,
       rd_25(40) => Dangling_Input_Signal,
       rd_25(41) => Dangling_Input_Signal,
       rd_25(42) => Dangling_Input_Signal,
       rd_25(43) => Dangling_Input_Signal,
       rd_25(44) => Dangling_Input_Signal,
       rd_25(45) => Dangling_Input_Signal,
       rd_25(46) => Dangling_Input_Signal,
       rd_25(47) => Dangling_Input_Signal,
       rd_25(48) => Dangling_Input_Signal,
       rd_25(49) => Dangling_Input_Signal,
       rd_25(50) => Dangling_Input_Signal,
       rd_25(51) => Dangling_Input_Signal,
       rd_25(52) => Dangling_Input_Signal,
       rd_25(53) => Dangling_Input_Signal,
       rd_25(54) => Dangling_Input_Signal,
       rd_25(55) => Dangling_Input_Signal,
       rd_25(56) => Dangling_Input_Signal,
       rd_25(57) => Dangling_Input_Signal,
       rd_25(58) => Dangling_Input_Signal,
       rd_25(59) => Dangling_Input_Signal,
       rd_25(60) => Dangling_Input_Signal,
       rd_25(61) => Dangling_Input_Signal,
       rd_25(62) => Dangling_Input_Signal,
       rd_25(63) => Dangling_Input_Signal,
       rd_26(0) => Dangling_Input_Signal,
       rd_26(1) => Dangling_Input_Signal,
       rd_26(2) => Dangling_Input_Signal,
       rd_26(3) => Dangling_Input_Signal,
       rd_26(4) => Dangling_Input_Signal,
       rd_26(5) => Dangling_Input_Signal,
       rd_26(6) => Dangling_Input_Signal,
       rd_26(7) => Dangling_Input_Signal,
       rd_26(8) => Dangling_Input_Signal,
       rd_26(9) => Dangling_Input_Signal,
       rd_26(10) => Dangling_Input_Signal,
       rd_26(11) => Dangling_Input_Signal,
       rd_26(12) => Dangling_Input_Signal,
       rd_26(13) => Dangling_Input_Signal,
       rd_26(14) => Dangling_Input_Signal,
       rd_26(15) => Dangling_Input_Signal,
       rd_26(16) => Dangling_Input_Signal,
       rd_26(17) => Dangling_Input_Signal,
       rd_26(18) => Dangling_Input_Signal,
       rd_26(19) => Dangling_Input_Signal,
       rd_26(20) => Dangling_Input_Signal,
       rd_26(21) => Dangling_Input_Signal,
       rd_26(22) => Dangling_Input_Signal,
       rd_26(23) => Dangling_Input_Signal,
       rd_26(24) => Dangling_Input_Signal,
       rd_26(25) => Dangling_Input_Signal,
       rd_26(26) => Dangling_Input_Signal,
       rd_26(27) => Dangling_Input_Signal,
       rd_26(28) => Dangling_Input_Signal,
       rd_26(29) => Dangling_Input_Signal,
       rd_26(30) => Dangling_Input_Signal,
       rd_26(31) => Dangling_Input_Signal,
       rd_26(32) => Dangling_Input_Signal,
       rd_26(33) => Dangling_Input_Signal,
       rd_26(34) => Dangling_Input_Signal,
       rd_26(35) => Dangling_Input_Signal,
       rd_26(36) => Dangling_Input_Signal,
       rd_26(37) => Dangling_Input_Signal,
       rd_26(38) => Dangling_Input_Signal,
       rd_26(39) => Dangling_Input_Signal,
       rd_26(40) => Dangling_Input_Signal,
       rd_26(41) => Dangling_Input_Signal,
       rd_26(42) => Dangling_Input_Signal,
       rd_26(43) => Dangling_Input_Signal,
       rd_26(44) => Dangling_Input_Signal,
       rd_26(45) => Dangling_Input_Signal,
       rd_26(46) => Dangling_Input_Signal,
       rd_26(47) => Dangling_Input_Signal,
       rd_26(48) => Dangling_Input_Signal,
       rd_26(49) => Dangling_Input_Signal,
       rd_26(50) => Dangling_Input_Signal,
       rd_26(51) => Dangling_Input_Signal,
       rd_26(52) => Dangling_Input_Signal,
       rd_26(53) => Dangling_Input_Signal,
       rd_26(54) => Dangling_Input_Signal,
       rd_26(55) => Dangling_Input_Signal,
       rd_26(56) => Dangling_Input_Signal,
       rd_26(57) => Dangling_Input_Signal,
       rd_26(58) => Dangling_Input_Signal,
       rd_26(59) => Dangling_Input_Signal,
       rd_26(60) => Dangling_Input_Signal,
       rd_26(61) => Dangling_Input_Signal,
       rd_26(62) => Dangling_Input_Signal,
       rd_26(63) => Dangling_Input_Signal,
       rd_27(0) => Dangling_Input_Signal,
       rd_27(1) => Dangling_Input_Signal,
       rd_27(2) => Dangling_Input_Signal,
       rd_27(3) => Dangling_Input_Signal,
       rd_27(4) => Dangling_Input_Signal,
       rd_27(5) => Dangling_Input_Signal,
       rd_27(6) => Dangling_Input_Signal,
       rd_27(7) => Dangling_Input_Signal,
       rd_27(8) => Dangling_Input_Signal,
       rd_27(9) => Dangling_Input_Signal,
       rd_27(10) => Dangling_Input_Signal,
       rd_27(11) => Dangling_Input_Signal,
       rd_27(12) => Dangling_Input_Signal,
       rd_27(13) => Dangling_Input_Signal,
       rd_27(14) => Dangling_Input_Signal,
       rd_27(15) => Dangling_Input_Signal,
       rd_27(16) => Dangling_Input_Signal,
       rd_27(17) => Dangling_Input_Signal,
       rd_27(18) => Dangling_Input_Signal,
       rd_27(19) => Dangling_Input_Signal,
       rd_27(20) => Dangling_Input_Signal,
       rd_27(21) => Dangling_Input_Signal,
       rd_27(22) => Dangling_Input_Signal,
       rd_27(23) => Dangling_Input_Signal,
       rd_27(24) => Dangling_Input_Signal,
       rd_27(25) => Dangling_Input_Signal,
       rd_27(26) => Dangling_Input_Signal,
       rd_27(27) => Dangling_Input_Signal,
       rd_27(28) => Dangling_Input_Signal,
       rd_27(29) => Dangling_Input_Signal,
       rd_27(30) => Dangling_Input_Signal,
       rd_27(31) => Dangling_Input_Signal,
       rd_27(32) => Dangling_Input_Signal,
       rd_27(33) => Dangling_Input_Signal,
       rd_27(34) => Dangling_Input_Signal,
       rd_27(35) => Dangling_Input_Signal,
       rd_27(36) => Dangling_Input_Signal,
       rd_27(37) => Dangling_Input_Signal,
       rd_27(38) => Dangling_Input_Signal,
       rd_27(39) => Dangling_Input_Signal,
       rd_27(40) => Dangling_Input_Signal,
       rd_27(41) => Dangling_Input_Signal,
       rd_27(42) => Dangling_Input_Signal,
       rd_27(43) => Dangling_Input_Signal,
       rd_27(44) => Dangling_Input_Signal,
       rd_27(45) => Dangling_Input_Signal,
       rd_27(46) => Dangling_Input_Signal,
       rd_27(47) => Dangling_Input_Signal,
       rd_27(48) => Dangling_Input_Signal,
       rd_27(49) => Dangling_Input_Signal,
       rd_27(50) => Dangling_Input_Signal,
       rd_27(51) => Dangling_Input_Signal,
       rd_27(52) => Dangling_Input_Signal,
       rd_27(53) => Dangling_Input_Signal,
       rd_27(54) => Dangling_Input_Signal,
       rd_27(55) => Dangling_Input_Signal,
       rd_27(56) => Dangling_Input_Signal,
       rd_27(57) => Dangling_Input_Signal,
       rd_27(58) => Dangling_Input_Signal,
       rd_27(59) => Dangling_Input_Signal,
       rd_27(60) => Dangling_Input_Signal,
       rd_27(61) => Dangling_Input_Signal,
       rd_27(62) => Dangling_Input_Signal,
       rd_27(63) => Dangling_Input_Signal,
       rd_28(0) => Dangling_Input_Signal,
       rd_28(1) => Dangling_Input_Signal,
       rd_28(2) => Dangling_Input_Signal,
       rd_28(3) => Dangling_Input_Signal,
       rd_28(4) => Dangling_Input_Signal,
       rd_28(5) => Dangling_Input_Signal,
       rd_28(6) => Dangling_Input_Signal,
       rd_28(7) => Dangling_Input_Signal,
       rd_28(8) => Dangling_Input_Signal,
       rd_28(9) => Dangling_Input_Signal,
       rd_28(10) => Dangling_Input_Signal,
       rd_28(11) => Dangling_Input_Signal,
       rd_28(12) => Dangling_Input_Signal,
       rd_28(13) => Dangling_Input_Signal,
       rd_28(14) => Dangling_Input_Signal,
       rd_28(15) => Dangling_Input_Signal,
       rd_28(16) => Dangling_Input_Signal,
       rd_28(17) => Dangling_Input_Signal,
       rd_28(18) => Dangling_Input_Signal,
       rd_28(19) => Dangling_Input_Signal,
       rd_28(20) => Dangling_Input_Signal,
       rd_28(21) => Dangling_Input_Signal,
       rd_28(22) => Dangling_Input_Signal,
       rd_28(23) => Dangling_Input_Signal,
       rd_28(24) => Dangling_Input_Signal,
       rd_28(25) => Dangling_Input_Signal,
       rd_28(26) => Dangling_Input_Signal,
       rd_28(27) => Dangling_Input_Signal,
       rd_28(28) => Dangling_Input_Signal,
       rd_28(29) => Dangling_Input_Signal,
       rd_28(30) => Dangling_Input_Signal,
       rd_28(31) => Dangling_Input_Signal,
       rd_28(32) => Dangling_Input_Signal,
       rd_28(33) => Dangling_Input_Signal,
       rd_28(34) => Dangling_Input_Signal,
       rd_28(35) => Dangling_Input_Signal,
       rd_28(36) => Dangling_Input_Signal,
       rd_28(37) => Dangling_Input_Signal,
       rd_28(38) => Dangling_Input_Signal,
       rd_28(39) => Dangling_Input_Signal,
       rd_28(40) => Dangling_Input_Signal,
       rd_28(41) => Dangling_Input_Signal,
       rd_28(42) => Dangling_Input_Signal,
       rd_28(43) => Dangling_Input_Signal,
       rd_28(44) => Dangling_Input_Signal,
       rd_28(45) => Dangling_Input_Signal,
       rd_28(46) => Dangling_Input_Signal,
       rd_28(47) => Dangling_Input_Signal,
       rd_28(48) => Dangling_Input_Signal,
       rd_28(49) => Dangling_Input_Signal,
       rd_28(50) => Dangling_Input_Signal,
       rd_28(51) => Dangling_Input_Signal,
       rd_28(52) => Dangling_Input_Signal,
       rd_28(53) => Dangling_Input_Signal,
       rd_28(54) => Dangling_Input_Signal,
       rd_28(55) => Dangling_Input_Signal,
       rd_28(56) => Dangling_Input_Signal,
       rd_28(57) => Dangling_Input_Signal,
       rd_28(58) => Dangling_Input_Signal,
       rd_28(59) => Dangling_Input_Signal,
       rd_28(60) => Dangling_Input_Signal,
       rd_28(61) => Dangling_Input_Signal,
       rd_28(62) => Dangling_Input_Signal,
       rd_28(63) => Dangling_Input_Signal,
       rd_29(0) => Dangling_Input_Signal,
       rd_29(1) => Dangling_Input_Signal,
       rd_29(2) => Dangling_Input_Signal,
       rd_29(3) => Dangling_Input_Signal,
       rd_29(4) => Dangling_Input_Signal,
       rd_29(5) => Dangling_Input_Signal,
       rd_29(6) => Dangling_Input_Signal,
       rd_29(7) => Dangling_Input_Signal,
       rd_29(8) => Dangling_Input_Signal,
       rd_29(9) => Dangling_Input_Signal,
       rd_29(10) => Dangling_Input_Signal,
       rd_29(11) => Dangling_Input_Signal,
       rd_29(12) => Dangling_Input_Signal,
       rd_29(13) => Dangling_Input_Signal,
       rd_29(14) => Dangling_Input_Signal,
       rd_29(15) => Dangling_Input_Signal,
       rd_29(16) => Dangling_Input_Signal,
       rd_29(17) => Dangling_Input_Signal,
       rd_29(18) => Dangling_Input_Signal,
       rd_29(19) => Dangling_Input_Signal,
       rd_29(20) => Dangling_Input_Signal,
       rd_29(21) => Dangling_Input_Signal,
       rd_29(22) => Dangling_Input_Signal,
       rd_29(23) => Dangling_Input_Signal,
       rd_29(24) => Dangling_Input_Signal,
       rd_29(25) => Dangling_Input_Signal,
       rd_29(26) => Dangling_Input_Signal,
       rd_29(27) => Dangling_Input_Signal,
       rd_29(28) => Dangling_Input_Signal,
       rd_29(29) => Dangling_Input_Signal,
       rd_29(30) => Dangling_Input_Signal,
       rd_29(31) => Dangling_Input_Signal,
       rd_29(32) => Dangling_Input_Signal,
       rd_29(33) => Dangling_Input_Signal,
       rd_29(34) => Dangling_Input_Signal,
       rd_29(35) => Dangling_Input_Signal,
       rd_29(36) => Dangling_Input_Signal,
       rd_29(37) => Dangling_Input_Signal,
       rd_29(38) => Dangling_Input_Signal,
       rd_29(39) => Dangling_Input_Signal,
       rd_29(40) => Dangling_Input_Signal,
       rd_29(41) => Dangling_Input_Signal,
       rd_29(42) => Dangling_Input_Signal,
       rd_29(43) => Dangling_Input_Signal,
       rd_29(44) => Dangling_Input_Signal,
       rd_29(45) => Dangling_Input_Signal,
       rd_29(46) => Dangling_Input_Signal,
       rd_29(47) => Dangling_Input_Signal,
       rd_29(48) => Dangling_Input_Signal,
       rd_29(49) => Dangling_Input_Signal,
       rd_29(50) => Dangling_Input_Signal,
       rd_29(51) => Dangling_Input_Signal,
       rd_29(52) => Dangling_Input_Signal,
       rd_29(53) => Dangling_Input_Signal,
       rd_29(54) => Dangling_Input_Signal,
       rd_29(55) => Dangling_Input_Signal,
       rd_29(56) => Dangling_Input_Signal,
       rd_29(57) => Dangling_Input_Signal,
       rd_29(58) => Dangling_Input_Signal,
       rd_29(59) => Dangling_Input_Signal,
       rd_29(60) => Dangling_Input_Signal,
       rd_29(61) => Dangling_Input_Signal,
       rd_29(62) => Dangling_Input_Signal,
       rd_29(63) => Dangling_Input_Signal,
       rd_3(0) => Dangling_Input_Signal,
       rd_3(1) => Dangling_Input_Signal,
       rd_3(2) => Dangling_Input_Signal,
       rd_3(3) => Dangling_Input_Signal,
       rd_3(4) => Dangling_Input_Signal,
       rd_3(5) => Dangling_Input_Signal,
       rd_3(6) => Dangling_Input_Signal,
       rd_3(7) => Dangling_Input_Signal,
       rd_3(8) => Dangling_Input_Signal,
       rd_3(9) => Dangling_Input_Signal,
       rd_3(10) => Dangling_Input_Signal,
       rd_3(11) => Dangling_Input_Signal,
       rd_3(12) => Dangling_Input_Signal,
       rd_3(13) => Dangling_Input_Signal,
       rd_3(14) => Dangling_Input_Signal,
       rd_3(15) => Dangling_Input_Signal,
       rd_3(16) => Dangling_Input_Signal,
       rd_3(17) => Dangling_Input_Signal,
       rd_3(18) => Dangling_Input_Signal,
       rd_3(19) => Dangling_Input_Signal,
       rd_3(20) => Dangling_Input_Signal,
       rd_3(21) => Dangling_Input_Signal,
       rd_3(22) => Dangling_Input_Signal,
       rd_3(23) => Dangling_Input_Signal,
       rd_3(24) => Dangling_Input_Signal,
       rd_3(25) => Dangling_Input_Signal,
       rd_3(26) => Dangling_Input_Signal,
       rd_3(27) => Dangling_Input_Signal,
       rd_3(28) => Dangling_Input_Signal,
       rd_3(29) => Dangling_Input_Signal,
       rd_3(30) => Dangling_Input_Signal,
       rd_3(31) => Dangling_Input_Signal,
       rd_3(32) => Dangling_Input_Signal,
       rd_3(33) => Dangling_Input_Signal,
       rd_3(34) => Dangling_Input_Signal,
       rd_3(35) => Dangling_Input_Signal,
       rd_3(36) => Dangling_Input_Signal,
       rd_3(37) => Dangling_Input_Signal,
       rd_3(38) => Dangling_Input_Signal,
       rd_3(39) => Dangling_Input_Signal,
       rd_3(40) => Dangling_Input_Signal,
       rd_3(41) => Dangling_Input_Signal,
       rd_3(42) => Dangling_Input_Signal,
       rd_3(43) => Dangling_Input_Signal,
       rd_3(44) => Dangling_Input_Signal,
       rd_3(45) => Dangling_Input_Signal,
       rd_3(46) => Dangling_Input_Signal,
       rd_3(47) => Dangling_Input_Signal,
       rd_3(48) => Dangling_Input_Signal,
       rd_3(49) => Dangling_Input_Signal,
       rd_3(50) => Dangling_Input_Signal,
       rd_3(51) => Dangling_Input_Signal,
       rd_3(52) => Dangling_Input_Signal,
       rd_3(53) => Dangling_Input_Signal,
       rd_3(54) => Dangling_Input_Signal,
       rd_3(55) => Dangling_Input_Signal,
       rd_3(56) => Dangling_Input_Signal,
       rd_3(57) => Dangling_Input_Signal,
       rd_3(58) => Dangling_Input_Signal,
       rd_3(59) => Dangling_Input_Signal,
       rd_3(60) => Dangling_Input_Signal,
       rd_3(61) => Dangling_Input_Signal,
       rd_3(62) => Dangling_Input_Signal,
       rd_3(63) => Dangling_Input_Signal,
       rd_30(0) => Dangling_Input_Signal,
       rd_30(1) => Dangling_Input_Signal,
       rd_30(2) => Dangling_Input_Signal,
       rd_30(3) => Dangling_Input_Signal,
       rd_30(4) => Dangling_Input_Signal,
       rd_30(5) => Dangling_Input_Signal,
       rd_30(6) => Dangling_Input_Signal,
       rd_30(7) => Dangling_Input_Signal,
       rd_30(8) => Dangling_Input_Signal,
       rd_30(9) => Dangling_Input_Signal,
       rd_30(10) => Dangling_Input_Signal,
       rd_30(11) => Dangling_Input_Signal,
       rd_30(12) => Dangling_Input_Signal,
       rd_30(13) => Dangling_Input_Signal,
       rd_30(14) => Dangling_Input_Signal,
       rd_30(15) => Dangling_Input_Signal,
       rd_30(16) => Dangling_Input_Signal,
       rd_30(17) => Dangling_Input_Signal,
       rd_30(18) => Dangling_Input_Signal,
       rd_30(19) => Dangling_Input_Signal,
       rd_30(20) => Dangling_Input_Signal,
       rd_30(21) => Dangling_Input_Signal,
       rd_30(22) => Dangling_Input_Signal,
       rd_30(23) => Dangling_Input_Signal,
       rd_30(24) => Dangling_Input_Signal,
       rd_30(25) => Dangling_Input_Signal,
       rd_30(26) => Dangling_Input_Signal,
       rd_30(27) => Dangling_Input_Signal,
       rd_30(28) => Dangling_Input_Signal,
       rd_30(29) => Dangling_Input_Signal,
       rd_30(30) => Dangling_Input_Signal,
       rd_30(31) => Dangling_Input_Signal,
       rd_30(32) => Dangling_Input_Signal,
       rd_30(33) => Dangling_Input_Signal,
       rd_30(34) => Dangling_Input_Signal,
       rd_30(35) => Dangling_Input_Signal,
       rd_30(36) => Dangling_Input_Signal,
       rd_30(37) => Dangling_Input_Signal,
       rd_30(38) => Dangling_Input_Signal,
       rd_30(39) => Dangling_Input_Signal,
       rd_30(40) => Dangling_Input_Signal,
       rd_30(41) => Dangling_Input_Signal,
       rd_30(42) => Dangling_Input_Signal,
       rd_30(43) => Dangling_Input_Signal,
       rd_30(44) => Dangling_Input_Signal,
       rd_30(45) => Dangling_Input_Signal,
       rd_30(46) => Dangling_Input_Signal,
       rd_30(47) => Dangling_Input_Signal,
       rd_30(48) => Dangling_Input_Signal,
       rd_30(49) => Dangling_Input_Signal,
       rd_30(50) => Dangling_Input_Signal,
       rd_30(51) => Dangling_Input_Signal,
       rd_30(52) => Dangling_Input_Signal,
       rd_30(53) => Dangling_Input_Signal,
       rd_30(54) => Dangling_Input_Signal,
       rd_30(55) => Dangling_Input_Signal,
       rd_30(56) => Dangling_Input_Signal,
       rd_30(57) => Dangling_Input_Signal,
       rd_30(58) => Dangling_Input_Signal,
       rd_30(59) => Dangling_Input_Signal,
       rd_30(60) => Dangling_Input_Signal,
       rd_30(61) => Dangling_Input_Signal,
       rd_30(62) => Dangling_Input_Signal,
       rd_30(63) => Dangling_Input_Signal,
       rd_31(0) => Dangling_Input_Signal,
       rd_31(1) => Dangling_Input_Signal,
       rd_31(2) => Dangling_Input_Signal,
       rd_31(3) => Dangling_Input_Signal,
       rd_31(4) => Dangling_Input_Signal,
       rd_31(5) => Dangling_Input_Signal,
       rd_31(6) => Dangling_Input_Signal,
       rd_31(7) => Dangling_Input_Signal,
       rd_31(8) => Dangling_Input_Signal,
       rd_31(9) => Dangling_Input_Signal,
       rd_31(10) => Dangling_Input_Signal,
       rd_31(11) => Dangling_Input_Signal,
       rd_31(12) => Dangling_Input_Signal,
       rd_31(13) => Dangling_Input_Signal,
       rd_31(14) => Dangling_Input_Signal,
       rd_31(15) => Dangling_Input_Signal,
       rd_31(16) => Dangling_Input_Signal,
       rd_31(17) => Dangling_Input_Signal,
       rd_31(18) => Dangling_Input_Signal,
       rd_31(19) => Dangling_Input_Signal,
       rd_31(20) => Dangling_Input_Signal,
       rd_31(21) => Dangling_Input_Signal,
       rd_31(22) => Dangling_Input_Signal,
       rd_31(23) => Dangling_Input_Signal,
       rd_31(24) => Dangling_Input_Signal,
       rd_31(25) => Dangling_Input_Signal,
       rd_31(26) => Dangling_Input_Signal,
       rd_31(27) => Dangling_Input_Signal,
       rd_31(28) => Dangling_Input_Signal,
       rd_31(29) => Dangling_Input_Signal,
       rd_31(30) => Dangling_Input_Signal,
       rd_31(31) => Dangling_Input_Signal,
       rd_31(32) => Dangling_Input_Signal,
       rd_31(33) => Dangling_Input_Signal,
       rd_31(34) => Dangling_Input_Signal,
       rd_31(35) => Dangling_Input_Signal,
       rd_31(36) => Dangling_Input_Signal,
       rd_31(37) => Dangling_Input_Signal,
       rd_31(38) => Dangling_Input_Signal,
       rd_31(39) => Dangling_Input_Signal,
       rd_31(40) => Dangling_Input_Signal,
       rd_31(41) => Dangling_Input_Signal,
       rd_31(42) => Dangling_Input_Signal,
       rd_31(43) => Dangling_Input_Signal,
       rd_31(44) => Dangling_Input_Signal,
       rd_31(45) => Dangling_Input_Signal,
       rd_31(46) => Dangling_Input_Signal,
       rd_31(47) => Dangling_Input_Signal,
       rd_31(48) => Dangling_Input_Signal,
       rd_31(49) => Dangling_Input_Signal,
       rd_31(50) => Dangling_Input_Signal,
       rd_31(51) => Dangling_Input_Signal,
       rd_31(52) => Dangling_Input_Signal,
       rd_31(53) => Dangling_Input_Signal,
       rd_31(54) => Dangling_Input_Signal,
       rd_31(55) => Dangling_Input_Signal,
       rd_31(56) => Dangling_Input_Signal,
       rd_31(57) => Dangling_Input_Signal,
       rd_31(58) => Dangling_Input_Signal,
       rd_31(59) => Dangling_Input_Signal,
       rd_31(60) => Dangling_Input_Signal,
       rd_31(61) => Dangling_Input_Signal,
       rd_31(62) => Dangling_Input_Signal,
       rd_31(63) => Dangling_Input_Signal,
       rd_4(0) => Dangling_Input_Signal,
       rd_4(1) => Dangling_Input_Signal,
       rd_4(2) => Dangling_Input_Signal,
       rd_4(3) => Dangling_Input_Signal,
       rd_4(4) => Dangling_Input_Signal,
       rd_4(5) => Dangling_Input_Signal,
       rd_4(6) => Dangling_Input_Signal,
       rd_4(7) => Dangling_Input_Signal,
       rd_4(8) => Dangling_Input_Signal,
       rd_4(9) => Dangling_Input_Signal,
       rd_4(10) => Dangling_Input_Signal,
       rd_4(11) => Dangling_Input_Signal,
       rd_4(12) => Dangling_Input_Signal,
       rd_4(13) => Dangling_Input_Signal,
       rd_4(14) => Dangling_Input_Signal,
       rd_4(15) => Dangling_Input_Signal,
       rd_4(16) => Dangling_Input_Signal,
       rd_4(17) => Dangling_Input_Signal,
       rd_4(18) => Dangling_Input_Signal,
       rd_4(19) => Dangling_Input_Signal,
       rd_4(20) => Dangling_Input_Signal,
       rd_4(21) => Dangling_Input_Signal,
       rd_4(22) => Dangling_Input_Signal,
       rd_4(23) => Dangling_Input_Signal,
       rd_4(24) => Dangling_Input_Signal,
       rd_4(25) => Dangling_Input_Signal,
       rd_4(26) => Dangling_Input_Signal,
       rd_4(27) => Dangling_Input_Signal,
       rd_4(28) => Dangling_Input_Signal,
       rd_4(29) => Dangling_Input_Signal,
       rd_4(30) => Dangling_Input_Signal,
       rd_4(31) => Dangling_Input_Signal,
       rd_4(32) => Dangling_Input_Signal,
       rd_4(33) => Dangling_Input_Signal,
       rd_4(34) => Dangling_Input_Signal,
       rd_4(35) => Dangling_Input_Signal,
       rd_4(36) => Dangling_Input_Signal,
       rd_4(37) => Dangling_Input_Signal,
       rd_4(38) => Dangling_Input_Signal,
       rd_4(39) => Dangling_Input_Signal,
       rd_4(40) => Dangling_Input_Signal,
       rd_4(41) => Dangling_Input_Signal,
       rd_4(42) => Dangling_Input_Signal,
       rd_4(43) => Dangling_Input_Signal,
       rd_4(44) => Dangling_Input_Signal,
       rd_4(45) => Dangling_Input_Signal,
       rd_4(46) => Dangling_Input_Signal,
       rd_4(47) => Dangling_Input_Signal,
       rd_4(48) => Dangling_Input_Signal,
       rd_4(49) => Dangling_Input_Signal,
       rd_4(50) => Dangling_Input_Signal,
       rd_4(51) => Dangling_Input_Signal,
       rd_4(52) => Dangling_Input_Signal,
       rd_4(53) => Dangling_Input_Signal,
       rd_4(54) => Dangling_Input_Signal,
       rd_4(55) => Dangling_Input_Signal,
       rd_4(56) => Dangling_Input_Signal,
       rd_4(57) => Dangling_Input_Signal,
       rd_4(58) => Dangling_Input_Signal,
       rd_4(59) => Dangling_Input_Signal,
       rd_4(60) => Dangling_Input_Signal,
       rd_4(61) => Dangling_Input_Signal,
       rd_4(62) => Dangling_Input_Signal,
       rd_4(63) => Dangling_Input_Signal,
       rd_5(0) => Dangling_Input_Signal,
       rd_5(1) => Dangling_Input_Signal,
       rd_5(2) => Dangling_Input_Signal,
       rd_5(3) => Dangling_Input_Signal,
       rd_5(4) => Dangling_Input_Signal,
       rd_5(5) => Dangling_Input_Signal,
       rd_5(6) => Dangling_Input_Signal,
       rd_5(7) => Dangling_Input_Signal,
       rd_5(8) => Dangling_Input_Signal,
       rd_5(9) => Dangling_Input_Signal,
       rd_5(10) => Dangling_Input_Signal,
       rd_5(11) => Dangling_Input_Signal,
       rd_5(12) => Dangling_Input_Signal,
       rd_5(13) => Dangling_Input_Signal,
       rd_5(14) => Dangling_Input_Signal,
       rd_5(15) => Dangling_Input_Signal,
       rd_5(16) => Dangling_Input_Signal,
       rd_5(17) => Dangling_Input_Signal,
       rd_5(18) => Dangling_Input_Signal,
       rd_5(19) => Dangling_Input_Signal,
       rd_5(20) => Dangling_Input_Signal,
       rd_5(21) => Dangling_Input_Signal,
       rd_5(22) => Dangling_Input_Signal,
       rd_5(23) => Dangling_Input_Signal,
       rd_5(24) => Dangling_Input_Signal,
       rd_5(25) => Dangling_Input_Signal,
       rd_5(26) => Dangling_Input_Signal,
       rd_5(27) => Dangling_Input_Signal,
       rd_5(28) => Dangling_Input_Signal,
       rd_5(29) => Dangling_Input_Signal,
       rd_5(30) => Dangling_Input_Signal,
       rd_5(31) => Dangling_Input_Signal,
       rd_5(32) => Dangling_Input_Signal,
       rd_5(33) => Dangling_Input_Signal,
       rd_5(34) => Dangling_Input_Signal,
       rd_5(35) => Dangling_Input_Signal,
       rd_5(36) => Dangling_Input_Signal,
       rd_5(37) => Dangling_Input_Signal,
       rd_5(38) => Dangling_Input_Signal,
       rd_5(39) => Dangling_Input_Signal,
       rd_5(40) => Dangling_Input_Signal,
       rd_5(41) => Dangling_Input_Signal,
       rd_5(42) => Dangling_Input_Signal,
       rd_5(43) => Dangling_Input_Signal,
       rd_5(44) => Dangling_Input_Signal,
       rd_5(45) => Dangling_Input_Signal,
       rd_5(46) => Dangling_Input_Signal,
       rd_5(47) => Dangling_Input_Signal,
       rd_5(48) => Dangling_Input_Signal,
       rd_5(49) => Dangling_Input_Signal,
       rd_5(50) => Dangling_Input_Signal,
       rd_5(51) => Dangling_Input_Signal,
       rd_5(52) => Dangling_Input_Signal,
       rd_5(53) => Dangling_Input_Signal,
       rd_5(54) => Dangling_Input_Signal,
       rd_5(55) => Dangling_Input_Signal,
       rd_5(56) => Dangling_Input_Signal,
       rd_5(57) => Dangling_Input_Signal,
       rd_5(58) => Dangling_Input_Signal,
       rd_5(59) => Dangling_Input_Signal,
       rd_5(60) => Dangling_Input_Signal,
       rd_5(61) => Dangling_Input_Signal,
       rd_5(62) => Dangling_Input_Signal,
       rd_5(63) => Dangling_Input_Signal,
       rd_6(0) => Dangling_Input_Signal,
       rd_6(1) => Dangling_Input_Signal,
       rd_6(2) => Dangling_Input_Signal,
       rd_6(3) => Dangling_Input_Signal,
       rd_6(4) => Dangling_Input_Signal,
       rd_6(5) => Dangling_Input_Signal,
       rd_6(6) => Dangling_Input_Signal,
       rd_6(7) => Dangling_Input_Signal,
       rd_6(8) => Dangling_Input_Signal,
       rd_6(9) => Dangling_Input_Signal,
       rd_6(10) => Dangling_Input_Signal,
       rd_6(11) => Dangling_Input_Signal,
       rd_6(12) => Dangling_Input_Signal,
       rd_6(13) => Dangling_Input_Signal,
       rd_6(14) => Dangling_Input_Signal,
       rd_6(15) => Dangling_Input_Signal,
       rd_6(16) => Dangling_Input_Signal,
       rd_6(17) => Dangling_Input_Signal,
       rd_6(18) => Dangling_Input_Signal,
       rd_6(19) => Dangling_Input_Signal,
       rd_6(20) => Dangling_Input_Signal,
       rd_6(21) => Dangling_Input_Signal,
       rd_6(22) => Dangling_Input_Signal,
       rd_6(23) => Dangling_Input_Signal,
       rd_6(24) => Dangling_Input_Signal,
       rd_6(25) => Dangling_Input_Signal,
       rd_6(26) => Dangling_Input_Signal,
       rd_6(27) => Dangling_Input_Signal,
       rd_6(28) => Dangling_Input_Signal,
       rd_6(29) => Dangling_Input_Signal,
       rd_6(30) => Dangling_Input_Signal,
       rd_6(31) => Dangling_Input_Signal,
       rd_6(32) => Dangling_Input_Signal,
       rd_6(33) => Dangling_Input_Signal,
       rd_6(34) => Dangling_Input_Signal,
       rd_6(35) => Dangling_Input_Signal,
       rd_6(36) => Dangling_Input_Signal,
       rd_6(37) => Dangling_Input_Signal,
       rd_6(38) => Dangling_Input_Signal,
       rd_6(39) => Dangling_Input_Signal,
       rd_6(40) => Dangling_Input_Signal,
       rd_6(41) => Dangling_Input_Signal,
       rd_6(42) => Dangling_Input_Signal,
       rd_6(43) => Dangling_Input_Signal,
       rd_6(44) => Dangling_Input_Signal,
       rd_6(45) => Dangling_Input_Signal,
       rd_6(46) => Dangling_Input_Signal,
       rd_6(47) => Dangling_Input_Signal,
       rd_6(48) => Dangling_Input_Signal,
       rd_6(49) => Dangling_Input_Signal,
       rd_6(50) => Dangling_Input_Signal,
       rd_6(51) => Dangling_Input_Signal,
       rd_6(52) => Dangling_Input_Signal,
       rd_6(53) => Dangling_Input_Signal,
       rd_6(54) => Dangling_Input_Signal,
       rd_6(55) => Dangling_Input_Signal,
       rd_6(56) => Dangling_Input_Signal,
       rd_6(57) => Dangling_Input_Signal,
       rd_6(58) => Dangling_Input_Signal,
       rd_6(59) => Dangling_Input_Signal,
       rd_6(60) => Dangling_Input_Signal,
       rd_6(61) => Dangling_Input_Signal,
       rd_6(62) => Dangling_Input_Signal,
       rd_6(63) => Dangling_Input_Signal,
       rd_7(0) => Dangling_Input_Signal,
       rd_7(1) => Dangling_Input_Signal,
       rd_7(2) => Dangling_Input_Signal,
       rd_7(3) => Dangling_Input_Signal,
       rd_7(4) => Dangling_Input_Signal,
       rd_7(5) => Dangling_Input_Signal,
       rd_7(6) => Dangling_Input_Signal,
       rd_7(7) => Dangling_Input_Signal,
       rd_7(8) => Dangling_Input_Signal,
       rd_7(9) => Dangling_Input_Signal,
       rd_7(10) => Dangling_Input_Signal,
       rd_7(11) => Dangling_Input_Signal,
       rd_7(12) => Dangling_Input_Signal,
       rd_7(13) => Dangling_Input_Signal,
       rd_7(14) => Dangling_Input_Signal,
       rd_7(15) => Dangling_Input_Signal,
       rd_7(16) => Dangling_Input_Signal,
       rd_7(17) => Dangling_Input_Signal,
       rd_7(18) => Dangling_Input_Signal,
       rd_7(19) => Dangling_Input_Signal,
       rd_7(20) => Dangling_Input_Signal,
       rd_7(21) => Dangling_Input_Signal,
       rd_7(22) => Dangling_Input_Signal,
       rd_7(23) => Dangling_Input_Signal,
       rd_7(24) => Dangling_Input_Signal,
       rd_7(25) => Dangling_Input_Signal,
       rd_7(26) => Dangling_Input_Signal,
       rd_7(27) => Dangling_Input_Signal,
       rd_7(28) => Dangling_Input_Signal,
       rd_7(29) => Dangling_Input_Signal,
       rd_7(30) => Dangling_Input_Signal,
       rd_7(31) => Dangling_Input_Signal,
       rd_7(32) => Dangling_Input_Signal,
       rd_7(33) => Dangling_Input_Signal,
       rd_7(34) => Dangling_Input_Signal,
       rd_7(35) => Dangling_Input_Signal,
       rd_7(36) => Dangling_Input_Signal,
       rd_7(37) => Dangling_Input_Signal,
       rd_7(38) => Dangling_Input_Signal,
       rd_7(39) => Dangling_Input_Signal,
       rd_7(40) => Dangling_Input_Signal,
       rd_7(41) => Dangling_Input_Signal,
       rd_7(42) => Dangling_Input_Signal,
       rd_7(43) => Dangling_Input_Signal,
       rd_7(44) => Dangling_Input_Signal,
       rd_7(45) => Dangling_Input_Signal,
       rd_7(46) => Dangling_Input_Signal,
       rd_7(47) => Dangling_Input_Signal,
       rd_7(48) => Dangling_Input_Signal,
       rd_7(49) => Dangling_Input_Signal,
       rd_7(50) => Dangling_Input_Signal,
       rd_7(51) => Dangling_Input_Signal,
       rd_7(52) => Dangling_Input_Signal,
       rd_7(53) => Dangling_Input_Signal,
       rd_7(54) => Dangling_Input_Signal,
       rd_7(55) => Dangling_Input_Signal,
       rd_7(56) => Dangling_Input_Signal,
       rd_7(57) => Dangling_Input_Signal,
       rd_7(58) => Dangling_Input_Signal,
       rd_7(59) => Dangling_Input_Signal,
       rd_7(60) => Dangling_Input_Signal,
       rd_7(61) => Dangling_Input_Signal,
       rd_7(62) => Dangling_Input_Signal,
       rd_7(63) => Dangling_Input_Signal,
       rd_8(0) => Dangling_Input_Signal,
       rd_8(1) => Dangling_Input_Signal,
       rd_8(2) => Dangling_Input_Signal,
       rd_8(3) => Dangling_Input_Signal,
       rd_8(4) => Dangling_Input_Signal,
       rd_8(5) => Dangling_Input_Signal,
       rd_8(6) => Dangling_Input_Signal,
       rd_8(7) => Dangling_Input_Signal,
       rd_8(8) => Dangling_Input_Signal,
       rd_8(9) => Dangling_Input_Signal,
       rd_8(10) => Dangling_Input_Signal,
       rd_8(11) => Dangling_Input_Signal,
       rd_8(12) => Dangling_Input_Signal,
       rd_8(13) => Dangling_Input_Signal,
       rd_8(14) => Dangling_Input_Signal,
       rd_8(15) => Dangling_Input_Signal,
       rd_8(16) => Dangling_Input_Signal,
       rd_8(17) => Dangling_Input_Signal,
       rd_8(18) => Dangling_Input_Signal,
       rd_8(19) => Dangling_Input_Signal,
       rd_8(20) => Dangling_Input_Signal,
       rd_8(21) => Dangling_Input_Signal,
       rd_8(22) => Dangling_Input_Signal,
       rd_8(23) => Dangling_Input_Signal,
       rd_8(24) => Dangling_Input_Signal,
       rd_8(25) => Dangling_Input_Signal,
       rd_8(26) => Dangling_Input_Signal,
       rd_8(27) => Dangling_Input_Signal,
       rd_8(28) => Dangling_Input_Signal,
       rd_8(29) => Dangling_Input_Signal,
       rd_8(30) => Dangling_Input_Signal,
       rd_8(31) => Dangling_Input_Signal,
       rd_8(32) => Dangling_Input_Signal,
       rd_8(33) => Dangling_Input_Signal,
       rd_8(34) => Dangling_Input_Signal,
       rd_8(35) => Dangling_Input_Signal,
       rd_8(36) => Dangling_Input_Signal,
       rd_8(37) => Dangling_Input_Signal,
       rd_8(38) => Dangling_Input_Signal,
       rd_8(39) => Dangling_Input_Signal,
       rd_8(40) => Dangling_Input_Signal,
       rd_8(41) => Dangling_Input_Signal,
       rd_8(42) => Dangling_Input_Signal,
       rd_8(43) => Dangling_Input_Signal,
       rd_8(44) => Dangling_Input_Signal,
       rd_8(45) => Dangling_Input_Signal,
       rd_8(46) => Dangling_Input_Signal,
       rd_8(47) => Dangling_Input_Signal,
       rd_8(48) => Dangling_Input_Signal,
       rd_8(49) => Dangling_Input_Signal,
       rd_8(50) => Dangling_Input_Signal,
       rd_8(51) => Dangling_Input_Signal,
       rd_8(52) => Dangling_Input_Signal,
       rd_8(53) => Dangling_Input_Signal,
       rd_8(54) => Dangling_Input_Signal,
       rd_8(55) => Dangling_Input_Signal,
       rd_8(56) => Dangling_Input_Signal,
       rd_8(57) => Dangling_Input_Signal,
       rd_8(58) => Dangling_Input_Signal,
       rd_8(59) => Dangling_Input_Signal,
       rd_8(60) => Dangling_Input_Signal,
       rd_8(61) => Dangling_Input_Signal,
       rd_8(62) => Dangling_Input_Signal,
       rd_8(63) => Dangling_Input_Signal,
       rd_9(0) => Dangling_Input_Signal,
       rd_9(1) => Dangling_Input_Signal,
       rd_9(2) => Dangling_Input_Signal,
       rd_9(3) => Dangling_Input_Signal,
       rd_9(4) => Dangling_Input_Signal,
       rd_9(5) => Dangling_Input_Signal,
       rd_9(6) => Dangling_Input_Signal,
       rd_9(7) => Dangling_Input_Signal,
       rd_9(8) => Dangling_Input_Signal,
       rd_9(9) => Dangling_Input_Signal,
       rd_9(10) => Dangling_Input_Signal,
       rd_9(11) => Dangling_Input_Signal,
       rd_9(12) => Dangling_Input_Signal,
       rd_9(13) => Dangling_Input_Signal,
       rd_9(14) => Dangling_Input_Signal,
       rd_9(15) => Dangling_Input_Signal,
       rd_9(16) => Dangling_Input_Signal,
       rd_9(17) => Dangling_Input_Signal,
       rd_9(18) => Dangling_Input_Signal,
       rd_9(19) => Dangling_Input_Signal,
       rd_9(20) => Dangling_Input_Signal,
       rd_9(21) => Dangling_Input_Signal,
       rd_9(22) => Dangling_Input_Signal,
       rd_9(23) => Dangling_Input_Signal,
       rd_9(24) => Dangling_Input_Signal,
       rd_9(25) => Dangling_Input_Signal,
       rd_9(26) => Dangling_Input_Signal,
       rd_9(27) => Dangling_Input_Signal,
       rd_9(28) => Dangling_Input_Signal,
       rd_9(29) => Dangling_Input_Signal,
       rd_9(30) => Dangling_Input_Signal,
       rd_9(31) => Dangling_Input_Signal,
       rd_9(32) => Dangling_Input_Signal,
       rd_9(33) => Dangling_Input_Signal,
       rd_9(34) => Dangling_Input_Signal,
       rd_9(35) => Dangling_Input_Signal,
       rd_9(36) => Dangling_Input_Signal,
       rd_9(37) => Dangling_Input_Signal,
       rd_9(38) => Dangling_Input_Signal,
       rd_9(39) => Dangling_Input_Signal,
       rd_9(40) => Dangling_Input_Signal,
       rd_9(41) => Dangling_Input_Signal,
       rd_9(42) => Dangling_Input_Signal,
       rd_9(43) => Dangling_Input_Signal,
       rd_9(44) => Dangling_Input_Signal,
       rd_9(45) => Dangling_Input_Signal,
       rd_9(46) => Dangling_Input_Signal,
       rd_9(47) => Dangling_Input_Signal,
       rd_9(48) => Dangling_Input_Signal,
       rd_9(49) => Dangling_Input_Signal,
       rd_9(50) => Dangling_Input_Signal,
       rd_9(51) => Dangling_Input_Signal,
       rd_9(52) => Dangling_Input_Signal,
       rd_9(53) => Dangling_Input_Signal,
       rd_9(54) => Dangling_Input_Signal,
       rd_9(55) => Dangling_Input_Signal,
       rd_9(56) => Dangling_Input_Signal,
       rd_9(57) => Dangling_Input_Signal,
       rd_9(58) => Dangling_Input_Signal,
       rd_9(59) => Dangling_Input_Signal,
       rd_9(60) => Dangling_Input_Signal,
       rd_9(61) => Dangling_Input_Signal,
       rd_9(62) => Dangling_Input_Signal,
       rd_9(63) => Dangling_Input_Signal,
       addr => rx_addr,
       rd_0 => rdd0,
       rd_1 => rdd1,
       rd_2 => rdd2,
       rden => NET43804,
       read_data_out => rd_data_out_dyn
  );

NET43804 <= not(rx_wren);

U324 : agrgate_8_by_8
  port map(
       in0(0) => in_ev_ctr_3(0),
       in0(1) => in_ev_ctr_3(1),
       in0(2) => in_ev_ctr_3(2),
       in0(3) => in_ev_ctr_3(3),
       in0(4) => in_ev_ctr_3(4),
       in0(5) => in_ev_ctr_3(5),
       in0(6) => in_ev_ctr_3(6),
       in0(7) => in_ev_ctr_3(7),
       in1(0) => in_ev_ctr_3(8),
       in1(1) => in_ev_ctr_3(9),
       in1(2) => in_ev_ctr_3(10),
       in1(3) => in_ev_ctr_3(11),
       in1(4) => in_ev_ctr_3(12),
       in1(5) => in_ev_ctr_3(13),
       in1(6) => in_ev_ctr_3(14),
       in1(7) => in_ev_ctr_3(15),
       in2(0) => in_ev_ctr_3(16),
       in2(1) => in_ev_ctr_3(17),
       in2(2) => in_ev_ctr_3(18),
       in2(3) => in_ev_ctr_3(19),
       in2(4) => in_ev_ctr_3(20),
       in2(5) => in_ev_ctr_3(21),
       in2(6) => in_ev_ctr_3(22),
       in2(7) => in_ev_ctr_3(23),
       in3(0) => in_ev_ctr_3(24),
       in3(1) => in_ev_ctr_3(25),
       in3(2) => in_ev_ctr_3(26),
       in3(3) => in_ev_ctr_3(27),
       in3(4) => in_ev_ctr_3(28),
       in3(5) => in_ev_ctr_3(29),
       in3(6) => in_ev_ctr_3(30),
       in3(7) => in_ev_ctr_3(31),
       in4(0) => in_ev_ctr_4(0),
       in4(1) => in_ev_ctr_4(1),
       in4(2) => in_ev_ctr_4(2),
       in4(3) => in_ev_ctr_4(3),
       in4(4) => in_ev_ctr_4(4),
       in4(5) => in_ev_ctr_4(5),
       in4(6) => in_ev_ctr_4(6),
       in4(7) => in_ev_ctr_4(7),
       in5(0) => in_ev_ctr_4(8),
       in5(1) => in_ev_ctr_4(9),
       in5(2) => in_ev_ctr_4(10),
       in5(3) => in_ev_ctr_4(11),
       in5(4) => in_ev_ctr_4(12),
       in5(5) => in_ev_ctr_4(13),
       in5(6) => in_ev_ctr_4(14),
       in5(7) => in_ev_ctr_4(15),
       in6(0) => in_ev_ctr_4(16),
       in6(1) => in_ev_ctr_4(17),
       in6(2) => in_ev_ctr_4(18),
       in6(3) => in_ev_ctr_4(19),
       in6(4) => in_ev_ctr_4(20),
       in6(5) => in_ev_ctr_4(21),
       in6(6) => in_ev_ctr_4(22),
       in6(7) => in_ev_ctr_4(23),
       in7(0) => in_ev_ctr_4(24),
       in7(1) => in_ev_ctr_4(25),
       in7(2) => in_ev_ctr_4(26),
       in7(3) => in_ev_ctr_4(27),
       in7(4) => in_ev_ctr_4(28),
       in7(5) => in_ev_ctr_4(29),
       in7(6) => in_ev_ctr_4(30),
       in7(7) => in_ev_ctr_4(31),
       out_0 => rdd1
  );

U325 : agrgate_8_by_8
  port map(
       in0(0) => in_ev_ctr_1(0),
       in0(1) => in_ev_ctr_1(1),
       in0(2) => in_ev_ctr_1(2),
       in0(3) => in_ev_ctr_1(3),
       in0(4) => in_ev_ctr_1(4),
       in0(5) => in_ev_ctr_1(5),
       in0(6) => in_ev_ctr_1(6),
       in0(7) => in_ev_ctr_1(7),
       in1(0) => in_ev_ctr_1(8),
       in1(1) => in_ev_ctr_1(9),
       in1(2) => in_ev_ctr_1(10),
       in1(3) => in_ev_ctr_1(11),
       in1(4) => in_ev_ctr_1(12),
       in1(5) => in_ev_ctr_1(13),
       in1(6) => in_ev_ctr_1(14),
       in1(7) => in_ev_ctr_1(15),
       in2(0) => in_ev_ctr_1(16),
       in2(1) => in_ev_ctr_1(17),
       in2(2) => in_ev_ctr_1(18),
       in2(3) => in_ev_ctr_1(19),
       in2(4) => in_ev_ctr_1(20),
       in2(5) => in_ev_ctr_1(21),
       in2(6) => in_ev_ctr_1(22),
       in2(7) => in_ev_ctr_1(23),
       in3(0) => in_ev_ctr_1(24),
       in3(1) => in_ev_ctr_1(25),
       in3(2) => in_ev_ctr_1(26),
       in3(3) => in_ev_ctr_1(27),
       in3(4) => in_ev_ctr_1(28),
       in3(5) => in_ev_ctr_1(29),
       in3(6) => in_ev_ctr_1(30),
       in3(7) => in_ev_ctr_1(31),
       in4(0) => in_ev_ctr_2(0),
       in4(1) => in_ev_ctr_2(1),
       in4(2) => in_ev_ctr_2(2),
       in4(3) => in_ev_ctr_2(3),
       in4(4) => in_ev_ctr_2(4),
       in4(5) => in_ev_ctr_2(5),
       in4(6) => in_ev_ctr_2(6),
       in4(7) => in_ev_ctr_2(7),
       in5(0) => in_ev_ctr_2(8),
       in5(1) => in_ev_ctr_2(9),
       in5(2) => in_ev_ctr_2(10),
       in5(3) => in_ev_ctr_2(11),
       in5(4) => in_ev_ctr_2(12),
       in5(5) => in_ev_ctr_2(13),
       in5(6) => in_ev_ctr_2(14),
       in5(7) => in_ev_ctr_2(15),
       in6(0) => in_ev_ctr_2(16),
       in6(1) => in_ev_ctr_2(17),
       in6(2) => in_ev_ctr_2(18),
       in6(3) => in_ev_ctr_2(19),
       in6(4) => in_ev_ctr_2(20),
       in6(5) => in_ev_ctr_2(21),
       in6(6) => in_ev_ctr_2(22),
       in6(7) => in_ev_ctr_2(23),
       in7(0) => in_ev_ctr_2(24),
       in7(1) => in_ev_ctr_2(25),
       in7(2) => in_ev_ctr_2(26),
       in7(3) => in_ev_ctr_2(27),
       in7(4) => in_ev_ctr_2(28),
       in7(5) => in_ev_ctr_2(29),
       in7(6) => in_ev_ctr_2(30),
       in7(7) => in_ev_ctr_2(31),
       out_0 => rdd0
  );

U326 : agrgate_8_by_8
  port map(
       in0(0) => out_ev_ctr(0),
       in0(1) => out_ev_ctr(1),
       in0(2) => out_ev_ctr(2),
       in0(3) => out_ev_ctr(3),
       in0(4) => out_ev_ctr(4),
       in0(5) => out_ev_ctr(5),
       in0(6) => out_ev_ctr(6),
       in0(7) => out_ev_ctr(7),
       in1(0) => out_ev_ctr(8),
       in1(1) => out_ev_ctr(9),
       in1(2) => out_ev_ctr(10),
       in1(3) => out_ev_ctr(11),
       in1(4) => out_ev_ctr(12),
       in1(5) => out_ev_ctr(13),
       in1(6) => out_ev_ctr(14),
       in1(7) => out_ev_ctr(15),
       in2(0) => out_ev_ctr(16),
       in2(1) => out_ev_ctr(17),
       in2(2) => out_ev_ctr(18),
       in2(3) => out_ev_ctr(19),
       in2(4) => out_ev_ctr(20),
       in2(5) => out_ev_ctr(21),
       in2(6) => out_ev_ctr(22),
       in2(7) => out_ev_ctr(23),
       in3(0) => out_ev_ctr(24),
       in3(1) => out_ev_ctr(25),
       in3(2) => out_ev_ctr(26),
       in3(3) => out_ev_ctr(27),
       in3(4) => out_ev_ctr(28),
       in3(5) => out_ev_ctr(29),
       in3(6) => out_ev_ctr(30),
       in3(7) => out_ev_ctr(31),
       in4(0) => log_ev_ctr(0),
       in4(1) => log_ev_ctr(1),
       in4(2) => log_ev_ctr(2),
       in4(3) => log_ev_ctr(3),
       in4(4) => log_ev_ctr(4),
       in4(5) => log_ev_ctr(5),
       in4(6) => log_ev_ctr(6),
       in4(7) => log_ev_ctr(7),
       in5(0) => log_ev_ctr(8),
       in5(1) => log_ev_ctr(9),
       in5(2) => log_ev_ctr(10),
       in5(3) => log_ev_ctr(11),
       in5(4) => log_ev_ctr(12),
       in5(5) => log_ev_ctr(13),
       in5(6) => log_ev_ctr(14),
       in5(7) => log_ev_ctr(15),
       in6(0) => log_ev_ctr(16),
       in6(1) => log_ev_ctr(17),
       in6(2) => log_ev_ctr(18),
       in6(3) => log_ev_ctr(19),
       in6(4) => log_ev_ctr(20),
       in6(5) => log_ev_ctr(21),
       in6(6) => log_ev_ctr(22),
       in6(7) => log_ev_ctr(23),
       in7(0) => log_ev_ctr(24),
       in7(1) => log_ev_ctr(25),
       in7(2) => log_ev_ctr(26),
       in7(3) => log_ev_ctr(27),
       in7(4) => log_ev_ctr(28),
       in7(5) => log_ev_ctr(29),
       in7(6) => log_ev_ctr(30),
       in7(7) => log_ev_ctr(31),
       out_0 => rdd2
  );

U327 : mux64_2
  port map(
       in_0 => rd_data_out_stat,
       in_1 => rd_data_out_dyn,
       out64 => BUS44834,
       sel => rx_addr(8)
  );

U328 : reg_64
  port map(
       clk => tx_clk,
       d => BUS44834,
       q => read_data_out,
       reset_p => GND,
       wr_en => NET44704
  );

NET44704 <= not(GND);

NET32706 <= not(ld_arr_rst_p_4);

U330 : buf8
  port map(
       b_in => w1cm,
       b_out => wiz_1_clk_mgr_ctl
  );

U331 : buf8
  port map(
       b_in => w0cm,
       b_out => wiz_0_clk_mgr_ctl
  );

U332 : buf8
  port map(
       b_in => dcm,
       b_out => dac_clk_mgr_ctl
  );

U333 : buf8
  port map(
       b_in => w2cm,
       b_out => wiz_2_clk_mgr_ctl
  );

U334 : cnt_64_simp
  port map(
       clk => clk0,
       out64 => cnt64_simp_out,
       reset_p => out_cnt_rst
  );

U335 : cnt32_v2
  port map(
       clk => clk0,
       cnt_out => log_ev_ctr,
       rst_p => out_cnt_rst,
       sig_in => sig_log
  );

U336 : agrgate16_1
  port map(
       out16(0) => rdb17(0),
       out16(1) => rdb17(1),
       out16(2) => rdb17(2),
       out16(3) => rdb17(3),
       out16(4) => rdb17(4),
       out16(5) => rdb17(5),
       out16(6) => rdb17(6),
       out16(7) => rdb17(7),
       out16(8) => rdb17(8),
       out16(9) => rdb17(9),
       out16(10) => rdb17(10),
       out16(11) => rdb17(11),
       out16(12) => rdb17(12),
       out16(13) => rdb17(13),
       out16(14) => rdb17(14),
       out16(15) => rdb17(15),
       in0 => v_num(0),
       in1 => v_num(1),
       in10 => v_num(10),
       in11 => v_num(11),
       in12 => v_num(12),
       in13 => v_num(13),
       in14 => v_num(14),
       in15 => v_num(15),
       in2 => v_num(2),
       in3 => v_num(3),
       in4 => v_num(4),
       in5 => v_num(5),
       in6 => v_num(6),
       in7 => v_num(7),
       in8 => v_num(8),
       in9 => v_num(9)
  );

U337 : agrgate16_1
  port map(
       out16(0) => rdb17(16),
       out16(1) => rdb17(17),
       out16(2) => rdb17(18),
       out16(3) => rdb17(19),
       out16(4) => rdb17(20),
       out16(5) => rdb17(21),
       out16(6) => rdb17(22),
       out16(7) => rdb17(23),
       out16(8) => rdb17(24),
       out16(9) => rdb17(25),
       out16(10) => rdb17(26),
       out16(11) => rdb17(27),
       out16(12) => rdb17(28),
       out16(13) => rdb17(29),
       out16(14) => rdb17(30),
       out16(15) => rdb17(31),
       in0 => v_num(16),
       in1 => v_num(17),
       in10 => v_num(26),
       in11 => v_num(27),
       in12 => v_num(28),
       in13 => v_num(29),
       in14 => v_num(30),
       in15 => v_num(31),
       in2 => v_num(18),
       in3 => v_num(19),
       in4 => v_num(20),
       in5 => v_num(21),
       in6 => v_num(22),
       in7 => v_num(23),
       in8 => v_num(24),
       in9 => v_num(25)
  );

U338 : agrgate16_1
  port map(
       out16(0) => rdb17(32),
       out16(1) => rdb17(33),
       out16(2) => rdb17(34),
       out16(3) => rdb17(35),
       out16(4) => rdb17(36),
       out16(5) => rdb17(37),
       out16(6) => rdb17(38),
       out16(7) => rdb17(39),
       out16(8) => rdb17(40),
       out16(9) => rdb17(41),
       out16(10) => rdb17(42),
       out16(11) => rdb17(43),
       out16(12) => rdb17(44),
       out16(13) => rdb17(45),
       out16(14) => rdb17(46),
       out16(15) => rdb17(47),
       in0 => GND,
       in1 => GND,
       in10 => GND,
       in11 => GND,
       in12 => GND,
       in13 => GND,
       in14 => GND,
       in15 => GND,
       in2 => GND,
       in3 => GND,
       in4 => GND,
       in5 => GND,
       in6 => GND,
       in7 => GND,
       in8 => GND,
       in9 => GND
  );

U339 : agrgate16_1
  port map(
       out16(0) => rdb17(48),
       out16(1) => rdb17(49),
       out16(2) => rdb17(50),
       out16(3) => rdb17(51),
       out16(4) => rdb17(52),
       out16(5) => rdb17(53),
       out16(6) => rdb17(54),
       out16(7) => rdb17(55),
       out16(8) => rdb17(56),
       out16(9) => rdb17(57),
       out16(10) => rdb17(58),
       out16(11) => rdb17(59),
       out16(12) => rdb17(60),
       out16(13) => rdb17(61),
       out16(14) => rdb17(62),
       out16(15) => rdb17(63),
       in0 => GND,
       in1 => GND,
       in10 => GND,
       in11 => GND,
       in12 => GND,
       in13 => GND,
       in14 => GND,
       in15 => GND,
       in2 => GND,
       in3 => GND,
       in4 => GND,
       in5 => GND,
       in6 => GND,
       in7 => GND,
       in8 => GND,
       in9 => GND
  );

U34 : agrgate16_1
  port map(
       out16(0) => rdb16(0),
       out16(1) => rdb16(1),
       out16(2) => rdb16(2),
       out16(3) => rdb16(3),
       out16(4) => rdb16(4),
       out16(5) => rdb16(5),
       out16(6) => rdb16(6),
       out16(7) => rdb16(7),
       out16(8) => rdb16(8),
       out16(9) => rdb16(9),
       out16(10) => rdb16(10),
       out16(11) => rdb16(11),
       out16(12) => rdb16(12),
       out16(13) => rdb16(13),
       out16(14) => rdb16(14),
       out16(15) => rdb16(15),
       in0 => pulse_ctl(0),
       in1 => pulse_ctl(1),
       in10 => ps_hold_0,
       in11 => reset_out,
       in12 => sumsig0,
       in13 => pulse_ctl(3),
       in14 => sync_w_40MHz,
       in15 => Dangling_Input_Signal,
       in2 => pulse_ctl(2),
       in3 => z(0),
       in4 => veto_out_p0,
       in5 => bkprout,
       in6 => cbp_a,
       in7 => cbp_b,
       in8 => fs_ctl_0,
       in9 => ld_arr_rst_p
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

sigmux(22) <= clk_40DCM;

ld_arr_rst_p_4 <= reset_out or pulse_ctl_4(0);

U38 : decode_addr_NIM_Plus_4
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_4,
       wr_en => rx_wren
  );

sigmux(23) <= sync_w_40MHz;

U4 : veto_count
  port map(
       clk => clk0,
       count_in => veto_set_1,
       reset_p => NET31662,
       sig_in => sig_cms1,
       veto_out_n => veto_out_n1
  );

U40 : agrgate16_1
  port map(
       out16(0) => rdb16(16),
       out16(1) => rdb16(17),
       out16(2) => rdb16(18),
       out16(3) => rdb16(19),
       out16(4) => rdb16(20),
       out16(5) => rdb16(21),
       out16(6) => rdb16(22),
       out16(7) => rdb16(23),
       out16(8) => rdb16(24),
       out16(9) => rdb16(25),
       out16(10) => rdb16(26),
       out16(11) => rdb16(27),
       out16(12) => rdb16(28),
       out16(13) => rdb16(29),
       out16(14) => rdb16(30),
       out16(15) => rdb16(31),
       in0 => ld_arr_rst_p_1,
       in1 => pulse_ctl_1(0),
       in10 => clklock(2),
       in11 => clklock(3),
       in12 => Dangling_Input_Signal,
       in13 => Dangling_Input_Signal,
       in14 => Dangling_Input_Signal,
       in15 => Dangling_Input_Signal,
       in2 => ld_arr_rst_p_2,
       in3 => pulse_ctl_2(0),
       in4 => ld_arr_rst_p_3,
       in5 => pulse_ctl_3(0),
       in6 => ld_arr_rst_p_4,
       in7 => pulse_ctl_4(0),
       in8 => clklock(0),
       in9 => clklock(1)
  );

U41 : agrgate16_1
  port map(
       out16(0) => rdb16(32),
       out16(1) => rdb16(33),
       out16(2) => rdb16(34),
       out16(3) => rdb16(35),
       out16(4) => rdb16(36),
       out16(5) => rdb16(37),
       out16(6) => rdb16(38),
       out16(7) => rdb16(39),
       out16(8) => rdb16(40),
       out16(9) => rdb16(41),
       out16(10) => rdb16(42),
       out16(11) => rdb16(43),
       out16(12) => rdb16(44),
       out16(13) => rdb16(45),
       out16(14) => rdb16(46),
       out16(15) => rdb16(47),
       in0 => veto1_ctl(0),
       in1 => veto1_ctl(1),
       in10 => ps_hold_1,
       in11 => reset_out,
       in12 => sumsig1,
       in13 => veto1_ctl(3),
       in14 => sync_w_40MHz,
       in15 => pulse_ctl(4),
       in2 => veto1_ctl(2),
       in3 => z(1),
       in4 => veto_out_p1,
       in5 => bkprout_v1,
       in6 => bkpress,
       in7 => bp_ctl(1),
       in8 => fs_ctl_1,
       in9 => ld_arr_rst_v1
  );

U42 : agrgate16_1
  port map(
       out16(0) => rdb16(48),
       out16(1) => rdb16(49),
       out16(2) => rdb16(50),
       out16(3) => rdb16(51),
       out16(4) => rdb16(52),
       out16(5) => rdb16(53),
       out16(6) => rdb16(54),
       out16(7) => rdb16(55),
       out16(8) => rdb16(56),
       out16(9) => rdb16(57),
       out16(10) => rdb16(58),
       out16(11) => rdb16(59),
       out16(12) => rdb16(60),
       out16(13) => rdb16(61),
       out16(14) => rdb16(62),
       out16(15) => rdb16(63),
       in0 => veto2_ctl(0),
       in1 => veto2_ctl(1),
       in10 => ps_hold_2,
       in11 => reset_out,
       in12 => sumsig2,
       in13 => veto2_ctl(3),
       in14 => sync_w_40MHz,
       in15 => pulse_ctl(5),
       in2 => veto2_ctl(2),
       in3 => z(2),
       in4 => veto_out_p2,
       in5 => bkprout_v2,
       in6 => bkpress,
       in7 => bp_ctl(2),
       in8 => fs_ctl_2,
       in9 => ld_arr_rst_v2
  );

U43 : test_mux
  port map(
       rst_p => reset_out,
       s_addr => mux_ctl,
       sigtestin => sigmux,
       tsig_out => NET12133
  );

sigmux(1) <= y(0);

sigmux(2) <= y(1);

sigmux(3) <= y(2);

sigmux(4) <= y(3);

sigmux(5) <= sig_mod(0);

sigmux(6) <= sig_mod(1);

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

sigmux(7) <= sig_mod(2);

sigmux(8) <= sig_mod(3);

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

sigmux(24) <= sg_pout;

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

U58 : cnt32_v2
  port map(
       clk => clk0,
       cnt_out => out_ev_ctr,
       rst_p => out_cnt_rst,
       sig_in => sig_norm
  );

sigmux(25) <= muxout_2a;

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

out_cnt_rst <= reset_out or ctr_resets(0) or pulse_ctl(0);

sigmux(10) <= GND;

sigmux(11) <= sig_cms1;

sigmux(12) <= sig_cms2;

sigmux(13) <= veto_out_n1;

NET9478 <= ctr_resets(3) or reset_out;

U66 : cnt32_v2
  port map(
       clk => clk0,
       cnt_out => in_ev_ctr_3,
       rst_p => NET9478,
       sig_in => sig_mod(2)
  );

NET9526 <= ctr_resets(4) or reset_out;

U68 : cnt32_v2
  port map(
       clk => clk0,
       cnt_out => in_ev_ctr_4,
       rst_p => NET9526,
       sig_in => sig_mod(3)
  );

U69 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => pcnt,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(5)
  );

U7 : sel_block
  port map(
       blk_en => sel_ctl(1),
       en_term => sel_blk_en_term,
       logterm => logterm,
       rst_p => reset_out,
       sig_out => NET20962,
       x => sig_mod
  );

NET25266 <= NET24020 or bkprout_v2 or veto_out_p2 or veto2_ctl(1);

sigmux(26) <= muxout_3a;

sigmux(27) <= muxout_4a;

U73 : pol_sel
  port map(
       sel_in => out_pol_sel(0),
       sig_in => NET12133,
       sig_out => muxout_1
  );

U74 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => phi,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(6)
  );

U75 : reg_32
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
       d(16) => rx_data(16),
       d(17) => rx_data(17),
       d(18) => rx_data(18),
       d(19) => rx_data(19),
       d(20) => rx_data(20),
       d(21) => rx_data(21),
       d(22) => rx_data(22),
       d(23) => rx_data(23),
       d(24) => rx_data(24),
       d(25) => rx_data(25),
       d(26) => rx_data(26),
       d(27) => rx_data(27),
       d(28) => rx_data(28),
       d(29) => rx_data(29),
       d(30) => rx_data(30),
       d(31) => rx_data(31),
       clk => tx_clk,
       q => plo,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(7)
  );

U76 : sig_gen_prog
  port map(
       clk => tx_clk,
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

sigmux(28) <= clk_26_5;

rst_sgprog_p <= ctr_resets(5) or reset_out;

ld_arr_rst_p <= reset_out or pulse_ctl(0);

sigmux(29) <= GND;

NET20984 <= fs_sync_bus(8) or sync_w_40MHz;

U82 : section_counter
  port map(
       clk => clk0,
       release_p => acc_release,
       reset_p => NET36449,
       sec_en => sync_w_accel,
       sec_in => accel_sync_bus
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
       clk => clk0,
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
       clk => clk0,
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
       clk => clk0,
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
       clk => clk0,
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

tim_sig_in(0) <= y(0);

tim_sig_in(1) <= y(1);

tim_sig_in(2) <= y(2);


---- Power , ground assignment ----

GND <= GND_CONSTANT;

---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end nim_plus_blk_1_phase_4ps;
