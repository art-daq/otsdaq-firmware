library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.std_logic_misc.ALL;

library UNISIM;
use UNISIM.Vcomponents.ALL;

library unimacro;
use unimacro.vcomponents.all;

entity top is
   port ( 
        NIM_COM0_P    : in    std_logic; -- Input signal port 0
        NIM_COM0_N    : in    std_logic;
        NIM_COM1_P    : in    std_logic; -- Input signal port 1 
        NIM_COM1_N    : in    std_logic;
        NIM_COM2_P    : in    std_logic; -- Input signal port 2
        NIM_COM2_N    : in    std_logic;
        NIM_COM3_P    : in    std_logic; -- Input signal port 3
        NIM_COM3_N    : in    std_logic;
        
        NIM_OUT0_P     : out   std_logic; -- Output signal port 0 muxout 1
        NIM_OUT0_N     : out   std_logic;
        
        NIM_OUT1_P     : out   std_logic; -- Output signal port 1 muxout 2
        NIM_OUT1_N     : out   std_logic;   
        
        NIM_OUT2_P     : out   std_logic; -- Output signal port 0 muxout 3
        NIM_OUT2_N     : out   std_logic;
        
        NIM_OUT3_P     : out   std_logic; -- Output signal port 1 muxout 4
        NIM_OUT3_N     : out   std_logic;
        
        BKPRSA_P     : in   std_logic; -- Back pressure input
        BKPRSA_N     : in   std_logic;
        
        BKPRSB_P     : in   std_logic; -- Back pressure input
        BKPRSB_N     : in   std_logic;
        
        TRIGA_CMS_OUT_P : out   std_logic;
        TRIGA_CMS_OUT_N : out   std_logic;
        
        TRIGB_CMS_OUT_P : out   std_logic;
        TRIGB_CMS_OUT_N : out   std_logic;
        
TRIG53_0_P : out std_logic;
TRIG53_0_N : out std_logic;        

TRIG53_1_P : out std_logic;
TRIG53_1_N : out std_logic; 

TRIG53_2_P : out std_logic;
TRIG53_2_N : out std_logic; 

TRIG53_3_P : out std_logic;
TRIG53_3_N : out std_logic; 

TRIG53_4_P : out std_logic;
TRIG53_4_N : out std_logic; 

TRIG53_5_P : out std_logic;
TRIG53_5_N : out std_logic; 

TRIG53_6_P : out std_logic;
TRIG53_6_N : out std_logic; 

TRIG53_7_P : out std_logic;
TRIG53_7_N : out std_logic; 

TRIG53_8_P : out std_logic;
TRIG53_8_N : out std_logic; 

TRIG53_9_P : out std_logic;
TRIG53_9_N : out std_logic; 

TRIG53_10_P : out std_logic;
TRIG53_10_N : out std_logic; 

TRIG53_11_P : out std_logic;
TRIG53_11_N : out std_logic; 

TRIG40_0_P : out std_logic;
TRIG40_0_N : out std_logic; 

TRIG40_1_P : out std_logic;
TRIG40_1_N : out std_logic;

TRIG40_2_P : out std_logic;
TRIG40_2_N : out std_logic;

TRIG40_3_P : out std_logic;
TRIG40_3_N : out std_logic;

TRIG40_4_P : out std_logic;
TRIG40_4_N : out std_logic;

TRIG40_5_P : out std_logic;
TRIG40_5_N : out std_logic;

CLCK53_0_P : out std_logic;
CLCK53_0_N : out std_logic;

CLCK53_1_P : out std_logic;
CLCK53_1_N : out std_logic;

CLCK53_2_P : out std_logic;
CLCK53_2_N : out std_logic;

CLCK53_3_P : out std_logic;
CLCK53_3_N : out std_logic;

CLCK53_4_P : out std_logic;
CLCK53_4_N : out std_logic;

CLCK53_5_P : out std_logic;
CLCK53_5_N : out std_logic;

CLCK53_6_P : out std_logic;
CLCK53_6_N : out std_logic;

CLCK53_7_P : out std_logic;
CLCK53_7_N : out std_logic;

CLCK53_8_P : out std_logic;
CLCK53_8_N : out std_logic;

CLCK53_9_P : out std_logic;
CLCK53_9_N : out std_logic;

CLCK53_10_P : out std_logic;
CLCK53_10_N : out std_logic;

CLCK53_11_P : out std_logic;
CLCK53_11_N : out std_logic;

CLCK40_0_P : out std_logic;
CLCK40_0_N : out std_logic;

CLCK40_1_P : out std_logic;
CLCK40_1_N : out std_logic;

CLCK40_2_P : out std_logic;
CLCK40_2_N : out std_logic;

CLCK40_3_P : out std_logic;
CLCK40_3_N : out std_logic;

CLCK40_4_P : out std_logic;
CLCK40_4_N : out std_logic;

CLCK40_5_P : out std_logic;
CLCK40_5_N : out std_logic;
--        TRIG_CMS1_OUT_P : out   std_logic;
--        TRIG_CMS1_OUT_N : out   std_logic;
        
--        CLK40_LEM_P : out   std_logic;
--        CLK40_LEM_N : out   std_logic;
        
        CLK40A_OUT_P : out   std_logic;
        CLK40A_OUT_N : out   std_logic;
        
        CLK40B_OUT_P : out   std_logic;
        CLK40B_OUT_N : out   std_logic;
        
--        CLK40_IN_EXT_P : in std_logic;
--        CLK40_IN_EXT_N : in std_logic;

        CLK25_6_IN_EXT_P : in std_logic;
        CLK25_6_IN_EXT_N : in std_logic;
        
        DAC_SER_CLK    : out   std_logic; -- DAC Programming interface clock
        DAC_NSYNC      : out   std_logic; -- DAC Programming interface sync
        DAC_DIN        : out   std_logic; -- DAC Programming interface data
        
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
          
	PHY_RESET	: out    std_logic; -- Commented out for now
		
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
						  
		PHY_TXC_GTXCLK : out   std_logic
          
              
          ); 
