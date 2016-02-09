#include <iostream>
#include <stdio.h>
#include <string>


using namespace std;

int main()
{

  //for ethernet block address space

  unsigned int block = 1;
  string blockName = "Ethernet block address space";

  string specialStrobeSig = "arp_announce";

  string htmlFilename = "address_space.html";
  FILE * fp = fopen(htmlFilename.c_str(),"w");
  if(!fp)
  {
	  cout << "html file fail." << endl;
	  return 0;
  }

  int sz = 11;
  string name[] = 
    {
      "self_addr",
      "user_addr_byte",
      "self_mac",
      "tx_ctrl_dest_addr",
      "tx_ctrl_dest_mac",
      "tx_ctrl_dest_port",
      "tx_data_dest_addr",
      "tx_data_dest_mac",
      "tx_data_dest_port",
      "burst_mode",
      "ETH_INTERFACE_VERSION",
     };
  sz = sz; //DONT FORGET TO UPDATE SIZE!!!!!!!
  unsigned int address[] = 
    {
      0, 1, 2,
      3, 4, 5,
      6, 7, 8,
      9,
      100,
    };
  unsigned int fieldSz[] = 
    {
      24, 8, 48,
      32, 48, 16,
      32, 48, 16,
      1,
      16,
    };
  unsigned int specialStrobe[] = 
    {
      1, 1, 1,
      0, 0, 0,
      0, 0, 0,
      0,
      0,
    };
  unsigned int readOnly[] = 
    {
      0, 0, 0,
      0, 0, 0,
      0, 0, 0,
      0,
      1,
    };

  //write ots port and then user port
  
  printf("\tinternal_eth_dout <= (others => '0');\n");	
  printf("\tinternal_dout <= (others => '0');\n");	
  printf("\t%s <= '0';\n", specialStrobeSig.c_str());	

  fprintf(fp,"<table style='border:1px solid gray;cellpadding:0;cellspacing=0'>");

  fprintf(fp,"<tr>");
  fprintf(fp,"<td>Block</td>");
  fprintf(fp,"<td>Address</td>");
  fprintf(fp,"<td>Field Name</td>");
  fprintf(fp,"<td>Field Size</td>");
  fprintf(fp,"<td>Triggers ARP</td>");
  fprintf(fp,"</tr>");



  //WRITE Ethernet interface ===================
  printf("\n\tif ( ots_wren = '1' and  \t\t\t\t-- WRITE eth ===========\n");
  printf("\t\t ots_block_sel = %d) then -- %s\n", block, blockName.c_str());

  for(int i=0;i<sz;++i)
    {

	  //web page
	  fprintf(fp,"<tr>");
	  fprintf(fp,"<td>0x%8.8X</td>",block);
	  fprintf(fp,"<td>0x%8.8X</td>",address[i]);
	  fprintf(fp,"<td>%s</td>",name[i].c_str());
	  fprintf(fp,"<td>%db</td>",fieldSz[i]);
	  fprintf(fp,"<td>%s</td>",specialStrobe[i]?"YES":"");
	  fprintf(fp,"</tr>");

      if(readOnly[i]) continue;

      printf("\t\t%sif ( ots_block_addr = %d ) then \n", (i?"els":""), address[i]);
      if(fieldSz[i] > 1)
	printf("\t\t\t %s <= ots_din(%d downto 0); \n", name[i].c_str(), fieldSz[i]-1);
      else
	printf("\t\t\t %s <= ots_din(0); \n", name[i].c_str());
      if(specialStrobe[i])
	printf("\t\t\t %s <= '1';\n", specialStrobeSig.c_str());
    }

  printf("\t\tend if;\n");

  //WRITE Internal ===================
  printf("\telsif ( internal_we = '1' and  \t\t\t\t-- WRITE internal ===========\n");
  printf("\t\t unsigned(internal_block_sel) = %d) then -- %s\n", block, blockName.c_str());

  for(int i=0;i<sz;++i)
    {
      if(readOnly[i]) continue;

      printf("\t\t%sif ( unsigned(internal_addr) = %d ) then \n", (i?"els":""), address[i]);
      if(fieldSz[i] > 1)
	printf("\t\t\t %s <= internal_din(%d downto 0); \n", name[i].c_str(), fieldSz[i]-1);
      else
	printf("\t\t\t %s <= internal_din(0); \n", name[i].c_str());

      if(specialStrobe[i])
	printf("\t\t\t %s <= '1';\n", specialStrobeSig.c_str());
    }
  printf("\t\tend if;\n");


  //FIXME :: uncomment next line and delete rest for other blocks!
  //printf("\tend if;\n");
  //SPECIAL WRITE for single byte source capture ===================
  printf("\telsif ( user_rx_src_capture_for_ctrl = '1' ) then  \t\t\t\t-- SPECIAL WRITE for source capture for ctrl ===========\n");
  printf("\t\t %s <= user_rx_src_addr;\n", name[3].c_str());
  printf("\t\t %s <= user_rx_src_mac;\n", name[4].c_str());
  printf("\t\t %s <= user_rx_src_port;\n", name[5].c_str());

  //SPECIAL WRITE for single byte source capture ===================
  printf("\telsif ( user_rx_src_capture_for_data = '1' ) then  \t\t\t\t-- SPECIAL WRITE for source capture for data ===========\n");
  printf("\t\t %s <= user_rx_src_addr;\n", name[6].c_str());
  printf("\t\t %s <= user_rx_src_mac;\n", name[7].c_str());
  printf("\t\t %s <= user_rx_src_port;\n", name[8].c_str());


  printf("\tend if;\n");



  //READ Ethernet interface ===================
  printf("\n\tif ( ots_rden = '1' and  \t\t\t\t-- READ eth ===========\n");
  printf("\t\t ots_block_sel = %d) then -- %s\n", block, blockName.c_str());

  for(int i=0;i<sz;++i)
    {
      printf("\t\t%sif ( ots_block_addr = %d ) then \n", (i?"els":""), address[i]);
      if(fieldSz[i] > 1)
	printf("\t\t\t internal_eth_dout(%d downto 0) <= %s; \n", fieldSz[i]-1, name[i].c_str());
      else
	printf("\t\t\t internal_eth_dout(0) <= %s; \n", name[i].c_str());
    }
  printf("\t\tend if;\n");
  printf("\tend if;\n");

  //READ Internal interface ===================
  printf("\n\tif ( \t\t\t\t-- always READ internal ===========\n");
  printf("\t\t unsigned(internal_block_sel) = %d) then -- %s\n", block, blockName.c_str());

  for(int i=0;i<sz;++i)
    {
      printf("\t\t%sif ( unsigned(internal_addr) = %d ) then \n", (i?"els":""), address[i]);
      if(fieldSz[i] > 1)
	printf("\t\t\t internal_dout(%d downto 0) <= %s; \n", fieldSz[i]-1, name[i].c_str());
      else
	printf("\t\t\t internal_dout(0) <= %s; \n", name[i].c_str());
    }
  printf("\t\tend if;\n");
  printf("\tend if;\n");
  
  fprintf(fp,"</table>");
  fclose(fp);

  return 0;
}
