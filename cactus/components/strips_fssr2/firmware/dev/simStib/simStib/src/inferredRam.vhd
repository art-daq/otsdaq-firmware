-- Initializing Dual Port Block RAM from external data file
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;		   

entity inferredRAM is				
	
 	GENERIC (						   
	 AWIDTH : integer := 8;
	 DWIDTH : integer := 16
	 	--RAM_INIT_FILE_INDEX : integer := 0
	 );
	port(    
		clka  : IN  STD_LOGIC;
	    wea   : IN  STD_LOGIC_VECTOR(0  DOWNTO 0);
	    addra : IN  STD_LOGIC_VECTOR(AWIDTH-1 DOWNTO 0);
	    dina  : IN  STD_LOGIC_VECTOR(DWIDTH-1 DOWNTO 0);
	    douta : OUT STD_LOGIC_VECTOR(DWIDTH-1  DOWNTO 0);
	    clkb  : IN  STD_LOGIC;
	    web   : IN  STD_LOGIC_VECTOR(0  DOWNTO 0);
	    addrb : IN  STD_LOGIC_VECTOR(AWIDTH-1 DOWNTO 0);
	    dinb  : IN  STD_LOGIC_VECTOR(DWIDTH-1 DOWNTO 0);
	    doutb : OUT STD_LOGIC_VECTOR(DWIDTH-1  DOWNTO 0)  
	);
end inferredRAM;		

architecture arch of inferredRAM is		  

	-- 2^10 32-bit words.. addressable by bit on readout
	type RamType is array(0 to (2**AWIDTH)-1) of bit_vector(DWIDTH-1 downto 0);
	
	impure function InitRamFromFile (RamFileName : in string) return RamType is
		FILE RamFile : text is in RamFileName;
		variable RamFileLine : line;
		variable RAM : RamType;
	begin		  	   
		
		for I in RamType'range loop
			readline (RamFile, RamFileLine);
			read (RamFileLine, RAM(I));
		end loop;
		return RAM;
	end function;				 

	shared variable RAM : RamType;
--	shared variable RAM : RamType := InitRamFromFile("TestBench/../../utilities/inferred_ram_data/ram_" & integer'image(RAM_INIT_FILE_INDEX) & ".dat");	-- TODO make compatible data file

		
begin  
		
	process (clka)
	begin					
		if clka'event and clka = '1' then				
			if wea(0) = '1' then
				RAM(to_integer(unsigned(addra))) := to_bitvector(dina);
			end if;																									
			if(addra(0) = '0' or addra(0) = '1') then
				douta <= to_stdlogicvector(RAM(to_integer(unsigned(addra))));	 	 
			end if;
		end if;		
	end process;  
			
	process (clkb)
	begin					
		if clkb'event and clkb = '1' then				
			if web(0) = '1' then
				RAM(to_integer(unsigned(addrb))) := to_bitvector(dinb);
			end if;									 															
			if(addrb(0) = '0' or addrb(0) = '1') then
				doutb <= to_stdlogicvector(RAM(to_integer(unsigned(addrb))));
			end if;
		end if;		
	end process; 
	
end arch;