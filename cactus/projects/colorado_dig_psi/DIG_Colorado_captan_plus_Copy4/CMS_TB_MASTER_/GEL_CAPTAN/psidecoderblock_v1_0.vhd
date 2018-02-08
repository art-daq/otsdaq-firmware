-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : PsiDecoder
-- Author      : Desktop Support
-- Company     : FNAL
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\rrivera\Desktop\TB FW\PsiDecoder_\PsiDecoder\compile\PsiDecoderBlock_v1_0.vhd
-- Generated   : Fri Sep 30 08:52:54 2011
-- From        : C:/Users/rrivera/Desktop/TB FW/PsiDecoder_/PsiDecoder/src/PsiDecoderBlock_v1_0.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use PsiDecoderParameters.all;

entity PsiDecoderBlock is
  port(
       ADC_WR_EN : in STD_LOGIC;
       EN_MAN_SAMPLE_SEL : in STD_LOGIC;
       MAN_SAMPLE_SEL : in STD_LOGIC;
       MASTER_CLK : in STD_LOGIC;
       RESET : in STD_LOGIC;
       STATUS_EN : in STD_LOGIC;
       TOKEN_IN : in STD_LOGIC;
       TOKEN_OUT : in STD_LOGIC;
       ADC_DATA_IN : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       DEBUG_SEL : in STD_LOGIC_VECTOR(1 downto 0);
       evt_num : in STD_LOGIC_VECTOR(19 downto 0);
       level0_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level1_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level2_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level3_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level4_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       ublack_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       DATA_OUT_WR : out STD_LOGIC;
       error_reset_req : out STD_LOGIC;
       sm_ready : out STD_LOGIC;
       DATA_OUT : out STD_LOGIC_VECTOR(pulse_height_bits_P+chip_id_bits_P+13 downto 0);
       chip_id_rd : out STD_LOGIC_VECTOR(chip_id_bits_P-1 downto 0);
       evt_num_latch : out STD_LOGIC_VECTOR(19 downto 0)
  );
end PsiDecoderBlock;

architecture PsiDecoderBlock of PsiDecoderBlock is

---- Component declarations -----