end top;

architecture BEHAVIORAL of top is
  
    
    attribute BOX_TYPE     : string ;
    attribute IOSTANDARD   : string ;
    attribute CAPACITANCE  : string ;
    attribute SLEW         : string ;
    attribute DRIVE        : string ;
    attribute IBUF_LOW_PWR : string ;
    
    signal b_data                   : std_logic_vector (63 downto 0);
    signal b_data_we                : std_logic;
    signal GMII_RXD_0_sig           : std_logic_vector (7 downto 0);
    signal GMII_RX_DV_0_sig         : std_logic;
    signal GMII_RX_ER_0_sig         : std_logic;
    signal GTX_CLK_0_sig            : std_logic; 
    signal MASTER_CLK               : std_logic;
    signal USER_CLK                 : std_logic;
   -- signal CLK15NS, CLK15NS_sig     : std_logic;                                   
   
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
  --  signal secondary_clk, secondary_clk_sig       : std_logic;
    signal tx_data                  : std_logic_vector (63 downto 0);
    signal nim_input                  : std_logic_vector (3 downto 0);
    
    signal s_nim_out0                  : std_logic;
    signal s_nim_out1                  : std_logic;
    signal s_nim_out2                  : std_logic;
    signal s_nim_out3                  : std_logic;
    
    signal pg_out                   : std_logic;
    signal dac_sclk_sig             : std_logic;
    signal dac_din_sig              : std_logic;
    signal dac_sync_sig             : std_logic;
    
--    signal nim_clk_0                : std_logic; -- outputs of clock generator IP

    signal nim_dac_clk              : std_logic;
    
    signal nim_clk_lock             : std_logic; -- PLL Lock indicator
    
    signal b_nim_clk0               : std_logic; -- outputs of BUFG resources for distribution

    signal b_nim_dac_clk            : std_logic;
    
--    signal sampclk_sig              : std_logic;
--    signal b_sampclk_sig              : std_logic;
    signal fs_gen_lock              : std_logic;
    signal ei40_gen_lock : std_logic;
       
    
    signal s_bkpressa : std_logic;
    signal s_bkpressb : std_logic;
    
  --  signal s_trig_cms : std_logic;

    
 --   signal s_trig_cms1 : std_logic;
  --  signal s_trig_cms2 : std_logic;
    
    signal s_b_wr_out : std_logic;
    signal s_b_read : std_logic_vector (63 downto 0);
    signal s_trig_40 : STD_LOGIC_VECTOR(5 downto 0);
    signal s_trig_53 : STD_LOGIC_VECTOR(11 downto 0);
    
    
    signal selected_ext_clkg : std_logic;
 --
 --   

    
    signal s_clk40e  : std_logic;
--    signal s_clk320e : std_logic;
    signal bs_clk40e  : std_logic;
    signal bs_clk320e : std_logic;
    
--    signal s_clk40i  : std_logic;
--    signal s_clk320i : std_logic;
    signal bs_clk40i  : std_logic;
    signal bs_clk320i : std_logic;
    
    signal mx_320 : std_logic;
    signal mx_40 : std_logic;
    signal bmx_320 : std_logic;
    signal bmx_40 : std_logic;
    
    signal sigclk_1325 : std_logic;
    signal sigclk_265 : std_logic;
    signal s_clk25_6e : std_logic;   
    signal sigclk_53: std_logic;
    
    
--    signal bclk_1325 : std_logic;
--    signal bclk_265 : std_logic;
    
    signal s_ck_mx_out : std_logic_vector(7 downto 0);
 
    signal extra_clk_reset : std_logic_vector(3 downto 0) := (others => '0');
    signal extra_clk_reset_OR : std_logic_vector(3 downto 0) := (others => '0');

    signal ot_ps_ctrl : std_logic_vector(1 downto 0) := (others => '0');        
        
     signal ot_ps_lock,bmx_40_adj : std_logic;
                 
    signal read_out_data            : std_logic_vector (63 downto 0);   
      
    signal fs_gen_lock_latch, ei40_gen_lock_latch, ot_ps_lock_latch, nim_clk_lock_latch : std_logic_vector(1 downto 0) := (others => '0');
    signal fs_gen_lock_loss, ei40_gen_lock_loss, ot_ps_lock_loss, nim_clk_lock_loss : std_logic := '0';
      
     
   
    attribute mark_debug : string;
    attribute mark_debug of MASTER_CLK : signal is "true";
    attribute mark_debug of selected_ext_clkg : signal is "true";
    
    attribute mark_debug of bmx_40 : signal is "true";
--    --attribute mark_debug of mx_40 : signal is "true";
    attribute mark_debug of bs_clk40i : signal is "true";
    attribute mark_debug of bs_clk40e : signal is "true";
    attribute mark_debug of extra_clk_reset_OR : signal is "true";
    
    attribute mark_debug of fs_gen_lock : signal is "true";
    attribute mark_debug of nim_clk_lock : signal is "true";
    attribute mark_debug of ot_ps_lock : signal is "true";
    attribute mark_debug of ei40_gen_lock : signal is "true";
        attribute mark_debug of fs_gen_lock_loss : signal is "true";
        attribute mark_debug of nim_clk_lock_loss : signal is "true";
        attribute mark_debug of ot_ps_lock_loss : signal is "true";
        attribute mark_debug of ei40_gen_lock_loss : signal is "true";
    
