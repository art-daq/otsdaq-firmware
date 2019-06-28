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
        NIM_COM_P     : in     std_logic_vector(7 downto 0); -- 8 NIM+2 inputs
        NIM_COM_N     : in     std_logic_vector(7 downto 0);
        
        NIM_OUT_P     : out    std_logic_vector(3 downto 0); -- 4 NIM+2 outputs
        NIM_OUT_N     : out    std_logic_vector(3 downto 0);
        
        BKPRSA_P     : in   std_logic; -- Back pressure input
        BKPRSA_N     : in   std_logic;
        
        BKPRSB_P     : in   std_logic; -- Back pressure input
        BKPRSB_N     : in   std_logic;
        
        TRIGA_CMS_OUT_P : out   std_logic;
        TRIGA_CMS_OUT_N : out   std_logic;
        
        TRIGB_CMS_OUT_P : out   std_logic;
        TRIGB_CMS_OUT_N : out   std_logic;
        
--        TRIG_CMS1_OUT_P : out   std_logic;
--        TRIG_CMS1_OUT_N : out   std_logic;
        
--        CLK40_LEM_P : out   std_logic;
--        CLK40_LEM_N : out   std_logic;
        
        CLK40A_OUT_P : out   std_logic;
        CLK40A_OUT_N : out   std_logic;
        
        CLK40B_OUT_P : out   std_logic;
        CLK40B_OUT_N : out   std_logic;
        
        CLK40_IN_EXT_P : in std_logic;
        CLK40_IN_EXT_N : in std_logic;
        
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
    --  signal secondary_clk, secondary_clk_sig       : std_logic;
    
    signal rx_wren_a                : std_logic;
    signal tx_data_a                : std_logic_vector (63 downto 0);
    signal rx_wren_b                : std_logic;
    signal tx_data_b                : std_logic_vector (63 downto 0);
    
    
    signal nim_inputs               : std_logic_vector (7 downto 0);
    signal nim_plus_a_inputs        : std_logic_vector (3 downto 0);
    signal nim_plus_b_inputs        : std_logic_vector (3 downto 0);
    
    signal nim_outputs              : std_logic_vector (3 downto 0);
    signal nim_plus_a_outputs       : std_logic_vector (3 downto 0);
    signal nim_plus_b_outputs       : std_logic_vector (3 downto 0);
    
    signal burst_data_we_a          : std_logic;
    signal burst_data_we_b          : std_logic;
    signal burst_data_a             : std_logic_vector (63 downto 0);
    signal burst_data_b             : std_logic_vector (63 downto 0);
    
    
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
    
    
    signal fs_gen_lock_latch, ei40_gen_lock_latch, ot_ps_lock_latch, nim_clk_lock_latch : std_logic_vector(1 downto 0) := (others => '0');
    signal fs_gen_lock_loss, ei40_gen_lock_loss, ot_ps_lock_loss, nim_clk_lock_loss : std_logic := '0';
    
    signal selected_ext_clkg : std_logic;
    
    signal s_bkpressa : std_logic;
    signal s_bkpressb : std_logic;
    
  --  signal s_trig_cms : std_logic;

    
 --   signal s_trig_cms1 : std_logic;
  --  signal s_trig_cms2 : std_logic;
    
    signal s_b_wr_out : std_logic;
    signal s_b_read : std_logic_vector (63 downto 0);
    
    -- all internal, external here are non-BUFG !!! only BUFG after mux
    signal external_clk6, external_clk13, external_clk26, external_clk53, external_clk40, external_clk160 : std_logic;
    signal internal_clk6, internal_clk13, internal_clk26, internal_clk53,                 internal_clk160 : std_logic;
    
    -- all sysclk are non-BUFG !!!
    signal sysclk_6, sysclk_13, sysclk_26, sysclk_53 : std_logic;
    
    signal s_clk40e  : std_logic;
    --signal bs_clk40e  : std_logic;
    --signal bs_clk160e : std_logic;
    
    signal bs_clk40i  : std_logic;
    --signal bs_clk160i : std_logic;
    
    signal mx_160 : std_logic;
    signal mx_40 : std_logic;
    signal bmx_320 : std_logic;
    signal bmx_40 : std_logic;
    
    signal s_ck_mx_out : std_logic_vector(7 downto 0);
 

    signal read_out_data_a          : std_logic_vector (63 downto 0); 
    signal read_out_data_b          : std_logic_vector (63 downto 0);     
     
   
    attribute mark_debug : string;
    attribute mark_debug of bmx_320 : signal is "true";
    attribute mark_debug of MASTER_CLK : signal is "true";
    attribute mark_debug of selected_ext_clkg : signal is "true";
    attribute mark_debug of bmx_40 : signal is "true";
