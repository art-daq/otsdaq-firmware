--------------------------------------------------------------------------------
--
-- Company:
-- Engineer:       Matthew Jones - Purdue University
-- 
-- Create Date:    08:44:16 06/06/2013 
-- Design Name:    stib
-- Module Name:    arptab - RTL
-- Project Name:   STIB firmware
-- Target Devices: xc4vlx25ff668-10
-- Tool versions:  ISE 14.4 / 14.6
-- Description:    Maintains a list of ARP table entries
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity arptab is
  GENERIC ( SIZE : INTEGER := 4 );
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           READ_STROBE : in STD_LOGIC;
           WRITE_STROBE : in STD_LOGIC;
           MY_IP_ADDRESS : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           GW_IP_ADDRESS : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           MY_NETMASK : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           LOAD_IP_ADDR : in STD_LOGIC_VECTOR(31 DOWNTO 0);
           LOAD_HW_ADDR : in STD_LOGIC_VECTOR(47 DOWNTO 0);
           LOOKUP_IP_ADDR : in STD_LOGIC_VECTOR(31 DOWNTO 0);
           TARGET_IP_ADDR : out STD_LOGIC_VECTOR(31 DOWNTO 0);
           LOOKUP_HW_ADDR : out STD_LOGIC_VECTOR(47 DOWNTO 0);
           FOUND : out STD_LOGIC;
           MISSING : out STD_LOGIC;
           BROADCAST : OUT STD_LOGIC;
           ENTRIES : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
           INDEX : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           TABLE_IP_ADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
           TABLE_HW_ADDR : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
           TABLE_REF_COUNT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
           DEBUG_STATE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
end arptab;

