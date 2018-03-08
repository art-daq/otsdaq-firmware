----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:44 09/19/2017 
-- Design Name: 
-- Module Name:    event_analysis - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--	This module is where the code for the data analysis lives.  The data is meant to come into the module as it comes out
-- of the data_send module.  The current configuration is for two 64 bit header blocks, so the code delays two clocks 
-- before starting analysis.  
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity event_analysis is
    Port ( --default signals
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  clock_enable : in STD_LOGIC;
			  --incoming data signals
           data_in : in  STD_LOGIC_VECTOR (63 downto 0);
           data_in_we : in  STD_LOGIC;
			  data_in_end : in STD_LOGIC;
			  --incoming footer signal. This footer will be sent with the veto footer and can be attached to any signal.
			  footer_in : STD_LOGIC_VECTOR (63 downto 0);
			  --user register signals
           zero_cross_thresh_high : in  STD_LOGIC_VECTOR (7 downto 0);
           zero_cross_thresh_low : in  STD_LOGIC_VECTOR (7 downto 0);
			  zero_cross_veto_thresh : in STD_LOGIC_VECTOR (7 downto 0);
			  --clear and force veto signals
			  clear_veto : in STD_LOGIC;
			  force_veto : in STD_LOGIC;
			  veto_en : in STD_LOGIC;
			  --outgoing data signals
           data_out : out  STD_LOGIC_VECTOR (63 downto 0);
           data_out_we : out  STD_LOGIC;
			  data_out_end : out STD_LOGIC;
			  --outgoing analysis signals
           zero_cross_count : out  STD_LOGIC_VECTOR (7 downto 0);
			  --this signal is speciffic to the g-2 application and will veto the kicker signal in the event of a spark to 
			  --ensure that no damage is done to the kicker and surrounding components.  
			  veto : out STD_LOGIC;
			  --resets for the clear_veto and force_veto latches
			  reset_clear_veto : out STD_LOGIC;
			  reset_force_veto : out STD_LOGIC);
end event_analysis;

architecture Behavioral of event_analysis is
	--each individual data sample gets its own signal for easier processing
	signal sampleOne : unsigned(7 downto 0);
	signal sampleTwo : unsigned(7 downto 0);
	signal sampleThree : unsigned(7 downto 0);
	signal sampleFour : unsigned(7 downto 0);
	signal sampleFive : unsigned(7 downto 0);
	signal sampleSix : unsigned(7 downto 0);
	signal sampleSeven : unsigned(7 downto 0);
	signal sampleEight : unsigned(7 downto 0);
	--repeated signals
	signal userZeroCrossThreshHigh : unsigned(7 downto 0);
	signal userZeroCrossThreshLow : unsigned(7 downto 0);
	signal userZeroCrossVetoThresh : unsigned(7 downto 0);
	signal dataOutEnd : std_logic;
	signal resetClearVeto, resetForceVeto : std_logic;
	signal del_clk_en : std_logic;
	--module flags
	signal busy : std_logic;
	signal headerDelayOne, headerDelayTwo : std_logic;
	signal analysisRunning : std_logic;
	signal prepareEnd : std_logic;
	signal sendFooter,sendPacketEnd : std_logic;
	signal finish : std_logic;
	--signal state
	signal lastSigLow, lastSigHigh : std_logic;
	signal zeroCrossCount : unsigned(7 downto 0);
	signal vetoed, veto_window : std_logic;
	--footer signal 
	signal internalFooter : std_logic_vector(63 downto 0);
