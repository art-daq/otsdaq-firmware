#include <iostream>
#include <stdio.h>
#include <string>


using namespace std;

int main()
{
  
  //for ethernet block address space

  unsigned int block = 1;
  string blockName = "Ethernet block address space";
  string names[] = 
    {
      "user_src_addr",
      "user_src_mac",
      "user_src_port",
      "user_data_dest_addr",
      "user_data_dest_mac",
      "user_data_dest_port",
      "user_ctrl_dest_addr",
      "user_ctrl_dest_mac",
      "user_ctrl_dest_port"
    };
  unsigned int address[] = 
    {
      0, 1, 2,
      3, 4, 5,
      6, 7, 8
    };

  //write ots port and then user port

  //       (unsigned(internal_block_sel) = 2)) then 		-- ethernet interface space

  cout << "\tif ( ots_wren = '1' ) then -- WRITE eth";
  cout << "\tif ( (ots_block_sel = " << block << " then " <<
    " -- " << blockName 
 
    


					     if ( ots_block_addr = 32 or
						  unsigned(internal_addrs) = 32) then		-- source address   
										   if (ots_wren = '1') then 		-- WRITE eth
													 user_src_addrs <= ots_din(7 downto 0); 				  
					else							-- READ eth
						internal_eth_dout(7 downto 0) <= user_src_addrs;
					end if;					
					
					if (internal_we = '1') then 	-- WRITE eth
						user_src_addrs <= internal_din(7 downto 0); 				  
					else							-- READ eth
						internal_dout(7 downto 0) <= user_src_addrs;
					end if;
						 
				end if;				
			end if;	   
			
		end if;
	end process;
  unsigned int cs=0;

  unsigned int vals[] = 
    {
      0x3579, //id
      0x4500, //vers/header
      0x8011, //tts/protocol
      0x001C, //header length

      0xC0A8, //ip 192.168.133
      0x8500,
      0xC0A8,
      0x8500};

  for(int i=0;i<4;++i)
  //for(int i=0;i<8;++i) //if using the prefix ip
    {
      cs += vals[i];
      if((cs>>16)&1) ++cs;
      cs &= 0xFFFF;
      printf("+ %4.4X = %4.4X\n",vals[i],cs);
    }


  return 0;
}
