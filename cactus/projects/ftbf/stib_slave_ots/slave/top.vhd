----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    top - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Top level design for STIB firmware.
--                 All IO buffers are instantiated at this level.
--
-- Dependencies:   core
--                 strip_interface
--                 gbe_interface
--                 tlkserdes_interface
--                 clock_interface
--                 iobus_interface
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.std_logic_misc.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library stib;
use stib.iobus.all;

--  SCIN is the net on the FSSR2 chip: it is an input on the FSSR2 and an
--  output on the CAPTAN.

--  SCOUT is the net on the FSSR2 chip: it is an output on the FSSR2 and an
--  input on the CAPTAN.

--  OUTx_y are outputs on the FSSR2 chips and inputs on the CAPTAN.

entity top is
    GENERIC ( 
				NSENSOR : INTEGER := 6;
				NSENSOR_PADS : INTEGER := 6);
    Port ( CLK15NS_PAD : in STD_LOGIC;
           CLK5MHZ_PAD : in STD_LOGIC;
           LED_PAD : out  STD_LOGIC_VECTOR (1 downto 0);
			  
	
           GMII_TXD_PAD : out  STD_LOGIC_VECTOR (7 downto 0);
           GMII_TXER_PAD : out  STD_LOGIC;
           GMII_TXEN_PAD : out  STD_LOGIC;
           GMII_TXCLK_PAD : out  STD_LOGIC;
           GMII_RESET_PAD : out  STD_LOGIC;
           GMII_RXD_PAD : in  STD_LOGIC_VECTOR (7 downto 0);
           GMII_RXER_PAD : in  STD_LOGIC;
           GMII_RXDV_PAD : in  STD_LOGIC;
           GMII_RXCLK_PAD : in  STD_LOGIC;

           EXT_CLK_PAD_P : IN STD_LOGIC;
           EXT_CLK_PAD_N : IN STD_LOGIC;
           EXT_TRIG_PAD_P : IN STD_LOGIC;
           EXT_TRIG_PAD_N : IN STD_LOGIC;
           EXT_CLK_OUT_PAD_P : OUT STD_LOGIC;
           EXT_CLK_OUT_PAD_N : OUT STD_LOGIC;
           EXT_TRIG_OUT_PAD_P : OUT STD_LOGIC;
           EXT_TRIG_OUT_PAD_N : OUT STD_LOGIC;
           JUMPER_PAD : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
           STRIP_DAC_CS_PAD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           STRIP_DAC_SDI_PAD : OUT STD_LOGIC;
           STRIP_DAC_SDO_PAD : IN STD_LOGIC;
           STRIP_DAC_SCLK_PAD : OUT STD_LOGIC;
           STRIP_DAC_RESET_PAD : OUT STD_LOGIC;
           STRIP_DAC_BUSAB_PAD : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
           STRIP_DAC_DATACLK_PAD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           STRIP_DAC_CLK_PAD_P : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           STRIP_DAC_CLK_PAD_N : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           STRIP_RESET_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_RESET_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_SHIFT_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_SHIFT_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_SCIN_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0); 
           STRIP_SCIN_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_SCOUT_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0); 
           STRIP_SCOUT_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_BCOCLK_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_BCOCLK_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_MCLKA0_PAD_P : OUT STD_LOGIC;
           STRIP_MCLKA0_PAD_N : OUT STD_LOGIC;
           STRIP_MCLKB0_PAD_P : OUT STD_LOGIC;
           STRIP_MCLKB0_PAD_N : OUT STD_LOGIC;
           STRIP_MCLKA1_PAD_P : OUT STD_LOGIC;
           STRIP_MCLKA1_PAD_N : OUT STD_LOGIC;
           STRIP_MCLKB1_PAD_P : OUT STD_LOGIC;
           STRIP_MCLKB1_PAD_N : OUT STD_LOGIC;
           STRIP_OUT1_0_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_0_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_1_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_1_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_2_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_2_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_3_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_3_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_4_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_OUT1_4_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_GOTHITOR_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0);
           STRIP_GOTHITOR_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR-1 DOWNTO 0)
        );
end top;

architecture RTL of top is


--
  COMPONENT trigpattern 
    GENERIC (
      PATTERN : STD_LOGIC_VECTOR := "000";
      CLOCK_EDGE : STRING := "RISING";
      WIDTH : INTEGER := 1
    );
    PORT (
      CLK : IN STD_LOGIC;
      D : IN STD_LOGIC;
      TRIGGER : OUT STD_LOGIC
    );
  END COMPONENT;

--  SIGNAL CLK15NS : STD_LOGIC;
--  SIGNAL CLK5MHZ : STD_LOGIC;
--  SIGNAL CORE_RESET : STD_LOGIC := '0';
--  SIGNAL UART_RX : STD_LOGIC;
--  SIGNAL UART_TX : STD_LOGIC;
--  SIGNAL UART_IRX : STD_LOGIC;
--  SIGNAL UART_ITX : STD_LOGIC;
--  SIGNAL IRQ : STD_LOGIC;
--  SIGNAL INTERRUPT : STD_LOGIC_VECTOR(0 DOWNTO 0);
--  SIGNAL DEBUG : STD_LOGIC_VECTOR(7 DOWNTO 0);
--  SIGNAL GBE_DEBUG : STD_LOGIC_VECTOR(7 DOWNTO 0);
--  SIGNAL DEBUG_PORT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL LED : STD_LOGIC_VECTOR(1 DOWNTO 0);
--  SIGNAL LED_PORT : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL JUMPERS : STD_LOGIC_VECTOR(7 DOWNTO 0);
--
  SIGNAL STRIP_DAC_SCLK : STD_LOGIC;
  SIGNAL STRIP_DAC_CS : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL STRIP_DAC_SDI : STD_LOGIC;
  SIGNAL STRIP_DAC_SDO : STD_LOGIC;
  SIGNAL STRIP_DAC_RESET : STD_LOGIC;
  SIGNAL STRIP_DAC_BUSAB : STD_LOGIC_VECTOR(11 DOWNTO 0);
  SIGNAL STRIP_DAC_CLK : STD_LOGIC;
  SIGNAL STRIP_DAC_DATACLK : STD_LOGIC;

  signal ext_clk_out : std_logic;
  signal ext_trig_out : std_logic;

  constant stib_type : string := "FNAL_SLAVE";
