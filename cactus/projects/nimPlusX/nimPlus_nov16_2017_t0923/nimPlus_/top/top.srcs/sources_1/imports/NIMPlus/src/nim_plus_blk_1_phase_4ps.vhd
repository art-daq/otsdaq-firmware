-------------------------------------------------------------------------------
--
-- Title       : nim_plus_blk_1_phase_4ps
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : U:\PREP\PREP_Modernization\Firmware_Backups\Aldec_Backups\One_Phase_Designs\AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase\NIMPlus\NIMPlus\compile\nim_plus_blk_1_phase_4ps.vhd
-- Generated   : Wed May 10 14:54:49 2017
-- From        : U:/PREP/PREP_Modernization/Firmware_Backups/Aldec_Backups/One_Phase_Designs/AGP_2017_05_06_NIMPlus_OT_320MHz_1Phase/NIMPlus/NIMPlus/src/nim_plus_blk_1_phase_4ps.bde
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
       clk0 : in STD_LOGIC;
       clk_40DCM : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       rx_wren : in STD_LOGIC;
       tx_clk : in STD_LOGIC;
       rx_addr : in STD_LOGIC_VECTOR(31 downto 0);
       rx_data : in STD_LOGIC_VECTOR(31 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       b_wr_out : out STD_LOGIC;
       ck_mx_out : out STD_LOGIC;
       dac_out : out STD_LOGIC;
       muxout_1 : out STD_LOGIC;
       muxout_2 : out STD_LOGIC;
       muxout_3 : out STD_LOGIC;
       muxout_4 : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sync : out STD_LOGIC;
       b_read : out STD_LOGIC_VECTOR(63 downto 0);
       read_data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end nim_plus_blk_1_phase_4ps;

architecture nim_plus_blk_1_phase_4ps of nim_plus_blk_1_phase_4ps is

---- Component declarations -----

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
       s_addr : in STD_LOGIC;
       wd_in0 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in1 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in2 : in STD_LOGIC_VECTOR(31 downto 0);
       wd_in3 : in STD_LOGIC_VECTOR(31 downto 0);
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
       clk : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       b_wr : out STD_LOGIC;
       fin_wr : out STD_LOGIC;
       mux_dir : out STD_LOGIC
  );