--    attribute mark_debug of reset : signal is "true";
--    --attribute mark_debug of s_clk40e : signal is "true";
--    attribute mark_debug of s_ck_mx_out : signal is "true";
    attribute mark_debug of nim_input : signal is "true";    

    attribute mark_debug of s_nim_out0 : signal is "true";
    attribute mark_debug of s_nim_out1 : signal is "true";
    attribute mark_debug of s_nim_out2 : signal is "true";
    attribute mark_debug of s_nim_out3 : signal is "true";
--    attribute mark_debug of s_bkpressa : signal is "true";
     attribute mark_debug of s_clk25_6e : signal is "true";
     attribute mark_debug of bs_clk320i : signal is "true";
     attribute mark_debug of s_ck_mx_out : signal is "true";
     
          
     
    attribute mark_debug of read_out_data : signal is "true";
    attribute mark_debug of rx_addr : signal is "true";
    attribute mark_debug of tx_data : signal is "true";
    
    
    attribute mark_debug of b_data_we : signal is "true";
    attribute mark_debug of b_data : signal is "true";
    
                                
    signal nim_b_fifo_full : std_logic;
    
    attribute mark_debug of nim_b_fifo_full : signal is "true";
                                
-- --   attribute mark_debug of bs_clk_in_40MHz : signal is "true";
    attribute mark_debug of PHY_TXD_sig : signal is "true";
    attribute mark_debug of PHY_TXEN_sig : signal is "true";
-- --attribute mark_debug of rx_wren : signal is "true";
----    attribute mark_debug of nim_input : signal is "true";
-- --   attribute mark_debug of nim_out : signal is "true";
----    attribute mark_debug of b_sampclk_sig : signal is "true";
    
-- --   attribute mark_debug of CLK15NS : signal is "true";
---- Debug block of NIM Inputs below:    
----    attribute mark_debug of nim_input : signal is "true";
----    attribute mark_debug of nim_out : signal is "true";
    
    
--          attribute mark_debug of GMII_RXD_0_sig : signal is "true";
--          attribute mark_debug of GMII_RX_DV_0_sig : signal is "true";
   --        attribute mark_debug of rx_addr : signal is "true";
  --         attribute mark_debug of rx_data : signal is "true";
       
       component NIM_CLKS
          port ( 
            MASTER_CLK : in STD_LOGIC;
            clk_out0 : out STD_LOGIC;
            reset : in STD_LOGIC;
            locked : out STD_LOGIC
          );
        
        end component;  -- Cut and pasted from stub.vhdl file
        
        component clk_wiz_0
        port
         (-- Clock in ports
          MASTER_CLK           : in     std_logic;
          -- Clock out ports
          clkout320          : out    std_logic;
          clkout40 : out    std_logic;
          -- Status and control signals
          reset             : in     std_logic;
          locked            : out    std_logic
         );
   end component;  
       
    component clk_wiz_1
    port
     (-- Clock in ports
     clk_in40e  : in std_logic;
     -- clk_in40e_p         : in     std_logic;
     -- clk_in40e_n         : in     std_logic;
      -- Clock out ports
      clk_out320e          : out    std_logic;
    --  clk_out40e          : out    std_logic;
      clk_out1325 : out std_logic;
      clk_out265 : out std_logic;
    clk_out53 : out std_logic;
      -- Status and control signals
      reset             : in     std_logic;
      locked            : out    std_logic
     );
      end component;
     
     
     component clk_wiz_2
     port
      (-- Clock in ports
      clk_39_in  : in std_logic;
       -- Clock out ports
       clk_39_adj          : out    std_logic;
       -- Status and control signals
       reset             : in     std_logic;
        psclk             : in     std_logic;
        psen             : in     std_logic;
        psincdec             : in     std_logic;
       locked            : out    std_logic
      );
    end component;

component clk_mux_2_to_1_x_2
	 port(
	 	 sel : in STD_LOGIC;
		 e_320 : in STD_LOGIC;
		 i_320 : in STD_LOGIC;
		 e_40 : in STD_LOGIC;
		 i_40 : in STD_LOGIC;
		 out_320 : out STD_LOGIC;
		 out_40 : out STD_LOGIC
	     );
	     
end component;  

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
   
   component reset_mgr
      port ( slow_clk    : in    std_logic; 
             reset_start : in    std_logic; 
             reset       : out   std_logic);
   end component;
   
   --=================================
   -- for debug in read_decode_p
   --   signal addrDebug,dataDebug : STD_LOGIC_VECTOR(7 downto 0);
--       signal read_data_out_sig : STD_LOGIC_VECTOR(63 downto 0);
                
--       attribute mark_debug : string;
--       attribute mark_debug of addrDebug : signal is "true";
--       attribute mark_debug of dataDebug : signal is "true";
       
--   begin
--       addrDebug <= addr(7 downto 0);
--       dataDebug <= read_data_out_sig(7 downto 0);
--       read_data_out <= read_data_out_sig;
   
    
  --=================================
  -- for debug in nim top 

--   signal debug_fast_cnt : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
--      attribute mark_debug : string;
--      attribute mark_debug of sig_log : signal is "true";
--      attribute mark_debug of debug_fast_cnt : signal is "true";
--      attribute mark_debug of out_cnt_rst : signal is "true";
--      attribute mark_debug of out_ctr_4 : signal is "true";
--      attribute mark_debug of out_ctr_3 : signal is "true";
--      attribute mark_debug of out_ctr_2 : signal is "true";
--      attribute mark_debug of out_ctr_1 : signal is "true";
--      attribute mark_debug of out_ctr_4b : signal is "true";
--      attribute mark_debug of out_ctr_3b : signal is "true";
--      attribute mark_debug of out_ctr_2b : signal is "true";
--      attribute mark_debug of out_ctr_1b : signal is "true";
--      attribute mark_debug of cnt64_simp_out : signal is "true";
         
         
--  begin
  
--      debug_fast_cnt <= cnt64_simp_out(15 downto 0);
       
