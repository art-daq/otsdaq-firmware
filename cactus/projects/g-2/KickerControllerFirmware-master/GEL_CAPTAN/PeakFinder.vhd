----------------------------------------------------------------------------------
-- Company: Fermilab
-- Engineer: Collin Bradford
-- 
-- Create Date:    13:51:43 07/07/2016 
-- Design Name: 
-- Module Name:    PeakFinder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- 
-- This module analyzes the input from the adc and looks for peaks.  
-- Once the input from the adc passes the user-set threshold, it will set the address on the trigger_address
-- pin to the address of the trigger.  It will also pusle the new_trigger signal.  
--
-- This module is meant to be used with a ram block to establish a looping buffer.  The addr_out and data_out pins
-- can be directly connected to the ram to establish this looping buffer.  
-- 
-- In the case that two triggers arrive one after another without a clock cycle inbetween or a single pulse 
-- lasts longer than the user set read time, a new trigger will be immediately set and no data should be lost.  
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PeakFinder is
    Port ( --default signals
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  clock_enable : in STD_LOGIC;
			  median_filter : in STD_LOGIC;
			  --data signals
			  data_in : in  STD_LOGIC_VECTOR (63 downto 0);
			  --trigger types and attributes
			  trig_types : in STD_LOGIC_VECTOR (7 downto 0);
			  signal_threshold : in STD_LOGIC_VECTOR(7 downto 0);
			  manual_force_trig : in STD_LOGIC;
			  ext_trig : in STD_LOGIC;
			  --data_out
           data_out : out STD_LOGIC_VECTOR (63 downto 0);
			  --address information
			  addr_out : out STD_LOGIC_VECTOR (9 downto 0);
			  trigger_address : out STD_LOGIC_VECTOR(9 downto 0);
           new_trigger : out STD_LOGIC;
			  out_enable : out  STD_LOGIC;
			  --clear the manual trigger flip-flop
			  clear_manual_trig : out STD_LOGIC);
end PeakFinder;

architecture Behavioral of PeakFinder is
	--each individual sample gets it's own signal
	signal sample_one : unsigned(7 downto 0);
	signal sample_two : unsigned(7 downto 0);
	signal sample_three : unsigned(7 downto 0);
	signal sample_four : unsigned(7 downto 0);
	signal sample_five : unsigned(7 downto 0);
	signal sample_six : unsigned(7 downto 0);
	signal sample_seven : unsigned(7 downto 0);
	signal sample_eight : unsigned(7 downto 0);
	
	
	signal pre_sample_one : unsigned(7 downto 0);
	signal pre_sample_two : unsigned(7 downto 0);
	signal pre_sample_three : unsigned(7 downto 0);
	signal pre_sample_four : unsigned(7 downto 0);
	signal pre_sample_five : unsigned(7 downto 0);
	signal pre_sample_six : unsigned(7 downto 0);
	signal pre_sample_seven : unsigned(7 downto 0);
	signal pre_sample_eight : unsigned(7 downto 0);
	
	
	signal post_sample_one : unsigned(7 downto 0);
	signal post_sample_two : unsigned(7 downto 0);
	signal post_sample_three : unsigned(7 downto 0);
	signal post_sample_four : unsigned(7 downto 0);
	signal post_sample_five : unsigned(7 downto 0);
	signal post_sample_six : unsigned(7 downto 0);
	signal post_sample_seven : unsigned(7 downto 0);
	signal post_sample_eight : unsigned(7 downto 0);
	
	signal pre_data_in, post_data_in : std_logic_vector(63 downto 0);
	
	--repeating signals 
	signal threshold : unsigned( 7 downto 0 );
	signal ramAddress : unsigned(9 downto 0);
	signal clearManualTrigSig : std_logic;
	signal extTrigLatched : std_logic;
	--internal flags
	signal new_trigger_sig : std_logic;
	signal triggered : std_logic;--Means that a signal is over the threshold.  Sync with clk.
	signal trigger_active : std_logic;
	--each trigger attribute gets it's own signal
	signal threshTrigEn : std_logic; --Threshold Mode is enabled
	signal threshHigh : std_logic; --Treshold will trigger if the signal is above the threshold
	signal lastThreshTrigState : std_logic; --Keeps track of whether we were triggered last clock so that we don't trigger multiple times for the same event.  
	signal manualTrigEn : std_logic; --Manual Mode is enabled
	signal extTrigEn : std_logic; --External Trig Mode is enabled
	signal extTrigRising : std_logic; --Trigger on the rising edge of the external trigger
	signal lastExtTrigState : std_logic; --The last state of the external trigger
	
	
	function MEDIAN_SAMPLE (
		s0: unsigned(7 downto 0);
		s1: unsigned(7 downto 0);
		s2: unsigned(7 downto 0))
	return std_logic_vector is
	begin
		if ((s0 > s1 and s0 <= s2) or (s0 < s1 and s0 >= s2)) then
			return std_logic_vector(s0);
		elsif ((s2 > s1 and s2 <= s0) or (s2 < s1 and s2 >= s0)) then
			return std_logic_vector(s2);
		else
			return std_logic_vector(s1);
		end if;
	end MEDIAN_SAMPLE;
