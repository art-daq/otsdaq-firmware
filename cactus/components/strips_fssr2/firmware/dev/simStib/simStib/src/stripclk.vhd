-- SCRIPT COMMENT OUT --------------------------------------------------------------------------------

-- SCRIPT COMMENT OUT -- IMPORTANT!! IMPORTANT!! 				
-- SCRIPT COMMENT OUT -- It's very important to note!!!   	
-- SCRIPT COMMENT OUT -- 										
-- SCRIPT COMMENT OUT -- The script that moves these files into a Firmware project will 		   
-- SCRIPT COMMENT OUT --  remove all "--- " comments.. 												
-- SCRIPT COMMENT OUT -- and will remove completely any text before "SCRIPT COMMENT OUT" 

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

--- library UNISIM;
--- use UNISIM.VComponents.all;

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
 
--- ---------------------- Begin Cut here for COMPONENT Declaration --------- COMP_TAG
---  component strips_mclk_mmcm
---  port
---   (-- Clock in ports
---    CLK15NS           : in     std_logic;
---    -- Clock out ports
---    MCLK_A          : out    std_logic;
---    MCLK_B          : out    std_logic;
---    MCLK_DIV4          : out    std_logic;
---    MCLK_MULT3          : out    std_logic;
---    -- Status and control signals
---    reset             : in     std_logic;
---    locked            : out    std_logic
---   );
---  end component;
---  
---  ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
---  ATTRIBUTE SYN_BLACK_BOX OF strips_mclk_mmcm : COMPONENT IS TRUE;
---  
---  
---  ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
---  ATTRIBUTE BLACK_BOX_PAD_PIN OF strips_mclk_mmcm : COMPONENT IS "CLK15NS,MCLK_A,MCLK_B,MCLK_DIV4,MCLK_MULT3,reset,locked";
---  
---  -- COMP_TAG_END --------- End COMPONENT Declaration ------------------
---  
---  ------------------- Begin Cut here for COMPONENT Declaration --------- COMP_TAG
---  component bcoclk_pmcd
---  port
---   (-- Clock in ports
---    clk_in           : in     std_logic;
---    -- Clock out ports
---    clk_out          : out    std_logic;
---    -- Status and control signals
---    reset             : in     std_logic;
---    locked            : out    std_logic
---   );
---  end component;
---  
---  --ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
---  ATTRIBUTE SYN_BLACK_BOX OF bcoclk_pmcd : COMPONENT IS TRUE;
---  
---  
---  --ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
---  ATTRIBUTE BLACK_BOX_PAD_PIN OF bcoclk_pmcd : COMPONENT IS "clk_in,clk_out,reset,locked";
---  
---  -- COMP_TAG_END ------ End COMPONENT Declaration ------------
  