--		signal nim_ready : std_logic := '0';
--		signal tx_rden : std_logic;
--		signal nim_ready_cnt : unsigned(2 downto 0) := (others => '0');
--		signal eth_strobe_mask : std_logic := '1';
--		signal rx_addr_reg               : std_logic_vector (31 downto 0);
--        signal rx_addr_reg2               : std_logic_vector (31 downto 0);
--        signal masked_tx_rden, masked_rx_wren : std_logic;
--        signal masked_rx_wren2 : std_logic;
        
--        attribute mark_debug of nim_ready, tx_rden, rx_wren : signal is "true";
begin
   
	gnd <= '0';
    
	reset_n <= not reset;
	reset_btn <= '0';
	   
      
      
--	 -- process to create delayed ready to each write and read
    
--    process(MASTER_CLK)
--    begin
--        if rising_edge(MASTER_CLK) then
        
--            nim_ready <= '0';
            
--            if(nim_ready_cnt /= 0) then -- countdown to ready again
            
--                nim_ready <= '0';                    
--                nim_ready_cnt <= nim_ready_cnt - 1;  
                             
--                if(nim_ready_cnt = 1) then -- ready now!
--                     nim_ready <= '1';
--                end if;
                
--            elsif (eth_strobe_mask = '1' and (tx_rden = '1' or rx_wren = '1')) then
            
--                nim_ready_cnt <= (others => '1');
--                eth_strobe_mask <= '0';
--                nim_ready <= '0';
                
--            else
--                eth_strobe_mask <= '1';
--            end if;          
              
--            --delay by 2 clock the strobes.. so that address can be registered twice to ease timing
            
--            masked_rx_wren <= rx_wren and eth_strobe_mask;                
--            rx_addr_reg <= rx_addr(31 downto 0);
            
