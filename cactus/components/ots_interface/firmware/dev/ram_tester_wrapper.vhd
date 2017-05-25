library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity ram_tester_wrapper is 
	port (
		FLASH_CLK : in STD_LOGIC;
		MASTER_CLK : in STD_LOGIC; 
		reset : in STD_LOGIC);
end ram_tester_wrapper;


architecture arch of ram_tester_wrapper is

signal ots_rden : STD_LOGIC := '0';
signal ots_wren : STD_LOGIC := '0';
signal ots_block_addr : STD_LOGIC_VECTOR(31 downto 0);
signal ots_block_sel : STD_LOGIC_VECTOR(31 downto 0) := x"00000002";
signal ots_din : STD_LOGIC_VECTOR(63 downto 0);
signal eth_ready : STD_LOGIC;
signal ots_dout : STD_LOGIC_VECTOR(63 downto 0)	;  
signal last_reset : std_logic := '0';
signal step : std_logic_vector(7 downto 0) := x"00"; 
signal qwds_left : std_logic_vector(7 downto 0) := x"FF";
signal waiting_for_next_page : std_logic := '0';
signal first_time : std_logic := '1';  
signal delaycount : std_logic_vector(15 downto 0) := x"017A";
begin
	RAM : entity work.ram_tester
		  port map(
			   FLASH_CLK => FLASH_CLK,
		       MASTER_CLK => MASTER_CLK,
		       ots_rden => ots_rden,
		       ots_wren => ots_wren,
		       reset => reset,
		       ots_block_addr => ots_block_addr,
		       ots_block_sel => ots_block_sel,
		       ots_din => ots_din,
		       eth_ready => eth_ready,
		       ots_dout => ots_dout
		  );
		  
	process(MASTER_CLK)
	begin
		if rising_edge(MASTER_CLK) then
			last_reset <= reset;   
			ots_rden <= '0' or not(eth_ready);
			if reset = '0' and last_reset = '1' then
				step <= x"01"; 
				ots_wren <= '1';
				ots_block_addr <= x"00000004";
				ots_din <= x"0000000000000000";
			elsif unsigned(step) = 1 then
				ots_wren <= '1';
				ots_block_addr <= x"000000" & step;
				ots_din(31 downto 0)  <= x"00002323";
				step <= step + 1;
			elsif unsigned(step) = 2 then
				ots_block_addr <= x"000000" & step;
				ots_din(31 downto 0) <= x"00000010";
				step <= step + 1;
			elsif unsigned(step) = 3 then
				ots_block_addr <= x"000000" & step;
				ots_din(7 downto 0) <= "00000001";
				step <= step +1;
			elsif unsigned(step) = 4 then
				ots_block_addr <= x"000000" & step;
				ots_din <= x"AAAABBBBCCCCDDDD";
				qwds_left <= x"03";
				step <= step +1;
			elsif unsigned(step) = 5 then
				if unsigned(qwds_left) = 0 then
					ots_wren <= '0';
					if first_time = '1' then
						first_time <= '0' ;
						ots_wren <= '1';
						ots_block_addr <= (others => '0');
						ots_din(0) <= '1';
						
					elsif (waiting_for_next_page = '0') then
						if unsigned(delaycount) = 0 then
							ots_rden <= '1';
							ots_block_addr <= x"00000009";
							waiting_for_next_page <= '1'; 
						else
							delaycount <= delaycount - 1;
						end if;
					elsif (eth_ready = '1') then
						waiting_for_next_page <= '0';
						qwds_left <= x"02";
					end if;
				else 
					ots_wren <= '1';   
					ots_block_addr <= x"00000004";
					ots_din(63 downto 60) <= qwds_left(3 downto 0);
					ots_din(59 downto 56) <= qwds_left(3 downto 0);
					ots_din(55 downto 52) <= qwds_left(3 downto 0);
					ots_din(51 downto 48) <= qwds_left(3 downto 0);
					ots_din(47 downto 44) <= qwds_left(3 downto 0);
					ots_din(43 downto 40) <= qwds_left(3 downto 0);
					ots_din(39 downto 36) <= qwds_left(3 downto 0);
					ots_din(35 downto 32) <= qwds_left(3 downto 0);
					ots_din(31 downto 28) <= qwds_left(3 downto 0);
					ots_din(27 downto 24) <= qwds_left(3 downto 0);
					ots_din(23 downto 20) <= qwds_left(3 downto 0);
					ots_din(19 downto 16) <= qwds_left(3 downto 0);
					ots_din(15 downto 12) <= qwds_left(3 downto 0);
					ots_din(11 downto 8)  <= qwds_left(3 downto 0);
					ots_din(7  downto 4)  <= qwds_left(3 downto 0);
					ots_din(3  downto 0)  <= qwds_left(3 downto 0);
					
					qwds_left <= qwds_left - 1;
				end if;
			end if;
		end if;
	end process;
end arch;
					
						
						
					
				