architecture RTL of arptab is

  COMPONENT arptab_dpram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(SIZE-1 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(SIZE-1 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(95 DOWNTO 0)
  );
  END COMPONENT;

  SIGNAL COUNT : INTEGER RANGE 0 TO 2**SIZE-1;
  SIGNAL SEARCH_INDEX : INTEGER RANGE 0 TO 2**SIZE-1;
  SIGNAL NEW_IP_ADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL NEW_HW_ADDR : STD_LOGIC_VECTOR(47 DOWNTO 0);
  TYPE State_t IS ( Idle, WriteAddr, WriteTest, ReadAddr, ReadTest, Write );
  SIGNAL STATE : State_t;

  SIGNAL WRITE_ENABLE : STD_LOGIC_VECTOR(0 DOWNTO 0);
  SIGNAL ADDRA : STD_LOGIC_VECTOR(SIZE-1 DOWNTO 0);
  SIGNAL DINA : STD_LOGIC_VECTOR(95 DOWNTO 0);
  SIGNAL DOUTA : STD_LOGIC_VECTOR(95 DOWNTO 0);
  SIGNAL ADDRB : STD_LOGIC_VECTOR(SIZE-1 DOWNTO 0);
  SIGNAL DINB : STD_LOGIC_VECTOR(95 DOWNTO 0) := ( OTHERS => '0' );
  SIGNAL DOUTB : STD_LOGIC_VECTOR(95 DOWNTO 0);
  SIGNAL REFCOUNT : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL MASKED_LOOKUP_ADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL MY_NETWORK : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL DEST_IP_ADDR : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL TARGET_NETWORK : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL WILDCARD : STD_LOGIC;
  SIGNAL TISFOUND : STD_LOGIC := '0';
  SIGNAL TISNTFOUND : STD_LOGIC := '0';
  SIGNAL LATCHED_DOUTB : STD_LOGIC_VECTOR(95 DOWNTO 0);
BEGIN

  arptab_dpram_imp : arptab_dpram
  PORT MAP (
    clka => CLK,
    wea => WRITE_ENABLE,
    addra => ADDRA,
    dina => DINA,
    douta => DOUTA,
    clkb => CLK,
    web => "0",
    addrb => ADDRB,
    dinb => DINB,
    doutb => DOUTB
  );

  PROCESS ( CLK ) BEGIN
    IF ( CLK'EVENT AND CLK = '1' ) THEN
      IF ( RESET = '1' ) THEN
        COUNT <= 0;
        TISFOUND <= '0';
        TISNTFOUND <= '0';
        STATE <= Idle;
      ELSE
        LATCHED_DOUTB <= DOUTB;
        CASE STATE IS
          WHEN Idle =>
            IF ( WRITE_STROBE = '1' ) THEN
              NEW_IP_ADDR <= LOAD_IP_ADDR;
              NEW_HW_ADDR <= LOAD_HW_ADDR;
              SEARCH_INDEX <= 0;
              IF ( COUNT = 0 ) THEN
                COUNT <= 1;
                DINA <= X"0000" & LOAD_HW_ADDR & LOAD_IP_ADDR;
                STATE <= Write;
              ELSE
                STATE <= WriteAddr;
              END IF;
            ELSIF ( READ_STROBE = '1' ) THEN
              NEW_IP_ADDR <= DEST_IP_ADDR;
              IF ( WILDCARD = '1' ) THEN
                TISFOUND <= '1';
                TISNTFOUND <= '0';
                LOOKUP_HW_ADDR <= ( OTHERS => '1' );
                STATE <= Idle;
              ELSIF ( COUNT = 0 ) THEN
                TISFOUND <= '0';
                TISNTFOUND <= '1';
                LOOKUP_HW_ADDR <= ( OTHERS => '1' );
                STATE <= Idle;
              ELSE
                SEARCH_INDEX <= 0;
                TISFOUND <= '0';
                TISNTFOUND <= '0';
                STATE <= ReadAddr;
              END IF;
            ELSE
              STATE <= Idle;
            END IF;
          WHEN WriteAddr =>
            STATE <= WriteTest;
          WHEN WriteTest =>
            IF ( DOUTA(31 DOWNTO 0) = NEW_IP_ADDR ) THEN
              DINA <= REFCOUNT & DOUTA(79 DOWNTO 0);
              STATE <= Write;
            ELSIF ( SEARCH_INDEX = COUNT ) THEN
              DINA <= X"0000" & NEW_HW_ADDR & NEW_IP_ADDR;
              COUNT <= SEARCH_INDEX+1;
              STATE <= Write;
            ELSIF ( SEARCH_INDEX < 2**SIZE-1 ) THEN
              SEARCH_INDEX <= SEARCH_INDEX + 1;
              STATE <= WriteAddr;
            END IF;
          WHEN Write =>
            STATE <= Idle;
          WHEN ReadAddr =>
            STATE <= ReadTest;
          WHEN ReadTest =>
            IF ( DOUTA(31 DOWNTO 0) = DEST_IP_ADDR ) THEN
              LOOKUP_HW_ADDR <= DOUTA(79 DOWNTO 32);
              TARGET_IP_ADDR <= DOUTA(31 DOWNTO 0);
              TISFOUND <= '1';
              TISNTFOUND <= '0';
              DINA <= REFCOUNT & NEW_HW_ADDR & NEW_IP_ADDR;
              STATE <= Write;
            ELSIF ( SEARCH_INDEX = COUNT ) THEN
              TISFOUND <= '0';
              TISNTFOUND <= '1';
              LOOKUP_HW_ADDR <= ( OTHERS => '1' );
              STATE <= Idle;
            ELSE
              SEARCH_INDEX <= SEARCH_INDEX + 1;
              STATE <= ReadAddr;
            END IF;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  ADDRA <= STD_LOGIC_VECTOR(TO_UNSIGNED(SEARCH_INDEX,SIZE));
  ADDRB <= INDEX(SIZE-1 DOWNTO 0);
  TABLE_IP_ADDR <= LATCHED_DOUTB(31 DOWNTO 0);
  TABLE_HW_ADDR <= LATCHED_DOUTB(79 DOWNTO 32);
  TABLE_REF_COUNT <= LATCHED_DOUTB(95 DOWNTO 80);
  BROADCAST <= WILDCARD;
  ENTRIES <= STD_LOGIC_VECTOR(TO_UNSIGNED(COUNT,8));
  FOUND <= TISFOUND;
  MISSING <= TISNTFOUND;

  WRITE_ENABLE <= "1" WHEN STATE = Write ELSE "0";
  REFCOUNT <= STD_LOGIC_VECTOR(UNSIGNED(DOUTA(95 DOWNTO 80))+1);

  MASKED_LOOKUP_ADDR <= LOOKUP_IP_ADDR OR MY_NETMASK;
  WILDCARD <= '1' WHEN MASKED_LOOKUP_ADDR = X"FFFFFFFF" ELSE '0';

  MY_NETWORK <= MY_IP_ADDRESS AND MY_NETMASK;
  TARGET_NETWORK <= LOOKUP_IP_ADDR AND MY_NETMASK;
  DEST_IP_ADDR <= LOOKUP_IP_ADDR WHEN MY_NETWORK = TARGET_NETWORK ELSE GW_IP_ADDRESS;

END RTL;