begin

  mclk_dcm : entity inferredDCM --dcm_base							-- SCRIPT COMMENT OUT 
  generic map (														-- SCRIPT COMMENT OUT 
    clkfx_divide => 2,												-- SCRIPT COMMENT OUT 
    clkfx_multiply => 6,											-- SCRIPT COMMENT OUT 
    clkdv_divide => 4.0,											-- SCRIPT COMMENT OUT 
    clkin_divide_by_2 => false,										-- SCRIPT COMMENT OUT 
    clkin_period => 15.0   -- 15 ns when driven from busclk			-- SCRIPT COMMENT OUT 
  )																	-- SCRIPT COMMENT OUT 
  port map (														-- SCRIPT COMMENT OUT 
    clk0 => dcm_mclk_a,         -- 66.667 mhz						-- SCRIPT COMMENT OUT 
    clk180 => open,													-- SCRIPT COMMENT OUT 
    clk270 => open,													-- SCRIPT COMMENT OUT 
    clk90 => dcm_mclk_b,											-- SCRIPT COMMENT OUT 
    clk2x => open,													-- SCRIPT COMMENT OUT 
    clk2x180 => open,												-- SCRIPT COMMENT OUT 
    clkdv => dcm_mclk_div,       -- 16.667 mhz 						-- SCRIPT COMMENT OUT 
    clkfx => dcm_mclk_fx,         -- 200 mhz						-- SCRIPT COMMENT OUT 
    clkfx180 => open,												-- SCRIPT COMMENT OUT 
	psincdec => '0',												-- SCRIPT COMMENT OUT 
    psclk => '0',													-- SCRIPT COMMENT OUT 
    psen => '0',													-- SCRIPT COMMENT OUT 
    do => bcoclk_data,												-- SCRIPT COMMENT OUT 
    di => bcoclk_data_in,	  										-- SCRIPT COMMENT OUT 
    drdy => bcoclk_data_ready,										-- SCRIPT COMMENT OUT 
    daddr => bcoclk_addr,											-- SCRIPT COMMENT OUT 
    dwe => bcoclk_we,												-- SCRIPT COMMENT OUT 
    den => bcoclk_en,												-- SCRIPT COMMENT OUT 
    dclk => busclk,													-- SCRIPT COMMENT OUT 
    locked => dcm_mclk_locked,										-- SCRIPT COMMENT OUT 
    clkfb => dcm_mclk_fb,											-- SCRIPT COMMENT OUT 
    clkin => clk_x,             -- 66.667 mhz						-- SCRIPT COMMENT OUT 
    rst => reset													-- SCRIPT COMMENT OUT 
  );	  															-- SCRIPT COMMENT OUT 
  					
 -- port map (
--    clk0 => dcm_mclk_a,         -- 66.667 mhz
--    clk180 => open,
--    clk270 => open,
--    clk90 => dcm_mclk_b,
--    clk2x => open,
--    clk2x180 => open,
--    clkdv => dcm_mclk_div,       -- 16.667 mhz 
--    clkfx => dcm_mclk_fx,         -- 200 mhz
--    clkfx180 => open,
--    locked => dcm_mclk_locked,
--    clkfb => dcm_mclk_fb,
--    clkin => clk_x,             -- 66.667 mhz
--    rst => reset
--  );	   
  
  
  
  dcm_mclk_fb <= dcm_mclk_a;														 -- SCRIPT COMMENT OUT
--  mclka_bufg : bufg																 -- SCRIPT COMMENT OUT
--  port map (																		 -- SCRIPT COMMENT OUT
--    o => dcm_mclk_fb,           -- MCLK_A global clock and DCM feedback			 -- SCRIPT COMMENT OUT
--    i => dcm_mclk_a 																 -- SCRIPT COMMENT OUT
--  );
																					 -- SCRIPT COMMENT OUT
	mclk_b <= dcm_mclk_b;															 -- SCRIPT COMMENT OUT
--  mclkb_bufg : bufg																 -- SCRIPT COMMENT OUT
--  port map (																		 -- SCRIPT COMMENT OUT
--    o => mclk_b,                -- MCLK_B global clock							 -- SCRIPT COMMENT OUT
--    i => dcm_mclk_b 
--  );																				 -- SCRIPT COMMENT OUT
																					 -- SCRIPT COMMENT OUT
	clk_fx <= dcm_mclk_fx;															 -- SCRIPT COMMENT OUT
--  fclk_bufg : bufg																 -- SCRIPT COMMENT OUT
--  port map (																		 -- SCRIPT COMMENT OUT
--    o => clk_fx,                --  drives the dac
--    i => dcm_mclk_fx
--  );

--  idelayctrl_imp : idelayctrl
--  port map (
--    rdy => idelayctrl_ready,
--    refclk => clk_fx,																 -- SCRIPT COMMENT OUT
--    rst => idelayctrl_reset														 -- SCRIPT COMMENT OUT
--  );																				 -- SCRIPT COMMENT OUT
																					 -- SCRIPT COMMENT OUT
	outclk <= dcm_mclk_div;															 -- SCRIPT COMMENT OUT
