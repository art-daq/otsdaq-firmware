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
  
      ------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
  component strips_mclk_mmcm
  port
   (-- Clock in ports
    CLK15NS           : in     std_logic;
    -- Clock out ports
    MCLK_A          : out    std_logic;
    MCLK_B          : out    std_logic;
    MCLK_DIV4          : out    std_logic;
    MCLK_MULT3          : out    std_logic;
    -- Status and control signals
    reset             : in     std_logic;
    locked            : out    std_logic
   );
  end component;
  
  ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
  ATTRIBUTE SYN_BLACK_BOX OF strips_mclk_mmcm : COMPONENT IS TRUE;
  
  
  ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
  ATTRIBUTE BLACK_BOX_PAD_PIN OF strips_mclk_mmcm : COMPONENT IS "CLK15NS,MCLK_A,MCLK_B,MCLK_DIV4,MCLK_MULT3,reset,locked";
  
  -- COMP_TAG_END ------ End COMPONENT Declaration ------------
  
  ------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
  component bcoclk_pmcd
  port
   (-- Clock in ports
    clk_in           : in     std_logic;
    -- Clock out ports
    clk_out          : out    std_logic;
    -- Status and control signals
    reset             : in     std_logic;
    locked            : out    std_logic
   );
  end component;
  
  --ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
  ATTRIBUTE SYN_BLACK_BOX OF bcoclk_pmcd : COMPONENT IS TRUE;
  
  
  --ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
  ATTRIBUTE BLACK_BOX_PAD_PIN OF bcoclk_pmcd : COMPONENT IS "clk_in,clk_out,reset,locked";
  
  -- COMP_TAG_END ------ End COMPONENT Declaration ------------

begin


    -- NOTE: RAR .. I believe this mmcm already outputs clocks on BUFG's
    ------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
    strips_mclk_gen : strips_mclk_mmcm
    port map ( 
        
        -- Clock in ports
        CLK15NS => clk_x,            -- 66.667 mhz
        -- Clock out ports  
        MCLK_A => mclk_a,        -- 66.667 mhz
        MCLK_B => mclk_b,        -- 66.667 mhz phase 90
        MCLK_DIV4 => outclk,    -- 16.667 mhz, ISERDES output clock
        MCLK_MULT3 => clk_fx,   -- 200 mhz, drives the dac
        -- Status and control signals                
        reset => reset,
        locked => dcm_mclk_locked            
    );
    -- INST_TAG_END ------ End INSTANTIATION Template ------------



  dacclk <= clk_fx;
  idelayctrl_reset <= not dcm_mclk_locked;

--
--  The bufgmux should not be used because you won't be able to switch
--  between clock sources if either one is not active.
--  Instead, we need an asynchronous mux.

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


---- NOTE: RAR.. there was a DCM here with in clk_z (possibly external clock)
----  and output controllable clk_q. But removed for simplicity in transfer to picoZed

  bcoclk_mux : bufg    
  port map (
    i => clk_z,
    o => clk_q
  );
  
  
    -- NOTE: RAR.. replaced pll with divide by 4 logic (inclk = clk_q, outclk = dcm_bco_div)
    gen_div_by4_clk : for i in 0 to 0 generate
      signal cnt : unsigned(1 downto 0) := (others => '0');
      signal tmp_clk : std_logic;
    begin
        tmp_clk <= cnt(1);
        
        bcoclk_mux : bufg    
          port map (
            i => tmp_clk,
            o => dcm_bco_div
          );
        
        process(clk_q, bcoclk_reset)
        begin
          if (bcoclk_reset = '1') then
              cnt <= (others => '0');
          elsif (rising_edge(clk_q)) then        
              cnt <= cnt + 1;
          end if;      
        end process;
    end generate;
--  ------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
--  bcoclk_div_mmcm : bcoclk_pmcd
--     port map ( 
  
--     -- Clock in ports
--     clk_in => clk_q,
--    -- Clock out ports  
--     clk_out => dcm_bco_div,
--    -- Status and control signals                
--     reset => bcoclk_reset,
--     locked => open            
--   );
--  -- INST_TAG_END ------ End INSTANTIATION Template ------------

  dcm_fbco <= clk_q; -- Fractional BCO clock
  
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


    binaryCnt: for i in 0 downto 0 generate 
        signal tmpcnt : unsigned(47 downto 0) := (others => '0');
    begin
        process(bcocounter_clock)											 
        begin							
            bco <= std_logic_vector(tmpcnt);
            if (rising_edge(bcocounter_clock)) then	
                if(	bco_clear = '1' ) then
                    tmpcnt <= (others => '0');
                else
                    tmpcnt <= tmpcnt + 1;
                end if;	   
            end if;
        end process; 
    end generate;
	

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
