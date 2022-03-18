library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.std_logic_misc.ALL;

library UNISIM;
use UNISIM.Vcomponents.ALL;

use work.iobus.ALL;

entity top is
	GENERIC ( NSENSOR_PADS : INTEGER := 6 );
   port ( 
		PHY_RXCLK      : in    std_logic; 
		PHY_RXCTL_RXDV : in    std_logic; 
	PHY_RXD0	: in    std_logic; 
	PHY_RXD1	: in    std_logic; 
	PHY_RXD2	: in    std_logic; 
	PHY_RXD3	: in    std_logic; 
	PHY_RXD4	: in    std_logic; 
	PHY_RXD5	: in    std_logic; 
	PHY_RXD6	: in    std_logic; 
	PHY_RXD7	: in    std_logic; 
		  
		--PHY_RXER     : in    std_logic; 
	USER_CLOCK   : in    std_logic; 
          
	PHY_RESET	: out    std_logic; 
		
		PHY_TXCTL_TXEN : out   std_logic; 
	PHY_TXD0	: out   std_logic; 
	PHY_TXD1	: out   std_logic; 
	PHY_TXD2	: out   std_logic; 
	PHY_TXD3	: out   std_logic;
	PHY_TXD4	: out   std_logic; 
	PHY_TXD5	: out   std_logic; 
	PHY_TXD6	: out   std_logic; 
	PHY_TXD7	: out   std_logic; 
	PHY_TXER	: out   std_logic;
						  
		PHY_TXC_GTXCLK : out   std_logic;
          
    EXT_CLK_PAD_P : IN STD_LOGIC;
    EXT_CLK_PAD_N : IN STD_LOGIC;
    EXT_TRIG_PAD_P : IN STD_LOGIC;
    EXT_TRIG_PAD_N : IN STD_LOGIC;
    
    STRIP_RESET_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_RESET_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_SHIFT_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_SHIFT_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_SCIN_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0); 
    STRIP_SCIN_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_SCOUT_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0); 
    STRIP_SCOUT_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_BCOCLK_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_BCOCLK_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_MCLKA_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_MCLKA_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_MCLKB_PAD_P : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_MCLKB_PAD_N : OUT STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_0_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_0_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_1_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_1_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_2_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_2_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_3_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_3_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_4_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_OUT1_4_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_GOTHITOR_PAD_P : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0);
    STRIP_GOTHITOR_PAD_N : IN STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0)
              
          ); 
end top;

architecture BEHAVIORAL of top is
  
    
    attribute BOX_TYPE     : string ;
    attribute IOSTANDARD   : string ;
    attribute CAPACITANCE  : string ;
    attribute SLEW         : string ;
    attribute DRIVE        : string ;
    attribute IBUF_LOW_PWR : string ;
    
    
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
    
     signal fifo_b_data_in : std_logic_vector(35 downto 0);
     signal fifo_b_data_out : std_logic_vector(35 downto 0);
     signal fifo_b_data_EMPTY, fifo_b_data_re : std_logic;
     
     
    signal b_data                   : std_logic_vector (63 downto 0);
    signal b_data_we                : std_logic;
    signal GMII_RXD_0_sig           : std_logic_vector (7 downto 0);
    signal GMII_RX_DV_0_sig         : std_logic;
    signal GMII_RX_ER_0_sig         : std_logic;
    signal GTX_CLK_0_sig            : std_logic;
    signal MASTER_CLK               : std_logic;
    signal CLK15NS, CLK15NS_sig     : std_logic;   
    signal USER_CLK                 : std_logic;                                
    
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
    SIGNAL STRIP_RESET, strip_reset_sig : STD_LOGIC_VECTOR(NSENSOR_PADS-1 DOWNTO 0); --RAR
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
    
    attribute mark_debug : string;
    attribute mark_debug of MASTER_CLK : signal is "true";
    --attribute mark_debug of secondary_clk : signal is "true";
    attribute mark_debug of PHY_TXD_sig : signal is "true";
    attribute mark_debug of PHY_TXEN_sig : signal is "true";
    attribute mark_debug of rx_wren : signal is "true";
    attribute mark_debug of CLK15NS : signal is "true";
    
    