--  constant stib_type : string := "PURDUE_SLAVE";

COMPONENT chip_fifo 
    PORT (
      RST : IN STD_LOGIC;
      WR_CLK : IN STD_LOGIC;
      RD_CLK : IN STD_LOGIC;
      DIN : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
      WR_EN : IN STD_LOGIC;
      RD_EN : IN STD_LOGIC;
      DOUT : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
      EMPTY : OUT STD_LOGIC;
      FULL : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fifo_b_data_in : STD_LOGIC_VECTOR(35 DOWNTO 0);
  SIGNAL fifo_b_data_out : STD_LOGIC_VECTOR(35 DOWNTO 0);
  signal fifo_b_data_EMPTY, fifo_b_data_re : std_logic;

    signal b_data                   : std_logic_vector (63 downto 0);
    signal b_data_we                : std_logic;
    signal GMII_RXD_0_sig           : std_logic_vector (7 downto 0);
    signal GMII_RX_DV_0_sig         : std_logic;
    signal GMII_RX_ER_0_sig         : std_logic;
    signal GTX_CLK_0_sig            : std_logic;
    signal GMII_RXCLK               : std_logic;
    signal CLK15NS, CLK15NS_sig     : std_logic;                                   
    
    signal iobus : iobus_t;
    
    signal gec_mac, gec_user_src_mac       : std_logic_vector (47 downto 0);
    signal gec_port, gec_user_src_port     : std_logic_vector (15 downto 0);
    signal gec_addrs, gec_user_src_addrs   : std_logic_vector (7 downto 0); 
    
    signal gec_user_src_capture                  : std_logic;    
    
    signal reset_btn : std_logic;
    signal gnd : std_logic;
   
    
    signal PHY_TXD_sig              : std_logic_vector (7 downto 0);
    signal PHY_TXEN_sig             : std_logic;
    signal PHY_TXER_sig             : std_logic;
    signal psi_status               : std_logic_vector (63 downto 0);
    signal reset                    : std_logic;
    signal reset_n                  : std_logic;
    signal rx_addr                  : std_logic_vector (31 downto 0);
    signal rx_data                  : std_logic_vector (63 downto 0);
    signal rx_wren                  : std_logic;
    signal secondary_clk, secondary_clk_sig       : std_logic;
    signal tx_data                  : std_logic_vector (63 downto 0);

     

    
    SIGNAL STRIP_MCLKA : STD_LOGIC;
    SIGNAL STRIP_MCLKB : STD_LOGIC;
    SIGNAL STRIP_BCOCLK : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_RESET : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_SHIFT : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_SCIN : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_SCOUT : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_0 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_1 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_2 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_3 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_OUT1_4 : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    SIGNAL STRIP_DATA_AVAILABLE : STD_LOGIC;
    SIGNAL STRIP_SYNC_ERROR : STD_LOGIC;
    SIGNAL STRIP_BCO_ZERO : STD_LOGIC;
    SIGNAL STRIP_HITOR : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);

     
   
      SIGNAL b_data_alert : STD_LOGIC;
		  
		  
		SIGNAL HALT : STD_LOGIC;
		SIGNAL START : STD_LOGIC;
		SIGNAL TRIGGER : STD_LOGIC;


		signal strip_ready : std_logic := '0';
		signal strip_ready_cnt : unsigned(8 downto 0) := (others => '0');
		signal strip_tx_data : std_logic_vector(31 downto 0);

		signal tx_rden : std_logic;
		signal eth_strobe_mask : std_logic := '1';
		signal masked_tx_rden, masked_rx_wren : std_logic;
		signal masked_rx_wren2 : std_logic;

		signal EXT_CLK_input : std_logic;
		signal strip_clocks_locked, strip_busy : std_logic;  

		signal strip_bwe             : std_logic;
		signal rx_addr_reg               : std_logic_vector (31 downto 0);
		signal rx_addr_reg2               : std_logic_vector (31 downto 0);


		signal b_data_chk               : std_logic_vector (31 downto 0);
		signal b_data_cnt               : unsigned (31 downto 0) := (others => '0');

		--signal bwe_and             : std_logic;
		signal strip_ready_and             : std_logic;

		signal ext_clk, ext_cmd : std_logic;-- ext_trig, ext_trig_strobe : std_logic;
		
		
		signal b_data_stack : std_logic_vector(63 downto 0);
		signal b_data_stack_state : std_logic_vector(3 downto 0) := (others => '0');
		signal bco_cnt_out : std_logic_vector(47 downto 0);   -- bco counter
