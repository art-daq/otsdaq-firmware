--Created at Fermilab for otsdaq
--Written by Ethan Lewis 
--2016


--Note:
--Lines with "--iMPLEMENTATION" but with inverse case will be uncommented 
--erased for implementation" will be commented out by the setup script 
--(the lines need to have the dashes adjacent to the text without a space)
	 
	 		  
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ram_interface is
	port(
		MASTER_CLK : in std_logic;
		FLASH_CLK : in std_logic;
		reset : in std_logic;
		
		--FPGA memory access
		ots_wren : in std_logic;
		ots_rden : in std_logic;
		ots_block_sel_in  : in std_logic_vector(31 downto 0);
		ots_block_addr_in : in std_logic_vector(31 downto 0);
		ots_din : in std_logic_vector(63 downto 0);
		ots_dout : out std_logic_vector(63 downto 0);
		
		eth_ready : out std_logic := '1';

-- 		internal_we : in std_logic;
--		internal_block_sel  : in std_logic_vector(31 downto 0);
--		internal_addr : in std_logic_vector(31 downto 0);
--		internal_din : in std_logic_vector(63 downto 0);
--		internal_dout : out std_logic_vector(63 downto 0);
		
		--Ports to the SPI RAM chip
		spi_reset: out STD_LOGIC;
		chip_select: out STD_LOGIC;
		io_0: inout STD_LOGIC;
		io_1: inout STD_LOGIC;
		io_2: inout STD_LOGIC;
		io_3: inout STD_LOGIC;
		SCLK : out STD_LOGIC);
		
end ram_interface;

architecture ARCH of ram_interface is

	--FIFO controls and data
	signal ram_write_data_in : std_logic_vector(63 downto 0);
	signal ram_write_data_out : std_logic_vector(0 to 63);
	signal ram_read_data_in : std_logic_vector(63 downto 0);
	signal ram_read_data_out : std_logic_vector(63 downto 0);
	signal fifo_in_we : std_logic;
	signal fifo_in_re : std_logic;
	signal fifo_out_we : std_logic;
	signal fifo_out_re : std_logic;
	
	--Signals to control ram_controller
	signal ram_ready : std_logic;
	signal ram_data_in : std_logic_vector(3 downto 0);
	signal data_in_ready : std_logic;
	signal ram_data_out : std_logic_vector(3 downto 0);
	signal ram_dv : std_logic;
	signal start_command : std_logic;
	signal intermediate_next_page_trig, next_page_trig : std_logic;
	signal write_fifo_empty, last_write_fifo_empty : std_logic := '1';
	

	--Signal to/from ram_controller direct to/from FPGA memory
	signal mode : std_logic_vector(7 downto 0);
	signal size : std_logic_vector(31 downto 0);
	signal ram_addr : std_logic_vector(31 downto 0);
	signal error : std_logic;
	signal device_id_sig : std_logic_vector(31 downto 0);
	--Start and end signals with intermediates for metastability
	signal command_info_complete : std_logic := '0'; --input
	signal ready_for_next_command : std_logic := '1';  --output
	signal intermediate_command_info_complete, intermediate_ready_for_next_command : std_logic;
	
	--Internal signals
--	signal fifo_out_empty : std_logic;
--	signal last_fifo_out_empty : std_logic := '1'; --starts up waiting to pop first quadword
--	signal last_fifo_out_read_was_automatic : std_logic := '0'; --"read" here is a noun
	signal size_counter : std_logic_vector(31 downto 0);
	signal qword_nibble_counter : std_logic_vector(3 downto 0); --should reset to x0 every 16 
	signal last_command_info_complete : std_logic;
	signal last_ram_ready : std_logic := '0';
	signal qword_to_write : std_logic_vector(0 to 63);
	signal new_command : std_logic := '0'; 
	signal info_out : std_logic_vector(63 downto 0);
--	signal internal_info_out : std_logic_vector(63 downto 0);
	signal fifo_out_re_prelatch : std_logic;
	signal force_next_page_trig : std_logic := '0';
	signal next_page_trig_en, last_next_page_trig : std_logic := '0'; 	
	signal fifo_in_write_counter, fifo_in_read_counter : std_logic_vector(31 downto 0) := (others => '0');
  signal write_fifo_prog_full : std_logic;
	signal write_fifo_prog_empty : STD_LOGIC;
signal write_fifo_full : std_logic;


	signal ots_dout_sig : std_logic_vector(63 downto 0);
