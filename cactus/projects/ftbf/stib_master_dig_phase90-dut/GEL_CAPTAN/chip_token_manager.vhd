	--=============================================================================
	-- Project: Chip Sync
	-- Copyright: 
	-- Author: Ryan Rivera 
	-- Revision:  
	-- Last revised: 
	-- Workfile: 
	-- Archive: 
	-------------------------------------------------------------------------------
	-- Description:	Chip Sync for FPix2.1 serial out synchronization
	-- 
	-- 
	-------------------------------------------------------------------------------
	
	-------------------------------------------------------------------------------
	-- Revision History:
	--
	-- 
	-- 
	--=============================================================================
	
	library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	
	entity chip_token_manager is
		port (
		
		reset : in std_logic;  -- reset synchronous with clk
		clk : in std_logic;
		token_in : in std_logic;  
		first_in_token_chain : in std_logic;
		
		plaq_id : in std_logic_vector(2 downto 0); -- appended to data when in pixel mode
		cal_trig_sel : in std_logic;  -- 0 puts trig_num into 51:32, 1 puts cal_tag		
		cal_tag : in std_logic_vector(15 downto 0); -- appended to data when in pixel mode and cal_tag mode
		
		tokin_cnt : in std_logic_vector(19 downto 0); 
		trig_cnt : in std_logic_vector(19 downto 0); 
		time_stamp : in std_logic_vector(12 downto 0); 
		tkstack_cnt : in std_logic_vector(3 downto 0); 			
		
		pdin : in std_logic_vector(28 downto 0);  			   
		pdin_we : in std_logic;		
		
		b_mode_sel : in  STD_LOGIC_VECTOR (4 downto 0);	  	

		trig_tok_diff : out std_logic_vector(3 downto 0); 				
		
		ovf_err : out std_logic; 
		token_out : out std_logic; 	
		bus_dout : inout std_logic_vector(63 downto 0);  -- 63:48 is calTag. 31:29 is plaqId when in pixel mode
		we_out : out std_logic
			);
	end chip_token_manager;		
									 
	
	-- token manager passes token when has no data and places output lines at high impedence
	-- when there is data, having token gives right to take over bus lines.
	architecture chip_token_manager_arch of chip_token_manager is					
		signal have_data: std_logic; 
		signal latch_d : std_logic_vector(63 downto 0); 
		
		signal token_delay : std_logic;		
		signal first_token : std_logic;	 
		signal need_first_token : std_logic;  
		signal ovf_err_sig : std_logic;
		
	begin						   
		
		token_out <= token_delay when first_in_token_chain = '0' else first_token;
		ovf_err <= ovf_err_sig;
		
		
		-- if in normal psid data mode, allows all we to take place
		-- if in debug mode, only selected plaquette is allowed to write
		process(clk)
		begin
			if rising_edge(clk) then  
				
				token_delay <= token_in; -- delay token in by one clock edge
				trig_tok_diff <= trig_cnt(3 downto 0) - tokin_cnt(3 downto 0);	
				
				if reset = '1' then		   
					ovf_err_sig <= '0';
					have_data <= '0';
					bus_dout <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					we_out <= '0';	  
					
					first_token <= '0';
					need_first_token <= '1';				
					
				elsif b_mode_sel(4 downto 2) = "001" then  -- pixel data mode	================================================================================
					
						-- TOKEN GENERATION
					if first_in_token_chain = '1' then  -- gen 1 clk pulse token to pass
						if need_first_token = '1' then
							first_token <= '1';	  
							need_first_token <= '0';
						elsif token_in = '1' then
							first_token <= '1';
						elsif first_token = '1' then
							first_token <= '0';
						end if;
					end if;
					
						-- OUTPUT LATCHED INPUT WITH TOKEN	
					if token_in = '1' and have_data = '1' and ovf_err_sig = '0' then -- token manager has bus	 					
					
						bus_dout <= latch_d; 						
						we_out <= '1';	   
						have_data <= '0';
						
					else
						bus_dout <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
						we_out <= '0';
					end if;
					
						-- LATCH NEW INPUT
					if pdin_we = '1' then  -- valid input data
						if have_data = '1' and token_in = '0' then
							ovf_err_sig <= '1';
						else
						
							if pdin(27 downto 23) = "11111" then -- status word (Chip ID 31 is illegal!!!)
							
								latch_d(63) <= '1'; -- indicates status
								latch_d(62 downto 61) <= plaq_id(1 downto 0);
								latch_d(60) <= pdin(0); -- level error
								latch_d(59) <= pdin(1); -- token out missing error
								latch_d(58) <= pdin(2); -- repeat pixel error
								latch_d(57) <= ovf_err_sig; -- indicates data overflow in chip_token_manager for this plaquette channel
								latch_d(56 downto 53) <= tkstack_cnt;  --tokens in stack
								latch_d(52 downto 40) <= time_stamp;	
								latch_d(39 downto 20) <= trig_cnt(19 downto 0);
								latch_d(19 downto 0) <= tokin_cnt(19 downto 0);								
							
							else
								latch_d(63) <= '0';	--latch_d(63 downto 52) <= (others => '0');
								latch_d(62 downto 52) <= time_stamp(10 downto 0); --added by RAR
								if cal_trig_sel = '0' then
									latch_d(51 downto 32) <= tokin_cnt;
								else
									latch_d(51 downto 48) <= (others => '0');
									latch_d(47 downto 32) <= cal_tag;							
								end if;
								latch_d(31 downto 29) <= plaq_id;
								latch_d(28 downto 0) <= pdin; 	
							end if;
							
							have_data <= '1';
						end if;
					end if;
					
				else				  					 -- debug mode	================================================================================	
					
					if b_mode_sel(1 downto 0) = plaq_id(1 downto 0) then
						we_out <= pdin_we;			
						
						bus_dout(63 downto 52) <= (others => '0');
						if cal_trig_sel = '0' then
							bus_dout(51 downto 32) <= tokin_cnt;
						else
							bus_dout(51 downto 48) <= (others => '0');
							bus_dout(47 downto 32) <= cal_tag;							
						end if;
						bus_dout(31 downto 29) <= plaq_id;
						bus_dout(28 downto 0) <= pdin; 	
					else
						we_out <= '0';	 
						bus_dout <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					end if;
					
				end if;
				
			end if;		
		end process;
		
		
	end chip_token_manager_arch;	