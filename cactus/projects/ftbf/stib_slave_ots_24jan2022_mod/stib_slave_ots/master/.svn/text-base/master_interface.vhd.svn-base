--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    master_interface - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Defines a MicroBlaze LMB slave that interfaces with the
--                 strip sensor hybrids
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--   master_csr - 0xc6000000

--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library stib;
use stib.iobus.ALL;

use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.VComponents.all;

entity master_interface is
  port (
    busclk : in std_logic;                                      -- bus clock
    iobus : in iobus_t;
    write_data : out std_logic_vector(31 downto 0);
    iobus_ready : out std_logic;
    bdclk_in : in std_logic;
    debug_select : out std_logic;
    ext_trig : in std_logic;
    clk_out : out std_logic;
    cmd_out : out std_logic
  );
end master_interface;

architecture behavioral of master_interface is

  component trigpattern
    generic (
      pattern : std_logic_vector := "00000";
      clock_edge : string := "RISING";
      width : integer := 1
    );
    port (
      clk : in std_logic;
      d : in std_logic;
      trigger : out std_logic
    );
  end component;

  constant base_address : std_logic_vector(15 downto 0) := x"c500";
  constant address_mask : std_logic_vector(15 downto 0) := x"ffff";
  signal masked_address : std_logic_vector(15 downto 0);

  constant address_master_csr : std_logic_vector(15 downto 0) := x"0000";
  constant address_master_bdclkfreq : std_logic_vector(15 downto 0) := x"0004";
  constant address_master_cmdcount : std_logic_vector(15 downto 0) := x"0008";

  signal master_csr : std_logic_vector(31 downto 0) :=  x"00000000";

  signal trigcount : unsigned(31 downto 0);
  signal bdclklatch : std_logic;
  signal triglatch : std_logic;
  signal trigger_reset : std_logic := '0';

  signal do_trig : std_logic;
  signal do_ext_trig : std_logic;
  signal last_ext_trig : std_logic;
  signal ext_trig_veto : std_logic;
  signal do_start : std_logic;
  signal do_halt : std_logic;
  signal done : std_logic;

  type state_t is ( Idle0, Idle1, Idle2, Idle3, Trig0, Trig1, Trig2, Trig3,
                    Start0, Start1, Start2, Start3, Halt0, Halt1, Halt2, Halt3 );
  signal state : state_t;
  signal state_csr : std_logic_vector(3 downto 0);

  signal bdclk_count : unsigned(31 downto 0) := ( others => '0' );
  signal busclk_count : unsigned(31 downto 0) := ( others => '0' );
  signal bdclk_freq : std_logic_vector(31 downto 0);

  signal bdclk_0 : std_logic;
  signal bdclk_g : std_logic;
  signal eitherclk : std_logic;
  signal bdclk_2x : std_logic;
  signal bdclk_dcm_locked : std_logic;
  signal bdclk_fb : std_logic;
  signal bdclk_div : std_logic;
  signal bdclk : std_logic;
  signal reset : std_logic;
  signal cmd : std_logic;

  signal trig : std_logic;
  signal halt : std_logic;
  signal start : std_logic;
  signal latched_trig : std_logic;
  signal latched_halt : std_logic;
  signal latched_start : std_logic;
  signal trig_count : unsigned(7 downto 0) := ( others => '0' );
  signal halt_count : unsigned(7 downto 0) := ( others => '0' );
  signal start_count : unsigned(7 downto 0) := ( others => '0' );

  signal latch_count : std_logic := '0';
  signal clear_count : std_logic := '0';
  signal please_count : std_logic := '1';
  signal bdclk_muldiv : std_logic;

begin

  bdclk_dcm_imp : dcm_base
  generic map (
    clkdv_divide => 2.0,
    clkin_period => 15.0,
    clkfx_divide => 2,
    clkfx_multiply => 6
  )
  port map (
    clk0 => bdclk_0,
    clk90 => open,
    clk180 => open,
    clk270 => open,
    clk2x => bdclk_2x,
    clk2x180 => open,
    clkdv => bdclk_div,
    clkfx => open,
    clkfx180 => open,
    locked => bdclk_dcm_locked,
    clkfb => bdclk_fb,
    clkin => eitherclk,
    rst => master_csr(31)
  );