--    --attribute mark_debug of mx_40 : signal is "true";
    attribute mark_debug of bs_clk40i : signal is "true";
    attribute mark_debug of external_clk40 : signal is "true";
    attribute mark_debug of fs_gen_lock : signal is "true";
    attribute mark_debug of ei40_gen_lock : signal is "true";
    attribute mark_debug of nim_clk_lock : signal is "true";
    

    attribute mark_debug of fs_gen_lock_loss : signal is "true";
    attribute mark_debug of nim_clk_lock_loss : signal is "true";
   -- attribute mark_debug of ot_ps_lock_loss : signal is "true";
    attribute mark_debug of ei40_gen_lock_loss : signal is "true";
            
--    attribute mark_debug of reset : signal is "true";
    attribute mark_debug of s_clk40e : signal is "true";
--    attribute mark_debug of s_ck_mx_out : signal is "true";

    attribute mark_debug of nim_inputs          : signal is "true";  
    attribute mark_debug of nim_outputs         : signal is "true";
    attribute mark_debug of nim_plus_a_inputs   : signal is "true";  
    attribute mark_debug of nim_plus_a_outputs  : signal is "true";
    attribute mark_debug of nim_plus_b_inputs   : signal is "true";  
    attribute mark_debug of nim_plus_b_outputs  : signal is "true";
    
--    attribute mark_debug of s_bkpressa : signal is "true";
    
    
    attribute mark_debug of b_data_we : signal is "true";
    attribute mark_debug of b_data : signal is "true";
    
                                
    signal nim_b_fifo_full : std_logic;
    
    attribute mark_debug of nim_b_fifo_full : signal is "true";
                                
-- --   attribute mark_debug of bs_clk_in_40MHz : signal is "true";
--    attribute mark_debug of PHY_TXD_sig : signal is "true";
--    attribute mark_debug of PHY_TXEN_sig : signal is "true";
-- --attribute mark_debug of rx_wren : signal is "true";
----    attribute mark_debug of b_sampclk_sig : signal is "true";
    
-- --   attribute mark_debug of CLK15NS : signal is "true";
---- Debug block of NIM Inputs below:    
    
--          attribute mark_debug of GMII_RXD_0_sig : signal is "true";
--          attribute mark_debug of GMII_RX_DV_0_sig : signal is "true";
   --        attribute mark_debug of rx_addr : signal is "true";
  --         attribute mark_debug of rx_data : signal is "true";
       
    component NIM_CLKS
        port ( 
            MASTER_CLK : in STD_LOGIC;
            clk_out_dac125 : out STD_LOGIC;
            clk_out_internal40 : out STD_LOGIC;
            reset : in STD_LOGIC;
            locked : out STD_LOGIC
        );        
    end component NIM_CLKS;  -- Cut and pasted from stub.vhdl file
        
