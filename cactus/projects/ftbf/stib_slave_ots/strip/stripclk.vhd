--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    stripclk - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Generates clock signals used by strip sensor hybrids
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

entity stripclk is
  port (
    clk_x : in std_logic;            -- Internally generated 15 ns clock
    clk_y : in std_logic;            -- Internally generated 5 MHz clock
    clk_ext : in std_logic;          -- external 27 mhz clock
    clksel : in std_logic;           -- set to select external clock source
    mclk_a : out std_logic;          -- drives the fssr2 core
    mclk_b : out std_logic;          -- drives the fssr2 core
    outclk : out std_logic;          -- reads out the iserdes.  outclk = mclk/4 = 16.667 mhz
    bcoclk : out std_logic;          -- synthesized bco clock
    dacclk : out std_logic;          -- 200 mhz, derived from clk_x
    reset : in std_logic;            -- resets all dcm components
    locked : out std_logic_vector(1 downto 0);   -- bit 1 = mclk locked, bit 0 = bcoclk locked
    arm_bco_reset : in std_logic;
    bco_reset_armed : out std_logic;
    bco_reset_busy : out std_logic;
    bco_reset : in std_logic;        -- reset bco counter when armed
    bco_reset_now : in std_logic;        -- reset bco counter
    bco : out std_logic_vector(47 downto 0);   -- bco counter
    fracbcoclk : out std_logic;      -- bcoclk*4
    fracbco : out std_logic_vector(2 downto 0);  -- fractional bco number
    bcoclk_data_in : in std_logic_vector(15 downto 0);   -- dcm reconfiguration data in
    bcoclk_data_out : out std_logic_vector(15 downto 0);   -- dcm reconfiguration data out
    bcoclk_addr : in std_logic_vector(6 downto 0);         -- dcm reconfiguration address
    bcoclk_we : in std_logic;                -- dcm reconfiguration write enable
    bcoclk_en : in std_logic;                -- dcm reconfiguration enable
    busclk : in std_logic;                   -- dcm reconfiguration clock
    bcoclk_busy : out std_logic;             -- dcm reconfiguration status
    debug : out std_logic_vector(7 downto 0)
  );
end stripclk;

architecture Behavioral of stripclk is

  signal dcm_mclk_a : std_logic;
  signal dcm_mclk_b : std_logic;
  signal dcm_mclk_c : std_logic;
  signal dcm_mclk_d : std_logic;
  signal dcm_mclk2 : std_logic;
  signal dcm_mclk2_n : std_logic;
  signal dcm_mclk_div : std_logic;
  signal dcm_mclk_fx : std_logic;
  signal dcm_mclk_fx_n : std_logic;
  signal dcm_mclk_fb : std_logic;
  signal dcm_mclk_locked : std_logic;
  signal clk_fx : std_logic;
  signal idelayctrl_ready : std_logic;
  signal idelayctrl_reset : std_logic;
  signal bcoclk_data : std_logic_vector(15 downto 0);

  signal dcm_fbco_fb : std_logic;
  signal dcm_fbco_a : std_logic;
  signal dcm_fbco_fx : std_logic;
  signal dcm_fbco_locked : std_logic;
  signal bcocounter_clock : std_logic;

  signal clk_q : std_logic;
  signal clk_z : std_logic;
  signal dcm_bco_a : std_logic;
  signal dcm_bco_div : std_logic;
  signal dcm_bco : std_logic;
  signal dcm_fbco : std_logic;
  signal dcm_busy : std_logic;
  signal bcoclk_data_ready : std_logic;

  signal bcoclk_reset : std_logic;
  signal bcoclk_release : std_logic := '1';

  signal fbco_reset_sr : std_logic_vector(47 downto 0);
  signal bco_reset_done : std_logic := '0';
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
  
  component fastbcocounter
    port (
      clk : in std_logic;
      ce : in std_logic;
      sclr : in std_logic;
      q : out std_logic_vector(2 downto 0)
    );
  end component;
  
  signal fcbo_watchdog_reset : std_logic := '0';

