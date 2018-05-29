-------------------------------------------------------------------------------
--
-- Title       : nim_plus_blk_1_phase_4ps
-- Design      : NIMPlus
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\compile\nim_plus_blk_1_phase_4ps.vhd
-- Generated   : Fri May 25 14:39:53 2018
-- From        : C:\AGP_2018_05_24_NIMPlus_T_C_RJ45\NIMPlus\NIMPlus\src\nim_plus_blk_1_phase_4ps.bde
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
       clk_ext : in STD_LOGIC;
       cln_clk_53 : in STD_LOGIC;
       reset_out : in STD_LOGIC;
       rx_wren : in STD_LOGIC;
       tx_clk : in STD_LOGIC;
       clklock : in STD_LOGIC_VECTOR(7 downto 0);
       rx_addr : in STD_LOGIC_VECTOR(31 downto 0);
       rx_data : in STD_LOGIC_VECTOR(63 downto 0);
       x : in STD_LOGIC_VECTOR(3 downto 0);
       b_wr_out : out STD_LOGIC;
       clk160_2pta : out STD_LOGIC;
       clk_39_out : out STD_LOGIC;
       dac_out : out STD_LOGIC;
       muxout_1 : out STD_LOGIC;
       muxout_2 : out STD_LOGIC;
       muxout_3 : out STD_LOGIC;
       muxout_4 : out STD_LOGIC;
       sclk : out STD_LOGIC;
       sync : out STD_LOGIC;
       b_read : out STD_LOGIC_VECTOR(63 downto 0);
       ck_mx_out : out STD_LOGIC_VECTOR(7 downto 0);
       dac_clk_mgr_ctl : out STD_LOGIC_VECTOR(7 downto 0);
       read_data_out : out STD_LOGIC_VECTOR(63 downto 0);
       trig_40 : out STD_LOGIC_VECTOR(5 downto 0);
       trig_53 : out STD_LOGIC_VECTOR(11 downto 0);
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
component acc_sync_shft_reg
  port (
       clk0 : in STD_LOGIC;
       ld : in STD_LOGIC_VECTOR(7 downto 0);
       ld_f : in STD_LOGIC_VECTOR(23 downto 0);
       ld_w_1 : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       clk_39_out : out STD_LOGIC;
       f_out : out STD_LOGIC
  );
