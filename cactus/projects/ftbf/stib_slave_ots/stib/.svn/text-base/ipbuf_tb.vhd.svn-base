--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:42:03 03/29/2014
-- Design Name:   
-- Module Name:   /home/mjones/test/testcksum/ipbuf_tb.vhd
-- Project Name:  testcksum
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ipbuf_old
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
LIBRARY hep337dev;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE std.textio.ALL;
USE hep337dev.ALL;

ENTITY ipbuf_tb IS
END ipbuf_tb;
 
ARCHITECTURE behavior OF ipbuf_tb IS 

  FUNCTION char_to_hex_digit( C : CHARACTER ) RETURN STD_LOGIC_VECTOR IS
  BEGIN
    CASE C IS
      WHEN '0' => RETURN X"0";
      WHEN '1' => RETURN X"1";
      WHEN '2' => RETURN X"2";
      WHEN '3' => RETURN X"3";
      WHEN '4' => RETURN X"4";
      WHEN '5' => RETURN X"5";
      WHEN '6' => RETURN X"6";
      WHEN '7' => RETURN X"7";
      WHEN '8' => RETURN X"8";
      WHEN '9' => RETURN X"9";
      WHEN 'a' => RETURN X"A";
      WHEN 'A' => RETURN X"A";
      WHEN 'b' => RETURN X"B";
      WHEN 'B' => RETURN X"B";
      WHEN 'c' => RETURN X"C";
      WHEN 'C' => RETURN X"C";
      WHEN 'd' => RETURN X"D";
      WHEN 'D' => RETURN X"D";
      WHEN 'e' => RETURN X"E";
      WHEN 'E' => RETURN X"E";
      WHEN 'f' => RETURN X"F";
      WHEN 'F' => RETURN X"F";
      WHEN OTHERS => ASSERT FALSE REPORT "Bad hex digit" SEVERITY FAILURE;
    END CASE;
    RETURN X"0";
  END char_to_hex_digit;

  FUNCTION to_hex_byte( S : string ) RETURN STD_LOGIC_VECTOR IS
    VARIABLE BYTE_INDEX : NATURAL := 0;
    VARIABLE NIBBLE_INDEX : NATURAL := 0;
    VARIABLE INDEX : NATURAL := 0;
    VARIABLE WORD : STD_LOGIC_VECTOR(7 DOWNTO 0) := ( OTHERS => '0' );
  BEGIN
    IF ( S'LENGTH = 2 ) THEN
      L: FOR I IN S'REVERSE_RANGE LOOP
        INDEX := ( BYTE_INDEX * 8 ) + ( NIBBLE_INDEX * 4 );
        WORD(INDEX+3 DOWNTO INDEX) := char_to_hex_digit(S(I));
        NIBBLE_INDEX := NIBBLE_INDEX + 1;
      END LOOP L;
    ELSE
      ASSERT FALSE REPORT "Bad 8-bit hex byte" SEVERITY FAILURE;
    END IF;
    RETURN WORD;
  END to_hex_byte;
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ipbuf
    PORT(
         RESET : IN  std_logic;
         WR_CLK : IN  std_logic;
         RD_CLK : IN  std_logic;
         DIN : IN  std_logic_vector(7 downto 0);
         WR_EN : IN  std_logic;
         RD_EN : IN  std_logic;
         DOUT : OUT  std_logic_vector(7 downto 0);
         LENGTH : OUT  std_logic_vector(15 downto 0);
         CLEAR : IN  std_logic;
         CKSUM : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal RESET : std_logic := '0';
   signal WR_CLK : std_logic := '0';
   signal RD_CLK : std_logic := '0';
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');
   signal WR_EN : std_logic := '0';
   signal RD_EN : std_logic := '0';
   signal CLEAR : std_logic := '0';

 	--Outputs
   signal DOUT : std_logic_vector(7 downto 0);
   signal LENGTH : std_logic_vector(15 downto 0);
   signal CKSUM : std_logic_vector(15 downto 0);
   signal sum1 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant WR_CLK_period : time := 8 ns;
   constant RD_CLK_period : time := 8 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hep337dev.ipbuf PORT MAP (
          RESET => RESET,
          WR_CLK => WR_CLK,
          RD_CLK => RD_CLK,
          DIN => DIN,
          WR_EN => WR_EN,
          RD_EN => RD_EN,
          DOUT => DOUT,
          LENGTH => LENGTH,
          CLEAR => CLEAR,
          CKSUM => CKSUM
        );

   -- Clock process definitions
   WR_CLK_process :process
   begin
		WR_CLK <= '0';
		wait for WR_CLK_period/2;
		WR_CLK <= '1';
		wait for WR_CLK_period/2;
   end process;
 
   RD_CLK_process :process
   begin
		RD_CLK <= '0';
		wait for RD_CLK_period/2;
		RD_CLK <= '1';
		wait for RD_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
     file infile : text open read_mode is "framedata.txt";
     variable input_line : line;
     variable output_line : line;
     variable S : string(1 to 2);

   begin		
      -- hold reset state for 100 ns.
      wait for 15*WR_CLK_period;

      clear <= '1';
      wait for 10*wr_clk_period;
      clear <= '0';
      wait for 3*wr_clk_period;
      wait for wr_clk_period/2;

      wr_en <= '1';
      wait for wr_clk_period;
      while not endfile(infile) loop
        readline(infile,input_line);
        read(input_line,S);
        din <= to_hex_byte(S);
        write(output_line,string'("data = "));
        write(output_line,string'(S));
        writeline(output,output_line);
        wait for wr_clk_period;
      end loop;
      wait for wr_clk_period;
      wr_en <= '0';

      wait;
   end process;

   sum1 <= not cksum;
END;