--    component clk_wiz_0
--        port (-- Clock in ports
--            MASTER_CLK           : in     std_logic;
--            -- Clock out ports
--            clkout160          : out    std_logic;
--            clkout53          : out    std_logic;
--            clkout26          : out    std_logic;
--            clkout13          : out    std_logic;
--            clkout40 : out    std_logic;
--            -- Status and control signals
--            reset             : in     std_logic;
--            locked            : out    std_logic
--        );
--    end component clk_wiz_0;  
   
    component clk_wiz_1
        port (-- Clock in ports
            clk_in_external53 : in STD_LOGIC;
            clk_out_external160 : out STD_LOGIC;
            clk_out_external26 : out STD_LOGIC;
            clk_out_external13 : out STD_LOGIC;
            clk_out_external6 : out STD_LOGIC;
            clk_out_external40 : out STD_LOGIC;
            clk_out_external53 : out STD_LOGIC;
            --clkfb_in : inout STD_LOGIC;
            --clkfb_out : out STD_LOGIC;
            reset : in STD_LOGIC;
            locked : out STD_LOGIC
        );
    end component clk_wiz_1;

    component clk_wiz_internalClocks
        port ( 
            clk_in_internal40 : in STD_LOGIC;
            clk_out_internal160 : out STD_LOGIC;
            clk_out_internal13 : out STD_LOGIC;
            clk_out_internal6 : out STD_LOGIC;
            clk_out_internal26 : out STD_LOGIC;
            --clkfb_in : inout STD_LOGIC;
            --clkfb_out : out STD_LOGIC;
            reset : in STD_LOGIC;
            locked : out STD_LOGIC
        );
    end component clk_wiz_internalClocks;

    component clk_mux_2_to_1_x_2
        port(
            sel     : in STD_LOGIC;
            
            e_160   : in STD_LOGIC;
            e_40    : in STD_LOGIC;
            e_53    : in STD_LOGIC;
            e_26    : in STD_LOGIC;
            e_13    : in STD_LOGIC;
            e_6     : in STD_LOGIC;
            
            i_160   : in STD_LOGIC;        
            i_40    : in STD_LOGIC;        
            i_53    : in STD_LOGIC;        
            i_26    : in STD_LOGIC;        
            i_13    : in STD_LOGIC;        
            i_6     : in STD_LOGIC;
            
            out_160 : out STD_LOGIC;
            out_40  : out STD_LOGIC;
            out_53  : out STD_LOGIC;
            out_26  : out STD_LOGIC;
            out_13  : out STD_LOGIC;
            out_6   : out STD_LOGIC
        );
    end component clk_mux_2_to_1_x_2;  

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
   
   
    signal extra_clk_reset : std_logic_vector(3 downto 0) := (others => '0');
    signal extra_clk_reset_OR : std_logic_vector(3 downto 0) := (others => '0');
    
    signal external_clk_fdbk, external_clk_fdbk_g, internal_clk_fdbk, internal_clk_fdbk_g : std_logic;
    
    signal nimplus2_input_mux_sel   : unsigned(4*2*2-1 downto 0) := (others => '0'); -- 4 choices for each input, for both nim+ blocks.. 0-input-a, 1-input-b, 2-output-a, 3-output-b
    signal nimplus2_output_mux_sel  : unsigned(4*2-1   downto 0) := (others => '0'); -- 4 choices for each output.. 0-output-a, 1-output-b, 2-output-or, 3-output-and
    
begin
   
	gnd <= '0';
    
	reset_n <= not reset;
	reset_btn <= '0';