begin

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
    clk90 => dcm_mclk_b,
    clk2x => open,
    clk2x180 => open,
    clkdv => dcm_mclk_div,       -- 16.667 mhz 
    clkfx => dcm_mclk_fx,         -- 200 mhz
    clkfx180 => open,
    locked => dcm_mclk_locked,
    clkfb => dcm_mclk_fb,
    clkin => clk_x,             -- 66.667 mhz
    rst => reset
  );

  mclka_bufg : bufg
  port map (
    o => dcm_mclk_fb,           -- MCLK_A global clock and DCM feedback
    i => dcm_mclk_a 
  );

  mclkb_bufg : bufg
  port map (
    o => mclk_b,                -- MCLK_B global clock
    i => dcm_mclk_b 
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

  outclk_bufg : bufg
  port map (
    o => outclk,                -- ISERDES output clock
    i => dcm_mclk_div
  );

  mclk_a <= dcm_mclk_fb;
  dacclk <= clk_fx;
  idelayctrl_reset <= not dcm_mclk_locked;

--
--  The bufgmux should not be used because you won't be able to switch
--  between clock sources if either one is not active.
--  Instead, we need an asynchronous mux.
--
--  bcoclkmux : bufgmux
--  port map (
--    i0 => clk_x,
--    i1 => clk_ext,
--    o => clk_z,
--    s => clksel
--  );

  bcoclkmux : bufgctrl
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

	fboWatchdog : for i in 0 to 0 generate
	
		signal fcbo_watchdog_reset_sig : std_logic := '0';
		
		signal fcbo_watchdog_low_timer : unsigned(7 downto 0) := (others => '1');
		signal fcbo_watchdog_reset_timer : unsigned(7 downto 0) := (others => '1');
		
	begin
	
		fcbo_watchdog_reset <= reset or fcbo_watchdog_reset_sig;
				
		process(clk_Z)
		begin
			if (rising_edge(clk_z)) then
				
				fcbo_watchdog_reset_sig <= '0';
			
				if ( dcm_fbco_locked = '1' ) then
					fcbo_watchdog_low_timer <= (others => '1');
					fcbo_watchdog_reset_timer <= (others => '1');
				else -- 
					if (fcbo_watchdog_low_timer = 0) then --been unlocked for a long time, try relocking
					
						--hold reset for a while
						if (fcbo_watchdog_reset_timer = 0) then 
							--unreset and start low timer again, hope re-locks!?
							fcbo_watchdog_low_timer <= (others => '1');
							fcbo_watchdog_reset_timer <= (others => '1');
						else
							fcbo_watchdog_reset_sig <= '1';
							fcbo_watchdog_reset_timer <= fcbo_watchdog_reset_timer - 1;
						end if;
						
					else --wait to see if unlocked for a long time
						fcbo_watchdog_low_timer <= fcbo_watchdog_low_timer - 1;
					end if;
					
					
				
				end if;				
			
			end if;
		end process;
	end generate;
	
  fbcoclk_dcm : dcm_adv
  generic map (
    clkin_period => 15.0,
    clkfx_divide => 4,
    clkfx_multiply => 3,
    clkdv_divide => 4.0,
    clkin_divide_by_2 => false
  )
  port map (
    clkin => clk_z,
    clkfb => dcm_fbco_a,   -- Direct feedback since this edge is not used
    rst => fcbo_watchdog_reset, --RAR reset,
    psincdec => '0',
    psclk => '0',
    psen => '0',
    do => bcoclk_data,
    di => bcoclk_data_in,
    drdy => bcoclk_data_ready,
    daddr => bcoclk_addr,
    dwe => bcoclk_we,
    den => bcoclk_en,
    dclk => busclk,
    clk0 => dcm_fbco_a,
    clk90 => open,
    clk180 => open,
    clk270 => open,
    clk2x => open,
    clk2x180 => open,
    clkdv => open,
    clkfx => dcm_fbco_fx,
    clkfx180 => open,
    locked => dcm_fbco_locked
  );

--  Technically, we should insert a bufg between dcm_fbco_fx and any
--  other logic.  This is to ensure that the timing of the BCO reset signal
--  is predictable.

  bcoclk_mux : bufg    -- Well, it was a mux at one time...
  port map (
    i => dcm_fbco_fx,
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
    clka1 => dcm_bco_a,
    clka1d2 => open,
    clka1d4 => dcm_bco_div,
    clka1d8 => open,
    clkb1 => open,
    clkc1 => open,
    clkd1 => open
  );


  bcoclkfb_bufg : bufg
  port map (
    o => dcm_fbco,             -- Fractional BCO clock
    i => dcm_bco_a
  );
  bcoclk_bufg : bufg
  port map (
    o => dcm_bco,                -- BCO clock
    i => dcm_bco_div
  );

  bcoclk <= dcm_bco;
  fracbcoclk <= dcm_fbco;

  bcoclkmux_imp : bufgctrl
  port map (
    o => bcocounter_clock,
    i0 => dcm_bco,
    i1 => clk_z,
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
    ce => '1',
    sclr => bco_clear,
    q => bco
  );

  fastbcocounter_imp : fastbcocounter
  port map (
    clk => dcm_fbco,
    ce => '1',
    sclr => bco_clear,
    q => fracbco
  );

  process ( busclk, bcoclk_en, bcoclk_data_ready ) begin
    if ( busclk'event and busclk = '1' ) then
      if ( bcoclk_data_ready = '1' ) then
        dcm_busy <= '0';
        bcoclk_data_out <= bcoclk_data;
      elsif ( bcoclk_en = '1' ) then
        dcm_busy <= '1';
      end if;
    end if;
  end process;

  locked(1) <= dcm_fbco_locked and bcoclk_release;
  locked(0) <= dcm_mclk_locked;

  process ( clk_q, bco_reset, bco_reset_now ) begin
    if ( clk_q'event and clk_q = '1' ) then
      fbco_reset_sr <= fbco_reset_sr(fbco_reset_sr'length-2 downto 0) & dcm_fbco_locked;
      if ( reset = '1' ) then
        fbco_reset_sr <= ( others => '0' );
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
              fbco_reset_sr <= ( others => '0' );
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
            if ( fbco_reset_sr(fbco_reset_sr'length-1) = '1' and arm_bco_reset = '0' ) then
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
      bcoclk_release <= fbco_reset_sr(fbco_reset_sr'length-1);
    end if;
  end process;

  bco_reset_busy <= not fbco_reset_sr(fbco_reset_sr'length-1);
  bco_clear <= not fbco_reset_sr(fbco_reset_sr'length/2);
  bcoclk_reset <= reset or ( fbco_reset_sr(fbco_reset_sr'length/2) and
                             not fbco_reset_sr(3*fbco_reset_sr'length/4) );
  bco_reset_armed <= '1' when state = Armed else '0';

  debug <= arm_bco_reset & bco_reset & bco_reset_now & bco_clear &
           dcm_bco & bcoclk_reset & bcoclk_release & bcocounter_clock;

--  debug(7 downto 1) <= clk_z & fbco_reset_sr(fbco_reset_sr'length/4) &
--                       bco_clear & bcoclk_release &
--                       bcoclk_reset & dcm_bco & bco_reset;
--  debug(0) <= '1' when state = Armed else '0';
  
end Behavioral;