--            masked_rx_wren2 <= masked_rx_wren;
--            rx_addr_reg2 <= rx_addr_reg;
--        end if;
--    end process;
   
	-- start simple OEI
	eth_interface : entity work.Ethernet_Interface
	  port map (b_data(63 downto 0)=>b_data(63 downto 0),
				b_data_we=>b_data_we,
				PHY_RXD(7 downto 0)=>GMII_RXD_0_sig(7 downto 0),
				PHY_RX_DV=>GMII_RX_DV_0_sig,
				PHY_RX_ER=>GMII_RX_ER_0_sig,
				MASTER_CLK=>MASTER_CLK,      
				CONTINUOUS_CLK=>USER_CLK,          
				reset_in=>reset_btn,
				reset_out => reset,
				
				user_ready=> '1', --nim_ready,--strip_ready,                            
			    tx_rden=>open,--tx_rden,
				
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

        --separate clock reset
		process(MASTER_CLK)
		begin
			if (rising_edge(MASTER_CLK)) then
				
				
				-- register map
				if (rx_wren = '1') then 	
					if (unsigned(rx_addr) = x"999") then 
						extra_clk_reset <= rx_data(3 downto 0);			
					elsif (unsigned(rx_addr) = x"990") then 
                        ot_ps_ctrl <= rx_data(1 downto 0);            
                    end if;
				end if;
				
				
				fs_gen_lock_latch(0) <= fs_gen_lock;
				fs_gen_lock_latch(1) <= fs_gen_lock_latch(0);
				
				-- latch losing lock
				if(extra_clk_reset_OR(0) = '1') then
				    fs_gen_lock_loss <= '0';
				elsif(fs_gen_lock_latch(1) = '1' and fs_gen_lock_latch(0) = '0') then --lost lock since reset
				    fs_gen_lock_loss <= '1';				
				end if;    
				

                ei40_gen_lock_latch(0) <= ei40_gen_lock;
                ei40_gen_lock_latch(1) <= ei40_gen_lock_latch(0);
                
                -- latch losing lock
                if(extra_clk_reset_OR(1) = '1') then
                    ei40_gen_lock_loss <= '0';
                elsif(ei40_gen_lock_latch(1) = '1' and ei40_gen_lock_latch(0) = '0') then --lost lock since reset
                    ei40_gen_lock_loss <= '1';                
                end if;    
                
                
                nim_clk_lock_latch(0) <= nim_clk_lock;
                nim_clk_lock_latch(1) <= nim_clk_lock_latch(0);
                
                -- latch losing lock
                if(extra_clk_reset_OR(2) = '1') then
                    nim_clk_lock_loss <= '0';
                elsif(nim_clk_lock_latch(1) = '1' and nim_clk_lock_latch(0) = '0') then --lost lock since reset
                    nim_clk_lock_loss <= '1';                
                end if; 
                
               
                ot_ps_lock_latch(0) <= ot_ps_lock;
                ot_ps_lock_latch(1) <= ot_ps_lock_latch(0);
                
                -- latch losing lock
                if(extra_clk_reset_OR(3) = '1') then
                    ot_ps_lock_loss <= '0';
                elsif(ot_ps_lock_latch(1) = '1' and ot_ps_lock_latch(0) = '0') then --lost lock since reset
                    ot_ps_lock_loss <= '1';                
                end if; 
                
				    
				--fs_gen_lock_latch, ei40_gen_lock_latch, ot_ps_lock_latch, nim_clk_lock_latch
				
				
		  end if;
	   end process;
	   extra_clk_reset_OR(0) <= extra_clk_reset(0) or reset;
	   extra_clk_reset_OR(1) <= extra_clk_reset(1) or reset;
       extra_clk_reset_OR(2) <= extra_clk_reset(2) or reset;
       extra_clk_reset_OR(3) <= extra_clk_reset(3) or reset;
  

 
    CLK_mx_40_bufg : BUFG port map (I=>mx_40,  O=>bmx_40);                     
    CLK_mx_320_bufg : BUFG port map (I=>mx_320,  O=>bmx_320);           
    DAC_CLK_bufg : BUFG port map (I=>nim_dac_clk,  O=>b_nim_dac_clk);   
                    
    -------------------------------------                    
      
    
      tx_data(63 downto 0) <= read_out_data(63 downto 0);
    
                        

        --NOTE:: 0 - is internal, 1 is external
        CLK_MUX : clk_mux_2_to_1_x_2
	 port map(
	 	 sel => s_ck_mx_out(0),--NOTE:: 0 - is internal, 1 is external
		 i_320 => bs_clk320e, --NOTE:: 0 - is internal, 1 is external
		 e_320 => bs_clk320i,--NOTE:: 0 - is internal, 1 is external
		 i_40 => bs_clk40e,--NOTE:: 0 - is internal, 1 is external
		 e_40 => bs_clk40i,--NOTE:: 0 - is internal, 1 is external
		 out_320 => mx_320,
		 out_40 => mx_40
	     );  
	     
   
            
         NIM_BLOCK : entity work.nim_plus_blk_1_phase_4ps --nim_plus_block_v4
          --NIM_BLOCK : nim_plus_block_test_1
              port map(
                      DAC_clk => b_nim_dac_clk,
                      bkpa => s_bkpressa,
                      bkpb => s_bkpressb,
                      clk0 => bmx_320,
                      clk_13_25 => sigclk_1325,
                      clk_26_5 => sigclk_265,
                      clk_40DCM => bmx_40,
                      reset_out => reset,
                      rx_wren => rx_wren,--masked_rx_wren2,--rx_wren,
                      tx_clk => MASTER_CLK,
                     --  rx_addr(32) => '1', -- Fixed
                      rx_addr(31 downto 0)=> rx_addr(31 downto 0), --rx_addr_reg2,--rx_addr(31 downto 0),
        --              rx_data(15 downto 0)=>rx_data(15 downto 0),
                      rx_data=>rx_data,
                      x(0) => nim_input(0),
                      x(1) => nim_input(1),
                      x(2) => nim_input(2),
                      x(3) => nim_input(3),
                      
                      
                      clklock(0) => nim_clk_lock_loss,
                      clklock(1) => fs_gen_lock_loss,
                      clklock(2) => ei40_gen_lock_loss, 
                      clklock(3) => ot_ps_lock_loss,
                      clklock(7 downto 4) => (others => '0'),
                      
                      b_wr_out => s_b_wr_out,
                      burst_full_ext => nim_b_fifo_full,
                      ck_mx_out => s_ck_mx_out, --8b external clock selector (0 - is int/ext lo/hi. 6:4 - is ext source select)
                      clk_39_out => bs_clk40e,
                      
                      clk_ext => selected_ext_clkg, --s_clk25_6e,
                      
                      dac_out => dac_din_sig,
                      muxout_1 => s_nim_out0,
                      muxout_2 => s_nim_out1,
                      muxout_3 => s_nim_out2,
                      muxout_4 => s_nim_out3,
        --              s_out => nim_out,
                      sclk => dac_sclk_sig,
                      sync => dac_sync_sig,
                      b_read => s_b_read(63 downto 0),
                      trig_40 => s_trig_40(5 downto 0),
                      trig_53 => s_trig_53(11 downto 0),
                      read_data_out => read_out_data
              );
      --generate dual clock fifo for burst data out from nim+ block
    genNimPlusAndBurstFifo : for i in 0 to 0 generate
        signal nim_b_fifo_empty : std_logic;
        signal nim_b_fifo_rden : std_logic := '0';
        signal nim_b_fifo_data_Low4 : std_logic_vector(3 downto 0);
        
        attribute mark_debug : string;
        attribute mark_debug of nim_b_fifo_rden : signal is "true";
        attribute mark_debug of nim_b_fifo_data_Low4 : signal is "true";
        attribute mark_debug of nim_b_fifo_empty : signal is "true";
        
        constant   RDCOUNT_SIZE : integer := 9;
        signal nim_b_fifo_RDCOUNT, nim_b_fifo_WRCOUNT: std_logic_vector(RDCOUNT_SIZE-1 downto 0);
        
    begin
        --signal handling between the two
        process(MASTER_CLK)
        begin
            if(rising_edge(MASTER_CLK)) then
                b_data_we <= nim_b_fifo_rden;
            end if;
        end process;
         
        nim_b_fifo_rden <= not nim_b_fifo_empty;
        nim_b_fifo_data_Low4 <= b_data(3 downto 0);
        
         --FIFO_DUALCLOCK_MACRO: Dual-Clock First-In, First-Out (FIFO) RAM Buffer
         -- 7 Series
         -- Xilinx HDL Libraries Guide, version 14.7
         -- Note - This Unimacro model assumes the port directions to be "downto".
         -- Simulation of this model with "to" in the port directions could lead to erroneous results.
         -----------------------------------------------------------------
         -- DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width --
         -- ===========|===========|============|=======================--
         -- 37-72 | "36Kb" | 512 | 9-bit --
         -- 19-36 | "36Kb" | 1024 | 10-bit --
         -- 19-36 | "18Kb" | 512 | 9-bit --
         -- 10-18 | "36Kb" | 2048 | 11-bit --
         -- 10-18 | "18Kb" | 1024 | 10-bit --
         -- 5-9 | "36Kb" | 4096 | 12-bit --
         -- 5-9 | "18Kb" | 2048 | 11-bit --
         -- 1-4 | "36Kb" | 8192 | 13-bit --
         -- 1-4 | "18Kb" | 4096 | 12-bit --
         -----------------------------------------------------------------
         FIFO_DUALCLOCK_MACRO_inst : FIFO_DUALCLOCK_MACRO
         generic map (
             DEVICE => "7SERIES", -- Target Device: "VIRTEX5", "VIRTEX6", "7SERIES"
             ALMOST_FULL_OFFSET => X"0080", -- Sets almost full threshold
             ALMOST_EMPTY_OFFSET => X"0080", -- Sets the almost empty threshold
             DATA_WIDTH => 64, -- Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
             FIFO_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb"
             FIRST_WORD_FALL_THROUGH => FALSE) -- Sets the FIFO FWFT to TRUE or FALSE
         port map (
             ALMOSTEMPTY => open, -- 1-bit output almost empty
             ALMOSTFULL => open, -- 1-bit output almost full
             DO => b_data, -- Output data, width defined by DATA_WIDTH parameter
             EMPTY => nim_b_fifo_empty, -- 1-bit output empty
             FULL => nim_b_fifo_full, -- 1-bit output full
             RDCOUNT => nim_b_fifo_RDCOUNT, -- Output read count, width determined by FIFO depth            
             RDERR => open, -- 1-bit output read error
             WRCOUNT => nim_b_fifo_WRCOUNT, -- Output write count, width determined by FIFO depth
             WRERR => open, -- 1-bit output write error
             DI => s_b_read, -- Input data, width defined by DATA_WIDTH parameter
             RDCLK => MASTER_CLK, -- 1-bit input read clock
             RDEN => nim_b_fifo_rden, -- 1-bit input read enable
             RST => reset, -- 1-bit input reset
             WRCLK => bmx_320, -- 1-bit input write clock
             WREN => s_b_wr_out -- 1-bit input write enable
         );
         -- End of FIFO_DUALCLOCK_MACRO_inst instantiation  
   end generate;
      
      
    
   NIM_CLKS_BLOCK : NIM_CLKS
         port map( 
           MASTER_CLK => MASTER_CLK,
           clk_out0 => nim_dac_clk,
           reset => extra_clk_reset_OR(2),
           locked => nim_clk_lock
         );
   
   clk_wiz_0_BLOCK : clk_wiz_0
         port map(
--           clk_in_40MHz => bs_clk_in_40MHz,   
           MASTER_CLK => MASTER_CLK,
           clkout320 => bs_clk320i,
           clkout40 => bs_clk40i,           
           reset => extra_clk_reset_OR(0),
           locked => fs_gen_lock
          );    


    --generate external clock PLL and source control
    genExtClkMux : for i in 0 to 0 generate
        signal selected_ext_clk : std_logic;
        -- s_ck_mx_out := 8b external clock selector (0 - is int/ext lo/hi. 6:4 - is ext source select)
    begin 
    
        extClkMux:process(s_ck_mx_out, s_clk25_6e, nim_input)
        begin
                    
            case s_ck_mx_out(6 downto 4) is
                when "001" =>
                    selected_ext_clk <= nim_input(0);
                when "010" =>
                    selected_ext_clk <= nim_input(1);
                when "011" =>
                    selected_ext_clk <= nim_input(2);
                when "100" =>
                    selected_ext_clk <= nim_input(3);
                when others =>
                    selected_ext_clk <= s_clk25_6e;
            end case;    
                       
        end process;       
        
        
           extClkMuxBUFG: BUFG
              port map( I => selected_ext_clk, 
                     O => selected_ext_clkg);                     
                                
       clk_wiz_1_BLOCK : clk_wiz_1
             port map(
             -- Clock in ports
                clk_in40e => selected_ext_clkg, --reused name for clk_in40e
              -- Clock out ports
              clk_out320e => bs_clk320e,
              clk_out265 => sigclk_265,
              clk_out1325 => sigclk_1325,
              clk_out53 => sigclk_53,
              -- Status and control signals
              reset => extra_clk_reset_OR(1),
              locked  => ei40_gen_lock
              );
      end generate;
      
      
          
      clk_wiz_2_BLOCK: clk_wiz_2
           port map
            (-- Clock in ports
            clk_39_in => bmx_40,
             -- Clock out ports
             clk_39_adj => bmx_40_adj,
             -- Status and control signals
             reset  => extra_clk_reset_OR(3),
              psclk => MASTER_CLK,
              psen  => ot_ps_ctrl(0),
              psincdec => ot_ps_ctrl(1),
             locked   => ot_ps_lock
            );
          
         IBUFDS_COM0 : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => nim_input(2), --0),  -- Buffer output
            I => NIM_COM0_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => NIM_COM0_N -- Diff_n buffer input (connect directly to top-level port)
         );
         
         IBUFDS_COM1 : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => nim_input(0), --1),  -- Buffer output
            I => NIM_COM1_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => NIM_COM1_N -- Diff_n buffer input (connect directly to top-level port)
         );
         
         IBUFDS_COM2 : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => nim_input(3), --2),  -- Buffer output
            I => NIM_COM2_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => NIM_COM2_N -- Diff_n buffer input (connect directly to top-level port)
         );
         
         IBUFDS_COM3 : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => nim_input(1), --3),  -- Buffer output
            I => NIM_COM3_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => NIM_COM3_N -- Diff_n buffer input (connect directly to top-level port)
         );   
         
         IBUFDS_BKPRSA : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => s_bkpressa,  -- Buffer output
            I => BKPRSA_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => BKPRSA_N -- Diff_n buffer input (connect directly to top-level port)
         );  
         
         IBUFDS_BKPRSB : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => s_bkpressb,  -- Buffer output
            I => BKPRSB_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => BKPRSB_N -- Diff_n buffer input (connect directly to top-level port)
         );
         