BEGIN 

	 -- process to create delayed ready to each write and read
	 strip_ready_and <= strip_ready;
   process(GMII_RXCLK)
   begin
    if rising_edge(GMII_RXCLK) then
        
        strip_ready <= '0';
        
        if(strip_ready_cnt /= 0) then -- countdown to ready again
        
				strip_ready <= '0';
            if(strip_busy = '0') then --(strip_clocks_locked = '1' and strip_busy = '0') then
                strip_ready_cnt <= strip_ready_cnt - 1;               
                if(strip_ready_cnt = 1) then -- ready now!
                     strip_ready <= '1';
                end if;            
            end if;
            
        elsif (eth_strobe_mask = '1' and (tx_rden = '1' or rx_wren = '1')) then
            strip_ready_cnt <= (others => '1');
            eth_strobe_mask <= '0';
				strip_ready <= '0';
        else
            eth_strobe_mask <= '1';
        end if;          
          
        --delay by 2 clock the strobes.. so that address can be registered twice to ease timing
        masked_tx_rden <= tx_rden and eth_strobe_mask;
        masked_rx_wren <= rx_wren and eth_strobe_mask;
        
        rx_addr_reg <= rx_addr;
        
        masked_rx_wren2 <= masked_rx_wren;
        rx_addr_reg2 <= rx_addr_reg;
    end if;
   end process;
   
   
	gnd <= '0';
    
	reset_n <= not reset;
	reset_btn <= '0';

	--	reset_ibuf : IBUF       -- SW3 on board is active high
	--     port map (I=>GPIO_SW_W,  O=>reset_btn);
	--   user_led1: OBUF   -- LED display of RESET
	--      port map (I=>reset,    O=>PZ_ULED_1);        
      
   
	-- start simple OEI
	eth_interface : entity work.Ethernet_Interface
	  port map (b_data(63 downto 0)=>b_data,--b_data_stack,--b_data(63 downto 0),
				b_data_we=>b_data_we,--bwe_and,--b_data_we,
				PHY_RXD(7 downto 0)=>GMII_RXD_0_sig(7 downto 0),
				PHY_RX_DV=>GMII_RX_DV_0_sig,
				PHY_RX_ER=>GMII_RX_ER_0_sig,
				MASTER_CLK=>GMII_RXCLK,                
				reset_in=>reset_btn,
				slow_clk=>CLK15NS,
				user_ready=>strip_ready_and,--strip_ready,
				user_addr=>JUMPERS,
            tx_rden=>tx_rden,
				reset_out => reset,
				tx_data(63 downto 0)=>tx_data(63 downto 0),
				b_enable=>open,
				TX_CLK=>GTX_CLK_0_sig,
				PHY_TXD(7 downto 0)=>PHY_TXD_sig(7 downto 0),
				PHY_TX_EN=>PHY_TXEN_sig,
				PHY_TX_ER=>PHY_TXER_sig,
				rx_addr(31 downto 0)=>rx_addr(31 downto 0),
				rx_data(63 downto 0)=>rx_data(63 downto 0),
				rx_wren=>rx_wren);
					 
	-- end simple OEI
	
	
	iobus.IO_Addr_Strobe <= '1';
	iobus.IO_Read_Strobe <= tx_rden; --extend pulse to aid readback (was '1' but created a problem for ext commands changing bits)
	iobus.IO_Write_Strobe <= masked_rx_wren2;
	iobus.IO_Address <= rx_addr_reg2(31 downto 0);
	iobus.IO_Byte_Enable <= x"F";
	iobus.IO_Write_Data <= rx_data(31 downto 0);
				 
	tx_data(32+15 downto 32) <= x"ABCD";--x"ABCD0000";
	tx_data(63 downto 32+16) <= rx_addr_reg2(15 downto 0);
	--bwe_and <= b_data_we and strip_bwe; -- might stop timing glitch? (seeing strip_bwe 3-wide causing 2 b_data_we strobes)



	--===============================================================
	--===============================================================
	--===============================================================
	-- add an extra clock for read data since it keeps failing timing
	stackGen : for i in 0 to 0 generate
		signal local_data_ready : std_logic;
		
		signal local_read_done : std_logic := '1';
		signal local_read_actually_done : std_logic := '0';
				
		signal local_start : std_logic_vector(1 downto 0) := (others => '0');
		signal local_trigger : std_logic_vector(1 downto 0) := (others => '0');
		signal local_mclk_time : unsigned(31 downto 0) := (others => '0');
		signal local_trigger_count : unsigned(31 downto 0) := (others => '0');
		signal local_start_count : unsigned(31 downto 0) := (others => '0');
		
		signal local_bco_time : std_logic_vector(47 downto 0) := (others => '0');
		signal local_bco_time_old : std_logic_vector(31 downto 0);
		signal local_lastdata_bco_time : std_logic_vector(31 downto 0);
		
		signal local_bco_clk : std_logic_vector(1 downto 0) := (others => '0');		
		signal local_bco_wraparound : std_logic := '0';
		
		
		signal local_bco_zero : std_logic := '0';
		signal local_bco_zero_cnt : unsigned(3 downto 0) := (others => '0');	
		
		signal local_stripdata_repeat : std_logic := '0';
		signal local_stripdata_last : std_logic_vector(31 downto 0);
		
		signal local_bcodelta : unsigned(15 downto 0) := (others => '0');
		
		signal local_clock_lock_lost : std_logic_vector(1 downto 0) := (others => '0');
	begin
	
	
		process(GMII_RXCLK)
		begin
		  if (rising_edge(GMII_RXCLK)) then
				tx_data(31 downto 0) <= strip_tx_data;    
				
				local_start(0) <= START;
				local_start(1) <= local_start(0);
				local_trigger(0) <= TRIGGER;
				local_trigger(1) <= local_trigger(0);
				
				local_bco_clk(0) <= STRIP_BCOCLK(0);
				local_bco_clk(1) <= local_bco_clk(0);
				
				if(local_bco_clk(1) = '1' and local_bco_clk(0) = '0') then --have falling edge of clock
					local_bco_time <= bco_cnt_out; 
				end if;
				
				local_bco_time_old <= local_bco_time(31 downto 0);
				
				if(unsigned(local_bco_time(31 downto 0)) < unsigned(local_bco_time_old)) then -- have bco wrap around	
					local_bco_wraparound <= '1';
				end if;
				
				local_bco_zero <= '0';
				if(unsigned(local_bco_time) = 2) then
					local_bco_zero <= '1';
					local_bco_zero_cnt <= local_bco_zero_cnt + 1;
				end if;
				
				local_data_ready <= not fifo_b_data_EMPTY;
				
				fifo_b_data_re <= '0';
				b_data_we <= '0';
				
				local_stripdata_repeat <= '0';
				
				local_mclk_time <= local_mclk_time + 1;
				
				--detect clock lost
				if(local_clock_lock_lost(0) = '0' and strip_clocks_locked = '0') then
					local_clock_lock_lost(0) <= '1';
				end if;