begin
	--assign the samples
	sample_one <= unsigned(data_in(15 downto 8));
	sample_two <= unsigned(data_in(7 downto 0));
	sample_three <= unsigned(data_in(31 downto 24));
	sample_four <= unsigned(data_in(23 downto 16));
	sample_five <= unsigned(data_in(47 downto 40));
	sample_six <= unsigned(data_in(39 downto 32));
	sample_seven <= unsigned(data_in(63 downto 56));
	sample_eight <= unsigned(data_in(55 downto 48));
	
	pre_sample_one <= unsigned(pre_data_in(15 downto 8));
	pre_sample_two <= unsigned(pre_data_in(7 downto 0));
	pre_sample_three <= unsigned(pre_data_in(31 downto 24));
	pre_sample_four <= unsigned(pre_data_in(23 downto 16));
	pre_sample_five <= unsigned(pre_data_in(47 downto 40));
	pre_sample_six <= unsigned(pre_data_in(39 downto 32));
	pre_sample_seven <= unsigned(pre_data_in(63 downto 56));
	pre_sample_eight <= unsigned(pre_data_in(55 downto 48));
	
	post_sample_one <= unsigned(post_data_in(15 downto 8));
	post_sample_two <= unsigned(post_data_in(7 downto 0));
	post_sample_three <= unsigned(post_data_in(31 downto 24));
	post_sample_four <= unsigned(post_data_in(23 downto 16));
	post_sample_five <= unsigned(post_data_in(47 downto 40));
	post_sample_six <= unsigned(post_data_in(39 downto 32));
	post_sample_seven <= unsigned(post_data_in(63 downto 56));
	post_sample_eight <= unsigned(post_data_in(55 downto 48));
	
	
	--assign repeating signals
	threshold <= unsigned(signal_threshold);
	new_trigger <= new_trigger_sig;
	addr_out <= std_logic_vector(ramAddress);
	clear_manual_trig <= clearManualTrigSig;
	--assign trigger attribute signals
	threshTrigEn <= trig_types(0);
	threshHigh <= trig_types(1);
	manualTrigEn <= trig_types(2);
	extTrigEn <= trig_types(3);
	extTrigRising <= trig_types(4);
	
	
	
	
	process(clk) begin
		
		
		
		
		
