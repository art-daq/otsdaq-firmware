--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : PSI_Dig_Block.vhf
-- /___/   /\     Timestamp : 05/02/2018 10:59:52
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family virtex4 -flat -suppress -vhdl /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/ftbf/stib_master_dig/GEL_CAPTAN/PSI_Dig_Block.vhf -w /home/rrivera/ots/srcs/otsdaq-firmware/cactus/projects/ftbf/stib_master_dig/GEL_CAPTAN/PSI_Dig_Block.sch
--Design Name: PSI_Dig_Block
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PSI_Dig_Block is
   port ( cal_tag              : in    std_logic_vector (15 downto 0); 
          cal_tag_trig_num_sel : in    std_logic; 
          first_in_chain       : in    std_logic; 
          MASTER_CLK           : in    std_logic; 
          plaq_id              : in    std_logic_vector (2 downto 0); 
          psi_dig_data_delayed : in    std_logic; 
          psi_dig_sdata_clk    : in    std_logic; 
          psi_mode             : in    std_logic_vector (4 downto 0); 
          psi_token_in         : in    std_logic; 
          psi_token_out        : in    std_logic; 
          rd_token_in          : in    std_logic; 
          reset                : in    std_logic; 
          time_stamp           : in    std_logic_vector (12 downto 0); 
          token_stack_count    : in    std_logic_vector (3 downto 0); 
          tokin_cnt            : in    std_logic_vector (19 downto 0); 
          trig_cnt             : in    std_logic_vector (19 downto 0); 
          error_decoder_ovf    : out   std_logic; 
          error_reset_req      : out   std_logic; 
          ovf_err              : out   std_logic; 
          rd_token_out         : out   std_logic; 
          sm_ready             : out   std_logic; 
          we_out               : out   std_logic; 
          bus_dout             : inout std_logic_vector (63 downto 0));
end PSI_Dig_Block;

architecture BEHAVIORAL of PSI_Dig_Block is
   signal psi_dec_data         : std_logic_vector (28 downto 0);
   signal psi_dec_data_we      : std_logic;
   signal tokin_cnt_latch      : std_logic_vector (19 downto 0);
   component chip_token_manager
      port ( reset                : in    std_logic; 
             clk                  : in    std_logic; 
             token_in             : in    std_logic; 
             first_in_token_chain : in    std_logic; 
             cal_trig_sel         : in    std_logic; 
             pdin_we              : in    std_logic; 
             plaq_id              : in    std_logic_vector (2 downto 0); 
             cal_tag              : in    std_logic_vector (15 downto 0); 
             tokin_cnt            : in    std_logic_vector (19 downto 0); 
             trig_cnt             : in    std_logic_vector (19 downto 0); 
             time_stamp           : in    std_logic_vector (12 downto 0); 
             tkstack_cnt          : in    std_logic_vector (3 downto 0); 
             pdin                 : in    std_logic_vector (28 downto 0); 
             b_mode_sel           : in    std_logic_vector (4 downto 0); 
             bus_dout             : inout std_logic_vector (63 downto 0); 
             ovf_err              : out   std_logic; 
             token_out            : out   std_logic; 
             we_out               : out   std_logic; 
             trig_tok_diff        : out   std_logic_vector (3 downto 0));
   end component;
   
   component psi_dig_decoder
      port ( sclk            : in    std_logic; 
             rst             : in    std_logic; 
             sdata           : in    std_logic; 
             tok_in          : in    std_logic; 
             tok_out         : in    std_logic; 
             mclk            : in    std_logic; 
             evt_num         : in    std_logic_vector (19 downto 0); 
             sm_ready        : out   std_logic; 
             error           : out   std_logic; 
             error_reset_req : out   std_logic; 
             dataout_we      : out   std_logic; 
             evt_num_latch   : out   std_logic_vector (19 downto 0); 
             dataout         : out   std_logic_vector (28 downto 0));
   end component;
   
begin
   CHIP_TMGR : chip_token_manager
      port map (b_mode_sel(4 downto 0)=>psi_mode(4 downto 0),
                cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_trig_sel=>cal_tag_trig_num_sel,
                clk=>MASTER_CLK,
                first_in_token_chain=>first_in_chain,
                pdin(28 downto 0)=>psi_dec_data(28 downto 0),
                pdin_we=>psi_dec_data_we,
                plaq_id(2 downto 0)=>plaq_id(2 downto 0),
                reset=>reset,
                time_stamp(12 downto 0)=>time_stamp(12 downto 0),
                tkstack_cnt(3 downto 0)=>token_stack_count(3 downto 0),
                token_in=>rd_token_in,
                tokin_cnt(19 downto 0)=>tokin_cnt_latch(19 downto 0),
                trig_cnt(19 downto 0)=>trig_cnt(19 downto 0),
                ovf_err=>ovf_err,
                token_out=>rd_token_out,
                trig_tok_diff=>open,
                we_out=>we_out,
                bus_dout(63 downto 0)=>bus_dout(63 downto 0));
   
   XLXI_6064 : psi_dig_decoder
      port map (evt_num(19 downto 0)=>tokin_cnt(19 downto 0),
                mclk=>MASTER_CLK,
                rst=>reset,
                sclk=>psi_dig_sdata_clk,
                sdata=>psi_dig_data_delayed,
                tok_in=>psi_token_in,
                tok_out=>psi_token_out,
                dataout(28 downto 0)=>psi_dec_data(28 downto 0),
                dataout_we=>psi_dec_data_we,
                error=>error_decoder_ovf,
                error_reset_req=>error_reset_req,
                evt_num_latch(19 downto 0)=>tokin_cnt_latch(19 downto 0),
                sm_ready=>sm_ready);
   
end BEHAVIORAL;


