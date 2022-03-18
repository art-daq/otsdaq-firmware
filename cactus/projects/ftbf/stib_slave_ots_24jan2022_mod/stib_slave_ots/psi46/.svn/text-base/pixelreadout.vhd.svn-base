--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    captan_psi
-- Module Name:    pixelreadout - RTL
-- Project Name:   test beam firmware
-- Target Devices: xc4vfx12ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Deserializer for PSI46 digital ROC interface
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

entity pixelreadout is
  generic (
    channel : integer := 0;
    iobdelay_value : integer := 0
  );
  port (
    pclk : in std_logic;
    sclk : in std_logic;
    reset : in std_logic;
    enable : in std_logic;
    din : in std_logic;
    aligned : out std_logic;
    serial_input : out std_logic;
    serdes_output : out std_logic_vector(3 downto 0);
    dout : out std_logic_vector(31 downto 0)
  );
end pixelreadout;

architecture RTL of pixelreadout is
  signal data : std_logic_vector(31 downto 0);
  signal q : std_logic_vector(3 downto 0);
  signal bitslip : std_logic;
  signal roc_header : std_logic_vector(1 downto 0);
begin

  ism : iserdes
  generic map (
    bitslip_enable => true,
    data_rate => "DDR",
    data_width => 4,
    interface_type => "NETWORKING",
    iobdelay => "BOTH",
    iobdelay_type => "VARIABLE",
    iobdelay_value => iobdelay_value,
    num_ce => 1,
    serdes_mode => "MASTER"
  )
  port map (
    o => serial_input,
    q1 => q(0),
    q2 => q(1),
    q3 => q(2),
    q4 => q(3),
    q5 => open,
    q6 => open,
    shiftout1 => open,
    shiftout2 => open,
    bitslip => bitslip,
    ce1 => '1',
    clk => sclk,
    clkdiv => pclk,
    d => din,
    oclk => '0',
    rev => '0',
    shiftin1 => '0',
    shiftin2 => '0',
    sr => reset
  );

  process ( pclk ) begin
    if ( pclk'event and pclk = '1' ) then
      if ( enable = '0' ) then
        roc_header <= "00";
        bitslip <= '0';
      else
        if ( roc_header = "00" ) then
          roc_header <= "01";
        elsif ( roc_header = "01" ) then
          if ( data(3 downto 0) & q /= "01111111" ) then
            bitslip <= '1';
            aligned <= '0';
          else
            aligned <= '1';
          end if;
          roc_header <= "11";
        else
          bitslip <= '0';
        end if;
        data <= data(27 downto 0) & q;
      end if;
    end if;
  end process;

  dout <= data;
  serdes_output <= q;

end RTL;