--	signal internal_dout_sig : std_logic_vector(63 downto 0);

	signal ots_block_sel : unsigned (31 downto 0);
	signal ots_block_addr : unsigned (31 downto 0);
	
	
	signal temp_addr_out : std_logic_vector(23 downto 0);

--Implementation	component RAM_WRITE_FIFO 							
--Implementation    port(   rst : IN STD_LOGIC;							
--Implementation            wr_clk : IN STD_LOGIC;						
--Implementation            rd_clk : IN STD_LOGIC;						
--Implementation            din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);		
--Implementation            wr_en : IN STD_LOGIC;						
--Implementation            rd_en : IN STD_LOGIC;						
--Implementation            dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);	
--Implementation            full : OUT STD_LOGIC;						
--Implementation            empty : OUT STD_LOGIC;						 
--Implementation            prog_full : OUT STD_LOGIC;                   
--Implementation            prog_empty : OUT STD_LOGIC);				
--Implementation    end component;										
--Implementation            											
--Implementation	component RAM_READ_FIFO 							
--Implementation    port(   rst : IN STD_LOGIC;							
--Implementation            wr_clk : IN STD_LOGIC;						
--Implementation            rd_clk : IN STD_LOGIC;						
--Implementation            din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);		
--Implementation            wr_en : IN STD_LOGIC;						
--Implementation            rd_en : IN STD_LOGIC;						
--Implementation            dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);	
--Implementation            full : OUT STD_LOGIC;						
--Implementation            empty : OUT STD_LOGIC);						
--Implementation	end component;										
	
	attribute mark_debug : string;
    attribute mark_debug of fifo_in_we  : signal is "true";
	attribute mark_debug of fifo_in_re  : signal is "true";
	--attribute mark_debug of fifo_out_we : signal is "true";
	--attribute mark_debug of fifo_out_re : signal is "true";
	attribute mark_debug of command_info_complete  : signal is "true";
	attribute mark_debug of ready_for_next_command : signal is "true";
	--attribute mark_debug of intermediate_command_info_complete  : signal is "true";
	--attribute mark_debug of intermediate_ready_for_next_command : signal is "true";
	attribute mark_debug of ram_data_in  : signal is "true";
	attribute mark_debug of ram_data_out : signal is "true"; 
	--attribute mark_debug of device_id_sig : signal is "true";
	--attribute mark_debug of ram_write_data_in  : signal is "true";
	attribute mark_debug of ram_write_data_out : signal is "true";
	--attribute mark_debug of ram_read_data_in   : signal is "true";
	--attribute mark_debug of ram_read_data_out  : signal is "true";
		attribute mark_debug of next_page_trig : signal is "true";
	attribute mark_debug of next_page_trig_en : signal is "true";
	attribute mark_debug of force_next_page_trig : signal is "true";						
		attribute mark_debug of write_fifo_empty : signal is "true";								
	attribute mark_debug of write_fifo_prog_full : signal is "true"; 	
	attribute mark_debug of write_fifo_full : signal is "true"; 				
 	attribute mark_debug of write_fifo_prog_empty : signal is "true"; 						
	attribute mark_debug of reset : signal is "true";  
	attribute mark_debug of fifo_in_write_counter : signal is "true";
	attribute mark_debug of fifo_in_read_counter : signal is "true";
   -- attribute mark_debug of ots_block_sel : signal is "true";   
    --attribute mark_debug of ots_block_addr : signal is "true";


	begin 
	

	
	
	write_fifo_prog_empty <= write_fifo_empty; --SCRIPT COMMENT OUT
	
	
	
	CONTROLLER : entity work.ram_controller
		port map(
		temp_addr_out => temp_addr_out,
		FLASH_CLK => FLASH_CLK,
		reset_in => reset,
		--Signals to controller
		start_command => start_command,
		error => error,
		ready => ram_ready,
		mode => mode,
		size =>size,
		start_addr => ram_addr,
		data_in => ram_data_in,
		data_in_ready => data_in_ready,
		data_out => ram_data_out,
		dv => ram_dv,
		device_id => device_id_sig,	 
		next_page => intermediate_next_page_trig,
		write_fifo_prog_empty =>write_fifo_prog_empty,
		--RAM ports
		SCLK => SCLK,
		chip_select => chip_select,
		reset => spi_reset,
		io_0 => io_0,
		io_1 => io_1,
		io_2 => io_2,
		io_3 => io_3);
		