--    reset_btn <= '1'; -- Try different polarity

	--	reset_ibuf : IBUF       -- SW3 on board is active high
	--     port map (I=>GPIO_SW_W,  O=>reset_btn);
	--   user_led1: OBUF   -- LED display of RESET
	--      port map (I=>reset,    O=>PZ_ULED_1);        
      
   
	-- start simple OEI
	eth_interface : entity work.Ethernet_Interface
	  port map (
	           
				PHY_RXD                 => GMII_RXD_0_sig,
				PHY_RX_DV               => GMII_RX_DV_0_sig,
				PHY_RX_ER               => GMII_RX_ER_0_sig,
				
                TX_CLK                  => GTX_CLK_0_sig,
                PHY_TXD                 => PHY_TXD_sig(7 downto 0),
                PHY_TX_EN               => PHY_TXEN_sig,
                PHY_TX_ER               => PHY_TXER_sig,
				
				
				user_ready              => '1', --nim_ready,--strip_ready,  
				                          
                tx_rden                 => open,--tx_rden,     
                tx_rden2                => open,--tx_rden,
                          
                rx_wren                 => rx_wren_a,
                rx_wren2                => rx_wren_b,  
                
                tx_data                 => tx_data_a,
                tx_data2                => tx_data_b,
                
                b_data                  => b_data,      
                b_data_we               => b_data_we,
				
				MASTER_CLK              => MASTER_CLK,      
				slow_clk                => USER_CLK,          
				reset_in                => reset_btn,
				reset_out               => reset,
				b_enable                => open,
				rx_addr                 => rx_addr(31 downto 0),
				rx_data                 => rx_data(63 downto 0)
				);
					 
	-- end simple OEI


                     
    CLK_mx_160_bufg : BUFG
                              port map (I=>mx_160,  O=>bmx_320);       

    CLK_mx_40_bufg : BUFG
                              port map (I=>mx_40,  O=>bmx_40);
        
--        SAMPCLK_bufg: BUFG
--            port map (I=>sampclk_sig, O=>b_sampclk_sig );
        
    DAC_CLK_bufg : BUFG
        port map (I=>nim_dac_clk,  O=>b_nim_dac_clk);                   
    -------------------------------------                      
    -- tx_data for reads.. rx_address(31:0) | rx_data(31:0) 
      
    tx_data_a <= read_out_data_a;
    tx_data_b <= read_out_data_b;
    
      --separate clock reset
      process(MASTER_CLK)
      begin
          if (rising_edge(MASTER_CLK)) then
              
              
              -- register map
              if (rx_wren_a = '1') then     
                  if (unsigned(rx_addr) = x"999") then 
                      extra_clk_reset <= rx_data(3 downto 0);            
                 -- elsif (unsigned(rx_addr) = x"990") then 
                 --     ot_ps_ctrl <= rx_data(1 downto 0);            
                  end if;
              end if;
              
            -- nim+2 register map   
            if (rx_wren_b = '1') then     
                if (unsigned(rx_addr) = x"999") then              
                    nimplus2_input_mux_sel  <= unsigned(rx_data(15 downto 0));        --: unsigned(4*2*2-1 downto ) := (others => '0'); -- 4 choices for each input, for both nim+ blocks.. 0-input-a, 1-input-b, 2-output-a, 3-output-b
                    nimplus2_output_mux_sel <= unsigned(rx_data(32+8-1 downto 32));   --: unsigned(4*2-1 downto ) := (others => '0'); -- 4 choices for each input.. 0-output-a, 1-output-b, 2-output-or, 3-output-and
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
            
            
--            ot_ps_lock_latch(0) <= ot_ps_lock;
--            ot_ps_lock_latch(1) <= ot_ps_lock_latch(0);
            