--  bdclkin_bufg : bufg
--  port map (
--    i => bdclk_in,
--    o => bdclk_g
--  );
  bcoclk_bufr_imp : bufr
  port map (
    i => bdclk_in,
    ce => '1',
    clr => '0',
    o => bdclk_g
  );

  clkmux : bufgctrl
  port map (
    i0 => bdclk_g,
    i1 => busclk,
    o => eitherclk,
    s0 => not master_csr(28),
    s1 => master_csr(28),
    ce1 => '1',
    ce0 => '1',
    ignore1 => '1',
    ignore0 => '1'
  );

  bdclk_bufg : bufg
  port map (
    o => bdclk_fb,
    i => bdclk_0
  );

  bdclkmux_a : bufgmux
  port map (
    i0 => bdclk_fb,
    i1 => bdclk_muldiv,
    o => bdclk,
    s => master_csr(29)
  );

  bdclkmux_b : bufgmux
  port map (
    i0 => bdclk_2x,
    i1 => bdclk_div,
    o => bdclk_muldiv,
    s => master_csr(28)
  );

  trigpattern_imp : trigpattern
  generic map (
    pattern => "01010",
    clock_edge => "FALLING",
    width => 2
  )
  port map (
    clk => bdclk,
    d => cmd,
    trigger => trig
  );

  startpattern_imp : trigpattern
  generic map (
    pattern => "01101",
    clock_edge => "FALLING",
    width => 4
  )
  port map (
    clk => bdclk,
    d => cmd,
    trigger => start
  );

  haltpattern_imp : trigpattern
  generic map (
    pattern => "00111",
    clock_edge => "FALLING",
    width => 2
  )
  port map (
    clk => bdclk,
    d => cmd,
    trigger => halt
  );

  process ( busclk ) begin
    if ( busclk'event and busclk = '1' ) then

      if ( done = '1' ) then
        do_trig <= '0';
        do_halt <= '0';
        do_start <= '0';
      end if;

      if ( iobus.io_addr_strobe = '1' and masked_address = base_address ) then
        iobus_ready <= '1';
        if ( iobus.io_write_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_master_csr =>
              master_csr <= iobus.io_write_data;
              if ( iobus.io_write_data(1) = '1' ) then
                do_trig <= '1';
              elsif ( iobus.io_write_data(2) = '1' ) then
                do_halt <= '1';
              elsif ( iobus.io_write_data(3) = '1' ) then
                do_start <= '1';
              end if;
            when others =>

          end case;
        end if;

        if ( iobus.io_read_strobe = '1' ) then
          case iobus.io_address(15 downto 0) is
            when address_master_csr =>
              write_data <= master_csr(31) & bdclk_dcm_locked & master_csr(29 downto 28) & '0' & please_count & clear_count & latch_count & master_csr(23 downto 8) & state_csr & do_start & do_halt & do_trig & master_csr(0);
            when address_master_bdclkfreq =>
              write_data <= bdclk_freq;
            when address_master_cmdcount =>
              write_data <= x"00" & std_logic_vector(trig_count) & std_logic_vector(halt_count) & std_logic_vector(start_count);
            when others =>
              write_data <= x"c5f8f8f8";
          end case;

        end if;
      else
        iobus_ready <= '0';
      end if;
    end if;
  end process;

--
--  This process generates the commands for trigger, halt and start
--  which are unique 4-bit patterns that can be detected by the slave.
-- 
  process ( bdclk, do_trig, do_halt, do_start ) begin
    if ( bdclk'event and bdclk = '1' ) then
      if ( ext_trig = '1' and last_ext_trig = '0' ) then
        do_ext_trig <= not ext_trig_veto;
      elsif ( done = '1' ) then
        do_ext_trig <= '0';
      end if;
      last_ext_trig <= ext_trig;
      case state is
        when Idle0 =>
          state <= Idle1;
        when Idle1 =>
          state <= Idle2;
        when Idle2 =>
          state <= Idle3;
        when Idle3 =>
          if ( done = '0' ) then
            if ( do_trig = '1' or do_ext_trig = '1' ) then
              state <= Trig0;
            elsif ( do_halt = '1' ) then
              state <= Halt0;
            elsif ( do_start = '1' ) then
              state <= Start0;
            else
              state <= Idle0;
            end if;
          else
            if ( ( do_trig = '0' and do_halt = '0' ) and do_start = '0' ) then
              done <= '0';
            end if;
            state <= Idle0;
          end if;
        when Trig0 =>
          state <= Trig1;
        when Trig1 =>
          state <= Trig2;
        when Trig2 =>
          state <= Trig3;
        when Trig3 =>
          done <= '1';
          state <= Idle0;
        when Halt0 =>
          state <= Halt1;
        when Halt1 =>
          state <= Halt2;
        when Halt2 =>
          state <= Halt3;
        when Halt3 =>
          done <= '1';
          state <= Idle0;
        when Start0 =>
          state <= Start1;
        when Start1 =>
          state <= Start2;
        when Start2 =>
          state <= Start3;
        when Start3 =>
          done <= '1';
          state <= Idle0;
      end case;
    end if;
  end process;

  cmd <= '1' when state = Idle0 or state = Idle1 else
         '1' when state = Trig0 or state = Trig2 else
         '1' when state = Halt1 or state = Halt2 else
         '1' when state = Halt3 or state = Start0 else
         '1' when state = Start1 or state = Start3 else '0';

  process ( bdclk, trig, start, halt ) begin
    if ( bdclk'event and bdclk = '1' ) then
      if ( start = '1' and latched_start = '0' ) then
        start_count <= start_count + 1;
      end if;
      if ( halt = '1' and latched_halt = '0' ) then
        halt_count <= halt_count + 1;
      end if;
      if ( trig = '1' and latched_trig = '0' ) then
        trig_count <= trig_count + 1;
      end if;
      latched_halt <= halt;
      latched_start <= start;
      latched_trig <= trig;
    end if;
  end process;

--
--  The following two processes provide a way to measure
--  the actual BCO clock frequency, given that the bus
--  clock has a period of 15 ns.
--
  process ( busclk ) begin
    if ( busclk'event and busclk = '1' ) then
      if ( busclk_count = x"03f940ab" ) then
        latch_count <= '1';
        please_count <= '0';
        clear_count <= '0';
        busclk_count <= busclk_count + 1;
      elsif ( busclk_count(31 downto 20) = x"040" ) then
        latch_count <= '0';
        please_count <= '0';
        clear_count <= '0';
        busclk_count <= busclk_count + 1;
      elsif ( busclk_count(31 downto 20) = x"041" ) then
        latch_count <= '0';
        please_count <= '0';
        clear_count <= '1';
        busclk_count <= busclk_count + 1;
      elsif ( busclk_count(31 downto 20) = x"042" ) then
        latch_count <= '0';
        clear_count <= '0';
        please_count <= '1';
        busclk_count <= ( others => '0' );
      else
        latch_count <= '0';
        clear_count <= '0';
        please_count <= '1';
        busclk_count <= busclk_count + 1;
      end if;
    end if;
  end process;
  process ( bdclk ) begin
    if ( bdclk'event and bdclk = '1' ) then
      if ( latch_count = '1' ) then
        bdclk_freq <= std_logic_vector(bdclk_count);
      elsif ( clear_count = '1' ) then
        bdclk_count <= ( others => '0' );
      elsif ( please_count = '1' ) then
        bdclk_count <= bdclk_count + 1;
      end if;
    end if;
  end process;

  ext_trig_veto <= master_csr(8);

  state_csr <= x"0" when state = Idle0 else
               x"1" when state = Idle1 else
               x"2" when state = Idle2 else
               x"3" when state = Idle3 else
               x"4" when state = Trig0 else
               x"5" when state = Trig1 else
               x"6" when state = Trig2 else
               x"7" when state = Trig3 else
               x"8" when state = Halt0 else
               x"9" when state = Halt1 else
               x"a" when state = Halt2 else
               x"b" when state = Halt3 else
               x"c" when state = Start0 else
               x"d" when state = Start1 else
               x"e" when state = Start2 else
               x"f" when state = Start3 else x"0";

  clk_out <= bdclk;
  cmd_out <= cmd;
  masked_address <= iobus.io_address(31 downto 16) and address_mask;
  debug_select <= master_csr(16);

end Behavioral;
