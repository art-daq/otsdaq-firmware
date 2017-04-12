--erased --------------------------------------------------------------------------------

--erased -- IMPORTANT!! IMPORTANT!! 				
--erased -- It's very important to note!!!   	
--erased -- 										
--erased -- The script that moves these files into a Firmware project will 		   
--erased --  remove all "" comments.. 												
--erased" 

----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    03:25:55 11/03/2013 
-- Design Name:    stib
-- Module Name:    trigproc - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    generate trigger numbers
--
-- Dependencies:   chip_fifo
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity trigproc is
  port ( reset : in std_logic;
         fbcoclk : in  std_logic;
         bcoclk : in  std_logic;
         bco : in  std_logic_vector (7 downto 0);
         fbco : in  std_logic_vector (2 downto 0);
         trig_input : in std_logic_vector(3 downto 0);
         bco_offset : in std_logic_vector(3 downto 0);
         send_trignum : in std_logic;
         trigger_number : out std_logic_vector(39 downto 0);
         clear : in std_logic;
         addr : out std_logic_vector(7 downto 0);
         spy_data : out std_logic_vector(31 downto 0);
         spy_data_valid : out std_logic;
         rdclk : in std_logic;                   -- reads the data fifo
         fifo_empty : out std_logic;             -- data fifo empty flag
         dout : out std_logic_vector(31 downto 0);  -- fifo output
         token_in : in std_logic;                -- token in
         token_out : out std_logic;              -- token out
         dout_valid : out std_logic             -- asserted when data is being read
       );
end trigproc;

architecture Behavioral of trigproc is

 component chip_fifo
   port (
     rst : in std_logic;
     wr_clk : in std_logic;
     rd_clk : in std_logic;
     din : in std_logic_vector(35 downto 0);
     wr_en : in std_logic;
     rd_en : in std_logic;
     dout : out std_logic_vector(35 downto 0);
     full : out std_logic;
     empty : out std_logic
   );
 end component;

  component trigcounter
    port (
      clk : in std_logic;
      ce : in std_logic;
      sclr : in std_logic;
      q : out std_logic_vector(39 downto 0)
    );
  end component;

  signal trigger_state : std_logic := '0';
  signal trig_fifo_we : std_logic;
  signal trig_fifo_input : std_logic_vector(35 downto 0);
  signal trigger_count : std_logic_vector(39 downto 0);
  signal trigger_count_enable : std_logic;
  signal trigger_write_addr : std_logic_vector(7 downto 0);

  signal trig_fifo_empty : std_logic;
  signal trig_fifo_full : std_logic;
  signal read_enable : std_logic;
  signal token : std_logic;
  signal next_token_out : std_logic;
  signal fifo_output : std_logic_vector(35 downto 0);

begin
	
	 					   			
--erased			   
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
--erased
  													
  
  
	
 fifo_imp : chip_fifo
 port map (
   rst => reset,
   wr_clk => fbcoclk,
   rd_clk => rdclk,
   din => trig_fifo_input,
   wr_en => trig_fifo_we,
   rd_en => read_enable,
   full => trig_fifo_full,
   empty => trig_fifo_empty,
   dout => fifo_output
 );


	trigcounter_imp : for i in 0 to 0 generate
		signal tmpcnt : unsigned(39 downto 0) := (others => '0');
		signal old_trigger_count_enable : std_logic;
	begin			
		trigger_count <= std_logic_vector(tmpcnt);
		process(bcoclk)
		begin	 
			if (rising_edge(bcoclk)) then
				
				old_trigger_count_enable <= trigger_count_enable;
				if (clear = '1') then
					tmpcnt <= (others => '0');					
				elsif (old_trigger_count_enable = '0' and trigger_count_enable = '1') then --RAR edit to avoid double counting
					tmpcnt <= tmpcnt + 1;
				end if;
				
			end if;			
		end process;
	end generate;
	
--  trigcounter_imp : trigcounter
--  port map (
--    clk => bcoclk,
--    ce => trigger_count_enable,
--    sclr => clear,
--    q => trigger_count
--  );
--
process ( fbcoclk, fbco, trig_input ) begin
   if ( fbcoclk'event and fbcoclk = '1' ) then
       old_send_trig <= trig_input(3);
       trig_fifo_we <= '0';
     if ( trigger_state = '0') then
       if ( old_send_trig = '0' and -- get rising edge of trigger input 3 
           fbco(1 downto 0) = "01" and trig_input /= "0000" ) then
           
         trigger_count_last <= trigger_count(3 downto 0);
            
         if (trigger_count_last /= trigger_count(3 downto 0)) then -- avoid repeats
             trig_fifo_input <= "0000" & trigger_count(15 downto 0) & 
               std_logic_vector(unsigned(trigger_write_addr)+1) & x"a8";          
             trigger_state <= '1';
             trig_fifo_we <= '1';          
             spy_data <= trigger_count(15 downto 0) & trigger_write_addr & x"a8";
             spy_data_valid <= '1';
         end if;
         
       else
         trig_fifo_we <= '0';
         spy_data_valid <= '0';
       end if;
     else
       trig_fifo_input <= "0000" & trigger_count(39 downto 16) & x"b8";
       trigger_state <= '0';

       trig_fifo_we <= '1';                  
       spy_data <= trigger_count(39 downto 16) & x"b8";
       spy_data_valid <= '1';
     end if;
   end if;
 end process;

 process ( rdclk ) begin
   if ( rdclk'event and rdclk = '1' ) then
     if ( reset = '1' ) then
       token <= '0';
     else
       if ( trig_fifo_empty = '0' ) then
         if ( token_in = '1' ) then
           token <= '1';
           dout_valid <= '1';
         else
           token <= '0';
           dout_valid <= '0';
         end if;
       else
         token <= '0';
         dout_valid <= '0';
       end if;
     end if;
   end if;
 end process;

 trigger_write_addr <= std_logic_vector(unsigned(bco)-unsigned(bco_offset));
 addr <= trigger_write_addr;
 trigger_count_enable <= '1' when trig_input /= "0000" else '0';

 read_enable <= token_in and not trig_fifo_empty;
 fifo_empty <= trig_fifo_empty;
 dout <= fifo_output(31 downto 0);
 token_out <= token or token_in when trig_fifo_empty = '1' else token;
 trigger_number <= trigger_count;

end Behavioral;