--            -- latch losing lock
--            if(extra_clk_reset_OR(3) = '1') then
--              ot_ps_lock_loss <= '0';
--            elsif(ot_ps_lock_latch(1) = '1' and ot_ps_lock_latch(0) = '0') then --lost lock since reset
--              ot_ps_lock_loss <= '1';                
--            end if; 
        end if;
     end process;
     extra_clk_reset_OR(0) <= extra_clk_reset(0) or reset;
     extra_clk_reset_OR(1) <= extra_clk_reset(1) or reset;
     extra_clk_reset_OR(2) <= extra_clk_reset(2) or reset;
     extra_clk_reset_OR(3) <= extra_clk_reset(3) or reset;

   
    --nimplus2_input_mux_sel    : unsigned(4*2*2-1 downto ) := (others => '0'); -- 4 choices for each input, for both nim+ blocks.. 0-input-a, 1-input-b, 2-output-a, 3-output-b
    --nimplus2_output_mux_sel   : unsigned(4*2-1 downto )   := (others => '0'); -- 4 choices for each output.. 0-output-a, 1-output-b, 2-output-or, 3-output-and                  
    
    gen_nim_plus_a_mux : for i in 0 to 3 generate
    begin    
        nim_plus_a_inputs(i) <= nim_inputs(i)           when nimplus2_input_mux_sel((i+1)*2-1 + 0 downto i*2 + 0) = 0
                           else nim_inputs(4+i)         when nimplus2_input_mux_sel((i+1)*2-1 + 0 downto i*2 + 0) = 1
                           else nim_plus_a_outputs(i)   when nimplus2_input_mux_sel((i+1)*2-1 + 0 downto i*2 + 0) = 2
                           else nim_plus_b_outputs(i); 
    end generate gen_nim_plus_a_mux;  
         
    gen_nim_plus_b_mux : for i in 0 to 3 generate
    begin    
        nim_plus_b_inputs(i) <= nim_inputs(i)           when nimplus2_input_mux_sel((i+1)*2-1 + 8 downto i*2 + 8) = 0
                           else nim_inputs(4+i)         when nimplus2_input_mux_sel((i+1)*2-1 + 8 downto i*2 + 8) = 1
                           else nim_plus_a_outputs(i)   when nimplus2_input_mux_sel((i+1)*2-1 + 8 downto i*2 + 8) = 2
                           else nim_plus_b_outputs(i); 
    end generate gen_nim_plus_b_mux;   
    
    gen_nim_plus_out_mux : for i in 0 to 3 generate
    begin    
        nim_outputs(i)       <= nim_plus_a_outputs(i)   when nimplus2_output_mux_sel((i+1)*2-1 + 0 downto i*2 + 0) = 0
                           else nim_plus_b_outputs(i)   when nimplus2_output_mux_sel((i+1)*2-1 + 0 downto i*2 + 0) = 1
                           else (nim_plus_a_outputs(i) or  nim_plus_b_outputs(i))   when nimplus2_output_mux_sel((i+1)*2-1 + 0 downto i*2 + 0) = 2
                           else (nim_plus_a_outputs(i) and nim_plus_b_outputs(i)); 
    end generate gen_nim_plus_out_mux;   
            
     
      
         NIM_BLOCK_a : entity work.nim_plus_blk_1_phase_4ps
              port map(
                      DAC_clk => b_nim_dac_clk,
                      bkpa => s_bkpressa,
                      bkpb => s_bkpressb,
                      clk0 => bmx_320, --actually 160 MHz
                      
                      clk_13_25 => sysclk_6,    --half to match clk0 ratio a la NIM+X
                      clk_26_5 => sysclk_13,    --half to match clk0 ratio a la NIM+X
                      clk_ext => selected_ext_clkg,
                      
                      cln_clk_53 => sysclk_26,  --half to match clk0 ratio a la NIM+X
                      
                      clk_40DCM => bmx_40,
                      reset_out => reset,
                      
                      rx_wren => rx_wren_a,
                      rx_addr(31 downto 0)=>rx_addr(31 downto 0),
                      rx_data=>rx_data,
                      tx_clk => MASTER_CLK,
                      
                      clklock(0) => nim_clk_lock_loss,
                      clklock(1) => fs_gen_lock_loss,
                      clklock(2) => ei40_gen_lock_loss, 
                      --clklock(3) => ot_ps_lock_loss,
                      clklock(7 downto 3) => (others => '0'),
                                           
                      x => nim_plus_a_inputs(3 downto 0),
                      
                      burst_full_ext => nim_b_fifo_full,
                      ck_mx_out => s_ck_mx_out, --8b external clock selector (0 - is int/ext lo/hi. 6:4 - is ext source select)
                      
                      clk_39_out => open,
                      
                      dac_out => dac_din_sig,
                      muxout_1 => nim_plus_a_outputs(0),
                      muxout_2 => nim_plus_a_outputs(1),
                      muxout_3 => nim_plus_a_outputs(2),
                      muxout_4 => nim_plus_a_outputs(3),
        --              s_out => nim_out,
                      sclk => dac_sclk_sig,
                      sync => dac_sync_sig,
                      
                      
                      b_wr_out => burst_data_we_a,
                      b_read => burst_data_a(63 downto 0),
                      read_data_out => read_out_data_a(63 downto 0)
              );
              
         NIM_BLOCK_b : entity work.nim_plus_blk_1_phase_4ps
              port map(
                DAC_clk => b_nim_dac_clk,
                bkpa => s_bkpressa,
                bkpb => s_bkpressb,
                clk0 => bmx_320, --actually 160 MHz
                
                clk_13_25 => sysclk_6,    --half to match clk0 ratio a la NIM+X
                clk_26_5 => sysclk_13,    --half to match clk0 ratio a la NIM+X
                clk_ext => selected_ext_clkg,
                
                cln_clk_53 => sysclk_26,  --half to match clk0 ratio a la NIM+X
                
                clk_40DCM => bmx_40,
                reset_out => reset,
                
                rx_wren => rx_wren_b,
                rx_addr(31 downto 0)=>rx_addr(31 downto 0),
                rx_data=>rx_data,
                tx_clk => MASTER_CLK,
                
                clklock(0) => nim_clk_lock_loss,
                clklock(1) => fs_gen_lock_loss,
                clklock(2) => ei40_gen_lock_loss, 
                --clklock(3) => ot_ps_lock_loss,
                clklock(7 downto 3) => (others => '0'),
                            
                x => nim_plus_b_inputs(3 downto 0),
                
                burst_full_ext => nim_b_fifo_full,
                ck_mx_out => open,--let a control, ...s_ck_mx_out, --8b external clock selector (0 - is int/ext lo/hi. 6:4 - is ext source select)
                
                clk_39_out => open,
                
                dac_out => open,--let a control, ... dac_din_sig,
                muxout_1 => nim_plus_b_outputs(0),
                muxout_2 => nim_plus_b_outputs(1),
                muxout_3 => nim_plus_b_outputs(2),
                muxout_4 => nim_plus_b_outputs(3),
                --              s_out => nim_out,
                sclk => open,--let a control, ... dac_sclk_sig,
                sync => open,--let a control, ... dac_sync_sig,
                
                b_wr_out => burst_data_we_b,
                b_read => burst_data_b(63 downto 0),
                read_data_out => read_out_data_b(63 downto 0)
              );
           
                            
      --generate NIM+ and dual clock fifo for burst data out from nim+ block
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
         
         s_b_wr_out <= burst_data_we_a or burst_data_we_b;
         s_b_read   <= burst_data_a when burst_data_we_a = '1' else burst_data_b;
   end generate;
      
     
    CLK_MUX : clk_mux_2_to_1_x_2
        port map(
            sel         => s_ck_mx_out(0),
            
            e_160       => external_clk160,     --: in STD_LOGIC;
            e_40        => external_clk40,      --: in STD_LOGIC;
            e_53        => external_clk53,      --: in STD_LOGIC;
            e_26        => external_clk26,      --: in STD_LOGIC;
            e_13        => external_clk13,      --: in STD_LOGIC;
            e_6         => external_clk6,       --: in STD_LOGIC;
            
            i_160       => internal_clk160,     --: in STD_LOGIC;
            i_40        => bs_clk40i,           --: in STD_LOGIC;
            i_53        => internal_clk53,      --: in STD_LOGIC;
            i_26        => internal_clk26,      --: in STD_LOGIC;
            i_13        => internal_clk13,      --: in STD_LOGIC;
            i_6         => internal_clk6,       --: in STD_LOGIC;
            
            out_160     => mx_160,              --: out STD_LOGIC;
            out_40      => mx_40,               --: out STD_LOGIC;
            out_53      => sysclk_53,           --: out STD_LOGIC;
            out_26      => sysclk_26,           --: out STD_LOGIC;
            out_13      => sysclk_13,           --: out STD_LOGIC;
            out_6       => sysclk_6             --: out STD_LOGIC;           
        );          
    
    NIM_CLKS_BLOCK : NIM_CLKS
        port map( 
            MASTER_CLK          => MASTER_CLK,
            clk_out_dac125      => nim_dac_clk,
            clk_out_internal40  => bs_clk40i,
            reset               => extra_clk_reset_OR(2),
            locked              => nim_clk_lock
        );
   
    internal_clk_BLOCK : clk_wiz_internalClocks
        port map(
            clk_in_internal40   => bs_clk40i,               --: in STD_LOGIC;
            clk_out_internal160 => internal_clk160,         --: out STD_LOGIC;
            clk_out_internal26  => internal_clk26,          --: out STD_LOGIC;
            clk_out_internal13  => internal_clk13,          --: out STD_LOGIC;
            clk_out_internal6   => internal_clk6,           --: out STD_LOGIC;
            --clkfb_in            => internal_clk_fdbk_g,
            --clkfb_out           => internal_clk_fdbk,
            reset               => extra_clk_reset_OR(1),   --: in STD_LOGIC;
            locked              => fs_gen_lock              --: out STD_LOGIC
        ); 
        
