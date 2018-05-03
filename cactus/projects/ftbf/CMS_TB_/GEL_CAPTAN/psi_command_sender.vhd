library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity psi_command_sender is
    Port ( psi_clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           fifo_re : out  STD_LOGIC;
           fifo_empty : in  STD_LOGIC;	
           fifo_full : in  STD_LOGIC;
           data : in  STD_LOGIC_Vector(31 downto 0);						   
		   	-- errors require a reset to clear
		   data_error : out STD_LOGIC; --invalid command type received
		   we_error : out STD_LOGIC;   --we received before block could respond
		   data_out : out std_logic);
end psi_command_sender;

architecture Behavioral of psi_command_sender is

		-- DOWN signals
	signal data_down : std_logic; 
	signal started_down : std_logic; 
	
		-- shared signals			
	signal shared_start_sig : std_logic;
	signal shared_stop_sig : std_logic;  
	
		-- UP signals
	signal data_up : std_logic;	    		
	signal flip_bit_pause : std_logic; 			
	signal derror : std_logic;						
	signal werror : std_logic;
	signal data_latch :  STD_LOGIC_Vector(31 downto 0);	 
	signal bit_count :  STD_LOGIC_Vector(5 downto 0); 	 
	signal bit_offset :  STD_LOGIC_Vector(5 downto 0); 		 
	signal four_count :  STD_LOGIC_Vector(2 downto 0);  
	signal state : STD_LOGIC_Vector(1 downto 0); 
	
begin	 
	
	data_out <= data_down or data_up;	
	data_error <= derror; 
	we_error <= werror;

	risep:process(psi_clk)
	begin	   
		
		if rising_edge(psi_clk) then  
						
			shared_stop_sig <= '0';	  
			shared_start_sig <= '0';
			data_up <= '0';		   	   
			fifo_re <= '0';
			
			if reset = '1' then	
								 	
				flip_bit_pause <= '0';
				bit_count <= (others => '0');	
				bit_offset <= (others => '0');	 
				four_count <= (others => '0');	  
				derror <= '0';
				werror <= '0'; 	
				state <= (others => '0');	 
				
			else	 
				
				if fifo_full = '1' and fifo_empty = '0' then	-- to avoid fifo reset triggering error
					werror <= '1';
				end if;
				
				if derror = '0' and werror = '0' then		
					
					
					if state = "00" and fifo_empty = '0' then -- data in fifo so read	 
						
						fifo_re <= '1';	
						state <= "01";	  
						
					elsif state = "01" then -- delay latch of data by one clk
						
						shared_start_sig <= '1'; -- indicate start to down process 	 
						state <= "10";		
						
					elsif state = "10" then -- begin sequence (data can be latched now)
						
						state <= "11";	
						
						data_latch <= data;
						four_count <= (others => '0');	 
						flip_bit_pause <= '0';
						
						if data(27 downto 24) = x"8" then	 
							bit_count <= "011" & "000";			   
							bit_offset <= "011" & "000";
						elsif data(27 downto 24) = x"4" then
							bit_count <= "100" & "000";		 
							bit_offset <= "100" & "000";
						elsif data(27 downto 24) = x"2" then
							bit_count <= "100" & "000";		 
							bit_offset <= "100" & "000";
						elsif data(27 downto 24) = x"1" then
							bit_count <= "001" & "000";		
							bit_offset <= "001" & "000";
						else
							bit_count <= "000" & "000";	 
							bit_offset <= "000" & "000";	
							derror <= '1';
						end if;		  
					
					elsif state = "11" then		
						
						if flip_bit_pause = '1' then
							flip_bit_pause <= '0'; 
							data_up <= not data_up;	   
							
							if bit_count = 0 then	
								state <= "00";   
								shared_stop_sig <= '1';
							end if;	
							
						else
								
							four_count <= four_count + 1;	 
					
							if four_count = 3 then 
								flip_bit_pause <= '1';
								four_count <= (others => '0');
							end if;
							
							if bit_count > 0 then
								data_up <= data_latch(31 - (conv_integer(bit_offset)-conv_integer(bit_count)));
							else
								derror <= '1';
							end if;
							
							if bit_count /= 0 then	 
								bit_count <= bit_count - 1;	  								
							end if;			 
					
						end if;	  
						
					end if;
				end if;
				
			end if;
				
		end if;
		
	end process; 
	
	fallp:process(psi_clk)
	begin
		if falling_edge(psi_clk) then
								  
			data_down <= '1';  	  
			
			if reset = '1' then				   
				
				started_down <= '0';  
				
			elsif derror = '0' and werror = '0' then
				
				if shared_start_sig = '1' then -- start process
					
					started_down <= '1'; 	 
					
				elsif started_down = '1' then
					
					data_down <= '0';		 
					
					if shared_stop_sig = '1' then 
						started_down <= '0';   
					end if;
					
				end if;	 
				
			end if;	
		end if;
		
	end process;


end Behavioral;