--Implementation        write_fifo : RAM_WRITE_FIFO 					 
--Implementation            port map(									 
--Implementation                rst => reset,							 
--Implementation                wr_clk => MASTER_CLK,					 
--Implementation                rd_clk => FLASH_CLK,					 
--Implementation                din => ram_write_data_in,				 
--Implementation                wr_en => fifo_in_we,					 
--Implementation                rd_en => fifo_in_re,					 
--Implementation                dout => ram_write_data_out,				 
--Implementation                full => write_fifo_full,							 
--Implementation                empty => write_fifo_empty,			   
--Implementation				  prog_full => write_fifo_prog_full,	 
--Implementation				  prog_empty => write_fifo_prog_empty);
--Implementation                										 
--Implementation        read_fifo : RAM_READ_FIFO 						 
--Implementation            port map(									 
--Implementation                rst => reset,							 
--Implementation                wr_clk => FLASH_CLK,					 
--Implementation                rd_clk => MASTER_CLK,					 
--Implementation                din => ram_read_data_in,				 
--Implementation                wr_en => fifo_out_we,					 
--Implementation                rd_en => fifo_out_re,					 
--Implementation                dout => ram_read_data_out,				 
--Implementation                full => open,							 
--Implementation                empty => open); --fifo_out_empty);		 
--Implementation														 
		
	DATA_IN_FIFO : entity work.reg_fifo													  --SCRIPT COMMENT OUT
		generic map (width => 64, depth => 512, addr => 9, read_latency => "0")			  --SCRIPT COMMENT OUT
		port map(  																		  --SCRIPT COMMENT OUT
			DATA => ram_write_data_in,													  --SCRIPT COMMENT OUT
			Q =>  ram_write_data_out,													  --SCRIPT COMMENT OUT
			WCLOCK => MASTER_CLK,														  --SCRIPT COMMENT OUT
			RCLOCK => FLASH_CLK,														  --SCRIPT COMMENT OUT
			WE => fifo_in_we, 															  --SCRIPT COMMENT OUT
			RE => fifo_in_re, 															  --SCRIPT COMMENT OUT
			RESET => reset,																  --SCRIPT COMMENT OUT
			RD_COUNT=>open,								   								  --SCRIPT COMMENT OUT
            EMPTY=>write_fifo_empty,							    								  --SCRIPT COMMENT OUT
            FULL=>write_fifo_full																	  --SCRIPT COMMENT OUT
		); 																				  --SCRIPT COMMENT OUT
																						  --SCRIPT COMMENT OUT
	DATA_OUT_FIFO : entity work.reg_fifo												  --SCRIPT COMMENT OUT
		generic map (width => 64, depth => 512, addr => 9, read_latency => "0")			  --SCRIPT COMMENT OUT
		port map(  																		  --SCRIPT COMMENT OUT
			DATA => ram_read_data_in,													  --SCRIPT COMMENT OUT
			Q =>  ram_read_data_out,													  --SCRIPT COMMENT OUT
			WCLOCK => FLASH_CLK,														  --SCRIPT COMMENT OUT
			RCLOCK => MASTER_CLK,														  --SCRIPT COMMENT OUT
			WE => fifo_out_we, 															  --SCRIPT COMMENT OUT
			RE => fifo_out_re, 															  --SCRIPT COMMENT OUT
			RESET => reset,																  --SCRIPT COMMENT OUT
			RD_COUNT=>open,								   								  --SCRIPT COMMENT OUT
            EMPTY=>open,--fifo_out_empty,							    						  --SCRIPT COMMENT OUT
            FULL=>open																	  --SCRIPT COMMENT OUT
		);																				  --SCRIPT COMMENT OUT
		
		
		
		
		
	--mux to determine if dout is latched data or fifo data
	fifo_out_re_prelatch <= '1' when ots_block_sel = 2 and ots_block_addr = 5 and ots_rden = '1'  else '0';
	ots_dout <= ram_read_data_out when fifo_out_re = '1' else info_out;	
--	internal_dout_sig <= ram_read_data_out when fifo_out_re = '1' else internal_info_out;
		
	
	eth_ready <= '0' when ots_block_sel = 2 and ots_block_addr = 9 and ots_rden = '1' and ready_for_next_command = '0' and mode(0) = '1' --checking if ready during write command
						and next_page_trig = '0' and force_next_page_trig = '0'                           --and not ready
						else '1'; 
	
	ots_block_sel <= unsigned(ots_block_sel_in);
	ots_block_addr <= unsigned(ots_block_addr_in);
	
	process(MASTER_CLK)					        
	begin
		if (rising_edge(MASTER_CLK)) then --the only behavior triggered on MASTER_CLK (125 MHz) is access by the rest of the FPGA 
			fifo_in_we <= '0';
			--fifo_out_re <= '0';
			fifo_out_re <= fifo_out_re_prelatch;
			next_page_trig <= intermediate_next_page_trig;	
			last_next_page_trig <= next_page_trig;
			
			
			intermediate_ready_for_next_command <= ready_for_next_command;
		
			
