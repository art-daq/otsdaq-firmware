--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    04:44:19 07/30/2014 
-- Design Name:    stib
-- Module Name:    vipicclk - RTL
-- Project Name:   STIB firmware for VIPIC readout
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Generates clock signals used by VIPIC chip
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.VComponents.all;

entity vipicclk is
  port (
    clk_x : in std_logic;            -- Internally generated 15 ns clock
    clk_y : in std_logic;            -- Internally generated 5 MHz clock
    clk_ext : in std_logic;          -- external 27 mhz clock
    clksel : in std_logic;           -- set to select external clock source
    tsclk_period : in std_logic_vector(7 downto 0);
    rstrobe_width : in std_logic_vector(3 downto 0);
    rstrobe_count : in std_logic_vector(7 downto 0);
    hitor : in std_logic;
    sclk : out std_logic;
    serial_clk : out std_logic;      -- drives the vipic readout
    rstrobe : out std_logic;         -- advances hit pointer
    ts_clk : out std_logic;          -- timestamp clock
    sclk_enable : out std_logic;
    do_read : in std_logic;
    read_busy : out std_logic;
    do_restart : in std_logic;
    restart_busy : out std_logic;
    do_tsclk : in std_logic;
    tsclk_busy : out std_logic;
    send_tsclk : in std_logic;
    restart : out std_logic;
    do_load : in std_logic;
    load_busy : out std_logic;
    load : out std_logic;
    mrproper : in std_logic;         -- assert clean after reading out hits
    clean : out std_logic;
    reset : in std_logic;            -- resets all dcm components
    locked : out std_logic;
    arm_ts_reset : in std_logic;
    ts_reset_armed : out std_logic;
    ts_reset_busy : out std_logic;
    ts_reset : in std_logic;        -- reset ts counter when armed
    ts_reset_now : in std_logic;        -- reset ts counter
    ts : out std_logic_vector(47 downto 0);   -- ts counter
    clk_data_in : in std_logic_vector(15 downto 0);   -- dcm reconfiguration data in
    clk_data_out : out std_logic_vector(15 downto 0);   -- dcm reconfiguration data out
    clk_addr : in std_logic_vector(6 downto 0);         -- dcm reconfiguration address
    clk_we : in std_logic;                -- dcm reconfiguration write enable
    clk_en : in std_logic;                -- dcm reconfiguration enable
    busclk : in std_logic;                -- dcm reconfiguration clock
    clk_busy : out std_logic;             -- dcm reconfiguration status
    debug_select : in std_logic;
    debug : out std_logic_vector(7 downto 0)
  );
end vipicclk;

architecture Behavioral of vipicclk is

  signal clk_z : std_logic;

  signal clk_fx : std_logic;
  signal clk_data : std_logic_vector(15 downto 0);

  signal dcm_sclk_fb : std_logic;
  signal dcm_sclk_a : std_logic;
  signal dcm_sclk_a_fb : std_logic;
  signal pmcd_sclk_a : std_logic;
  signal dcm_sclk_fx : std_logic;
  signal dcm_sclk_fx_b : std_logic;
  signal dcm_serial_clk : std_logic;

  signal dcm_tsclk_a : std_logic;
  signal dcm_tsclk_fx : std_logic;
  signal dcm_tsclk_div : std_logic;
  signal dcm_tsclk_mult : std_logic;
  signal dcm_busy : std_logic;
  signal clk_data_ready : std_logic;

  signal dcm_mclk_fx : std_logic;
  signal dcm_mclk_fb : std_logic;
  signal dcm_mclk_locked : std_logic;
  signal dcm_sclk_locked : std_logic;
  signal idelayctrl_ready : std_logic;
  signal idelayctrl_reset : std_logic;

  signal tsclk_reset : std_logic;
  signal tsclk_enable : std_logic;
  signal tsclk_release : std_logic := '1';
  signal dcm_tsclk_locked : std_logic;

  signal dcm_sclk : std_logic;
  signal dcm_rclk : std_logic;
  signal bco_clk : std_logic;
  signal tscounter_clock : std_logic;
  signal rstrobe_pulse : std_logic;
  signal restart_pulse : std_logic := '0';
  signal clean_pulse : std_logic;
  signal readout_clk : std_logic;
  signal last_rclk : std_logic;
  signal vipic_load : std_logic := '0';
  signal loading : std_logic := '0';

  signal not_clksel : std_logic;

  signal tsclk_count : unsigned(7 downto 0) := ( others => '0' );
  signal ts_reset_sr : std_logic_vector(47 downto 0);
  signal sclk_reset_done : std_logic := '0';
  signal ts_clear : std_logic;
  signal not_ts_clear : std_logic;
  type state_t is ( Idle, Armed, Resetting, Procrastinating, Done );
  signal state : state_t := Idle;

  type vipic_state_t is ( VipicIdle, VipicRead, VipicStrobe );
  signal vipic_state : vipic_state_t := VipicIdle;

  type tsclk_state_t is ( TsclkIdle, WaitForTsclk, SentTsclk, TsclkDone );
  signal tsclk_state : tsclk_state_t := TsclkIdle;

  signal rstr_enable : std_logic;
  signal gated_sclk : std_logic;
  signal rstr_count : unsigned(4 downto 0) := "00000";
  signal nrstr_count : unsigned(7 downto 0) := ( others => '0' );
  signal bcoclk_enable : std_logic;
  signal tsclk : std_logic;
  signal prev_tsclk : std_logic;
  signal running : std_logic := '0';
  signal restarting : std_logic := '0';
  signal restarted : std_logic := '0';
 
  signal vipic_idle : std_logic;
  signal sent_tsclk : std_logic;

  signal reading : std_logic;
  signal tsclk_sent : std_logic;

  component bcocounter
    port (
      clk : in std_logic;
      ce : in std_logic;
      sclr : in std_logic;
      q : out std_logic_vector(47 downto 0)
    );
  end component;
  