end component;
component cntrs_2_b_fifo_jw121
  port (
       clk : in STD_LOGIC;
       ct_en : in STD_LOGIC;
       reset_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       b_wr : out STD_LOGIC;
       fin_wr : out STD_LOGIC
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
component ld_array_1_phase_4ps
  port (
       clk0 : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(31 downto 0);
       fs_sync_in : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       v_ps_hold_in : in STD_LOGIC;
       s_out : out STD_LOGIC;
       v_ps_ld_ct_out : out STD_LOGIC
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
component read_decode
  port (
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       count_out : in STD_LOGIC_VECTOR(31 downto 0);
       ctr_enables : in STD_LOGIC_VECTOR(15 downto 0);
       ctr_resets : in STD_LOGIC_VECTOR(15 downto 0);
       dac_ctl : in STD_LOGIC_VECTOR(7 downto 0);
       dac_data : in STD_LOGIC_VECTOR(15 downto 0);
       del_ct : in STD_LOGIC_VECTOR(127 downto 0);
       dlr_1 : in STD_LOGIC_VECTOR(31 downto 0);
       dlr_2 : in STD_LOGIC_VECTOR(31 downto 0);
       dlr_3 : in STD_LOGIC_VECTOR(31 downto 0);
       dlr_4 : in STD_LOGIC_VECTOR(31 downto 0);
       dlr_o : in STD_LOGIC_VECTOR(31 downto 0);
       dur_ct : in STD_LOGIC_VECTOR(127 downto 0);
       in_count_0 : in STD_LOGIC_VECTOR(31 downto 0);
       in_count_1 : in STD_LOGIC_VECTOR(31 downto 0);
       in_count_2 : in STD_LOGIC_VECTOR(31 downto 0);
       in_count_3 : in STD_LOGIC_VECTOR(31 downto 0);
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
       ver_o : in STD_LOGIC_VECTOR(31 downto 0);
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
component scope_probe_4ch
  port (
       clk : in STD_LOGIC;
       disable_p : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC_VECTOR(3 downto 0);
       br_wr_out : out STD_LOGIC
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
       v_in_1 : in STD_LOGIC_VECTOR(3 downto 0);
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

signal bkpress : STD_LOGIC;
signal bkprout : STD_LOGIC;
signal bkprout_v1 : STD_LOGIC;
signal bkprout_v2 : STD_LOGIC;
signal b_wr_out_b : STD_LOGIC;
signal dac_ctl_reset : STD_LOGIC;
signal fin_wr_out : STD_LOGIC;
signal fs_ctl_0 : STD_LOGIC;
signal fs_ctl_1 : STD_LOGIC;
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
signal mux_dir : STD_LOGIC;
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
signal NET28194 : STD_LOGIC;
signal NET28368 : STD_LOGIC;
signal NET28614 : STD_LOGIC;
signal NET29461 : STD_LOGIC;
signal NET29923 : STD_LOGIC;
signal NET30246 : STD_LOGIC;
signal NET5065 : STD_LOGIC;
signal NET5210 : STD_LOGIC;
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
signal sync_w_40MHz : STD_LOGIC;
signal veto_out_n0 : STD_LOGIC;
signal veto_out_n1 : STD_LOGIC;
signal veto_out_n2 : STD_LOGIC;
signal veto_out_p0 : STD_LOGIC;
signal veto_out_p1 : STD_LOGIC;
signal veto_out_p2 : STD_LOGIC;
signal vps_ld_ct_0 : STD_LOGIC;
signal vps_ld_ct_1 : STD_LOGIC;
signal vps_ld_ct_2 : STD_LOGIC;
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
signal BUS25670 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS26082 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS27801 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS28761 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS28884 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS28971 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS30353 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS5198 : STD_LOGIC_VECTOR (31 downto 0);
signal ctr_enables : STD_LOGIC_VECTOR (15 downto 0);
signal ctr_resets : STD_LOGIC_VECTOR (15 downto 0);
signal dac_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal del_ct : STD_LOGIC_VECTOR (127 downto 0);
signal dur_ct : STD_LOGIC_VECTOR (127 downto 0);
signal ext_clk_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal fs_sync_bus : STD_LOGIC_VECTOR (15 downto 0);
signal in_ev_ctr_1 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_2 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_3 : STD_LOGIC_VECTOR (31 downto 0);
signal in_ev_ctr_4 : STD_LOGIC_VECTOR (31 downto 0);
signal in_pol_sel : STD_LOGIC_VECTOR (7 downto 0);
signal jw121_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal jw121_data : STD_LOGIC_VECTOR (63 downto 0);
signal ld_reg : STD_LOGIC_VECTOR (31 downto 0);
signal ld_regv1 : STD_LOGIC_VECTOR (31 downto 0);
signal ld_regv2 : STD_LOGIC_VECTOR (31 downto 0);
signal ld_reg_1 : STD_LOGIC_VECTOR (31 downto 0);
signal ld_reg_2 : STD_LOGIC_VECTOR (31 downto 0);
signal ld_reg_3 : STD_LOGIC_VECTOR (31 downto 0);
signal ld_reg_4 : STD_LOGIC_VECTOR (31 downto 0);
signal muxin_2 : STD_LOGIC_VECTOR (7 downto 0);
signal muxin_3 : STD_LOGIC_VECTOR (7 downto 0);
signal muxin_4 : STD_LOGIC_VECTOR (7 downto 0);
signal muxsel_2 : STD_LOGIC_VECTOR (7 downto 0);
signal muxsel_3 : STD_LOGIC_VECTOR (7 downto 0);
signal muxsel_4 : STD_LOGIC_VECTOR (7 downto 0);
signal mux_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal out_ev_ctr : STD_LOGIC_VECTOR (31 downto 0);
signal out_pol_sel : STD_LOGIC_VECTOR (7 downto 0);
signal overflow : STD_LOGIC_VECTOR (15 downto 0);
signal pcnt : STD_LOGIC_VECTOR (31 downto 0);
signal phi : STD_LOGIC_VECTOR (31 downto 0);
signal plo : STD_LOGIC_VECTOR (31 downto 0);
signal pulse_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_1 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_2 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_3 : STD_LOGIC_VECTOR (7 downto 0);
signal pulse_ctl_4 : STD_LOGIC_VECTOR (7 downto 0);
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
signal s_del_path : STD_LOGIC_VECTOR (7 downto 0);
signal tim_sig : STD_LOGIC_VECTOR (3 downto 0);
signal tim_sig_in : STD_LOGIC_VECTOR (4 downto 0);
signal veto1_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal veto2_ctl : STD_LOGIC_VECTOR (7 downto 0);
signal v_num : STD_LOGIC_VECTOR (31 downto 0);
signal y : STD_LOGIC_VECTOR (3 downto 0);
signal z : STD_LOGIC_VECTOR (3 downto 0);
signal z0_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z1_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z2_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z3_sel : STD_LOGIC_VECTOR (2 downto 0);
signal z_sel : STD_LOGIC_VECTOR (7 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : reg_32
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
       clk => tx_clk,
       d => rx_data,
       q => BUS27801,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(27)
  );

U113 : veto_count
  port map(
       clk => clk0,
       count_in => BUS27801,
       reset_p => ctr_resets(13),
       sig_in => sig_norm,
       veto_out_n => veto_out_n0
  );

veto_out_p0 <= not(veto_out_n0);

U115 : ld_array_1_phase_4ps
  port map(
       clk0 => clk0,
       dl => ld_regv1,
       fs_sync_in => fs_ctl_0,
       rst_p => ld_arr_rst_v1,
       s_out => sig_cms1,
       sig_in => sig_ch1,
       v_ps_hold_in => NET28368,
       v_ps_ld_ct_out => vps_ld_ct_1
  );

NET28194 <= ps_hold_0 or NET28167;

U117 : ld_array_1_phase_4ps
  port map(
       clk0 => clk0,
       dl => ld_regv2,
       fs_sync_in => fs_ctl_1,
       rst_p => ld_arr_rst_v2,
       s_out => sig_cms2,
       sig_in => sig_ch2,
       v_ps_hold_in => NET28614,
       v_ps_ld_ct_out => vps_ld_ct_2
  );

NET28368 <= ps_hold_1 or NET26456;

NET28614 <= ps_hold_1 or NET25266;

dac_ctl_reset <= reset_out or dac_ctl(0);

fs_ctl_1 <= veto2_ctl(3) or sync_w_40MHz;

U121 : b_fifo_mux
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
       b_fifo_out => sig_event_counts,
       rst_p => out_cnt_rst,
       s_addr => mux_dir,
       wd_in0 => out_ev_ctr,
       wd_in2 => in_ev_ctr_1,
       wd_in3 => in_ev_ctr_2
  );

U122 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => BUS28761,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(28)
  );

U123 : cntrs_2_b_fifo
  port map(
       b_wr => b_wr_out_b,
       clk => tx_clk,
       mux_dir => mux_dir,
       reset_p => out_cnt_rst,
       sig_in => sig_norm
  );

U124 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => BUS28884,
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
       clk => tx_clk,
       d => rx_data,
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

U15 : reg_32
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
       clk => tx_clk,
       d => rx_data,
       q => BUS26082,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(17)
  );

muxin_2(2) <= sig_cms2;

U157 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => BUS25670,
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

NET19190 <= ctr_resets(1) or reset_out;

U162 : cnt32_v2
  port map(
       clk => tx_clk,
       cnt_out => in_ev_ctr_2,
       rst_p => NET19293,
       sig_in => sig_cms2
  );

NET19293 <= ctr_resets(2) or reset_out;

sig_log <= NET20984 and NET20962;

sigmux(14) <= veto_out_n2;

U166 : ps_hold_count
  port map(
       clk => clk0,
       count_in => BUS28761,
       ps_hold_out_p => ps_hold_0,
       reset_p => reset_out,
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

bkpress <= bkpb or bkpa;

sigmux(15) <= bkprout;

U17 : veto_count
  port map(
       clk => clk0,
       count_in => BUS25670,
       reset_p => ctr_resets(15),
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
       clk => tx_clk,
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
       clk => tx_clk,
       d => rx_data,
       q => BUS28971,
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

U19 : reg_32
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

U21 : reg_32
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

ld_arr_rst_v2 <= reset_out or veto2_ctl(0);

U216 : ps_hold_count
  port map(
       clk => clk0,
       count_in => BUS28884,
       ps_hold_out_p => ps_hold_1,
       reset_p => reset_out,
       sig_in => vps_ld_ct_1
  );

bkprout_v2 <= bkpress and bp_ctl(2);

ld_arr_rst_v1 <= reset_out or veto1_ctl(0);

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

U22 : reg_32
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

U223 : reg_32
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
       sig_in(0) => Dangling_Input_Signal,
       sig_in(1) => Dangling_Input_Signal,
       sig_in(2) => Dangling_Input_Signal,
       sig_in(3) => Dangling_Input_Signal,
       sig_in(4) => y(0),
       sig_in(5) => y(1),
       sig_in(6) => y(2),
       sig_in(7) => y(3),
       out_1 => z(0),
       rst_p => reset_out,
       sel_in => z0_sel
  );

U227 : mux_8_to_1
  port map(
       sig_in(0) => Dangling_Input_Signal,
       sig_in(1) => Dangling_Input_Signal,
       sig_in(2) => Dangling_Input_Signal,
       sig_in(3) => Dangling_Input_Signal,
       sig_in(4) => y(0),
       sig_in(5) => y(1),
       sig_in(6) => y(2),
       sig_in(7) => y(3),
       out_1 => z(1),
       rst_p => reset_out,
       sel_in => z1_sel
  );

U228 : mux_8_to_1
  port map(
       sig_in(0) => Dangling_Input_Signal,
       sig_in(1) => Dangling_Input_Signal,
       sig_in(2) => Dangling_Input_Signal,
       sig_in(3) => Dangling_Input_Signal,
       sig_in(4) => y(0),
       sig_in(5) => y(1),
       sig_in(6) => y(2),
       sig_in(7) => y(3),
       out_1 => z(2),
       rst_p => reset_out,
       sel_in => z2_sel
  );

U229 : mux_8_to_1
  port map(
       sig_in(0) => Dangling_Input_Signal,
       sig_in(1) => Dangling_Input_Signal,
       sig_in(2) => Dangling_Input_Signal,
       sig_in(3) => Dangling_Input_Signal,
       sig_in(4) => y(0),
       sig_in(5) => y(1),
       sig_in(6) => y(2),
       sig_in(7) => y(3),
       out_1 => z(3),
       rst_p => reset_out,
       sel_in => z3_sel
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

z0_sel(2) <= GND;

z1_sel(0) <= z_sel(2);

z1_sel(1) <= z_sel(3);

z1_sel(2) <= GND;

z2_sel(0) <= z_sel(4);

z2_sel(1) <= z_sel(5);

z2_sel(2) <= GND;

U24 : ld_array_4_v2_1_phase
  port map(
       clk0 => clk0,
       dis_ops => pulse_ctl_2(1),
       dl => ld_reg_2,
       rst_p => ld_arr_rst_p_2,
       s_out => sig_mod(1),
       sig_in => y(1)
  );

z3_sel(0) <= z_sel(6);

z3_sel(1) <= z_sel(7);

z3_sel(2) <= GND;

U243 : reg_8
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
       q => z_sel,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(4)
  );

U244 : ps_hold_count
  port map(
       clk => clk0,
       count_in => BUS28971,
       ps_hold_out_p => ps_hold_2,
       reset_p => reset_out,
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
       clk => tx_clk,
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
       br_wr_out => burst_wr_in(1),
       clk => tx_clk,
       disable_p => scope_ctl(3),
       rst_p => reset_out,
       sig_in => y
  );

burst_wr_in(0) <= b_wr_out_b;

U252 : cnt32
  port map(
       clk => tx_clk,
       cnt_out => BUS30353,
       ct_clr => jw121_ctl(3),
       ct_en => jw121_ctl(2),
       rst_p => NET30246
  );

NET30246 <= fin_wr_out or reset_out;

U254 : v_sec_32_4_in_64_out
  port map(
       v_in_0 => BUS30353,
       v_in_1 => y,
       v_out => jw121_data
  );

U255 : cntrs_2_b_fifo_jw121
  port map(
       b_wr => burst_wr_in(2),
       clk => tx_clk,
       ct_en => jw121_ctl(1),
       fin_wr => fin_wr_out,
       reset_p => NET29923,
       sig_in => sig_log
  );

fs_ctl_1 <= veto1_ctl(3) or sync_w_40MHz;

fs_ctl_0 <= sync_w_40MHz or pulse_ctl(3);

U26 : decode_addr_NIM_Plus_2
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_2,
       wr_en => rx_wren
  );

U27 : ld_array_4_v2_1_phase
  port map(
       clk0 => clk0,
       dis_ops => pulse_ctl_3(1),
       dl => ld_reg_3,
       rst_p => ld_arr_rst_p_3,
       s_out => sig_mod(2),
       sig_in => y(2)
  );

U28 : ld_array_1_phase_4ps
  port map(
       clk0 => clk0,
       dl => ld_reg,
       fs_sync_in => fs_ctl_0,
       rst_p => ld_arr_rst_p,
       s_out => sig_norm,
       sig_in => sig_log,
       v_ps_hold_in => NET28194,
       v_ps_ld_ct_out => vps_ld_ct_0
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

U3 : ld_array_4_v2_1_phase
  port map(
       clk0 => clk0,
       dis_ops => pulse_ctl_1(1),
       dl => ld_reg_1,
       rst_p => ld_arr_rst_p_1,
       s_out => sig_mod(0),
       sig_in => y(0)
  );

U30 : reg_32
  port map(
       clk => tx_clk,
       d => rx_data,
       q => ld_reg_4,
       reset_p => reset_out,
       wr_en => blk_wr_en_4(2)
  );

ld_arr_rst_p_3 <= reset_out or pulse_ctl_3(0);

U32 : decode_addr_NIM_Plus_3
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_3,
       wr_en => rx_wren
  );

U33 : ld_array_4_v2_1_phase
  port map(
       clk0 => clk0,
       dis_ops => pulse_ctl_4(1),
       dl => ld_reg_4,
       rst_p => ld_arr_rst_p_4,
       s_out => sig_mod(3),
       sig_in => y(3)
  );

U34 : read_decode
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
       sl_data => sel_blk_en_term,
       ver_o => v_num
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
       count_in => BUS26082,
       reset_p => ctr_resets(14),
       sig_in => sig_cms1,
       veto_out_n => veto_out_n1
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
       clk => tx_clk,
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

out_cnt_rst <= ctr_resets(0) or reset_out;

sigmux(10) <= GND;

sigmux(11) <= sig_cms1;

sigmux(12) <= sig_cms2;

sigmux(13) <= veto_out_n1;

NET9478 <= ctr_resets(3) or reset_out;

U66 : cnt32_v2
  port map(
       clk => tx_clk,
       cnt_out => in_ev_ctr_3,
       rst_p => NET9478,
       sig_in => sig_mod(2)
  );

NET9526 <= ctr_resets(4) or reset_out;

U68 : cnt32_v2
  port map(
       clk => tx_clk,
       cnt_out => in_ev_ctr_4,
       rst_p => NET9526,
       sig_in => sig_mod(3)
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

sigmux(28) <= GND;

rst_sgprog_p <= ctr_resets(5) or reset_out;

ld_arr_rst_p <= reset_out or pulse_ctl(0);

sigmux(29) <= GND;

NET20984 <= fs_sync_bus(8) or sync_w_40MHz;

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
       clock_320MHz => clk0,
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