--         IBUFGDS_CLK40_IN_EXT : IBUFGDS
----         IBUFDS_CLK40_IN_EXT : IBUFDS
--         generic map (
--            DIFF_TERM => TRUE, -- Differential Termination 
--            IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
--            IOSTANDARD => "DEFAULT")
--         port map (
--            O => s_clk40e,  -- Buffer output
--            I => CLK40_IN_EXT_P,  -- Diff_p buffer input (connect directly to top-level port)
--            IB => CLK40_IN_EXT_N -- Diff_n buffer input (connect directly to top-level port)
--         ); 

         IBUFGDS_CLK25_6_IN_EXT : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => s_clk25_6e,  -- Buffer output
            I => CLK25_6_IN_EXT_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => CLK25_6_IN_EXT_N -- Diff_n buffer input (connect directly to top-level port)
         );         
            
          OBUFDS_TRIGA_CMS_OUT : OBUFDS
          generic map (
             IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
             SLEW => "FAST")          -- Specify the output slew rate
          port map (
             O => TRIGA_CMS_OUT_P,     -- Diff_p output (connect directly to top-level port)
             OB => TRIGA_CMS_OUT_N,   -- Diff_n output (connect directly to top-level port)
             I => s_nim_out1      -- Buffer input 
          );
          
          OBUFDS_TRIGB_CMS_OUT : OBUFDS
          generic map (
             IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
             SLEW => "FAST")          -- Specify the output slew rate
          port map (
             O => TRIGB_CMS_OUT_P,     -- Diff_p output (connect directly to top-level port)
             OB => TRIGB_CMS_OUT_N,   -- Diff_n output (connect directly to top-level port)
             I => s_nim_out1      -- Buffer input 
          );
          
       
             
          OBUFDS_CMS_CLK40A_OUT : OBUFDS
          generic map (
             IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
             SLEW => "FAST")          -- Specify the output slew rate
          port map (
             O => CLK40A_OUT_P,     -- Diff_p output (connect directly to top-level port)
             OB => CLK40A_OUT_N,   -- Diff_n output (connect directly to top-level port)
             I => bmx_40_adj      -- Buffer input 
           );      
           
           OBUFDS_CMS_CLK40B_OUT : OBUFDS
           generic map (
              IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
              SLEW => "FAST")          -- Specify the output slew rate
           port map (
              O => CLK40B_OUT_P,     -- Diff_p output (connect directly to top-level port)
              OB => CLK40B_OUT_N,   -- Diff_n output (connect directly to top-level port)
              I => bmx_40_adj      -- Buffer input 
            );     
               
               OBUFDS_NIM_OUT0 : OBUFDS
               generic map (
                  IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                  SLEW => "FAST")          -- Specify the output slew rate
               port map (
                  O => NIM_OUT0_P,     -- Diff_p output (connect directly to top-level port)
                  OB => NIM_OUT0_N,   -- Diff_n output (connect directly to top-level port)
                  I => s_nim_out0      -- Buffer input 
               ); -- What I call sout, the output signal after all coincidence, delay, and width processing

               -- End of OBUFDS_inst instantiation
            
                OBUFDS_NIM_OUT1 : OBUFDS
                generic map (
                   IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                   SLEW => "FAST")          -- Specify the output slew rate
                port map (
                   O => NIM_OUT1_P,     -- Diff_p output (connect directly to top-level port)
                   OB => NIM_OUT1_N,   -- Diff_n output (connect directly to top-level port)
                   I => s_nim_out2 --1      -- Buffer input 
                ); -- What I call sout, the output signal after all coincidence, delay, and width processing
 
          OBUFDS_NIM_OUT2: OBUFDS
                generic map (
                   IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                   SLEW => "FAST")          -- Specify the output slew rate
                port map (
                   O => NIM_OUT2_P,     -- Diff_p output (connect directly to top-level port)
                   OB => NIM_OUT2_N,   -- Diff_n output (connect directly to top-level port)
                   I => s_nim_out1 --2      -- Buffer input 
                );
                          
                OBUFDS_NIM_OUT3: OBUFDS
                generic map (
                   IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                   SLEW => "FAST")          -- Specify the output slew rate
                port map (
                   O => NIM_OUT3_P,     -- Diff_p output (connect directly to top-level port)
                   OB => NIM_OUT3_N,   -- Diff_n output (connect directly to top-level port)
                   I => s_nim_out3      -- Buffer input 
                ); 
                -- End of OBUFDS_inst instantiation
                