--  outclk_bufg : bufg
--  port map (
--    o => outclk,                -- ISERDES output clock							 -- SCRIPT COMMENT OUT
--    i => dcm_mclk_div																 -- SCRIPT COMMENT OUT
--  );																				 -- SCRIPT COMMENT OUT
																					 -- SCRIPT COMMENT OUT
  mclk_a <= dcm_mclk_fb;															 -- SCRIPT COMMENT OUT
  
 	
  
---      -- NOTE: RAR .. I believe this mmcm already outputs clocks on BUFG's
---    ------------------- Begin Cut here for INSTANTIATION Template ------- INST_TAG
---    strips_mclk_gen : strips_mclk_mmcm
---    port map ( 
---        
---        -- Clock in ports
---        CLK15NS => clk_x,            -- 66.667 mhz
---        -- Clock out ports  
---        MCLK_A => mclk_a,        -- 66.667 mhz
---        MCLK_B => mclk_b,        -- 66.667 mhz phase 90
---        MCLK_DIV4 => outclk,    -- 16.667 mhz, ISERDES output clock
---        MCLK_MULT3 => clk_fx,   -- 200 mhz, drives the dac
---        -- Status and control signals                
---        reset => reset,
---        locked => dcm_mclk_locked            
---    );
---    -- INST_TAG_END --------- End INSTANTIATION Template --------------

	
  
  
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
																			
 	clk_z <= clk_x when clksel = '0' else clk_ext;							-- SCRIPT COMMENT OUT
 --- bcoclkmux : bufgctrl													
---  port map (																
---    i0 => clk_x,															
---    i1 => clk_ext,
---    o => clk_z,
---    s0 => not clksel,
---    s1 => clksel,
---    ce1 => '1',
---    ce0 => '1',
---    ignore1 => '1',
---    ignore0 => '1'
---  );
																				 -- SCRIPT COMMENT OUT
  fbcoclk_dcm : entity inferredDCM --dcm_adv									 -- SCRIPT COMMENT OUT
  generic map (																	 -- SCRIPT COMMENT OUT
    clkin_period => 15.0,														 -- SCRIPT COMMENT OUT
    clkfx_divide => 4,															 -- SCRIPT COMMENT OUT
    clkfx_multiply => 3,														 -- SCRIPT COMMENT OUT
    clkdv_divide => 4.0,														 -- SCRIPT COMMENT OUT
    clkin_divide_by_2 => false													 -- SCRIPT COMMENT OUT
  )																				 -- SCRIPT COMMENT OUT
  port map (																	 -- SCRIPT COMMENT OUT
    clkin => clk_z,																 -- SCRIPT COMMENT OUT
    clkfb => dcm_fbco_a,   -- Direct feedback since this edje is not used		 -- SCRIPT COMMENT OUT
    rst => reset,																 -- SCRIPT COMMENT OUT
    psincdec => '0',															 -- SCRIPT COMMENT OUT
    psclk => '0',																 -- SCRIPT COMMENT OUT
    psen => '0',																 -- SCRIPT COMMENT OUT
    do => bcoclk_data,															 -- SCRIPT COMMENT OUT
    di => bcoclk_data_in,	  													 -- SCRIPT COMMENT OUT
    drdy => bcoclk_data_ready,													 -- SCRIPT COMMENT OUT
    daddr => bcoclk_addr,														 -- SCRIPT COMMENT OUT
    dwe => bcoclk_we,															 -- SCRIPT COMMENT OUT
    den => bcoclk_en,															 -- SCRIPT COMMENT OUT
    dclk => busclk,																 -- SCRIPT COMMENT OUT
    clk0 => dcm_fbco_a,															 -- SCRIPT COMMENT OUT
    clk90 => open,																 -- SCRIPT COMMENT OUT
    clk180 => open,																 -- SCRIPT COMMENT OUT
    clk270 => open,																 -- SCRIPT COMMENT OUT
    clk2x => open,																 -- SCRIPT COMMENT OUT
    clk2x180 => open,															 -- SCRIPT COMMENT OUT
    clkdv => open,																 -- SCRIPT COMMENT OUT
    clkfx => dcm_fbco_fx,														 -- SCRIPT COMMENT OUT
    clkfx180 => open,															 -- SCRIPT COMMENT OUT
    locked => dcm_fbco_locked													 -- SCRIPT COMMENT OUT
  );																			 -- SCRIPT COMMENT OUT
																				 -- SCRIPT COMMENT OUT