begin
	--assign data signals
	sampleOne <= unsigned(data_in(7 downto 0));
	sampleTwo <= unsigned(data_in(15 downto 8));
	sampleThree <= unsigned(data_in(23 downto 16));
	sampleFour <= unsigned(data_in(31 downto 24));
	sampleFive <= unsigned(data_in(39 downto 32));
	sampleSix <= unsigned(data_in(47 downto 40));
	sampleSeven <= unsigned(data_in(55 downto 48));
	sampleEight <= unsigned(data_in(63 downto 56));
	--assign repeated signals
	userZeroCrossThreshHigh <= unsigned(zero_cross_thresh_high);
	userZeroCrossThreshLow <= unsigned(zero_cross_thresh_low);
	userZeroCrossVetoThresh <= unsigned(zero_cross_veto_thresh(7 downto 0));
	zero_cross_count <= std_logic_vector(zeroCrossCount);
	veto <= vetoed and veto_en;
	data_out_end <= dataOutEnd;
	reset_clear_veto <= resetClearVeto;
	reset_force_veto <= resetForceVeto;
	--assign footer signals 
	internalFooter(7 downto 0) <= std_logic_vector(zeroCrossCount(7 downto 0));
	internalFooter(8) <= vetoed;
	internalFooter(9) <= veto_en;
	internalFooter(10) <= veto_window;	
	internalFooter(19 downto 12) <= zero_cross_thresh_high;
	internalFooter(27 downto 20) <= zero_cross_thresh_low;
	internalFooter(35 downto 28) <= zero_cross_veto_thresh;
	
	process(clk) begin
		--check for reset condition
		if(rising_edge(clk)) then
		
			--====================
			--====================			
			--Reset pulsed signals			
			data_out_we <= '0';
			sendFooter <= '0';
			dataOutEnd <= '0';			
			resetClearVeto <= '0';
			resetForceVeto <= '0';	
			veto_window <= '0';
			sendPacketEnd <= '0';			
			
								 
			--====================	
			--====================
			if(data_in_we = '1') then -- reset pulsed-clock-en data
				headerDelayOne <= '0'; 
			end if;
			
			
			--====================
			--====================
			-- primaray path
			if(reset = '1') then	--reset can still happen even if data_in_we is low.  
				busy <= '0';
				analysisRunning <= '0';
				vetoed <= '0';	
			elsif(data_in_end = '1') then -- Indicates end of header/payload data. So send external footer!				
				data_out_we <= '1';
				data_out <= footer_in; --we need one clock to figure out if we need to veto.  The header signals coming from anything else in the firmware application can be sent at this time.  									
				
				sendFooter <= '1';	--send internal footer next clock	
				
				--Check if we will veto the signal and take approperate action
				if(zeroCrossCount > userZeroCrossVetoThresh and veto_en = '1') then
					vetoed <= '1';
					veto_window <= '1';
				end if;				
			elsif(sendFooter = '1') then				
				data_out_we <= '1';
				data_out <= internalFooter; --note: includes veto info setup in previous clock				
				
				sendPacketEnd <= '1'; -- got to last state, note: force end must happen after last qw in packet				

			elsif(sendPacketEnd = '1') then
				dataOutEnd <= '1'; --DONE!!! end packet
				
				--DONE!!!
				--wrap up things
				busy <= '0';
				analysisRunning <= '0';		
				zeroCrossCount <= (others => '0');
				
			elsif(data_in_we = '1') then
			
				data_out_we <= '1';
				data_out <= data_in;
				
				--The data currently on the pins is still valid and needs to be compared.  We won't give the final 
				--	 count until the event is actually over.  				
				
				if(busy = '0') then -- first data! = data for header 1
					headerDelayOne <= '1';
					busy <= '1';				
				elsif(headerDelayOne = '1') then --data for header	2				
					--headerDelayTwo <= '1'; 		
					analysisRunning <= '1';
					lastSigHigh <= '0';
					lastSigLow <= '0';
					zeroCrossCount <= (others => '0');
				elsif(analysisRunning = '1') then --We have actual data! start the analysis process	
					--If last time was not high and this time is, incriment the counter
					if(lastSigHigh = '0') then
						if(sampleOne > userZeroCrossThreshHigh or sampleTwo > userZeroCrossThreshHigh or sampleThree > userZeroCrossThreshHigh or sampleFour > userZeroCrossThreshHigh
							or sampleFive > userZeroCrossThreshHigh or sampleSix > userZeroCrossThreshHigh or sampleSeven > userZeroCrossThreshHigh or sampleEight > userZeroCrossThreshHigh) then
							lastSigHigh <= '1';
							zeroCrossCount <= zeroCrossCount + 1;
						end if;
					end if;
					
					--If the last signal set was not low and this time is low, incriment the counter
					if(lastSigLow = '0') then
						if(sampleOne < userZeroCrossThreshLow or sampleTwo < userZeroCrossThreshLow or sampleThree < userZeroCrossThreshLow or sampleFour < userZeroCrossThreshLow or sampleFive < userZeroCrossThreshLow
							or sampleSix < userZeroCrossThreshLow or sampleSeven < userZeroCrossThreshLow or sampleEight < userZeroCrossThreshLow) then
							lastSigLow <= '1';
							zeroCrossCount <= zeroCrossCount + 1; 
						end if;
					end if;
					
					
					--Reset the high signal if we are no longer above threshold
					if(lastSigHigh = '1' and sampleOne < userZeroCrossThreshHigh and sampleTwo < userZeroCrossThreshHigh and sampleThree < userZeroCrossThreshHigh and sampleFour < userZeroCrossThreshHigh
						and sampleFive < userZeroCrossThreshHigh and sampleSix < userZeroCrossThreshHigh and sampleSeven < userZeroCrossThreshHigh and sampleEight < userZeroCrossThreshHigh) then
						lastSigHigh <= '0';
					end if;
					
					--Reset the Low signal if we are no longer below threshold
					if(lastSigLow = '1' and sampleOne > userZeroCrossThreshLow and sampleTwo > userZeroCrossThreshLow and sampleThree > userZeroCrossThreshLow and sampleFour > userZeroCrossThreshLow and sampleFive > userZeroCrossThreshLow
						and sampleSix > userZeroCrossThreshLow and sampleSeven > userZeroCrossThreshLow and sampleEight > userZeroCrossThreshLow) then
						lastSigLow <= '0';
					end if;
				end if;
				
			end if; -- end elsif(data_in_we = '1') then
			
			--====================
			--====================	
			---user controlled signals:
			
			--Clear veto signal
			if(force_veto = '1') then --Force veto signal
				vetoed <= '1';
				resetForceVeto <= '0'; --never reset flipflop
			elsif(clear_veto = '1') then
				vetoed <= '0';
				resetClearVeto <= '1'; --never reset flipflop
			end if;
				
				
		end if;
		
	end process;
end Behavioral;

			