-- Begin New section AGP 2018_05_03 RJ45 Panel Support
-- Need 12 53 MHz clock differential buffers
-- Need 6 40 MHz clock differential buffers

OBUFDS_TRIG53_0 : OBUFDS
           generic map (
              IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
              SLEW => "FAST")          -- Specify the output slew rate
           port map (
              O => TRIG53_0_P,     -- Diff_p output (connect directly to top-level port)
              OB => TRIG53_0_N,   -- Diff_n output (connect directly to top-level port)
              I => s_trig_53(0)      -- Buffer input 
            );     
OBUFDS_TRIG53_1 : OBUFDS
           generic map (
              IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
              SLEW => "FAST")          -- Specify the output slew rate
           port map (
              O => TRIG53_1_P,     -- Diff_p output (connect directly to top-level port)
              OB => TRIG53_1_N,   -- Diff_n output (connect directly to top-level port)
              I => s_trig_53(1)      -- Buffer input 
           );     
OBUFDS_TRIG53_2 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG53_2_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG53_2_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_53(2)      -- Buffer input 
);
OBUFDS_TRIG53_3 : OBUFDS
                                  generic map (
                                     IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                                     SLEW => "FAST")          -- Specify the output slew rate
                                  port map (
                                     O => TRIG53_3_P,     -- Diff_p output (connect directly to top-level port)
                                     OB => TRIG53_3_N,   -- Diff_n output (connect directly to top-level port)
                                     I => s_trig_53(3)      -- Buffer input 
                                   );      
