#include <arpa/inet.h>
#include <errno.h>
#include <iostream>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/types.h>
#include <time.h>

#include "TFile.h"
#include "TH2.h"
#include "TROOT.h"

#include "stib.hh"

using namespace std;
using namespace stib;

int main(int argc, char **argv) {
  int ierr, s;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;
  unsigned int mask[4];
  unsigned int inject[4];

  if (argc < 5) {
    cerr << "Usage: " << argv[0] << " <addr> <chan> <first> <last>" << endl;
    exit(1);
  }
  if ((s = socket(PF_INET, SOCK_DGRAM, 0)) < 0) {
    fprintf(stderr, "%s : socket() - %s\n", argv[0], strerror(errno));
    exit(1);
  }
  bzero((char *)&saddr, sizeof(saddr));
  saddr.sin_family = AF_INET;
  // saddr.sin_port = htons(47000);
  if (bind(s, (struct sockaddr *)&saddr, sizeof(saddr)) < 0) {
    fprintf(stderr, "%s : bind() - %s\n", argv[0], strerror(errno));
    exit(1);
  }
  namelen = sizeof(saddr);
  if (getsockname(s, (struct sockaddr *)&saddr, &namelen) < 0) {
    fprintf(stderr, "%s : getsockname() - %s\n", argv[0], strerror(errno));
    exit(1);
  }
  printf("Source port = %d (0x%04x)\n", ntohs(saddr.sin_port),
         ntohs(saddr.sin_port));

  if ((hp = gethostbyname(argv[1])) == NULL) {
    fprintf(stderr, "%s : gethostbyname(%s) - %s\n", argv[0], argv[1],
            strerror(errno));
    exit(1);
  }
  bcopy(hp->h_addr, &daddr.sin_addr, hp->h_length);
  daddr.sin_family = hp->h_addrtype;
  port = STIB_PORT;
  daddr.sin_port = htons(port);
  if ((ntohl(daddr.sin_addr.s_addr) & 0xff) == 0xff) {
    broadcast_enable = 1;
    if (setsockopt(s, SOL_SOCKET, SO_BROADCAST, &broadcast_enable,
                   sizeof(broadcast_enable)) < 0) {
      fprintf(stderr, "%s : setsockopt() - %s\n", argv[0], strerror(errno));
      exit(1);
    }
    printf("Enabled broadcast.\n");
  }

  struct timeval timeout;
  timeout.tv_sec = 10;
  timeout.tv_usec = 0;
  if (setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) < 0) {
    fprintf(stderr, "%s : setsockopt() - %s\n", argv[0], strerror(errno));
    exit(1);
  }
  Stib *msg = new Stib(s, (struct sockaddr *)&daddr, sizeof(daddr));
  msg->Clear();
  msg->Write(DATA_DESTINATION_IP,
             0xc0a88501); //  Set data destination IP 192.168.133.1
  msg->Write(DATA_SOURCE_DESTINATION_PORT,
             0xbeefb798); //  Set data destination port 0xb798=47000
  // unsigned int sourceDestinationPort = (sourcePort << 16) + port;
  // msg->Write(DATA_SOURCE_DESTINATION_PORT,sourceDestinationPort); //  Set
  // data destination port 0xb798=47000
  msg->Send();
  msg->Clear();

  // msg->Write    (STRIP_CSR,     0x0f000100);//  Enable streaming data
  msg->Write(STRIP_CSR, 0x00000100);         //  Don't enable streaming data
  msg->Write(STRIP_BCO_DCM, 0x80500005);     //  Set numerator to 6
  msg->WaitClear(STRIP_BCO_DCM, 0x80000000); //  Wait DCM write to finish
  msg->Write(STRIP_BCO_DCM, 0x80520003);     //  Set denominator to 4
  msg->WaitClear(STRIP_BCO_DCM, 0x80000000); //  Wait DCM write to finish
  msg->Write(STRIP_RESET, 0xf000003f);       //  Issue reset
  msg->WaitClear(STRIP_RESET, 0xf0000000);   //  Wait for reset to complete
  msg->Send();
  msg->Clear();

  unsigned char defaultDthr[] = {100, 120, 140, 160, 180, 200, 220, 240};
  int channel = atoi(argv[2]);
  unsigned char channelMask = 1 << channel;
  int firstStrip = atoi(argv[3]);
  int lastStrip = atoi(argv[4]);
  int dvtn = 0;
  int dvtpBegin = 14;
  int dvtpStep = 1;
  int dvtpEnd = dvtn;
  int dvtpForInject = 30;
  int dacMin = 60;
  int dacMax = 180;
  int dacStep = 10;
  int iDac = 0x04;

  int nLoops;

  // return EXIT_SUCCESS;
  cout << "Analyzing pedestals for strips " << firstStrip << ".." << lastStrip
       << endl;
  TFile *outFile = TFile::Open("ModuleTest.root", "RECREATE");
  outFile->cd();
  TH2F *hPedestal =
      new TH2F("hPedestal", "Occupancy vs dvtp", 641, -0.5, 640.5,
               (dvtpBegin - dvtpEnd) / dvtpStep + 1, dvtpEnd - dvtpStep / 2.,
               dvtpBegin + dvtpStep / 2.);
  TH2F *hThreshold = new TH2F("hThreshold", "Occupancy vs dac", 641, -0.5,
                              640.5, (dacMax - dacMin) / dacStep + 1,
                              dacMin - dacStep / 2., dacMax + dacStep / 2.);

  // Analysis = 0 -> Pedestal; Analysis = 1 -> Inject
  for (int analysis = 0; analysis <= 1; analysis++) {
    msg->SlowControls(21, channelMask, DVTN, WRITE, dvtn);
    for (int i = 0; i < 8; i++)
      msg->SlowControls(21, channelMask, DTHR + i, WRITE,
                        defaultDthr[i]); //  Set discriminator thresholds
    msg->Send();
    msg->Clear();
    if (analysis == 0) {
      nLoops = (dvtpBegin - dvtpEnd) / dvtpStep + 1;
    } else if (analysis == 1) {
      nLoops = (dacMax - dacMin) / dacStep + 1;
      msg->Write(STRIP_DAC_SPI, 0x80000000 | (iDac << 16));
      msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
      msg->Write(STRIP_DAC_SPI, 0x80000144 | (iDac << 16));
      msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
      msg->Write(STRIP_DAC_SPI, 0x80000240 | (iDac << 16));
      msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
      msg->Write(STRIP_DAC_INPUT,
                 0x00010000);                //  Don't forget to set the ramp...
      msg->Write(STRIP_DAC_CSR, 0x4000ff00); //  Continuous pulses
      msg->SlowControls(21, channelMask, DTHR, WRITE, dvtpForInject);
      msg->Send();
      msg->Clear();
      dvtpBegin = dvtpEnd = dvtpForInject;
    }
    for (int strip = firstStrip; strip <= lastStrip; strip++) {
      cout << endl
           << "~~~~~~~~~~~~~ Analyzing strip " << strip
           << " ~~~~~~~~~~~~~~~~~~~~~~" << endl;
      int iChip = strip / 128;
      int chipId = iChip + 9;
      Stib::MaskBits(mask, SET);
      Stib::MaskBits(mask, CLEAR, strip % 128);
      msg->SlowControls(chipId, channelMask, KILL, WRITE, mask);
      msg->Send();
      msg->Clear();
      usleep(100000);
      if (analysis == 1) {
        Stib::MaskBits(inject, SET);
        Stib::MaskBits(inject, CLEAR, strip % 128);
        msg->SlowControls(chipId, channelMask, INJECT, WRITE, inject);
        msg->Send();
        msg->Clear();
        usleep(100000);
      }
      unsigned int dvtp = dvtpBegin;
      unsigned int vDac = dacMin;
      for (int loop = 0; loop < nLoops; loop++) {

        msg->Clear();
        msg->SlowControls(chipId, channelMask, REJECT_HITS, SET);
        msg->SlowControls(chipId, channelMask, SEND_DATA, RESET);
        msg->Write(STRIP_ANALYSIS_CSR, 0x40000000); //  Clear analysis scalers
        if (analysis == 0) {
          dvtp = dvtpBegin - loop * dvtpStep;
          msg->SlowControls(chipId, channelMask, DTHR, WRITE, dvtp);
        } else if (analysis == 1) {
          vDac = dacMin + loop * dacStep;
          unsigned int dacWord = 0x00010000 | (((unsigned int)-vDac) & 0x0fff);
          msg->Write(STRIP_DAC_INPUT, dacWord);
        }
        msg->SlowControls(chipId, channelMask, REJECT_HITS, RESET);
        msg->SlowControls(chipId, channelMask, SEND_DATA, SET);
        msg->Write(STRIP_ANALYSIS_CSR, 0x0000a000 | (channel << 16) |
                                           (Stib::SetNumber(strip % 128) << 4) |
                                           Stib::StripNumber(strip % 128));
        msg->WaitSet(STRIP_ANALYSIS_CSR, 0x80000000, 10000000);
        msg->SlowControls(chipId, channelMask, REJECT_HITS, SET);
        msg->SlowControls(chipId, channelMask, SEND_DATA, RESET);
        if (analysis == 0)
          msg->SlowControls(chipId, channelMask, DTHR, WRITE, defaultDthr[0]);

        unsigned char ind[6];
        for (int i = 0; i < 6; i++) {
          ind[i] = msg->Read(STRIP_ANALYSIS_BCO_COUNTER + 0x100 * i);
        }
        msg->Send();
        msg->Clear();
        // cout << "Dvtp: " << dvtp  << " - Dvtn: " << dvtn << " = " <<
        // (int)(dvtp - dvtn) << endl;
        if ((ierr = msg->Receive()) < 0) {
          cout << "Strip " << strip << ", dvtn = " << dvtp
               << " - receive error = " << ierr << endl;
          --loop;
        } else {
          unsigned int den = msg->RxData(ind[0], 1);
          // cout << "Denominator = 0x" << hex << den << dec << endl;
          if (den == 0xffffffff) {
            --loop;
            continue;
          }
          double num = msg->RxData(ind[iChip + 1], 1);
          double frac = num / den;
          cout << "Strip " << strip << ", dvtp = " << dvtp
               << ", vdac = " << vDac << ", frac = " << num << "/" << den
               << " = " << frac << endl;
          if (analysis == 0)
            hPedestal->Fill(strip, dvtp, frac);
          // hPedestal->SetBinContent(strip+1,dvtp+1,frac);
          else if (analysis == 1)
            hThreshold->Fill(strip, vDac, frac);
        }
      }
    }
  }
  msg->Clear();
  msg->SlowControls(21, channelMask, REJECT_HITS, SET);
  msg->SlowControls(21, channelMask, SEND_DATA, RESET);
  msg->SlowControls(21, channelMask, DTHR, WRITE, dvtpBegin);
  msg->Send();
  msg->Clear();

  msg->Clear();
  msg->Write(STRIP_DAC_CSR, 0x0000ff00); // Turn off the pulser
  msg->Write(STRIP_DAC_SPI, 0x8000001c | (iDac << 16));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  msg->Send();
  msg->Clear();

  outFile->Write();
  outFile->Close();

  return 0;
}
