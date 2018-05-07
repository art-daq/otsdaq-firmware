--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    04:44:19 07/30/2014 
-- Design Name:    stib
-- Module Name:    pixelclk - RTL
-- Project Name:   STIB firmware for PSI46 readout
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Generates clock signals used by PSI46 digital ROC
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

entity pixelclk is
  port (
    clk_x : in std_logic;            -- Internally generated 15 ns clock
    clk_y : in std_logic;            -- Internally generated 5 MHz clock
    clk_ext : in std_logic;          -- external 27 mhz clock
    clksel : in std_logic;           -- set to select external clock source
    pclk : out std_logic;
    pclk2x : out std_logic;

    reset : in std_logic;            -- resets all dcm components
    locked : out std_logic;
    arm_bco_reset : in std_logic;
    bco_reset_armed : out std_logic;
    bco_reset_busy : out std_logic;
    bco_reset : in std_logic;        -- reset ts counter when armed
    bco_reset_now : in std_logic;        -- reset ts counter
    bco : out std_logic_vector(47 downto 0);   -- ts counter

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
end pixelclk;

architecture Behavioral of pixelclk is

  signal clk_q : std_logic;
  signal clk_z : std_logic;

  signal clk_fx : std_logic;
  signal clk_data : std_logic_vector(15 downto 0);

  signal dcm_sclk_fb : std_logic;
  signal dcm_sclk_a : std_logic;
  signal pmcd_sclk_a : std_logic;
  signal sclk_a : std_logic;
  signal dcm_sclk_fx : std_logic;
  signal dcm_sclk_locked : std_logic;
  signal dcm_serial_clk : std_logic;

  signal dcm_sclk_div : std_logic;
  signal dcm_busy : std_logic;
  signal clk_data_ready : std_logic;

  signal dcm_mclk_a : std_logic;
  signal dcm_mclk_fx : std_logic;
  signal dcm_mclk_fb : std_logic;
  signal dcm_mclk_locked : std_logic;
  signal idelayctrl_ready : std_logic;
  signal idelayctrl_reset : std_logic;

  signal bcoclk_reset : std_logic;
  signal bcoclk_enable : std_logic;
  signal bcoclk_release : std_logic := '0';

  signal dcm_sclk : std_logic;
--  signal dcm_rclk : std_logic;
  signal dcm_bco_clk : std_logic;
  signal bco_clk : std_logic;
  signal bcocounter_clock : std_logic;
  signal rstrobe_pulse : std_logic;
  signal readout_clk : std_logic;
  signal debug_clock : std_logic_vector(7 downto 0);
  signal debug_reset : std_logic_vector(7 downto 0);

  signal bco_reset_sr : std_logic_vector(47 downto 0);
  signal sclk_reset_done : std_logic := '0';
  signal bco_clear : std_logic;
  type state_t is ( Idle, Armed, Resetting, Procrastinating, Done );
  signal state : state_t := Idle;

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
    s0 => not clksel,
    s1 => clksel,
    ce1 => '1',
    ce0 => '1',
    ignore1 => '1',
    ignore0 => '1'
  );

  mclk_dcm : dcm_base
  generic map (
    clkfx_divide => 2,
    clkfx_multiply => 6,
    clkdv_divide => 4.0,
    clkin_divide_by_2 => false,
    clkin_period => 15.0   -- 15 ns when driven from busclk
  )
  port map (
    clk0 => dcm_mclk_a,         -- 66.667 mhz
    clk180 => open,
    clk270 => open,
    clk90 => open,
    clk2x => open,
    clk2x180 => open,
    clkdv => open,
    clkfx => dcm_mclk_fx,         -- 200 mhz
    clkfx180 => open,
    locked => dcm_mclk_locked,
    clkfb => dcm_mclk_a,
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

  sclk_dcm : dcm_adv
  generic map (
    clkin_period => 15.0,
    clkfx_divide => 5,      -- clkfx = 40 MHz
    clkfx_multiply => 6,
    clkdv_divide => 4.0,
    clkin_divide_by_2 => false,
    dcm_performance_mode => "MAX_RANGE")
  port map (
    clkin => clk_z,
    clkfb => dcm_sclk_a,
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
    clk0 => dcm_sclk_a,
    clk90 => open,
    clk180 => open,
    clk270 => open,
    clk2x => open,
    clk2x180 => open,
    clkdv => open,
    clkfx => dcm_sclk_fx,
    clkfx180 => open,
    locked => dcm_sclk_locked
  );

  clkqclk_bufr : bufr
  port map (
    i => dcm_sclk_fx,
    ce => '1',
    clr => '0',
    o => clk_q
  );

  bcoclk_pmcd : pmcd
  generic map (
    rst_deassert_clk => "CLKA",
    en_rel => true
  )
  port map (
    clka => clk_q,
    clkb => '0',
    clkc => '0',
    clkd => '0',
    rst => bcoclk_reset,
    rel => bcoclk_release,
    clka1 => pmcd_sclk_a,
    clka1d2 => dcm_bco_clk,
    clka1d4 => open,
    clka1d8 => dcm_sclk_div,
    clkb1 => open,
    clkc1 => open,
    clkd1 => open
  );

  sclk_bufg : bufg
  port map (
    o => sclk_a,
    i => pmcd_sclk_a
  );

  bcoclk_bufg : bufg
  port map (
    o => bco_clk,
    i => dcm_bco_clk
  );

--  rclk_bufg : bufg
--  port map (
--    o => dcm_rclk,            -- Readout clock
--    i => dcm_sclk_div
--  );

  bcoclkmux_imp : bufgctrl
  port map (
    o => bcocounter_clock,
    i0 => bco_clk,
    i1 => clk_q,
    ignore0 => '1',
    ignore1 => '0',
    ce0 => '1',
    ce1 => '1',
    s0 => not bco_clear,
    s1 => bco_clear
  );

  bcocounter_imp : bcocounter
  port map (
    clk => bcocounter_clock,
    ce => bcoclk_enable,
    sclr => bco_clear,
    q => bco
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

  locked <= dcm_sclk_locked;

  process ( clk_q, bco_reset, bco_reset_now ) begin
    if ( clk_q'event and clk_q = '1' ) then
      bco_reset_sr <= bco_reset_sr(bco_reset_sr'length-2 downto 0) & dcm_sclk_locked;
      if ( reset = '1' ) then
        bco_reset_sr <= ( others => '0' );
      else
        case state is
          when Idle =>
            if ( bco_reset_now = '1' ) then
              state <= Resetting;
            elsif ( arm_bco_reset = '1' ) then
              state <= Armed;
            else
              state <= Idle;
            end if;
          when Armed =>
            if ( bco_reset = '1' or bco_reset_now = '1' ) then
              state <= Resetting;
              bco_reset_sr <= ( others => '0' );
            elsif ( arm_bco_reset = '0' ) then
              state <= Idle;
            else
              state <= Armed;
            end if;
          when Resetting =>
            state <= Procrastinating;
          when Procrastinating =>
            state <= Done;
          when Done =>
            if ( bco_reset_sr(bco_reset_sr'length-1) = '1' and arm_bco_reset = '0' ) then
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
      bcoclk_release <= bco_reset_sr(bco_reset_sr'length-1);
    end if;
  end process;

  pclk <= bco_clk;
  pclk2x <= sclk_a;

  bco_reset_busy <= not bco_reset_sr(bco_reset_sr'length-1);
  bco_clear <= not bco_reset_sr(bco_reset_sr'length/2);
  bcoclk_enable <= '1';
  bcoclk_reset <= reset or ( bco_reset_sr(bco_reset_sr'length/2) and
                             not bco_reset_sr(3*bco_reset_sr'length/4) );
  bco_reset_armed <= '1' when state = Armed else '0';

  debug_reset <= arm_bco_reset & bco_reset & bco_reset_now & bco_clear &
                 dcm_bco_clk & bcoclk_reset & bcoclk_release & bcocounter_clock;
  debug_clock <= dcm_mclk_locked & dcm_sclk_locked & clk_ext & clk_x & '0' & sclk_a & bco_clk & bcocounter_clock;
  debug <= debug_clock when debug_select = '0' else debug_reset;

end Behavioral;
