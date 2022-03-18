--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    04:44:19 07/30/2014 
-- Design Name:    stib
-- Module Name:    vipic_readout - RTL
-- Project Name:   STIB firmware for VIPIC readout
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Deserializes data from 16 pixel groups
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

entity vipic_readout is
  port (
    sin : in std_logic_vector(15 downto 0);
    sclk : in std_logic;
    invert : in std_logic;
    sclk_enable : in std_logic;
    serial_clk : in std_logic;
    ts_clk : in std_logic;
    mask : in std_logic_vector(15 downto 0);
    sync : out std_logic_vector(15 downto 0);
    ts : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(31 downto 0);
    dv : out std_logic;
    do_idelay : in std_logic;
    idelay_busy : out std_logic;
    idelay_inc : in std_logic;
    idelay_rst : in std_logic;
    idelay_tap : out std_logic_vector(5 downto 0);
    idelay_select : in std_logic_vector(3 downto 0);
    debug_select : in std_logic_vector(3 downto 0);
    debug : out std_logic_vector(7 downto 0)
  );
end vipic_readout;

architecture RTL of vipic_readout is

  component vipic_channel
  generic (
    channel : integer := 0;
    iobdelay_value : integer := 0
  );
  port (
    sin : in std_logic;
    sclk : in std_logic;
    invert : in std_logic;
    sclk_enable : in std_logic;
    serial_clk : in std_logic;
    ts_clk : in std_logic;
    sync : out std_logic;
    ts : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(31 downto 0);
    dv : out std_logic;
    ack : in std_logic;
    do_idelay : in std_logic;
    idelay_rst : in std_logic;
    idelay_inc : in std_logic;
    idelay_tap : out std_logic_vector(5 downto 0);   
    debug : out std_logic_vector(7 downto 0)
  );
  end component;

  type dout_array_t is array(15 downto 0) of std_logic_vector(31 downto 0);
  type debug_array_t is array(15 downto 0) of std_logic_vector(7 downto 0);
  type tap_array_t is array(15 downto 0) of std_logic_vector(5 downto 0);
  signal dout_array : dout_array_t;
  signal debug_array : debug_array_t;
  signal tap_array : tap_array_t;
  signal valid : std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(15 downto 0) := ( 0 => '1', others => '0' );
  signal busy : std_logic := '0';
  signal idelay_sel : std_logic_vector(15 downto 0) := ( others => '0' );

  type iobdelay_array_t is array(0 to 15) of integer;
  constant iobdelay : iobdelay_array_t := ( 8, 8, 8, 8,
                                            8, 8, 8, 8,
                                            8, 8, 8, 8,
                                            8, 8, 8, 8 );
--
--   iobdelay = 0 works for 66.667 MHz and 100 MHz.
--   iobdelay = 8 may work for 133.33 MHz.
--
begin

  g: for i in 0 to 15 generate
    vc_imp : vipic_channel
    generic map (
      channel => i,
      iobdelay_value => iobdelay(i)
    )
    port map (
      sin => sin(i),
      sclk => sclk,
      invert => invert,
      sclk_enable => sclk_enable,
      serial_clk => serial_clk,
      ts_clk => ts_clk,
      sync => sync(i),
      ts => ts,
      dout => dout_array(i),
      dv => valid(i),
      ack => sel(i),
      do_idelay => idelay_sel(i),
      idelay_rst => idelay_rst,
      idelay_inc => idelay_inc,
      idelay_tap => tap_array(i),
      debug => debug_array(i)
    );
  end generate;

  process ( sclk, sclk_enable ) begin
    if ( sclk'event and sclk = '1' ) then
      if ( sel = x"0000" ) then
        sel <= ( 0 => '1', others => '0' );
      else
        sel(15 downto 1) <= sel(14 downto 0);
        sel(0) <= '0';
      end if;
    end if;
  end process;

  process ( sclk, do_idelay ) begin
    if ( sclk'event and sclk = '1' ) then
      if ( do_idelay = '1' and busy = '0' ) then
        idelay_sel(to_integer(unsigned(idelay_select))) <= '1';
        busy <= '1';
      elsif ( busy = '1' and do_idelay = '0' ) then
        busy <= '0';
        idelay_sel <= ( others => '0' );
      else
        idelay_sel <= ( others => '0' );
      end if;
    end if;
  end process;
  idelay_busy <= busy;

  dout <= dout_array(0) when sel(0) = '1' else
          dout_array(1) when sel(1) = '1' else
          dout_array(2) when sel(2) = '1' else
          dout_array(3) when sel(3) = '1' else
          dout_array(4) when sel(4) = '1' else
          dout_array(5) when sel(5) = '1' else
          dout_array(6) when sel(6) = '1' else
          dout_array(7) when sel(7) = '1' else
          dout_array(8) when sel(8) = '1' else
          dout_array(9) when sel(9) = '1' else
          dout_array(10) when sel(10) = '1' else
          dout_array(11) when sel(11) = '1' else
          dout_array(12) when sel(12) = '1' else
          dout_array(13) when sel(13) = '1' else
          dout_array(14) when sel(14) = '1' else
          dout_array(15) when sel(15) = '1' else x"00000000";
  dv <= '1' when ( ( sel and valid ) and mask ) /= x"0000" else '0';

  debug <= debug_array(0) when debug_select = "0000" else
           debug_array(1) when debug_select = "0001" else
           debug_array(2) when debug_select = "0010" else
           debug_array(3) when debug_select = "0011" else
           debug_array(4) when debug_select = "0100" else
           debug_array(5) when debug_select = "0101" else
           debug_array(6) when debug_select = "0110" else
           debug_array(7) when debug_select = "0111" else
           debug_array(8) when debug_select = "1000" else
           debug_array(9) when debug_select = "1001" else
           debug_array(10) when debug_select = "1010" else
           debug_array(11) when debug_select = "1011" else
           debug_array(12) when debug_select = "1100" else
           debug_array(13) when debug_select = "1101" else
           debug_array(14) when debug_select = "1110" else
           debug_array(15) when debug_select = "1111" else ( others => '0' );

  idelay_tap <= tap_array(0) when idelay_select = "0000" else
                tap_array(1) when idelay_select = "0001" else
                tap_array(2) when idelay_select = "0010" else
                tap_array(3) when idelay_select = "0011" else
                tap_array(4) when idelay_select = "0100" else
                tap_array(5) when idelay_select = "0101" else
                tap_array(6) when idelay_select = "0110" else
                tap_array(7) when idelay_select = "0111" else
                tap_array(8) when idelay_select = "1000" else
                tap_array(9) when idelay_select = "1001" else
                tap_array(10) when idelay_select = "1010" else
                tap_array(11) when idelay_select = "1011" else
                tap_array(12) when idelay_select = "1100" else
                tap_array(13) when idelay_select = "1101" else
                tap_array(14) when idelay_select = "1110" else
                tap_array(15) when idelay_select = "1111" else ( others => '0' );

end RTL;