--    attribute mark_debug of STRIP_OUT1_0 : signal is "true";
--    attribute mark_debug of STRIP_OUT1_1 : signal is "true";
--    attribute mark_debug of STRIP_OUT1_2 : signal is "true";
--    attribute mark_debug of STRIP_OUT1_3 : signal is "true";
--    attribute mark_debug of STRIP_OUT1_4 : signal is "true";    
    
    attribute mark_debug of STRIP_SCIN : signal is "true";
    attribute mark_debug of STRIP_SCOUT : signal is "true";
    attribute mark_debug of STRIP_RESET : signal is "true";
    attribute mark_debug of STRIP_SHIFT : signal is "true";
    attribute mark_debug of STRIP_DATA_AVAILABLE : signal is "true";
    
    attribute mark_debug of STRIP_SYNC_ERROR : signal is "true";
    attribute mark_debug of STRIP_BCO_ZERO : signal is "true";
    attribute mark_debug of STRIP_HITOR : signal is "true";
    
    attribute mark_debug of rx_addr : signal is "true";
    attribute mark_debug of tx_data : signal is "true";
    attribute mark_debug of rx_data : signal is "true";
    attribute mark_debug of b_data : signal is "true";
    attribute mark_debug of b_data_we : signal is "true";
    
    
        
    attribute mark_debug of b_data_alert : signal is "true";
    
    
    
        --    attribute mark_debug of GMII_RXD_0_sig : signal is "true";
        --    attribute mark_debug of GMII_RX_DV_0_sig : signal is "true";
        --    attribute mark_debug of rx_addr : signal is "true";
        --    attribute mark_debug of rx_data : signal is "true";
       
   
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component IBUFG
      -- synopsys translate_off
      generic( IBUF_LOW_PWR : boolean :=  TRUE);
      -- synopsys translate_on
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute IBUF_LOW_PWR of IBUFG : component is "TRUE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
     
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   
   
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


	COMPONENT divide_ext_clk_by2
		Port ( 
			ext_clk_by2 : out STD_LOGIC;
			locked : out STD_LOGIC;
			ext_clk : in STD_LOGIC
		);
	END COMPONENT;
   
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
    --signal ext_trig_cnt : unsigned(9 downto 0) := (others => '0');
    signal ext_clk_by2 : std_logic;
    signal TRIGGER_latch : std_logic := '0';
    signal HALT_latch : std_logic := '0';
    signal START_latch : std_logic := '0';
    signal TRIGGER_long : std_logic := '0';
    signal HALT_long : std_logic := '0';
    signal START_long : std_logic := '0';
    
    signal b_throttle_reset, fifo_reset : std_logic;
            
    signal b_data_stack : std_logic_vector(63 downto 0);
    signal b_data_stack_state : std_logic_vector(3 downto 0) := (others => '0');
    signal bco_cnt_out : std_logic_vector(47 downto 0);   -- bco counter
    
    signal ext_clock_by2_is_locked : std_logic;
    signal start_alternative : std_logic := '0';

    attribute mark_debug of strip_ready : signal is "true";
    attribute mark_debug of tx_rden : signal is "true";
    attribute mark_debug of eth_strobe_mask : signal is "true";
    attribute mark_debug of masked_tx_rden : signal is "true";
    attribute mark_debug of masked_rx_wren : signal is "true";
    attribute mark_debug of ext_clk : signal is "true";
    attribute mark_debug of EXT_CMD : signal is "true";
    attribute mark_debug of HALT : signal is "true";
    attribute mark_debug of START : signal is "true";
    attribute mark_debug of TRIGGER : signal is "true";
    attribute mark_debug of strip_clocks_locked : signal is "true";
    attribute mark_debug of strip_bwe : signal is "true";
    attribute mark_debug of b_data_cnt : signal is "true";
        
	
    attribute mark_debug of HALT_long : signal is "true";
    attribute mark_debug of START_long : signal is "true";
    attribute mark_debug of TRIGGER_long : signal is "true";
    attribute mark_debug of ext_clock_by2_is_locked : signal is "true";
    
   