--				if(local_clock_lock_lost(1) = '0' and strip_clocks_locked(1) = '0') then
--					local_clock_lock_lost(1) <= '1';
--				end if;
				
				--give priority to trigger and start!
				if(local_start(1) = '0' and local_start(0) = '1') then --have start
				
					local_mclk_time <= (others => '0'); --reset time
					local_trigger_count <= (others => '0'); --reset trigger
					local_start_count <= local_start_count + 1;
					b_data(31 downto 0) <= std_logic_vector(local_start_count(23 downto 0)) & x"e8";
					b_data_we <= '1';
					local_bco_zero_cnt <= (others => '0');
					local_read_done <= '1';
					local_read_actually_done <= '0';
					local_clock_lock_lost <= (others => '0');
					
				elsif(local_trigger(1) = '0' and local_trigger(0) = '1') then --have trigger
					local_trigger_count <= local_trigger_count + 1;
					b_data(31 downto 0) <= std_logic_vector(local_trigger_count(23 downto 0)) & x"f8";
					b_data_we <= '1';
				elsif(local_bco_wraparound = '1') then
					b_data(31 downto 0) <= std_logic_vector(local_bco_zero_cnt) & local_bco_zero & local_clock_lock_lost(0) & 
						local_stripdata_repeat & strip_busy &
						local_bco_time(47 downto 32) & x"18";
					b_data_we <= '1';
					local_bco_wraparound <= '0';
				elsif(local_bcodelta = x"FFFF") then --bco delta count high (just to keep for chipscope)
					
					b_data(31 downto 0) <= std_logic_vector(local_bco_zero_cnt) & local_bco_zero & local_clock_lock_lost(0) & 
						local_stripdata_repeat & strip_busy &
						std_logic_vector(local_bcodelta) & x"28";
					b_data_we <= '1';
					local_bcodelta <= (others => '0'); --clear it so we do not get stuck here
				elsif(local_data_ready = '1' and local_read_done = '1') then --have data
				
					fifo_b_data_re <= '1';
					local_read_done <= '0';		
					local_read_actually_done <= '0';
					
				elsif(local_read_actually_done = '1') then	--send data	
				
					b_data(31 downto 0) <= fifo_b_data_out(31 downto 0);
					b_data_we <= '1';
					local_read_done <= '1';
					local_read_actually_done <= '0';
					
					if(local_stripdata_last = fifo_b_data_out(31 downto 0)) then
						local_stripdata_repeat <= '1'; -- found repeat!! look in chipscope to debug
					end if;
					
					local_stripdata_last <= fifo_b_data_out(31 downto 0);
					
					local_lastdata_bco_time <= local_bco_time(31 downto 0);
					
					if(unsigned(local_bco_time) - unsigned(local_lastdata_bco_time(31 downto 0)) < 4) then
						local_bcodelta <= local_bcodelta + 1;
					else
						local_bcodelta <= (others => '0');
					end if;
					
				end if;	
				
				if(local_read_done = '0' and local_read_actually_done = '0') then --give one clock for data to be ready				
					local_read_actually_done <= '1';
				end if;
				
		  end if;
		end process; 
		
		b_data(63 downto 32) <= local_bco_time(31 downto 0);--std_logic_vector(local_mclk_time);
		
		fifo_b_data_in(35 downto 32) <= (others => '0');				
		 fifo_imp : chip_fifo
		PORT MAP (
		 RST => reset,
		 WR_CLK => STRIP_MCLKA,
		 RD_CLK => GMII_RXCLK,
		 DIN => fifo_b_data_in,
		 WR_EN => strip_bwe,
		 RD_EN => fifo_b_data_re,
		 FULL => open, --b_data(62),
		 EMPTY => fifo_b_data_EMPTY,
		 DOUT => fifo_b_data_out
		);
		
		
		
																			--fifo_b_data_re <= not fifo_b_data_EMPTY;
																			--b_data_stack(63 downto 32) <= fifo_b_data_out(31 downto 0);	--b_data(31 downto 0) <= fifo_b_data_out(31 downto 0);
																				
																		--				
																		--				
																		--				
																		--				--stack data 		
																		--				if(local_data_ready = '1') then
																		--					b_data_stack_state(0) <= not b_data_stack_state(0); 
																		--					
																		--					if(b_data_stack_state(0) = '0') then --first and every other word
																		--						b_data_stack(31 downto 0) <= b_data_stack(63 downto 32);
																		--					end if;
																		--				end if;
																		--					
																		--				if(fifo_b_data_EMPTY = '0' and b_data_stack_state(0) = '1') then --second word ready next clock
																		--					b_data_we <= '1';
																		--				end if;
	end generate;
	
	--===============================================================
	--===============================================================
	--===============================================================
	
	LED(0) <= '1';
 

	strip_imp : entity strip.strip_interface
	  GENERIC MAP ( NSENSOR => NSENSOR_PADS )
	  PORT MAP (
		 CLK => GMII_RXCLK,--CLK15NS,
		 IOBUS => iobus, --SLAVE_IOBUS(3),
		 WRITE_DATA => strip_tx_data, --tx_data(31 downto 0), --SLAVE_WRITE_DATA(3),
		 IOBUS_READY => open, --SLAVE_READY(3),
		 CLKX => CLK15NS,
		 CLKY => secondary_clk,--CLK5MHZ,
		 EXT_CLK => ext_clk,--EXT_CLK,
		 EXT_TRIG => TRIGGER,--ext_trig_strobe,--TRIGGER,
		 EXT_HALT => HALT,--gnd,--HALT,
		 EXT_START => START,--gnd,--START,
		 DAC_CS => STRIP_DAC_CS,
		 DAC_SDI => STRIP_DAC_SDI,
		 DAC_SDO => STRIP_DAC_SDO,
		 DAC_SCLK => STRIP_DAC_SCLK,
		 DAC_RESET => STRIP_DAC_RESET,
		 DAC_BUSAB => STRIP_DAC_BUSAB,
		 DAC_CLK => STRIP_DAC_CLK,
		 DAC_DATACLK => STRIP_DAC_DATACLK,
		 clocks_locked => strip_clocks_locked,
		 something_busy => strip_busy,
		 MCLKA => STRIP_MCLKA,
		 MCLKB => STRIP_MCLKB,
		 BCOCLK => STRIP_BCOCLK,
		 bco_cnt_out => bco_cnt_out, --RAR
		 STRIP_RESET => STRIP_RESET,
		 SHIFT => STRIP_SHIFT,
		 SCIN => STRIP_SCIN,
		 SCOUT => STRIP_SCOUT,
		 OUT1_0 => STRIP_OUT1_0,
		 OUT1_1 => STRIP_OUT1_1,
		 OUT1_2 => STRIP_OUT1_2,
		 OUT1_3 => STRIP_OUT1_3,
		 OUT1_4 => STRIP_OUT1_4,
		 HITOR => STRIP_HITOR,
		 DATA_AVAILABLE => open,--STRIP_DATA_AVAILABLE,
		 SYNC_ERROR => open,--STRIP_SYNC_ERROR,
		 BCO_ZERO => open,--STRIP_BCO_ZERO,
		 STREAM_RCLK => GMII_RXCLK,--GMII_RXCLK,
		 STREAM_READ_ENABLE => gnd,--STREAM_READ_ENABLE,
		 STREAM_DOUT => open,--STREAM_DOUT,
		 STREAM_LENGTH => open,--STREAM_LENGTH,
		 STREAM_CKSUM => open,--STREAM_CKSUM,
		 STREAM_STROBE => open,--STREAM_STROBE,
		 STREAM_READY => gnd,--STREAM_READY,
		 SERDES_DATA => fifo_b_data_in(31 downto 0),--SERDES_STRIP_DATA,
		 SERDES_DATA_WE => strip_bwe,--SERDES_STRIP_DATA_WE,
		 STRIP_DEBUG => open,--STRIP_DEBUG,
		 DEBUG_SELECT => open--STRIP_DEBUG_SELECT
	  );		  

  trigpattern_imp : trigpattern
  GENERIC MAP (
    PATTERN => "01010",
    CLOCK_EDGE => "FALLING",
    WIDTH => 1
  )
  PORT MAP (
    CLK => EXT_CLK,
    D => EXT_CMD,
    TRIGGER => TRIGGER
  );

  startpattern_imp : trigpattern
  GENERIC MAP (
    PATTERN => "01101",
    CLOCK_EDGE => "FALLING",
    WIDTH => 4
  )
  PORT MAP (
    CLK => EXT_CLK,
    D => EXT_CMD,
    TRIGGER => START
  );

  haltpattern_imp : trigpattern
  GENERIC MAP (
    PATTERN => "00111",
    CLOCK_EDGE => "FALLING",
    WIDTH => 2
  )
  PORT MAP (
    CLK => EXT_CLK,
    D => EXT_CMD,
    TRIGGER => HALT
  );

  clk15ns_ibufg : BUFG
  --GENERIC MAP (
  --  IOSTANDARD => "LVCMOS25"
  --)
  PORT MAP (
    O => CLK15NS,
    I => CLK15NS_PAD
  );
  clk5mhz_ibufg : IBUFG
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    O => secondary_clk,
    I => CLK5MHZ_PAD
  );

  G_SPI : FOR I IN 0 TO 3 GENERATE
    dac_cs_obuf : OBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25"
    )
    PORT MAP (
      I => NOT STRIP_DAC_CS(I),
      O => STRIP_DAC_CS_PAD(I)
    );
  END GENERATE;

  G_LED : FOR I IN 0 TO 1 GENERATE
    led_obuf : OBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25",
      SLEW => "SLOW"
    )
    PORT MAP (
      I => LED(I),
      O => LED_PAD(I)
    );
  END GENERATE;
