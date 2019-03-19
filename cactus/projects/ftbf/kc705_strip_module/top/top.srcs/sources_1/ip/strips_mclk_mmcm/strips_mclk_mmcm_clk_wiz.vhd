-- file: strips_mclk_mmcm_clk_wiz.vhd
-- 
-- (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
------------------------------------------------------------------------------
-- User entered comments
------------------------------------------------------------------------------
-- None
--
------------------------------------------------------------------------------
--  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
--   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
------------------------------------------------------------------------------
-- CLK_OUT1____66.667______0.000______50.0______157.345____107.401
-- CLK_OUT2____66.667_____90.000______50.0______157.345____107.401
-- CLK_OUT3____16.667______0.000______50.0______217.880____107.401
-- CLK_OUT4___200.001______0.000______50.0______126.504____107.401
--
------------------------------------------------------------------------------
-- Input Clock   Freq (MHz)    Input Jitter (UI)
------------------------------------------------------------------------------
-- __primary__________66.667____________0.010

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity strips_mclk_mmcm_clk_wiz is
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
end strips_mclk_mmcm_clk_wiz;

architecture xilinx of strips_mclk_mmcm_clk_wiz is
  -- Input clock buffering / unused connectors
  signal CLK15NS_strips_mclk_mmcm      : std_logic;
  -- Output clock buffering / unused connectors
  signal clkfbout_strips_mclk_mmcm         : std_logic;
  signal clkfbout_buf_strips_mclk_mmcm     : std_logic;
  signal clkfboutb_unused : std_logic;
  signal MCLK_A_strips_mclk_mmcm          : std_logic;
  signal clkout0b_unused         : std_logic;
  signal MCLK_B_strips_mclk_mmcm          : std_logic;
  signal clkout1b_unused         : std_logic;
  signal MCLK_DIV4_strips_mclk_mmcm          : std_logic;
  signal clkout2b_unused         : std_logic;
  signal MCLK_MULT3_strips_mclk_mmcm          : std_logic;
  signal clkout3b_unused  : std_logic;
  signal clkout4_unused   : std_logic;
  signal clkout5_unused   : std_logic;
  signal clkout6_unused   : std_logic;
  -- Dynamic programming unused signals
  signal do_unused        : std_logic_vector(15 downto 0);
  signal drdy_unused      : std_logic;
  -- Dynamic phase shift unused signals
  signal psdone_unused    : std_logic;
  signal locked_int : std_logic;
  -- Unused status signals
  signal clkfbstopped_unused : std_logic;
  signal clkinstopped_unused : std_logic;
  signal reset_high   : std_logic;

begin


  -- Input buffering
  --------------------------------------
  clkin1_bufg : BUFG
  port map
   (O => CLK15NS_strips_mclk_mmcm,
    I => CLK15NS);



  -- Clocking PRIMITIVE
  --------------------------------------

  -- Instantiation of the MMCM PRIMITIVE
  --    * Unused inputs are tied off
  --    * Unused outputs are labeled unused
  mmcm_adv_inst : MMCME2_ADV
  generic map
   (BANDWIDTH            => "OPTIMIZED",

    
    CLKOUT4_CASCADE      => FALSE,
    COMPENSATION         => "ZHOLD",
    STARTUP_WAIT         => FALSE,
    DIVCLK_DIVIDE        => 1,
    CLKFBOUT_MULT_F      => 15.000,
    CLKFBOUT_PHASE       => 0.000,
    CLKFBOUT_USE_FINE_PS => FALSE,
    CLKOUT0_DIVIDE_F     => 15.000,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.500,
    CLKOUT0_USE_FINE_PS  => FALSE,
    CLKOUT1_DIVIDE       => 15,
    CLKOUT1_PHASE        => 90.000,
    CLKOUT1_DUTY_CYCLE   => 0.500,
    CLKOUT1_USE_FINE_PS  => FALSE,
    CLKOUT2_DIVIDE       => 60,
    CLKOUT2_PHASE        => 0.000,
    CLKOUT2_DUTY_CYCLE   => 0.500,
    CLKOUT2_USE_FINE_PS  => FALSE,
    CLKOUT3_DIVIDE       => 5,
    CLKOUT3_PHASE        => 0.000,
    CLKOUT3_DUTY_CYCLE   => 0.500,
    CLKOUT3_USE_FINE_PS  => FALSE,
    CLKIN1_PERIOD        => 14.999)
  port map
    -- Output clocks
   (
    CLKFBOUT            => clkfbout_strips_mclk_mmcm,
    CLKFBOUTB           => clkfboutb_unused,
    CLKOUT0             => MCLK_A_strips_mclk_mmcm,
    CLKOUT0B            => clkout0b_unused,
    CLKOUT1             => MCLK_B_strips_mclk_mmcm,
    CLKOUT1B            => clkout1b_unused,
    CLKOUT2             => MCLK_DIV4_strips_mclk_mmcm,
    CLKOUT2B            => clkout2b_unused,
    CLKOUT3             => MCLK_MULT3_strips_mclk_mmcm,
    CLKOUT3B            => clkout3b_unused,
    CLKOUT4             => clkout4_unused,
    CLKOUT5             => clkout5_unused,
    CLKOUT6             => clkout6_unused,
    -- Input clock control
    CLKFBIN             => clkfbout_buf_strips_mclk_mmcm,
    CLKIN1              => CLK15NS_strips_mclk_mmcm,
    CLKIN2              => '0',
    -- Tied to always select the primary input clock
    CLKINSEL            => '1',
    -- Ports for dynamic reconfiguration
    DADDR               => (others => '0'),
    DCLK                => '0',
    DEN                 => '0',
    DI                  => (others => '0'),
    DO                  => do_unused,
    DRDY                => drdy_unused,
    DWE                 => '0',
    -- Ports for dynamic phase shift
    PSCLK               => '0',
    PSEN                => '0',
    PSINCDEC            => '0',
    PSDONE              => psdone_unused,
    -- Other control and status signals
    LOCKED              => locked_int,
    CLKINSTOPPED        => clkinstopped_unused,
    CLKFBSTOPPED        => clkfbstopped_unused,
    PWRDWN              => '0',
    RST                 => reset_high);

  reset_high <= reset; 
  locked <= locked_int;

  -- Output buffering
  -------------------------------------

  clkf_buf : BUFG
  port map
   (O => clkfbout_buf_strips_mclk_mmcm,
    I => clkfbout_strips_mclk_mmcm);



  clkout1_buf : BUFG
  port map
   (O   => MCLK_A,
    I   => MCLK_A_strips_mclk_mmcm);



  clkout2_buf : BUFG
  port map
   (O   => MCLK_B,
    I   => MCLK_B_strips_mclk_mmcm);

  clkout3_buf : BUFG
  port map
   (O   => MCLK_DIV4,
    I   => MCLK_DIV4_strips_mclk_mmcm);

  clkout4_buf : BUFG
  port map
   (O   => MCLK_MULT3,
    I   => MCLK_MULT3_strips_mclk_mmcm);

end xilinx;