component Comparator
  port (
       MASTER_CLOCK : in STD_LOGIC;
       at_chip_zero : in STD_LOGIC;
       level0_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level1_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level2_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level3_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       level4_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       managed_data : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       ublack_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       wr_en : in STD_LOGIC;
       clk_en : out STD_LOGIC;
       next_chip : out STD_LOGIC;
       raw_data : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       translated_levels : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;
component Sample_Manager
  port (
       ADC_DATA_IN : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       ADC_WR_EN : in STD_LOGIC;
       EN_MAN_SAMPLE_SEL : in STD_LOGIC;
       MAN_SAMPLE_SEL : in STD_LOGIC;
       MASTER_CLOCK : in STD_LOGIC;
       at_chip_zero : in STD_LOGIC;
       ublack_mem : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       managed_data : out STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       wr_en : out STD_LOGIC
  );
end component;
component State_Machine
  port (
       MASTER_CLOCK : in STD_LOGIC;
       RESET : in STD_LOGIC;
       TOKEN_IN : in STD_LOGIC;
       TOKEN_OUT : in STD_LOGIC;
       clk_en : in STD_LOGIC;
       evt_num : in STD_LOGIC_VECTOR(19 downto 0);
       next_chip : in STD_LOGIC;
       output_status : in STD_LOGIC;
       raw_data : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       translated_levels : in STD_LOGIC_VECTOR(2 downto 0);
       DATA_OUT : out STD_LOGIC_VECTOR(pulse_height_bits_P+chip_id_bits_P+13-1 downto 0);
       DATA_OUT_WR : out STD_LOGIC;
       at_chip_zero : out STD_LOGIC;
       at_start_state : out STD_LOGIC;
       chip_id_rd : out STD_LOGIC_VECTOR(chip_id_bits_P-1 downto 0);
       debug_curr_state : out STD_LOGIC_VECTOR(8 downto 0);
       error_reset_out : out STD_LOGIC;
       evt_num_latch : out STD_LOGIC_VECTOR(19 downto 0)
  );
end component;
component data_out_mux
  port (
       DEBUG_SAMPLE : in STD_LOGIC_VECTOR(1 downto 0);
       MASTER_CLK : in STD_LOGIC;
       debug_sm_data : in STD_LOGIC_VECTOR(8 downto 0);
       hit_data : in STD_LOGIC_VECTOR(pulse_height_bits_P+chip_id_bits_P+13-1 downto 0);
       hit_data_we : in STD_LOGIC;
       managed_data : in STD_LOGIC_VECTOR(adc_bits_P-1 downto 0);
       reset : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       DATA_OUT : out STD_LOGIC_VECTOR(pulse_height_bits_P+chip_id_bits_P+13 downto 0);
       DATA_OUT_WR : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal at_chip_zero : STD_LOGIC;
signal clk_en : STD_LOGIC;
signal hit_data_we : STD_LOGIC;
signal MASTER_CLOCK : STD_LOGIC;
signal next_chip : STD_LOGIC;
signal wr_en : STD_LOGIC;
signal debug_curr_state : STD_LOGIC_VECTOR (8 downto 0);
signal hit_data : STD_LOGIC_VECTOR (pulse_height_bits_P+chip_id_bits_P+13-1 downto 0);
signal managed_data : STD_LOGIC_VECTOR (adc_bits_P-1 downto 0);
signal raw_data : STD_LOGIC_VECTOR (adc_bits_P-1 downto 0);
signal translated_levels : STD_LOGIC_VECTOR (2 downto 0);

begin

----  Component instantiations  ----

Comparator_Blk : Comparator
  port map(
       MASTER_CLOCK => MASTER_CLOCK,
       at_chip_zero => at_chip_zero,
       clk_en => clk_en,
       level0_mem => level0_mem( adc_bits_P-1 downto 0 ),
       level1_mem => level1_mem( adc_bits_P-1 downto 0 ),
       level2_mem => level2_mem( adc_bits_P-1 downto 0 ),
       level3_mem => level3_mem( adc_bits_P-1 downto 0 ),
       level4_mem => level4_mem( adc_bits_P-1 downto 0 ),
       managed_data => managed_data( adc_bits_P-1 downto 0 ),
       next_chip => next_chip,
       raw_data => raw_data( adc_bits_P-1 downto 0 ),
       translated_levels => translated_levels,
       ublack_mem => ublack_mem( adc_bits_P-1 downto 0 ),
       wr_en => wr_en
  );

Dataout_Mux_Blk : data_out_mux
  port map(
       DATA_OUT => DATA_OUT( pulse_height_bits_P+chip_id_bits_P+13 downto 0 ),
       DATA_OUT_WR => DATA_OUT_WR,
       DEBUG_SAMPLE => DEBUG_SEL,
       MASTER_CLK => MASTER_CLOCK,
       debug_sm_data => debug_curr_state,
       hit_data => hit_data( pulse_height_bits_P+chip_id_bits_P+13-1 downto 0 ),
       hit_data_we => hit_data_we,
       managed_data => managed_data( adc_bits_P-1 downto 0 ),
       reset => RESET,
       wr_en => wr_en
  );

Sample_Mgr_Blk : Sample_Manager
  port map(
       ADC_DATA_IN => ADC_DATA_IN( adc_bits_P-1 downto 0 ),
       ADC_WR_EN => ADC_WR_EN,
       EN_MAN_SAMPLE_SEL => EN_MAN_SAMPLE_SEL,
       MAN_SAMPLE_SEL => MAN_SAMPLE_SEL,
       MASTER_CLOCK => MASTER_CLOCK,
       at_chip_zero => at_chip_zero,
       managed_data => managed_data( adc_bits_P-1 downto 0 ),
       ublack_mem => ublack_mem( adc_bits_P-1 downto 0 ),
       wr_en => wr_en
  );

State_Machine_Blk : State_Machine
  port map(
       DATA_OUT => hit_data( pulse_height_bits_P+chip_id_bits_P+13-1 downto 0 ),
       DATA_OUT_WR => hit_data_we,
       MASTER_CLOCK => MASTER_CLOCK,
       RESET => RESET,
       TOKEN_IN => TOKEN_IN,
       TOKEN_OUT => TOKEN_OUT,
       at_chip_zero => at_chip_zero,
       at_start_state => sm_ready,
       chip_id_rd => chip_id_rd( chip_id_bits_P-1 downto 0 ),
       clk_en => clk_en,
       debug_curr_state => debug_curr_state,
       error_reset_out => error_reset_req,
       evt_num => evt_num,
       evt_num_latch => evt_num_latch,
       next_chip => next_chip,
       output_status => STATUS_EN,
       raw_data => raw_data( adc_bits_P-1 downto 0 ),
       translated_levels => translated_levels
  );


---- Terminal assignment ----

    -- Inputs terminals
	MASTER_CLOCK <= MASTER_CLK;


end PsiDecoderBlock;