--  G_DEBUG : FOR I IN 0 TO 7 GENERATE
--    debug_obuf : OBUF
--    GENERIC MAP (
--      IOSTANDARD => "LVCMOS25",
--      SLEW => "SLOW"
--    )
--    PORT MAP (
--      I => DEBUG_PORT(I),
--      O => DEBUG_PORT_PAD(I)
--    );
--  END GENERATE;
--  
--  uart_tx_obuf : OBUF
--  GENERIC MAP (
--    DRIVE => 12,
--    IOSTANDARD => "LVCMOS25",
--    SLEW => "SLOW" )
--  PORT MAP (
--    O => UART_TX_PAD,
--    I => UART_TX
--  );
--  uart_rx_ibuf : IBUF
--  GENERIC MAP (
--    IOSTANDARD => "LVCMOS25"
--  )
--  PORT MAP (
--    I => UART_RX_PAD,
--    O => UART_RX
--  );

--  GMII interface to GbE PHY layer

  gmii_rxclk_ibufg : BUFG
 -- GENERIC MAP (
 --   IOSTANDARD => "LVCMOS25"
 -- )
  PORT MAP (
    I => GMII_RXCLK_PAD,
    O => GMII_RXCLK
  );
  gmii_rxdv_ibufg : IBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => GMII_RXDV_PAD,
    O => GMII_RX_DV_0_sig
  );
  gmii_rxer_ibufg : IBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => GMII_RXER_PAD,
    O => GMII_RX_ER_0_sig
  );

  gmii_txer_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => GMII_TXER_PAD,
    C => GMII_RXCLK,
    CE => '1',
    D1 => PHY_TXER_sig,
    D2 => PHY_TXER_sig,
    R => '0',
    S => '0'
  );
  gmii_txen_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => GMII_TXEN_PAD,
    C => GMII_RXCLK,
    CE => '1',
    D1 => PHY_TXEN_sig,
    D2 => PHY_TXEN_sig,
    R => '0',
    S => '0'
  );
  gmii_txclk_obuf : ODDR
  GENERIC MAP (
    DDR_CLK_EDGE => "SAME_EDGE"
  )
  PORT MAP (
    Q => GMII_TXCLK_PAD,
    C => GMII_RXCLK,
    CE => '1',
    D1 => '0',
    D2 => '1',
    R => '0',
    S => '0'
  );
  gmii_reset_obuf : OBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25",
    SLEW => "SLOW"
  ) 
  PORT MAP (
    I => reset_n,
    O => GMII_RESET_PAD
  );
  G_GMII: FOR I IN 0 TO 7 GENERATE
    gmii_txd_obuf : ODDR
    GENERIC MAP (
      DDR_CLK_EDGE => "SAME_EDGE"
    )
    PORT MAP (
      Q => GMII_TXD_PAD(I),
      C => GMII_RXCLK,
      CE => '1',
      D1 => PHY_TXD_sig(I),
      D2 => PHY_TXD_sig(I),
      R => '0',
      S => '0'
    );
    gmii_rxd_ibuf : IBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25"
    )
    PORT MAP (
      I => GMII_RXD_PAD(I),
      O => GMII_RXD_0_sig(I)
    );
  END GENERATE;

