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

static unsigned char dthr[] = {16, 20, 24, 28, 32, 36, 40, 44};

int main(int argc, char **argv) {
  int ierr, i, s, strip;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;
  unsigned int mask[4];

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

  int chan = atoi(argv[2]);
  unsigned char chmask = 1 << chan;
  int first = atoi(argv[3]);
  int last = atoi(argv[4]);

  cout << "Analyzing pedestals for channel " << chan << " strips " << first
       << ".." << last << endl;
  TFile *fout = new TFile("pedestal.root", "RECREATE");
  fout->cd();
  TH2F *h_ped =
      new TH2F("ped", "occupancy vs dvtn", 640, -0.5, 639.5, 16, -0.5, 15.5);

  Stib *msg = new Stib(s, (struct sockaddr *)&daddr, sizeof(daddr));
  for (int strip = first; strip <= last; strip++) {
    for (int dvtn = 0; dvtn < 16; dvtn++) {
      msg->Clear();
      msg->Write(STRIP_CSR, 0x00000100);         //  Don't enable streaming data
      msg->Write(STRIP_BCO_DCM, 0x80500005);     //  Set numerator to 6
      msg->WaitClear(STRIP_BCO_DCM, 0x80000000); //  Wait DCM write to finish
      msg->Write(STRIP_BCO_DCM, 0x80520003);     //  Set denominator to 4
      msg->WaitClear(STRIP_BCO_DCM, 0x80000000); //  Wait DCM write to finish
      msg->Write(STRIP_RESET, 0xd000003f);       //  Issue reset
      msg->WaitClear(STRIP_RESET, 0xf0000000);   //  Wait for reset to complete
      for (i = 0; i < 8; i++) {
        msg->SlowControls(21, chmask, DTHR + i, WRITE,
                          16 * i + 16); //  Set discriminator thresholds
      }
      msg->Write(STRIP_ANALYSIS_CSR, 0x40000000); //  Clear analysis scalers
      Stib::MaskBits(mask, SET);
      Stib::MaskBits(mask, CLEAR, strip);
      msg->SlowControls(21, chmask, KILL, WRITE, mask);
      msg->SlowControls(21, chmask, DVTN, WRITE, dvtn);
      msg->SlowControls(21, chmask, REJECT_HITS, RESET);
      msg->SlowControls(21, chmask, SEND_DATA, SET);
      msg->Write(STRIP_ANALYSIS_CSR, 0x00009000 | (chan << 16) |
                                         (Stib::SetNumber(strip) << 4) |
                                         Stib::StripNumber(strip));
      msg->WaitSet(STRIP_ANALYSIS_CSR, 0x80000000, 10000000);
      unsigned char ind[6];
      for (int i = 0; i < 6; i++) {
        ind[i] = msg->Read(STRIP_ANALYSIS_BCO_COUNTER + 0x100 * i);
      }
      msg->Send();
      if ((ierr = msg->Receive()) < 0) {
        cout << "Strip " << strip << ", dvtn = " << dvtn
             << " - receive error = " << ierr << endl;
        dvtn -= 1;
      } else {
        double frac[5];
        unsigned int den = msg->RxData(ind[0], 1);
        cout << "Denominator = 0x" << hex << den << dec << endl;
        if (den == 0xffffffff)
          continue;
        for (int i = 0; i < 5; i++) {
          double num = msg->RxData(ind[i + 1], 1);
          double frac = num / den;
          cout << "Strip " << 128 * i + strip << ", dvtn = " << dvtn
               << ", frac = " << num << "/" << den << " = " << frac << endl;
          h_ped->SetBinContent(128 * i + strip + 1, dvtn + 1, frac);
        }
      }
    }
  }
  fout->Write();
  fout->Close();

  return 0;
}
