-- *************************************************
-- Behavioral description of dual-port FIFO with
-- *************************************************
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;	
use IEEE.std_logic_unsigned.all;	   

entity inferredDCM is
	generic (
		clkfx_divide : integer:=1;
		clkfx_multiply : integer:=2;		
		clkdv_divide : real:=4.0;
		clkin_divide_by_2 : boolean:= false;
		clkin_period : real := 8.0
		);
	port (											  
		clk0 : out std_logic;						  
		clk180 : out std_logic;						  
		clk270 : out std_logic;						  
		clk90 : out std_logic;						  
		clk2x : out std_logic;						  
		clk2x180 : out std_logic;				  
		clkdv : out std_logic;						  
		clkfx : out std_logic;						  
		clkfx180 : out std_logic;		
		locked : out std_logic;	  
		
						 
		psincdec : in std_logic;	
		psclk : in std_logic;	
		psen : in std_logic;			  
		di : in std_logic_vector(15 downto 0);	
	    daddr : in std_logic_vector(6 downto 0);
	    dwe : in std_logic;
	    den : in std_logic;
	    dclk : in std_logic;
											     						  
		do : out std_logic_vector(15 downto 0);	 				   		 
	    drdy : out std_logic;	
		
		
													 
		clkfb : in std_logic;	
		clkin : in std_logic;
		rst : in std_logic
	 );
end inferredDCM;			  
							    
architecture behavioral of inferredDCM is

	signal base_clk : std_logic := '0';	   
	signal base_clk2x : std_logic := '0';
	signal base_clkdv : std_logic := '0';
	signal base_clkfx : std_logic := '0';	 
	
	signal period : time := clkin_period * 1ns;
	
begin		
	--ignore clkfb, clkin, and rst
	
	base_clk <= not base_clk after period/2.0;			
	base_clk2x <= not base_clk2x after period/4.0;				 			 
	base_clkdv <= not base_clkdv after (period/2.0)*clkdv_divide;
	base_clkfx <= not base_clkfx after (period/2.0)*clkfx_divide/clkfx_multiply;
	
	clk0 <= base_clk;
	clk180 <= base_clk after period/2.0;
	clk270 <= base_clk after 3.0*period/4.0;
	clk90 <= base_clk after 1.0*period/4.0;  
	
	clk2x <= base_clk2x;
	clk2x180 <= base_clk2x after period/4.0;	 
										 							
	clkdv <= base_clkdv;
	clkfx <= base_clkfx;
	clkfx180 <= base_clkfx after (period/2.0)*clkfx_divide/clkfx_multiply/2.0; 
	
	
	locked <= '1';		
	drdy <= '0';
	do <= (others => '0');
									
	
end behavioral;