--  TLK3101 interface
--
--  G_TLK : FOR I IN 0 TO 15 GENERATE
--    tlk_txd_obuf : ODDR
--    GENERIC MAP (
--      DDR_CLK_EDGE => "SAME_EDGE"
--    )
--    PORT MAP (
--      Q => TLK_TXD_PAD(I),
--      C => TLK_GTX_CLK,
--      CE => '1',
--      D1 => TLK_TXD(I),
--      D2 => TLK_TXD(I),
--      R => '0',
--      S => '0'
--    );
--    tlk_rxd_ibuf : IBUF
--    GENERIC MAP (
--      IOSTANDARD => "LVCMOS25"
--    )
--    PORT MAP (
--      I => TLK_RXD_PAD(I),
--      O => TLK_RXD(I)
--    );
--  END GENERATE;
--  tlk_gtx_clk_oddr : ODDR
--  GENERIC MAP (
--    DDR_CLK_EDGE => "SAME_EDGE"
--  )
--  PORT MAP (
--    Q => TLK_GTX_CLK_OBUF,
--    C => TLK_GTX_CLK,
--    CE => '1',
--    D1 => '0',
--    D2 => '1',   -- This makes an inverted output clock so that the TLK3101 samples on the rising edge.
--    R => '0',
--    S => '0'
--  );
--  tlk_gtx_clk_output_buffer : OBUF
--  GENERIC MAP (
--    IOSTANDARD => "LVCMOS25",
--    DRIVE => 24,
--    SLEW => "FAST"
--  )
--  PORT MAP (
--    I => TLK_GTX_CLK_OBUF,
--    O => TLK_GTX_CLK_PAD
--  );
--
--  tlk_txen_obuf : ODDR
--  GENERIC MAP (
--    DDR_CLK_EDGE => "SAME_EDGE"
--  )
--  PORT MAP (
--    Q => TLK_TXEN_PAD,
--    C => TLK_GTX_CLK,
--    CE => '1',
--    D1 => TLK_TXEN,
--    D2 => TLK_TXEN,
--    R => '0',
--    S => '0'
--  );
--  tlk_txer_obuf : ODDR
--  GENERIC MAP (
--    DDR_CLK_EDGE => "SAME_EDGE"
--  )
--  PORT MAP (
--    Q => TLK_TXER_PAD,
--    C => TLK_GTX_CLK,
--    CE => '1',
--    D1 => TLK_TXER,
--    D2 => TLK_TXER,
--    R => '0',
--    S => '0'
--  );
--
--  tlk_lckrefn_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_LCKREFN,
--    O => TLK_LCKREFN_PAD
--  );
--  tlk_prem_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_PREM,
--    O => TLK_PREM_PAD
--  );
--  tlk_enable_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_ENABLE,
--    O => TLK_ENABLE_PAD
--  );
--  tlk_loopen_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_LOOPEN,
--    O => TLK_LOOPEN_PAD
--  );
--  tlk_prbsen_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_PRBSEN,
--    O => TLK_PRBSEN_PAD
--  );
--  tlk_testen_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_TESTEN,
--    O => TLK_TESTEN_PAD
--  );
--  tlk_rxer_ibuf : IBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_RXER_PAD,
--    O => TLK_RXER
--  );
--  tlk_rxdv_ibuf : IBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_RXDV_PAD,
--    O => TLK_RXDV
--  );
--  tlk_rxclk_ibufg : IBUFG
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => TLK_RXCLK_PAD,
--    O => TLK_RXCLK
--  );
--  sfp_enablen_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => SFP_ENABLEN,
--    O => SFP_ENABLEN_PAD
--  );
--  sfp_txdis_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => SFP_TXDIS,
--    O => SFP_TXDIS_PAD
--  );
--  sfp_rs_obuf : OBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => SFP_RS,
--    O => SFP_RS_PAD
--  );
--  sfp_txfault_ibuf : IBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => SFP_TXFAULT_PAD,
--    O => SFP_TXFAULT
--  );
--  sfp_modabs_ibuf : IBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => SFP_MODABS_PAD,
--    O => SFP_MODABS
--  );
--  sfp_los_ibuf : IBUF
--  GENERIC MAP ( IOSTANDARD => "LVCMOS25" )
--  PORT MAP (
--    I => SFP_LOS_PAD,
--    O => SFP_LOS
--  );

  ext_bcoclk_ibuf : IBUFDS
  GENERIC MAP ( IOSTANDARD => "LVDS_25",
                DIFF_TERM => TRUE )
  PORT MAP (
    I => EXT_CLK_PAD_P,
    IB => EXT_CLK_PAD_N,
    O => EXT_CLK
  );
  ext_trig_ibuf : IBUFDS
  GENERIC MAP ( IOSTANDARD => "LVDS_25",
                DIFF_TERM => TRUE )
  PORT MAP (
    I => EXT_TRIG_PAD_P,
    IB => EXT_TRIG_PAD_N,
    O => EXT_CMD
  );

  ext_clk_oddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => ext_clk_out,
    c => ext_clk,
    ce => '1',
    d1 => '1',
    d2 => '0',
    s => '0',
    r => '0'
  );

  ext_clk_obuf : obufds
  generic map (
    iostandard => "LVDS_25"
  )
  port map (
    i => ext_clk_out,
    o => ext_clk_out_pad_p,
    ob => ext_clk_out_pad_n
  );

  ext_trig_oddr : oddr
  generic map (
    ddr_clk_edge => "SAME_EDGE"
  )
  port map (
    q => ext_trig_out,
    c => ext_clk,
    ce => '1',
    d1 => ext_cmd,
    d2 => ext_cmd,
    s => '0',
    r => '0'
  );

  ext_trig_obuf : obufds
  generic map (
    iostandard => "LVDS_25"
  )
  port map (
    i => ext_trig_out,
    o => ext_trig_out_pad_p,
    ob => ext_trig_out_pad_n
  );

  G_JUMPER : FOR I IN 0 TO 7 GENERATE
    jumper_ibuf : IBUF
    GENERIC MAP (
      IOSTANDARD => "LVCMOS25"
    )
    PORT MAP (
      I => JUMPER_PAD(I),
      O => JUMPERS(I)
    );
  END GENERATE;