--			last_fifo_out_empty <= fifo_out_empty;
--			
--			--I DON'T KNOW IF THE IMPLEMENTED FIFO WORKS THE SAME WAY, but I think it does
--			--Functionality to read automatically first quadword of fifo_out when it first gets data to make up for latency																  
--			--If first clock fifo has data after the user emptied it (or start up)
--			if (last_fifo_out_empty='1' and fifo_out_empty = '0' and last_fifo_out_read_was_automatic='0') then 
--				fifo_out_re <= '1';
--				last_fifo_out_read_was_automatic <='1';
--			end if;
			
		
			if ( ots_wren = '1' and  				-- WRITE ram ===========
				 ots_block_sel = 2) then -- RAM block address space
				if ( ots_block_addr = 0 ) then 
					 intermediate_command_info_complete <= ots_din(0); 
				elsif ( ots_block_addr = 1 ) then 
					 ram_addr <= ots_din(23 downto 0) & x"00"; 
				elsif ( ots_block_addr = 2 ) then 
					 size <= ots_din(28 downto 0) & "000"; --user gives size in qwords, this multiplies by 8 to get size in bytes 
				elsif ( ots_block_addr = 3 ) then 
					 mode <= ots_din(7 downto 0); 
				elsif ( ots_block_addr = 4 ) then 
					ram_write_data_in <= ots_din(63 downto 0);
					fifo_in_write_counter <= fifo_in_write_counter + 8;
					fifo_in_we <= '1';
				end if;
			end if;
		
			if ( ots_rden = '1' and  				-- READ ram ===========
				 ots_block_sel = 2) then -- RAM block address space
				 info_out <= (others => '0'); 
				 next_page_trig_en <= '0';
				 --if ( ots_block_addr = x"5" ) then 
					--ots_dout(63 downto 0) <= ram_read_data_out;--this is from last fifo read but the auto read makes up for it
					--fifo_out_re <= '1';
					--last_fifo_out_read_was_automatic <= '0';
				if ( ots_block_addr = 6 ) then 
					 info_out(0) <= intermediate_ready_for_next_command; 
				elsif ( ots_block_addr = 7 ) then 
					info_out(0) <= error;	   	
				elsif ( ots_block_addr = 8 ) then 
                    info_out(31 downto 0) <= device_id_sig;
                elsif ( ots_block_addr = 1 ) then 
                    info_out(31 downto 0) <= ram_addr;
                elsif ( ots_block_addr = 2 ) then 
                    info_out(31 downto 0) <= size;
                elsif ( ots_block_addr = 3 ) then 
                    info_out(7 downto 0) <= mode; 
				elsif ( ots_block_addr = 9 ) then --asking when to write ( or read?) next page
					info_out(0) <= '1';	 
					info_out(31 downto 8) <= temp_addr_out;
					force_next_page_trig <= '0';
					if (force_next_page_trig = '0') then
						next_page_trig_en <= '1';
					end if;
					if (intermediate_ready_for_next_command = '1' ) then
						info_out(1) <= '1';
					end if;
				end if;
			end if;	 										   
			
