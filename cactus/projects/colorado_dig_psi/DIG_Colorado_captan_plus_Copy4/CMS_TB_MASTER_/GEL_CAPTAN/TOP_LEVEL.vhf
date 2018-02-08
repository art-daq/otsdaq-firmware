--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : TOP_LEVEL.vhf
-- /___/   /\     Timestamp : 01/17/2018 13:26:49
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl D:/Projects/Colorado/digPSI/DIG_Colorado_captan_plus_Copy4/CMS_TB_MASTER_/GEL_CAPTAN/TOP_LEVEL.vhf -w D:/Projects/Colorado/digPSI/DIG_Colorado_captan_plus_Copy4/CMS_TB_MASTER_/GEL_CAPTAN/TOP_LEVEL.sch
--Design Name: TOP_LEVEL
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD8CE_HXILINX_TOP_LEVEL -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8CE_HXILINX_TOP_LEVEL is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0)
    );
end FD8CE_HXILINX_TOP_LEVEL;

architecture Behavioral of FD8CE_HXILINX_TOP_LEVEL is

begin

process(C, CLR)
begin
  if (CLR='1') then
    Q <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;

----- CELL D4_16E_HXILINX_TOP_LEVEL -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D4_16E_HXILINX_TOP_LEVEL is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;
    D4  : out std_logic;
    D5  : out std_logic;
    D6  : out std_logic;
    D7  : out std_logic;
    D8  : out std_logic;
    D9  : out std_logic;
    D10  : out std_logic;
    D11  : out std_logic;
    D12  : out std_logic;
    D13  : out std_logic;
    D14  : out std_logic;
    D15  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    E   : in std_logic
  );
end D4_16E_HXILINX_TOP_LEVEL;

architecture D4_16E_HXILINX_TOP_LEVEL_V of D4_16E_HXILINX_TOP_LEVEL is
  signal d_tmp : std_logic_vector(15 downto 0);
begin
  process (A0, A1, A2, A3, E)
  variable sel   : std_logic_vector(3 downto 0);
  begin
    sel := A3&A2&A1&A0;
    if( E = '0') then
    d_tmp <= "0000000000000000";
    else
      case sel is
      when "0000" => d_tmp <= "0000000000000001";
      when "0001" => d_tmp <= "0000000000000010";
      when "0010" => d_tmp <= "0000000000000100";
      when "0011" => d_tmp <= "0000000000001000";
      when "0100" => d_tmp <= "0000000000010000";
      when "0101" => d_tmp <= "0000000000100000";
      when "0110" => d_tmp <= "0000000001000000";
      when "0111" => d_tmp <= "0000000010000000";
      when "1000" => d_tmp <= "0000000100000000";
      when "1001" => d_tmp <= "0000001000000000";
      when "1010" => d_tmp <= "0000010000000000";
      when "1011" => d_tmp <= "0000100000000000";
      when "1100" => d_tmp <= "0001000000000000";
      when "1101" => d_tmp <= "0010000000000000";
      when "1110" => d_tmp <= "0100000000000000";
      when "1111" => d_tmp <= "1000000000000000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D15 <= d_tmp(15);
    D14 <= d_tmp(14);
    D13 <= d_tmp(13);
    D12 <= d_tmp(12);
    D11 <= d_tmp(11);
    D10 <= d_tmp(10);
    D9  <= d_tmp(9);
    D8  <= d_tmp(8);
    D7  <= d_tmp(7);
    D6  <= d_tmp(6);
    D5  <= d_tmp(5);
    D4  <= d_tmp(4);
    D3  <= d_tmp(3);
    D2  <= d_tmp(2);
    D1  <= d_tmp(1);
    D0  <= d_tmp(0);

end D4_16E_HXILINX_TOP_LEVEL_V;
----- CELL M4_1E_HXILINX_TOP_LEVEL -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_TOP_LEVEL is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_TOP_LEVEL;

architecture M4_1E_HXILINX_TOP_LEVEL_V of M4_1E_HXILINX_TOP_LEVEL is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_TOP_LEVEL_V;
----- CELL FD16RE_HXILINX_TOP_LEVEL -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16RE_HXILINX_TOP_LEVEL is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0);
    R   : in STD_LOGIC
    );
end FD16RE_HXILINX_TOP_LEVEL;

architecture Behavioral of FD16RE_HXILINX_TOP_LEVEL is

begin

process(C)
begin
  if (C'event and C = '1') then
    if (R='1') then
      Q <= (others => '0');
    elsif (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;

----- CELL FD8RE_HXILINX_TOP_LEVEL -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8RE_HXILINX_TOP_LEVEL is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0);
    R   : in STD_LOGIC
    );
end FD8RE_HXILINX_TOP_LEVEL;

architecture Behavioral of FD8RE_HXILINX_TOP_LEVEL is

begin