begin

    -- process to create delayed ready to each write and read
    strip_ready_and <= strip_ready;
    process(MASTER_CLK)
    begin
        if rising_edge(MASTER_CLK) then
            
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
    
    fifo_reset <= reset or b_throttle_reset;
    
	reset_n <= not reset;
	reset_btn <= '0';

	--	reset_ibuf : IBUF       -- SW3 on board is active high
	--     port map (I=>GPIO_SW_W,  O=>reset_btn);
	--   user_led1: OBUF   -- LED display of RESET
	--      port map (I=>reset,    O=>PZ_ULED_1);        
      
   
	-- start simple OEI
	eth_interface : entity work.Ethernet_Interface
	  port map (b_data(63 downto 0)=>b_data(63 downto 0),
				b_data_we=>b_data_we,--bwe_and,--b_data_we,
				PHY_RXD(7 downto 0)=>GMII_RXD_0_sig(7 downto 0),
				PHY_RX_DV=>GMII_RX_DV_0_sig,
				PHY_RX_ER=>GMII_RX_ER_0_sig,
				MASTER_CLK=>MASTER_CLK,                
				reset_in=>reset_btn,   
                user_clk=>USER_CLK,   
				user_ready=>strip_ready_and, --strip_ready				
                tx_rden=>tx_rden,
				reset_out => reset,
				b_throttle_reset => b_throttle_reset,
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

     



--  clk15ns_bufr_div_inst : BUFR
--  generic map (
--     BUFR_DIVIDE => "2",   -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
--     SIM_DEVICE => "7SERIES"  -- Must be set to "7SERIES" 
--  )
--  port map (
--     O => CLK15NS,     -- 1-bit output: Clock output port
--     CE => '1',   -- 1-bit input: Active high, clock enable (Divided modes only)
--     CLR => '0', -- 1-bit input: Active high, asynchronous clear (Divided modes only)
--     I => MASTER_CLK      -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
--     );
	   
	   makeSlowClock : for i in 0 to 0 generate
	        signal cnt : unsigned(4 downto 0) := (others => '0');
	   begin
	        secondary_clk_sig <= cnt(4); -- 32 times slower clock than MASTER_CLK 
	        CLK15NS_sig <= cnt(0); -- 2 times slower clock than MASTER_CLK
	        process(MASTER_CLK)
	        begin
	            if (rising_edge(MASTER_CLK)) then
	                cnt <= cnt + 1;        
	            end if;
	        end process;   
	   end generate;
	   
	   CLK5MHz_bufg : BUFG
	      port map (I=>secondary_clk_sig,  O=>secondary_clk);
	      
	   CLK15NS_bufg : BUFG
	    port map (I=>CLK15NS_sig,  O=>CLK15NS);
	      

	      
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
	
	
		process(MASTER_CLK)
		begin
		  if (rising_edge(MASTER_CLK)) then
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
		 RST => fifo_reset,
		 WR_CLK => STRIP_MCLKA,
		 RD_CLK => MASTER_CLK,--GMII_RXCLK,
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
	
	                
	    strip_imp : entity work.strip_interface
	     GENERIC MAP ( NSENSOR => NSENSOR_PADS )
	     PORT MAP (
	       CLK => MASTER_CLK,--CLK15NS,
	       IOBUS => iobus, --SLAVE_IOBUS(3),
	       WRITE_DATA => strip_tx_data, --tx_data(31 downto 0), --SLAVE_WRITE_DATA(3),
	       IOBUS_READY => open, --SLAVE_READY(3),
	       CLKX => CLK15NS,
	       CLKY => secondary_clk,--CLK5MHZ,
	       EXT_CLK => ext_clk_by2, --ext_clk,--EXT_CLK,
	       EXT_TRIG => TRIGGER_long,--ext_trig_strobe,--TRIGGER,
	       EXT_HALT => HALT_long,--gnd,--HALT,
	       EXT_START => START_long,--gnd,--START,
	       DAC_CS => open,--STRIP_DAC_CS,
	       DAC_SDI => open,--STRIP_DAC_SDI,
	       DAC_SDO => gnd,--STRIP_DAC_SDO,
	       DAC_SCLK => open,--STRIP_DAC_SCLK,
	       DAC_RESET => open,--STRIP_DAC_RESET,
	       DAC_BUSAB => open,--STRIP_DAC_BUSAB,
	       DAC_CLK => open,--STRIP_DAC_CLK,
	       DAC_DATACLK => open,--STRIP_DAC_DATACLK,
	       clocks_locked => strip_clocks_locked,
	       something_busy => strip_busy,
	       MCLKA => STRIP_MCLKA,
	       MCLKB => STRIP_MCLKB,
	       BCOCLK => STRIP_BCOCLK,
         bco_cnt_out => bco_cnt_out, --RAR
         STRIP_RESET => strip_reset_sig,--STRIP_RESET,
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
	       STREAM_RCLK => MASTER_CLK,--GMII_RXCLK,
	       STREAM_READ_ENABLE => gnd,--STREAM_READ_ENABLE,
	       STREAM_DOUT => open,--STREAM_DOUT,
	       STREAM_LENGTH => open,--STREAM_LENGTH,
	       STREAM_CKSUM => open,--STREAM_CKSUM,
	       STREAM_STROBE => open,--STREAM_STROBE,
	       STREAM_READY => gnd,--STREAM_READY,
	       SERDES_DATA => fifo_b_data_in(31 downto 0),-- b_data(31 downto 0),--SERDES_STRIP_DATA,
	       SERDES_DATA_WE => strip_bwe,--SERDES_STRIP_DATA_WE,
	       STRIP_DEBUG => open,--STRIP_DEBUG,
	       DEBUG_SELECT => open--STRIP_DEBUG_SELECT
	     );
	     
	 -- handle external trigger
	 
      trigpattern_imp : trigpattern
      GENERIC MAP (
        PATTERN => "00111",
        CLOCK_EDGE => "FALLING",
        WIDTH => 1
      )
      PORT MAP (
        CLK => EXT_CLK,
        D => EXT_CMD,
        TRIGGER => TRIGGER
      );
       
	  TRIGGER_long     	<= TRIGGER or TRIGGER_latch;
	  HALT_long      	<= HALT or HALT_latch;
	  START_long      	<= START or START_latch or start_alternative;
       
        -- Missing triggers from NIM+ so trying to simplify
        simple_trigger_gen : if TRUE generate
            signal hi_count : unsigned(2 downto 0) := (others => '1');
            signal cmd_latch,cmd_latch2 :std_logic;    
        begin
        
        
           simple_trigger_proc : process(EXT_CLK)
           begin
           
                if (rising_edge(EXT_CLK)) then
                
                    cmd_latch       <= EXT_CMD;
                    cmd_latch2      <= cmd_latch;

                    TRIGGER_latch      	<= TRIGGER;
                    HALT_latch      	<= HALT;
                    START_latch      	<= START or start_alternative;

                    
                    -- TRIGGER         <= '0';
                    
                    -- if (cmd_latch2 = '0' and cmd_latch = '1') then 
                    --     hi_count <= (others => '0'); --reset
                    -- elsif(cmd_latch = '1') then
                    
                    --     if(hi_count = 2) then
                    --         TRIGGER <= '1';
                    --     end if;
                    
                    --     if(hi_count < "111") then 
                    --         hi_count <= hi_count + 1;
                    --     end if;
                    -- else
                    --     hi_count <= (others => '1'); --no signal
                    -- end if;
                end if;
           end process simple_trigger_proc;
        end generate simple_trigger_gen;
     
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

	   startpattern_imp_alt : trigpattern
       GENERIC MAP (
         PATTERN => "01101",
         CLOCK_EDGE => "RISING",
         WIDTH => 4
       )
       PORT MAP (
         CLK => EXT_CLK,
         D => EXT_CMD,
         TRIGGER => start_alternative
       );
     
    --    haltpattern_imp : trigpattern
    --    GENERIC MAP (
    --      PATTERN => "00111",
    --      CLOCK_EDGE => "FALLING",
    --      WIDTH => 2
    --    )
    --    PORT MAP (
    --      CLK => EXT_CLK,
    --      D => EXT_CMD,
    --      TRIGGER => HALT
    --    );
	   HALT <= '0';
   
    -----------------------
    ----------------------- IBUF 's 
    
     IBUF_PHY_RXDV : IBUF       port map (I=>PHY_RXCTL_RXDV,  O=>GMII_RX_DV_0_sig);
      
--removed by script (others => '0'); -- for RGMII or SGMII
     
	IBUF_PHY_RXD7 : IBUF        port map (I=>PHY_RXD7, O=>GMII_RXD_0_sig(7));	  
	IBUF_PHY_RXD6 : IBUF        port map (I=>PHY_RXD6, O=>GMII_RXD_0_sig(6));	  
	IBUF_PHY_RXD5 : IBUF        port map (I=>PHY_RXD5, O=>GMII_RXD_0_sig(5)); 	  
	IBUF_PHY_RXD4 : IBUF        port map (I=>PHY_RXD4, O=>GMII_RXD_0_sig(4));
	IBUF_PHY_RXD3 : IBUF        port map (I=>PHY_RXD3, O=>GMII_RXD_0_sig(3));
	IBUF_PHY_RXD2 : IBUF        port map (I=>PHY_RXD2, O=>GMII_RXD_0_sig(2));
	IBUF_PHY_RXD1 : IBUF        port map (I=>PHY_RXD1, O=>GMII_RXD_0_sig(1));
	IBUF_PHY_RXD0 : IBUF        port map (I=>PHY_RXD0, O=>GMII_RXD_0_sig(0));   
     
     GMII_RX_ER_0_sig <= '0';
     
     IBUF_PHY_RXCLK : BUFG      port map (I=>PHY_RXCLK,  O=>MASTER_CLK);
     IBUF_USER_CLK : IBUFG      port map (I=>USER_CLOCK, O=>USER_CLK);
        
    -----------------------
    ----------------------- OBUF 's 
    	 
	--OBUF_PHY_RESET : OBUF	   port map (I=>'1',  O=>PHY_RESET); --hold not reset
    OBUF_PHY_RESET : OBUF       port map (I=>reset_n,  O=>PHY_RESET);
		 
	OBUF_PHY_TXER : OBUF       port map (I=>PHY_TXER_sig,  O=>PHY_TXER);
	 
    OBUF_PHY_TXEN : OBUF       port map (I=>PHY_TXEN_sig,  O=>PHY_TXCTL_TXEN);
    
    OBUF_PHY_TXCLK : OBUF      port map (I=>GTX_CLK_0_sig, O=>PHY_TXC_GTXCLK);
    
	OBUF_PHY_TXD7 : OBUF   	   port map (I=>PHY_TXD_sig(7), O=>PHY_TXD7);    
	OBUF_PHY_TXD6 : OBUF       port map (I=>PHY_TXD_sig(6), O=>PHY_TXD6);    
	OBUF_PHY_TXD5 : OBUF       port map (I=>PHY_TXD_sig(5), O=>PHY_TXD5);    
	OBUF_PHY_TXD4 : OBUF       port map (I=>PHY_TXD_sig(4), O=>PHY_TXD4);    
	OBUF_PHY_TXD3 : OBUF       port map (I=>PHY_TXD_sig(3), O=>PHY_TXD3);    
	OBUF_PHY_TXD2 : OBUF       port map (I=>PHY_TXD_sig(2), O=>PHY_TXD2);    
	OBUF_PHY_TXD1 : OBUF       port map (I=>PHY_TXD_sig(1), O=>PHY_TXD1);    
	OBUF_PHY_TXD0 : OBUF       port map (I=>PHY_TXD_sig(0), O=>PHY_TXD0);
           
           
    -----------------------
       ----------------------- Strip Pad O/I BUFs 
       ext_bcoclk_ibuf : IBUFDS
           GENERIC MAP ( IOSTANDARD => "LVDS_25",
                         DIFF_TERM => TRUE )
           PORT MAP (
             I => EXT_CLK_PAD_P,
             IB => EXT_CLK_PAD_N,
             O => EXT_CLK_input
           );
           
			ext_bcoclk_bufg : bufg    
				port map (
				i => EXT_CLK_input,
				o => EXT_CLK
				);

				

		divide_ext_clk_by2_inst : divide_ext_clk_by2
		Port map ( 
			ext_clk_by2 => ext_clk_by2, -- : out STD_LOGIC;
			locked => ext_clock_by2_is_locked, --: out STD_LOGIC;
			ext_clk => EXT_CLK -- : in STD_LOGIC
		);
		       
       
       ext_trig_ibuf : IBUFDS
           GENERIC MAP ( IOSTANDARD => "LVDS_25",
                         DIFF_TERM => TRUE )
           PORT MAP (
             I => EXT_TRIG_PAD_P,
             IB => EXT_TRIG_PAD_N,
             O => EXT_CMD
           );
       
       
        
       strip_pad_gen : FOR I IN 0 TO NSENSOR_PADS-1 GENERATE
       
            STRIP_RESET(I) <= b_throttle_reset or strip_reset_sig(i); --RAR
       

            strip_mclka_obuf : OBUFDS
            GENERIC MAP ( IOSTANDARD => "LVDS_25" )
            PORT MAP (
              I => STRIP_MCLKA,
              O => STRIP_MCLKA_PAD_P(I),
              OB => STRIP_MCLKA_PAD_N(I)
            );
            strip_mclkb_obuf : OBUFDS
            GENERIC MAP ( IOSTANDARD => "LVDS_25" )
            PORT MAP (
              I => STRIP_MCLKB,
              O => STRIP_MCLKB_PAD_P(I),
              OB => STRIP_MCLKB_PAD_N(I)
            );
            

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
       -----------------------
          ----------------------- Strip Pad O/I BUFs end
       
end BEHAVIORAL;