--  Technically, we should insert a bufg between dcm_fbco_fx and any			 -- SCRIPT COMMENT OUT
--  other logic.  This is to ensure that the timing of the BCO reset signal		 -- SCRIPT COMMENT OUT
--  is predictable.																 -- SCRIPT COMMENT OUT
																				 -- SCRIPT COMMENT OUT
	clk_q <= dcm_fbco_fx;														 -- SCRIPT COMMENT OUT
 -- bcoclk_mux : bufg    -- Well, it was a mux at one time...					 -- SCRIPT COMMENT OUT
--  port map (																	 -- SCRIPT COMMENT OUT
--    i => dcm_fbco_fx,															 -- SCRIPT COMMENT OUT
--    o => clk_q																 -- SCRIPT COMMENT OUT
--  );																			 -- SCRIPT COMMENT OUT
																				 -- SCRIPT COMMENT OUT
 bcoclk_pmcd : entity inferredDCM --pmcd										 -- SCRIPT COMMENT OUT
  generic map (																	 -- SCRIPT COMMENT OUT
    clkin_period => 15.0*4/3,													 -- SCRIPT COMMENT OUT
    clkfx_divide => 1,															 -- SCRIPT COMMENT OUT
    clkfx_multiply => 1,														 -- SCRIPT COMMENT OUT
    clkdv_divide => 4.0,														 -- SCRIPT COMMENT OUT
    clkin_divide_by_2 => false													 -- SCRIPT COMMENT OUT
  )																				 -- SCRIPT COMMENT OUT
  port map (																	 -- SCRIPT COMMENT OUT
    clkin => clk_z,																 -- SCRIPT COMMENT OUT
    clkfb => '0', 																 -- SCRIPT COMMENT OUT
    rst => bcoclk_reset,														 -- SCRIPT COMMENT OUT
																				 -- SCRIPT COMMENT OUT
    psincdec => '0',															 -- SCRIPT COMMENT OUT
    psclk => '0',																 -- SCRIPT COMMENT OUT
    psen => '0',																 -- SCRIPT COMMENT OUT
    do => open,																	 -- SCRIPT COMMENT OUT
    di => bcoclk_data_in,	  													 -- SCRIPT COMMENT OUT
    drdy => open,																 -- SCRIPT COMMENT OUT
    daddr => bcoclk_addr,														 -- SCRIPT COMMENT OUT
    dwe => bcoclk_we,															 -- SCRIPT COMMENT OUT
    den => bcoclk_en,															 -- SCRIPT COMMENT OUT
    dclk => busclk,		 														 -- SCRIPT COMMENT OUT
																				 -- SCRIPT COMMENT OUT
    clk0 => dcm_bco_a,															 -- SCRIPT COMMENT OUT
    clk90 => open,																 -- SCRIPT COMMENT OUT
    clk180 => open,																 -- SCRIPT COMMENT OUT
    clk270 => open,																 -- SCRIPT COMMENT OUT
    clk2x => open,																 -- SCRIPT COMMENT OUT
    clk2x180 => open,															 -- SCRIPT COMMENT OUT
    clkdv => dcm_bco_div,														 -- SCRIPT COMMENT OUT
    clkfx => open,																 -- SCRIPT COMMENT OUT
    clkfx180 => open,															 -- SCRIPT COMMENT OUT
    locked => open																 -- SCRIPT COMMENT OUT
  );			 																 -- SCRIPT COMMENT OUT
  					  															 -- SCRIPT COMMENT OUT
