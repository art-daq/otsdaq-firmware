#include <iostream>
#include <stdio.h>
#include <string>

using namespace std;

int main() {

  // for ethernet block address space

  unsigned int block = 1;
  string blockName = "Ethernet block address space";

  int numSpecialStrobes = 3;
  string specialStrobeSigs[] = {"arp_announce_sig", "ctrl_addr_resolve",
                                "data_addr_resolve"};

  string htmlFilename = "oei_address_space.html";
  FILE *fp = fopen(htmlFilename.c_str(), "w");
  if (!fp) {
    cout << "html file fail." << endl;
    return 0;
  }

  int sz = 14;
  string name[] = {
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
      "ctrl_dynamic_mac_resolution",
      "data_dynamic_mac_resolution",
      "ETH_INTERFACE_VERSION",
      "internal_reset",
  };
  // sz = sz; //DONT FORGET TO UPDATE SIZE!!!!!!!
  string desc[] = {
      "Upper 24-bits of self IP Address",
      "lower 7-bits of self IP and MAC Address",
      "Upper 40-bits of self MAC Address",
      "Destination IP for Normal mode transmission",
      "Destination MAC for Normal mode transmission",
      "Destination PORT for Normal mode transmission",
      "Destination IP for Burst mode transmission",
      "Destination MAC for Burst mode transmission",
      "Destination PORT for Burst mode transmission",
      "Enable Burst mode",
      "Enable Dynamic MAC Address Resolution for Normal mode",
      "Enable Dynamic MAC Address Resolution for Burst mode",
      "OEI Ethernet Interface Version",
      "Force reset of OEI status/errors/FIFOs/FSMs and, additionally (if bit-1 "
      "is low), reset is forwarded out of Ethernet block",
  };
  // sz = sz; //DONT FORGET TO UPDATE SIZE!!!!!!!
  unsigned int address[] = {
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 100, -1,
  };
  unsigned int fieldSz[] = {
      24, 8, 40, 32, 48, 16, 32, 48, 16, 1, 1, 1, 16, 2,
  };
  unsigned int specialStrobe[] = {
      1, 1, 1, 2, 0, 0, 3, 0, 0, 0, 0, 0, 0,
  };
  unsigned int access[] = // bit 0 = R, bit 1 = W
      {
          3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 2,
      };

  // write ots port and then user port

  printf("\tinternal_eth_dout <= (others => '0');\n");
  printf("\tinternal_dout <= (others => '0');\n");
  printf("\tinternal_reset(0) <= '0';\n");
  // for (int i=0; i<numSpecialStrobes; i++)
  // printf("\t%s <= '0';\n", specialStrobeSigs[i].c_str());
  //

  fprintf(fp,
          "<table style='border:1px solid gray;cellpadding:0;cellspacing=0'>");

  fprintf(fp, "<tr>");
  fprintf(fp, "<td "
              "style='padding:5px;font-weight:heavy;text-decoration:underline'>"
              "Block</td>");
  fprintf(fp, "<td "
              "style='padding:5px;font-weight:heavy;text-decoration:underline'>"
              "Address</td>");
  fprintf(fp, "<td "
              "style='padding:5px;font-weight:heavy;text-decoration:underline'>"
              "Field-Name</td>");
  fprintf(fp, "<td "
              "style='padding:5px;font-weight:heavy;text-decoration:underline'>"
              "Field-Size</td>");
  fprintf(fp, "<td "
              "style='padding:5px;font-weight:heavy;text-decoration:underline'>"
              "Triggers-ARP</td>");
  fprintf(fp, "<td "
              "style='padding:5px;font-weight:heavy;text-decoration:underline'>"
              "Read/Write</td>");
  fprintf(fp, "<td "
              "style='padding:5px;font-weight:heavy;text-decoration:underline'>"
              "Description</td>");
  fprintf(fp, "</tr>");

  // WRITE Ethernet interface ===================
  printf("\n\tif ( ots_wren = '1' and  \t\t\t\t-- WRITE eth ===========\n");
  printf("\t\t ots_block_sel = x\"%lX\") then -- %s\n", block,
         blockName.c_str());

  for (int i = 0; i < sz; ++i) {

    // web page
    fprintf(fp, "<tr>");
    fprintf(fp, "<td>0x%8.8X</td>", block);
    fprintf(fp, "<td>0x%8.8X</td>", address[i]);
    fprintf(fp, "<td>%s</td>", name[i].c_str());
    fprintf(fp, "<td>%db</td>", fieldSz[i]);
    if (specialStrobe[i] == 1)
      fprintf(fp, "<td>YES</td>");
    else if (specialStrobe[i] > 1)
      fprintf(fp, "<td>YES*</td>");
    else
      fprintf(fp, "<td></td>");
    fprintf(fp, "<td>%s</td>",
            access[i] == 1 ? "R" : (access[i] == 2 ? "W" : "R/W"));
    fprintf(fp, "<td>%s</td>", desc[i].c_str());
    fprintf(fp, "</tr>");

    if (((access[i] >> 1) & 1) == 0)
      continue; // no write access

    printf("\t\t%sif ( ots_block_addr = x\"%lX\" ) then \n", (i ? "els" : ""),
           address[i]);
    if (fieldSz[i] > 1)
      printf("\t\t\t %s <= ots_din(%d downto 0); \n", name[i].c_str(),
             fieldSz[i] - 1);
    else
      printf("\t\t\t %s <= ots_din(0); \n", name[i].c_str());
    if (specialStrobe[i])
      printf("\t\t\t %s <= '1';\n",
             specialStrobeSigs[specialStrobe[i] - 1].c_str());
  }

  printf("\t\tend if;\n");

  // WRITE Internal ===================
  printf("\telsif ( internal_we = '1' and  \t\t\t\t-- WRITE internal "
         "===========\n");
  printf("\t\t unsigned(internal_block_sel) = x\"%lX\") then -- %s\n", block,
         blockName.c_str());

  for (int i = 0; i < sz; ++i) {
    if (((access[i] >> 1) & 1) == 0)
      continue; // no write access

    printf("\t\t%sif ( unsigned(internal_addr) = x\"%lX\" ) then \n",
           (i ? "els" : ""), address[i]);
    if (fieldSz[i] > 1)
      printf("\t\t\t %s <= internal_din(%d downto 0); \n", name[i].c_str(),
             fieldSz[i] - 1);
    else
      printf("\t\t\t %s <= internal_din(0); \n", name[i].c_str());

    if (specialStrobe[i])
      printf("\t\t\t %s <= '1';\n",
             specialStrobeSigs[specialStrobe[i] - 1].c_str());
  }
  printf("\t\tend if;\n");

  // FIXME :: uncomment next line and delete rest for other blocks!
  // printf("\tend if;\n");
  // SPECIAL WRITE for single byte source capture ===================
  printf("\telsif ( user_rx_src_capture_for_ctrl = '1' ) then  \t\t\t\t-- "
         "SPECIAL WRITE for source capture for ctrl ===========\n");
  printf("\t\t %s <= user_rx_src_addr;\n", name[3].c_str());
  printf("\t\t %s <= user_rx_src_mac;\n", name[4].c_str());
  printf("\t\t %s <= user_rx_src_port;\n", name[5].c_str());

  // SPECIAL WRITE for single byte source capture ===================
  printf("\telsif ( user_rx_src_capture_for_data = '1' ) then  \t\t\t\t-- "
         "SPECIAL WRITE for source capture for data ===========\n");
  printf("\t\t %s <= user_rx_src_addr;\n", name[6].c_str());
  printf("\t\t %s <= user_rx_src_mac;\n", name[7].c_str());
  printf("\t\t %s <= user_rx_src_port;\n", name[8].c_str());

  printf("\tend if;\n");

  // READ Ethernet interface ===================
  printf("\n\tif ( ots_rden = '1' and  \t\t\t\t-- READ eth ===========\n");
  printf("\t\t ots_block_sel = x\"%lX\") then -- %s\n", block,
         blockName.c_str());

  for (int i = 0; i < sz; ++i) {
    if (((access[i] >> 0) & 1) == 0)
      continue; // no read access

    printf("\t\t%sif ( ots_block_addr = x\"%lX\" ) then \n", (i ? "els" : ""),
           address[i]);
    if (fieldSz[i] > 1)
      printf("\t\t\t internal_eth_dout(%d downto 0) <= %s; \n", fieldSz[i] - 1,
             name[i].c_str());
    else
      printf("\t\t\t internal_eth_dout(0) <= %s; \n", name[i].c_str());
  }
  printf("\t\tend if;\n");
  printf("\tend if;\n");

  // READ Internal interface ===================
  printf("\n\tif ( \t\t\t\t-- always READ internal ===========\n");
  printf("\t\t unsigned(internal_block_sel) = x\"%lX\") then -- %s\n", block,
         blockName.c_str());

  for (int i = 0; i < sz; ++i) {
    if (((access[i] >> 0) & 1) == 0)
      continue; // no read access

    printf("\t\t%sif ( unsigned(internal_addr) = x\"%lX\" ) then \n",
           (i ? "els" : ""), address[i]);
    if (fieldSz[i] > 1)
      printf("\t\t\t internal_dout(%d downto 0) <= %s; \n", fieldSz[i] - 1,
             name[i].c_str());
    else
      printf("\t\t\t internal_dout(0) <= %s; \n", name[i].c_str());
  }
  printf("\t\tend if;\n");
  printf("\tend if;\n");

  fprintf(fp, "</table>");
  fprintf(fp, "<tr><td><small>*Only if dynamic MAC resolution "
              "enabled.</small></td></tr>");
  fclose(fp);

  return 0;
}