--		data_out(7 downto 0) <= data_in(7 downto 0);
--		data_out(15 downto 8) <= data_in(15 downto 8);
--		data_out(23 downto 16) <= data_in(23 downto 16);
--		data_out(31 downto 24) <= data_in(31 downto 24);
--		data_out(39 downto 32) <= data_in(39 downto 32);
--		data_out(47 downto 40) <= data_in(47 downto 40);
--		data_out(55 downto 48) <= data_in(55 downto 48);
--		data_out(63 downto 56) <= data_in(63 downto 56);
		
		if(reset = '0') then--reset is low
		
			if(rising_edge(clk)) then
			
				lastExtTrigState <= extTrigLatched;
				extTrigLatched <= ext_trig;
				
				out_enable <= '0';
				
				--if external trigger mode is enabled 
				if(extTrigEn = '1') then
					--if we are triggering on the rising edge of the trigger and it actually is the rising edge
					if(extTrigRising = '1' and lastExtTrigState = '0' and extTrigLatched = '1') then
						trigger_active <= '1';
					end if;
					--if we are triggering on the falling edge of the trigger and it actually is the falling edge
					if(extTrigRising = '0' and lastExtTrigState = '1' and extTrigLatched = '0') then
						trigger_active <= '1';
					end if;
				end if;
			
				if(clock_enable = '1') then--rising edge of clk and the clock is enabled
					
					ramAddress <= ramAddress + 1;
					out_enable <= '1';
					
					post_data_in <= data_in;
					pre_data_in <= post_data_in;
					
					-- so ... data in is newest, then post, then pre
					-- data out will always come from post
					
					if (median_filter = '1') then 					
						 
						data_out(15 downto 8) <= MEDIAN_SAMPLE(pre_sample_eight,post_sample_one,post_sample_two);
						data_out(7 downto 0) <= MEDIAN_SAMPLE(post_sample_one,post_sample_two,post_sample_three);
						data_out(31 downto 24) <= MEDIAN_SAMPLE(post_sample_two,post_sample_three,post_sample_four);
						data_out(23 downto 16) <= MEDIAN_SAMPLE(post_sample_three,post_sample_four,post_sample_five);
						data_out(47 downto 40) <= MEDIAN_SAMPLE(post_sample_four,post_sample_five,post_sample_six);
						data_out(39 downto 32) <= MEDIAN_SAMPLE(post_sample_five,post_sample_six,post_sample_seven);
						data_out(63 downto 56) <= MEDIAN_SAMPLE(post_sample_six,post_sample_seven,post_sample_eight);
						data_out(55 downto 48) <= MEDIAN_SAMPLE(post_sample_seven,post_sample_eight,sample_one);
						
					else  --old way
						data_out <= data_in;
					end if;
					
					--These are the tests for each trigger state.  There is at least one if statement per trigger mode that is enabled when the 
					--respective trigger mode is enabled.  If the trigger mode is active and the trigger state is also active, it enables the 
					--trigger_active flag and performs any other checks and resets for each trigger.  
					--
					--if threshold mode is enabled
					if(threshTrigEn = '1') then
						--if we trigger when the signal rises above the trigger line
						if(threshHigh = '1') then
							if(sample_one > threshold or sample_two > threshold or sample_three > threshold or sample_four > threshold
							or sample_five > threshold or sample_six > threshold or sample_seven > threshold or sample_eight > threshold) then
								--if we aren't already triggered -- prevents triggering multiple times on the same event.  
								if(lastThreshTrigState = '0') then
									trigger_active <= '1';
									lastThreshTrigState <= '1';
								end if;
							--reset the last thresh trigger state flag so that we can trigger on the next event.  
							else
								lastThreshTrigState <= '0';
							end if;
						end if;
						--if we trigger when the signal falls below the trigger line
						if(threshHigh = '0') then
							if(sample_one < threshold or sample_two < threshold or sample_three < threshold or sample_four < threshold
							or sample_five < threshold or sample_six < threshold or sample_seven < threshold or sample_eight < threshold) then
								--if we aren't already triggered -- prevents triggering multiple times on the same event.  
								if(lastThreshTrigState = '0') then	
									trigger_active <= '1';
									lastThreshTrigState <= '1';
								end if;
							--reset the last thresh trigger state flag so that we can trigger on the next event.  
							else
								lastThreshTrigState <= '0';
							end if;
						end if;
					end if;
					--if manual trigger mode is enabled and we have a trigger
					if(manualTrigEn = '1' and manual_force_trig = '1') then
						trigger_active <= '1';
						clearManualTrigSig <= '1';
					end if;
					
					--Code that needs to be run for each trigger
					--
					--Check for a trigger and run the code.  
					if (trigger_active = '1') then  
						triggered <= '1';
						new_trigger_sig <= '1';
						trigger_address <= std_logic_vector(ramAddress);
						trigger_active <= '0';
					end if;
					--these signals need to be pulsed for one clock only.
					if(new_trigger_sig = '1') then
						new_trigger_sig <= '0';
					end if;
					if(clearManualTrigSig = '1') then
						clearManualTrigSig <= '0';
					end if;
				--clk_enable ends here.  
				end if;
			end if;
		--reset is high
		else
			triggered <= '0';
			new_trigger_sig <= '0';
			ramAddress <= (others => '0');
			clearManualTrigSig <= '0'; --Needed to clear the FD on reset
			lastThreshTrigState <= '0';
			trigger_active <= '0';
		end if;
	end process;
end Behavioral;