--  bcoclk_pmcd : pmcd															 -- SCRIPT COMMENT OUT
--  generic map (																 -- SCRIPT COMMENT OUT
--    rst_deassert_clk => "CLKA",												 -- SCRIPT COMMENT OUT
--    en_rel => true
--  )
--  port map (
--    clka => clk_q,
--    clkb => '0',
--    clkc => '0',
--    clkd => '0',
--    rst => bcoclk_reset,
--    rel => bcoclk_release,
--    clka1 => dcm_bco_a,
--    clka1d2 => open,															 -- SCRIPT COMMENT OUT
--    clka1d4 => dcm_bco_div,													 -- SCRIPT COMMENT OUT
--    clka1d8 => open,															 -- SCRIPT COMMENT OUT
--    clkb1 => open,															 -- SCRIPT COMMENT OUT
--    clkc1 => open,															 -- SCRIPT COMMENT OUT
--    clkd1 => open																 -- SCRIPT COMMENT OUT
--  );																			 -- SCRIPT COMMENT OUT
																				 -- SCRIPT COMMENT OUT
  dcm_fbco <= dcm_bco_a;														 -- SCRIPT COMMENT OUT
--  bcoclkfb_bufg : bufg														 -- SCRIPT COMMENT OUT
--  port map (
--    o => dcm_fbco,             -- Fractional BCO clock
--    i => dcm_bco_a
--  );	   
--  					

--------- NOTE: RAR.. there was a DCM here with in clk_z (possibly external clock)
---------  and output controllable clk_q. But removed for simplicity in transfer to picoZed
---	   
---  clk_q <= clk_z;
---  --bcoclk_mux : bufg    
---  --port map (
---  --  i => clk_z,
---  --  o => clk_q
---  --);
---  
---  
---    -- NOTE: RAR.. replaced pll with divide by 4 logic (inclk = clk_q, outclk = dcm_bco_div)
---    gen_div_by4_clk : for i in 0 to 0 generate
---      signal cnt : unsigned(1 downto 0) := (others => '0');
---      signal tmp_clk : std_logic;
---    begin
---        tmp_clk <= cnt(1);
---        
---        bcoclk_mux : bufg    
---          port map (
---            i => tmp_clk,
---            o => dcm_bco_div
---          );
---        
---        process(clk_q, bcoclk_reset)
---        begin
---          if (bcoclk_reset = '1') then
---              cnt <= (others => '0');
---          elsif (rising_edge(clk_q)) then        
---              cnt <= cnt + 1;
---          end if;      
---        end process;
---    end generate;			   
---	
---  dcm_fbco <= clk_q; -- Fractional BCO clock			 
															 
															 
															 
  dcm_bco <=  dcm_bco_div;									 -- SCRIPT COMMENT OUT
---  bcoclk_bufg : bufg
---  port map (
---    o => dcm_bco,                -- BCO clock
---    i => dcm_bco_div
---  );

  bcoclk <= dcm_bco;
  fracbcoclk <= dcm_fbco;
  
  									   
 	bcocounter_clock <= dcm_bco when bco_clear = '0' else clk_z;   -- SCRIPT COMMENT OUT
---  bcoclkmux_imp : bufgctrl
---  port map (
---    o => bcocounter_clock,
---    i0 => dcm_bco,
---    i1 => clk_z,
---    ignore0 => '1',
---    ignore1 => '0',
---    ce0 => '1',
---    ce1 => '1',
---    s0 => not bco_clear,
---    s1 => bco_clear
---  );


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
	
--  bcocounter_imp : bcocounter
--  port map (
--    clk => bcocounter_clock,
--    ce => '1',
--    sclr => bco_clear,
--    q => bco
--  );

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