--  Strip interface...
  strip_mclka0_obuf : OBUFDS
  GENERIC MAP ( IOSTANDARD => "LVDS_25" )
  PORT MAP (
    I => STRIP_MCLKA,
    O => STRIP_MCLKA0_PAD_P,
    OB => STRIP_MCLKA0_PAD_N
  );
  strip_mclkb0_obuf : OBUFDS
  GENERIC MAP ( IOSTANDARD => "LVDS_25" )
  PORT MAP (
    I => STRIP_MCLKB,
    O => STRIP_MCLKB0_PAD_P,
    OB => STRIP_MCLKB0_PAD_N
  );
  strip_mclka1_obuf : OBUFDS
  GENERIC MAP ( IOSTANDARD => "LVDS_25" )
  PORT MAP (
    I => STRIP_MCLKA,
    O => STRIP_MCLKA1_PAD_P,
    OB => STRIP_MCLKA1_PAD_N
  );
  strip_mclkb1_obuf : OBUFDS
  GENERIC MAP ( IOSTANDARD => "LVDS_25" )
  PORT MAP (
    I => STRIP_MCLKB,
    O => STRIP_MCLKB1_PAD_P,
    OB => STRIP_MCLKB1_PAD_N
  );

  S : FOR I IN 0 TO NSENSOR-1 GENERATE
    strip_reset_obuf : OBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25" )
    PORT MAP (
      I => STRIP_RESET(I),
      O => STRIP_RESET_PAD_P(I),
      OB => STRIP_RESET_PAD_N(I)
    );
    strip_shift_obuf : OBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25" )
    PORT MAP (
      I => STRIP_SHIFT(I),
      O => STRIP_SHIFT_PAD_P(I),
      OB => STRIP_SHIFT_PAD_N(I)
    );
    strip_scout_obuf : OBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25" )
    PORT MAP (
      I => STRIP_SCIN(I),
      O => STRIP_SCIN_PAD_P(I),
      OB => STRIP_SCIN_PAD_N(I)
    );
    strip_bcoclk_obuf : OBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25" )
    PORT MAP (
      I => STRIP_BCOCLK(I),
      O => STRIP_BCOCLK_PAD_P(I),
      OB => STRIP_BCOCLK_PAD_N(I)
    );

    strip_scout_ibuf : IBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25",
                  DIFF_TERM => TRUE )
    PORT MAP (
      I => STRIP_SCOUT_PAD_P(I),
      IB => STRIP_SCOUT_PAD_N(I),
      O => STRIP_SCOUT(I)
    );
    strip_out1_0_ibuf : IBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25",
                  DIFF_TERM => TRUE )
    PORT MAP (
      I => STRIP_OUT1_0_PAD_P(I),
      IB => STRIP_OUT1_0_PAD_N(I),
      O => STRIP_OUT1_0(I)
    );
    strip_out1_1_ibuf : IBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25",
                  DIFF_TERM => TRUE )
    PORT MAP (
      I => STRIP_OUT1_1_PAD_P(I),
      IB => STRIP_OUT1_1_PAD_N(I),
      O => STRIP_OUT1_1(I)
    );
    strip_out1_2_ibuf : IBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25",
                  DIFF_TERM => TRUE )
    PORT MAP (
      I => STRIP_OUT1_2_PAD_P(I),
      IB => STRIP_OUT1_2_PAD_N(I),
      O => STRIP_OUT1_2(I)
    );
    strip_out1_3_ibuf : IBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25",
                  DIFF_TERM => TRUE )
    PORT MAP (
      I => STRIP_OUT1_3_PAD_P(I),
      IB => STRIP_OUT1_3_PAD_N(I),
      O => STRIP_OUT1_3(I)
    );
    strip_out1_4_ibuf : IBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25",
                  DIFF_TERM => TRUE )
    PORT MAP (
      I => STRIP_OUT1_4_PAD_P(I),
      IB => STRIP_OUT1_4_PAD_N(I),
      O => STRIP_OUT1_4(I)
    );

    hitor_ibuf : IBUFDS
    GENERIC MAP ( IOSTANDARD => "LVDS_25",
                  DIFF_TERM => TRUE )
    PORT MAP (
      I => STRIP_GOTHITOR_PAD_P(I),
      IB => STRIP_GOTHITOR_PAD_N(I),
      O => STRIP_HITOR(I)
    );

  END GENERATE;
  dac_sdi_obuf : OBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => STRIP_DAC_SDI,
    O => STRIP_DAC_SDI_PAD
  );
  dac_sclk_obuf : OBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => STRIP_DAC_SCLK,
    O => STRIP_DAC_SCLK_PAD
  );
  dac_sdo_ibuf : IBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => STRIP_DAC_SDO_PAD,
    O => STRIP_DAC_SDO
  );
  dac_reset_obuf : OBUF
  GENERIC MAP (
    IOSTANDARD => "LVCMOS25"
  )
  PORT MAP (
    I => NOT STRIP_DAC_RESET,
    O => STRIP_DAC_RESET_PAD
  );
  DACBUS : FOR I IN 0 TO 11 GENERATE
    dac_busa_obuf : ODDR
    PORT MAP (
      Q => STRIP_DAC_BUSAB_PAD(I),
      C => STRIP_DAC_DATACLK,
      CE => '1',
      D1 => STRIP_DAC_BUSAB(I),
      D2 => STRIP_DAC_BUSAB(I),
      R => '0',
      S => '0'
    );
  END GENERATE;
  DATACLK : FOR I IN 0 TO 3 GENERATE
    dac_dataclk_obuf : ODDR
    PORT MAP (
      Q => STRIP_DAC_DATACLK_PAD(I),
      C => STRIP_DAC_DATACLK,
      CE => '1',
      D1 => '0',
      D2 => '1',
      R => '0',
      S => '0'
    );
  END GENERATE;
  
  DACCLK : FOR I IN 0 TO 3 GENERATE
    dac_clk_obuf : OBUFDS
    GENERIC MAP (
      IOSTANDARD => "LVDS_25"
    )
    PORT MAP (
      I => STRIP_DAC_CLK,
      O => STRIP_DAC_CLK_PAD_P(I),
      OB => STRIP_DAC_CLK_PAD_N(I)
    );
  END GENERATE;

--  Other interfaces...

  LED(1) <= '1';

  --trigger_debug <= strip_bcoclk(0) & "00" & halt & start & trigger & ext_cmd & ext_clk;
  --debug_port <= trigger_debug when strip_debug_select = '0' else strip_debug;

end RTL;