--      intFeedbackClockBUFG: BUFG
--         port map( I => internal_clk_fdbk, 
--                O => internal_clk_fdbk_g);   
        

        --generate external clock PLL and source control
        genExtClkMux : for i in 0 to 0 generate
            signal selected_ext_clk : std_logic;
            -- s_ck_mx_out := 8b external clock selector (0 - is int/ext lo/hi. 6:4 - is ext source select)
        begin 
        
            extClkMux:process(s_ck_mx_out, s_clk40e, nim_inputs)
            begin
                        
                case s_ck_mx_out(7 downto 4) is
                    when x"0" =>
                        selected_ext_clk <= s_clk40e; --external clock
                    when x"1" =>
                        selected_ext_clk <= nim_inputs(0);
                    when x"2" =>
                        selected_ext_clk <= nim_inputs(1);
                    when x"3" =>
                        selected_ext_clk <= nim_inputs(2);
                    when x"4" =>
                        selected_ext_clk <= nim_inputs(3);
                    when x"5" =>
                        selected_ext_clk <= nim_inputs(4);
                    when x"6" =>
                        selected_ext_clk <= nim_inputs(5);
                    when x"7" =>
                        selected_ext_clk <= nim_inputs(6);    
                    when x"8" =>
                        selected_ext_clk <= nim_inputs(7);                    
                    when others =>
                        selected_ext_clk <= s_clk40e;
                end case;    
                           
            end process;                           
                             
                             
           extClkMuxBUFG: BUFG
              port map( I => selected_ext_clk, 
                     O => selected_ext_clkg);       
        
          end generate;
          
        clk_wiz_1_BLOCK : clk_wiz_1
            port map(  
                clk_in_external53       => selected_ext_clkg,   --: in STD_LOGIC;
                clk_out_external160     => external_clk160,     --: out STD_LOGIC;
                clk_out_external40      => external_clk40,      --: out STD_LOGIC;
                clk_out_external53      => external_clk53,      --: out STD_LOGIC;
                clk_out_external26      => external_clk26,      --: out STD_LOGIC;
                clk_out_external13      => external_clk13,      --: out STD_LOGIC;
                clk_out_external6       => external_clk6,       --: out STD_LOGIC;
                --clkfb_in                => external_clk_fdbk_g,
                --clkfb_out               => external_clk_fdbk,
                
                reset                   => extra_clk_reset_OR(1),--: in STD_LOGIC;
                locked                  => ei40_gen_lock        --: out STD_LOGIC
             
--            clk_in40e => selected_ext_clkg, --s_clk40e,
--            -- Clock out ports
--            clk_out320e => bs_clk320e,
--            clk_out40e => bs_clk40e,
--            -- Status and control signals
--            reset => extra_clk_reset_OR(1),
--            locked  => ei40_gen_lock
            );
        