begin

  clkmux : bufgctrl
  port map (
    i0 => clk_x,
    i1 => clk_ext,
    o => clk_z,
    s0 => not_clksel,
    s1 => clksel,
    ce1 => '1',
    ce0 => '1',
    ignore1 => '1',
    ignore0 => '1'
  );

  not_clksel <= not clksel;


--
--  This just generates the 200 MHz clock needed for
--  control of the idelay components
--
  mclk_dcm : dcm_base
  generic map (
    clkfx_divide => 2,
    clkfx_multiply => 6,
    clkdv_divide => 4.0,
    clkin_divide_by_2 => false,
    clkin_period => 15.0   -- 15 ns when driven from busclk
  )
  port map (
    clk0 => dcm_mclk_fb,
    clk180 => open,
    clk270 => open,
    clk90 => open,
    clk2x => open,
    clk2x180 => open,
    clkdv => open,
    clkfx => dcm_mclk_fx,         -- 200 mhz
    clkfx180 => open,
    locked => dcm_mclk_locked,
    clkfb => dcm_mclk_fb,
    clkin => clk_x,             -- 66.667 mhz
    rst => reset
  );

  fclk_bufg : bufg
  port map (
    o => clk_fx,                --  drives the dac
    i => dcm_mclk_fx
  );

  idelayctrl_imp : idelayctrl
  port map (
    rdy => idelayctrl_ready,
    refclk => clk_fx,
    rst => idelayctrl_reset
  );

  sclk_dcm : dcm_base
  generic map (
    clkfx_divide => 2,
    clkfx_multiply => 3,   -- Works when this is 2, set to 3 for 100 MHz, 4 for 133.33 MHz
    clkdv_divide => 4.0,
    clkin_divide_by_2 => false,
    clkin_period => 15.0   -- 15 ns when driven from busclk
  )
  port map (
    clk0 => dcm_sclk_fb,
    clk180 => open,
    clk270 => open,
    clk90 => open,
    clk2x => open,
    clk2x180 => open,
    clkdv => open,
    clkfx => dcm_sclk_fx,
    clkfx180 => open,
    locked => dcm_sclk_locked,
    clkfb => dcm_sclk_fb,
    clkin => clk_x,             -- 66.667 mhz
    rst => reset
  );

  sclk_bufg : bufg
  port map (
    o => dcm_sclk,
    i => dcm_sclk_fx
  );

  tsclk_dcm : dcm_adv
  generic map (
    clkin_period => 15.0,
    clkfx_divide => 2,
    clkfx_multiply => 2,
    clkdv_divide => 4.0,
    clkin_divide_by_2 => false,
    dcm_performance_mode => "MAX_RANGE")
  port map (
    clkin => clk_z,
    clkfb => dcm_tsclk_a,
    rst => reset,
    psincdec => '0',
    psclk => '0',
    psen => '0',
    do => clk_data,
    di => clk_data_in,
    drdy => clk_data_ready,
    daddr => clk_addr,
    dwe => clk_we,
    den => clk_en,
    dclk => busclk,
    clk0 => dcm_tsclk_a,
    clk90 => open,
    clk180 => open,
    clk270 => open,
    clk2x => open,
    clk2x180 => open,
    clkdv => open,
    clkfx => dcm_tsclk_fx,
    clkfx180 => open,
    locked => dcm_tsclk_locked
  );

  tsclk_pmcd : pmcd
  generic map (
    rst_deassert_clk => "CLKA",
    en_rel => true
  )
  port map (
    clka => dcm_tsclk_fx,
    clkb => '0',
    clkc => '0',
    clkd => '0',
    rst => tsclk_reset,
    rel => tsclk_release,
    clka1 => dcm_tsclk_mult,
    clka1d2 => open,
    clka1d4 => dcm_tsclk_div,
    clka1d8 => open,
    clkb1 => open,
    clkc1 => open,
    clkd1 => open
  );

  process ( dcm_sclk ) begin
    if ( dcm_sclk'event and dcm_sclk = '1' ) then
      if ( tsclk_reset = '1' ) then
        vipic_state <= VipicIdle;
        rstr_count <= ( 4 => '1', others => '0' );   -- Don't read out, just send rstrobe/clean/restart
        nrstr_count <= ( others => '0' );
        rstrobe_pulse <= '0';
        clean_pulse <= '0';
        restart_pulse <= '0';
      else
        case vipic_state is
          when VipicIdle =>
            if ( restarting = '0' ) then
              if ( do_restart = '1' ) then
                restarting <= '1';
                restarted <= '0';
              end if;
            end if;
            if ( restarted = '1' ) then
              if ( do_restart = '0' ) then
                restarting <= '0';
                restarted <= '0';
              end if;
            end if;
            if ( tsclk_sent = '1' ) then
              if ( rstrobe_count = "00000000" ) then
                rstr_count <= ( 4 => '1', others => '0' );   -- Don't read out, just send rstrobe/clean/restart
                nrstr_count <= ( others => '0' );
              else
                rstr_count <= ( others => '0' );
                nrstr_count <= ( 0 => '1', others => '0' );
              end if;
              reading <= '1';
              vipic_state <= VipicRead;
            else
              reading <= '0';
            end if;
          when VipicRead =>
            if ( rstr_count(4) = '1' ) then
              vipic_state <= VipicStrobe;
              if ( std_logic_vector(nrstr_count) = rstrobe_count ) then
                if ( restarting = '1' and restarted = '0' ) then
                  restart_pulse <= '1';
                  restarted <= '1';
                  if ( mrproper = '1' ) then
                    clean_pulse <= '1';   -- Also send clean simultaneously when requested.
                  end if;
                elsif ( mrproper = '1' ) then
                  clean_pulse <= '1';
                  rstrobe_pulse <= '1';
                else
                  rstrobe_pulse <= '1';
                end if;
              else
                rstrobe_pulse <= '1';
              end if;
            else
              rstr_count <= rstr_count + 1;
            end if;
          when VipicStrobe =>
            rstrobe_pulse <= '0';
            restart_pulse <= '0';
            clean_pulse <= '0';
            if ( std_logic_vector(rstr_count(3 downto 0)) = rstrobe_width ) then
              if ( std_logic_vector(nrstr_count) = rstrobe_count ) then
                reading <= '0';
                vipic_state <= VipicIdle;
              else
                nrstr_count <= nrstr_count + 1;
                rstr_count <= ( others => '0' );
                vipic_state <= VipicRead;
              end if;
            else
              rstr_count <= rstr_count + 1;
            end if;
        end case;
        prev_tsclk <= tsclk;
      end if;
    end if;
  end process;

  process ( dcm_sclk ) begin
    if ( dcm_sclk'event and dcm_sclk = '0' ) then
      if ( rstr_count(4) = '0' ) then
        rstr_enable <= '1';
      else
        rstr_enable <= '0';
      end if;
    end if;
  end process;

  rclk_bufg : bufgce
  port map (
    i => dcm_sclk,
    o => gated_sclk,
    ce => rstr_enable
  );

  tsclk_bufg : bufgce
  port map (
    i => dcm_tsclk_div,
    o => tsclk,
    ce => tsclk_enable
  );
 
  tsclkmux_imp : bufgctrl
  port map (
    o => tscounter_clock,
    i0 => dcm_tsclk_div,
    i1 => clk_z,
    ignore0 => '1',
    ignore1 => '0',
    ce0 => '1',
    ce1 => '1',
    s0 => not_ts_clear,
    s1 => ts_clear
  );

  not_ts_clear <= not ts_clear;

  tscounter_imp : bcocounter
  port map (
    clk => tscounter_clock,
    ce => '1',
    sclr => ts_clear,
    q => ts
  );

  process ( busclk, clk_en, clk_data_ready ) begin
    if ( busclk'event and busclk = '1' ) then
      if ( clk_data_ready = '1' ) then
        dcm_busy <= '0';
        clk_data_out <= clk_data;
      elsif ( clk_en = '1' ) then
        dcm_busy <= '1';
      end if;
    end if;
  end process;

  locked <= dcm_sclk_locked and dcm_mclk_locked and dcm_tsclk_locked;

  process ( dcm_sclk, ts_reset, ts_reset_now ) begin
    if ( dcm_sclk'event and dcm_sclk = '1' ) then
      ts_reset_sr <= ts_reset_sr(ts_reset_sr'length-2 downto 0) & dcm_tsclk_locked;
      if ( reset = '1' ) then
        ts_reset_sr <= ( others => '0' );
      else
        case state is
          when Idle =>
            if ( ts_reset_now = '1' ) then
              state <= Resetting;
            elsif ( arm_ts_reset = '1' ) then
              state <= Armed;
            else
              state <= Idle;
            end if;
          when Armed =>
            if ( ts_reset = '1' or ts_reset_now = '1' ) then
              state <= Resetting;
              ts_reset_sr <= ( others => '0' );
            elsif ( arm_ts_reset = '0' ) then
              state <= Idle;
            else
              state <= Armed;
            end if;
          when Resetting =>
            state <= Procrastinating;
          when Procrastinating =>
            state <= Done;
          when Done =>
            if ( ts_reset_sr(ts_reset_sr'length-1) = '1' and arm_ts_reset = '0' ) then
              state <= Idle;
            else
              state <= Done;
            end if;
        end case;
      end if;
    end if;
  end process;

  process ( clk_z ) begin
    if ( clk_z'event and clk_z = '1' ) then
      tsclk_release <= ts_reset_sr(ts_reset_sr'length-1);
    end if;
  end process;

  process ( dcm_tsclk_div ) begin
    if ( dcm_tsclk_div'event and dcm_tsclk_div = '0' ) then
      if ( tsclk_reset = '1' ) then
        tsclk_count <= ( others => '0' );
        tsclk_sent <= '0';
        tsclk_enable <= '0';
      else
        if ( tsclk_period = "00000000" ) then

--  These lines were commented out on Nov 20, 2014 so that
--  we can issue ts_clk pulses independent of the readout cycle.
--
--          if ( tsclk_enable = '1' ) then
--            tsclk_sent <= '1';
--            tsclk_enable <= '0';
--          elsif ( reading = '1' ) then
--            tsclk_sent <= '0';
--          else
--            tsclk_sent <= '0';
--          end if;

          tsclk_enable <= '1';
          tsclk_sent <= '1';
        else
          if ( tsclk_count /= unsigned(tsclk_period) ) then
            if ( tsclk_period /= "00000000" ) then
              tsclk_count <= tsclk_count + 1;
            end if;
            if ( tsclk_enable = '1' ) then
              tsclk_sent <= '1';
            elsif ( reading = '1' ) then
              tsclk_sent <= '0';
            end if;
            tsclk_enable <= '0';
          else
            if ( reading = '0' ) then
              tsclk_enable <= '1';
              tsclk_count <= ( 0 => '1', others => '0' );
            else
              tsclk_enable <= '0';
              tsclk_sent <= '0';
            end if;
          end if;
        end if;
      end if;         
    end if;
  end process;

  restart_busy <= restarting;

  sclk_enable <= rstr_enable;
  serial_clk <= gated_sclk;
  load <= vipic_load and rstrobe_pulse;
  load_busy <= loading;
  clean <= clean_pulse;
  read_busy <= reading;

  sclk <= dcm_sclk;
  rstrobe <= rstrobe_pulse;
  restart <= restart_pulse;

  ts_reset_busy <= not ts_reset_sr(ts_reset_sr'length-1);
  ts_clear <= not ts_reset_sr(ts_reset_sr'length/2);
  tsclk_reset <= reset or ( ts_reset_sr(ts_reset_sr'length/2) and
                             not ts_reset_sr(3*ts_reset_sr'length/4) );
  ts_reset_armed <= '1' when state = Armed else '0';
  ts_clk <= tsclk;

  vipic_idle <= '1' when vipic_state = VipicIdle else '0';
  sent_tsclk <= '1' when tsclk_state = SentTsclk else '0';
 
  debug <= arm_ts_reset & ts_reset & ts_reset_now & ts_clear &
           bco_clk & tsclk_reset & tsclk_release & tscounter_clock when debug_select = '1' else
           hitor & clean_pulse & tsclk & rstrobe_pulse & gated_sclk & rstr_enable & dcm_tsclk_mult & dcm_sclk;
--           restart_pulse & clean_pulse & tsclk & rstrobe_pulse & gated_sclk & rstr_enable & dcm_tsclk_mult & dcm_sclk;

end Behavioral;