--			--    ====       ====      ====     ====       ====    ====       ====      ====     ====       ====
--			--    ====       ====      ====     ====       ====    ====       ====      ====     ====       ====
--			--Below is for internal read/writes. IT IS UP TO THE USER not to race with the ots/ethernet for fifo and other signals
--			--    ====       ====      ====     ====       ====    ====       ====      ====     ====       ====
--			--    ====       ====      ====     ====       ====    ====       ====      ====     ====       ====
--			
--			if ( internal_we = '1' and  				-- WRITE ram ===========
--				 internal_block_sel = x"2") then -- RAM block address space
--				if ( internal_block_addr = x"0" ) then 
--					 intermediate_command_info_complete <= internal_din(0); 
--				elsif ( internal_block_addr = x"1" ) then 
--					 ram_addr <= internal_din(23 downto 0) & x"00"; 
--				elsif ( internal_block_addr = x"2" ) then 
--					 size <= internal_din(28 downto 0) & "000"; --user gives size in qwords, this multiplies by 8 to get size in bytes 
--				elsif ( internal_block_addr = x"3" ) then 
--					 mode <= internal_din(7 downto 0); 
--				elsif ( internal_block_addr = x"4" ) then 
--					ram_write_data_in <= internal_din(63 downto 0);
--					fifo_in_write_counter <= fifo_in_write_counter + 8;
--					fifo_in_we <= '1';
--				end if;
--			end if;
--		
--			if (						-- READ ram  (always read internal)===========
--				 ots_block_sel = x"2") then -- RAM block address space
--				 internal_info_out <= (others => '0'); 
--				 next_page_trig_en <= '0';
--				 --if ( ots_block_addr = x"5" ) then 
--					--ots_dout(63 downto 0) <= ram_read_data_out;--this is from last fifo read but the auto read makes up for it
--					--fifo_out_re <= '1';
--					--last_fifo_out_read_was_automatic <= '0';
--				if ( internal_block_addr = x"6" ) then 
--					 internal_info_out(0) <= intermediate_ready_for_next_command; 
--				elsif ( internal_block_addr = x"7" ) then 
--					internal_info_out(0) <= error;	   	
--				elsif ( internal_block_addr = x"8" ) then 
--                   internal_info_out(31 downto 0) <= device_id_sig;
--               elsif ( internal_block_addr = x"1" ) then 
--                   internal_info_out(31 downto 0) <= ram_addr;
--               elsif ( internal_block_addr = x"2" ) then 
--                   internal_info_out(31 downto 0) <= size;
--               elsif ( internal_block_addr = x"3" ) then 
--                   internal_info_out(7 downto 0) <= mode; 
--				elsif ( internal_block_addr = x"9" ) then --asking when to write ( or read?) next page
--					internal_info_out(0) <= '1';	 
--					force_next_page_trig <= '0';
--					if (force_next_page_trig = '0') then
--						next_page_trig_en <= '1';
--					end if;
--					if (intermediate_ready_for_next_command = '1' ) then
--						internal_info_out(1) <= '1';
--					end if;
--				end if;
--			end if;
			
			
			if next_page_trig = '1' and last_next_page_trig = '0' then
				if next_page_trig_en = '1' then --if next page trig was read and ram ready for next page 
					next_page_trig_en <= '0';
				else
					force_next_page_trig <= '1';  
			end if;
		end if;
		end if;
		

		
	end process;
	
	process (FLASH_CLK)
	begin
		if (falling_edge(FLASH_CLK)) then
			command_info_complete <= intermediate_command_info_complete;
			
			
			fifo_in_re <='0';
			fifo_out_we <= '0';
			
			start_command <='0';
			last_command_info_complete <= command_info_complete;
			last_ram_ready <= ram_ready;
			last_write_fifo_empty <= write_fifo_empty;
			
			
			if ((command_info_complete = '1') and (ram_ready = '1') and (new_command = '1') )	then
				start_command <= '1';
				new_command <= '0';	
				size_counter <= size;
				qword_nibble_counter <= (others => '0');
				
			end if;
			if (fifo_in_re='1') or (last_write_fifo_empty = '1' and write_fifo_empty = '0') then 
				qword_to_write <= ram_write_data_out;  
			end if;
			if (last_command_info_complete = '0') and  (command_info_complete = '1') then
				ready_for_next_command <= '0';
				new_command <= '1';
			end if;
			if (last_ram_ready = '0') and (ram_ready = '1') and (new_command = '0') then
				ready_for_next_command <= '1';
			end if;	
			
			--Handle write data input
			if (data_in_ready = '1') and not(unsigned(size_counter) = 0) then
				qword_nibble_counter <= qword_nibble_counter +1;
				if (qword_nibble_counter(0)='1') then --if second nibble in byte (odd number because starts at 0)
					size_counter <= size_counter -1;
				end if;
				if not(qword_nibble_counter = "1111") then
					qword_to_write <= qword_to_write(4 to 63) & x"0";
				end if;															 
				if (qword_nibble_counter = "1110") then
					fifo_in_re <= '1';
					fifo_in_read_counter <= fifo_in_read_counter + 8;
				end if;	
				ram_data_in <= qword_to_write(0 to 3);
			end if;
			
			--Handle read data output
			if (ram_dv = '1') then
				qword_nibble_counter <= qword_nibble_counter + 1;
				if (qword_nibble_counter = "1111") then
					fifo_out_we <='1'; 		
				end if;
				ram_read_data_in <= ram_read_data_in(59 downto 0) & ram_data_out;
			end if;
			
				
		end if;		
	end process;		
end ARCH;
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			


   

