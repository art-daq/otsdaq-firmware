-- *************************************************
-- Behavioral description of dual-port FIFO with
-- *************************************************
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;	
use IEEE.std_logic_unsigned.all;	   

entity reg_fifo is
	generic (
		width : integer:=16;
		depth : integer:=64;
		addr : integer:=6;
		read_latency : unsigned(0 downto 0):= "1"  -- number of clocks after read enable that data is ready (0 or 1)
		);
	port (
		DATA : in std_logic_vector (width-1 downto 0);	 
		Q : out std_logic_vector (width-1 downto 0);
		WCLOCK : in std_logic;
		RCLOCK : in std_logic;
		WE : in std_logic;		
		RE : in std_logic;
		RESET : in std_logic;		  
		RD_COUNT : out std_logic_vector (addr downto 0);
		FULL : out std_logic;
		EMPTY : out std_logic
	 );
end reg_fifo;			  
							    
architecture behavioral of reg_fifo is
	type MEM is array(0 to depth-1) of std_logic_vector(width-1 downto 0);
	signal ramTmp : MEM;								   						   
	signal WAddress : std_logic_vector (addr-1 downto 0) := (others =>'0');
	signal WAddress_rclk : std_logic_vector (addr-1 downto 0) := (others =>'0');
	signal RAddress : std_logic_vector (addr-1 downto 0) := (others =>'0'); 
	signal words : std_logic_vector (addr-1 downto 0); 
	signal empty_sig : std_logic := '1'; 				
	signal lastQ : std_logic_vector (width-1 downto 0); 			   
begin		
	EMPTY <= empty_sig;
					
	-- ########################################################
	-- # Write Functional Section
	-- ########################################################
	WRITE_POINTER : process (RESET, WCLOCK)
	begin
		if (RESET = '1') then
			WAddress <= (others => '0');
		elsif (WCLOCK'event and WCLOCK = '1') then
			if (WE = '1') then
				if (WAddress = words) then
					WAddress <= (others => '0');
				else
					WAddress <= WAddress + '1';
				end if;
			end if;
		end if;
	end process;
	
	WRITE_RAM : process (WCLOCK)
	begin
		if (WCLOCK'event and WCLOCK = '1') then
			if (WE = '1') then
				ramTmp (conv_integer (WAddress)) <= DATA;
			end if;
		end if;
	end process;			 
	
	
	-- ########################################################
	-- # Read Functional Section
	-- ########################################################
	READ_POINTER : process (RESET, RCLOCK)
	begin
		if (RESET = '1') then
			RAddress <= (others => '0');
		elsif (RCLOCK'event and RCLOCK = '1') then
			if (RE = '1') then
				if (RAddress = words) then
					RAddress <= (others => '0');
				elsif(empty_sig = '0') then --only allow read when not empty_sig  
					RAddress <= RAddress + '1';
				end if;
			end if;
		end if;	
	end process;
	
	READ_RAM : process (RAddress,ramTmp,RE,RCLOCK)
	begin						 
		if (read_latency = 0) then	   	--data ready 0 clocks after read enable
			if(RE = '1') then
				Q <= ramTmp(conv_integer(RAddress));
			--	lastQ <= ramTmp(conv_integer(RAddress));
			else
				Q <= lastQ;--(others => 'U');
			end if;		  						  
		else							--data ready 1 clocks after read enable
			Q <= lastQ;	   
		end if;
		
		
		if (rising_edge(RCLOCK)) and RE='1' then 	  
			lastQ <= ramTmp(conv_integer(RAddress));
		end if;	
			  
	end process;		  
	
	
	-- ########################################################
	-- # Full Flag Functional Section : Active high
	-- ########################################################
	FULLLAG : process (RESET, RCLOCK)
	begin
		if (RESET = '1') then
			FULL <= '0';
		elsif (RCLOCK'event and RCLOCK = '1') then
			if (WE = '1' and RE = '0') then
				if ((WAddress = RAddress-1) or ((WAddress = depth-1) and (RAddress = 0))) then
					FULL <= '1';
				end if;
			else
				FULL <= '0';
			end if;
		end if;
	end process;		 	   
	
	
	-- ########################################################
	-- # empty_sig Flag Functional Section : Active low
	-- ########################################################
	EMPTYLAG : process (RESET, RCLOCK)
	begin
		if (RESET = '1') then
			empty_sig <= '1';	 
			WAddress_rclk <= (others => '0');
		elsif (RCLOCK'event and RCLOCK = '1') then 
			WAddress_rclk <= WAddress;	
			RD_COUNT(addr) <= '0';
			RD_COUNT(addr-1 downto 0) <= WAddress_rclk - RAddress;
			--if (RE = '1' and WE = '0') then
			--	if ((WAddress = RAddress+1) or ((RAddress = depth-1) and (WAddress = 0))) then
			--if ((WAddress_rclk = RAddress) or (WAddress_rclk = RAddress+1) or ((RAddress = depth-1) and (WAddress = 0))) then
			if (WAddress_rclk = RAddress) then
					empty_sig <= '1';
			--	end if;	
			elsif (RE = '1' and --WE = '0' and  
				--((WAddress_rclk = RAddress+2) or ((RAddress = depth-2) and (WAddress_rclk = 0))))  then	   
				((WAddress_rclk = RAddress+1) or ((RAddress = depth-1) and (WAddress_rclk = 0))))  then	   
				empty_sig <= '1';
			else
				empty_sig <= '0';
			end if;	 
		end if;
	end process;		  
	
	
end behavioral;