process(C)
begin
  if (C'event and C = '1') then
    if (R='1') then
      Q <= (others => '0');
    elsif (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;

----- CELL D2_4E_HXILINX_TOP_LEVEL -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_TOP_LEVEL is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_TOP_LEVEL;

architecture D2_4E_HXILINX_TOP_LEVEL_V of D2_4E_HXILINX_TOP_LEVEL is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_TOP_LEVEL_V;
----- CELL M2_1_HXILINX_TOP_LEVEL -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_TOP_LEVEL is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_TOP_LEVEL;

architecture M2_1_HXILINX_TOP_LEVEL_V of M2_1_HXILINX_TOP_LEVEL is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_TOP_LEVEL_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PSI_Dig_Block_MUSER_TOP_LEVEL is
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
end PSI_Dig_Block_MUSER_TOP_LEVEL;

architecture BEHAVIORAL of PSI_Dig_Block_MUSER_TOP_LEVEL is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity TOP_LEVEL is
   port ( BUSC_07DN_15S   : in    std_logic; 
          BUSC_07DP_14S   : in    std_logic; 
          BUSC_09DN_19S   : in    std_logic; 
          BUSC_09DP_18S   : in    std_logic; 
          BUSDHS_02DP_04S : in    std_logic; 
          BUSDHS_03DP_06S : in    std_logic; 
          GEL_RXCLK       : in    std_logic; 
          PHY_RXCTL_RXDV  : in    std_logic; 
          PHY_RXD0        : in    std_logic; 
          PHY_RXD1        : in    std_logic; 
          PHY_RXD2        : in    std_logic; 
          PHY_RXD3        : in    std_logic; 
          PHY_RXD4        : in    std_logic; 
          PHY_RXD5        : in    std_logic; 
          PHY_RXD6        : in    std_logic; 
          PHY_RXD7        : in    std_logic; 
          PHY_RXER        : in    std_logic; 
          PSI_1_DATA_N    : in    std_logic; 
          PSI_1_DATA_P    : in    std_logic; 
          PSI_1_TOKOUT_N  : in    std_logic; 
          PSI_1_TOKOUT_P  : in    std_logic; 
          PSI_2_DATA_N    : in    std_logic; 
          PSI_2_DATA_P    : in    std_logic; 
          PSI_2_TOKOUT_N  : in    std_logic; 
          PSI_2_TOKOUT_P  : in    std_logic; 
          SECONDARY_CLK   : in    std_logic; 
          BUSC_02DN_05S   : out   std_logic; 
          BUSC_02DP_04S   : out   std_logic; 
          BUSC_03DN_07S   : out   std_logic; 
          BUSC_03DP_06S   : out   std_logic; 
          BUSC_10DN_21S   : out   std_logic; 
          BUSC_10DP_20S   : out   std_logic; 
          BUSC_11DN_23S   : out   std_logic; 
          BUSC_11DP_22S   : out   std_logic; 
          BUSC_12DP_24S   : out   std_logic; 
          BUSC_14DN_29S   : out   std_logic; 
          BUSC_14DP_28S   : out   std_logic; 
          BUSC_15DN_31S   : out   std_logic; 
          BUSC_15DP_30S   : out   std_logic; 
          BUSC_16DN_33S   : out   std_logic; 
          BUSC_24DN_49S   : out   std_logic; 
          BUSC_24DP_48S   : out   std_logic; 
          BUSC_25DN_51S   : out   std_logic; 
          BUSC_25DP_50S   : out   std_logic; 
          BUSC_26DN_53S   : out   std_logic; 
          BUSC_27DN_55S   : out   std_logic; 
          PSI_1_CLK_N     : out   std_logic; 
          PSI_1_CLK_P     : out   std_logic; 
          PSI_1_CTRL_N    : out   std_logic; 
          PSI_1_CTRL_P    : out   std_logic; 
          PSI_1_RST       : out   std_logic; 
          PSI_1_TOKIN_N   : out   std_logic; 
          PSI_1_TOKIN_P   : out   std_logic; 
          PSI_1_TRIG_N    : out   std_logic; 
          PSI_1_TRIG_P    : out   std_logic; 
          PSI_2_CLK_N     : out   std_logic; 
          PSI_2_CLK_P     : out   std_logic; 
          PSI_2_CTRL_N    : out   std_logic; 
          PSI_2_CTRL_P    : out   std_logic; 
          PSI_2_RST       : out   std_logic; 
          PSI_2_TOKIN_N   : out   std_logic; 
          PSI_2_TOKIN_P   : out   std_logic; 
          PSI_2_TRIG_N    : out   std_logic; 
          PSI_2_TRIG_P    : out   std_logic; 
          BUSC_21DN_43S   : inout std_logic);
end TOP_LEVEL;

architecture BEHAVIORAL of TOP_LEVEL is
   attribute BOX_TYPE              : string ;
   attribute IOBDELAY_VALUE        : string ;
   attribute IOBDELAY_TYPE         : string ;
   attribute CLK_FEEDBACK          : string ;
   attribute CLKDV_DIVIDE          : string ;
   attribute CLKFX_DIVIDE          : string ;
   attribute CLKFX_MULTIPLY        : string ;
   attribute CLKIN_DIVIDE_BY_2     : string ;
   attribute CLKIN_PERIOD          : string ;
   attribute CLKOUT_PHASE_SHIFT    : string ;
   attribute DCM_PERFORMANCE_MODE  : string ;
   attribute DESKEW_ADJUST         : string ;
   attribute DFS_FREQUENCY_MODE    : string ;
   attribute DLL_FREQUENCY_MODE    : string ;
   attribute DUTY_CYCLE_CORRECTION : string ;
   attribute FACTORY_JF            : string ;
   attribute PHASE_SHIFT           : string ;
   attribute STARTUP_WAIT          : string ;
   attribute DCM_AUTOCALIBRATION   : string ;
   attribute HU_SET                : string ;
   attribute IOSTANDARD            : string ;
   attribute CAPACITANCE           : string ;
   attribute IBUF_LOW_PWR          : string ;
   attribute SLEW                  : string ;
   attribute DRIVE                 : string ;
   attribute DIFF_TERM             : string ;
   attribute DQS_BIAS              : string ;
   attribute BANDWIDTH             : string ;
   attribute CLKFBOUT_MULT_F       : string ;
   attribute CLKFBOUT_PHASE        : string ;
   attribute CLKIN1_PERIOD         : string ;
   attribute CLKOUT0_DIVIDE_F      : string ;
   attribute CLKOUT0_DUTY_CYCLE    : string ;
   attribute CLKOUT0_PHASE         : string ;
   attribute CLKOUT1_DIVIDE        : string ;
   attribute CLKOUT1_DUTY_CYCLE    : string ;
   attribute CLKOUT1_PHASE         : string ;
   attribute CLKOUT2_DIVIDE        : string ;
   attribute CLKOUT2_DUTY_CYCLE    : string ;
   attribute CLKOUT2_PHASE         : string ;
   attribute CLKOUT3_DIVIDE        : string ;
   attribute CLKOUT3_DUTY_CYCLE    : string ;
   attribute CLKOUT3_PHASE         : string ;
   attribute CLKOUT4_CASCADE       : string ;
   attribute CLKOUT4_DIVIDE        : string ;
   attribute CLKOUT4_DUTY_CYCLE    : string ;
   attribute CLKOUT4_PHASE         : string ;
   attribute CLKOUT5_DIVIDE        : string ;
   attribute CLKOUT5_DUTY_CYCLE    : string ;
   attribute CLKOUT5_PHASE         : string ;
   attribute CLKOUT6_DIVIDE        : string ;
   attribute CLKOUT6_DUTY_CYCLE    : string ;
   attribute CLKOUT6_PHASE         : string ;
   attribute DIVCLK_DIVIDE         : string ;
   attribute REF_JITTER1           : string ;
   signal ADC_CLK_DEL_MAP             : std_logic;
   signal adc_clk_del_reset           : std_logic;
   signal adc_clk_sel                 : std_logic;
   signal ADC_CLK_SEL_MAP             : std_logic;
   signal ADC_CLOCK_MAP               : std_logic;
   signal ADC_DCM_FB                  : std_logic;
   signal ADC_DELAY_MAP               : std_logic;
   signal ADC_SAMPLE_CAL              : std_logic;
   signal adc_ss_data                 : std_logic_vector (63 downto 0);
   signal adc_ss_data_we              : std_logic;
   signal ADC_TESTMODE_MAP            : std_logic;
   signal BURST_DATA_SEL_MAP          : std_logic;
   signal bypass_token_stack          : std_logic;
   signal b_data                      : std_logic_vector (63 downto 0);
   signal b_data_mode_sel             : std_logic_vector (4 downto 0);
   signal b_data_we                   : std_logic;
   signal cal_ctrl_psi_cmd_fifo_empty : std_logic;
   signal cal_ctrl_sw_en_pulse        : std_logic;
   signal cal_tag                     : std_logic_vector (15 downto 0);
   signal cal_tag_trig_num_sel        : std_logic;
   signal clock_5mhz                  : std_logic;
   signal dcm_reset                   : std_logic;
   signal dcm_reset_psi               : std_logic;
   signal delayed_token               : std_logic_vector (2 downto 0);
   signal EN_TRIG_TOK_MAP             : std_logic;
   signal error_reset_req             : std_logic_vector (2 downto 0);
   signal event_number                : std_logic_vector (59 downto 0);
   signal EXT_CLK                     : std_logic;
   signal EXT_TRIGG                   : std_logic;
   signal first_in_chain              : std_logic_vector (3 downto 0);
   signal gec_addrs                   : std_logic_vector (7 downto 0);
   signal GEC_DEST_ADDRS_MAP          : std_logic;
   signal GEC_DEST_MACPORT_MAP        : std_logic;
   signal gec_macport                 : std_logic_vector (63 downto 0);
   signal gec_user_addrs              : std_logic_vector (7 downto 0);
   signal global_plaq_write_sel       : std_logic_vector (1 downto 0);
   signal GLOBAL_RESET_MAP            : std_logic;
   signal GMII_RXD_0_sig              : std_logic_vector (7 downto 0);
   signal GMII_RX_DV_0_sig            : std_logic;
   signal GMII_RX_ER_0_sig            : std_logic;
   signal GTX_CLK_0_sig               : std_logic;
   signal internal_acc_clk            : std_logic;
   signal internal_4x_clk             : std_logic;
   signal internal_4x180_clk          : std_logic;
   signal inv_psi_reset               : std_logic;
   signal levels_read0                : std_logic_vector (63 downto 0);
   signal levels_read1                : std_logic_vector (63 downto 0);
   signal man_ch_dec                  : std_logic_vector (3 downto 0);
   signal man_ch_inc                  : std_logic_vector (3 downto 0);
   signal man_clk_dec                 : std_logic;
   signal man_clk_inc                 : std_logic;
   signal man_frm_dec                 : std_logic;
   signal man_frm_inc                 : std_logic;
   signal man_rst                     : std_logic;
   signal man_sample_sel_bits         : std_logic_vector (7 downto 0);
   signal MAN_SAMPLE_SEL_MAP          : std_logic;
   signal MASTER_CLK                  : std_logic;
   signal MASTER_TRIGGER_MAP          : std_logic;
   signal MASTER_VETO_MAP             : std_logic;
   signal PHY_TXD_sig                 : std_logic_vector (7 downto 0);
   signal PHY_TXEN_sig                : std_logic;
   signal PHY_TXER_sig                : std_logic;
   signal plaq_id                     : std_logic_vector (8 downto 0);
   signal PLAQ_SEL_MAP                : std_logic;
   signal psi_burst_data              : std_logic_vector (63 downto 0);
   signal psi_burst_we                : std_logic;
   signal psi_b_data_we               : std_logic_vector (2 downto 0);
   signal psi_b_data_we_pre_and       : std_logic_vector (2 downto 0);
   signal PSI_CAL_TAG_MAP             : std_logic;
   signal PSI_CLK0                    : std_logic;
   signal PSI_CLK90                   : std_logic;
   signal PSI_CLK270                  : std_logic;
   signal psi_cmd_fifo_empty          : std_logic;
   signal psi_cmd_fifo_full           : std_logic;
   signal PSI_CMD_FIFO_MAP            : std_logic;
   signal psi_cmd_fifo_re             : std_logic;
   signal psi_data_i2c                : std_logic;
   signal psi_data_out                : std_logic_vector (3 downto 0);
   signal psi_delay_high              : std_logic;
   signal psi_dig_ctrl                : std_logic_vector (7 downto 0);
   signal psi_dig_data                : std_logic_vector (2 downto 0);
   signal psi_dig_data_delayed        : std_logic_vector (2 downto 0);
   signal psi_dig_data_delay_inc      : std_logic;
   signal psi_dig_data_delay_rst      : std_logic;
   signal PSI_DIG_MAP                 : std_logic;
   signal psi_dig_read                : std_logic_vector (63 downto 0);
   signal psi_dig_reset_req           : std_logic_vector (2 downto 0);
   signal psi_dig_sdata_clk           : std_logic_vector (2 downto 0);
   signal psi_dig_sm_ready            : std_logic_vector (2 downto 0);
   signal psi_errors                  : std_logic_vector (63 downto 0);
   signal psi_extdom_trig             : std_logic;
   signal PSI_LEVELS_WE_MAP           : std_logic;
   signal PSI_PULSES_MAP              : std_logic;
   signal psi_reset                   : std_logic;
   signal PSI_SAMPLE_DEBUG_MAP        : std_logic;
   signal psi_status                  : std_logic_vector (63 downto 0);
   signal psi_status_en               : std_logic;
   signal PSI_STATUS_EN_MAP           : std_logic;
   signal psi_token_in                : std_logic_vector (2 downto 0);
   signal psi_token_out               : std_logic_vector (2 downto 0);
   signal psi_token_reset_n           : std_logic_vector (2 downto 0);
   signal psi_token_we                : std_logic;
   signal psi_trigger                 : std_logic;
   signal readout_reset               : std_logic;
   signal reset                       : std_logic;
   signal reset_button                : std_logic;
   signal reset_dig4x_dcm             : std_logic;
   signal RESET_MAP                   : std_logic;
   signal reset_n                     : std_logic;
   signal reset_phy                   : std_logic;
   signal reset_start                 : std_logic;
   signal rx_addr                     : std_logic_vector (31 downto 0);
   signal rx_data                     : std_logic_vector (63 downto 0);
   signal rx_wren                     : std_logic;
   signal scin_phys                   : std_logic_vector (2 downto 0);
   signal scin_phys_gated             : std_logic_vector (2 downto 0);
   signal sm_ready                    : std_logic_vector (2 downto 0);
   signal software_reset              : std_logic;
   signal telescope_busy              : std_logic;
   signal telescope_trigger_en        : std_logic;
   signal third_dut_ctrl              : std_logic_vector (7 downto 0);
   signal timestamp                   : std_logic_vector (12 downto 0);
   signal token                       : std_logic_vector (3 downto 0);
   signal token_count                 : std_logic_vector (11 downto 0);
   signal TOKEN_STACK_MAP             : std_logic;
   signal token_throttle              : std_logic_vector (2 downto 0);
   signal trigger_board_output        : std_logic;
   signal trigger_busy                : std_logic;
   signal trigger_number              : std_logic_vector (63 downto 0);
   signal trigger_output_mux_sel0     : std_logic;
   signal trigger_output_mux_sel1     : std_logic;
   signal trigger_throttle            : std_logic;
   signal trig_fifo_empty             : std_logic;
   signal trig_fifo_re                : std_logic;
   signal trig_fifo_read              : std_logic_vector (7 downto 0);
   signal trig_fifo_ts                : std_logic_vector (7 downto 0);
   signal trig_fifo_we                : std_logic;
   signal trig_mask_en                : std_logic;
   signal trig_mask_hi                : std_logic;
   signal trig_reset                  : std_logic;
   signal trig_throttle_ds            : std_logic;
   signal trig_throttle_gated         : std_logic_vector (2 downto 0);
   signal trig_throttle_ms            : std_logic;
   signal trig_throttle_us            : std_logic;
   signal trig_veto_dur               : std_logic_vector (31 downto 0);
   signal tx_data                     : std_logic_vector (63 downto 0);
   signal vcc_sig                     : std_logic;
   signal XLXN_12023                  : std_logic;
   signal XLXN_12220                  : std_logic;
   signal XLXN_12229                  : std_logic;
   signal XLXN_12257                  : std_logic;
   signal XLXN_12617                  : std_logic;
   signal XLXN_15064                  : std_logic;
   signal XLXN_15755                  : std_logic;
   signal XLXN_15849                  : std_logic;
   signal XLXN_16082                  : std_logic_vector (31 downto 0);
   signal XLXN_17193                  : std_logic;
   signal XLXN_17196                  : std_logic;
   signal XLXN_17199                  : std_logic;
   signal XLXN_17233                  : std_logic;
   signal XLXN_17239                  : std_logic;
   signal XLXN_17430                  : std_logic;
   signal XLXN_17517                  : std_logic;
   signal XLXN_17722                  : std_logic;
   signal XLXN_17849                  : std_logic;
   signal XLXN_17913                  : std_logic;
   signal XLXN_17914                  : std_logic;
   signal XLXN_17915                  : std_logic;
   signal XLXN_17999                  : std_logic;
   signal XLXN_18000                  : std_logic;
   signal XLXN_18001                  : std_logic;
   signal XLXN_18123                  : std_logic;
   signal XLXN_18128                  : std_logic;
   signal XLXN_18181                  : std_logic;
   signal XLXN_18355                  : std_logic;
   signal XLXN_18365                  : std_logic;
   signal XLXN_18372                  : std_logic;
   signal XLXN_18379                  : std_logic;
   signal XLXN_18540                  : std_logic_vector (1 downto 0);
   signal XLXN_18546                  : std_logic_vector (1 downto 0);
   signal XLXN_18597                  : std_logic;
   signal XLXN_18639                  : std_logic;
   signal XLXN_18694                  : std_logic;
   signal XLXN_18695                  : std_logic;
   signal XLXN_18733                  : std_logic;
   signal XLXN_18744                  : std_logic;
   signal XLXN_18808                  : std_logic;
   signal XLXN_18828                  : std_logic;
   signal XLXN_18829                  : std_logic;
   signal XLXI_5338_in6_openSignal    : std_logic_vector (63 downto 0);
   signal XLXI_5338_in7_openSignal    : std_logic_vector (63 downto 0);
   component FDE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDE : component is "BLACK_BOX";
   
   component External_Trigger_Handler
      port ( xclk             : in    std_logic; 
             ext_trig_line_in : in    std_logic; 
             ext_trigger      : out   std_logic);
   end component;
   
   component IDELAY
      -- synopsys translate_off
      generic( IOBDELAY_VALUE : integer :=  0;
               IOBDELAY_TYPE : string :=  "DEFAULT");
      -- synopsys translate_on
      port ( I   : in    std_logic; 
             CE  : in    std_logic; 
             C   : in    std_logic; 
             INC : in    std_logic; 
             RST : in    std_logic; 
             O   : out   std_logic);
   end component;
   attribute IOBDELAY_VALUE of IDELAY : component is "0";
   attribute IOBDELAY_TYPE of IDELAY : component is "DEFAULT";
   attribute BOX_TYPE of IDELAY : component is "BLACK_BOX";
   
   component PSI_Dig_Block_MUSER_TOP_LEVEL
      port ( MASTER_CLK           : in    std_logic; 
             rd_token_in          : in    std_logic; 
             plaq_id              : in    std_logic_vector (2 downto 0); 
             first_in_chain       : in    std_logic; 
             psi_mode             : in    std_logic_vector (4 downto 0); 
             reset                : in    std_logic; 
             psi_dig_sdata_clk    : in    std_logic; 
             psi_dig_data_delayed : in    std_logic; 
             psi_token_in         : in    std_logic; 
             psi_token_out        : in    std_logic; 
             tokin_cnt            : in    std_logic_vector (19 downto 0); 
             token_stack_count    : in    std_logic_vector (3 downto 0); 
             time_stamp           : in    std_logic_vector (12 downto 0); 
             trig_cnt             : in    std_logic_vector (19 downto 0); 
             cal_tag_trig_num_sel : in    std_logic; 
             cal_tag              : in    std_logic_vector (15 downto 0); 
             bus_dout             : inout std_logic_vector (63 downto 0); 
             ovf_err              : out   std_logic; 
             rd_token_out         : out   std_logic; 
             we_out               : out   std_logic; 
             error_decoder_ovf    : out   std_logic; 
             error_reset_req      : out   std_logic; 
             sm_ready             : out   std_logic);
   end component;
   
   component psi_command_sender
      port ( psi_clk    : in    std_logic; 
             reset      : in    std_logic; 
             fifo_empty : in    std_logic; 
             fifo_full  : in    std_logic; 
             data       : in    std_logic_vector (31 downto 0); 
             fifo_re    : out   std_logic; 
             data_error : out   std_logic; 
             we_error   : out   std_logic; 
             data_out   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component TokenStack
      port ( psi_clk       : in    std_logic; 
             rst           : in    std_logic; 
             error_rst_req : in    std_logic; 
             token_we      : in    std_logic; 
             sm_ready      : in    std_logic; 
             bypass_stack  : in    std_logic; 
             psi_reset_n   : out   std_logic; 
             ovf_flow      : out   std_logic; 
             throttle      : out   std_logic; 
             token_to_psi  : out   std_logic; 
             tok_cnt       : out   std_logic_vector (3 downto 0); 
             event_number  : out   std_logic_vector (19 downto 0));
   end component;
   
   component psi_token_delay_blk
      port ( clk         : in    std_logic; 
             token       : in    std_logic; 
             token_delay : out   std_logic);
   end component;
   
   component token_trigger_controller
      port ( is_ext_mode         : in    std_logic; 
             use_cal_inject      : in    std_logic; 
             sw_en_pulse         : in    std_logic; 
             param_we            : in    std_logic; 
             ext_trigger         : in    std_logic; 
             master_clk          : in    std_logic; 
             psi_clk             : in    std_logic; 
             rst                 : in    std_logic; 
             trig_repetition_per : in    std_logic_vector (15 downto 0); 
             inject_trig_gap     : in    std_logic_vector (7 downto 0); 
             trig_token_gap      : in    std_logic_vector (15 downto 0); 
             num_of_triggers     : in    std_logic_vector (7 downto 0); 
             token               : out   std_logic; 
             trigger             : out   std_logic; 
             error               : out   std_logic; 
             busy                : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component IDELAYCTRL
      port ( REFCLK : in    std_logic; 
             RST    : in    std_logic; 
             RDY    : out   std_logic);
   end component;
   attribute BOX_TYPE of IDELAYCTRL : component is "BLACK_BOX";
   
   component DCM_BASE
      -- synopsys translate_off
      generic( CLK_FEEDBACK : string :=  "1X";
               CLKDV_DIVIDE : real :=  2.0;
               CLKFX_DIVIDE : integer :=  1;
               CLKFX_MULTIPLY : integer :=  4;
               CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
               CLKIN_PERIOD : real :=  10.0;
               CLKOUT_PHASE_SHIFT : string :=  "NONE";
               DCM_PERFORMANCE_MODE : string :=  "MAX_SPEED";
               DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
               DFS_FREQUENCY_MODE : string :=  "LOW";
               DLL_FREQUENCY_MODE : string :=  "LOW";
               DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
               FACTORY_JF : bit_vector :=  x"F0F0";
               PHASE_SHIFT : integer :=  0;
               STARTUP_WAIT : boolean :=  FALSE;
               DCM_AUTOCALIBRATION : boolean :=  TRUE);
      -- synopsys translate_on
      port ( CLKIN    : in    std_logic; 
             CLKFB    : in    std_logic; 
             RST      : in    std_logic; 
             CLK0     : out   std_logic; 
             CLK90    : out   std_logic; 
             CLK180   : out   std_logic; 
             CLK270   : out   std_logic; 
             CLK2X    : out   std_logic; 
             CLK2X180 : out   std_logic; 
             CLKDV    : out   std_logic; 
             CLKFX    : out   std_logic; 
             CLKFX180 : out   std_logic; 
             LOCKED   : out   std_logic);
   end component;
   attribute CLK_FEEDBACK of DCM_BASE : component is "1X";
   attribute CLKDV_DIVIDE of DCM_BASE : component is "2.0";
   attribute CLKFX_DIVIDE of DCM_BASE : component is "1";
   attribute CLKFX_MULTIPLY of DCM_BASE : component is "4";
   attribute CLKIN_DIVIDE_BY_2 of DCM_BASE : component is "FALSE";
   attribute CLKIN_PERIOD of DCM_BASE : component is "10.0";
   attribute CLKOUT_PHASE_SHIFT of DCM_BASE : component is "NONE";
   attribute DCM_PERFORMANCE_MODE of DCM_BASE : component is "MAX_SPEED";
   attribute DESKEW_ADJUST of DCM_BASE : component is "SYSTEM_SYNCHRONOUS";
   attribute DFS_FREQUENCY_MODE of DCM_BASE : component is "LOW";
   attribute DLL_FREQUENCY_MODE of DCM_BASE : component is "LOW";
   attribute DUTY_CYCLE_CORRECTION of DCM_BASE : component is "TRUE";
   attribute FACTORY_JF of DCM_BASE : component is "F0F0";
   attribute PHASE_SHIFT of DCM_BASE : component is "0";
   attribute STARTUP_WAIT of DCM_BASE : component is "FALSE";
   attribute DCM_AUTOCALIBRATION of DCM_BASE : component is "TRUE";
   attribute BOX_TYPE of DCM_BASE : component is "BLACK_BOX";
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component OR3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3B1 : component is "BLACK_BOX";
   
   component D4_16E_HXILINX_TOP_LEVEL
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             E   : in    std_logic; 
             D0  : out   std_logic; 
             D1  : out   std_logic; 
             D10 : out   std_logic; 
             D11 : out   std_logic; 
             D12 : out   std_logic; 
             D13 : out   std_logic; 
             D14 : out   std_logic; 
             D15 : out   std_logic; 
             D2  : out   std_logic; 
             D3  : out   std_logic; 
             D4  : out   std_logic; 
             D5  : out   std_logic; 
             D6  : out   std_logic; 
             D7  : out   std_logic; 
             D8  : out   std_logic; 
             D9  : out   std_logic);
   end component;
   
   component IBUFG
      -- synopsys translate_off
      generic( IBUF_LOW_PWR : boolean :=  TRUE);
      -- synopsys translate_on
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute IBUF_LOW_PWR of IBUFG : component is "TRUE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
   
   component IOBUF
      -- synopsys translate_off
      generic( IBUF_LOW_PWR : boolean :=  TRUE);
      -- synopsys translate_on
      port ( I  : in    std_logic; 
             IO : inout std_logic; 
             O  : out   std_logic; 
             T  : in    std_logic);
   end component;
   attribute IOSTANDARD of IOBUF : component is "DEFAULT";
   attribute CAPACITANCE of IOBUF : component is "DONT_CARE";
   attribute SLEW of IOBUF : component is "SLOW";
   attribute DRIVE of IOBUF : component is "12";
   attribute IBUF_LOW_PWR of IOBUF : component is "TRUE";
   attribute BOX_TYPE of IOBUF : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component VERSION_BLK
      port ( version : out   std_logic_vector (7 downto 0));
   end component;
   
   component FD16RE_HXILINX_TOP_LEVEL
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic_vector (15 downto 0); 
             R  : in    std_logic; 
             Q  : out   std_logic_vector (15 downto 0));
   end component;
   
   component PLAQ_ID_GEN
      port ( plaq_id0 : out   std_logic_vector (2 downto 0); 
             plaq_id1 : out   std_logic_vector (2 downto 0); 
             plaq_id2 : out   std_logic_vector (2 downto 0); 
             plaq_id3 : out   std_logic_vector (2 downto 0));
   end component;
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component M2_1_HXILINX_TOP_LEVEL
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component D2_4E_HXILINX_TOP_LEVEL
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component First_In_Chain_Gen
      port ( first_in_chain : out   std_logic_vector (3 downto 0));
   end component;
   
   component MUX64_8
      port ( in0    : in    std_logic_vector (63 downto 0); 
             in1    : in    std_logic_vector (63 downto 0); 
             in2    : in    std_logic_vector (63 downto 0); 
             in3    : in    std_logic_vector (63 downto 0); 
             in4    : in    std_logic_vector (63 downto 0); 
             in5    : in    std_logic_vector (63 downto 0); 
             in6    : in    std_logic_vector (63 downto 0); 
             in7    : in    std_logic_vector (63 downto 0); 
             sel    : in    std_logic_vector (2 downto 0); 
             muxout : out   std_logic_vector (63 downto 0));
   end component;
   
   component IBUFDS
      -- synopsys translate_off
      generic( DIFF_TERM : boolean :=  FALSE;
               DQS_BIAS : boolean :=  FALSE;
               IBUF_LOW_PWR : boolean :=  TRUE);
      -- synopsys translate_on
      port ( I  : in    std_logic; 
             IB : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFDS : component is "DEFAULT";
   attribute DIFF_TERM of IBUFDS : component is "FALSE";
   attribute DQS_BIAS of IBUFDS : component is "FALSE";
   attribute IBUF_LOW_PWR of IBUFDS : component is "TRUE";
   attribute BOX_TYPE of IBUFDS : component is "BLACK_BOX";
   
   component OBUFDS
      port ( I  : in    std_logic; 
             O  : out   std_logic; 
             OB : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUFDS : component is "DEFAULT";
   attribute BOX_TYPE of OBUFDS : component is "BLACK_BOX";
   
   component Trigger_Counter_Block
      port ( master_clk      : in    std_logic; 
             psi_trigger     : in    std_logic; 
             reset           : in    std_logic; 
             trigger_counter : out   std_logic_vector (19 downto 0); 
             timestamp       : out   std_logic_vector (12 downto 0));
   end component;
   
   component MUX64_2
      port ( sel    : in    std_logic; 
             in0    : in    std_logic_vector (63 downto 0); 
             in1    : in    std_logic_vector (63 downto 0); 
             muxout : out   std_logic_vector (63 downto 0));
   end component;
   
   component FD8CE_HXILINX_TOP_LEVEL
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component TriggerBlock
      port ( mclk             : in    std_logic; 
             xclk             : in    std_logic; 
             rst              : in    std_logic; 
             en               : in    std_logic; 
             we               : in    std_logic; 
             trig_fifo_empty  : in    std_logic; 
             trig_mask_en     : in    std_logic; 
             trig_mask_hi     : in    std_logic; 
             scin             : in    std_logic_vector (2 downto 0); 
             master_clk_delay : in    std_logic_vector (3 downto 0); 
             psi_clk_delay    : in    std_logic_vector (7 downto 0); 
             trig_fifo_read   : in    std_logic_vector (7 downto 0); 
             trig_fifo_we     : out   std_logic; 
             trig_fifo_re     : out   std_logic; 
             busy             : out   std_logic; 
             trig_out         : out   std_logic; 
             trig_fifo_ts     : out   std_logic_vector (7 downto 0); 
             veto_duration    : in    std_logic_vector (19 downto 0));
   end component;
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component trigger_fifo_8
      port ( clk   : in    std_logic; 
             rst   : in    std_logic; 
             wr_en : in    std_logic; 
             rd_en : in    std_logic; 
             din   : in    std_logic_vector (7 downto 0); 
             full  : out   std_logic; 
             empty : out   std_logic; 
             dout  : out   std_logic_vector (7 downto 0));
   end component;
   
   component fd_64
      port ( Q  : out   std_logic_vector (63 downto 0); 
             CE : in    std_logic; 
             D  : in    std_logic_vector (63 downto 0); 
             C  : in    std_logic; 
             R  : in    std_logic);
   end component;
   
   component FD8RE_HXILINX_TOP_LEVEL
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic_vector (7 downto 0); 
             R  : in    std_logic; 
             Q  : out   std_logic_vector (7 downto 0));
   end component;
   
   component psi_cmd_fifo32_512depth
      port ( rst    : in    std_logic; 
             wr_clk : in    std_logic; 
             rd_clk : in    std_logic; 
             wr_en  : in    std_logic; 
             rd_en  : in    std_logic; 
             din    : in    std_logic_vector (31 downto 0); 
             full   : out   std_logic; 
             empty  : out   std_logic; 
             dout   : out   std_logic_vector (31 downto 0));
   end component;
   
   component M4_1E_HXILINX_TOP_LEVEL
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component calibration_controller
      port ( mclk                        : in    std_logic; 
             trigger_busy                : in    std_logic; 
             next_cal_trigger            : in    std_logic; 
             reset                       : in    std_logic; 
             psi_cmd_fifo_empty          : in    std_logic; 
             cal_en                      : in    std_logic; 
             error                       : out   std_logic; 
             cal_ctrl_psi_cmd_fifo_empty : out   std_logic; 
             cal_ctrl_sw_en_pulse        : out   std_logic);
   end component;
   
   component MMCME2_BASE
      -- synopsys translate_off
      generic( BANDWIDTH : string :=  "OPTIMIZED";
               CLKFBOUT_MULT_F : real :=  5.000;
               CLKFBOUT_PHASE : real :=  0.000;
               CLKOUT0_DIVIDE_F : real :=  1.000;
               CLKOUT0_PHASE : real :=  0.000;
               CLKOUT1_DIVIDE : integer :=  1;
               CLKOUT1_PHASE : real :=  0.000;
               CLKOUT2_DIVIDE : integer :=  1;
               CLKOUT2_PHASE : real :=  0.000;
               CLKOUT3_DIVIDE : integer :=  1;
               CLKOUT3_PHASE : real :=  0.000;
               CLKOUT4_CASCADE : string :=  "FALSE";
               CLKOUT4_DIVIDE : integer :=  1;
               CLKOUT4_PHASE : real :=  0.000;
               CLKOUT5_DIVIDE : integer :=  1;
               CLKOUT5_PHASE : real :=  0.000;
               CLKOUT6_DIVIDE : integer :=  1;
               CLKOUT6_PHASE : real :=  0.000;
               DIVCLK_DIVIDE : integer :=  1;
               STARTUP_WAIT : string :=  "FALSE");
      -- synopsys translate_on
      port ( CLKFBIN   : in    std_logic; 
             CLKIN1    : in    std_logic; 
             PWRDWN    : in    std_logic; 
             RST       : in    std_logic; 
             CLKFBOUT  : out   std_logic; 
             CLKFBOUTB : out   std_logic; 
             CLKOUT0   : out   std_logic; 
             CLKOUT0B  : out   std_logic; 
             CLKOUT1   : out   std_logic; 
             CLKOUT1B  : out   std_logic; 
             CLKOUT2   : out   std_logic; 
             CLKOUT2B  : out   std_logic; 
             CLKOUT3   : out   std_logic; 
             CLKOUT3B  : out   std_logic; 
             CLKOUT4   : out   std_logic; 
             CLKOUT5   : out   std_logic; 
             CLKOUT6   : out   std_logic; 
             LOCKED    : out   std_logic);
   end component;
   attribute BANDWIDTH of MMCME2_BASE : component is "OPTIMIZED";
   attribute CLKFBOUT_MULT_F of MMCME2_BASE : component is "5.000";
   attribute CLKFBOUT_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKIN1_PERIOD of MMCME2_BASE : component is "0.000";
   attribute CLKOUT0_DIVIDE_F of MMCME2_BASE : component is "1.000";
   attribute CLKOUT0_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT0_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT1_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT1_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT1_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT2_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT2_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT2_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT3_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT3_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT3_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT4_CASCADE of MMCME2_BASE : component is "FALSE";
   attribute CLKOUT4_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT4_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT4_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT5_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT5_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT5_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT6_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT6_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT6_PHASE of MMCME2_BASE : component is "0.000";
   attribute DIVCLK_DIVIDE of MMCME2_BASE : component is "1";
   attribute REF_JITTER1 of MMCME2_BASE : component is "0.010";
   attribute STARTUP_WAIT of MMCME2_BASE : component is "FALSE";
   attribute BOX_TYPE of MMCME2_BASE : component is "BLACK_BOX";
   
   component reset_mgr
      port ( slow_clk    : in    std_logic; 
             reset_start : in    std_logic; 
             reset       : out   std_logic);
   end component;
   
   component clk_wiz_0_mod
      port ( CLK_IN1      : in    std_logic; 
             RESET        : in    std_logic; 
             PSI_CLK0     : out   std_logic; 
             PSI_CLK90    : out   std_logic; 
             PSI_CLK270   : out   std_logic; 
             PSI_CLK4x0   : out   std_logic; 
             PSI_CLK4x180 : out   std_logic; 
             LOCKED       : out   std_logic);
   end component;
   
   component ethernet_interfaceNEW
      port ( reset_in   : in    std_logic; 
             b_data_we  : in    std_logic; 
             MASTER_CLK : in    std_logic; 
             PHY_RX_DV  : in    std_logic; 
             PHY_RX_ER  : in    std_logic; 
             tx_data    : in    std_logic_vector (63 downto 0); 
             b_data     : in    std_logic_vector (63 downto 0); 
             PHY_RXD    : in    std_logic_vector (7 downto 0); 
             reset_out  : out   std_logic; 
             rx_wren    : out   std_logic; 
             b_enable   : out   std_logic; 
             TX_CLK     : out   std_logic; 
             PHY_TX_EN  : out   std_logic; 
             PHY_TX_ER  : out   std_logic; 
             rx_addr    : out   std_logic_vector (31 downto 0); 
             rx_data    : out   std_logic_vector (63 downto 0); 
             PHY_TXD    : out   std_logic_vector (7 downto 0));
   end component;
   
   attribute IOBDELAY_TYPE of idelay_psi_dig_0 : label is "VARIABLE";
   attribute IOBDELAY_TYPE of idelay_psi_dig_1 : label is "VARIABLE";
   attribute IOBDELAY_TYPE of idelay_psi_dig_2 : label is "VARIABLE";
   attribute CLKIN_PERIOD of XLXI_3410 : label is "8.0";
   attribute CLKFX_MULTIPLY of XLXI_3410 : label is "8";
   attribute CLKFX_DIVIDE of XLXI_3410 : label is "5";
   attribute HU_SET of XLXI_3432 : label is "XLXI_3432_0";
   attribute HU_SET of XLXI_4595 : label is "XLXI_4595_2";
   attribute HU_SET of XLXI_4677 : label is "XLXI_4677_1";
   attribute HU_SET of XLXI_4773 : label is "XLXI_4773_16";
   attribute HU_SET of XLXI_5284 : label is "XLXI_5284_4";
   attribute DIFF_TERM of XLXI_5542 : label is "TRUE";
   attribute HU_SET of XLXI_5561 : label is "XLXI_5561_3";
   attribute HU_SET of XLXI_5677 : label is "XLXI_5677_5";
   attribute HU_SET of XLXI_5678 : label is "XLXI_5678_6";
   attribute HU_SET of XLXI_6015 : label is "XLXI_6015_7";
   attribute HU_SET of XLXI_6016 : label is "XLXI_6016_13";
   attribute HU_SET of XLXI_6018 : label is "XLXI_6018_14";
   attribute HU_SET of XLXI_6026 : label is "XLXI_6026_15";
   attribute DIFF_TERM of XLXI_6040 : label is "TRUE";
   attribute HU_SET of XLXI_6067 : label is "XLXI_6067_8";
   attribute HU_SET of XLXI_6084 : label is "XLXI_6084_11";
   attribute HU_SET of XLXI_6086 : label is "XLXI_6086_9";
   attribute HU_SET of XLXI_6193 : label is "XLXI_6193_10";
   attribute HU_SET of XLXI_6207 : label is "XLXI_6207_12";
   attribute DIFF_TERM of XLXI_6284 : label is "TRUE";
   attribute DIFF_TERM of XLXI_6291 : label is "TRUE";
   attribute CLKOUT0_DIVIDE_F of XLXI_6292 : label is "28.0";
   attribute CLKFBOUT_MULT_F of XLXI_6292 : label is "6.0";
   attribute CLKIN1_PERIOD of XLXI_6292 : label is "8";
   attribute DIFF_TERM of XLXI_6321 : label is "TRUE";
   attribute DIFF_TERM of XLXI_6328 : label is "TRUE";
begin
   chipscope_dig_latch_0 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_18379,
                D=>psi_dig_data_delayed(0),
                Q=>psi_dig_read(0));
   
   chipscope_dig_latch_1 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_18379,
                D=>psi_dig_data_delayed(1),
                Q=>psi_dig_read(1));
   
   chipscope_dig_latch_2 : FDE
      port map (C=>MASTER_CLK,
                CE=>XLXN_18379,
                D=>psi_dig_data_delayed(2),
                Q=>psi_dig_read(2));
   
   error_reset_ff_0 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18546(0),
                Q=>error_reset_req(0));
   
   error_reset_ff_1 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18546(1),
                Q=>error_reset_req(1));
   
   ext_trig_handler : External_Trigger_Handler
      port map (ext_trig_line_in=>EXT_TRIGG,
                xclk=>PSI_CLK90,
                ext_trigger=>psi_extdom_trig);
   
   idelay_psi_dig_0 : IDELAY
   -- synopsys translate_off
   generic map( IOBDELAY_TYPE => "VARIABLE")
   -- synopsys translate_on
      port map (C=>MASTER_CLK,
                CE=>psi_dig_data_delay_inc,
                I=>psi_dig_data(0),
                INC=>psi_delay_high,
                RST=>psi_dig_data_delay_rst,
                O=>psi_dig_data_delayed(0));
   
   idelay_psi_dig_1 : IDELAY
   -- synopsys translate_off
   generic map( IOBDELAY_TYPE => "VARIABLE")
   -- synopsys translate_on
      port map (C=>MASTER_CLK,
                CE=>psi_dig_data_delay_inc,
                I=>psi_dig_data(1),
                INC=>psi_delay_high,
                RST=>psi_dig_data_delay_rst,
                O=>psi_dig_data_delayed(1));
   
   idelay_psi_dig_2 : IDELAY
   -- synopsys translate_off
   generic map( IOBDELAY_TYPE => "VARIABLE")
   -- synopsys translate_on
      port map (C=>MASTER_CLK,
                CE=>psi_dig_data_delay_inc,
                I=>psi_dig_data(2),
                INC=>psi_delay_high,
                RST=>psi_dig_data_delay_rst,
                O=>psi_dig_data_delayed(2));
   
   PSI_Dig_Blk_0 : PSI_Dig_Block_MUSER_TOP_LEVEL
      port map (cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_tag_trig_num_sel=>cal_tag_trig_num_sel,
                first_in_chain=>first_in_chain(0),
                MASTER_CLK=>MASTER_CLK,
                plaq_id(2 downto 0)=>plaq_id(2 downto 0),
                psi_dig_data_delayed=>psi_dig_data_delayed(0),
                psi_dig_sdata_clk=>psi_dig_sdata_clk(0),
                psi_mode(4 downto 0)=>b_data_mode_sel(4 downto 0),
                psi_token_in=>psi_token_in(0),
                psi_token_out=>delayed_token(0),
                rd_token_in=>token(0),
                reset=>readout_reset,
                time_stamp(12 downto 0)=>timestamp(12 downto 0),
                token_stack_count(3 downto 0)=>token_count(3 downto 0),
                tokin_cnt(19 downto 0)=>event_number(19 downto 0),
                trig_cnt(19 downto 0)=>trigger_number(19 downto 0),
                error_decoder_ovf=>psi_errors(4),
                error_reset_req=>psi_dig_reset_req(0),
                ovf_err=>psi_errors(0),
                rd_token_out=>token(1),
                sm_ready=>psi_dig_sm_ready(0),
                we_out=>psi_b_data_we_pre_and(0),
                bus_dout(63 downto 0)=>psi_burst_data(63 downto 0));
   
   PSI_Dig_Blk_1 : PSI_Dig_Block_MUSER_TOP_LEVEL
      port map (cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_tag_trig_num_sel=>cal_tag_trig_num_sel,
                first_in_chain=>first_in_chain(1),
                MASTER_CLK=>MASTER_CLK,
                plaq_id(2 downto 0)=>plaq_id(5 downto 3),
                psi_dig_data_delayed=>psi_dig_data_delayed(1),
                psi_dig_sdata_clk=>psi_dig_sdata_clk(1),
                psi_mode(4 downto 0)=>b_data_mode_sel(4 downto 0),
                psi_token_in=>psi_token_in(1),
                psi_token_out=>delayed_token(1),
                rd_token_in=>token(1),
                reset=>readout_reset,
                time_stamp(12 downto 0)=>timestamp(12 downto 0),
                token_stack_count(3 downto 0)=>token_count(7 downto 4),
                tokin_cnt(19 downto 0)=>event_number(39 downto 20),
                trig_cnt(19 downto 0)=>trigger_number(19 downto 0),
                error_decoder_ovf=>psi_errors(5),
                error_reset_req=>psi_dig_reset_req(1),
                ovf_err=>psi_errors(1),
                rd_token_out=>token(2),
                sm_ready=>psi_dig_sm_ready(1),
                we_out=>psi_b_data_we_pre_and(1),
                bus_dout(63 downto 0)=>psi_burst_data(63 downto 0));
   
   PSI_Dig_Blk_2 : PSI_Dig_Block_MUSER_TOP_LEVEL
      port map (cal_tag(15 downto 0)=>cal_tag(15 downto 0),
                cal_tag_trig_num_sel=>cal_tag_trig_num_sel,
                first_in_chain=>first_in_chain(2),
                MASTER_CLK=>MASTER_CLK,
                plaq_id(2 downto 0)=>plaq_id(8 downto 6),
                psi_dig_data_delayed=>psi_dig_data_delayed(2),
                psi_dig_sdata_clk=>psi_dig_sdata_clk(2),
                psi_mode(4 downto 0)=>b_data_mode_sel(4 downto 0),
                psi_token_in=>psi_token_in(2),
                psi_token_out=>delayed_token(2),
                rd_token_in=>token(2),
                reset=>readout_reset,
                time_stamp(12 downto 0)=>timestamp(12 downto 0),
                token_stack_count(3 downto 0)=>token_count(11 downto 8),
                tokin_cnt(19 downto 0)=>event_number(59 downto 40),
                trig_cnt(19 downto 0)=>trigger_number(19 downto 0),
                error_decoder_ovf=>psi_errors(6),
                error_reset_req=>psi_dig_reset_req(2),
                ovf_err=>psi_errors(2),
                rd_token_out=>token(3),
                sm_ready=>psi_dig_sm_ready(2),
                we_out=>psi_b_data_we_pre_and(2),
                bus_dout(63 downto 0)=>psi_burst_data(63 downto 0));
   
   psi_i2c_blk : psi_command_sender
      port map (data(31 downto 0)=>XLXN_16082(31 downto 0),
                fifo_empty=>cal_ctrl_psi_cmd_fifo_empty,
                fifo_full=>psi_cmd_fifo_full,
                psi_clk=>PSI_CLK0,
                reset=>psi_reset,
                data_error=>psi_errors(32),
                data_out=>psi_data_i2c,
                fifo_re=>psi_cmd_fifo_re,
                we_error=>psi_errors(36));
   
   RESET_REQ_AND_0 : AND2
      port map (I0=>psi_dig_ctrl(2),
                I1=>psi_dig_reset_req(0),
                O=>XLXN_18546(0));
   
   RESET_REQ_AND_1 : AND2
      port map (I0=>psi_dig_ctrl(3),
                I1=>psi_dig_reset_req(1),
                O=>XLXN_18546(1));
   
   sm_ready_ff_0 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18540(0),
                Q=>sm_ready(0));
   
   sm_ready_ff_1 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18540(1),
                Q=>sm_ready(1));
   
   SM_READY_OR_0 : OR2
      port map (I0=>psi_dig_ctrl(4),
                I1=>psi_dig_sm_ready(0),
                O=>XLXN_18540(0));
   
   SM_READY_OR_1 : OR2
      port map (I0=>psi_dig_ctrl(5),
                I1=>psi_dig_sm_ready(1),
                O=>XLXN_18540(1));
   
   TokenStack_vector_0 : TokenStack
      port map (bypass_stack=>bypass_token_stack,
                error_rst_req=>error_reset_req(0),
                psi_clk=>PSI_CLK90,
                rst=>psi_reset,
                sm_ready=>sm_ready(0),
                token_we=>psi_token_we,
                event_number(19 downto 0)=>event_number(19 downto 0),
                ovf_flow=>psi_errors(8),
                psi_reset_n=>psi_token_reset_n(0),
                throttle=>token_throttle(0),
                token_to_psi=>psi_token_in(0),
                tok_cnt(3 downto 0)=>token_count(3 downto 0));
   
   TokenStack_vector_1 : TokenStack
      port map (bypass_stack=>bypass_token_stack,
                error_rst_req=>error_reset_req(1),
                psi_clk=>PSI_CLK90,
                rst=>psi_reset,
                sm_ready=>sm_ready(1),
                token_we=>psi_token_we,
                event_number(19 downto 0)=>event_number(39 downto 20),
                ovf_flow=>psi_errors(9),
                psi_reset_n=>psi_token_reset_n(1),
                throttle=>token_throttle(1),
                token_to_psi=>psi_token_in(1),
                tok_cnt(3 downto 0)=>token_count(7 downto 4));
   
   TokenStack_vector_2 : TokenStack
      port map (bypass_stack=>bypass_token_stack,
                error_rst_req=>error_reset_req(2),
                psi_clk=>PSI_CLK90,
                rst=>psi_reset,
                sm_ready=>sm_ready(2),
                token_we=>psi_token_we,
                event_number(19 downto 0)=>event_number(59 downto 40),
                ovf_flow=>psi_errors(10),
                psi_reset_n=>psi_token_reset_n(2),
                throttle=>token_throttle(2),
                token_to_psi=>psi_token_in(2),
                tok_cnt(3 downto 0)=>token_count(11 downto 8));
   
   token_delay_vector_0 : psi_token_delay_blk
      port map (clk=>PSI_CLK90,
                token=>psi_token_out(0),
                token_delay=>delayed_token(0));
   
   token_delay_vector_1 : psi_token_delay_blk
      port map (clk=>PSI_CLK90,
                token=>psi_token_out(1),
                token_delay=>delayed_token(1));
   
   token_delay_vector_2 : psi_token_delay_blk
      port map (clk=>PSI_CLK90,
                token=>psi_token_out(2),
                token_delay=>delayed_token(2));
   
   token_trigger_blk : token_trigger_controller
      port map (ext_trigger=>psi_extdom_trig,
                inject_trig_gap(7 downto 0)=>rx_data(23 downto 16),
                is_ext_mode=>rx_data(48),
                master_clk=>MASTER_CLK,
                num_of_triggers(7 downto 0)=>rx_data(47 downto 40),
                param_we=>PSI_PULSES_MAP,
                psi_clk=>PSI_CLK90,
                rst=>trig_reset,
                sw_en_pulse=>cal_ctrl_sw_en_pulse,
                trig_repetition_per(15 downto 0)=>rx_data(15 downto 0),
                trig_token_gap(15 downto 0)=>rx_data(39 downto 24),
                use_cal_inject=>rx_data(56),
                busy=>trigger_busy,
                error=>psi_errors(40),
                token=>psi_token_we,
                trigger=>psi_trigger);
   
   WE_DIG_AND_0 : AND2
      port map (I0=>psi_dig_ctrl(6),
                I1=>psi_b_data_we_pre_and(0),
                O=>psi_b_data_we(0));
   
   WE_DIG_AND_1 : AND2
      port map (I0=>psi_dig_ctrl(7),
                I1=>psi_b_data_we_pre_and(1),
                O=>psi_b_data_we(1));
   
   XLXI_3301 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(4),
                Q=>XLXN_17199);
   
   XLXI_3302 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(0),
                Q=>XLXN_17196);
   
   XLXI_3360 : INV
      port map (I=>reset_phy,
                O=>XLXN_12023);
   
   XLXI_3406 : IDELAYCTRL
      port map (REFCLK=>XLXN_15064,
                RST=>reset,
                RDY=>open);
   
   XLXI_3410 : DCM_BASE
   -- synopsys translate_off
   generic map( CLKIN_PERIOD => 8.0,
            CLKFX_MULTIPLY => 8,
            CLKFX_DIVIDE => 5)
   -- synopsys translate_on
      port map (CLKFB=>XLXN_12229,
                CLKIN=>MASTER_CLK,
                RST=>reset,
                CLKDV=>open,
                CLKFX=>XLXN_12257,
                CLKFX180=>open,
                CLK0=>XLXN_12220,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>open);
   
   XLXI_3411 : BUFG
      port map (I=>XLXN_12220,
                O=>XLXN_12229);
   
   XLXI_3427 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(1),
                Q=>XLXN_17193);
   
   XLXI_3430 : OR3B1
      port map (I0=>reset_button,
                I1=>software_reset,
                I2=>XLXN_18808,
                O=>reset_start);
   
   XLXI_3432 : D4_16E_HXILINX_TOP_LEVEL
      port map (A0=>rx_addr(8),
                A1=>rx_addr(9),
                A2=>rx_addr(10),
                A3=>rx_addr(11),
                E=>XLXN_12617,
                D0=>open,
                D1=>ADC_CLOCK_MAP,
                D2=>RESET_MAP,
                D3=>PSI_PULSES_MAP,
                D4=>PLAQ_SEL_MAP,
                D5=>BURST_DATA_SEL_MAP,
                D6=>ADC_DELAY_MAP,
                D7=>GLOBAL_RESET_MAP,
                D8=>ADC_TESTMODE_MAP,
                D9=>PSI_LEVELS_WE_MAP,
                D10=>PSI_STATUS_EN_MAP,
                D11=>PSI_SAMPLE_DEBUG_MAP,
                D12=>PSI_CMD_FIFO_MAP,
                D13=>EN_TRIG_TOK_MAP,
                D14=>open,
                D15=>PSI_CAL_TAG_MAP);
   
   XLXI_4007 : INV
      port map (I=>reset,
                O=>reset_n);
   
   XLXI_4090 : FDE
      port map (C=>MASTER_CLK,
                CE=>BURST_DATA_SEL_MAP,
                D=>rx_data(4),
                Q=>b_data_mode_sel(2));
   
   XLXI_4136 : IBUFG
      port map (I=>SECONDARY_CLK,
                O=>clock_5mhz);
   
   XLXI_4171 : IOBUF
      port map (I=>XLXN_12023,
                T=>XLXN_12023,
                O=>reset_button,
                IO=>BUSC_21DN_43S);
   
   XLXI_4177 : OBUF
      port map (I=>PHY_TXEN_sig,
                O=>BUSC_27DN_55S);
   
   XLXI_4178 : IBUF
      port map (I=>PHY_RXCTL_RXDV,
                O=>GMII_RX_DV_0_sig);
   
   XLXI_4179 : OBUF
      port map (I=>GTX_CLK_0_sig,
                O=>BUSC_26DN_53S);
   
   XLXI_4181 : OBUF
      port map (I=>PHY_TXD_sig(3),
                O=>BUSC_24DP_48S);
   
   XLXI_4182 : OBUF
      port map (I=>PHY_TXD_sig(2),
                O=>BUSC_24DN_49S);
   
   XLXI_4183 : OBUF
      port map (I=>PHY_TXD_sig(1),
                O=>BUSC_25DP_50S);
   
   XLXI_4184 : OBUF
      port map (I=>PHY_TXD_sig(0),
                O=>BUSC_25DN_51S);
   
   XLXI_4213 : IBUF
      port map (I=>PHY_RXD7,
                O=>GMII_RXD_0_sig(7));
   
   XLXI_4214 : IBUF
      port map (I=>PHY_RXD6,
                O=>GMII_RXD_0_sig(6));
   
   XLXI_4216 : IBUF
      port map (I=>PHY_RXD5,
                O=>GMII_RXD_0_sig(5));
   
   XLXI_4217 : IBUF
      port map (I=>PHY_RXD4,
                O=>GMII_RXD_0_sig(4));
   
   XLXI_4218 : IBUF
      port map (I=>PHY_RXD3,
                O=>GMII_RXD_0_sig(3));
   
   XLXI_4219 : IBUF
      port map (I=>PHY_RXD2,
                O=>GMII_RXD_0_sig(2));
   
   XLXI_4220 : IBUF
      port map (I=>PHY_RXD1,
                O=>GMII_RXD_0_sig(1));
   
   XLXI_4221 : IBUF
      port map (I=>PHY_RXD0,
                O=>GMII_RXD_0_sig(0));
   
   XLXI_4246 : OBUF
      port map (I=>PHY_TXER_sig,
                O=>BUSC_16DN_33S);
   
   XLXI_4247 : OBUF
      port map (I=>PHY_TXD_sig(4),
                O=>BUSC_15DN_31S);
   
   XLXI_4248 : IBUF
      port map (I=>PHY_RXER,
                O=>GMII_RX_ER_0_sig);
   
   XLXI_4249 : OBUF
      port map (I=>PHY_TXD_sig(5),
                O=>BUSC_15DP_30S);
   
   XLXI_4250 : OBUF
      port map (I=>PHY_TXD_sig(6),
                O=>BUSC_14DN_29S);
   
   XLXI_4251 : OBUF
      port map (I=>PHY_TXD_sig(7),
                O=>BUSC_14DP_28S);
   
   XLXI_4253 : IBUFG
      port map (I=>GEL_RXCLK,
                O=>MASTER_CLK);
   
   XLXI_4359 : VERSION_BLK
      port map (version(7 downto 0)=>psi_status(63 downto 56));
   
   XLXI_4529 : BUFG
      port map (I=>XLXN_12257,
                O=>XLXN_15064);
   
   XLXI_4576 : OR2
      port map (I0=>reset,
                I1=>XLXN_17193,
                O=>dcm_reset_psi);
   
   XLXI_4595 : FD16RE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_CAL_TAG_MAP,
                D(15 downto 0)=>rx_data(15 downto 0),
                R=>reset,
                Q(15 downto 0)=>cal_tag(15 downto 0));
   
   XLXI_4660 : PLAQ_ID_GEN
      port map (plaq_id0(2 downto 0)=>plaq_id(2 downto 0),
                plaq_id1(2 downto 0)=>plaq_id(5 downto 3),
                plaq_id2(2 downto 0)=>plaq_id(8 downto 6),
                plaq_id3=>open);
   
   XLXI_4677 : D4_16E_HXILINX_TOP_LEVEL
      port map (A0=>rx_addr(8),
                A1=>rx_addr(9),
                A2=>rx_addr(10),
                A3=>rx_addr(11),
                E=>XLXN_15755,
                D0=>ADC_CLK_SEL_MAP,
                D1=>ADC_CLK_DEL_MAP,
                D2=>ADC_SAMPLE_CAL,
                D3=>MAN_SAMPLE_SEL_MAP,
                D4=>MASTER_TRIGGER_MAP,
                D5=>TOKEN_STACK_MAP,
                D6=>open,
                D7=>open,
                D8=>open,
                D9=>GEC_DEST_MACPORT_MAP,
                D10=>GEC_DEST_ADDRS_MAP,
                D11=>open,
                D12=>open,
                D13=>open,
                D14=>MASTER_VETO_MAP,
                D15=>PSI_DIG_MAP);
   
   XLXI_4696 : AND2
      port map (I0=>rx_addr(12),
                I1=>rx_wren,
                O=>XLXN_15755);
   
   XLXI_4697 : AND2B1
      port map (I0=>rx_addr(12),
                I1=>rx_wren,
                O=>XLXN_12617);
   
   XLXI_4704 : FDE
      port map (C=>MASTER_CLK,
                CE=>PLAQ_SEL_MAP,
                D=>rx_data(0),
                Q=>global_plaq_write_sel(0));
   
   XLXI_4773 : M2_1_HXILINX_TOP_LEVEL
      port map (D0=>internal_acc_clk,
                D1=>EXT_CLK,
                S0=>adc_clk_sel,
                O=>XLXN_15849);
   
   XLXI_4776 : FDE
      port map (C=>MASTER_CLK,
                CE=>ADC_CLK_SEL_MAP,
                D=>rx_data(0),
                Q=>adc_clk_sel);
   
   XLXI_4781 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_CAL_TAG_MAP,
                D=>rx_data(16),
                Q=>cal_tag_trig_num_sel);
   
   XLXI_5033 : FDE
      port map (C=>MASTER_CLK,
                CE=>BURST_DATA_SEL_MAP,
                D=>rx_data(0),
                Q=>b_data_mode_sel(0));
   
   XLXI_5104 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_SAMPLE_DEBUG_MAP,
                D=>rx_data(4),
                Q=>b_data_mode_sel(4));
   
   XLXI_5105 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_SAMPLE_DEBUG_MAP,
                D=>rx_data(0),
                Q=>b_data_mode_sel(3));
   
   XLXI_5137 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_STATUS_EN_MAP,
                D=>rx_data(0),
                Q=>psi_status_en);
   
   XLXI_5229 : FDE
      port map (C=>MASTER_CLK,
                CE=>BURST_DATA_SEL_MAP,
                D=>rx_data(1),
                Q=>b_data_mode_sel(1));
   
   XLXI_5272 : FDE
      port map (C=>MASTER_CLK,
                CE=>PLAQ_SEL_MAP,
                D=>rx_data(1),
                Q=>global_plaq_write_sel(1));
   
   XLXI_5284 : D2_4E_HXILINX_TOP_LEVEL
      port map (A0=>global_plaq_write_sel(0),
                A1=>global_plaq_write_sel(1),
                E=>psi_data_i2c,
                D0=>psi_data_out(0),
                D1=>psi_data_out(1),
                D2=>psi_data_out(2),
                D3=>psi_data_out(3));
   
   XLXI_5316 : First_In_Chain_Gen
      port map (first_in_chain(3 downto 0)=>first_in_chain(3 downto 0));
   
   XLXI_5338 : MUX64_8
      port map (in0(63 downto 0)=>psi_status(63 downto 0),
                in1(63 downto 0)=>psi_errors(63 downto 0),
                in2(63 downto 0)=>trigger_number(63 downto 0),
                in3(63 downto 0)=>psi_dig_read(63 downto 0),
                in4(63 downto 0)=>levels_read0(63 downto 0),
                in5(63 downto 0)=>levels_read1(63 downto 0),
                in6(63 downto 0)=>XLXI_5338_in6_openSignal(63 downto 0),
                in7(63 downto 0)=>XLXI_5338_in7_openSignal(63 downto 0),
                sel(2 downto 0)=>rx_addr(10 downto 8),
                muxout(63 downto 0)=>tx_data(63 downto 0));
   
   XLXI_5542 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSC_09DP_18S,
                IB=>BUSC_09DN_19S,
                O=>psi_token_out(0));
   
   XLXI_5543 : OBUFDS
      port map (I=>PSI_CLK90,
                O=>BUSC_11DP_22S,
                OB=>BUSC_11DN_23S);
   
   XLXI_5544 : OBUFDS
      port map (I=>psi_data_out(0),
                O=>BUSC_02DP_04S,
                OB=>BUSC_02DN_05S);
   
   XLXI_5545 : OBUFDS
      port map (I=>psi_token_in(0),
                O=>BUSC_03DP_06S,
                OB=>BUSC_03DN_07S);
   
   XLXI_5546 : OBUF
      port map (I=>XLXN_18123,
                O=>BUSC_12DP_24S);
   
   XLXI_5547 : OBUFDS
      port map (I=>psi_trigger,
                O=>BUSC_10DP_20S,
                OB=>BUSC_10DN_21S);
   
   XLXI_5561 : D4_16E_HXILINX_TOP_LEVEL
      port map (A0=>rx_addr(0),
                A1=>rx_addr(1),
                A2=>rx_addr(2),
                A3=>rx_addr(3),
                E=>ADC_DELAY_MAP,
                D0=>man_ch_dec(0),
                D1=>man_ch_dec(1),
                D2=>man_ch_dec(2),
                D3=>man_ch_dec(3),
                D4=>man_ch_inc(0),
                D5=>man_ch_inc(1),
                D6=>man_ch_inc(2),
                D7=>man_ch_inc(3),
                D8=>man_clk_inc,
                D9=>man_clk_dec,
                D10=>man_frm_inc,
                D11=>man_frm_dec,
                D12=>man_rst,
                D13=>psi_dig_data_delay_inc,
                D14=>open,
                D15=>psi_dig_data_delay_rst);
   
   XLXI_5573 : OR2
      port map (I0=>reset,
                I1=>XLXN_17196,
                O=>dcm_reset);
   
   XLXI_5579 : OR2
      port map (I0=>reset,
                I1=>XLXN_17233,
                O=>trig_reset);
   
   XLXI_5580 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(12),
                Q=>XLXN_17233);
   
   XLXI_5581 : INV
      port map (I=>psi_reset,
                O=>inv_psi_reset);
   
   XLXI_5583 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(16),
                Q=>XLXN_17239);
   
   XLXI_5598 : Trigger_Counter_Block
      port map (master_clk=>MASTER_CLK,
                psi_trigger=>psi_trigger,
                reset=>psi_reset,
                timestamp(12 downto 0)=>timestamp(12 downto 0),
                trigger_counter(19 downto 0)=>trigger_number(19 downto 0));
   
   XLXI_5654 : OR2
      port map (I0=>reset,
                I1=>XLXN_17430,
                O=>adc_clk_del_reset);
   
   XLXI_5655 : FDE
      port map (C=>MASTER_CLK,
                CE=>RESET_MAP,
                D=>rx_data(24),
                Q=>XLXN_17430);
   
   XLXI_5676 : MUX64_2
      port map (in0(63 downto 0)=>adc_ss_data(63 downto 0),
                in1(63 downto 0)=>psi_burst_data(63 downto 0),
                sel=>b_data_mode_sel(2),
                muxout(63 downto 0)=>b_data(63 downto 0));
   
   XLXI_5677 : M2_1_HXILINX_TOP_LEVEL
      port map (D0=>adc_ss_data_we,
                D1=>psi_burst_we,
                S0=>b_data_mode_sel(2),
                O=>b_data_we);
   
   XLXI_5678 : FD8CE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>MAN_SAMPLE_SEL_MAP,
                CLR=>XLXN_17517,
                D(7 downto 0)=>rx_data(7 downto 0),
                Q(7 downto 0)=>man_sample_sel_bits(7 downto 0));
   
   XLXI_5679 : GND
      port map (G=>XLXN_17517);
   
   XLXI_5683 : BUF
      port map (I=>token(3),
                O=>token(0));
   
   XLXI_5828 : GND
      port map (G=>scin_phys(1));
   
   XLXI_5829 : GND
      port map (G=>scin_phys(2));
   
   XLXI_5836 : TriggerBlock
      port map (en=>telescope_trigger_en,
                master_clk_delay(3 downto 0)=>rx_data(19 downto 16),
                mclk=>MASTER_CLK,
                psi_clk_delay(7 downto 0)=>rx_data(27 downto 20),
                rst=>reset,
                scin(2 downto 0)=>scin_phys_gated(2 downto 0),
                trig_fifo_empty=>trig_fifo_empty,
                trig_fifo_read(7 downto 0)=>trig_fifo_read(7 downto 0),
                trig_mask_en=>trig_mask_en,
                trig_mask_hi=>trig_mask_hi,
                veto_duration(19 downto 0)=>trig_veto_dur(19 downto 0),
                we=>MASTER_TRIGGER_MAP,
                xclk=>PSI_CLK270,
                busy=>XLXN_17722,
                trig_fifo_re=>trig_fifo_re,
                trig_fifo_ts(7 downto 0)=>trig_fifo_ts(7 downto 0),
                trig_fifo_we=>trig_fifo_we,
                trig_out=>EXT_TRIGG);
   
   XLXI_5838 : OR3
      port map (I0=>trig_throttle_gated(2),
                I1=>trig_throttle_gated(1),
                I2=>trig_throttle_gated(0),
                O=>trigger_throttle);
   
   XLXI_5839 : OR2
      port map (I0=>trigger_throttle,
                I1=>XLXN_17722,
                O=>telescope_busy);
   
   XLXI_5873 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(0),
                Q=>XLXN_17849);
   
   XLXI_5884 : AND2B1
      port map (I0=>trigger_throttle,
                I1=>XLXN_17849,
                O=>telescope_trigger_en);
   
   XLXI_5891 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(8),
                Q=>XLXN_17913);
   
   XLXI_5892 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(9),
                Q=>XLXN_17914);
   
   XLXI_5893 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(10),
                Q=>XLXN_17915);
   
   XLXI_5894 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(4),
                Q=>XLXN_17999);
   
   XLXI_5895 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(5),
                Q=>XLXN_18000);
   
   XLXI_5896 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(6),
                Q=>XLXN_18001);
   
   XLXI_5900 : AND2
      port map (I0=>trig_throttle_ds,
                I1=>XLXN_17913,
                O=>trig_throttle_gated(0));
   
   XLXI_5901 : AND2
      port map (I0=>trig_throttle_ms,
                I1=>XLXN_17914,
                O=>trig_throttle_gated(1));
   
   XLXI_5902 : AND2
      port map (I0=>trig_throttle_us,
                I1=>XLXN_17915,
                O=>trig_throttle_gated(2));
   
   XLXI_5976 : AND2
      port map (I0=>inv_psi_reset,
                I1=>psi_token_reset_n(0),
                O=>XLXN_18123);
   
   XLXI_5978 : OR2
      port map (I0=>token_throttle(1),
                I1=>token_throttle(0),
                O=>trig_throttle_ms);
   
   XLXI_5983 : trigger_fifo_8
      port map (clk=>PSI_CLK270,
                din(7 downto 0)=>trig_fifo_ts(7 downto 0),
                rd_en=>trig_fifo_re,
                rst=>XLXN_18128,
                wr_en=>trig_fifo_we,
                dout(7 downto 0)=>trig_fifo_read(7 downto 0),
                empty=>trig_fifo_empty,
                full=>open);
   
   XLXI_5984 : OR2
      port map (I0=>scin_phys(0),
                I1=>XLXN_17999,
                O=>scin_phys_gated(0));
   
   XLXI_5985 : OR2
      port map (I0=>scin_phys(1),
                I1=>XLXN_18000,
                O=>scin_phys_gated(1));
   
   XLXI_5986 : OR2
      port map (I0=>scin_phys(2),
                I1=>XLXN_18001,
                O=>scin_phys_gated(2));
   
   XLXI_5987 : FDE
      port map (C=>MASTER_CLK,
                CE=>TOKEN_STACK_MAP,
                D=>rx_data(0),
                Q=>bypass_token_stack);
   
   XLXI_5988 : OR2
      port map (I0=>trigger_throttle,
                I1=>reset,
                O=>XLXN_18128);
   
   XLXI_5989 : OR2
      port map (I0=>reset,
                I1=>XLXN_17199,
                O=>psi_reset);
   
   XLXI_5996 : OR2
      port map (I0=>reset,
                I1=>XLXN_17239,
                O=>readout_reset);
   
   XLXI_6008 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(32),
                Q=>trig_mask_en);
   
   XLXI_6009 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(36),
                Q=>trig_mask_hi);
   
   XLXI_6014 : fd_64
      port map (C=>MASTER_CLK,
                CE=>GEC_DEST_MACPORT_MAP,
                D(63 downto 0)=>rx_data(63 downto 0),
                R=>reset,
                Q(63 downto 0)=>gec_macport(63 downto 0));
   
   XLXI_6015 : FD8RE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>GEC_DEST_ADDRS_MAP,
                D(7 downto 0)=>rx_data(7 downto 0),
                R=>reset,
                Q(7 downto 0)=>gec_addrs(7 downto 0));
   
   XLXI_6016 : FD16RE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>MASTER_VETO_MAP,
                D(15 downto 0)=>rx_data(15 downto 0),
                R=>reset,
                Q(15 downto 0)=>trig_veto_dur(15 downto 0));
   
   XLXI_6018 : FD16RE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>MASTER_VETO_MAP,
                D(15 downto 0)=>rx_data(31 downto 16),
                R=>reset,
                Q(15 downto 0)=>trig_veto_dur(31 downto 16));
   
   XLXI_6019 : psi_cmd_fifo32_512depth
      port map (din(31 downto 0)=>rx_data(31 downto 0),
                rd_clk=>PSI_CLK0,
                rd_en=>psi_cmd_fifo_re,
                rst=>psi_reset,
                wr_clk=>MASTER_CLK,
                wr_en=>PSI_CMD_FIFO_MAP,
                dout(31 downto 0)=>XLXN_16082(31 downto 0),
                empty=>psi_cmd_fifo_empty,
                full=>psi_cmd_fifo_full);
   
   XLXI_6021 : BUF
      port map (I=>trigger_busy,
                O=>psi_status(17));
   
   XLXI_6025 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(40),
                Q=>trigger_output_mux_sel0);
   
   XLXI_6026 : M4_1E_HXILINX_TOP_LEVEL
      port map (D0=>telescope_busy,
                D1=>EXT_TRIGG,
                D2=>psi_trigger,
                D3=>PSI_CLK270,
                E=>XLXN_18181,
                S0=>trigger_output_mux_sel0,
                S1=>trigger_output_mux_sel1,
                O=>trigger_board_output);
   
   XLXI_6032 : FDE
      port map (C=>MASTER_CLK,
                CE=>MASTER_TRIGGER_MAP,
                D=>rx_data(41),
                Q=>trigger_output_mux_sel1);
   
   XLXI_6033 : VCC
      port map (P=>XLXN_18181);
   
   XLXI_6040 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>BUSC_07DP_14S,
                IB=>BUSC_07DN_15S,
                O=>psi_dig_data(0));
   
   XLXI_6042 : calibration_controller
      port map (cal_en=>cal_tag_trig_num_sel,
                mclk=>MASTER_CLK,
                next_cal_trigger=>EN_TRIG_TOK_MAP,
                psi_cmd_fifo_empty=>psi_cmd_fifo_empty,
                reset=>trig_reset,
                trigger_busy=>trigger_busy,
                cal_ctrl_psi_cmd_fifo_empty=>cal_ctrl_psi_cmd_fifo_empty,
                cal_ctrl_sw_en_pulse=>cal_ctrl_sw_en_pulse,
                error=>psi_errors(16));
   
   XLXI_6067 : M2_1_HXILINX_TOP_LEVEL
      port map (D0=>internal_4x_clk,
                D1=>internal_4x180_clk,
                S0=>psi_dig_ctrl(0),
                O=>XLXN_18355);
   
   XLXI_6071 : VCC
      port map (P=>psi_delay_high);
   
   XLXI_6072 : BUFG
      port map (I=>XLXN_18355,
                O=>psi_dig_sdata_clk(0));
   
   XLXI_6084 : FD8CE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_DIG_MAP,
                CLR=>XLXN_18365,
                D(7 downto 0)=>rx_data(7 downto 0),
                Q(7 downto 0)=>psi_dig_ctrl(7 downto 0));
   
   XLXI_6085 : GND
      port map (G=>XLXN_18365);
   
   XLXI_6086 : M2_1_HXILINX_TOP_LEVEL
      port map (D0=>internal_4x_clk,
                D1=>internal_4x180_clk,
                S0=>psi_dig_ctrl(1),
                O=>XLXN_18372);
   
   XLXI_6087 : BUFG
      port map (I=>XLXN_18372,
                O=>psi_dig_sdata_clk(1));
   
   XLXI_6091 : VCC
      port map (P=>XLXN_18379);
   
   XLXI_6173 : VCC
      port map (P=>vcc_sig);
   
   XLXI_6192 : BUFG
      port map (I=>XLXN_18597,
                O=>psi_dig_sdata_clk(2));
   
   XLXI_6193 : M2_1_HXILINX_TOP_LEVEL
      port map (D0=>internal_4x_clk,
                D1=>internal_4x180_clk,
                S0=>third_dut_ctrl(4),
                O=>XLXN_18597);
   
   XLXI_6206 : FDE
      port map (C=>MASTER_CLK,
                CE=>PSI_DIG_MAP,
                D=>rx_data(16),
                Q=>reset_dig4x_dcm);
   
   XLXI_6207 : FD8CE_HXILINX_TOP_LEVEL
      port map (C=>MASTER_CLK,
                CE=>PSI_DIG_MAP,
                CLR=>XLXN_18639,
                D(7 downto 0)=>rx_data(15 downto 8),
                Q(7 downto 0)=>third_dut_ctrl(7 downto 0));
   
   XLXI_6208 : GND
      port map (G=>XLXN_18639);
   
   XLXI_6216 : AND2
      port map (I0=>third_dut_ctrl(2),
                I1=>psi_b_data_we_pre_and(2),
                O=>psi_b_data_we(2));
   
   XLXI_6217 : AND2
      port map (I0=>third_dut_ctrl(0),
                I1=>psi_dig_reset_req(2),
                O=>XLXN_18694);
   
   XLXI_6218 : OR2
      port map (I0=>third_dut_ctrl(1),
                I1=>psi_dig_sm_ready(2),
                O=>XLXN_18695);
   
   XLXI_6220 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18695,
                Q=>sm_ready(2));
   
   XLXI_6221 : FDE
      port map (C=>MASTER_CLK,
                CE=>vcc_sig,
                D=>XLXN_18694,
                Q=>error_reset_req(2));
   
   XLXI_6227 : OR3
      port map (I0=>psi_b_data_we(2),
                I1=>psi_b_data_we(1),
                I2=>psi_b_data_we(0),
                O=>psi_burst_we);
   
   XLXI_6234 : GND
      port map (G=>gec_user_addrs(1));
   
   XLXI_6236 : VCC
      port map (P=>gec_user_addrs(3));
   
   XLXI_6237 : GND
      port map (G=>gec_user_addrs(2));
   
   XLXI_6238 : VCC
      port map (P=>gec_user_addrs(0));
   
   XLXI_6239 : GND
      port map (G=>gec_user_addrs(4));
   
   XLXI_6240 : GND
      port map (G=>gec_user_addrs(5));
   
   XLXI_6241 : GND
      port map (G=>gec_user_addrs(6));
   
   XLXI_6242 : GND
      port map (G=>gec_user_addrs(7));
   
   XLXI_6250 : IBUF
      port map (I=>BUSDHS_03DP_06S,
                O=>scin_phys(0));
   
   XLXI_6251 : IBUF
      port map (I=>BUSDHS_02DP_04S,
                O=>EXT_CLK);
   
   XLXI_6284 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>PSI_1_TOKOUT_P,
                IB=>PSI_1_TOKOUT_N,
                O=>psi_token_out(1));
   
   XLXI_6285 : OBUFDS
      port map (I=>PSI_CLK90,
                O=>PSI_1_CLK_P,
                OB=>PSI_1_CLK_N);
   
   XLXI_6286 : OBUFDS
      port map (I=>psi_data_out(1),
                O=>PSI_1_CTRL_P,
                OB=>PSI_1_CTRL_N);
   
   XLXI_6287 : OBUFDS
      port map (I=>psi_token_in(1),
                O=>PSI_1_TOKIN_P,
                OB=>PSI_1_TOKIN_N);
   
   XLXI_6288 : OBUF
      port map (I=>XLXN_18733,
                O=>PSI_1_RST);
   
   XLXI_6289 : OBUFDS
      port map (I=>psi_trigger,
                O=>PSI_1_TRIG_P,
                OB=>PSI_1_TRIG_N);
   
   XLXI_6290 : AND2
      port map (I0=>inv_psi_reset,
                I1=>psi_token_reset_n(1),
                O=>XLXN_18733);
   
   XLXI_6291 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>PSI_1_DATA_P,
                IB=>PSI_1_DATA_N,
                O=>psi_dig_data(1));
   
   XLXI_6292 : MMCME2_BASE
   -- synopsys translate_off
   generic map( CLKOUT0_DIVIDE_F => 28.0,
            CLKFBOUT_MULT_F => 6.0)
   -- synopsys translate_on
      port map (CLKFBIN=>ADC_DCM_FB,
                CLKIN1=>MASTER_CLK,
                PWRDWN=>XLXN_18744,
                RST=>dcm_reset,
                CLKFBOUT=>ADC_DCM_FB,
                CLKFBOUTB=>open,
                CLKOUT0=>internal_acc_clk,
                CLKOUT0B=>open,
                CLKOUT1=>open,
                CLKOUT1B=>open,
                CLKOUT2=>open,
                CLKOUT2B=>open,
                CLKOUT3=>open,
                CLKOUT3B=>open,
                CLKOUT4=>open,
                CLKOUT5=>open,
                CLKOUT6=>open,
                LOCKED=>psi_status(4));
   
   XLXI_6293 : GND
      port map (G=>XLXN_18744);
   
   XLXI_6315 : reset_mgr
      port map (reset_start=>reset_start,
                slow_clk=>clock_5mhz,
                reset=>reset);
   
   XLXI_6318 : GND
      port map (G=>XLXN_18808);
   
   XLXI_6319 : AND2
      port map (I0=>reset,
                I1=>reset_button,
                O=>reset_phy);
   
   XLXI_6321 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>PSI_2_TOKOUT_P,
                IB=>PSI_2_TOKOUT_N,
                O=>psi_token_out(2));
   
   XLXI_6322 : OBUFDS
      port map (I=>PSI_CLK90,
                O=>PSI_2_CLK_P,
                OB=>PSI_2_CLK_N);
   
   XLXI_6323 : OBUFDS
      port map (I=>psi_data_out(2),
                O=>PSI_2_CTRL_P,
                OB=>PSI_2_CTRL_N);
   
   XLXI_6324 : OBUFDS
      port map (I=>psi_token_in(2),
                O=>PSI_2_TOKIN_P,
                OB=>PSI_2_TOKIN_N);
   
   XLXI_6325 : OBUF
      port map (I=>XLXN_18828,
                O=>PSI_2_RST);
   
   XLXI_6326 : OBUFDS
      port map (I=>psi_trigger,
                O=>PSI_2_TRIG_P,
                OB=>PSI_2_TRIG_N);
   
   XLXI_6327 : AND2
      port map (I0=>inv_psi_reset,
                I1=>psi_token_reset_n(2),
                O=>XLXN_18828);
   
   XLXI_6328 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>PSI_2_DATA_P,
                IB=>PSI_2_DATA_N,
                O=>psi_dig_data(2));
   
   XLXI_6330 : clk_wiz_0_mod
      port map (CLK_IN1=>XLXN_15849,
                RESET=>dcm_reset_psi,
                LOCKED=>psi_status(0),
                PSI_CLK0=>PSI_CLK0,
                PSI_CLK4x0=>internal_4x_clk,
                PSI_CLK4x180=>internal_4x180_clk,
                PSI_CLK90=>PSI_CLK90,
                PSI_CLK270=>PSI_CLK270);
   
   XLXI_6334 : ethernet_interfaceNEW
      port map (b_data(63 downto 0)=>b_data(63 downto 0),
                b_data_we=>b_data_we,
                MASTER_CLK=>MASTER_CLK,
                PHY_RXD(7 downto 0)=>GMII_RXD_0_sig(7 downto 0),
                PHY_RX_DV=>GMII_RX_DV_0_sig,
                PHY_RX_ER=>XLXN_18829,
                reset_in=>reset,
                tx_data(63 downto 0)=>tx_data(63 downto 0),
                b_enable=>open,
                PHY_TXD(7 downto 0)=>PHY_TXD_sig(7 downto 0),
                PHY_TX_EN=>PHY_TXEN_sig,
                PHY_TX_ER=>PHY_TXER_sig,
                reset_out=>open,
                rx_addr(31 downto 0)=>rx_addr(31 downto 0),
                rx_data(63 downto 0)=>rx_data(63 downto 0),
                rx_wren=>rx_wren,
                TX_CLK=>GTX_CLK_0_sig);
   
   XLXI_6335 : GND
      port map (G=>XLXN_18829);
   
   XLXI_6336 : GND
      port map (G=>software_reset);
   
end BEHAVIORAL;