--       extFeedbackClockBUFG: BUFG
--          port map( I => external_clk_fdbk, 
--                 O => external_clk_fdbk_g);   
       
          
                   
         
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
         
         IBUFGDS_CLK40_IN_EXT : IBUFDS
--         IBUFDS_CLK40_IN_EXT : IBUFDS
         generic map (
            DIFF_TERM => TRUE, -- Differential Termination 
            IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "DEFAULT")
         port map (
            O => s_clk40e,  -- Buffer output
            I => CLK40_IN_EXT_P,  -- Diff_p buffer input (connect directly to top-level port)
            IB => CLK40_IN_EXT_N -- Diff_n buffer input (connect directly to top-level port)
         );         
            
          OBUFDS_TRIGA_CMS_OUT : OBUFDS
          generic map (
             IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
             SLEW => "FAST")          -- Specify the output slew rate
          port map (
             O => TRIGA_CMS_OUT_P,     -- Diff_p output (connect directly to top-level port)
             OB => TRIGA_CMS_OUT_N,   -- Diff_n output (connect directly to top-level port)
             I => nim_outputs(0)      -- Buffer input 
          );
          
          OBUFDS_TRIGB_CMS_OUT : OBUFDS
          generic map (
             IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
             SLEW => "FAST")          -- Specify the output slew rate
          port map (
             O => TRIGB_CMS_OUT_P,     -- Diff_p output (connect directly to top-level port)
             OB => TRIGB_CMS_OUT_N,   -- Diff_n output (connect directly to top-level port)
             I => nim_outputs(0)      -- Buffer input 
          );
          
       
             
          OBUFDS_CMS_CLK40A_OUT : OBUFDS
          generic map (
             IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
             SLEW => "FAST")          -- Specify the output slew rate
          port map (
             O => CLK40A_OUT_P,     -- Diff_p output (connect directly to top-level port)
             OB => CLK40A_OUT_N,   -- Diff_n output (connect directly to top-level port)
             I => bmx_40      -- Buffer input 
           );      
           
           OBUFDS_CMS_CLK40B_OUT : OBUFDS
           generic map (
              IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
              SLEW => "FAST")          -- Specify the output slew rate
           port map (
              O => CLK40B_OUT_P,     -- Diff_p output (connect directly to top-level port)
              OB => CLK40B_OUT_N,   -- Diff_n output (connect directly to top-level port)
              I => bmx_40      -- Buffer input 
            );     
               
          
    --==============================================     
    gen_nim_ibufs : for i in 0 to 7 generate
    begin     
    
       IBUFDS_COM0 : IBUFDS
       generic map (
          DIFF_TERM => TRUE,          -- Differential Termination 
          IBUF_LOW_PWR => TRUE,       -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
          IOSTANDARD => "DEFAULT")
       port map (
          O => nim_inputs(i),         -- Buffer output
          I => NIM_COM_P(i),          -- Diff_p buffer input (connect directly to top-level port)
          IB => NIM_COM_N(i)          -- Diff_n buffer input (connect directly to top-level port)
       );
    end generate gen_nim_ibufs;
                
    --==============================================     
    gen_nim_obufs : for i in 0 to 3 generate
    begin
    
      OBUFDS_NIM_OUT : OBUFDS
      generic map (
         IOSTANDARD => "DEFAULT",     -- Specify the output I/O standard
         SLEW => "FAST")              -- Specify the output slew rate
      port map (
         O => NIM_OUT_P(i),           -- Diff_p output (connect directly to top-level port)
         OB => NIM_OUT_N(i),          -- Diff_n output (connect directly to top-level port)
         I => nim_outputs(i)          -- Buffer input 
      ); 
      
    end generate gen_nim_obufs;      
                                
                                             
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