end component;
component ag284
  port (
       c4 : in STD_LOGIC_VECTOR(3 downto 0);
       clk : in STD_LOGIC;
       d28 : in STD_LOGIC_VECTOR(27 downto 0);
       resetp : in STD_LOGIC;
       out32 : out STD_LOGIC_VECTOR(31 downto 0)
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
component bfifomux_w_ctlr
  port (
       burst_full_ext : in STD_LOGIC;
       clk0 : in STD_LOGIC;
       ext_rst : in STD_LOGIC;
       trig_sig_in : in STD_LOGIC;
       wd0 : in STD_LOGIC_VECTOR(31 downto 0);
       wd1 : in STD_LOGIC_VECTOR(31 downto 0);
       wd2 : in STD_LOGIC_VECTOR(31 downto 0);
       wd3 : in STD_LOGIC_VECTOR(31 downto 0);
       wd4 : in STD_LOGIC_VECTOR(31 downto 0);
       wd5 : in STD_LOGIC_VECTOR(31 downto 0);
       burst_wr_out : out STD_LOGIC;
       fin_wr : out STD_LOGIC;
       out64 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component buf8
  port (
       b_in : in STD_LOGIC_VECTOR(7 downto 0);
       b_out : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component clk39_pattern
  port (
       clk : in STD_LOGIC;
       d_in : in STD_LOGIC_VECTOR(2 downto 0);
       rst_p : in STD_LOGIC;
       pattern_out : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component clkd_burst_mux_8_to_1
  port (
       burst_in : in STD_LOGIC_VECTOR(7 downto 0);
       burst_mux_sel : in STD_LOGIC_VECTOR(2 downto 0);
       clk0 : in STD_LOGIC;
       rstp : in STD_LOGIC;
       sig0 : in STD_LOGIC_VECTOR(63 downto 0);
       sig1 : in STD_LOGIC_VECTOR(63 downto 0);
       sig2 : in STD_LOGIC_VECTOR(63 downto 0);
       sig3 : in STD_LOGIC_VECTOR(63 downto 0);
       sig4 : in STD_LOGIC_VECTOR(63 downto 0);
       sig5 : in STD_LOGIC_VECTOR(63 downto 0);
       sig6 : in STD_LOGIC_VECTOR(63 downto 0);
       sig7 : in STD_LOGIC_VECTOR(63 downto 0);
       b_read_out : out STD_LOGIC_VECTOR(63 downto 0);
       b_wr_out : out STD_LOGIC
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
component cnt64
  port (
       clk : in STD_LOGIC;
       ct_clr : in STD_LOGIC;
       ct_en : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       cnt_out : out STD_LOGIC_VECTOR(63 downto 0)
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
       blk_wr_en : out STD_LOGIC_VECTOR(15 downto 0)
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
component d_ff
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       q : out STD_LOGIC
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
component load_long_64_v_ps
  port (
       clk : in STD_LOGIC;
       dl : in STD_LOGIC_VECTOR(63 downto 0);
       fs_sync_in : in STD_LOGIC;
       phi : in STD_LOGIC_VECTOR(63 downto 0);
       rst_p : in STD_LOGIC;
       sig_in : in STD_LOGIC;
       v_ps_hold_in : in STD_LOGIC;
       w_ext_in : in STD_LOGIC;
       s_out : out STD_LOGIC;
       v_ps_ld_ct_out : out STD_LOGIC
  );
end component;
component mch_trig_out
  port (
       mxout : in STD_LOGIC_VECTOR(3 downto 0);
       sel : in STD_LOGIC_VECTOR(63 downto 0);
       trig_40 : out STD_LOGIC_VECTOR(5 downto 0);
       trig_53 : out STD_LOGIC_VECTOR(11 downto 0)
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
component reg_read_decode_p
  port (
       clk0 : in STD_LOGIC;
       rdaddr : in STD_LOGIC_VECTOR(31 downto 0);
       rden : in STD_LOGIC;
       sig0 : in STD_LOGIC_VECTOR(63 downto 0);
       sig1 : in STD_LOGIC_VECTOR(63 downto 0);
       sig10 : in STD_LOGIC_VECTOR(63 downto 0);
       sig11 : in STD_LOGIC_VECTOR(63 downto 0);
       sig12 : in STD_LOGIC_VECTOR(63 downto 0);
       sig13 : in STD_LOGIC_VECTOR(63 downto 0);
       sig14 : in STD_LOGIC_VECTOR(63 downto 0);
       sig15 : in STD_LOGIC_VECTOR(63 downto 0);
       sig16 : in STD_LOGIC_VECTOR(63 downto 0);
       sig17 : in STD_LOGIC_VECTOR(63 downto 0);
       sig18 : in STD_LOGIC_VECTOR(63 downto 0);
       sig19 : in STD_LOGIC_VECTOR(63 downto 0);
       sig2 : in STD_LOGIC_VECTOR(63 downto 0);
       sig20 : in STD_LOGIC_VECTOR(63 downto 0);
       sig21 : in STD_LOGIC_VECTOR(63 downto 0);
       sig22 : in STD_LOGIC_VECTOR(63 downto 0);
       sig23 : in STD_LOGIC_VECTOR(63 downto 0);
       sig24 : in STD_LOGIC_VECTOR(63 downto 0);
       sig25 : in STD_LOGIC_VECTOR(63 downto 0);
       sig26 : in STD_LOGIC_VECTOR(63 downto 0);
       sig27 : in STD_LOGIC_VECTOR(63 downto 0);
       sig28 : in STD_LOGIC_VECTOR(63 downto 0);
       sig29 : in STD_LOGIC_VECTOR(63 downto 0);
       sig3 : in STD_LOGIC_VECTOR(63 downto 0);
       sig30 : in STD_LOGIC_VECTOR(63 downto 0);
       sig31 : in STD_LOGIC_VECTOR(63 downto 0);
       sig4 : in STD_LOGIC_VECTOR(63 downto 0);
       sig5 : in STD_LOGIC_VECTOR(63 downto 0);
       sig6 : in STD_LOGIC_VECTOR(63 downto 0);
       sig7 : in STD_LOGIC_VECTOR(63 downto 0);
       sig8 : in STD_LOGIC_VECTOR(63 downto 0);
       sig9 : in STD_LOGIC_VECTOR(63 downto 0);
       out64 : out STD_LOGIC_VECTOR(63 downto 0)
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
component sel_block
  port (
       blk_en : in STD_LOGIC;
       clk0 : in STD_LOGIC;
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
       p_count : in STD_LOGIC_VECTOR(27 downto 0);
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
component s_cnt32_v2
  port (
       clk0 : in STD_LOGIC;
       rst_p : in STD_LOGIC;
       sigin : in STD_LOGIC;
       out32 : out STD_LOGIC_VECTOR(31 downto 0)
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
signal b_wr_out_b1 : STD_LOGIC;
signal c0sig : STD_LOGIC;
signal c1sig : STD_LOGIC;
signal cbp_a : STD_LOGIC;
signal cbp_b : STD_LOGIC;
signal clk13_lat : STD_LOGIC;
signal clk_265_lat : STD_LOGIC;
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
signal muxout_1a : STD_LOGIC;
signal muxout_2a : STD_LOGIC;
signal muxout_3a : STD_LOGIC;
signal muxout_4a : STD_LOGIC;
signal mxout1a : STD_LOGIC;
signal mxout2a : STD_LOGIC;
signal mxout3a : STD_LOGIC;
signal mxout4a : STD_LOGIC;
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
signal NET41961 : STD_LOGIC;
signal NET44704 : STD_LOGIC;
signal NET59053 : STD_LOGIC;
signal NET59133 : STD_LOGIC;
signal NET59517 : STD_LOGIC;
signal NET59792 : STD_LOGIC;
signal NET59859 : STD_LOGIC;
signal NET59949 : STD_LOGIC;
signal NET60016 : STD_LOGIC;
signal NET61855 : STD_LOGIC;
signal NET62481 : STD_LOGIC;
signal NET62518 : STD_LOGIC;
signal NET64138 : STD_LOGIC;
signal NET64172 : STD_LOGIC;
signal NET64181 : STD_LOGIC;
signal NET64588 : STD_LOGIC;
signal NET64594 : STD_LOGIC;
signal NET64598 : STD_LOGIC;
signal NET65433 : STD_LOGIC;
signal NET65437 : STD_LOGIC;
signal NET65597 : STD_LOGIC;
signal NET65601 : STD_LOGIC;
signal NET69495 : STD_LOGIC;
signal NET69568 : STD_LOGIC;
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
signal trig_sig1 : STD_LOGIC;
signal trig_sig1nd : STD_LOGIC;
signal trig_sig2 : STD_LOGIC;
signal trig_sig2nd : STD_LOGIC;
signal veto_out_n0 : STD_LOGIC;
signal veto_out_n1 : STD_LOGIC;
signal veto_out_n2 : STD_LOGIC;
signal veto_out_p0 : STD_LOGIC;
signal veto_out_p1 : STD_LOGIC;
signal veto_out_p2 : STD_LOGIC;
signal vps_ld_ct_0 : STD_LOGIC;
signal vps_ld_ct_1 : STD_LOGIC;
signal vps_ld_ct_2 : STD_LOGIC;
signal accel_sync_bus : STD_LOGIC_VECTOR(7 downto 0);
signal bid1 : STD_LOGIC_VECTOR(3 downto 0);
signal bid2 : STD_LOGIC_VECTOR(3 downto 0);
signal bid3 : STD_LOGIC_VECTOR(3 downto 0);
signal bid4 : STD_LOGIC_VECTOR(3 downto 0);
signal bid5 : STD_LOGIC_VECTOR(3 downto 0);
signal bid6 : STD_LOGIC_VECTOR(3 downto 0);
signal bid7 : STD_LOGIC_VECTOR(3 downto 0);
signal bid8 : STD_LOGIC_VECTOR(3 downto 0);
signal blk_data_in_s : STD_LOGIC_VECTOR(15 downto 0);
signal blk_wr_en : STD_LOGIC_VECTOR(7 downto 0);
signal blk_wr_en_1 : STD_LOGIC_VECTOR(15 downto 0);
signal blk_wr_en_2 : STD_LOGIC_VECTOR(7 downto 0);
signal blk_wr_en_3 : STD_LOGIC_VECTOR(7 downto 0);
signal blk_wr_en_4 : STD_LOGIC_VECTOR(7 downto 0);
signal blk_wr_en_cts : STD_LOGIC_VECTOR(31 downto 0);
signal bmy : STD_LOGIC_VECTOR(3 downto 0);
signal bp_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal burst_mux_sel : STD_LOGIC_VECTOR(7 downto 0);
signal burst_wr_in : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30353 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS34595 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS34604 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS44834 : STD_LOGIC_VECTOR(63 downto 0);
signal BUS64341 : STD_LOGIC_VECTOR(63 downto 0);
signal BUS64350 : STD_LOGIC_VECTOR(63 downto 0);
signal BUS64461 : STD_LOGIC_VECTOR(63 downto 0);
signal BUS64467 : STD_LOGIC_VECTOR(63 downto 0);
signal cnt64_simp_out : STD_LOGIC_VECTOR(63 downto 0);
signal ctr_enables : STD_LOGIC_VECTOR(15 downto 0);
signal ctr_resets : STD_LOGIC_VECTOR(15 downto 0);
signal dac_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal dcm : STD_LOGIC_VECTOR(7 downto 0);
signal del_ct : STD_LOGIC_VECTOR(127 downto 0);
signal dur_ct : STD_LOGIC_VECTOR(127 downto 0);
signal ext_clk_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal fs_sync_bus : STD_LOGIC_VECTOR(31 downto 0);
signal gate_sig_in : STD_LOGIC_VECTOR(7 downto 0);
signal in_ch1_ctr_1 : STD_LOGIC_VECTOR(31 downto 0);
signal in_ch1_ctr_2 : STD_LOGIC_VECTOR(31 downto 0);
signal in_ch2_ctr_2 : STD_LOGIC_VECTOR(31 downto 0);
signal in_ev_ctr_1 : STD_LOGIC_VECTOR(31 downto 0);
signal in_ev_ctr_1b : STD_LOGIC_VECTOR(31 downto 0);
signal in_ev_ctr_2 : STD_LOGIC_VECTOR(31 downto 0);
signal in_ev_ctr_2b : STD_LOGIC_VECTOR(31 downto 0);
signal in_ev_ctr_3 : STD_LOGIC_VECTOR(31 downto 0);
signal in_ev_ctr_4 : STD_LOGIC_VECTOR(31 downto 0);
signal in_pol_sel : STD_LOGIC_VECTOR(7 downto 0);
signal jw121_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal jw121_data : STD_LOGIC_VECTOR(63 downto 0);
signal jw121_logic_term : STD_LOGIC_VECTOR(31 downto 0);
signal ld_reg : STD_LOGIC_VECTOR(63 downto 0);
signal ld_regv1 : STD_LOGIC_VECTOR(63 downto 0);
signal ld_regv2 : STD_LOGIC_VECTOR(63 downto 0);
signal ld_reg_1 : STD_LOGIC_VECTOR(63 downto 0);
signal ld_reg_2 : STD_LOGIC_VECTOR(63 downto 0);
signal ld_reg_3 : STD_LOGIC_VECTOR(63 downto 0);
signal ld_reg_4 : STD_LOGIC_VECTOR(63 downto 0);
signal logterm : STD_LOGIC_VECTOR(15 downto 0);
signal log_ev_ctr : STD_LOGIC_VECTOR(31 downto 0);
signal log_ev_ctrb : STD_LOGIC_VECTOR(31 downto 0);
signal log_lat_sel : STD_LOGIC_VECTOR(7 downto 0);
signal long_r_1 : STD_LOGIC_VECTOR(63 downto 0);
signal long_r_2 : STD_LOGIC_VECTOR(63 downto 0);
signal long_r_norm : STD_LOGIC_VECTOR(63 downto 0);
signal mch_in : STD_LOGIC_VECTOR(63 downto 0);
signal msig0 : STD_LOGIC_VECTOR(7 downto 0);
signal msig1 : STD_LOGIC_VECTOR(7 downto 0);
signal msig2 : STD_LOGIC_VECTOR(7 downto 0);
signal msig3 : STD_LOGIC_VECTOR(7 downto 0);
signal mssel : STD_LOGIC_VECTOR(15 downto 0);
signal muxin_2 : STD_LOGIC_VECTOR(7 downto 0);
signal muxin_3 : STD_LOGIC_VECTOR(7 downto 0);
signal muxin_4 : STD_LOGIC_VECTOR(7 downto 0);
signal muxsel_2 : STD_LOGIC_VECTOR(7 downto 0);
signal muxsel_3 : STD_LOGIC_VECTOR(7 downto 0);
signal muxsel_4 : STD_LOGIC_VECTOR(7 downto 0);
signal mux_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal mxout_mxin : STD_LOGIC_VECTOR(3 downto 0);
signal out_ctr_1 : STD_LOGIC_VECTOR(31 downto 0);
signal out_ctr_1b : STD_LOGIC_VECTOR(31 downto 0);
signal out_ctr_2 : STD_LOGIC_VECTOR(31 downto 0);
signal out_ctr_2b : STD_LOGIC_VECTOR(31 downto 0);
signal out_ctr_3 : STD_LOGIC_VECTOR(31 downto 0);
signal out_ctr_3b : STD_LOGIC_VECTOR(31 downto 0);
signal out_ctr_4 : STD_LOGIC_VECTOR(31 downto 0);
signal out_ctr_4b : STD_LOGIC_VECTOR(31 downto 0);
signal out_ev_ctr : STD_LOGIC_VECTOR(31 downto 0);
signal out_ev_ctrb : STD_LOGIC_VECTOR(31 downto 0);
signal out_pol_sel : STD_LOGIC_VECTOR(7 downto 0);
signal overflow : STD_LOGIC_VECTOR(15 downto 0);
signal pat_out : STD_LOGIC_VECTOR(7 downto 0);
signal pcnt : STD_LOGIC_VECTOR(31 downto 0);
signal phi : STD_LOGIC_VECTOR(31 downto 0);
signal plo : STD_LOGIC_VECTOR(31 downto 0);
signal ps_c1 : STD_LOGIC_VECTOR(15 downto 8);
signal ps_ct0 : STD_LOGIC_VECTOR(31 downto 0);
signal ps_ct1 : STD_LOGIC_VECTOR(31 downto 0);
signal ps_ct2 : STD_LOGIC_VECTOR(31 downto 0);
signal pulse_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal pulse_ctl_1 : STD_LOGIC_VECTOR(7 downto 0);
signal pulse_ctl_2 : STD_LOGIC_VECTOR(7 downto 0);
signal pulse_ctl_3 : STD_LOGIC_VECTOR(7 downto 0);
signal pulse_ctl_4 : STD_LOGIC_VECTOR(7 downto 0);
signal rdb10 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb11 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb12 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb13 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb14 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb15 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb16 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb17 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb20 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb7 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb8 : STD_LOGIC_VECTOR(63 downto 0);
signal rdb9 : STD_LOGIC_VECTOR(63 downto 0);
signal rdd0 : STD_LOGIC_VECTOR(63 downto 0);
signal rdd1 : STD_LOGIC_VECTOR(63 downto 0);
signal rdd2 : STD_LOGIC_VECTOR(63 downto 0);
signal rdd3 : STD_LOGIC_VECTOR(63 downto 0);
signal rdd4 : STD_LOGIC_VECTOR(63 downto 0);
signal rdd5 : STD_LOGIC_VECTOR(63 downto 0);
signal rdd6 : STD_LOGIC_VECTOR(63 downto 0);
signal rd_data_out_dyn : STD_LOGIC_VECTOR(63 downto 0);
signal rd_data_out_stat : STD_LOGIC_VECTOR(63 downto 0);
signal scope_count : STD_LOGIC_VECTOR(63 downto 0);
signal scope_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal scope_out : STD_LOGIC_VECTOR(63 downto 0);
signal sel_blk_en_term : STD_LOGIC_VECTOR(15 downto 0);
signal sel_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal sigmux : STD_LOGIC_VECTOR(31 downto 0);
signal sig_event_cnts : STD_LOGIC_VECTOR(63 downto 0);
signal sig_event_counts : STD_LOGIC_VECTOR(63 downto 0);
signal sig_mod : STD_LOGIC_VECTOR(3 downto 0);
signal sig_output_counts : STD_LOGIC_VECTOR(63 downto 0);
signal sig_out_cnts : STD_LOGIC_VECTOR(63 downto 0);
signal sig_sel : STD_LOGIC_VECTOR(3 downto 0);
signal sig_v1_sel : STD_LOGIC_VECTOR(7 downto 0);
signal sig_v2_sel : STD_LOGIC_VECTOR(7 downto 0);
signal sp_signl_sel : STD_LOGIC_VECTOR(7 downto 0);
signal start_sig_sel : STD_LOGIC_VECTOR(15 downto 0);
signal stop_sig_sel : STD_LOGIC_VECTOR(15 downto 0);
signal stop_tim_sig : STD_LOGIC_VECTOR(3 downto 0);
signal stop_tim_sig_in : STD_LOGIC_VECTOR(4 downto 0);
signal stop_tim_sig_n : STD_LOGIC_VECTOR(3 downto 0);
signal tim_sig : STD_LOGIC_VECTOR(3 downto 0);
signal tim_sig_in : STD_LOGIC_VECTOR(4 downto 0);
signal veto1_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal veto2_ctl : STD_LOGIC_VECTOR(7 downto 0);
signal veto_set_0 : STD_LOGIC_VECTOR(31 downto 0);
signal veto_set_1 : STD_LOGIC_VECTOR(31 downto 0);
signal veto_set_2 : STD_LOGIC_VECTOR(31 downto 0);
signal v_num : STD_LOGIC_VECTOR(31 downto 0);
signal w0cm : STD_LOGIC_VECTOR(7 downto 0);
signal w1cm : STD_LOGIC_VECTOR(7 downto 0);
signal w2cm : STD_LOGIC_VECTOR(7 downto 0);
signal y : STD_LOGIC_VECTOR(3 downto 0);
signal ys : STD_LOGIC_VECTOR(3 downto 0);
signal z : STD_LOGIC_VECTOR(3 downto 0);
signal z0_sel : STD_LOGIC_VECTOR(2 downto 0);
signal z1_sel : STD_LOGIC_VECTOR(2 downto 0);
signal z2_sel : STD_LOGIC_VECTOR(2 downto 0);
signal z3_sel : STD_LOGIC_VECTOR(2 downto 0);
signal z_sel : STD_LOGIC_VECTOR(15 downto 0);


---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

    signal debug_fast_cnt: STD_LOGIC_VECTOR (15 downto 0);
    attribute mark_debug : string;
    attribute mark_debug of sig_log : signal is "true";
--    attribute mark_debug of debug_fast_cnt : signal is "true";
--    attribute mark_debug of out_ctr_4 : signal is "true";
--    attribute mark_debug of out_ctr_3 : signal is "true";
--    attribute mark_debug of out_ctr_2 : signal is "true";
--    attribute mark_debug of out_ctr_1 : signal is "true";
--    attribute mark_debug of out_ctr_4b : signal is "true";
--    attribute mark_debug of out_ctr_3b : signal is "true";
--    attribute mark_debug of out_ctr_2b : signal is "true";
--    attribute mark_debug of out_ctr_1b : signal is "true";
--    attribute mark_debug of cnt64_simp_out : signal is "true";

--    attribute mark_debug of out_cnt_rst : signal is "true";    
    
    --fast burst stream stuff    
--    attribute mark_debug of trig_sig2 : signal is "true";
--    attribute mark_debug of burst_wr_in : signal is "true";
--    attribute mark_debug of b_read : signal is "true";
--    attribute mark_debug of b_wr_out : signal is "true";
--    attribute mark_debug of sig_output_counts : signal is "true";
    
    --for cms masking   
     attribute mark_debug of sync_w_40MHz : signal is "true";
     --attribute mark_debug of sync_w_accel : signal is "true";
     attribute mark_debug of acc_release : signal is "true";
     attribute mark_debug of clk_13_25 : signal is "true";
     attribute mark_debug of clk_26_5 : signal is "true";
     signal sync_ctrl : std_logic;
     attribute mark_debug of sync_ctrl : signal is "true";
     
     --for sig mod
--     attribute mark_debug of pulse_ctl : signal is "true";
--     attribute mark_debug of pulse_ctl_1 : signal is "true";
--     attribute mark_debug of pulse_ctl_2 : signal is "true";
--     attribute mark_debug of pulse_ctl_3 : signal is "true";
--     attribute mark_debug of pulse_ctl_4 : signal is "true";
--     attribute mark_debug of blk_wr_en_1 : signal is "true";
--     attribute mark_debug of blk_wr_en_2 : signal is "true";

     attribute mark_debug of sig_norm : signal is "true";
     attribute mark_debug of ys : signal is "true";        
     attribute mark_debug of sig_mod : signal is "true";          
       
       
--      signal debug_rx_data: STD_LOGIC_VECTOR (7 downto 0); 
--      attribute mark_debug of debug_rx_data : signal is "true";  
            
begin

  --  debug_rx_data <= rx_data(7 downto 0);
    
    debug_fast_cnt <= cnt64_simp_out(15 downto 0);
    sync_ctrl <= ctr_resets(6);
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

U115 : load_long_64_v_ps
  port map(
       clk => clk0,
       dl => ld_regv1,
       fs_sync_in => fs_ctl_1,
       phi => long_r_1,
       rst_p => ld_arr_rst_v1,
       s_out => sig_cms1,
       sig_in => sig_ch1,
       v_ps_hold_in => sumsig1,
       v_ps_ld_ct_out => vps_ld_ct_1,
       w_ext_in => GND
  );

sumsig0 <= ps_hold_0 or NET28167;

U117 : load_long_64_v_ps
  port map(
       clk => clk0,
       dl => ld_regv2,
       fs_sync_in => fs_ctl_2,
       phi => long_r_2,
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

U121 : bfifomux_w_ctlr
  port map(
       wd4(0) => cnt64_simp_out(0),
       wd4(1) => cnt64_simp_out(1),
       wd4(2) => cnt64_simp_out(2),
       wd4(3) => cnt64_simp_out(3),
       wd4(4) => cnt64_simp_out(4),
       wd4(5) => cnt64_simp_out(5),
       wd4(6) => cnt64_simp_out(6),
       wd4(7) => cnt64_simp_out(7),
       wd4(8) => cnt64_simp_out(8),
       wd4(9) => cnt64_simp_out(9),
       wd4(10) => cnt64_simp_out(10),
       wd4(11) => cnt64_simp_out(11),
       wd4(12) => cnt64_simp_out(12),
       wd4(13) => cnt64_simp_out(13),
       wd4(14) => cnt64_simp_out(14),
       wd4(15) => cnt64_simp_out(15),
       wd4(16) => cnt64_simp_out(16),
       wd4(17) => cnt64_simp_out(17),
       wd4(18) => cnt64_simp_out(18),
       wd4(19) => cnt64_simp_out(19),
       wd4(20) => cnt64_simp_out(20),
       wd4(21) => cnt64_simp_out(21),
       wd4(22) => cnt64_simp_out(22),
       wd4(23) => cnt64_simp_out(23),
       wd4(24) => cnt64_simp_out(24),
       wd4(25) => cnt64_simp_out(25),
       wd4(26) => cnt64_simp_out(26),
       wd4(27) => cnt64_simp_out(27),
       wd4(28) => cnt64_simp_out(28),
       wd4(29) => cnt64_simp_out(29),
       wd4(30) => cnt64_simp_out(30),
       wd4(31) => cnt64_simp_out(31),
       wd5(0) => cnt64_simp_out(32),
       wd5(1) => cnt64_simp_out(33),
       wd5(2) => cnt64_simp_out(34),
       wd5(3) => cnt64_simp_out(35),
       wd5(4) => cnt64_simp_out(36),
       wd5(5) => cnt64_simp_out(37),
       wd5(6) => cnt64_simp_out(38),
       wd5(7) => cnt64_simp_out(39),
       wd5(8) => cnt64_simp_out(40),
       wd5(9) => cnt64_simp_out(41),
       wd5(10) => cnt64_simp_out(42),
       wd5(11) => cnt64_simp_out(43),
       wd5(12) => cnt64_simp_out(44),
       wd5(13) => cnt64_simp_out(45),
       wd5(14) => cnt64_simp_out(46),
       wd5(15) => cnt64_simp_out(47),
       wd5(16) => cnt64_simp_out(48),
       wd5(17) => cnt64_simp_out(49),
       wd5(18) => cnt64_simp_out(50),
       wd5(19) => cnt64_simp_out(51),
       wd5(20) => cnt64_simp_out(52),
       wd5(21) => cnt64_simp_out(53),
       wd5(22) => cnt64_simp_out(54),
       wd5(23) => cnt64_simp_out(55),
       wd5(24) => cnt64_simp_out(56),
       wd5(25) => cnt64_simp_out(57),
       wd5(26) => cnt64_simp_out(58),
       wd5(27) => cnt64_simp_out(59),
       wd5(28) => cnt64_simp_out(60),
       wd5(29) => cnt64_simp_out(61),
       wd5(30) => cnt64_simp_out(62),
       wd5(31) => cnt64_simp_out(63),
       burst_full_ext => burst_full_int,
       burst_wr_out => b_wr_out_b,
       clk0 => clk0,
       ext_rst => out_cnt_rst,
       out64 => sig_event_cnts,
       trig_sig_in => trig_sig1,
       wd0 => out_ev_ctr,
       wd1 => log_ev_ctr,
       wd2 => in_ev_ctr_1,
       wd3 => in_ev_ctr_2
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

U123 : bfifomux_w_ctlr
  port map(
       wd4(0) => cnt64_simp_out(0),
       wd4(1) => cnt64_simp_out(1),
       wd4(2) => cnt64_simp_out(2),
       wd4(3) => cnt64_simp_out(3),
       wd4(4) => cnt64_simp_out(4),
       wd4(5) => cnt64_simp_out(5),
       wd4(6) => cnt64_simp_out(6),
       wd4(7) => cnt64_simp_out(7),
       wd4(8) => cnt64_simp_out(8),
       wd4(9) => cnt64_simp_out(9),
       wd4(10) => cnt64_simp_out(10),
       wd4(11) => cnt64_simp_out(11),
       wd4(12) => cnt64_simp_out(12),
       wd4(13) => cnt64_simp_out(13),
       wd4(14) => cnt64_simp_out(14),
       wd4(15) => cnt64_simp_out(15),
       wd4(16) => cnt64_simp_out(16),
       wd4(17) => cnt64_simp_out(17),
       wd4(18) => cnt64_simp_out(18),
       wd4(19) => cnt64_simp_out(19),
       wd4(20) => cnt64_simp_out(20),
       wd4(21) => cnt64_simp_out(21),
       wd4(22) => cnt64_simp_out(22),
       wd4(23) => cnt64_simp_out(23),
       wd4(24) => cnt64_simp_out(24),
       wd4(25) => cnt64_simp_out(25),
       wd4(26) => cnt64_simp_out(26),
       wd4(27) => cnt64_simp_out(27),
       wd4(28) => cnt64_simp_out(28),
       wd4(29) => cnt64_simp_out(29),
       wd4(30) => cnt64_simp_out(30),
       wd4(31) => cnt64_simp_out(31),
       wd5(0) => cnt64_simp_out(32),
       wd5(1) => cnt64_simp_out(33),
       wd5(2) => cnt64_simp_out(34),
       wd5(3) => cnt64_simp_out(35),
       wd5(4) => cnt64_simp_out(36),
       wd5(5) => cnt64_simp_out(37),
       wd5(6) => cnt64_simp_out(38),
       wd5(7) => cnt64_simp_out(39),
       wd5(8) => cnt64_simp_out(40),
       wd5(9) => cnt64_simp_out(41),
       wd5(10) => cnt64_simp_out(42),
       wd5(11) => cnt64_simp_out(43),
       wd5(12) => cnt64_simp_out(44),
       wd5(13) => cnt64_simp_out(45),
       wd5(14) => cnt64_simp_out(46),
       wd5(15) => cnt64_simp_out(47),
       wd5(16) => cnt64_simp_out(48),
       wd5(17) => cnt64_simp_out(49),
       wd5(18) => cnt64_simp_out(50),
       wd5(19) => cnt64_simp_out(51),
       wd5(20) => cnt64_simp_out(52),
       wd5(21) => cnt64_simp_out(53),
       wd5(22) => cnt64_simp_out(54),
       wd5(23) => cnt64_simp_out(55),
       wd5(24) => cnt64_simp_out(56),
       wd5(25) => cnt64_simp_out(57),
       wd5(26) => cnt64_simp_out(58),
       wd5(27) => cnt64_simp_out(59),
       wd5(28) => cnt64_simp_out(60),
       wd5(29) => cnt64_simp_out(61),
       wd5(30) => cnt64_simp_out(62),
       wd5(31) => cnt64_simp_out(63),
       burst_full_ext => burst_full_int,
       burst_wr_out => b_wr_out_b1,
       clk0 => clk0,
       ext_rst => out_cnt_rst,
       out64 => sig_out_cnts,
       trig_sig_in => trig_sig2,
       wd0 => out_ctr_1,
       wd1 => out_ctr_2,
       wd2 => out_ctr_3,
       wd3 => out_ctr_4
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

sigmux(30) <= clk_ext;

sigmux(31) <= veto_out_n0;

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

msig1(0) <= y(1);

muxin_2(1) <= sig_cms1;

U148 : pol_sel
  port map(
       sel_in => out_pol_sel(1),
       sig_in => muxout_2a,
       sig_out => mxout2a
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

U162 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => in_ev_ctr_1b,
       rst_p => NET19190,
       sigin => sig_cms1
  );

NET19293 <= reset_out or ctr_resets(2) or pulse_ctl(5);

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

U177 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => in_ev_ctr_2b,
       rst_p => NET19293,
       sigin => sig_cms2
  );

U178 : pol_sel
  port map(
       sel_in => in_pol_sel(0),
       sig_in => x(0),
       sig_out => bmy(0)
  );

U179 : pol_sel
  port map(
       sel_in => in_pol_sel(1),
       sig_in => x(1),
       sig_out => bmy(1)
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
       sig_out => bmy(2)
  );

U181 : pol_sel
  port map(
       sel_in => in_pol_sel(3),
       sig_in => x(3),
       sig_out => bmy(3)
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

muxin_2(5) <= clk_ext;

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

muxin_3(5) <= clk_ext;

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

muxin_4(5) <= clk_ext;

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

sig_sel(0) <= (sig_mod(0) and not sel_ctl(4)) or (ys(0) and sel_ctl(4));

U213 : pol_sel
  port map(
       sel_in => out_pol_sel(3),
       sig_in => muxout_4a,
       sig_out => mxout4a
  );

U214 : pol_sel
  port map(
       sel_in => out_pol_sel(2),
       sig_in => muxout_3a,
       sig_out => mxout3a
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
       sig_in => ys(1),
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

U245 : clkd_burst_mux_8_to_1
  port map(
       burst_mux_sel(0) => burst_mux_sel(0),
       burst_mux_sel(1) => burst_mux_sel(1),
       burst_mux_sel(2) => burst_mux_sel(2),
       sig4(0) => Dangling_Input_Signal,
       sig4(1) => Dangling_Input_Signal,
       sig4(2) => Dangling_Input_Signal,
       sig4(3) => Dangling_Input_Signal,
       sig4(4) => Dangling_Input_Signal,
       sig4(5) => Dangling_Input_Signal,
       sig4(6) => Dangling_Input_Signal,
       sig4(7) => Dangling_Input_Signal,
       sig4(8) => Dangling_Input_Signal,
       sig4(9) => Dangling_Input_Signal,
       sig4(10) => Dangling_Input_Signal,
       sig4(11) => Dangling_Input_Signal,
       sig4(12) => Dangling_Input_Signal,
       sig4(13) => Dangling_Input_Signal,
       sig4(14) => Dangling_Input_Signal,
       sig4(15) => Dangling_Input_Signal,
       sig4(16) => Dangling_Input_Signal,
       sig4(17) => Dangling_Input_Signal,
       sig4(18) => Dangling_Input_Signal,
       sig4(19) => Dangling_Input_Signal,
       sig4(20) => Dangling_Input_Signal,
       sig4(21) => Dangling_Input_Signal,
       sig4(22) => Dangling_Input_Signal,
       sig4(23) => Dangling_Input_Signal,
       sig4(24) => Dangling_Input_Signal,
       sig4(25) => Dangling_Input_Signal,
       sig4(26) => Dangling_Input_Signal,
       sig4(27) => Dangling_Input_Signal,
       sig4(28) => Dangling_Input_Signal,
       sig4(29) => Dangling_Input_Signal,
       sig4(30) => Dangling_Input_Signal,
       sig4(31) => Dangling_Input_Signal,
       sig4(32) => Dangling_Input_Signal,
       sig4(33) => Dangling_Input_Signal,
       sig4(34) => Dangling_Input_Signal,
       sig4(35) => Dangling_Input_Signal,
       sig4(36) => Dangling_Input_Signal,
       sig4(37) => Dangling_Input_Signal,
       sig4(38) => Dangling_Input_Signal,
       sig4(39) => Dangling_Input_Signal,
       sig4(40) => Dangling_Input_Signal,
       sig4(41) => Dangling_Input_Signal,
       sig4(42) => Dangling_Input_Signal,
       sig4(43) => Dangling_Input_Signal,
       sig4(44) => Dangling_Input_Signal,
       sig4(45) => Dangling_Input_Signal,
       sig4(46) => Dangling_Input_Signal,
       sig4(47) => Dangling_Input_Signal,
       sig4(48) => Dangling_Input_Signal,
       sig4(49) => Dangling_Input_Signal,
       sig4(50) => Dangling_Input_Signal,
       sig4(51) => Dangling_Input_Signal,
       sig4(52) => Dangling_Input_Signal,
       sig4(53) => Dangling_Input_Signal,
       sig4(54) => Dangling_Input_Signal,
       sig4(55) => Dangling_Input_Signal,
       sig4(56) => Dangling_Input_Signal,
       sig4(57) => Dangling_Input_Signal,
       sig4(58) => Dangling_Input_Signal,
       sig4(59) => Dangling_Input_Signal,
       sig4(60) => Dangling_Input_Signal,
       sig4(61) => Dangling_Input_Signal,
       sig4(62) => Dangling_Input_Signal,
       sig4(63) => Dangling_Input_Signal,
       sig5(0) => Dangling_Input_Signal,
       sig5(1) => Dangling_Input_Signal,
       sig5(2) => Dangling_Input_Signal,
       sig5(3) => Dangling_Input_Signal,
       sig5(4) => Dangling_Input_Signal,
       sig5(5) => Dangling_Input_Signal,
       sig5(6) => Dangling_Input_Signal,
       sig5(7) => Dangling_Input_Signal,
       sig5(8) => Dangling_Input_Signal,
       sig5(9) => Dangling_Input_Signal,
       sig5(10) => Dangling_Input_Signal,
       sig5(11) => Dangling_Input_Signal,
       sig5(12) => Dangling_Input_Signal,
       sig5(13) => Dangling_Input_Signal,
       sig5(14) => Dangling_Input_Signal,
       sig5(15) => Dangling_Input_Signal,
       sig5(16) => Dangling_Input_Signal,
       sig5(17) => Dangling_Input_Signal,
       sig5(18) => Dangling_Input_Signal,
       sig5(19) => Dangling_Input_Signal,
       sig5(20) => Dangling_Input_Signal,
       sig5(21) => Dangling_Input_Signal,
       sig5(22) => Dangling_Input_Signal,
       sig5(23) => Dangling_Input_Signal,
       sig5(24) => Dangling_Input_Signal,
       sig5(25) => Dangling_Input_Signal,
       sig5(26) => Dangling_Input_Signal,
       sig5(27) => Dangling_Input_Signal,
       sig5(28) => Dangling_Input_Signal,
       sig5(29) => Dangling_Input_Signal,
       sig5(30) => Dangling_Input_Signal,
       sig5(31) => Dangling_Input_Signal,
       sig5(32) => Dangling_Input_Signal,
       sig5(33) => Dangling_Input_Signal,
       sig5(34) => Dangling_Input_Signal,
       sig5(35) => Dangling_Input_Signal,
       sig5(36) => Dangling_Input_Signal,
       sig5(37) => Dangling_Input_Signal,
       sig5(38) => Dangling_Input_Signal,
       sig5(39) => Dangling_Input_Signal,
       sig5(40) => Dangling_Input_Signal,
       sig5(41) => Dangling_Input_Signal,
       sig5(42) => Dangling_Input_Signal,
       sig5(43) => Dangling_Input_Signal,
       sig5(44) => Dangling_Input_Signal,
       sig5(45) => Dangling_Input_Signal,
       sig5(46) => Dangling_Input_Signal,
       sig5(47) => Dangling_Input_Signal,
       sig5(48) => Dangling_Input_Signal,
       sig5(49) => Dangling_Input_Signal,
       sig5(50) => Dangling_Input_Signal,
       sig5(51) => Dangling_Input_Signal,
       sig5(52) => Dangling_Input_Signal,
       sig5(53) => Dangling_Input_Signal,
       sig5(54) => Dangling_Input_Signal,
       sig5(55) => Dangling_Input_Signal,
       sig5(56) => Dangling_Input_Signal,
       sig5(57) => Dangling_Input_Signal,
       sig5(58) => Dangling_Input_Signal,
       sig5(59) => Dangling_Input_Signal,
       sig5(60) => Dangling_Input_Signal,
       sig5(61) => Dangling_Input_Signal,
       sig5(62) => Dangling_Input_Signal,
       sig5(63) => Dangling_Input_Signal,
       sig6(0) => Dangling_Input_Signal,
       sig6(1) => Dangling_Input_Signal,
       sig6(2) => Dangling_Input_Signal,
       sig6(3) => Dangling_Input_Signal,
       sig6(4) => Dangling_Input_Signal,
       sig6(5) => Dangling_Input_Signal,
       sig6(6) => Dangling_Input_Signal,
       sig6(7) => Dangling_Input_Signal,
       sig6(8) => Dangling_Input_Signal,
       sig6(9) => Dangling_Input_Signal,
       sig6(10) => Dangling_Input_Signal,
       sig6(11) => Dangling_Input_Signal,
       sig6(12) => Dangling_Input_Signal,
       sig6(13) => Dangling_Input_Signal,
       sig6(14) => Dangling_Input_Signal,
       sig6(15) => Dangling_Input_Signal,
       sig6(16) => Dangling_Input_Signal,
       sig6(17) => Dangling_Input_Signal,
       sig6(18) => Dangling_Input_Signal,
       sig6(19) => Dangling_Input_Signal,
       sig6(20) => Dangling_Input_Signal,
       sig6(21) => Dangling_Input_Signal,
       sig6(22) => Dangling_Input_Signal,
       sig6(23) => Dangling_Input_Signal,
       sig6(24) => Dangling_Input_Signal,
       sig6(25) => Dangling_Input_Signal,
       sig6(26) => Dangling_Input_Signal,
       sig6(27) => Dangling_Input_Signal,
       sig6(28) => Dangling_Input_Signal,
       sig6(29) => Dangling_Input_Signal,
       sig6(30) => Dangling_Input_Signal,
       sig6(31) => Dangling_Input_Signal,
       sig6(32) => Dangling_Input_Signal,
       sig6(33) => Dangling_Input_Signal,
       sig6(34) => Dangling_Input_Signal,
       sig6(35) => Dangling_Input_Signal,
       sig6(36) => Dangling_Input_Signal,
       sig6(37) => Dangling_Input_Signal,
       sig6(38) => Dangling_Input_Signal,
       sig6(39) => Dangling_Input_Signal,
       sig6(40) => Dangling_Input_Signal,
       sig6(41) => Dangling_Input_Signal,
       sig6(42) => Dangling_Input_Signal,
       sig6(43) => Dangling_Input_Signal,
       sig6(44) => Dangling_Input_Signal,
       sig6(45) => Dangling_Input_Signal,
       sig6(46) => Dangling_Input_Signal,
       sig6(47) => Dangling_Input_Signal,
       sig6(48) => Dangling_Input_Signal,
       sig6(49) => Dangling_Input_Signal,
       sig6(50) => Dangling_Input_Signal,
       sig6(51) => Dangling_Input_Signal,
       sig6(52) => Dangling_Input_Signal,
       sig6(53) => Dangling_Input_Signal,
       sig6(54) => Dangling_Input_Signal,
       sig6(55) => Dangling_Input_Signal,
       sig6(56) => Dangling_Input_Signal,
       sig6(57) => Dangling_Input_Signal,
       sig6(58) => Dangling_Input_Signal,
       sig6(59) => Dangling_Input_Signal,
       sig6(60) => Dangling_Input_Signal,
       sig6(61) => Dangling_Input_Signal,
       sig6(62) => Dangling_Input_Signal,
       sig6(63) => Dangling_Input_Signal,
       sig7(0) => Dangling_Input_Signal,
       sig7(1) => Dangling_Input_Signal,
       sig7(2) => Dangling_Input_Signal,
       sig7(3) => Dangling_Input_Signal,
       sig7(4) => Dangling_Input_Signal,
       sig7(5) => Dangling_Input_Signal,
       sig7(6) => Dangling_Input_Signal,
       sig7(7) => Dangling_Input_Signal,
       sig7(8) => Dangling_Input_Signal,
       sig7(9) => Dangling_Input_Signal,
       sig7(10) => Dangling_Input_Signal,
       sig7(11) => Dangling_Input_Signal,
       sig7(12) => Dangling_Input_Signal,
       sig7(13) => Dangling_Input_Signal,
       sig7(14) => Dangling_Input_Signal,
       sig7(15) => Dangling_Input_Signal,
       sig7(16) => Dangling_Input_Signal,
       sig7(17) => Dangling_Input_Signal,
       sig7(18) => Dangling_Input_Signal,
       sig7(19) => Dangling_Input_Signal,
       sig7(20) => Dangling_Input_Signal,
       sig7(21) => Dangling_Input_Signal,
       sig7(22) => Dangling_Input_Signal,
       sig7(23) => Dangling_Input_Signal,
       sig7(24) => Dangling_Input_Signal,
       sig7(25) => Dangling_Input_Signal,
       sig7(26) => Dangling_Input_Signal,
       sig7(27) => Dangling_Input_Signal,
       sig7(28) => Dangling_Input_Signal,
       sig7(29) => Dangling_Input_Signal,
       sig7(30) => Dangling_Input_Signal,
       sig7(31) => Dangling_Input_Signal,
       sig7(32) => Dangling_Input_Signal,
       sig7(33) => Dangling_Input_Signal,
       sig7(34) => Dangling_Input_Signal,
       sig7(35) => Dangling_Input_Signal,
       sig7(36) => Dangling_Input_Signal,
       sig7(37) => Dangling_Input_Signal,
       sig7(38) => Dangling_Input_Signal,
       sig7(39) => Dangling_Input_Signal,
       sig7(40) => Dangling_Input_Signal,
       sig7(41) => Dangling_Input_Signal,
       sig7(42) => Dangling_Input_Signal,
       sig7(43) => Dangling_Input_Signal,
       sig7(44) => Dangling_Input_Signal,
       sig7(45) => Dangling_Input_Signal,
       sig7(46) => Dangling_Input_Signal,
       sig7(47) => Dangling_Input_Signal,
       sig7(48) => Dangling_Input_Signal,
       sig7(49) => Dangling_Input_Signal,
       sig7(50) => Dangling_Input_Signal,
       sig7(51) => Dangling_Input_Signal,
       sig7(52) => Dangling_Input_Signal,
       sig7(53) => Dangling_Input_Signal,
       sig7(54) => Dangling_Input_Signal,
       sig7(55) => Dangling_Input_Signal,
       sig7(56) => Dangling_Input_Signal,
       sig7(57) => Dangling_Input_Signal,
       sig7(58) => Dangling_Input_Signal,
       sig7(59) => Dangling_Input_Signal,
       sig7(60) => Dangling_Input_Signal,
       sig7(61) => Dangling_Input_Signal,
       sig7(62) => Dangling_Input_Signal,
       sig7(63) => Dangling_Input_Signal,
       b_read_out => b_read,
       b_wr_out => b_wr_out,
       burst_in => burst_wr_in,
       clk0 => clk0,
       rstp => reset_out,
       sig0 => sig_event_counts,
       sig1 => scope_out,
       sig2 => jw121_data,
       sig3 => sig_output_counts
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

NET64588 <= b_wr_out_b;

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

U266 : load_long_64_v_ps
  port map(
       clk => clk0,
       dl => ld_reg,
       fs_sync_in => fs_ctl_0,
       phi => long_r_norm,
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
       sig_in => ys(2),
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

U286 : acc_sync
  port map(
       clk_13_25 => clk13_lat,
       clk_26_5 => clk_265_lat,
       clk_in => clk0,
       release_p => acc_release,
       reset_p => ctr_resets(6)
  );

U287 : clk39_pattern
  port map(
       d_in(0) => accel_sync_bus(0),
       d_in(1) => accel_sync_bus(1),
       d_in(2) => accel_sync_bus(2),
       clk => clk0,
       pattern_out => pat_out,
       rst_p => reset_out
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
       sig_in => ys(0),
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
       sig_in => ys(3),
       v_ps_hold_in => GND,
       w_ext_in => GND
  );

jw121_logic_term(26) <= GND;

jw121_logic_term(27) <= GND;

jw121_logic_term(28) <= GND;

jw121_logic_term(29) <= GND;

jw121_logic_term(30) <= GND;

jw121_logic_term(31) <= GND;

U306 : acc_sync_shft_reg
  port map(
       ld_f(0) => fs_sync_bus(0),
       ld_f(1) => fs_sync_bus(1),
       ld_f(2) => fs_sync_bus(2),
       ld_f(3) => fs_sync_bus(3),
       ld_f(4) => fs_sync_bus(4),
       ld_f(5) => fs_sync_bus(5),
       ld_f(6) => fs_sync_bus(6),
       ld_f(7) => fs_sync_bus(7),
       ld_f(8) => fs_sync_bus(8),
       ld_f(9) => fs_sync_bus(9),
       ld_f(10) => fs_sync_bus(10),
       ld_f(11) => fs_sync_bus(11),
       ld_f(12) => fs_sync_bus(12),
       ld_f(13) => fs_sync_bus(13),
       ld_f(14) => fs_sync_bus(14),
       ld_f(15) => fs_sync_bus(15),
       ld_f(16) => fs_sync_bus(16),
       ld_f(17) => fs_sync_bus(17),
       ld_f(18) => fs_sync_bus(18),
       ld_f(19) => fs_sync_bus(19),
       ld_f(20) => fs_sync_bus(20),
       ld_f(21) => fs_sync_bus(21),
       ld_f(22) => fs_sync_bus(22),
       ld_f(23) => fs_sync_bus(23),
       clk0 => clk0,
       clk_39_out => clk_39_out,
       f_out => sync_w_40MHz,
       ld => pat_out,
       ld_w_1 => acc_release,
       rst_p => ctr_resets(6)
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

U311 : reg_read_decode_p
  port map(
       sig18(0) => Dangling_Input_Signal,
       sig18(1) => Dangling_Input_Signal,
       sig18(2) => Dangling_Input_Signal,
       sig18(3) => Dangling_Input_Signal,
       sig18(4) => Dangling_Input_Signal,
       sig18(5) => Dangling_Input_Signal,
       sig18(6) => Dangling_Input_Signal,
       sig18(7) => Dangling_Input_Signal,
       sig18(8) => Dangling_Input_Signal,
       sig18(9) => Dangling_Input_Signal,
       sig18(10) => Dangling_Input_Signal,
       sig18(11) => Dangling_Input_Signal,
       sig18(12) => Dangling_Input_Signal,
       sig18(13) => Dangling_Input_Signal,
       sig18(14) => Dangling_Input_Signal,
       sig18(15) => Dangling_Input_Signal,
       sig18(16) => Dangling_Input_Signal,
       sig18(17) => Dangling_Input_Signal,
       sig18(18) => Dangling_Input_Signal,
       sig18(19) => Dangling_Input_Signal,
       sig18(20) => Dangling_Input_Signal,
       sig18(21) => Dangling_Input_Signal,
       sig18(22) => Dangling_Input_Signal,
       sig18(23) => Dangling_Input_Signal,
       sig18(24) => Dangling_Input_Signal,
       sig18(25) => Dangling_Input_Signal,
       sig18(26) => Dangling_Input_Signal,
       sig18(27) => Dangling_Input_Signal,
       sig18(28) => Dangling_Input_Signal,
       sig18(29) => Dangling_Input_Signal,
       sig18(30) => Dangling_Input_Signal,
       sig18(31) => Dangling_Input_Signal,
       sig18(32) => Dangling_Input_Signal,
       sig18(33) => Dangling_Input_Signal,
       sig18(34) => Dangling_Input_Signal,
       sig18(35) => Dangling_Input_Signal,
       sig18(36) => Dangling_Input_Signal,
       sig18(37) => Dangling_Input_Signal,
       sig18(38) => Dangling_Input_Signal,
       sig18(39) => Dangling_Input_Signal,
       sig18(40) => Dangling_Input_Signal,
       sig18(41) => Dangling_Input_Signal,
       sig18(42) => Dangling_Input_Signal,
       sig18(43) => Dangling_Input_Signal,
       sig18(44) => Dangling_Input_Signal,
       sig18(45) => Dangling_Input_Signal,
       sig18(46) => Dangling_Input_Signal,
       sig18(47) => Dangling_Input_Signal,
       sig18(48) => Dangling_Input_Signal,
       sig18(49) => Dangling_Input_Signal,
       sig18(50) => Dangling_Input_Signal,
       sig18(51) => Dangling_Input_Signal,
       sig18(52) => Dangling_Input_Signal,
       sig18(53) => Dangling_Input_Signal,
       sig18(54) => Dangling_Input_Signal,
       sig18(55) => Dangling_Input_Signal,
       sig18(56) => Dangling_Input_Signal,
       sig18(57) => Dangling_Input_Signal,
       sig18(58) => Dangling_Input_Signal,
       sig18(59) => Dangling_Input_Signal,
       sig18(60) => Dangling_Input_Signal,
       sig18(61) => Dangling_Input_Signal,
       sig18(62) => Dangling_Input_Signal,
       sig18(63) => Dangling_Input_Signal,
       sig19(0) => Dangling_Input_Signal,
       sig19(1) => Dangling_Input_Signal,
       sig19(2) => Dangling_Input_Signal,
       sig19(3) => Dangling_Input_Signal,
       sig19(4) => Dangling_Input_Signal,
       sig19(5) => Dangling_Input_Signal,
       sig19(6) => Dangling_Input_Signal,
       sig19(7) => Dangling_Input_Signal,
       sig19(8) => Dangling_Input_Signal,
       sig19(9) => Dangling_Input_Signal,
       sig19(10) => Dangling_Input_Signal,
       sig19(11) => Dangling_Input_Signal,
       sig19(12) => Dangling_Input_Signal,
       sig19(13) => Dangling_Input_Signal,
       sig19(14) => Dangling_Input_Signal,
       sig19(15) => Dangling_Input_Signal,
       sig19(16) => Dangling_Input_Signal,
       sig19(17) => Dangling_Input_Signal,
       sig19(18) => Dangling_Input_Signal,
       sig19(19) => Dangling_Input_Signal,
       sig19(20) => Dangling_Input_Signal,
       sig19(21) => Dangling_Input_Signal,
       sig19(22) => Dangling_Input_Signal,
       sig19(23) => Dangling_Input_Signal,
       sig19(24) => Dangling_Input_Signal,
       sig19(25) => Dangling_Input_Signal,
       sig19(26) => Dangling_Input_Signal,
       sig19(27) => Dangling_Input_Signal,
       sig19(28) => Dangling_Input_Signal,
       sig19(29) => Dangling_Input_Signal,
       sig19(30) => Dangling_Input_Signal,
       sig19(31) => Dangling_Input_Signal,
       sig19(32) => Dangling_Input_Signal,
       sig19(33) => Dangling_Input_Signal,
       sig19(34) => Dangling_Input_Signal,
       sig19(35) => Dangling_Input_Signal,
       sig19(36) => Dangling_Input_Signal,
       sig19(37) => Dangling_Input_Signal,
       sig19(38) => Dangling_Input_Signal,
       sig19(39) => Dangling_Input_Signal,
       sig19(40) => Dangling_Input_Signal,
       sig19(41) => Dangling_Input_Signal,
       sig19(42) => Dangling_Input_Signal,
       sig19(43) => Dangling_Input_Signal,
       sig19(44) => Dangling_Input_Signal,
       sig19(45) => Dangling_Input_Signal,
       sig19(46) => Dangling_Input_Signal,
       sig19(47) => Dangling_Input_Signal,
       sig19(48) => Dangling_Input_Signal,
       sig19(49) => Dangling_Input_Signal,
       sig19(50) => Dangling_Input_Signal,
       sig19(51) => Dangling_Input_Signal,
       sig19(52) => Dangling_Input_Signal,
       sig19(53) => Dangling_Input_Signal,
       sig19(54) => Dangling_Input_Signal,
       sig19(55) => Dangling_Input_Signal,
       sig19(56) => Dangling_Input_Signal,
       sig19(57) => Dangling_Input_Signal,
       sig19(58) => Dangling_Input_Signal,
       sig19(59) => Dangling_Input_Signal,
       sig19(60) => Dangling_Input_Signal,
       sig19(61) => Dangling_Input_Signal,
       sig19(62) => Dangling_Input_Signal,
       sig19(63) => Dangling_Input_Signal,
       sig21(0) => Dangling_Input_Signal,
       sig21(1) => Dangling_Input_Signal,
       sig21(2) => Dangling_Input_Signal,
       sig21(3) => Dangling_Input_Signal,
       sig21(4) => Dangling_Input_Signal,
       sig21(5) => Dangling_Input_Signal,
       sig21(6) => Dangling_Input_Signal,
       sig21(7) => Dangling_Input_Signal,
       sig21(8) => Dangling_Input_Signal,
       sig21(9) => Dangling_Input_Signal,
       sig21(10) => Dangling_Input_Signal,
       sig21(11) => Dangling_Input_Signal,
       sig21(12) => Dangling_Input_Signal,
       sig21(13) => Dangling_Input_Signal,
       sig21(14) => Dangling_Input_Signal,
       sig21(15) => Dangling_Input_Signal,
       sig21(16) => Dangling_Input_Signal,
       sig21(17) => Dangling_Input_Signal,
       sig21(18) => Dangling_Input_Signal,
       sig21(19) => Dangling_Input_Signal,
       sig21(20) => Dangling_Input_Signal,
       sig21(21) => Dangling_Input_Signal,
       sig21(22) => Dangling_Input_Signal,
       sig21(23) => Dangling_Input_Signal,
       sig21(24) => Dangling_Input_Signal,
       sig21(25) => Dangling_Input_Signal,
       sig21(26) => Dangling_Input_Signal,
       sig21(27) => Dangling_Input_Signal,
       sig21(28) => Dangling_Input_Signal,
       sig21(29) => Dangling_Input_Signal,
       sig21(30) => Dangling_Input_Signal,
       sig21(31) => Dangling_Input_Signal,
       sig21(32) => Dangling_Input_Signal,
       sig21(33) => Dangling_Input_Signal,
       sig21(34) => Dangling_Input_Signal,
       sig21(35) => Dangling_Input_Signal,
       sig21(36) => Dangling_Input_Signal,
       sig21(37) => Dangling_Input_Signal,
       sig21(38) => Dangling_Input_Signal,
       sig21(39) => Dangling_Input_Signal,
       sig21(40) => Dangling_Input_Signal,
       sig21(41) => Dangling_Input_Signal,
       sig21(42) => Dangling_Input_Signal,
       sig21(43) => Dangling_Input_Signal,
       sig21(44) => Dangling_Input_Signal,
       sig21(45) => Dangling_Input_Signal,
       sig21(46) => Dangling_Input_Signal,
       sig21(47) => Dangling_Input_Signal,
       sig21(48) => Dangling_Input_Signal,
       sig21(49) => Dangling_Input_Signal,
       sig21(50) => Dangling_Input_Signal,
       sig21(51) => Dangling_Input_Signal,
       sig21(52) => Dangling_Input_Signal,
       sig21(53) => Dangling_Input_Signal,
       sig21(54) => Dangling_Input_Signal,
       sig21(55) => Dangling_Input_Signal,
       sig21(56) => Dangling_Input_Signal,
       sig21(57) => Dangling_Input_Signal,
       sig21(58) => Dangling_Input_Signal,
       sig21(59) => Dangling_Input_Signal,
       sig21(60) => Dangling_Input_Signal,
       sig21(61) => Dangling_Input_Signal,
       sig21(62) => Dangling_Input_Signal,
       sig21(63) => Dangling_Input_Signal,
       sig22(0) => Dangling_Input_Signal,
       sig22(1) => Dangling_Input_Signal,
       sig22(2) => Dangling_Input_Signal,
       sig22(3) => Dangling_Input_Signal,
       sig22(4) => Dangling_Input_Signal,
       sig22(5) => Dangling_Input_Signal,
       sig22(6) => Dangling_Input_Signal,
       sig22(7) => Dangling_Input_Signal,
       sig22(8) => Dangling_Input_Signal,
       sig22(9) => Dangling_Input_Signal,
       sig22(10) => Dangling_Input_Signal,
       sig22(11) => Dangling_Input_Signal,
       sig22(12) => Dangling_Input_Signal,
       sig22(13) => Dangling_Input_Signal,
       sig22(14) => Dangling_Input_Signal,
       sig22(15) => Dangling_Input_Signal,
       sig22(16) => Dangling_Input_Signal,
       sig22(17) => Dangling_Input_Signal,
       sig22(18) => Dangling_Input_Signal,
       sig22(19) => Dangling_Input_Signal,
       sig22(20) => Dangling_Input_Signal,
       sig22(21) => Dangling_Input_Signal,
       sig22(22) => Dangling_Input_Signal,
       sig22(23) => Dangling_Input_Signal,
       sig22(24) => Dangling_Input_Signal,
       sig22(25) => Dangling_Input_Signal,
       sig22(26) => Dangling_Input_Signal,
       sig22(27) => Dangling_Input_Signal,
       sig22(28) => Dangling_Input_Signal,
       sig22(29) => Dangling_Input_Signal,
       sig22(30) => Dangling_Input_Signal,
       sig22(31) => Dangling_Input_Signal,
       sig22(32) => Dangling_Input_Signal,
       sig22(33) => Dangling_Input_Signal,
       sig22(34) => Dangling_Input_Signal,
       sig22(35) => Dangling_Input_Signal,
       sig22(36) => Dangling_Input_Signal,
       sig22(37) => Dangling_Input_Signal,
       sig22(38) => Dangling_Input_Signal,
       sig22(39) => Dangling_Input_Signal,
       sig22(40) => Dangling_Input_Signal,
       sig22(41) => Dangling_Input_Signal,
       sig22(42) => Dangling_Input_Signal,
       sig22(43) => Dangling_Input_Signal,
       sig22(44) => Dangling_Input_Signal,
       sig22(45) => Dangling_Input_Signal,
       sig22(46) => Dangling_Input_Signal,
       sig22(47) => Dangling_Input_Signal,
       sig22(48) => Dangling_Input_Signal,
       sig22(49) => Dangling_Input_Signal,
       sig22(50) => Dangling_Input_Signal,
       sig22(51) => Dangling_Input_Signal,
       sig22(52) => Dangling_Input_Signal,
       sig22(53) => Dangling_Input_Signal,
       sig22(54) => Dangling_Input_Signal,
       sig22(55) => Dangling_Input_Signal,
       sig22(56) => Dangling_Input_Signal,
       sig22(57) => Dangling_Input_Signal,
       sig22(58) => Dangling_Input_Signal,
       sig22(59) => Dangling_Input_Signal,
       sig22(60) => Dangling_Input_Signal,
       sig22(61) => Dangling_Input_Signal,
       sig22(62) => Dangling_Input_Signal,
       sig22(63) => Dangling_Input_Signal,
       sig23(0) => Dangling_Input_Signal,
       sig23(1) => Dangling_Input_Signal,
       sig23(2) => Dangling_Input_Signal,
       sig23(3) => Dangling_Input_Signal,
       sig23(4) => Dangling_Input_Signal,
       sig23(5) => Dangling_Input_Signal,
       sig23(6) => Dangling_Input_Signal,
       sig23(7) => Dangling_Input_Signal,
       sig23(8) => Dangling_Input_Signal,
       sig23(9) => Dangling_Input_Signal,
       sig23(10) => Dangling_Input_Signal,
       sig23(11) => Dangling_Input_Signal,
       sig23(12) => Dangling_Input_Signal,
       sig23(13) => Dangling_Input_Signal,
       sig23(14) => Dangling_Input_Signal,
       sig23(15) => Dangling_Input_Signal,
       sig23(16) => Dangling_Input_Signal,
       sig23(17) => Dangling_Input_Signal,
       sig23(18) => Dangling_Input_Signal,
       sig23(19) => Dangling_Input_Signal,
       sig23(20) => Dangling_Input_Signal,
       sig23(21) => Dangling_Input_Signal,
       sig23(22) => Dangling_Input_Signal,
       sig23(23) => Dangling_Input_Signal,
       sig23(24) => Dangling_Input_Signal,
       sig23(25) => Dangling_Input_Signal,
       sig23(26) => Dangling_Input_Signal,
       sig23(27) => Dangling_Input_Signal,
       sig23(28) => Dangling_Input_Signal,
       sig23(29) => Dangling_Input_Signal,
       sig23(30) => Dangling_Input_Signal,
       sig23(31) => Dangling_Input_Signal,
       sig23(32) => Dangling_Input_Signal,
       sig23(33) => Dangling_Input_Signal,
       sig23(34) => Dangling_Input_Signal,
       sig23(35) => Dangling_Input_Signal,
       sig23(36) => Dangling_Input_Signal,
       sig23(37) => Dangling_Input_Signal,
       sig23(38) => Dangling_Input_Signal,
       sig23(39) => Dangling_Input_Signal,
       sig23(40) => Dangling_Input_Signal,
       sig23(41) => Dangling_Input_Signal,
       sig23(42) => Dangling_Input_Signal,
       sig23(43) => Dangling_Input_Signal,
       sig23(44) => Dangling_Input_Signal,
       sig23(45) => Dangling_Input_Signal,
       sig23(46) => Dangling_Input_Signal,
       sig23(47) => Dangling_Input_Signal,
       sig23(48) => Dangling_Input_Signal,
       sig23(49) => Dangling_Input_Signal,
       sig23(50) => Dangling_Input_Signal,
       sig23(51) => Dangling_Input_Signal,
       sig23(52) => Dangling_Input_Signal,
       sig23(53) => Dangling_Input_Signal,
       sig23(54) => Dangling_Input_Signal,
       sig23(55) => Dangling_Input_Signal,
       sig23(56) => Dangling_Input_Signal,
       sig23(57) => Dangling_Input_Signal,
       sig23(58) => Dangling_Input_Signal,
       sig23(59) => Dangling_Input_Signal,
       sig23(60) => Dangling_Input_Signal,
       sig23(61) => Dangling_Input_Signal,
       sig23(62) => Dangling_Input_Signal,
       sig23(63) => Dangling_Input_Signal,
       sig24(0) => Dangling_Input_Signal,
       sig24(1) => Dangling_Input_Signal,
       sig24(2) => Dangling_Input_Signal,
       sig24(3) => Dangling_Input_Signal,
       sig24(4) => Dangling_Input_Signal,
       sig24(5) => Dangling_Input_Signal,
       sig24(6) => Dangling_Input_Signal,
       sig24(7) => Dangling_Input_Signal,
       sig24(8) => Dangling_Input_Signal,
       sig24(9) => Dangling_Input_Signal,
       sig24(10) => Dangling_Input_Signal,
       sig24(11) => Dangling_Input_Signal,
       sig24(12) => Dangling_Input_Signal,
       sig24(13) => Dangling_Input_Signal,
       sig24(14) => Dangling_Input_Signal,
       sig24(15) => Dangling_Input_Signal,
       sig24(16) => Dangling_Input_Signal,
       sig24(17) => Dangling_Input_Signal,
       sig24(18) => Dangling_Input_Signal,
       sig24(19) => Dangling_Input_Signal,
       sig24(20) => Dangling_Input_Signal,
       sig24(21) => Dangling_Input_Signal,
       sig24(22) => Dangling_Input_Signal,
       sig24(23) => Dangling_Input_Signal,
       sig24(24) => Dangling_Input_Signal,
       sig24(25) => Dangling_Input_Signal,
       sig24(26) => Dangling_Input_Signal,
       sig24(27) => Dangling_Input_Signal,
       sig24(28) => Dangling_Input_Signal,
       sig24(29) => Dangling_Input_Signal,
       sig24(30) => Dangling_Input_Signal,
       sig24(31) => Dangling_Input_Signal,
       sig24(32) => Dangling_Input_Signal,
       sig24(33) => Dangling_Input_Signal,
       sig24(34) => Dangling_Input_Signal,
       sig24(35) => Dangling_Input_Signal,
       sig24(36) => Dangling_Input_Signal,
       sig24(37) => Dangling_Input_Signal,
       sig24(38) => Dangling_Input_Signal,
       sig24(39) => Dangling_Input_Signal,
       sig24(40) => Dangling_Input_Signal,
       sig24(41) => Dangling_Input_Signal,
       sig24(42) => Dangling_Input_Signal,
       sig24(43) => Dangling_Input_Signal,
       sig24(44) => Dangling_Input_Signal,
       sig24(45) => Dangling_Input_Signal,
       sig24(46) => Dangling_Input_Signal,
       sig24(47) => Dangling_Input_Signal,
       sig24(48) => Dangling_Input_Signal,
       sig24(49) => Dangling_Input_Signal,
       sig24(50) => Dangling_Input_Signal,
       sig24(51) => Dangling_Input_Signal,
       sig24(52) => Dangling_Input_Signal,
       sig24(53) => Dangling_Input_Signal,
       sig24(54) => Dangling_Input_Signal,
       sig24(55) => Dangling_Input_Signal,
       sig24(56) => Dangling_Input_Signal,
       sig24(57) => Dangling_Input_Signal,
       sig24(58) => Dangling_Input_Signal,
       sig24(59) => Dangling_Input_Signal,
       sig24(60) => Dangling_Input_Signal,
       sig24(61) => Dangling_Input_Signal,
       sig24(62) => Dangling_Input_Signal,
       sig24(63) => Dangling_Input_Signal,
       sig25(0) => Dangling_Input_Signal,
       sig25(1) => Dangling_Input_Signal,
       sig25(2) => Dangling_Input_Signal,
       sig25(3) => Dangling_Input_Signal,
       sig25(4) => Dangling_Input_Signal,
       sig25(5) => Dangling_Input_Signal,
       sig25(6) => Dangling_Input_Signal,
       sig25(7) => Dangling_Input_Signal,
       sig25(8) => Dangling_Input_Signal,
       sig25(9) => Dangling_Input_Signal,
       sig25(10) => Dangling_Input_Signal,
       sig25(11) => Dangling_Input_Signal,
       sig25(12) => Dangling_Input_Signal,
       sig25(13) => Dangling_Input_Signal,
       sig25(14) => Dangling_Input_Signal,
       sig25(15) => Dangling_Input_Signal,
       sig25(16) => Dangling_Input_Signal,
       sig25(17) => Dangling_Input_Signal,
       sig25(18) => Dangling_Input_Signal,
       sig25(19) => Dangling_Input_Signal,
       sig25(20) => Dangling_Input_Signal,
       sig25(21) => Dangling_Input_Signal,
       sig25(22) => Dangling_Input_Signal,
       sig25(23) => Dangling_Input_Signal,
       sig25(24) => Dangling_Input_Signal,
       sig25(25) => Dangling_Input_Signal,
       sig25(26) => Dangling_Input_Signal,
       sig25(27) => Dangling_Input_Signal,
       sig25(28) => Dangling_Input_Signal,
       sig25(29) => Dangling_Input_Signal,
       sig25(30) => Dangling_Input_Signal,
       sig25(31) => Dangling_Input_Signal,
       sig25(32) => Dangling_Input_Signal,
       sig25(33) => Dangling_Input_Signal,
       sig25(34) => Dangling_Input_Signal,
       sig25(35) => Dangling_Input_Signal,
       sig25(36) => Dangling_Input_Signal,
       sig25(37) => Dangling_Input_Signal,
       sig25(38) => Dangling_Input_Signal,
       sig25(39) => Dangling_Input_Signal,
       sig25(40) => Dangling_Input_Signal,
       sig25(41) => Dangling_Input_Signal,
       sig25(42) => Dangling_Input_Signal,
       sig25(43) => Dangling_Input_Signal,
       sig25(44) => Dangling_Input_Signal,
       sig25(45) => Dangling_Input_Signal,
       sig25(46) => Dangling_Input_Signal,
       sig25(47) => Dangling_Input_Signal,
       sig25(48) => Dangling_Input_Signal,
       sig25(49) => Dangling_Input_Signal,
       sig25(50) => Dangling_Input_Signal,
       sig25(51) => Dangling_Input_Signal,
       sig25(52) => Dangling_Input_Signal,
       sig25(53) => Dangling_Input_Signal,
       sig25(54) => Dangling_Input_Signal,
       sig25(55) => Dangling_Input_Signal,
       sig25(56) => Dangling_Input_Signal,
       sig25(57) => Dangling_Input_Signal,
       sig25(58) => Dangling_Input_Signal,
       sig25(59) => Dangling_Input_Signal,
       sig25(60) => Dangling_Input_Signal,
       sig25(61) => Dangling_Input_Signal,
       sig25(62) => Dangling_Input_Signal,
       sig25(63) => Dangling_Input_Signal,
       sig26(0) => Dangling_Input_Signal,
       sig26(1) => Dangling_Input_Signal,
       sig26(2) => Dangling_Input_Signal,
       sig26(3) => Dangling_Input_Signal,
       sig26(4) => Dangling_Input_Signal,
       sig26(5) => Dangling_Input_Signal,
       sig26(6) => Dangling_Input_Signal,
       sig26(7) => Dangling_Input_Signal,
       sig26(8) => Dangling_Input_Signal,
       sig26(9) => Dangling_Input_Signal,
       sig26(10) => Dangling_Input_Signal,
       sig26(11) => Dangling_Input_Signal,
       sig26(12) => Dangling_Input_Signal,
       sig26(13) => Dangling_Input_Signal,
       sig26(14) => Dangling_Input_Signal,
       sig26(15) => Dangling_Input_Signal,
       sig26(16) => Dangling_Input_Signal,
       sig26(17) => Dangling_Input_Signal,
       sig26(18) => Dangling_Input_Signal,
       sig26(19) => Dangling_Input_Signal,
       sig26(20) => Dangling_Input_Signal,
       sig26(21) => Dangling_Input_Signal,
       sig26(22) => Dangling_Input_Signal,
       sig26(23) => Dangling_Input_Signal,
       sig26(24) => Dangling_Input_Signal,
       sig26(25) => Dangling_Input_Signal,
       sig26(26) => Dangling_Input_Signal,
       sig26(27) => Dangling_Input_Signal,
       sig26(28) => Dangling_Input_Signal,
       sig26(29) => Dangling_Input_Signal,
       sig26(30) => Dangling_Input_Signal,
       sig26(31) => Dangling_Input_Signal,
       sig26(32) => Dangling_Input_Signal,
       sig26(33) => Dangling_Input_Signal,
       sig26(34) => Dangling_Input_Signal,
       sig26(35) => Dangling_Input_Signal,
       sig26(36) => Dangling_Input_Signal,
       sig26(37) => Dangling_Input_Signal,
       sig26(38) => Dangling_Input_Signal,
       sig26(39) => Dangling_Input_Signal,
       sig26(40) => Dangling_Input_Signal,
       sig26(41) => Dangling_Input_Signal,
       sig26(42) => Dangling_Input_Signal,
       sig26(43) => Dangling_Input_Signal,
       sig26(44) => Dangling_Input_Signal,
       sig26(45) => Dangling_Input_Signal,
       sig26(46) => Dangling_Input_Signal,
       sig26(47) => Dangling_Input_Signal,
       sig26(48) => Dangling_Input_Signal,
       sig26(49) => Dangling_Input_Signal,
       sig26(50) => Dangling_Input_Signal,
       sig26(51) => Dangling_Input_Signal,
       sig26(52) => Dangling_Input_Signal,
       sig26(53) => Dangling_Input_Signal,
       sig26(54) => Dangling_Input_Signal,
       sig26(55) => Dangling_Input_Signal,
       sig26(56) => Dangling_Input_Signal,
       sig26(57) => Dangling_Input_Signal,
       sig26(58) => Dangling_Input_Signal,
       sig26(59) => Dangling_Input_Signal,
       sig26(60) => Dangling_Input_Signal,
       sig26(61) => Dangling_Input_Signal,
       sig26(62) => Dangling_Input_Signal,
       sig26(63) => Dangling_Input_Signal,
       sig27(0) => Dangling_Input_Signal,
       sig27(1) => Dangling_Input_Signal,
       sig27(2) => Dangling_Input_Signal,
       sig27(3) => Dangling_Input_Signal,
       sig27(4) => Dangling_Input_Signal,
       sig27(5) => Dangling_Input_Signal,
       sig27(6) => Dangling_Input_Signal,
       sig27(7) => Dangling_Input_Signal,
       sig27(8) => Dangling_Input_Signal,
       sig27(9) => Dangling_Input_Signal,
       sig27(10) => Dangling_Input_Signal,
       sig27(11) => Dangling_Input_Signal,
       sig27(12) => Dangling_Input_Signal,
       sig27(13) => Dangling_Input_Signal,
       sig27(14) => Dangling_Input_Signal,
       sig27(15) => Dangling_Input_Signal,
       sig27(16) => Dangling_Input_Signal,
       sig27(17) => Dangling_Input_Signal,
       sig27(18) => Dangling_Input_Signal,
       sig27(19) => Dangling_Input_Signal,
       sig27(20) => Dangling_Input_Signal,
       sig27(21) => Dangling_Input_Signal,
       sig27(22) => Dangling_Input_Signal,
       sig27(23) => Dangling_Input_Signal,
       sig27(24) => Dangling_Input_Signal,
       sig27(25) => Dangling_Input_Signal,
       sig27(26) => Dangling_Input_Signal,
       sig27(27) => Dangling_Input_Signal,
       sig27(28) => Dangling_Input_Signal,
       sig27(29) => Dangling_Input_Signal,
       sig27(30) => Dangling_Input_Signal,
       sig27(31) => Dangling_Input_Signal,
       sig27(32) => Dangling_Input_Signal,
       sig27(33) => Dangling_Input_Signal,
       sig27(34) => Dangling_Input_Signal,
       sig27(35) => Dangling_Input_Signal,
       sig27(36) => Dangling_Input_Signal,
       sig27(37) => Dangling_Input_Signal,
       sig27(38) => Dangling_Input_Signal,
       sig27(39) => Dangling_Input_Signal,
       sig27(40) => Dangling_Input_Signal,
       sig27(41) => Dangling_Input_Signal,
       sig27(42) => Dangling_Input_Signal,
       sig27(43) => Dangling_Input_Signal,
       sig27(44) => Dangling_Input_Signal,
       sig27(45) => Dangling_Input_Signal,
       sig27(46) => Dangling_Input_Signal,
       sig27(47) => Dangling_Input_Signal,
       sig27(48) => Dangling_Input_Signal,
       sig27(49) => Dangling_Input_Signal,
       sig27(50) => Dangling_Input_Signal,
       sig27(51) => Dangling_Input_Signal,
       sig27(52) => Dangling_Input_Signal,
       sig27(53) => Dangling_Input_Signal,
       sig27(54) => Dangling_Input_Signal,
       sig27(55) => Dangling_Input_Signal,
       sig27(56) => Dangling_Input_Signal,
       sig27(57) => Dangling_Input_Signal,
       sig27(58) => Dangling_Input_Signal,
       sig27(59) => Dangling_Input_Signal,
       sig27(60) => Dangling_Input_Signal,
       sig27(61) => Dangling_Input_Signal,
       sig27(62) => Dangling_Input_Signal,
       sig27(63) => Dangling_Input_Signal,
       sig28(0) => Dangling_Input_Signal,
       sig28(1) => Dangling_Input_Signal,
       sig28(2) => Dangling_Input_Signal,
       sig28(3) => Dangling_Input_Signal,
       sig28(4) => Dangling_Input_Signal,
       sig28(5) => Dangling_Input_Signal,
       sig28(6) => Dangling_Input_Signal,
       sig28(7) => Dangling_Input_Signal,
       sig28(8) => Dangling_Input_Signal,
       sig28(9) => Dangling_Input_Signal,
       sig28(10) => Dangling_Input_Signal,
       sig28(11) => Dangling_Input_Signal,
       sig28(12) => Dangling_Input_Signal,
       sig28(13) => Dangling_Input_Signal,
       sig28(14) => Dangling_Input_Signal,
       sig28(15) => Dangling_Input_Signal,
       sig28(16) => Dangling_Input_Signal,
       sig28(17) => Dangling_Input_Signal,
       sig28(18) => Dangling_Input_Signal,
       sig28(19) => Dangling_Input_Signal,
       sig28(20) => Dangling_Input_Signal,
       sig28(21) => Dangling_Input_Signal,
       sig28(22) => Dangling_Input_Signal,
       sig28(23) => Dangling_Input_Signal,
       sig28(24) => Dangling_Input_Signal,
       sig28(25) => Dangling_Input_Signal,
       sig28(26) => Dangling_Input_Signal,
       sig28(27) => Dangling_Input_Signal,
       sig28(28) => Dangling_Input_Signal,
       sig28(29) => Dangling_Input_Signal,
       sig28(30) => Dangling_Input_Signal,
       sig28(31) => Dangling_Input_Signal,
       sig28(32) => Dangling_Input_Signal,
       sig28(33) => Dangling_Input_Signal,
       sig28(34) => Dangling_Input_Signal,
       sig28(35) => Dangling_Input_Signal,
       sig28(36) => Dangling_Input_Signal,
       sig28(37) => Dangling_Input_Signal,
       sig28(38) => Dangling_Input_Signal,
       sig28(39) => Dangling_Input_Signal,
       sig28(40) => Dangling_Input_Signal,
       sig28(41) => Dangling_Input_Signal,
       sig28(42) => Dangling_Input_Signal,
       sig28(43) => Dangling_Input_Signal,
       sig28(44) => Dangling_Input_Signal,
       sig28(45) => Dangling_Input_Signal,
       sig28(46) => Dangling_Input_Signal,
       sig28(47) => Dangling_Input_Signal,
       sig28(48) => Dangling_Input_Signal,
       sig28(49) => Dangling_Input_Signal,
       sig28(50) => Dangling_Input_Signal,
       sig28(51) => Dangling_Input_Signal,
       sig28(52) => Dangling_Input_Signal,
       sig28(53) => Dangling_Input_Signal,
       sig28(54) => Dangling_Input_Signal,
       sig28(55) => Dangling_Input_Signal,
       sig28(56) => Dangling_Input_Signal,
       sig28(57) => Dangling_Input_Signal,
       sig28(58) => Dangling_Input_Signal,
       sig28(59) => Dangling_Input_Signal,
       sig28(60) => Dangling_Input_Signal,
       sig28(61) => Dangling_Input_Signal,
       sig28(62) => Dangling_Input_Signal,
       sig28(63) => Dangling_Input_Signal,
       sig29(0) => Dangling_Input_Signal,
       sig29(1) => Dangling_Input_Signal,
       sig29(2) => Dangling_Input_Signal,
       sig29(3) => Dangling_Input_Signal,
       sig29(4) => Dangling_Input_Signal,
       sig29(5) => Dangling_Input_Signal,
       sig29(6) => Dangling_Input_Signal,
       sig29(7) => Dangling_Input_Signal,
       sig29(8) => Dangling_Input_Signal,
       sig29(9) => Dangling_Input_Signal,
       sig29(10) => Dangling_Input_Signal,
       sig29(11) => Dangling_Input_Signal,
       sig29(12) => Dangling_Input_Signal,
       sig29(13) => Dangling_Input_Signal,
       sig29(14) => Dangling_Input_Signal,
       sig29(15) => Dangling_Input_Signal,
       sig29(16) => Dangling_Input_Signal,
       sig29(17) => Dangling_Input_Signal,
       sig29(18) => Dangling_Input_Signal,
       sig29(19) => Dangling_Input_Signal,
       sig29(20) => Dangling_Input_Signal,
       sig29(21) => Dangling_Input_Signal,
       sig29(22) => Dangling_Input_Signal,
       sig29(23) => Dangling_Input_Signal,
       sig29(24) => Dangling_Input_Signal,
       sig29(25) => Dangling_Input_Signal,
       sig29(26) => Dangling_Input_Signal,
       sig29(27) => Dangling_Input_Signal,
       sig29(28) => Dangling_Input_Signal,
       sig29(29) => Dangling_Input_Signal,
       sig29(30) => Dangling_Input_Signal,
       sig29(31) => Dangling_Input_Signal,
       sig29(32) => Dangling_Input_Signal,
       sig29(33) => Dangling_Input_Signal,
       sig29(34) => Dangling_Input_Signal,
       sig29(35) => Dangling_Input_Signal,
       sig29(36) => Dangling_Input_Signal,
       sig29(37) => Dangling_Input_Signal,
       sig29(38) => Dangling_Input_Signal,
       sig29(39) => Dangling_Input_Signal,
       sig29(40) => Dangling_Input_Signal,
       sig29(41) => Dangling_Input_Signal,
       sig29(42) => Dangling_Input_Signal,
       sig29(43) => Dangling_Input_Signal,
       sig29(44) => Dangling_Input_Signal,
       sig29(45) => Dangling_Input_Signal,
       sig29(46) => Dangling_Input_Signal,
       sig29(47) => Dangling_Input_Signal,
       sig29(48) => Dangling_Input_Signal,
       sig29(49) => Dangling_Input_Signal,
       sig29(50) => Dangling_Input_Signal,
       sig29(51) => Dangling_Input_Signal,
       sig29(52) => Dangling_Input_Signal,
       sig29(53) => Dangling_Input_Signal,
       sig29(54) => Dangling_Input_Signal,
       sig29(55) => Dangling_Input_Signal,
       sig29(56) => Dangling_Input_Signal,
       sig29(57) => Dangling_Input_Signal,
       sig29(58) => Dangling_Input_Signal,
       sig29(59) => Dangling_Input_Signal,
       sig29(60) => Dangling_Input_Signal,
       sig29(61) => Dangling_Input_Signal,
       sig29(62) => Dangling_Input_Signal,
       sig29(63) => Dangling_Input_Signal,
       sig30(0) => Dangling_Input_Signal,
       sig30(1) => Dangling_Input_Signal,
       sig30(2) => Dangling_Input_Signal,
       sig30(3) => Dangling_Input_Signal,
       sig30(4) => Dangling_Input_Signal,
       sig30(5) => Dangling_Input_Signal,
       sig30(6) => Dangling_Input_Signal,
       sig30(7) => Dangling_Input_Signal,
       sig30(8) => Dangling_Input_Signal,
       sig30(9) => Dangling_Input_Signal,
       sig30(10) => Dangling_Input_Signal,
       sig30(11) => Dangling_Input_Signal,
       sig30(12) => Dangling_Input_Signal,
       sig30(13) => Dangling_Input_Signal,
       sig30(14) => Dangling_Input_Signal,
       sig30(15) => Dangling_Input_Signal,
       sig30(16) => Dangling_Input_Signal,
       sig30(17) => Dangling_Input_Signal,
       sig30(18) => Dangling_Input_Signal,
       sig30(19) => Dangling_Input_Signal,
       sig30(20) => Dangling_Input_Signal,
       sig30(21) => Dangling_Input_Signal,
       sig30(22) => Dangling_Input_Signal,
       sig30(23) => Dangling_Input_Signal,
       sig30(24) => Dangling_Input_Signal,
       sig30(25) => Dangling_Input_Signal,
       sig30(26) => Dangling_Input_Signal,
       sig30(27) => Dangling_Input_Signal,
       sig30(28) => Dangling_Input_Signal,
       sig30(29) => Dangling_Input_Signal,
       sig30(30) => Dangling_Input_Signal,
       sig30(31) => Dangling_Input_Signal,
       sig30(32) => Dangling_Input_Signal,
       sig30(33) => Dangling_Input_Signal,
       sig30(34) => Dangling_Input_Signal,
       sig30(35) => Dangling_Input_Signal,
       sig30(36) => Dangling_Input_Signal,
       sig30(37) => Dangling_Input_Signal,
       sig30(38) => Dangling_Input_Signal,
       sig30(39) => Dangling_Input_Signal,
       sig30(40) => Dangling_Input_Signal,
       sig30(41) => Dangling_Input_Signal,
       sig30(42) => Dangling_Input_Signal,
       sig30(43) => Dangling_Input_Signal,
       sig30(44) => Dangling_Input_Signal,
       sig30(45) => Dangling_Input_Signal,
       sig30(46) => Dangling_Input_Signal,
       sig30(47) => Dangling_Input_Signal,
       sig30(48) => Dangling_Input_Signal,
       sig30(49) => Dangling_Input_Signal,
       sig30(50) => Dangling_Input_Signal,
       sig30(51) => Dangling_Input_Signal,
       sig30(52) => Dangling_Input_Signal,
       sig30(53) => Dangling_Input_Signal,
       sig30(54) => Dangling_Input_Signal,
       sig30(55) => Dangling_Input_Signal,
       sig30(56) => Dangling_Input_Signal,
       sig30(57) => Dangling_Input_Signal,
       sig30(58) => Dangling_Input_Signal,
       sig30(59) => Dangling_Input_Signal,
       sig30(60) => Dangling_Input_Signal,
       sig30(61) => Dangling_Input_Signal,
       sig30(62) => Dangling_Input_Signal,
       sig30(63) => Dangling_Input_Signal,
       sig31(0) => Dangling_Input_Signal,
       sig31(1) => Dangling_Input_Signal,
       sig31(2) => Dangling_Input_Signal,
       sig31(3) => Dangling_Input_Signal,
       sig31(4) => Dangling_Input_Signal,
       sig31(5) => Dangling_Input_Signal,
       sig31(6) => Dangling_Input_Signal,
       sig31(7) => Dangling_Input_Signal,
       sig31(8) => Dangling_Input_Signal,
       sig31(9) => Dangling_Input_Signal,
       sig31(10) => Dangling_Input_Signal,
       sig31(11) => Dangling_Input_Signal,
       sig31(12) => Dangling_Input_Signal,
       sig31(13) => Dangling_Input_Signal,
       sig31(14) => Dangling_Input_Signal,
       sig31(15) => Dangling_Input_Signal,
       sig31(16) => Dangling_Input_Signal,
       sig31(17) => Dangling_Input_Signal,
       sig31(18) => Dangling_Input_Signal,
       sig31(19) => Dangling_Input_Signal,
       sig31(20) => Dangling_Input_Signal,
       sig31(21) => Dangling_Input_Signal,
       sig31(22) => Dangling_Input_Signal,
       sig31(23) => Dangling_Input_Signal,
       sig31(24) => Dangling_Input_Signal,
       sig31(25) => Dangling_Input_Signal,
       sig31(26) => Dangling_Input_Signal,
       sig31(27) => Dangling_Input_Signal,
       sig31(28) => Dangling_Input_Signal,
       sig31(29) => Dangling_Input_Signal,
       sig31(30) => Dangling_Input_Signal,
       sig31(31) => Dangling_Input_Signal,
       sig31(32) => Dangling_Input_Signal,
       sig31(33) => Dangling_Input_Signal,
       sig31(34) => Dangling_Input_Signal,
       sig31(35) => Dangling_Input_Signal,
       sig31(36) => Dangling_Input_Signal,
       sig31(37) => Dangling_Input_Signal,
       sig31(38) => Dangling_Input_Signal,
       sig31(39) => Dangling_Input_Signal,
       sig31(40) => Dangling_Input_Signal,
       sig31(41) => Dangling_Input_Signal,
       sig31(42) => Dangling_Input_Signal,
       sig31(43) => Dangling_Input_Signal,
       sig31(44) => Dangling_Input_Signal,
       sig31(45) => Dangling_Input_Signal,
       sig31(46) => Dangling_Input_Signal,
       sig31(47) => Dangling_Input_Signal,
       sig31(48) => Dangling_Input_Signal,
       sig31(49) => Dangling_Input_Signal,
       sig31(50) => Dangling_Input_Signal,
       sig31(51) => Dangling_Input_Signal,
       sig31(52) => Dangling_Input_Signal,
       sig31(53) => Dangling_Input_Signal,
       sig31(54) => Dangling_Input_Signal,
       sig31(55) => Dangling_Input_Signal,
       sig31(56) => Dangling_Input_Signal,
       sig31(57) => Dangling_Input_Signal,
       sig31(58) => Dangling_Input_Signal,
       sig31(59) => Dangling_Input_Signal,
       sig31(60) => Dangling_Input_Signal,
       sig31(61) => Dangling_Input_Signal,
       sig31(62) => Dangling_Input_Signal,
       sig31(63) => Dangling_Input_Signal,
       clk0 => clk0,
       out64 => rd_data_out_stat,
       rdaddr => rx_addr,
       rden => NET41961,
       sig0 => ld_reg,
       sig1 => ld_reg_1,
       sig10 => rdb10,
       sig11 => rdb11,
       sig12 => rdb12,
       sig13 => rdb13,
       sig14 => rdb14,
       sig15 => rdb15,
       sig16 => rdb16,
       sig17 => rdb17,
       sig2 => ld_reg_2,
       sig20 => rdb20,
       sig3 => ld_reg_3,
       sig4 => ld_reg_4,
       sig5 => ld_regv1,
       sig6 => ld_regv2,
       sig7 => rdb7,
       sig8 => rdb8,
       sig9 => rdb9
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
       in2 => muxsel_3,
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

U322 : reg_read_decode_p
  port map(
       sig10(0) => Dangling_Input_Signal,
       sig10(1) => Dangling_Input_Signal,
       sig10(2) => Dangling_Input_Signal,
       sig10(3) => Dangling_Input_Signal,
       sig10(4) => Dangling_Input_Signal,
       sig10(5) => Dangling_Input_Signal,
       sig10(6) => Dangling_Input_Signal,
       sig10(7) => Dangling_Input_Signal,
       sig10(8) => Dangling_Input_Signal,
       sig10(9) => Dangling_Input_Signal,
       sig10(10) => Dangling_Input_Signal,
       sig10(11) => Dangling_Input_Signal,
       sig10(12) => Dangling_Input_Signal,
       sig10(13) => Dangling_Input_Signal,
       sig10(14) => Dangling_Input_Signal,
       sig10(15) => Dangling_Input_Signal,
       sig10(16) => Dangling_Input_Signal,
       sig10(17) => Dangling_Input_Signal,
       sig10(18) => Dangling_Input_Signal,
       sig10(19) => Dangling_Input_Signal,
       sig10(20) => Dangling_Input_Signal,
       sig10(21) => Dangling_Input_Signal,
       sig10(22) => Dangling_Input_Signal,
       sig10(23) => Dangling_Input_Signal,
       sig10(24) => Dangling_Input_Signal,
       sig10(25) => Dangling_Input_Signal,
       sig10(26) => Dangling_Input_Signal,
       sig10(27) => Dangling_Input_Signal,
       sig10(28) => Dangling_Input_Signal,
       sig10(29) => Dangling_Input_Signal,
       sig10(30) => Dangling_Input_Signal,
       sig10(31) => Dangling_Input_Signal,
       sig10(32) => Dangling_Input_Signal,
       sig10(33) => Dangling_Input_Signal,
       sig10(34) => Dangling_Input_Signal,
       sig10(35) => Dangling_Input_Signal,
       sig10(36) => Dangling_Input_Signal,
       sig10(37) => Dangling_Input_Signal,
       sig10(38) => Dangling_Input_Signal,
       sig10(39) => Dangling_Input_Signal,
       sig10(40) => Dangling_Input_Signal,
       sig10(41) => Dangling_Input_Signal,
       sig10(42) => Dangling_Input_Signal,
       sig10(43) => Dangling_Input_Signal,
       sig10(44) => Dangling_Input_Signal,
       sig10(45) => Dangling_Input_Signal,
       sig10(46) => Dangling_Input_Signal,
       sig10(47) => Dangling_Input_Signal,
       sig10(48) => Dangling_Input_Signal,
       sig10(49) => Dangling_Input_Signal,
       sig10(50) => Dangling_Input_Signal,
       sig10(51) => Dangling_Input_Signal,
       sig10(52) => Dangling_Input_Signal,
       sig10(53) => Dangling_Input_Signal,
       sig10(54) => Dangling_Input_Signal,
       sig10(55) => Dangling_Input_Signal,
       sig10(56) => Dangling_Input_Signal,
       sig10(57) => Dangling_Input_Signal,
       sig10(58) => Dangling_Input_Signal,
       sig10(59) => Dangling_Input_Signal,
       sig10(60) => Dangling_Input_Signal,
       sig10(61) => Dangling_Input_Signal,
       sig10(62) => Dangling_Input_Signal,
       sig10(63) => Dangling_Input_Signal,
       sig11(0) => Dangling_Input_Signal,
       sig11(1) => Dangling_Input_Signal,
       sig11(2) => Dangling_Input_Signal,
       sig11(3) => Dangling_Input_Signal,
       sig11(4) => Dangling_Input_Signal,
       sig11(5) => Dangling_Input_Signal,
       sig11(6) => Dangling_Input_Signal,
       sig11(7) => Dangling_Input_Signal,
       sig11(8) => Dangling_Input_Signal,
       sig11(9) => Dangling_Input_Signal,
       sig11(10) => Dangling_Input_Signal,
       sig11(11) => Dangling_Input_Signal,
       sig11(12) => Dangling_Input_Signal,
       sig11(13) => Dangling_Input_Signal,
       sig11(14) => Dangling_Input_Signal,
       sig11(15) => Dangling_Input_Signal,
       sig11(16) => Dangling_Input_Signal,
       sig11(17) => Dangling_Input_Signal,
       sig11(18) => Dangling_Input_Signal,
       sig11(19) => Dangling_Input_Signal,
       sig11(20) => Dangling_Input_Signal,
       sig11(21) => Dangling_Input_Signal,
       sig11(22) => Dangling_Input_Signal,
       sig11(23) => Dangling_Input_Signal,
       sig11(24) => Dangling_Input_Signal,
       sig11(25) => Dangling_Input_Signal,
       sig11(26) => Dangling_Input_Signal,
       sig11(27) => Dangling_Input_Signal,
       sig11(28) => Dangling_Input_Signal,
       sig11(29) => Dangling_Input_Signal,
       sig11(30) => Dangling_Input_Signal,
       sig11(31) => Dangling_Input_Signal,
       sig11(32) => Dangling_Input_Signal,
       sig11(33) => Dangling_Input_Signal,
       sig11(34) => Dangling_Input_Signal,
       sig11(35) => Dangling_Input_Signal,
       sig11(36) => Dangling_Input_Signal,
       sig11(37) => Dangling_Input_Signal,
       sig11(38) => Dangling_Input_Signal,
       sig11(39) => Dangling_Input_Signal,
       sig11(40) => Dangling_Input_Signal,
       sig11(41) => Dangling_Input_Signal,
       sig11(42) => Dangling_Input_Signal,
       sig11(43) => Dangling_Input_Signal,
       sig11(44) => Dangling_Input_Signal,
       sig11(45) => Dangling_Input_Signal,
       sig11(46) => Dangling_Input_Signal,
       sig11(47) => Dangling_Input_Signal,
       sig11(48) => Dangling_Input_Signal,
       sig11(49) => Dangling_Input_Signal,
       sig11(50) => Dangling_Input_Signal,
       sig11(51) => Dangling_Input_Signal,
       sig11(52) => Dangling_Input_Signal,
       sig11(53) => Dangling_Input_Signal,
       sig11(54) => Dangling_Input_Signal,
       sig11(55) => Dangling_Input_Signal,
       sig11(56) => Dangling_Input_Signal,
       sig11(57) => Dangling_Input_Signal,
       sig11(58) => Dangling_Input_Signal,
       sig11(59) => Dangling_Input_Signal,
       sig11(60) => Dangling_Input_Signal,
       sig11(61) => Dangling_Input_Signal,
       sig11(62) => Dangling_Input_Signal,
       sig11(63) => Dangling_Input_Signal,
       sig12(0) => Dangling_Input_Signal,
       sig12(1) => Dangling_Input_Signal,
       sig12(2) => Dangling_Input_Signal,
       sig12(3) => Dangling_Input_Signal,
       sig12(4) => Dangling_Input_Signal,
       sig12(5) => Dangling_Input_Signal,
       sig12(6) => Dangling_Input_Signal,
       sig12(7) => Dangling_Input_Signal,
       sig12(8) => Dangling_Input_Signal,
       sig12(9) => Dangling_Input_Signal,
       sig12(10) => Dangling_Input_Signal,
       sig12(11) => Dangling_Input_Signal,
       sig12(12) => Dangling_Input_Signal,
       sig12(13) => Dangling_Input_Signal,
       sig12(14) => Dangling_Input_Signal,
       sig12(15) => Dangling_Input_Signal,
       sig12(16) => Dangling_Input_Signal,
       sig12(17) => Dangling_Input_Signal,
       sig12(18) => Dangling_Input_Signal,
       sig12(19) => Dangling_Input_Signal,
       sig12(20) => Dangling_Input_Signal,
       sig12(21) => Dangling_Input_Signal,
       sig12(22) => Dangling_Input_Signal,
       sig12(23) => Dangling_Input_Signal,
       sig12(24) => Dangling_Input_Signal,
       sig12(25) => Dangling_Input_Signal,
       sig12(26) => Dangling_Input_Signal,
       sig12(27) => Dangling_Input_Signal,
       sig12(28) => Dangling_Input_Signal,
       sig12(29) => Dangling_Input_Signal,
       sig12(30) => Dangling_Input_Signal,
       sig12(31) => Dangling_Input_Signal,
       sig12(32) => Dangling_Input_Signal,
       sig12(33) => Dangling_Input_Signal,
       sig12(34) => Dangling_Input_Signal,
       sig12(35) => Dangling_Input_Signal,
       sig12(36) => Dangling_Input_Signal,
       sig12(37) => Dangling_Input_Signal,
       sig12(38) => Dangling_Input_Signal,
       sig12(39) => Dangling_Input_Signal,
       sig12(40) => Dangling_Input_Signal,
       sig12(41) => Dangling_Input_Signal,
       sig12(42) => Dangling_Input_Signal,
       sig12(43) => Dangling_Input_Signal,
       sig12(44) => Dangling_Input_Signal,
       sig12(45) => Dangling_Input_Signal,
       sig12(46) => Dangling_Input_Signal,
       sig12(47) => Dangling_Input_Signal,
       sig12(48) => Dangling_Input_Signal,
       sig12(49) => Dangling_Input_Signal,
       sig12(50) => Dangling_Input_Signal,
       sig12(51) => Dangling_Input_Signal,
       sig12(52) => Dangling_Input_Signal,
       sig12(53) => Dangling_Input_Signal,
       sig12(54) => Dangling_Input_Signal,
       sig12(55) => Dangling_Input_Signal,
       sig12(56) => Dangling_Input_Signal,
       sig12(57) => Dangling_Input_Signal,
       sig12(58) => Dangling_Input_Signal,
       sig12(59) => Dangling_Input_Signal,
       sig12(60) => Dangling_Input_Signal,
       sig12(61) => Dangling_Input_Signal,
       sig12(62) => Dangling_Input_Signal,
       sig12(63) => Dangling_Input_Signal,
       sig13(0) => Dangling_Input_Signal,
       sig13(1) => Dangling_Input_Signal,
       sig13(2) => Dangling_Input_Signal,
       sig13(3) => Dangling_Input_Signal,
       sig13(4) => Dangling_Input_Signal,
       sig13(5) => Dangling_Input_Signal,
       sig13(6) => Dangling_Input_Signal,
       sig13(7) => Dangling_Input_Signal,
       sig13(8) => Dangling_Input_Signal,
       sig13(9) => Dangling_Input_Signal,
       sig13(10) => Dangling_Input_Signal,
       sig13(11) => Dangling_Input_Signal,
       sig13(12) => Dangling_Input_Signal,
       sig13(13) => Dangling_Input_Signal,
       sig13(14) => Dangling_Input_Signal,
       sig13(15) => Dangling_Input_Signal,
       sig13(16) => Dangling_Input_Signal,
       sig13(17) => Dangling_Input_Signal,
       sig13(18) => Dangling_Input_Signal,
       sig13(19) => Dangling_Input_Signal,
       sig13(20) => Dangling_Input_Signal,
       sig13(21) => Dangling_Input_Signal,
       sig13(22) => Dangling_Input_Signal,
       sig13(23) => Dangling_Input_Signal,
       sig13(24) => Dangling_Input_Signal,
       sig13(25) => Dangling_Input_Signal,
       sig13(26) => Dangling_Input_Signal,
       sig13(27) => Dangling_Input_Signal,
       sig13(28) => Dangling_Input_Signal,
       sig13(29) => Dangling_Input_Signal,
       sig13(30) => Dangling_Input_Signal,
       sig13(31) => Dangling_Input_Signal,
       sig13(32) => Dangling_Input_Signal,
       sig13(33) => Dangling_Input_Signal,
       sig13(34) => Dangling_Input_Signal,
       sig13(35) => Dangling_Input_Signal,
       sig13(36) => Dangling_Input_Signal,
       sig13(37) => Dangling_Input_Signal,
       sig13(38) => Dangling_Input_Signal,
       sig13(39) => Dangling_Input_Signal,
       sig13(40) => Dangling_Input_Signal,
       sig13(41) => Dangling_Input_Signal,
       sig13(42) => Dangling_Input_Signal,
       sig13(43) => Dangling_Input_Signal,
       sig13(44) => Dangling_Input_Signal,
       sig13(45) => Dangling_Input_Signal,
       sig13(46) => Dangling_Input_Signal,
       sig13(47) => Dangling_Input_Signal,
       sig13(48) => Dangling_Input_Signal,
       sig13(49) => Dangling_Input_Signal,
       sig13(50) => Dangling_Input_Signal,
       sig13(51) => Dangling_Input_Signal,
       sig13(52) => Dangling_Input_Signal,
       sig13(53) => Dangling_Input_Signal,
       sig13(54) => Dangling_Input_Signal,
       sig13(55) => Dangling_Input_Signal,
       sig13(56) => Dangling_Input_Signal,
       sig13(57) => Dangling_Input_Signal,
       sig13(58) => Dangling_Input_Signal,
       sig13(59) => Dangling_Input_Signal,
       sig13(60) => Dangling_Input_Signal,
       sig13(61) => Dangling_Input_Signal,
       sig13(62) => Dangling_Input_Signal,
       sig13(63) => Dangling_Input_Signal,
       sig14(0) => Dangling_Input_Signal,
       sig14(1) => Dangling_Input_Signal,
       sig14(2) => Dangling_Input_Signal,
       sig14(3) => Dangling_Input_Signal,
       sig14(4) => Dangling_Input_Signal,
       sig14(5) => Dangling_Input_Signal,
       sig14(6) => Dangling_Input_Signal,
       sig14(7) => Dangling_Input_Signal,
       sig14(8) => Dangling_Input_Signal,
       sig14(9) => Dangling_Input_Signal,
       sig14(10) => Dangling_Input_Signal,
       sig14(11) => Dangling_Input_Signal,
       sig14(12) => Dangling_Input_Signal,
       sig14(13) => Dangling_Input_Signal,
       sig14(14) => Dangling_Input_Signal,
       sig14(15) => Dangling_Input_Signal,
       sig14(16) => Dangling_Input_Signal,
       sig14(17) => Dangling_Input_Signal,
       sig14(18) => Dangling_Input_Signal,
       sig14(19) => Dangling_Input_Signal,
       sig14(20) => Dangling_Input_Signal,
       sig14(21) => Dangling_Input_Signal,
       sig14(22) => Dangling_Input_Signal,
       sig14(23) => Dangling_Input_Signal,
       sig14(24) => Dangling_Input_Signal,
       sig14(25) => Dangling_Input_Signal,
       sig14(26) => Dangling_Input_Signal,
       sig14(27) => Dangling_Input_Signal,
       sig14(28) => Dangling_Input_Signal,
       sig14(29) => Dangling_Input_Signal,
       sig14(30) => Dangling_Input_Signal,
       sig14(31) => Dangling_Input_Signal,
       sig14(32) => Dangling_Input_Signal,
       sig14(33) => Dangling_Input_Signal,
       sig14(34) => Dangling_Input_Signal,
       sig14(35) => Dangling_Input_Signal,
       sig14(36) => Dangling_Input_Signal,
       sig14(37) => Dangling_Input_Signal,
       sig14(38) => Dangling_Input_Signal,
       sig14(39) => Dangling_Input_Signal,
       sig14(40) => Dangling_Input_Signal,
       sig14(41) => Dangling_Input_Signal,
       sig14(42) => Dangling_Input_Signal,
       sig14(43) => Dangling_Input_Signal,
       sig14(44) => Dangling_Input_Signal,
       sig14(45) => Dangling_Input_Signal,
       sig14(46) => Dangling_Input_Signal,
       sig14(47) => Dangling_Input_Signal,
       sig14(48) => Dangling_Input_Signal,
       sig14(49) => Dangling_Input_Signal,
       sig14(50) => Dangling_Input_Signal,
       sig14(51) => Dangling_Input_Signal,
       sig14(52) => Dangling_Input_Signal,
       sig14(53) => Dangling_Input_Signal,
       sig14(54) => Dangling_Input_Signal,
       sig14(55) => Dangling_Input_Signal,
       sig14(56) => Dangling_Input_Signal,
       sig14(57) => Dangling_Input_Signal,
       sig14(58) => Dangling_Input_Signal,
       sig14(59) => Dangling_Input_Signal,
       sig14(60) => Dangling_Input_Signal,
       sig14(61) => Dangling_Input_Signal,
       sig14(62) => Dangling_Input_Signal,
       sig14(63) => Dangling_Input_Signal,
       sig15(0) => Dangling_Input_Signal,
       sig15(1) => Dangling_Input_Signal,
       sig15(2) => Dangling_Input_Signal,
       sig15(3) => Dangling_Input_Signal,
       sig15(4) => Dangling_Input_Signal,
       sig15(5) => Dangling_Input_Signal,
       sig15(6) => Dangling_Input_Signal,
       sig15(7) => Dangling_Input_Signal,
       sig15(8) => Dangling_Input_Signal,
       sig15(9) => Dangling_Input_Signal,
       sig15(10) => Dangling_Input_Signal,
       sig15(11) => Dangling_Input_Signal,
       sig15(12) => Dangling_Input_Signal,
       sig15(13) => Dangling_Input_Signal,
       sig15(14) => Dangling_Input_Signal,
       sig15(15) => Dangling_Input_Signal,
       sig15(16) => Dangling_Input_Signal,
       sig15(17) => Dangling_Input_Signal,
       sig15(18) => Dangling_Input_Signal,
       sig15(19) => Dangling_Input_Signal,
       sig15(20) => Dangling_Input_Signal,
       sig15(21) => Dangling_Input_Signal,
       sig15(22) => Dangling_Input_Signal,
       sig15(23) => Dangling_Input_Signal,
       sig15(24) => Dangling_Input_Signal,
       sig15(25) => Dangling_Input_Signal,
       sig15(26) => Dangling_Input_Signal,
       sig15(27) => Dangling_Input_Signal,
       sig15(28) => Dangling_Input_Signal,
       sig15(29) => Dangling_Input_Signal,
       sig15(30) => Dangling_Input_Signal,
       sig15(31) => Dangling_Input_Signal,
       sig15(32) => Dangling_Input_Signal,
       sig15(33) => Dangling_Input_Signal,
       sig15(34) => Dangling_Input_Signal,
       sig15(35) => Dangling_Input_Signal,
       sig15(36) => Dangling_Input_Signal,
       sig15(37) => Dangling_Input_Signal,
       sig15(38) => Dangling_Input_Signal,
       sig15(39) => Dangling_Input_Signal,
       sig15(40) => Dangling_Input_Signal,
       sig15(41) => Dangling_Input_Signal,
       sig15(42) => Dangling_Input_Signal,
       sig15(43) => Dangling_Input_Signal,
       sig15(44) => Dangling_Input_Signal,
       sig15(45) => Dangling_Input_Signal,
       sig15(46) => Dangling_Input_Signal,
       sig15(47) => Dangling_Input_Signal,
       sig15(48) => Dangling_Input_Signal,
       sig15(49) => Dangling_Input_Signal,
       sig15(50) => Dangling_Input_Signal,
       sig15(51) => Dangling_Input_Signal,
       sig15(52) => Dangling_Input_Signal,
       sig15(53) => Dangling_Input_Signal,
       sig15(54) => Dangling_Input_Signal,
       sig15(55) => Dangling_Input_Signal,
       sig15(56) => Dangling_Input_Signal,
       sig15(57) => Dangling_Input_Signal,
       sig15(58) => Dangling_Input_Signal,
       sig15(59) => Dangling_Input_Signal,
       sig15(60) => Dangling_Input_Signal,
       sig15(61) => Dangling_Input_Signal,
       sig15(62) => Dangling_Input_Signal,
       sig15(63) => Dangling_Input_Signal,
       sig16(0) => Dangling_Input_Signal,
       sig16(1) => Dangling_Input_Signal,
       sig16(2) => Dangling_Input_Signal,
       sig16(3) => Dangling_Input_Signal,
       sig16(4) => Dangling_Input_Signal,
       sig16(5) => Dangling_Input_Signal,
       sig16(6) => Dangling_Input_Signal,
       sig16(7) => Dangling_Input_Signal,
       sig16(8) => Dangling_Input_Signal,
       sig16(9) => Dangling_Input_Signal,
       sig16(10) => Dangling_Input_Signal,
       sig16(11) => Dangling_Input_Signal,
       sig16(12) => Dangling_Input_Signal,
       sig16(13) => Dangling_Input_Signal,
       sig16(14) => Dangling_Input_Signal,
       sig16(15) => Dangling_Input_Signal,
       sig16(16) => Dangling_Input_Signal,
       sig16(17) => Dangling_Input_Signal,
       sig16(18) => Dangling_Input_Signal,
       sig16(19) => Dangling_Input_Signal,
       sig16(20) => Dangling_Input_Signal,
       sig16(21) => Dangling_Input_Signal,
       sig16(22) => Dangling_Input_Signal,
       sig16(23) => Dangling_Input_Signal,
       sig16(24) => Dangling_Input_Signal,
       sig16(25) => Dangling_Input_Signal,
       sig16(26) => Dangling_Input_Signal,
       sig16(27) => Dangling_Input_Signal,
       sig16(28) => Dangling_Input_Signal,
       sig16(29) => Dangling_Input_Signal,
       sig16(30) => Dangling_Input_Signal,
       sig16(31) => Dangling_Input_Signal,
       sig16(32) => Dangling_Input_Signal,
       sig16(33) => Dangling_Input_Signal,
       sig16(34) => Dangling_Input_Signal,
       sig16(35) => Dangling_Input_Signal,
       sig16(36) => Dangling_Input_Signal,
       sig16(37) => Dangling_Input_Signal,
       sig16(38) => Dangling_Input_Signal,
       sig16(39) => Dangling_Input_Signal,
       sig16(40) => Dangling_Input_Signal,
       sig16(41) => Dangling_Input_Signal,
       sig16(42) => Dangling_Input_Signal,
       sig16(43) => Dangling_Input_Signal,
       sig16(44) => Dangling_Input_Signal,
       sig16(45) => Dangling_Input_Signal,
       sig16(46) => Dangling_Input_Signal,
       sig16(47) => Dangling_Input_Signal,
       sig16(48) => Dangling_Input_Signal,
       sig16(49) => Dangling_Input_Signal,
       sig16(50) => Dangling_Input_Signal,
       sig16(51) => Dangling_Input_Signal,
       sig16(52) => Dangling_Input_Signal,
       sig16(53) => Dangling_Input_Signal,
       sig16(54) => Dangling_Input_Signal,
       sig16(55) => Dangling_Input_Signal,
       sig16(56) => Dangling_Input_Signal,
       sig16(57) => Dangling_Input_Signal,
       sig16(58) => Dangling_Input_Signal,
       sig16(59) => Dangling_Input_Signal,
       sig16(60) => Dangling_Input_Signal,
       sig16(61) => Dangling_Input_Signal,
       sig16(62) => Dangling_Input_Signal,
       sig16(63) => Dangling_Input_Signal,
       sig17(0) => Dangling_Input_Signal,
       sig17(1) => Dangling_Input_Signal,
       sig17(2) => Dangling_Input_Signal,
       sig17(3) => Dangling_Input_Signal,
       sig17(4) => Dangling_Input_Signal,
       sig17(5) => Dangling_Input_Signal,
       sig17(6) => Dangling_Input_Signal,
       sig17(7) => Dangling_Input_Signal,
       sig17(8) => Dangling_Input_Signal,
       sig17(9) => Dangling_Input_Signal,
       sig17(10) => Dangling_Input_Signal,
       sig17(11) => Dangling_Input_Signal,
       sig17(12) => Dangling_Input_Signal,
       sig17(13) => Dangling_Input_Signal,
       sig17(14) => Dangling_Input_Signal,
       sig17(15) => Dangling_Input_Signal,
       sig17(16) => Dangling_Input_Signal,
       sig17(17) => Dangling_Input_Signal,
       sig17(18) => Dangling_Input_Signal,
       sig17(19) => Dangling_Input_Signal,
       sig17(20) => Dangling_Input_Signal,
       sig17(21) => Dangling_Input_Signal,
       sig17(22) => Dangling_Input_Signal,
       sig17(23) => Dangling_Input_Signal,
       sig17(24) => Dangling_Input_Signal,
       sig17(25) => Dangling_Input_Signal,
       sig17(26) => Dangling_Input_Signal,
       sig17(27) => Dangling_Input_Signal,
       sig17(28) => Dangling_Input_Signal,
       sig17(29) => Dangling_Input_Signal,
       sig17(30) => Dangling_Input_Signal,
       sig17(31) => Dangling_Input_Signal,
       sig17(32) => Dangling_Input_Signal,
       sig17(33) => Dangling_Input_Signal,
       sig17(34) => Dangling_Input_Signal,
       sig17(35) => Dangling_Input_Signal,
       sig17(36) => Dangling_Input_Signal,
       sig17(37) => Dangling_Input_Signal,
       sig17(38) => Dangling_Input_Signal,
       sig17(39) => Dangling_Input_Signal,
       sig17(40) => Dangling_Input_Signal,
       sig17(41) => Dangling_Input_Signal,
       sig17(42) => Dangling_Input_Signal,
       sig17(43) => Dangling_Input_Signal,
       sig17(44) => Dangling_Input_Signal,
       sig17(45) => Dangling_Input_Signal,
       sig17(46) => Dangling_Input_Signal,
       sig17(47) => Dangling_Input_Signal,
       sig17(48) => Dangling_Input_Signal,
       sig17(49) => Dangling_Input_Signal,
       sig17(50) => Dangling_Input_Signal,
       sig17(51) => Dangling_Input_Signal,
       sig17(52) => Dangling_Input_Signal,
       sig17(53) => Dangling_Input_Signal,
       sig17(54) => Dangling_Input_Signal,
       sig17(55) => Dangling_Input_Signal,
       sig17(56) => Dangling_Input_Signal,
       sig17(57) => Dangling_Input_Signal,
       sig17(58) => Dangling_Input_Signal,
       sig17(59) => Dangling_Input_Signal,
       sig17(60) => Dangling_Input_Signal,
       sig17(61) => Dangling_Input_Signal,
       sig17(62) => Dangling_Input_Signal,
       sig17(63) => Dangling_Input_Signal,
       sig19(0) => Dangling_Input_Signal,
       sig19(1) => Dangling_Input_Signal,
       sig19(2) => Dangling_Input_Signal,
       sig19(3) => Dangling_Input_Signal,
       sig19(4) => Dangling_Input_Signal,
       sig19(5) => Dangling_Input_Signal,
       sig19(6) => Dangling_Input_Signal,
       sig19(7) => Dangling_Input_Signal,
       sig19(8) => Dangling_Input_Signal,
       sig19(9) => Dangling_Input_Signal,
       sig19(10) => Dangling_Input_Signal,
       sig19(11) => Dangling_Input_Signal,
       sig19(12) => Dangling_Input_Signal,
       sig19(13) => Dangling_Input_Signal,
       sig19(14) => Dangling_Input_Signal,
       sig19(15) => Dangling_Input_Signal,
       sig19(16) => Dangling_Input_Signal,
       sig19(17) => Dangling_Input_Signal,
       sig19(18) => Dangling_Input_Signal,
       sig19(19) => Dangling_Input_Signal,
       sig19(20) => Dangling_Input_Signal,
       sig19(21) => Dangling_Input_Signal,
       sig19(22) => Dangling_Input_Signal,
       sig19(23) => Dangling_Input_Signal,
       sig19(24) => Dangling_Input_Signal,
       sig19(25) => Dangling_Input_Signal,
       sig19(26) => Dangling_Input_Signal,
       sig19(27) => Dangling_Input_Signal,
       sig19(28) => Dangling_Input_Signal,
       sig19(29) => Dangling_Input_Signal,
       sig19(30) => Dangling_Input_Signal,
       sig19(31) => Dangling_Input_Signal,
       sig19(32) => Dangling_Input_Signal,
       sig19(33) => Dangling_Input_Signal,
       sig19(34) => Dangling_Input_Signal,
       sig19(35) => Dangling_Input_Signal,
       sig19(36) => Dangling_Input_Signal,
       sig19(37) => Dangling_Input_Signal,
       sig19(38) => Dangling_Input_Signal,
       sig19(39) => Dangling_Input_Signal,
       sig19(40) => Dangling_Input_Signal,
       sig19(41) => Dangling_Input_Signal,
       sig19(42) => Dangling_Input_Signal,
       sig19(43) => Dangling_Input_Signal,
       sig19(44) => Dangling_Input_Signal,
       sig19(45) => Dangling_Input_Signal,
       sig19(46) => Dangling_Input_Signal,
       sig19(47) => Dangling_Input_Signal,
       sig19(48) => Dangling_Input_Signal,
       sig19(49) => Dangling_Input_Signal,
       sig19(50) => Dangling_Input_Signal,
       sig19(51) => Dangling_Input_Signal,
       sig19(52) => Dangling_Input_Signal,
       sig19(53) => Dangling_Input_Signal,
       sig19(54) => Dangling_Input_Signal,
       sig19(55) => Dangling_Input_Signal,
       sig19(56) => Dangling_Input_Signal,
       sig19(57) => Dangling_Input_Signal,
       sig19(58) => Dangling_Input_Signal,
       sig19(59) => Dangling_Input_Signal,
       sig19(60) => Dangling_Input_Signal,
       sig19(61) => Dangling_Input_Signal,
       sig19(62) => Dangling_Input_Signal,
       sig19(63) => Dangling_Input_Signal,
       sig20(0) => Dangling_Input_Signal,
       sig20(1) => Dangling_Input_Signal,
       sig20(2) => Dangling_Input_Signal,
       sig20(3) => Dangling_Input_Signal,
       sig20(4) => Dangling_Input_Signal,
       sig20(5) => Dangling_Input_Signal,
       sig20(6) => Dangling_Input_Signal,
       sig20(7) => Dangling_Input_Signal,
       sig20(8) => Dangling_Input_Signal,
       sig20(9) => Dangling_Input_Signal,
       sig20(10) => Dangling_Input_Signal,
       sig20(11) => Dangling_Input_Signal,
       sig20(12) => Dangling_Input_Signal,
       sig20(13) => Dangling_Input_Signal,
       sig20(14) => Dangling_Input_Signal,
       sig20(15) => Dangling_Input_Signal,
       sig20(16) => Dangling_Input_Signal,
       sig20(17) => Dangling_Input_Signal,
       sig20(18) => Dangling_Input_Signal,
       sig20(19) => Dangling_Input_Signal,
       sig20(20) => Dangling_Input_Signal,
       sig20(21) => Dangling_Input_Signal,
       sig20(22) => Dangling_Input_Signal,
       sig20(23) => Dangling_Input_Signal,
       sig20(24) => Dangling_Input_Signal,
       sig20(25) => Dangling_Input_Signal,
       sig20(26) => Dangling_Input_Signal,
       sig20(27) => Dangling_Input_Signal,
       sig20(28) => Dangling_Input_Signal,
       sig20(29) => Dangling_Input_Signal,
       sig20(30) => Dangling_Input_Signal,
       sig20(31) => Dangling_Input_Signal,
       sig20(32) => Dangling_Input_Signal,
       sig20(33) => Dangling_Input_Signal,
       sig20(34) => Dangling_Input_Signal,
       sig20(35) => Dangling_Input_Signal,
       sig20(36) => Dangling_Input_Signal,
       sig20(37) => Dangling_Input_Signal,
       sig20(38) => Dangling_Input_Signal,
       sig20(39) => Dangling_Input_Signal,
       sig20(40) => Dangling_Input_Signal,
       sig20(41) => Dangling_Input_Signal,
       sig20(42) => Dangling_Input_Signal,
       sig20(43) => Dangling_Input_Signal,
       sig20(44) => Dangling_Input_Signal,
       sig20(45) => Dangling_Input_Signal,
       sig20(46) => Dangling_Input_Signal,
       sig20(47) => Dangling_Input_Signal,
       sig20(48) => Dangling_Input_Signal,
       sig20(49) => Dangling_Input_Signal,
       sig20(50) => Dangling_Input_Signal,
       sig20(51) => Dangling_Input_Signal,
       sig20(52) => Dangling_Input_Signal,
       sig20(53) => Dangling_Input_Signal,
       sig20(54) => Dangling_Input_Signal,
       sig20(55) => Dangling_Input_Signal,
       sig20(56) => Dangling_Input_Signal,
       sig20(57) => Dangling_Input_Signal,
       sig20(58) => Dangling_Input_Signal,
       sig20(59) => Dangling_Input_Signal,
       sig20(60) => Dangling_Input_Signal,
       sig20(61) => Dangling_Input_Signal,
       sig20(62) => Dangling_Input_Signal,
       sig20(63) => Dangling_Input_Signal,
       sig21(0) => Dangling_Input_Signal,
       sig21(1) => Dangling_Input_Signal,
       sig21(2) => Dangling_Input_Signal,
       sig21(3) => Dangling_Input_Signal,
       sig21(4) => Dangling_Input_Signal,
       sig21(5) => Dangling_Input_Signal,
       sig21(6) => Dangling_Input_Signal,
       sig21(7) => Dangling_Input_Signal,
       sig21(8) => Dangling_Input_Signal,
       sig21(9) => Dangling_Input_Signal,
       sig21(10) => Dangling_Input_Signal,
       sig21(11) => Dangling_Input_Signal,
       sig21(12) => Dangling_Input_Signal,
       sig21(13) => Dangling_Input_Signal,
       sig21(14) => Dangling_Input_Signal,
       sig21(15) => Dangling_Input_Signal,
       sig21(16) => Dangling_Input_Signal,
       sig21(17) => Dangling_Input_Signal,
       sig21(18) => Dangling_Input_Signal,
       sig21(19) => Dangling_Input_Signal,
       sig21(20) => Dangling_Input_Signal,
       sig21(21) => Dangling_Input_Signal,
       sig21(22) => Dangling_Input_Signal,
       sig21(23) => Dangling_Input_Signal,
       sig21(24) => Dangling_Input_Signal,
       sig21(25) => Dangling_Input_Signal,
       sig21(26) => Dangling_Input_Signal,
       sig21(27) => Dangling_Input_Signal,
       sig21(28) => Dangling_Input_Signal,
       sig21(29) => Dangling_Input_Signal,
       sig21(30) => Dangling_Input_Signal,
       sig21(31) => Dangling_Input_Signal,
       sig21(32) => Dangling_Input_Signal,
       sig21(33) => Dangling_Input_Signal,
       sig21(34) => Dangling_Input_Signal,
       sig21(35) => Dangling_Input_Signal,
       sig21(36) => Dangling_Input_Signal,
       sig21(37) => Dangling_Input_Signal,
       sig21(38) => Dangling_Input_Signal,
       sig21(39) => Dangling_Input_Signal,
       sig21(40) => Dangling_Input_Signal,
       sig21(41) => Dangling_Input_Signal,
       sig21(42) => Dangling_Input_Signal,
       sig21(43) => Dangling_Input_Signal,
       sig21(44) => Dangling_Input_Signal,
       sig21(45) => Dangling_Input_Signal,
       sig21(46) => Dangling_Input_Signal,
       sig21(47) => Dangling_Input_Signal,
       sig21(48) => Dangling_Input_Signal,
       sig21(49) => Dangling_Input_Signal,
       sig21(50) => Dangling_Input_Signal,
       sig21(51) => Dangling_Input_Signal,
       sig21(52) => Dangling_Input_Signal,
       sig21(53) => Dangling_Input_Signal,
       sig21(54) => Dangling_Input_Signal,
       sig21(55) => Dangling_Input_Signal,
       sig21(56) => Dangling_Input_Signal,
       sig21(57) => Dangling_Input_Signal,
       sig21(58) => Dangling_Input_Signal,
       sig21(59) => Dangling_Input_Signal,
       sig21(60) => Dangling_Input_Signal,
       sig21(61) => Dangling_Input_Signal,
       sig21(62) => Dangling_Input_Signal,
       sig21(63) => Dangling_Input_Signal,
       sig22(0) => Dangling_Input_Signal,
       sig22(1) => Dangling_Input_Signal,
       sig22(2) => Dangling_Input_Signal,
       sig22(3) => Dangling_Input_Signal,
       sig22(4) => Dangling_Input_Signal,
       sig22(5) => Dangling_Input_Signal,
       sig22(6) => Dangling_Input_Signal,
       sig22(7) => Dangling_Input_Signal,
       sig22(8) => Dangling_Input_Signal,
       sig22(9) => Dangling_Input_Signal,
       sig22(10) => Dangling_Input_Signal,
       sig22(11) => Dangling_Input_Signal,
       sig22(12) => Dangling_Input_Signal,
       sig22(13) => Dangling_Input_Signal,
       sig22(14) => Dangling_Input_Signal,
       sig22(15) => Dangling_Input_Signal,
       sig22(16) => Dangling_Input_Signal,
       sig22(17) => Dangling_Input_Signal,
       sig22(18) => Dangling_Input_Signal,
       sig22(19) => Dangling_Input_Signal,
       sig22(20) => Dangling_Input_Signal,
       sig22(21) => Dangling_Input_Signal,
       sig22(22) => Dangling_Input_Signal,
       sig22(23) => Dangling_Input_Signal,
       sig22(24) => Dangling_Input_Signal,
       sig22(25) => Dangling_Input_Signal,
       sig22(26) => Dangling_Input_Signal,
       sig22(27) => Dangling_Input_Signal,
       sig22(28) => Dangling_Input_Signal,
       sig22(29) => Dangling_Input_Signal,
       sig22(30) => Dangling_Input_Signal,
       sig22(31) => Dangling_Input_Signal,
       sig22(32) => Dangling_Input_Signal,
       sig22(33) => Dangling_Input_Signal,
       sig22(34) => Dangling_Input_Signal,
       sig22(35) => Dangling_Input_Signal,
       sig22(36) => Dangling_Input_Signal,
       sig22(37) => Dangling_Input_Signal,
       sig22(38) => Dangling_Input_Signal,
       sig22(39) => Dangling_Input_Signal,
       sig22(40) => Dangling_Input_Signal,
       sig22(41) => Dangling_Input_Signal,
       sig22(42) => Dangling_Input_Signal,
       sig22(43) => Dangling_Input_Signal,
       sig22(44) => Dangling_Input_Signal,
       sig22(45) => Dangling_Input_Signal,
       sig22(46) => Dangling_Input_Signal,
       sig22(47) => Dangling_Input_Signal,
       sig22(48) => Dangling_Input_Signal,
       sig22(49) => Dangling_Input_Signal,
       sig22(50) => Dangling_Input_Signal,
       sig22(51) => Dangling_Input_Signal,
       sig22(52) => Dangling_Input_Signal,
       sig22(53) => Dangling_Input_Signal,
       sig22(54) => Dangling_Input_Signal,
       sig22(55) => Dangling_Input_Signal,
       sig22(56) => Dangling_Input_Signal,
       sig22(57) => Dangling_Input_Signal,
       sig22(58) => Dangling_Input_Signal,
       sig22(59) => Dangling_Input_Signal,
       sig22(60) => Dangling_Input_Signal,
       sig22(61) => Dangling_Input_Signal,
       sig22(62) => Dangling_Input_Signal,
       sig22(63) => Dangling_Input_Signal,
       sig23(0) => Dangling_Input_Signal,
       sig23(1) => Dangling_Input_Signal,
       sig23(2) => Dangling_Input_Signal,
       sig23(3) => Dangling_Input_Signal,
       sig23(4) => Dangling_Input_Signal,
       sig23(5) => Dangling_Input_Signal,
       sig23(6) => Dangling_Input_Signal,
       sig23(7) => Dangling_Input_Signal,
       sig23(8) => Dangling_Input_Signal,
       sig23(9) => Dangling_Input_Signal,
       sig23(10) => Dangling_Input_Signal,
       sig23(11) => Dangling_Input_Signal,
       sig23(12) => Dangling_Input_Signal,
       sig23(13) => Dangling_Input_Signal,
       sig23(14) => Dangling_Input_Signal,
       sig23(15) => Dangling_Input_Signal,
       sig23(16) => Dangling_Input_Signal,
       sig23(17) => Dangling_Input_Signal,
       sig23(18) => Dangling_Input_Signal,
       sig23(19) => Dangling_Input_Signal,
       sig23(20) => Dangling_Input_Signal,
       sig23(21) => Dangling_Input_Signal,
       sig23(22) => Dangling_Input_Signal,
       sig23(23) => Dangling_Input_Signal,
       sig23(24) => Dangling_Input_Signal,
       sig23(25) => Dangling_Input_Signal,
       sig23(26) => Dangling_Input_Signal,
       sig23(27) => Dangling_Input_Signal,
       sig23(28) => Dangling_Input_Signal,
       sig23(29) => Dangling_Input_Signal,
       sig23(30) => Dangling_Input_Signal,
       sig23(31) => Dangling_Input_Signal,
       sig23(32) => Dangling_Input_Signal,
       sig23(33) => Dangling_Input_Signal,
       sig23(34) => Dangling_Input_Signal,
       sig23(35) => Dangling_Input_Signal,
       sig23(36) => Dangling_Input_Signal,
       sig23(37) => Dangling_Input_Signal,
       sig23(38) => Dangling_Input_Signal,
       sig23(39) => Dangling_Input_Signal,
       sig23(40) => Dangling_Input_Signal,
       sig23(41) => Dangling_Input_Signal,
       sig23(42) => Dangling_Input_Signal,
       sig23(43) => Dangling_Input_Signal,
       sig23(44) => Dangling_Input_Signal,
       sig23(45) => Dangling_Input_Signal,
       sig23(46) => Dangling_Input_Signal,
       sig23(47) => Dangling_Input_Signal,
       sig23(48) => Dangling_Input_Signal,
       sig23(49) => Dangling_Input_Signal,
       sig23(50) => Dangling_Input_Signal,
       sig23(51) => Dangling_Input_Signal,
       sig23(52) => Dangling_Input_Signal,
       sig23(53) => Dangling_Input_Signal,
       sig23(54) => Dangling_Input_Signal,
       sig23(55) => Dangling_Input_Signal,
       sig23(56) => Dangling_Input_Signal,
       sig23(57) => Dangling_Input_Signal,
       sig23(58) => Dangling_Input_Signal,
       sig23(59) => Dangling_Input_Signal,
       sig23(60) => Dangling_Input_Signal,
       sig23(61) => Dangling_Input_Signal,
       sig23(62) => Dangling_Input_Signal,
       sig23(63) => Dangling_Input_Signal,
       sig24(0) => Dangling_Input_Signal,
       sig24(1) => Dangling_Input_Signal,
       sig24(2) => Dangling_Input_Signal,
       sig24(3) => Dangling_Input_Signal,
       sig24(4) => Dangling_Input_Signal,
       sig24(5) => Dangling_Input_Signal,
       sig24(6) => Dangling_Input_Signal,
       sig24(7) => Dangling_Input_Signal,
       sig24(8) => Dangling_Input_Signal,
       sig24(9) => Dangling_Input_Signal,
       sig24(10) => Dangling_Input_Signal,
       sig24(11) => Dangling_Input_Signal,
       sig24(12) => Dangling_Input_Signal,
       sig24(13) => Dangling_Input_Signal,
       sig24(14) => Dangling_Input_Signal,
       sig24(15) => Dangling_Input_Signal,
       sig24(16) => Dangling_Input_Signal,
       sig24(17) => Dangling_Input_Signal,
       sig24(18) => Dangling_Input_Signal,
       sig24(19) => Dangling_Input_Signal,
       sig24(20) => Dangling_Input_Signal,
       sig24(21) => Dangling_Input_Signal,
       sig24(22) => Dangling_Input_Signal,
       sig24(23) => Dangling_Input_Signal,
       sig24(24) => Dangling_Input_Signal,
       sig24(25) => Dangling_Input_Signal,
       sig24(26) => Dangling_Input_Signal,
       sig24(27) => Dangling_Input_Signal,
       sig24(28) => Dangling_Input_Signal,
       sig24(29) => Dangling_Input_Signal,
       sig24(30) => Dangling_Input_Signal,
       sig24(31) => Dangling_Input_Signal,
       sig24(32) => Dangling_Input_Signal,
       sig24(33) => Dangling_Input_Signal,
       sig24(34) => Dangling_Input_Signal,
       sig24(35) => Dangling_Input_Signal,
       sig24(36) => Dangling_Input_Signal,
       sig24(37) => Dangling_Input_Signal,
       sig24(38) => Dangling_Input_Signal,
       sig24(39) => Dangling_Input_Signal,
       sig24(40) => Dangling_Input_Signal,
       sig24(41) => Dangling_Input_Signal,
       sig24(42) => Dangling_Input_Signal,
       sig24(43) => Dangling_Input_Signal,
       sig24(44) => Dangling_Input_Signal,
       sig24(45) => Dangling_Input_Signal,
       sig24(46) => Dangling_Input_Signal,
       sig24(47) => Dangling_Input_Signal,
       sig24(48) => Dangling_Input_Signal,
       sig24(49) => Dangling_Input_Signal,
       sig24(50) => Dangling_Input_Signal,
       sig24(51) => Dangling_Input_Signal,
       sig24(52) => Dangling_Input_Signal,
       sig24(53) => Dangling_Input_Signal,
       sig24(54) => Dangling_Input_Signal,
       sig24(55) => Dangling_Input_Signal,
       sig24(56) => Dangling_Input_Signal,
       sig24(57) => Dangling_Input_Signal,
       sig24(58) => Dangling_Input_Signal,
       sig24(59) => Dangling_Input_Signal,
       sig24(60) => Dangling_Input_Signal,
       sig24(61) => Dangling_Input_Signal,
       sig24(62) => Dangling_Input_Signal,
       sig24(63) => Dangling_Input_Signal,
       sig25(0) => Dangling_Input_Signal,
       sig25(1) => Dangling_Input_Signal,
       sig25(2) => Dangling_Input_Signal,
       sig25(3) => Dangling_Input_Signal,
       sig25(4) => Dangling_Input_Signal,
       sig25(5) => Dangling_Input_Signal,
       sig25(6) => Dangling_Input_Signal,
       sig25(7) => Dangling_Input_Signal,
       sig25(8) => Dangling_Input_Signal,
       sig25(9) => Dangling_Input_Signal,
       sig25(10) => Dangling_Input_Signal,
       sig25(11) => Dangling_Input_Signal,
       sig25(12) => Dangling_Input_Signal,
       sig25(13) => Dangling_Input_Signal,
       sig25(14) => Dangling_Input_Signal,
       sig25(15) => Dangling_Input_Signal,
       sig25(16) => Dangling_Input_Signal,
       sig25(17) => Dangling_Input_Signal,
       sig25(18) => Dangling_Input_Signal,
       sig25(19) => Dangling_Input_Signal,
       sig25(20) => Dangling_Input_Signal,
       sig25(21) => Dangling_Input_Signal,
       sig25(22) => Dangling_Input_Signal,
       sig25(23) => Dangling_Input_Signal,
       sig25(24) => Dangling_Input_Signal,
       sig25(25) => Dangling_Input_Signal,
       sig25(26) => Dangling_Input_Signal,
       sig25(27) => Dangling_Input_Signal,
       sig25(28) => Dangling_Input_Signal,
       sig25(29) => Dangling_Input_Signal,
       sig25(30) => Dangling_Input_Signal,
       sig25(31) => Dangling_Input_Signal,
       sig25(32) => Dangling_Input_Signal,
       sig25(33) => Dangling_Input_Signal,
       sig25(34) => Dangling_Input_Signal,
       sig25(35) => Dangling_Input_Signal,
       sig25(36) => Dangling_Input_Signal,
       sig25(37) => Dangling_Input_Signal,
       sig25(38) => Dangling_Input_Signal,
       sig25(39) => Dangling_Input_Signal,
       sig25(40) => Dangling_Input_Signal,
       sig25(41) => Dangling_Input_Signal,
       sig25(42) => Dangling_Input_Signal,
       sig25(43) => Dangling_Input_Signal,
       sig25(44) => Dangling_Input_Signal,
       sig25(45) => Dangling_Input_Signal,
       sig25(46) => Dangling_Input_Signal,
       sig25(47) => Dangling_Input_Signal,
       sig25(48) => Dangling_Input_Signal,
       sig25(49) => Dangling_Input_Signal,
       sig25(50) => Dangling_Input_Signal,
       sig25(51) => Dangling_Input_Signal,
       sig25(52) => Dangling_Input_Signal,
       sig25(53) => Dangling_Input_Signal,
       sig25(54) => Dangling_Input_Signal,
       sig25(55) => Dangling_Input_Signal,
       sig25(56) => Dangling_Input_Signal,
       sig25(57) => Dangling_Input_Signal,
       sig25(58) => Dangling_Input_Signal,
       sig25(59) => Dangling_Input_Signal,
       sig25(60) => Dangling_Input_Signal,
       sig25(61) => Dangling_Input_Signal,
       sig25(62) => Dangling_Input_Signal,
       sig25(63) => Dangling_Input_Signal,
       sig26(0) => Dangling_Input_Signal,
       sig26(1) => Dangling_Input_Signal,
       sig26(2) => Dangling_Input_Signal,
       sig26(3) => Dangling_Input_Signal,
       sig26(4) => Dangling_Input_Signal,
       sig26(5) => Dangling_Input_Signal,
       sig26(6) => Dangling_Input_Signal,
       sig26(7) => Dangling_Input_Signal,
       sig26(8) => Dangling_Input_Signal,
       sig26(9) => Dangling_Input_Signal,
       sig26(10) => Dangling_Input_Signal,
       sig26(11) => Dangling_Input_Signal,
       sig26(12) => Dangling_Input_Signal,
       sig26(13) => Dangling_Input_Signal,
       sig26(14) => Dangling_Input_Signal,
       sig26(15) => Dangling_Input_Signal,
       sig26(16) => Dangling_Input_Signal,
       sig26(17) => Dangling_Input_Signal,
       sig26(18) => Dangling_Input_Signal,
       sig26(19) => Dangling_Input_Signal,
       sig26(20) => Dangling_Input_Signal,
       sig26(21) => Dangling_Input_Signal,
       sig26(22) => Dangling_Input_Signal,
       sig26(23) => Dangling_Input_Signal,
       sig26(24) => Dangling_Input_Signal,
       sig26(25) => Dangling_Input_Signal,
       sig26(26) => Dangling_Input_Signal,
       sig26(27) => Dangling_Input_Signal,
       sig26(28) => Dangling_Input_Signal,
       sig26(29) => Dangling_Input_Signal,
       sig26(30) => Dangling_Input_Signal,
       sig26(31) => Dangling_Input_Signal,
       sig26(32) => Dangling_Input_Signal,
       sig26(33) => Dangling_Input_Signal,
       sig26(34) => Dangling_Input_Signal,
       sig26(35) => Dangling_Input_Signal,
       sig26(36) => Dangling_Input_Signal,
       sig26(37) => Dangling_Input_Signal,
       sig26(38) => Dangling_Input_Signal,
       sig26(39) => Dangling_Input_Signal,
       sig26(40) => Dangling_Input_Signal,
       sig26(41) => Dangling_Input_Signal,
       sig26(42) => Dangling_Input_Signal,
       sig26(43) => Dangling_Input_Signal,
       sig26(44) => Dangling_Input_Signal,
       sig26(45) => Dangling_Input_Signal,
       sig26(46) => Dangling_Input_Signal,
       sig26(47) => Dangling_Input_Signal,
       sig26(48) => Dangling_Input_Signal,
       sig26(49) => Dangling_Input_Signal,
       sig26(50) => Dangling_Input_Signal,
       sig26(51) => Dangling_Input_Signal,
       sig26(52) => Dangling_Input_Signal,
       sig26(53) => Dangling_Input_Signal,
       sig26(54) => Dangling_Input_Signal,
       sig26(55) => Dangling_Input_Signal,
       sig26(56) => Dangling_Input_Signal,
       sig26(57) => Dangling_Input_Signal,
       sig26(58) => Dangling_Input_Signal,
       sig26(59) => Dangling_Input_Signal,
       sig26(60) => Dangling_Input_Signal,
       sig26(61) => Dangling_Input_Signal,
       sig26(62) => Dangling_Input_Signal,
       sig26(63) => Dangling_Input_Signal,
       sig27(0) => Dangling_Input_Signal,
       sig27(1) => Dangling_Input_Signal,
       sig27(2) => Dangling_Input_Signal,
       sig27(3) => Dangling_Input_Signal,
       sig27(4) => Dangling_Input_Signal,
       sig27(5) => Dangling_Input_Signal,
       sig27(6) => Dangling_Input_Signal,
       sig27(7) => Dangling_Input_Signal,
       sig27(8) => Dangling_Input_Signal,
       sig27(9) => Dangling_Input_Signal,
       sig27(10) => Dangling_Input_Signal,
       sig27(11) => Dangling_Input_Signal,
       sig27(12) => Dangling_Input_Signal,
       sig27(13) => Dangling_Input_Signal,
       sig27(14) => Dangling_Input_Signal,
       sig27(15) => Dangling_Input_Signal,
       sig27(16) => Dangling_Input_Signal,
       sig27(17) => Dangling_Input_Signal,
       sig27(18) => Dangling_Input_Signal,
       sig27(19) => Dangling_Input_Signal,
       sig27(20) => Dangling_Input_Signal,
       sig27(21) => Dangling_Input_Signal,
       sig27(22) => Dangling_Input_Signal,
       sig27(23) => Dangling_Input_Signal,
       sig27(24) => Dangling_Input_Signal,
       sig27(25) => Dangling_Input_Signal,
       sig27(26) => Dangling_Input_Signal,
       sig27(27) => Dangling_Input_Signal,
       sig27(28) => Dangling_Input_Signal,
       sig27(29) => Dangling_Input_Signal,
       sig27(30) => Dangling_Input_Signal,
       sig27(31) => Dangling_Input_Signal,
       sig27(32) => Dangling_Input_Signal,
       sig27(33) => Dangling_Input_Signal,
       sig27(34) => Dangling_Input_Signal,
       sig27(35) => Dangling_Input_Signal,
       sig27(36) => Dangling_Input_Signal,
       sig27(37) => Dangling_Input_Signal,
       sig27(38) => Dangling_Input_Signal,
       sig27(39) => Dangling_Input_Signal,
       sig27(40) => Dangling_Input_Signal,
       sig27(41) => Dangling_Input_Signal,
       sig27(42) => Dangling_Input_Signal,
       sig27(43) => Dangling_Input_Signal,
       sig27(44) => Dangling_Input_Signal,
       sig27(45) => Dangling_Input_Signal,
       sig27(46) => Dangling_Input_Signal,
       sig27(47) => Dangling_Input_Signal,
       sig27(48) => Dangling_Input_Signal,
       sig27(49) => Dangling_Input_Signal,
       sig27(50) => Dangling_Input_Signal,
       sig27(51) => Dangling_Input_Signal,
       sig27(52) => Dangling_Input_Signal,
       sig27(53) => Dangling_Input_Signal,
       sig27(54) => Dangling_Input_Signal,
       sig27(55) => Dangling_Input_Signal,
       sig27(56) => Dangling_Input_Signal,
       sig27(57) => Dangling_Input_Signal,
       sig27(58) => Dangling_Input_Signal,
       sig27(59) => Dangling_Input_Signal,
       sig27(60) => Dangling_Input_Signal,
       sig27(61) => Dangling_Input_Signal,
       sig27(62) => Dangling_Input_Signal,
       sig27(63) => Dangling_Input_Signal,
       sig28(0) => Dangling_Input_Signal,
       sig28(1) => Dangling_Input_Signal,
       sig28(2) => Dangling_Input_Signal,
       sig28(3) => Dangling_Input_Signal,
       sig28(4) => Dangling_Input_Signal,
       sig28(5) => Dangling_Input_Signal,
       sig28(6) => Dangling_Input_Signal,
       sig28(7) => Dangling_Input_Signal,
       sig28(8) => Dangling_Input_Signal,
       sig28(9) => Dangling_Input_Signal,
       sig28(10) => Dangling_Input_Signal,
       sig28(11) => Dangling_Input_Signal,
       sig28(12) => Dangling_Input_Signal,
       sig28(13) => Dangling_Input_Signal,
       sig28(14) => Dangling_Input_Signal,
       sig28(15) => Dangling_Input_Signal,
       sig28(16) => Dangling_Input_Signal,
       sig28(17) => Dangling_Input_Signal,
       sig28(18) => Dangling_Input_Signal,
       sig28(19) => Dangling_Input_Signal,
       sig28(20) => Dangling_Input_Signal,
       sig28(21) => Dangling_Input_Signal,
       sig28(22) => Dangling_Input_Signal,
       sig28(23) => Dangling_Input_Signal,
       sig28(24) => Dangling_Input_Signal,
       sig28(25) => Dangling_Input_Signal,
       sig28(26) => Dangling_Input_Signal,
       sig28(27) => Dangling_Input_Signal,
       sig28(28) => Dangling_Input_Signal,
       sig28(29) => Dangling_Input_Signal,
       sig28(30) => Dangling_Input_Signal,
       sig28(31) => Dangling_Input_Signal,
       sig28(32) => Dangling_Input_Signal,
       sig28(33) => Dangling_Input_Signal,
       sig28(34) => Dangling_Input_Signal,
       sig28(35) => Dangling_Input_Signal,
       sig28(36) => Dangling_Input_Signal,
       sig28(37) => Dangling_Input_Signal,
       sig28(38) => Dangling_Input_Signal,
       sig28(39) => Dangling_Input_Signal,
       sig28(40) => Dangling_Input_Signal,
       sig28(41) => Dangling_Input_Signal,
       sig28(42) => Dangling_Input_Signal,
       sig28(43) => Dangling_Input_Signal,
       sig28(44) => Dangling_Input_Signal,
       sig28(45) => Dangling_Input_Signal,
       sig28(46) => Dangling_Input_Signal,
       sig28(47) => Dangling_Input_Signal,
       sig28(48) => Dangling_Input_Signal,
       sig28(49) => Dangling_Input_Signal,
       sig28(50) => Dangling_Input_Signal,
       sig28(51) => Dangling_Input_Signal,
       sig28(52) => Dangling_Input_Signal,
       sig28(53) => Dangling_Input_Signal,
       sig28(54) => Dangling_Input_Signal,
       sig28(55) => Dangling_Input_Signal,
       sig28(56) => Dangling_Input_Signal,
       sig28(57) => Dangling_Input_Signal,
       sig28(58) => Dangling_Input_Signal,
       sig28(59) => Dangling_Input_Signal,
       sig28(60) => Dangling_Input_Signal,
       sig28(61) => Dangling_Input_Signal,
       sig28(62) => Dangling_Input_Signal,
       sig28(63) => Dangling_Input_Signal,
       sig29(0) => Dangling_Input_Signal,
       sig29(1) => Dangling_Input_Signal,
       sig29(2) => Dangling_Input_Signal,
       sig29(3) => Dangling_Input_Signal,
       sig29(4) => Dangling_Input_Signal,
       sig29(5) => Dangling_Input_Signal,
       sig29(6) => Dangling_Input_Signal,
       sig29(7) => Dangling_Input_Signal,
       sig29(8) => Dangling_Input_Signal,
       sig29(9) => Dangling_Input_Signal,
       sig29(10) => Dangling_Input_Signal,
       sig29(11) => Dangling_Input_Signal,
       sig29(12) => Dangling_Input_Signal,
       sig29(13) => Dangling_Input_Signal,
       sig29(14) => Dangling_Input_Signal,
       sig29(15) => Dangling_Input_Signal,
       sig29(16) => Dangling_Input_Signal,
       sig29(17) => Dangling_Input_Signal,
       sig29(18) => Dangling_Input_Signal,
       sig29(19) => Dangling_Input_Signal,
       sig29(20) => Dangling_Input_Signal,
       sig29(21) => Dangling_Input_Signal,
       sig29(22) => Dangling_Input_Signal,
       sig29(23) => Dangling_Input_Signal,
       sig29(24) => Dangling_Input_Signal,
       sig29(25) => Dangling_Input_Signal,
       sig29(26) => Dangling_Input_Signal,
       sig29(27) => Dangling_Input_Signal,
       sig29(28) => Dangling_Input_Signal,
       sig29(29) => Dangling_Input_Signal,
       sig29(30) => Dangling_Input_Signal,
       sig29(31) => Dangling_Input_Signal,
       sig29(32) => Dangling_Input_Signal,
       sig29(33) => Dangling_Input_Signal,
       sig29(34) => Dangling_Input_Signal,
       sig29(35) => Dangling_Input_Signal,
       sig29(36) => Dangling_Input_Signal,
       sig29(37) => Dangling_Input_Signal,
       sig29(38) => Dangling_Input_Signal,
       sig29(39) => Dangling_Input_Signal,
       sig29(40) => Dangling_Input_Signal,
       sig29(41) => Dangling_Input_Signal,
       sig29(42) => Dangling_Input_Signal,
       sig29(43) => Dangling_Input_Signal,
       sig29(44) => Dangling_Input_Signal,
       sig29(45) => Dangling_Input_Signal,
       sig29(46) => Dangling_Input_Signal,
       sig29(47) => Dangling_Input_Signal,
       sig29(48) => Dangling_Input_Signal,
       sig29(49) => Dangling_Input_Signal,
       sig29(50) => Dangling_Input_Signal,
       sig29(51) => Dangling_Input_Signal,
       sig29(52) => Dangling_Input_Signal,
       sig29(53) => Dangling_Input_Signal,
       sig29(54) => Dangling_Input_Signal,
       sig29(55) => Dangling_Input_Signal,
       sig29(56) => Dangling_Input_Signal,
       sig29(57) => Dangling_Input_Signal,
       sig29(58) => Dangling_Input_Signal,
       sig29(59) => Dangling_Input_Signal,
       sig29(60) => Dangling_Input_Signal,
       sig29(61) => Dangling_Input_Signal,
       sig29(62) => Dangling_Input_Signal,
       sig29(63) => Dangling_Input_Signal,
       sig30(0) => Dangling_Input_Signal,
       sig30(1) => Dangling_Input_Signal,
       sig30(2) => Dangling_Input_Signal,
       sig30(3) => Dangling_Input_Signal,
       sig30(4) => Dangling_Input_Signal,
       sig30(5) => Dangling_Input_Signal,
       sig30(6) => Dangling_Input_Signal,
       sig30(7) => Dangling_Input_Signal,
       sig30(8) => Dangling_Input_Signal,
       sig30(9) => Dangling_Input_Signal,
       sig30(10) => Dangling_Input_Signal,
       sig30(11) => Dangling_Input_Signal,
       sig30(12) => Dangling_Input_Signal,
       sig30(13) => Dangling_Input_Signal,
       sig30(14) => Dangling_Input_Signal,
       sig30(15) => Dangling_Input_Signal,
       sig30(16) => Dangling_Input_Signal,
       sig30(17) => Dangling_Input_Signal,
       sig30(18) => Dangling_Input_Signal,
       sig30(19) => Dangling_Input_Signal,
       sig30(20) => Dangling_Input_Signal,
       sig30(21) => Dangling_Input_Signal,
       sig30(22) => Dangling_Input_Signal,
       sig30(23) => Dangling_Input_Signal,
       sig30(24) => Dangling_Input_Signal,
       sig30(25) => Dangling_Input_Signal,
       sig30(26) => Dangling_Input_Signal,
       sig30(27) => Dangling_Input_Signal,
       sig30(28) => Dangling_Input_Signal,
       sig30(29) => Dangling_Input_Signal,
       sig30(30) => Dangling_Input_Signal,
       sig30(31) => Dangling_Input_Signal,
       sig30(32) => Dangling_Input_Signal,
       sig30(33) => Dangling_Input_Signal,
       sig30(34) => Dangling_Input_Signal,
       sig30(35) => Dangling_Input_Signal,
       sig30(36) => Dangling_Input_Signal,
       sig30(37) => Dangling_Input_Signal,
       sig30(38) => Dangling_Input_Signal,
       sig30(39) => Dangling_Input_Signal,
       sig30(40) => Dangling_Input_Signal,
       sig30(41) => Dangling_Input_Signal,
       sig30(42) => Dangling_Input_Signal,
       sig30(43) => Dangling_Input_Signal,
       sig30(44) => Dangling_Input_Signal,
       sig30(45) => Dangling_Input_Signal,
       sig30(46) => Dangling_Input_Signal,
       sig30(47) => Dangling_Input_Signal,
       sig30(48) => Dangling_Input_Signal,
       sig30(49) => Dangling_Input_Signal,
       sig30(50) => Dangling_Input_Signal,
       sig30(51) => Dangling_Input_Signal,
       sig30(52) => Dangling_Input_Signal,
       sig30(53) => Dangling_Input_Signal,
       sig30(54) => Dangling_Input_Signal,
       sig30(55) => Dangling_Input_Signal,
       sig30(56) => Dangling_Input_Signal,
       sig30(57) => Dangling_Input_Signal,
       sig30(58) => Dangling_Input_Signal,
       sig30(59) => Dangling_Input_Signal,
       sig30(60) => Dangling_Input_Signal,
       sig30(61) => Dangling_Input_Signal,
       sig30(62) => Dangling_Input_Signal,
       sig30(63) => Dangling_Input_Signal,
       sig31(0) => Dangling_Input_Signal,
       sig31(1) => Dangling_Input_Signal,
       sig31(2) => Dangling_Input_Signal,
       sig31(3) => Dangling_Input_Signal,
       sig31(4) => Dangling_Input_Signal,
       sig31(5) => Dangling_Input_Signal,
       sig31(6) => Dangling_Input_Signal,
       sig31(7) => Dangling_Input_Signal,
       sig31(8) => Dangling_Input_Signal,
       sig31(9) => Dangling_Input_Signal,
       sig31(10) => Dangling_Input_Signal,
       sig31(11) => Dangling_Input_Signal,
       sig31(12) => Dangling_Input_Signal,
       sig31(13) => Dangling_Input_Signal,
       sig31(14) => Dangling_Input_Signal,
       sig31(15) => Dangling_Input_Signal,
       sig31(16) => Dangling_Input_Signal,
       sig31(17) => Dangling_Input_Signal,
       sig31(18) => Dangling_Input_Signal,
       sig31(19) => Dangling_Input_Signal,
       sig31(20) => Dangling_Input_Signal,
       sig31(21) => Dangling_Input_Signal,
       sig31(22) => Dangling_Input_Signal,
       sig31(23) => Dangling_Input_Signal,
       sig31(24) => Dangling_Input_Signal,
       sig31(25) => Dangling_Input_Signal,
       sig31(26) => Dangling_Input_Signal,
       sig31(27) => Dangling_Input_Signal,
       sig31(28) => Dangling_Input_Signal,
       sig31(29) => Dangling_Input_Signal,
       sig31(30) => Dangling_Input_Signal,
       sig31(31) => Dangling_Input_Signal,
       sig31(32) => Dangling_Input_Signal,
       sig31(33) => Dangling_Input_Signal,
       sig31(34) => Dangling_Input_Signal,
       sig31(35) => Dangling_Input_Signal,
       sig31(36) => Dangling_Input_Signal,
       sig31(37) => Dangling_Input_Signal,
       sig31(38) => Dangling_Input_Signal,
       sig31(39) => Dangling_Input_Signal,
       sig31(40) => Dangling_Input_Signal,
       sig31(41) => Dangling_Input_Signal,
       sig31(42) => Dangling_Input_Signal,
       sig31(43) => Dangling_Input_Signal,
       sig31(44) => Dangling_Input_Signal,
       sig31(45) => Dangling_Input_Signal,
       sig31(46) => Dangling_Input_Signal,
       sig31(47) => Dangling_Input_Signal,
       sig31(48) => Dangling_Input_Signal,
       sig31(49) => Dangling_Input_Signal,
       sig31(50) => Dangling_Input_Signal,
       sig31(51) => Dangling_Input_Signal,
       sig31(52) => Dangling_Input_Signal,
       sig31(53) => Dangling_Input_Signal,
       sig31(54) => Dangling_Input_Signal,
       sig31(55) => Dangling_Input_Signal,
       sig31(56) => Dangling_Input_Signal,
       sig31(57) => Dangling_Input_Signal,
       sig31(58) => Dangling_Input_Signal,
       sig31(59) => Dangling_Input_Signal,
       sig31(60) => Dangling_Input_Signal,
       sig31(61) => Dangling_Input_Signal,
       sig31(62) => Dangling_Input_Signal,
       sig31(63) => Dangling_Input_Signal,
       sig7(0) => Dangling_Input_Signal,
       sig7(1) => Dangling_Input_Signal,
       sig7(2) => Dangling_Input_Signal,
       sig7(3) => Dangling_Input_Signal,
       sig7(4) => Dangling_Input_Signal,
       sig7(5) => Dangling_Input_Signal,
       sig7(6) => Dangling_Input_Signal,
       sig7(7) => Dangling_Input_Signal,
       sig7(8) => Dangling_Input_Signal,
       sig7(9) => Dangling_Input_Signal,
       sig7(10) => Dangling_Input_Signal,
       sig7(11) => Dangling_Input_Signal,
       sig7(12) => Dangling_Input_Signal,
       sig7(13) => Dangling_Input_Signal,
       sig7(14) => Dangling_Input_Signal,
       sig7(15) => Dangling_Input_Signal,
       sig7(16) => Dangling_Input_Signal,
       sig7(17) => Dangling_Input_Signal,
       sig7(18) => Dangling_Input_Signal,
       sig7(19) => Dangling_Input_Signal,
       sig7(20) => Dangling_Input_Signal,
       sig7(21) => Dangling_Input_Signal,
       sig7(22) => Dangling_Input_Signal,
       sig7(23) => Dangling_Input_Signal,
       sig7(24) => Dangling_Input_Signal,
       sig7(25) => Dangling_Input_Signal,
       sig7(26) => Dangling_Input_Signal,
       sig7(27) => Dangling_Input_Signal,
       sig7(28) => Dangling_Input_Signal,
       sig7(29) => Dangling_Input_Signal,
       sig7(30) => Dangling_Input_Signal,
       sig7(31) => Dangling_Input_Signal,
       sig7(32) => Dangling_Input_Signal,
       sig7(33) => Dangling_Input_Signal,
       sig7(34) => Dangling_Input_Signal,
       sig7(35) => Dangling_Input_Signal,
       sig7(36) => Dangling_Input_Signal,
       sig7(37) => Dangling_Input_Signal,
       sig7(38) => Dangling_Input_Signal,
       sig7(39) => Dangling_Input_Signal,
       sig7(40) => Dangling_Input_Signal,
       sig7(41) => Dangling_Input_Signal,
       sig7(42) => Dangling_Input_Signal,
       sig7(43) => Dangling_Input_Signal,
       sig7(44) => Dangling_Input_Signal,
       sig7(45) => Dangling_Input_Signal,
       sig7(46) => Dangling_Input_Signal,
       sig7(47) => Dangling_Input_Signal,
       sig7(48) => Dangling_Input_Signal,
       sig7(49) => Dangling_Input_Signal,
       sig7(50) => Dangling_Input_Signal,
       sig7(51) => Dangling_Input_Signal,
       sig7(52) => Dangling_Input_Signal,
       sig7(53) => Dangling_Input_Signal,
       sig7(54) => Dangling_Input_Signal,
       sig7(55) => Dangling_Input_Signal,
       sig7(56) => Dangling_Input_Signal,
       sig7(57) => Dangling_Input_Signal,
       sig7(58) => Dangling_Input_Signal,
       sig7(59) => Dangling_Input_Signal,
       sig7(60) => Dangling_Input_Signal,
       sig7(61) => Dangling_Input_Signal,
       sig7(62) => Dangling_Input_Signal,
       sig7(63) => Dangling_Input_Signal,
       sig8(0) => Dangling_Input_Signal,
       sig8(1) => Dangling_Input_Signal,
       sig8(2) => Dangling_Input_Signal,
       sig8(3) => Dangling_Input_Signal,
       sig8(4) => Dangling_Input_Signal,
       sig8(5) => Dangling_Input_Signal,
       sig8(6) => Dangling_Input_Signal,
       sig8(7) => Dangling_Input_Signal,
       sig8(8) => Dangling_Input_Signal,
       sig8(9) => Dangling_Input_Signal,
       sig8(10) => Dangling_Input_Signal,
       sig8(11) => Dangling_Input_Signal,
       sig8(12) => Dangling_Input_Signal,
       sig8(13) => Dangling_Input_Signal,
       sig8(14) => Dangling_Input_Signal,
       sig8(15) => Dangling_Input_Signal,
       sig8(16) => Dangling_Input_Signal,
       sig8(17) => Dangling_Input_Signal,
       sig8(18) => Dangling_Input_Signal,
       sig8(19) => Dangling_Input_Signal,
       sig8(20) => Dangling_Input_Signal,
       sig8(21) => Dangling_Input_Signal,
       sig8(22) => Dangling_Input_Signal,
       sig8(23) => Dangling_Input_Signal,
       sig8(24) => Dangling_Input_Signal,
       sig8(25) => Dangling_Input_Signal,
       sig8(26) => Dangling_Input_Signal,
       sig8(27) => Dangling_Input_Signal,
       sig8(28) => Dangling_Input_Signal,
       sig8(29) => Dangling_Input_Signal,
       sig8(30) => Dangling_Input_Signal,
       sig8(31) => Dangling_Input_Signal,
       sig8(32) => Dangling_Input_Signal,
       sig8(33) => Dangling_Input_Signal,
       sig8(34) => Dangling_Input_Signal,
       sig8(35) => Dangling_Input_Signal,
       sig8(36) => Dangling_Input_Signal,
       sig8(37) => Dangling_Input_Signal,
       sig8(38) => Dangling_Input_Signal,
       sig8(39) => Dangling_Input_Signal,
       sig8(40) => Dangling_Input_Signal,
       sig8(41) => Dangling_Input_Signal,
       sig8(42) => Dangling_Input_Signal,
       sig8(43) => Dangling_Input_Signal,
       sig8(44) => Dangling_Input_Signal,
       sig8(45) => Dangling_Input_Signal,
       sig8(46) => Dangling_Input_Signal,
       sig8(47) => Dangling_Input_Signal,
       sig8(48) => Dangling_Input_Signal,
       sig8(49) => Dangling_Input_Signal,
       sig8(50) => Dangling_Input_Signal,
       sig8(51) => Dangling_Input_Signal,
       sig8(52) => Dangling_Input_Signal,
       sig8(53) => Dangling_Input_Signal,
       sig8(54) => Dangling_Input_Signal,
       sig8(55) => Dangling_Input_Signal,
       sig8(56) => Dangling_Input_Signal,
       sig8(57) => Dangling_Input_Signal,
       sig8(58) => Dangling_Input_Signal,
       sig8(59) => Dangling_Input_Signal,
       sig8(60) => Dangling_Input_Signal,
       sig8(61) => Dangling_Input_Signal,
       sig8(62) => Dangling_Input_Signal,
       sig8(63) => Dangling_Input_Signal,
       sig9(0) => Dangling_Input_Signal,
       sig9(1) => Dangling_Input_Signal,
       sig9(2) => Dangling_Input_Signal,
       sig9(3) => Dangling_Input_Signal,
       sig9(4) => Dangling_Input_Signal,
       sig9(5) => Dangling_Input_Signal,
       sig9(6) => Dangling_Input_Signal,
       sig9(7) => Dangling_Input_Signal,
       sig9(8) => Dangling_Input_Signal,
       sig9(9) => Dangling_Input_Signal,
       sig9(10) => Dangling_Input_Signal,
       sig9(11) => Dangling_Input_Signal,
       sig9(12) => Dangling_Input_Signal,
       sig9(13) => Dangling_Input_Signal,
       sig9(14) => Dangling_Input_Signal,
       sig9(15) => Dangling_Input_Signal,
       sig9(16) => Dangling_Input_Signal,
       sig9(17) => Dangling_Input_Signal,
       sig9(18) => Dangling_Input_Signal,
       sig9(19) => Dangling_Input_Signal,
       sig9(20) => Dangling_Input_Signal,
       sig9(21) => Dangling_Input_Signal,
       sig9(22) => Dangling_Input_Signal,
       sig9(23) => Dangling_Input_Signal,
       sig9(24) => Dangling_Input_Signal,
       sig9(25) => Dangling_Input_Signal,
       sig9(26) => Dangling_Input_Signal,
       sig9(27) => Dangling_Input_Signal,
       sig9(28) => Dangling_Input_Signal,
       sig9(29) => Dangling_Input_Signal,
       sig9(30) => Dangling_Input_Signal,
       sig9(31) => Dangling_Input_Signal,
       sig9(32) => Dangling_Input_Signal,
       sig9(33) => Dangling_Input_Signal,
       sig9(34) => Dangling_Input_Signal,
       sig9(35) => Dangling_Input_Signal,
       sig9(36) => Dangling_Input_Signal,
       sig9(37) => Dangling_Input_Signal,
       sig9(38) => Dangling_Input_Signal,
       sig9(39) => Dangling_Input_Signal,
       sig9(40) => Dangling_Input_Signal,
       sig9(41) => Dangling_Input_Signal,
       sig9(42) => Dangling_Input_Signal,
       sig9(43) => Dangling_Input_Signal,
       sig9(44) => Dangling_Input_Signal,
       sig9(45) => Dangling_Input_Signal,
       sig9(46) => Dangling_Input_Signal,
       sig9(47) => Dangling_Input_Signal,
       sig9(48) => Dangling_Input_Signal,
       sig9(49) => Dangling_Input_Signal,
       sig9(50) => Dangling_Input_Signal,
       sig9(51) => Dangling_Input_Signal,
       sig9(52) => Dangling_Input_Signal,
       sig9(53) => Dangling_Input_Signal,
       sig9(54) => Dangling_Input_Signal,
       sig9(55) => Dangling_Input_Signal,
       sig9(56) => Dangling_Input_Signal,
       sig9(57) => Dangling_Input_Signal,
       sig9(58) => Dangling_Input_Signal,
       sig9(59) => Dangling_Input_Signal,
       sig9(60) => Dangling_Input_Signal,
       sig9(61) => Dangling_Input_Signal,
       sig9(62) => Dangling_Input_Signal,
       sig9(63) => Dangling_Input_Signal,
       clk0 => clk0,
       out64 => rd_data_out_dyn,
       rdaddr => rx_addr,
       rden => NET61855,
       sig0 => rdd0,
       sig1 => rdd1,
       sig18 => rdb17,
       sig2 => rdd2,
       sig3 => rdd3,
       sig4 => rdd4,
       sig5 => rdd5,
       sig6 => rdd6
  );

NET61855 <= not(rx_wren);

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

U335 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => log_ev_ctrb,
       rst_p => NET59517,
       sigin => NET62518
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

NET59053 <= ctr_resets(0) or reset_out;

U341 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => in_ch1_ctr_1,
       rst_p => NET59053,
       sigin => sig_mod(0)
  );

NET59133 <= ctr_resets(0) or reset_out;

U343 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => in_ch1_ctr_2,
       rst_p => NET59133,
       sigin => sig_mod(1)
  );

U344 : agrgate_8_by_8
  port map(
       in0(0) => in_ch1_ctr_1(0),
       in0(1) => in_ch1_ctr_1(1),
       in0(2) => in_ch1_ctr_1(2),
       in0(3) => in_ch1_ctr_1(3),
       in0(4) => in_ch1_ctr_1(4),
       in0(5) => in_ch1_ctr_1(5),
       in0(6) => in_ch1_ctr_1(6),
       in0(7) => in_ch1_ctr_1(7),
       in1(0) => in_ch1_ctr_1(8),
       in1(1) => in_ch1_ctr_1(9),
       in1(2) => in_ch1_ctr_1(10),
       in1(3) => in_ch1_ctr_1(11),
       in1(4) => in_ch1_ctr_1(12),
       in1(5) => in_ch1_ctr_1(13),
       in1(6) => in_ch1_ctr_1(14),
       in1(7) => in_ch1_ctr_1(15),
       in2(0) => in_ch1_ctr_1(16),
       in2(1) => in_ch1_ctr_1(17),
       in2(2) => in_ch1_ctr_1(18),
       in2(3) => in_ch1_ctr_1(19),
       in2(4) => in_ch1_ctr_1(20),
       in2(5) => in_ch1_ctr_1(21),
       in2(6) => in_ch1_ctr_1(22),
       in2(7) => in_ch1_ctr_1(23),
       in3(0) => in_ch1_ctr_1(24),
       in3(1) => in_ch1_ctr_1(25),
       in3(2) => in_ch1_ctr_1(26),
       in3(3) => in_ch1_ctr_1(27),
       in3(4) => in_ch1_ctr_1(28),
       in3(5) => in_ch1_ctr_1(29),
       in3(6) => in_ch1_ctr_1(30),
       in3(7) => in_ch1_ctr_1(31),
       in4(0) => in_ch2_ctr_2(0),
       in4(1) => in_ch2_ctr_2(1),
       in4(2) => in_ch2_ctr_2(2),
       in4(3) => in_ch2_ctr_2(3),
       in4(4) => in_ch2_ctr_2(4),
       in4(5) => in_ch2_ctr_2(5),
       in4(6) => in_ch2_ctr_2(6),
       in4(7) => in_ch2_ctr_2(7),
       in5(0) => in_ch2_ctr_2(8),
       in5(1) => in_ch2_ctr_2(9),
       in5(2) => in_ch2_ctr_2(10),
       in5(3) => in_ch2_ctr_2(11),
       in5(4) => in_ch2_ctr_2(12),
       in5(5) => in_ch2_ctr_2(13),
       in5(6) => in_ch2_ctr_2(14),
       in5(7) => in_ch2_ctr_2(15),
       in6(0) => in_ch2_ctr_2(16),
       in6(1) => in_ch2_ctr_2(17),
       in6(2) => in_ch2_ctr_2(18),
       in6(3) => in_ch2_ctr_2(19),
       in6(4) => in_ch2_ctr_2(20),
       in6(5) => in_ch2_ctr_2(21),
       in6(6) => in_ch2_ctr_2(22),
       in6(7) => in_ch2_ctr_2(23),
       in7(0) => in_ch2_ctr_2(24),
       in7(1) => in_ch2_ctr_2(25),
       in7(2) => in_ch2_ctr_2(26),
       in7(3) => in_ch2_ctr_2(27),
       in7(4) => in_ch2_ctr_2(28),
       in7(5) => in_ch2_ctr_2(29),
       in7(6) => in_ch2_ctr_2(30),
       in7(7) => in_ch2_ctr_2(31),
       out_0 => rdd3
  );

NET59517 <= reset_out or ctr_resets(3);

trig_sig1nd <= sig_cms2 or sig_cms1 or sig_norm;

NET64138 <= b_wr_out_b1;

U348 : agrgate_8_by_8
  port map(
       in0(0) => out_ctr_1(0),
       in0(1) => out_ctr_1(1),
       in0(2) => out_ctr_1(2),
       in0(3) => out_ctr_1(3),
       in0(4) => out_ctr_1(4),
       in0(5) => out_ctr_1(5),
       in0(6) => out_ctr_1(6),
       in0(7) => out_ctr_1(7),
       in1(0) => out_ctr_1(8),
       in1(1) => out_ctr_1(9),
       in1(2) => out_ctr_1(10),
       in1(3) => out_ctr_1(11),
       in1(4) => out_ctr_1(12),
       in1(5) => out_ctr_1(13),
       in1(6) => out_ctr_1(14),
       in1(7) => out_ctr_1(15),
       in2(0) => out_ctr_1(16),
       in2(1) => out_ctr_1(17),
       in2(2) => out_ctr_1(18),
       in2(3) => out_ctr_1(19),
       in2(4) => out_ctr_1(20),
       in2(5) => out_ctr_1(21),
       in2(6) => out_ctr_1(22),
       in2(7) => out_ctr_1(23),
       in3(0) => out_ctr_1(24),
       in3(1) => out_ctr_1(25),
       in3(2) => out_ctr_1(26),
       in3(3) => out_ctr_1(27),
       in3(4) => out_ctr_1(28),
       in3(5) => out_ctr_1(29),
       in3(6) => out_ctr_1(30),
       in3(7) => out_ctr_1(31),
       in4(0) => out_ctr_2(0),
       in4(1) => out_ctr_2(1),
       in4(2) => out_ctr_2(2),
       in4(3) => out_ctr_2(3),
       in4(4) => out_ctr_2(4),
       in4(5) => out_ctr_2(5),
       in4(6) => out_ctr_2(6),
       in4(7) => out_ctr_2(7),
       in5(0) => out_ctr_2(8),
       in5(1) => out_ctr_2(9),
       in5(2) => out_ctr_2(10),
       in5(3) => out_ctr_2(11),
       in5(4) => out_ctr_2(12),
       in5(5) => out_ctr_2(13),
       in5(6) => out_ctr_2(14),
       in5(7) => out_ctr_2(15),
       in6(0) => out_ctr_2(16),
       in6(1) => out_ctr_2(17),
       in6(2) => out_ctr_2(18),
       in6(3) => out_ctr_2(19),
       in6(4) => out_ctr_2(20),
       in6(5) => out_ctr_2(21),
       in6(6) => out_ctr_2(22),
       in6(7) => out_ctr_2(23),
       in7(0) => out_ctr_2(24),
       in7(1) => out_ctr_2(25),
       in7(2) => out_ctr_2(26),
       in7(3) => out_ctr_2(27),
       in7(4) => out_ctr_2(28),
       in7(5) => out_ctr_2(29),
       in7(6) => out_ctr_2(30),
       in7(7) => out_ctr_2(31),
       out_0 => rdd5
  );

U349 : d_ff
  port map(
       clk => clk0,
       dl => NET64138,
       q => NET64172,
       rst_p => c0sig
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

trig_sig2nd <= muxout_4a or muxout_3a or muxout_2a or muxout_1a;

U351 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => out_ctr_1b,
       rst_p => NET59792,
       sigin => mxout1a
  );

NET59792 <= reset_out or ctr_resets(0);

U353 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => out_ctr_2b,
       rst_p => NET59859,
       sigin => mxout2a
  );

NET59859 <= reset_out or ctr_resets(0);

U355 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => out_ctr_3b,
       rst_p => NET59949,
       sigin => mxout3a
  );

NET60016 <= reset_out or ctr_resets(0);

U357 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => out_ctr_4b,
       rst_p => NET60016,
       sigin => mxout4a
  );

NET59949 <= reset_out or ctr_resets(0);

bid7(3) <= c0sig;

sigmux(22) <= clk_40DCM;

U360 : ag284
  port map(
       d28(0) => out_ctr_1b(0),
       d28(1) => out_ctr_1b(1),
       d28(2) => out_ctr_1b(2),
       d28(3) => out_ctr_1b(3),
       d28(4) => out_ctr_1b(4),
       d28(5) => out_ctr_1b(5),
       d28(6) => out_ctr_1b(6),
       d28(7) => out_ctr_1b(7),
       d28(8) => out_ctr_1b(8),
       d28(9) => out_ctr_1b(9),
       d28(10) => out_ctr_1b(10),
       d28(11) => out_ctr_1b(11),
       d28(12) => out_ctr_1b(12),
       d28(13) => out_ctr_1b(13),
       d28(14) => out_ctr_1b(14),
       d28(15) => out_ctr_1b(15),
       d28(16) => out_ctr_1b(16),
       d28(17) => out_ctr_1b(17),
       d28(18) => out_ctr_1b(18),
       d28(19) => out_ctr_1b(19),
       d28(20) => out_ctr_1b(20),
       d28(21) => out_ctr_1b(21),
       d28(22) => out_ctr_1b(22),
       d28(23) => out_ctr_1b(23),
       d28(24) => out_ctr_1b(24),
       d28(25) => out_ctr_1b(25),
       d28(26) => out_ctr_1b(26),
       d28(27) => out_ctr_1b(27),
       c4 => bid5,
       clk => clk0,
       out32 => out_ctr_1,
       resetp => reset_out
  );

U361 : ag284
  port map(
       d28(0) => out_ctr_2b(0),
       d28(1) => out_ctr_2b(1),
       d28(2) => out_ctr_2b(2),
       d28(3) => out_ctr_2b(3),
       d28(4) => out_ctr_2b(4),
       d28(5) => out_ctr_2b(5),
       d28(6) => out_ctr_2b(6),
       d28(7) => out_ctr_2b(7),
       d28(8) => out_ctr_2b(8),
       d28(9) => out_ctr_2b(9),
       d28(10) => out_ctr_2b(10),
       d28(11) => out_ctr_2b(11),
       d28(12) => out_ctr_2b(12),
       d28(13) => out_ctr_2b(13),
       d28(14) => out_ctr_2b(14),
       d28(15) => out_ctr_2b(15),
       d28(16) => out_ctr_2b(16),
       d28(17) => out_ctr_2b(17),
       d28(18) => out_ctr_2b(18),
       d28(19) => out_ctr_2b(19),
       d28(20) => out_ctr_2b(20),
       d28(21) => out_ctr_2b(21),
       d28(22) => out_ctr_2b(22),
       d28(23) => out_ctr_2b(23),
       d28(24) => out_ctr_2b(24),
       d28(25) => out_ctr_2b(25),
       d28(26) => out_ctr_2b(26),
       d28(27) => out_ctr_2b(27),
       c4 => bid6,
       clk => clk0,
       out32 => out_ctr_2,
       resetp => reset_out
  );

U362 : ag284
  port map(
       d28(0) => out_ctr_3b(0),
       d28(1) => out_ctr_3b(1),
       d28(2) => out_ctr_3b(2),
       d28(3) => out_ctr_3b(3),
       d28(4) => out_ctr_3b(4),
       d28(5) => out_ctr_3b(5),
       d28(6) => out_ctr_3b(6),
       d28(7) => out_ctr_3b(7),
       d28(8) => out_ctr_3b(8),
       d28(9) => out_ctr_3b(9),
       d28(10) => out_ctr_3b(10),
       d28(11) => out_ctr_3b(11),
       d28(12) => out_ctr_3b(12),
       d28(13) => out_ctr_3b(13),
       d28(14) => out_ctr_3b(14),
       d28(15) => out_ctr_3b(15),
       d28(16) => out_ctr_3b(16),
       d28(17) => out_ctr_3b(17),
       d28(18) => out_ctr_3b(18),
       d28(19) => out_ctr_3b(19),
       d28(20) => out_ctr_3b(20),
       d28(21) => out_ctr_3b(21),
       d28(22) => out_ctr_3b(22),
       d28(23) => out_ctr_3b(23),
       d28(24) => out_ctr_3b(24),
       d28(25) => out_ctr_3b(25),
       d28(26) => out_ctr_3b(26),
       d28(27) => out_ctr_3b(27),
       c4 => bid7,
       clk => clk0,
       out32 => out_ctr_3,
       resetp => reset_out
  );

U363 : ag284
  port map(
       d28(0) => out_ctr_4b(0),
       d28(1) => out_ctr_4b(1),
       d28(2) => out_ctr_4b(2),
       d28(3) => out_ctr_4b(3),
       d28(4) => out_ctr_4b(4),
       d28(5) => out_ctr_4b(5),
       d28(6) => out_ctr_4b(6),
       d28(7) => out_ctr_4b(7),
       d28(8) => out_ctr_4b(8),
       d28(9) => out_ctr_4b(9),
       d28(10) => out_ctr_4b(10),
       d28(11) => out_ctr_4b(11),
       d28(12) => out_ctr_4b(12),
       d28(13) => out_ctr_4b(13),
       d28(14) => out_ctr_4b(14),
       d28(15) => out_ctr_4b(15),
       d28(16) => out_ctr_4b(16),
       d28(17) => out_ctr_4b(17),
       d28(18) => out_ctr_4b(18),
       d28(19) => out_ctr_4b(19),
       d28(20) => out_ctr_4b(20),
       d28(21) => out_ctr_4b(21),
       d28(22) => out_ctr_4b(22),
       d28(23) => out_ctr_4b(23),
       d28(24) => out_ctr_4b(24),
       d28(25) => out_ctr_4b(25),
       d28(26) => out_ctr_4b(26),
       d28(27) => out_ctr_4b(27),
       c4 => bid8,
       clk => clk0,
       out32 => out_ctr_4,
       resetp => reset_out
  );

c0sig <= GND;

U365 : ag284
  port map(
       d28(0) => out_ev_ctrb(0),
       d28(1) => out_ev_ctrb(1),
       d28(2) => out_ev_ctrb(2),
       d28(3) => out_ev_ctrb(3),
       d28(4) => out_ev_ctrb(4),
       d28(5) => out_ev_ctrb(5),
       d28(6) => out_ev_ctrb(6),
       d28(7) => out_ev_ctrb(7),
       d28(8) => out_ev_ctrb(8),
       d28(9) => out_ev_ctrb(9),
       d28(10) => out_ev_ctrb(10),
       d28(11) => out_ev_ctrb(11),
       d28(12) => out_ev_ctrb(12),
       d28(13) => out_ev_ctrb(13),
       d28(14) => out_ev_ctrb(14),
       d28(15) => out_ev_ctrb(15),
       d28(16) => out_ev_ctrb(16),
       d28(17) => out_ev_ctrb(17),
       d28(18) => out_ev_ctrb(18),
       d28(19) => out_ev_ctrb(19),
       d28(20) => out_ev_ctrb(20),
       d28(21) => out_ev_ctrb(21),
       d28(22) => out_ev_ctrb(22),
       d28(23) => out_ev_ctrb(23),
       d28(24) => out_ev_ctrb(24),
       d28(25) => out_ev_ctrb(25),
       d28(26) => out_ev_ctrb(26),
       d28(27) => out_ev_ctrb(27),
       c4 => bid2,
       clk => clk0,
       out32 => out_ev_ctr,
       resetp => reset_out
  );

U366 : ag284
  port map(
       d28(0) => log_ev_ctrb(0),
       d28(1) => log_ev_ctrb(1),
       d28(2) => log_ev_ctrb(2),
       d28(3) => log_ev_ctrb(3),
       d28(4) => log_ev_ctrb(4),
       d28(5) => log_ev_ctrb(5),
       d28(6) => log_ev_ctrb(6),
       d28(7) => log_ev_ctrb(7),
       d28(8) => log_ev_ctrb(8),
       d28(9) => log_ev_ctrb(9),
       d28(10) => log_ev_ctrb(10),
       d28(11) => log_ev_ctrb(11),
       d28(12) => log_ev_ctrb(12),
       d28(13) => log_ev_ctrb(13),
       d28(14) => log_ev_ctrb(14),
       d28(15) => log_ev_ctrb(15),
       d28(16) => log_ev_ctrb(16),
       d28(17) => log_ev_ctrb(17),
       d28(18) => log_ev_ctrb(18),
       d28(19) => log_ev_ctrb(19),
       d28(20) => log_ev_ctrb(20),
       d28(21) => log_ev_ctrb(21),
       d28(22) => log_ev_ctrb(22),
       d28(23) => log_ev_ctrb(23),
       d28(24) => log_ev_ctrb(24),
       d28(25) => log_ev_ctrb(25),
       d28(26) => log_ev_ctrb(26),
       d28(27) => log_ev_ctrb(27),
       c4 => bid1,
       clk => clk0,
       out32 => log_ev_ctr,
       resetp => reset_out
  );

U367 : ag284
  port map(
       d28(0) => in_ev_ctr_1b(0),
       d28(1) => in_ev_ctr_1b(1),
       d28(2) => in_ev_ctr_1b(2),
       d28(3) => in_ev_ctr_1b(3),
       d28(4) => in_ev_ctr_1b(4),
       d28(5) => in_ev_ctr_1b(5),
       d28(6) => in_ev_ctr_1b(6),
       d28(7) => in_ev_ctr_1b(7),
       d28(8) => in_ev_ctr_1b(8),
       d28(9) => in_ev_ctr_1b(9),
       d28(10) => in_ev_ctr_1b(10),
       d28(11) => in_ev_ctr_1b(11),
       d28(12) => in_ev_ctr_1b(12),
       d28(13) => in_ev_ctr_1b(13),
       d28(14) => in_ev_ctr_1b(14),
       d28(15) => in_ev_ctr_1b(15),
       d28(16) => in_ev_ctr_1b(16),
       d28(17) => in_ev_ctr_1b(17),
       d28(18) => in_ev_ctr_1b(18),
       d28(19) => in_ev_ctr_1b(19),
       d28(20) => in_ev_ctr_1b(20),
       d28(21) => in_ev_ctr_1b(21),
       d28(22) => in_ev_ctr_1b(22),
       d28(23) => in_ev_ctr_1b(23),
       d28(24) => in_ev_ctr_1b(24),
       d28(25) => in_ev_ctr_1b(25),
       d28(26) => in_ev_ctr_1b(26),
       d28(27) => in_ev_ctr_1b(27),
       c4 => bid3,
       clk => clk0,
       out32 => in_ev_ctr_1,
       resetp => reset_out
  );

U368 : ag284
  port map(
       d28(0) => in_ev_ctr_2b(0),
       d28(1) => in_ev_ctr_2b(1),
       d28(2) => in_ev_ctr_2b(2),
       d28(3) => in_ev_ctr_2b(3),
       d28(4) => in_ev_ctr_2b(4),
       d28(5) => in_ev_ctr_2b(5),
       d28(6) => in_ev_ctr_2b(6),
       d28(7) => in_ev_ctr_2b(7),
       d28(8) => in_ev_ctr_2b(8),
       d28(9) => in_ev_ctr_2b(9),
       d28(10) => in_ev_ctr_2b(10),
       d28(11) => in_ev_ctr_2b(11),
       d28(12) => in_ev_ctr_2b(12),
       d28(13) => in_ev_ctr_2b(13),
       d28(14) => in_ev_ctr_2b(14),
       d28(15) => in_ev_ctr_2b(15),
       d28(16) => in_ev_ctr_2b(16),
       d28(17) => in_ev_ctr_2b(17),
       d28(18) => in_ev_ctr_2b(18),
       d28(19) => in_ev_ctr_2b(19),
       d28(20) => in_ev_ctr_2b(20),
       d28(21) => in_ev_ctr_2b(21),
       d28(22) => in_ev_ctr_2b(22),
       d28(23) => in_ev_ctr_2b(23),
       d28(24) => in_ev_ctr_2b(24),
       d28(25) => in_ev_ctr_2b(25),
       d28(26) => in_ev_ctr_2b(26),
       d28(27) => in_ev_ctr_2b(27),
       c4 => bid4,
       clk => clk0,
       out32 => in_ev_ctr_2,
       resetp => reset_out
  );

bid4(3) <= c0sig;

ld_arr_rst_p_4 <= reset_out or pulse_ctl_4(0);

bid4(2) <= c1sig;

bid4(1) <= c0sig;

bid4(0) <= c0sig;

bid3(3) <= c0sig;

bid3(2) <= c0sig;

bid3(1) <= c1sig;

bid3(0) <= c1sig;

bid1(3) <= c0sig;

bid1(2) <= c0sig;

bid1(1) <= c0sig;

U38 : decode_addr_NIM_Plus_4
  port map(
       addr => rx_addr,
       blk_wr_en => blk_wr_en_4,
       wr_en => rx_wren
  );

bid1(0) <= c1sig;

bid2(3) <= c0sig;

bid2(2) <= c0sig;

bid2(1) <= c1sig;

bid2(0) <= c0sig;

bid5(3) <= c0sig;

bid5(2) <= c1sig;

bid5(1) <= c0sig;

bid5(0) <= c1sig;

bid6(3) <= c0sig;

sigmux(23) <= sync_w_40MHz;

bid6(2) <= c1sig;

bid6(1) <= c1sig;

bid6(0) <= c0sig;

bid7(2) <= c1sig;

bid7(1) <= c1sig;

bid7(0) <= c1sig;

bid8(3) <= c1sig;

bid8(2) <= c0sig;

bid8(1) <= c0sig;

bid8(0) <= c0sig;

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

c1sig <= not(GND);

U401 : agrgate_8_by_8
  port map(
       in0(0) => cnt64_simp_out(0),
       in0(1) => cnt64_simp_out(1),
       in0(2) => cnt64_simp_out(2),
       in0(3) => cnt64_simp_out(3),
       in0(4) => cnt64_simp_out(4),
       in0(5) => cnt64_simp_out(5),
       in0(6) => cnt64_simp_out(6),
       in0(7) => cnt64_simp_out(7),
       in1(0) => cnt64_simp_out(8),
       in1(1) => cnt64_simp_out(9),
       in1(2) => cnt64_simp_out(10),
       in1(3) => cnt64_simp_out(11),
       in1(4) => cnt64_simp_out(12),
       in1(5) => cnt64_simp_out(13),
       in1(6) => cnt64_simp_out(14),
       in1(7) => cnt64_simp_out(15),
       in2(0) => cnt64_simp_out(16),
       in2(1) => cnt64_simp_out(17),
       in2(2) => cnt64_simp_out(18),
       in2(3) => cnt64_simp_out(19),
       in2(4) => cnt64_simp_out(20),
       in2(5) => cnt64_simp_out(21),
       in2(6) => cnt64_simp_out(22),
       in2(7) => cnt64_simp_out(23),
       in3(0) => cnt64_simp_out(24),
       in3(1) => cnt64_simp_out(25),
       in3(2) => cnt64_simp_out(26),
       in3(3) => cnt64_simp_out(27),
       in3(4) => cnt64_simp_out(28),
       in3(5) => cnt64_simp_out(29),
       in3(6) => cnt64_simp_out(30),
       in3(7) => cnt64_simp_out(31),
       in4(0) => cnt64_simp_out(32),
       in4(1) => cnt64_simp_out(33),
       in4(2) => cnt64_simp_out(34),
       in4(3) => cnt64_simp_out(35),
       in4(4) => cnt64_simp_out(36),
       in4(5) => cnt64_simp_out(37),
       in4(6) => cnt64_simp_out(38),
       in4(7) => cnt64_simp_out(39),
       in5(0) => cnt64_simp_out(40),
       in5(1) => cnt64_simp_out(41),
       in5(2) => cnt64_simp_out(42),
       in5(3) => cnt64_simp_out(43),
       in5(4) => cnt64_simp_out(44),
       in5(5) => cnt64_simp_out(45),
       in5(6) => cnt64_simp_out(46),
       in5(7) => cnt64_simp_out(47),
       in6(0) => cnt64_simp_out(48),
       in6(1) => cnt64_simp_out(49),
       in6(2) => cnt64_simp_out(50),
       in6(3) => cnt64_simp_out(51),
       in6(4) => cnt64_simp_out(52),
       in6(5) => cnt64_simp_out(53),
       in6(6) => cnt64_simp_out(54),
       in6(7) => cnt64_simp_out(55),
       in7(0) => cnt64_simp_out(56),
       in7(1) => cnt64_simp_out(57),
       in7(2) => cnt64_simp_out(58),
       in7(3) => cnt64_simp_out(59),
       in7(4) => cnt64_simp_out(60),
       in7(5) => cnt64_simp_out(61),
       in7(6) => cnt64_simp_out(62),
       in7(7) => cnt64_simp_out(63),
       out_0 => rdd4
  );

U402 : d_ff
  port map(
       clk => clk0,
       dl => NET62481,
       q => NET62518,
       rst_p => c0sig
  );

U403 : d_ff
  port map(
       clk => clk0,
       dl => sig_log,
       q => NET62481,
       rst_p => c0sig
  );

U404 : d_ff
  port map(
       clk => clk0,
       dl => NET64172,
       q => NET64181,
       rst_p => c0sig
  );

U405 : d_ff
  port map(
       clk => clk0,
       dl => NET64181,
       q => burst_wr_in(3),
       rst_p => c0sig
  );

U406 : reg_64
  port map(
       clk => clk0,
       d => sig_out_cnts,
       q => BUS64341,
       reset_p => c0sig,
       wr_en => c1sig
  );

U407 : reg_64
  port map(
       clk => clk0,
       d => BUS64341,
       q => BUS64350,
       reset_p => c0sig,
       wr_en => c1sig
  );

U408 : reg_64
  port map(
       clk => clk0,
       d => BUS64350,
       q => sig_output_counts,
       reset_p => c0sig,
       wr_en => c1sig
  );

U409 : reg_64
  port map(
       clk => clk0,
       d => sig_event_cnts,
       q => BUS64461,
       reset_p => c0sig,
       wr_en => c1sig
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

U410 : reg_64
  port map(
       clk => clk0,
       d => BUS64461,
       q => BUS64467,
       reset_p => c0sig,
       wr_en => c1sig
  );

U411 : reg_64
  port map(
       clk => clk0,
       d => BUS64467,
       q => sig_event_counts,
       reset_p => c0sig,
       wr_en => c1sig
  );

U412 : agrgate_8_by_8
  port map(
       in0(0) => out_ctr_3(0),
       in0(1) => out_ctr_3(1),
       in0(2) => out_ctr_3(2),
       in0(3) => out_ctr_3(3),
       in0(4) => out_ctr_3(4),
       in0(5) => out_ctr_3(5),
       in0(6) => out_ctr_3(6),
       in0(7) => out_ctr_3(7),
       in1(0) => out_ctr_3(8),
       in1(1) => out_ctr_3(9),
       in1(2) => out_ctr_3(10),
       in1(3) => out_ctr_3(11),
       in1(4) => out_ctr_3(12),
       in1(5) => out_ctr_3(13),
       in1(6) => out_ctr_3(14),
       in1(7) => out_ctr_3(15),
       in2(0) => out_ctr_3(16),
       in2(1) => out_ctr_3(17),
       in2(2) => out_ctr_3(18),
       in2(3) => out_ctr_3(19),
       in2(4) => out_ctr_3(20),
       in2(5) => out_ctr_3(21),
       in2(6) => out_ctr_3(22),
       in2(7) => out_ctr_3(23),
       in3(0) => out_ctr_3(24),
       in3(1) => out_ctr_3(25),
       in3(2) => out_ctr_3(26),
       in3(3) => out_ctr_3(27),
       in3(4) => out_ctr_3(28),
       in3(5) => out_ctr_3(29),
       in3(6) => out_ctr_3(30),
       in3(7) => out_ctr_3(31),
       in4(0) => out_ctr_4(0),
       in4(1) => out_ctr_4(1),
       in4(2) => out_ctr_4(2),
       in4(3) => out_ctr_4(3),
       in4(4) => out_ctr_4(4),
       in4(5) => out_ctr_4(5),
       in4(6) => out_ctr_4(6),
       in4(7) => out_ctr_4(7),
       in5(0) => out_ctr_4(8),
       in5(1) => out_ctr_4(9),
       in5(2) => out_ctr_4(10),
       in5(3) => out_ctr_4(11),
       in5(4) => out_ctr_4(12),
       in5(5) => out_ctr_4(13),
       in5(6) => out_ctr_4(14),
       in5(7) => out_ctr_4(15),
       in6(0) => out_ctr_4(16),
       in6(1) => out_ctr_4(17),
       in6(2) => out_ctr_4(18),
       in6(3) => out_ctr_4(19),
       in6(4) => out_ctr_4(20),
       in6(5) => out_ctr_4(21),
       in6(6) => out_ctr_4(22),
       in6(7) => out_ctr_4(23),
       in7(0) => out_ctr_4(24),
       in7(1) => out_ctr_4(25),
       in7(2) => out_ctr_4(26),
       in7(3) => out_ctr_4(27),
       in7(4) => out_ctr_4(28),
       in7(5) => out_ctr_4(29),
       in7(6) => out_ctr_4(30),
       in7(7) => out_ctr_4(31),
       out_0 => rdd6
  );

U413 : d_ff
  port map(
       clk => clk0,
       dl => NET64588,
       q => NET64594,
       rst_p => c0sig
  );

U414 : d_ff
  port map(
       clk => clk0,
       dl => NET64594,
       q => NET64598,
       rst_p => c0sig
  );

U415 : d_ff
  port map(
       clk => clk0,
       dl => NET64598,
       q => burst_wr_in(0),
       rst_p => c0sig
  );

U416 : d_ff
  port map(
       clk => clk0,
       dl => bmy(0),
       q => y(0),
       rst_p => c0sig
  );

U417 : d_ff
  port map(
       clk => clk0,
       dl => trig_sig1nd,
       q => NET65433,
       rst_p => c0sig
  );

U418 : d_ff
  port map(
       clk => clk0,
       dl => NET65433,
       q => NET65437,
       rst_p => c0sig
  );

U419 : d_ff
  port map(
       clk => clk0,
       dl => NET65437,
       q => trig_sig1,
       rst_p => c0sig
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

U420 : d_ff
  port map(
       clk => clk0,
       dl => bmy(1),
       q => y(1),
       rst_p => c0sig
  );

U421 : d_ff
  port map(
       clk => clk0,
       dl => trig_sig2nd,
       q => NET65597,
       rst_p => c0sig
  );

U422 : d_ff
  port map(
       clk => clk0,
       dl => NET65597,
       q => NET65601,
       rst_p => c0sig
  );

U423 : d_ff
  port map(
       clk => clk0,
       dl => NET65601,
       q => trig_sig2,
       rst_p => c0sig
  );

U424 : d_ff
  port map(
       clk => clk0,
       dl => bmy(2),
       q => y(2),
       rst_p => c0sig
  );

U425 : d_ff
  port map(
       clk => clk0,
       dl => bmy(3),
       q => y(3),
       rst_p => c0sig
  );

msig1(1) <= sg_pout;

msig1(2) <= clk_ext;

msig2(0) <= y(2);

muxout_1 <= mxout1a;

U43 : test_mux
  port map(
       rst_p => reset_out,
       s_addr => mux_ctl,
       sigtestin => sigmux,
       tsig_out => muxout_1a
  );

U430 : agrgate_8_by_8
  port map(
       in2(0) => Dangling_Input_Signal,
       in2(1) => Dangling_Input_Signal,
       in2(2) => Dangling_Input_Signal,
       in2(3) => Dangling_Input_Signal,
       in2(4) => Dangling_Input_Signal,
       in2(5) => Dangling_Input_Signal,
       in2(6) => Dangling_Input_Signal,
       in2(7) => Dangling_Input_Signal,
       in3(0) => Dangling_Input_Signal,
       in3(1) => Dangling_Input_Signal,
       in3(2) => Dangling_Input_Signal,
       in3(3) => Dangling_Input_Signal,
       in3(4) => Dangling_Input_Signal,
       in3(5) => Dangling_Input_Signal,
       in3(6) => Dangling_Input_Signal,
       in3(7) => Dangling_Input_Signal,
       in4(0) => Dangling_Input_Signal,
       in4(1) => Dangling_Input_Signal,
       in4(2) => Dangling_Input_Signal,
       in4(3) => Dangling_Input_Signal,
       in4(4) => Dangling_Input_Signal,
       in4(5) => Dangling_Input_Signal,
       in4(6) => Dangling_Input_Signal,
       in4(7) => Dangling_Input_Signal,
       in5(0) => Dangling_Input_Signal,
       in5(1) => Dangling_Input_Signal,
       in5(2) => Dangling_Input_Signal,
       in5(3) => Dangling_Input_Signal,
       in5(4) => Dangling_Input_Signal,
       in5(5) => Dangling_Input_Signal,
       in5(6) => Dangling_Input_Signal,
       in5(7) => Dangling_Input_Signal,
       in6(0) => Dangling_Input_Signal,
       in6(1) => Dangling_Input_Signal,
       in6(2) => Dangling_Input_Signal,
       in6(3) => Dangling_Input_Signal,
       in6(4) => Dangling_Input_Signal,
       in6(5) => Dangling_Input_Signal,
       in6(6) => Dangling_Input_Signal,
       in6(7) => Dangling_Input_Signal,
       in7(0) => Dangling_Input_Signal,
       in7(1) => Dangling_Input_Signal,
       in7(2) => Dangling_Input_Signal,
       in7(3) => Dangling_Input_Signal,
       in7(4) => Dangling_Input_Signal,
       in7(5) => Dangling_Input_Signal,
       in7(6) => Dangling_Input_Signal,
       in7(7) => Dangling_Input_Signal,
       in0 => in_pol_sel,
       in1 => out_pol_sel,
       out_0 => rdb20
  );

muxout_2 <= mxout2a;

muxout_3 <= mxout3a;

muxout_4 <= mxout4a;

U434 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => long_r_norm,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(6)
  );

U435 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => long_r_1,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(6)
  );

U436 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => long_r_2,
       reset_p => reset_out,
       wr_en => blk_wr_en_3(6)
  );

U437 : mux_8_to_1
  port map(
       sel_in(0) => mssel(0),
       sel_in(1) => mssel(1),
       sel_in(2) => mssel(2),
       out_1 => ys(0),
       rst_p => c0sig,
       sig_in => msig0
  );

U438 : mux_8_to_1
  port map(
       sel_in(0) => mssel(4),
       sel_in(1) => mssel(5),
       sel_in(2) => mssel(6),
       out_1 => ys(1),
       rst_p => c0sig,
       sig_in => msig1
  );

U439 : reg_16
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
       q => mssel,
       reset_p => reset_out,
       wr_en => blk_wr_en_1(8)
  );

sigmux(1) <= bmy(0);

U440 : mux_8_to_1
  port map(
       sel_in(0) => mssel(8),
       sel_in(1) => mssel(9),
       sel_in(2) => mssel(10),
       out_1 => ys(2),
       rst_p => c0sig,
       sig_in => msig2
  );

U441 : mux_8_to_1
  port map(
       sel_in(0) => mssel(12),
       sel_in(1) => mssel(13),
       sel_in(2) => mssel(14),
       out_1 => ys(3),
       rst_p => c0sig,
       sig_in => msig3
  );

msig0(0) <= y(0);

msig0(1) <= sg_pout;

msig0(2) <= clk_ext;

msig2(1) <= sg_pout;

msig2(2) <= clk_ext;

msig3(0) <= y(3);

msig3(1) <= sg_pout;

msig3(2) <= clk_ext;

sigmux(2) <= bmy(1);

ck_mx_out(0) <= ext_clk_ctl(0);

ck_mx_out(1) <= ext_clk_ctl(1);

ck_mx_out(2) <= ext_clk_ctl(2);

ck_mx_out(3) <= ext_clk_ctl(3);

ck_mx_out(4) <= ext_clk_ctl(4);

ck_mx_out(5) <= ext_clk_ctl(5);

ck_mx_out(6) <= ext_clk_ctl(6);

ck_mx_out(7) <= ext_clk_ctl(7);

sig_sel(1) <= (sig_mod(1) and not sel_ctl(5)) or (ys(1) and sel_ctl(5));

sig_sel(2) <= (sig_mod(2) and not sel_ctl(6)) or (ys(2) and sel_ctl(6));

sigmux(3) <= bmy(2);

sig_sel(3) <= (sig_mod(3) and not sel_ctl(7)) or (ys(3) and sel_ctl(7));

U461 : reg_64
  port map(
       clk => tx_clk,
       d => rx_data,
       q => mch_in,
       reset_p => reset_out,
       wr_en => blk_wr_en_2(0)
  );

U462 : mch_trig_out
  port map(
       mxout => mxout_mxin,
       sel => mch_in,
       trig_40 => trig_40,
       trig_53 => trig_53
  );

mxout_mxin(0) <= mxout1a;

mxout_mxin(1) <= mxout2a;

mxout_mxin(2) <= mxout3a;

mxout_mxin(3) <= mxout4a;

U467 : sel_block
  port map(
       blk_en => sel_ctl(1),
       clk0 => clk0,
       en_term => sel_blk_en_term,
       logterm => logterm,
       rst_p => reset_out,
       sig_out => sig_log,
       x => sig_sel
  );

U468 : d_ff
  port map(
       clk => clk0,
       dl => NET69495,
       q => NET69568,
       rst_p => GND
  );

NET69495 <= NET69568;

sigmux(4) <= bmy(3);

clk160_2pta <= NET69568;

U471 : d_ff
  port map(
       clk => clk0,
       dl => clk_13_25,
       q => clk13_lat,
       rst_p => GND
  );

U472 : d_ff
  port map(
       clk => clk0,
       dl => clk_26_5,
       q => clk_265_lat,
       rst_p => GND
  );

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

U58 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => out_ev_ctrb,
       rst_p => out_cnt_rst,
       sigin => sig_norm
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

NET9478 <= ctr_resets(0) or reset_out;

U66 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => in_ev_ctr_3,
       rst_p => NET9478,
       sigin => sig_mod(2)
  );

NET9526 <= ctr_resets(0) or reset_out;

U68 : s_cnt32_v2
  port map(
       clk0 => clk0,
       out32 => in_ev_ctr_4,
       rst_p => NET9526,
       sigin => sig_mod(3)
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

NET25266 <= NET24020 or bkprout_v2 or veto_out_p2 or veto2_ctl(1);

sigmux(26) <= muxout_3a;

sigmux(27) <= muxout_4a;

U73 : pol_sel
  port map(
       sel_in => out_pol_sel(0),
       sig_in => muxout_1a,
       sig_out => mxout1a
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
       p_count(0) => pcnt(0),
       p_count(1) => pcnt(1),
       p_count(2) => pcnt(2),
       p_count(3) => pcnt(3),
       p_count(4) => pcnt(4),
       p_count(5) => pcnt(5),
       p_count(6) => pcnt(6),
       p_count(7) => pcnt(7),
       p_count(8) => pcnt(8),
       p_count(9) => pcnt(9),
       p_count(10) => pcnt(10),
       p_count(11) => pcnt(11),
       p_count(12) => pcnt(12),
       p_count(13) => pcnt(13),
       p_count(14) => pcnt(14),
       p_count(15) => pcnt(15),
       p_count(16) => pcnt(16),
       p_count(17) => pcnt(17),
       p_count(18) => pcnt(18),
       p_count(19) => pcnt(19),
       p_count(20) => pcnt(20),
       p_count(21) => pcnt(21),
       p_count(22) => pcnt(22),
       p_count(23) => pcnt(23),
       p_count(24) => pcnt(24),
       p_count(25) => pcnt(25),
       p_count(26) => pcnt(26),
       p_count(27) => pcnt(27),
       clk => clk0,
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

sigmux(29) <= cln_clk_53;

U82 : reg_32
  port map(
       d(0) => Dangling_Input_Signal,
       d(1) => Dangling_Input_Signal,
       d(2) => Dangling_Input_Signal,
       d(3) => Dangling_Input_Signal,
       d(4) => Dangling_Input_Signal,
       d(5) => Dangling_Input_Signal,
       d(6) => Dangling_Input_Signal,
       d(7) => Dangling_Input_Signal,
       d(8) => Dangling_Input_Signal,
       d(9) => Dangling_Input_Signal,
       d(10) => Dangling_Input_Signal,
       d(11) => Dangling_Input_Signal,
       d(12) => Dangling_Input_Signal,
       d(13) => Dangling_Input_Signal,
       d(14) => Dangling_Input_Signal,
       d(15) => Dangling_Input_Signal,
       d(16) => rx_data(0),
       d(17) => rx_data(1),
       d(18) => rx_data(2),
       d(19) => rx_data(3),
       d(20) => rx_data(4),
       d(21) => rx_data(5),
       d(22) => rx_data(6),
       d(23) => rx_data(7),
       d(24) => rx_data(8),
       d(25) => rx_data(9),
       d(26) => rx_data(10),
       d(27) => rx_data(11),
       d(28) => rx_data(12),
       d(29) => rx_data(13),
       d(30) => rx_data(14),
       d(31) => rx_data(15),
       clk => tx_clk,
       q => fs_sync_bus,
       reset_p => reset_out,
       wr_en => blk_wr_en_cts(8)
  );

U83 : reg_8
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
