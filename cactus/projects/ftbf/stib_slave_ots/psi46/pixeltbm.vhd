--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixeltbm - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Generates tbm signals for PSI ROC hybrid interface
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

entity pixeltbm is
  port (
    pclk : in  std_logic;
    reset : in std_logic;
    pixel_caltrig : out std_logic;
    token_out : out std_logic;
    token_in : in std_logic;
    trigger : in std_logic;
    enable : out std_logic;
    bco : in std_logic_vector(47 downto 0);
    trig_bco : out std_logic_vector(47 downto 0);
    itrig : out std_logic_vector(3 downto 0);
    itoken : out std_logic_vector(3 downto 0);
    cal_delay : in std_logic_vector(7 downto 0);
    token_delay : in std_logic_vector(3 downto 0);
    trig_delay : in std_logic_vector(7 downto 0);
    reset_delay : in std_logic_vector(3 downto 0);
    tbm_select : in std_logic;
    do_cal : in std_logic;
    do_token : in std_logic;
    do_trig : in std_logic;
    do_reset : in std_logic;
    cal_busy : out std_logic;
    trig_busy : out std_logic;
    token_busy : out std_logic;
    reset_busy : out std_logic
  );
end pixeltbm;

architecture RTL of pixeltbm is
  signal caltrig : std_logic;
  signal calibrate_busy : std_logic := '0';
  signal trig_count : unsigned(3 downto 0) := "0000";
  signal token_count : unsigned(3 downto 0) := "0000";
  signal trig_pipe : std_logic_vector(255 downto 0) := ( others => '0' );
  signal sent_token : std_logic := '0';
  signal next_enable : std_logic_vector(3 downto 0);
  signal received_token : std_logic := '0';
  signal enable_pipe : std_logic_vector(3 downto 0) := "0000";
  type state_t is ( Idle, Reset0, Reset1, WaitReset, Cal, WaitCal, WaitTrig, Trig );
  signal state : state_t := Idle;
  type token_state_t is ( TokenIdle, DoToken, TokenDone, DoTrig );
  signal token_state : token_state_t := TokenIdle;
  signal count : unsigned(7 downto 0);
  signal need_trig : std_logic;
  signal need_cal : std_logic;
begin
  process ( pclk, trigger ) begin
    if ( pclk'event and pclk = '1' ) then
      if ( reset = '1' ) then
        state <= Idle;
        caltrig <= '0';
      else
        case state is
          when Idle =>
            if ( tbm_select = '1' ) then
              reset_busy <= do_reset;
              need_cal <= do_cal;
              need_trig <= do_trig or trigger;
              if ( do_reset = '1' ) then
                caltrig <= '1';
                state <= Reset0;
              elsif ( do_cal = '1' ) then
                caltrig <= '1';
                state <= Cal;
              elsif ( do_trig = '1' ) then
                caltrig <= '1';
                state <= Trig;
              elsif ( trigger = '1' ) then
                caltrig <= '1';
                state <= Trig;
              else
                caltrig <= '0';
                state <= Idle;
              end if;
            else
              reset_busy <= '0';
              need_cal <= '0';
              need_trig <= '0';
              if ( trigger = '1' ) then
                caltrig <= '1';
                state <= Trig;
              end if;
            end if;
          when Reset0 =>
            caltrig <= '1';
            count <= "0000" & unsigned(reset_delay);
            state <= Reset1;
          when Reset1 =>
            caltrig <= '1';
            state <= WaitReset;
          when WaitReset =>
            if ( count = "00000000" ) then
              if ( need_cal = '1' ) then
                caltrig <= '1';
                count <= unsigned(cal_delay);
                state <= WaitCal;
              elsif ( need_trig = '1' ) then
                caltrig <= '1';
                count <= unsigned(trig_delay);
                state <= Trig;
              else
                caltrig <= '0';
                state <= Idle;
              end if;
            else
              caltrig <= '0';
              count <= count - 1;
            end if;
          when Cal =>
            caltrig <= '0';
            count <= unsigned(cal_delay);
            state <= WaitCal;
          when WaitCal =>
            if ( count = "00000000" ) then
              if ( need_trig = '1' ) then
                caltrig <= '1';
                count <= unsigned(trig_delay);
                state <= Trig;
              else
                caltrig <= '0';
                state <= Idle;
              end if;
            else
              caltrig <= '0';
              count <= count - 1;
            end if;
          when Trig =>
            caltrig <= '1';
            state <= WaitTrig;
          when WaitTrig =>
            caltrig <= '0';
            if ( count = "00000000" ) then
              if ( do_trig = '0' ) then
                need_trig <= '0';
                state <= Idle;
              end if;
            else
              count <= count - 1;
            end if;
        end case;
      end if;
    end if;
  end process;

  process ( pclk, reset, state )
    variable idelay : integer;
  begin
    if ( pclk'event and pclk = '1' ) then
      if ( reset = '1' ) then
        trig_pipe <= ( others => '0' );
        trig_count <= "0000";
      else
        idelay := to_integer(unsigned(token_delay));
        if ( trig_pipe(idelay) = '1' ) then
          trig_count <= trig_count + 1;
        end if;
        trig_pipe(trig_pipe'length-1 downto 1) <= trig_pipe(trig_pipe'length-2 downto 0);
        if ( state = Trig ) then
          trig_pipe(0) <= '1';
        else
          trig_pipe(0) <= '0';
        end if;
      end if;
    end if;
  end process;

  process ( pclk, reset, trig_count ) begin
    if ( pclk'event and pclk = '1' ) then
      if ( reset = '1' ) then
        token_count <= "0000";
      else
        case token_state is
          when TokenIdle =>
            if ( do_token = '1' and tbm_select = '1' ) then
              token_busy <= '1';
              sent_token <= '1';
              token_out <= '1';
              next_enable <= "0000";
              token_state <= DoToken;
            elsif ( token_count /= trig_count ) then
              token_out <= '1';
              next_enable <= "0000";
              token_out <= '1';
              token_state <= DoTrig;
            else
              token_busy <= '0';
            end if;
          when DoToken =>
            token_out <= '0';
            if ( token_in = '1' ) then
              next_enable <= "0000";
              token_state <= TokenDone;
            else
              next_enable <= "0011";
            end if;
          when TokenDone =>
            token_out <= '0';
            if ( enable_pipe(3) = '0' and do_token = '0' ) then
              token_busy <= '0';
              token_state <= TokenIdle;
            end if;
          when DoTrig =>
            token_out <= '0';
            if ( token_in = '1' ) then
              token_count <= token_count + 1;
              next_enable <= "0000";
              token_state <= TokenIdle;
            else
              next_enable <= "0011";
            end if;
        end case;
      end if;
      enable_pipe <= ( enable_pipe(2 downto 0) & '0' ) or next_enable;
    end if;
  end process;
  
  pixel_caltrig <= caltrig;
  trig_busy <= need_trig;  
  cal_busy <= need_cal;  
  itrig <= std_logic_vector(trig_count);
  itoken <= std_logic_vector(token_count);
  enable <= enable_pipe(3);

end RTL;