OBUFDS_TRIG53_4 : OBUFDS
                       generic map (
                       IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                                              SLEW => "FAST")          -- Specify the output slew rate
                                              port map (
                                                 O => TRIG53_4_P,     -- Diff_p output (connect directly to top-level port)
                                                 OB => TRIG53_4_N,   -- Diff_n output (connect directly to top-level port)
                                                 I => s_trig_53(4)      -- Buffer input 
                                               );
OBUFDS_TRIG53_5 : OBUFDS
                                                          generic map (
                                                             IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                                                             SLEW => "FAST")          -- Specify the output slew rate
                                                          port map (
                                                             O => TRIG53_5_P,     -- Diff_p output (connect directly to top-level port)
                                                             OB => TRIG53_5_N,   -- Diff_n output (connect directly to top-level port)
                                                             I => s_trig_53(5)      -- Buffer input 
                                                           ); 
OBUFDS_TRIG53_6 : OBUFDS
 generic map (
                                                                         IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                                                                         SLEW => "FAST")          -- Specify the output slew rate
                                                                      port map (
                                                                         O => TRIG53_6_P,     -- Diff_p output (connect directly to top-level port)
                                                                         OB => TRIG53_6_N,   -- Diff_n output (connect directly to top-level port)
                                                                         I => s_trig_53(6)      -- Buffer input 
                                                                       );                                                                
OBUFDS_TRIG53_7 : OBUFDS
                                                                                  generic map (
                                                                                     IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
                                                                                     SLEW => "FAST")          -- Specify the output slew rate
                                                                                  port map (
                                                                                     O => TRIG53_7_P,     -- Diff_p output (connect directly to top-level port)
                                                                                     OB => TRIG53_7_N,   -- Diff_n output (connect directly to top-level port)
                                                                                     I => s_trig_53(7)      -- Buffer input 
                                                                                   );     
OBUFDS_TRIG53_8 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG53_8_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG53_8_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_53(8)      -- Buffer input 
);     
OBUFDS_TRIG53_9 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG53_9_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG53_9_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_53(9)      -- Buffer input 
);
OBUFDS_TRIG53_10 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG53_10_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG53_10_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_53(10)      -- Buffer input 
);
OBUFDS_TRIG53_11 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG53_11_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG53_11_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_53(11)      -- Buffer input 
);
OBUFDS_TRIG40_0 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG40_0_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG40_0_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_40(0)      -- Buffer input 
);
OBUFDS_TRIG40_1 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG40_1_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG40_1_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_40(1)      -- Buffer input 
);
OBUFDS_TRIG40_2 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG40_2_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG40_2_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_40(2)      -- Buffer input 
);
OBUFDS_TRIG40_3 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG40_3_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG40_3_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_40(3)      -- Buffer input 
);
OBUFDS_TRIG40_4 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG40_4_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG40_4_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_40(4)      -- Buffer input 
);
OBUFDS_TRIG40_5 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => TRIG40_5_P,     -- Diff_p output (connect directly to top-level port)
OB => TRIG40_5_N,   -- Diff_n output (connect directly to top-level port)
I => s_trig_40(5)      -- Buffer input 
);

OBUFDS_CLCK53_0 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_0_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_0_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_1 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_1_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_1_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_2 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_2_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_2_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_3 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_3_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_3_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_4 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_4_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_4_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_5 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_5_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_5_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_6 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_6_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_6_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_7 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_7_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_7_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_8 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_8_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_8_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_9 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_9_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_9_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_10 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_10_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_10_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);
OBUFDS_CLCK53_11 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK53_11_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK53_11_N,   -- Diff_n output (connect directly to top-level port)
I => sigclk_53      -- Buffer input 
);


OBUFDS_CLCK40_0 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK40_0_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK40_0_N,   -- Diff_n output (connect directly to top-level port)
I => bmx_40_adj      -- Buffer input 
);
OBUFDS_CLCK40_1 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK40_1_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK40_1_N,   -- Diff_n output (connect directly to top-level port)
I => bmx_40_adj      -- Buffer input 
);
OBUFDS_CLCK40_2 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK40_2_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK40_2_N,   -- Diff_n output (connect directly to top-level port)
I => bmx_40_adj      -- Buffer input 
);
OBUFDS_CLCK40_3 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK40_3_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK40_3_N,   -- Diff_n output (connect directly to top-level port)
I => bmx_40_adj      -- Buffer input 
);
OBUFDS_CLCK40_4 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK40_4_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK40_4_N,   -- Diff_n output (connect directly to top-level port)
I => bmx_40_adj      -- Buffer input 
);
OBUFDS_CLCK40_5 : OBUFDS
generic map (
IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
SLEW => "FAST")          -- Specify the output slew rate
port map (
O => CLCK40_5_P,     -- Diff_p output (connect directly to top-level port)
OB => CLCK40_5_N,   -- Diff_n output (connect directly to top-level port)
I => bmx_40_adj      -- Buffer input 
);

-- End new section AGP 2018_05_03  RJ45 Panel Support               
                                
                                             
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
     IBUF_USER_CLK : BUFG      port map (I=>USER_CLOCK, O=>USER_CLK);
     
        
    -----------------------
    ----------------------- OBUF 's 
    	 
--	OBUF_PHY_RESET : OBUF	   port map (I=>'1',  O=>PHY_RESET); 
	OBUF_PHY_RESET : OBUF	   port map (I=>reset_n,  O=>PHY_RESET);
		 
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
	
    OBUF_DAC_SER_CLK : OBUF       port map (I=>dac_sclk_sig,  O=>DAC_SER_CLK);
	OBUF_DAC_NSYNC : OBUF       port map (I=>dac_sync_sig,  O=>DAC_NSYNC);
	OBUF_DAC_DIN : OBUF       port map (I=>dac_din_sig,  O=>DAC_DIN);
           
           
end BEHAVIORAL;

