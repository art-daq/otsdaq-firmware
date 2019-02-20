
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

#include "TApplication.h"
#include "TCanvas.h"
#include "TFile.h"
#include "TH2.h"
#include "TROOT.h"
#include "TText.h"

#include "stib.hh"

#define BUFLEN 1024

static unsigned char recvbuf[BUFLEN];

using namespace std;
using namespace stib;

int main(int argc, char **argv) {
  int ierr, i, s, strip, dlen;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;
  unsigned char *p;
  unsigned int word;
  unsigned int mask[4];
  time_t t0, t1;

  uint64_t bco_counter = 0ULL;
  uint64_t last_bco = 0ULL;

  if (argc < 2) {
    cerr << "Usage: " << argv[0] << " <port>" << endl;
    exit(1);
  }
  if ((s = socket(PF_INET, SOCK_DGRAM, 0)) < 0) {
    fprintf(stderr, "%s : socket() - %s\n", argv[0], strerror(errno));
    exit(1);
  }
  bzero((char *)&saddr, sizeof(saddr));
  saddr.sin_family = AF_INET;
  // saddr.sin_addr.s_addr = INADDR_ANY;
  port = atoi(argv[1]);
  saddr.sin_port = htons(port);

  if (bind(s, (struct sockaddr *)&saddr, sizeof(saddr)) < 0) {
    fprintf(stderr, "%s : bind() - %s\n", argv[0], strerror(errno));
    exit(1);
  }
  printf("Listening on port %d.\n", port);

  TApplication app("strip", &argc, argv);
  gROOT->SetStyle("Plain");
  TCanvas *c1 = new TCanvas("c1", NULL, 0, 0, 800, 900);
  c1->cd();
  c1->Divide(2, 3);
  c1->Draw();
  c1->Update();
  TH1F *h_strip[6][3];
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 6; i++) {
      char label[16], title[32];
      sprintf(label, "chan_%d_%d", j, i);
      sprintf(title, "STIB %d Channel %d", j, i);
      h_strip[i][j] = new TH1F(label, title, 640, -0.5, 639.5);
      c1->cd(i + 1);
      if (j == 0) {
        h_strip[i][j]->SetLineColor(kMagenta);
        h_strip[i][j]->SetStats(0);
        h_strip[i][j]->Draw();
      } else if (j == 1) {
        h_strip[i][j]->SetLineColor(kBlue + 4);
        h_strip[i][j]->SetStats(0);
        h_strip[i][j]->Draw("same");
      } else {
        h_strip[i][j]->SetLineColor(kBlue - 6);
        h_strip[i][j]->SetStats(0);
        h_strip[i][j]->Draw("same");
      }
      h_strip[i][j]->GetXaxis()->SetTitle("Strip number");
    }
  }
  TText *label = new TText(0.2, 0.8, "blah");
  label->SetTextSize(0.06);
  label->SetNDC();

  int nhit = 0;
  int lasthit = -1;
  time(&t0);
  while (1) {
    dlen = sizeof(daddr);
    int len;
    cout << "Reading... " << endl;
    if ((len = recvfrom(s, recvbuf, BUFLEN, 0, (struct sockaddr *)&daddr,
                        (socklen_t *)&dlen)) < 0) {
      fprintf(stderr, "%s : recvfrom() - %s\n", argv[0], strerror(errno));
      exit(1);
    }
    int j = -1;
    if ((ntohl(daddr.sin_addr.s_addr) & 0xff) == 20)
      j = 0;
    if ((ntohl(daddr.sin_addr.s_addr) & 0xff) == 36)
      j = 1;
    if ((ntohl(daddr.sin_addr.s_addr) & 0xff) == 132)
      j = 2;
    if (j < 0) {
      if (ntohs(daddr.sin_port) == 47101)
        j = 0;
      if (ntohs(daddr.sin_port) == 48101)
        j = 1;
      if (ntohs(daddr.sin_port) == 49101)
        j = 2;
    }
    if (j < 0) {
      cout << "Port number " << ntohs(daddr.sin_port) << endl;
      continue;
    }
    cout << "Received from address " << hex << ntohl(daddr.sin_addr.s_addr)
         << ", j = " << j << endl;
    for (int i = 0; i < len / 4; i++) {
      word = ntohl(((unsigned int *)recvbuf)[i]);
      cout << hex << word << dec << endl;
      int type = word & 0x0f;
      int datatype = (word >> 4) & 0x0f;

      unsigned int data = word >> 8;
      int chan = (word >> 27) & 0x07;
      int chipid = (word >> 24) & 0x07;
      int set = (word >> 12) & 0x1f;
      int strip = (word >> 17) & 0x0f;
      int bco = (word >> 4) & 0xff;
      int adc = (word >> 1) & 0x7;
      int istrip = Stib::SensorStrip(chipid, set, strip);
      if (type == 8) {
        if (datatype == 2) {
          bco_counter &= 0x0000000000ffffffULL;
          bco_counter |= ((uint64_t)data) << 24;
          cout << "BCO = " << hex << bco_counter << dec << " ("
               << bco_counter - last_bco << ")" << endl;
        }
        if (datatype == 1) {
          last_bco = bco_counter;
          bco_counter &= 0xffffffffff000000ULL;
          bco_counter |= (uint64_t)data;
        }
        if (datatype <= 0x0f && datatype >= 0x0c) {
          int trig0 = (word >> 16) & 0xff;
          int trig1 = (word >> 24) & 0xff;
          int bco = (word >> 8) & 0xff;
          cout << "Trigger word " << 15 - datatype << " : ";
          for (int k = 0; k < 8; k++) {
            if ((trig1 & (1 << k))) {
              cout << "#";
            } else {
              cout << "_";
            }
          }
          cout << "  ";
          for (int k = 0; k < 8; k++) {
            if ((trig0 & (1 << k))) {
              cout << "#";
            } else {
              cout << "_";
            }
          }
          cout << "  " << hex << bco << dec << endl;
        }
        if (datatype == 0x0a) {
          int bco = (word >> 8) & 0xff;
          int trignum_low = word >> 16;
          cout << "Trigger low = " << trignum_low << ", bco = " << hex << bco
               << dec << endl;
        }
        if (datatype == 0x0b) {
          int trignum_high = word >> 8;
          cout << "Trigger high = " << trignum_high << endl;
        }
      } else if ((type & 1) == 1) {
        cout << "Channel: " << chan << " chipid: " << chipid << " set: " << set
             << " strip: " << strip << " adc: " << adc << " bco: " << hex << bco
             << dec << " istrip: " << istrip << endl;
        if (chan > 5 || istrip > 639) {
          cout << "Bad word " << i << " = " << hex << word << dec << " = "
               << chan << "," << chipid << "," << set << "," << strip << " = "
               << istrip << endl;
        }
        cout << "Type: " << type << " DataType " << datatype
             << " chan: " << chan << " chipid: " << chipid << " set: " << set
             << " strip: " << strip << " bco: " << bco << " istrip: " << istrip
             << " adc: " << adc << endl;
        if (chan < 6)
          h_strip[chan][j]->Fill(istrip, 1);
        nhit += 1;
      }
    }
    time(&t1);
    if (t1 - t0 > 5) {
      for (int i = 0; i < 6; i++) {
        if (h_strip[i][0]->GetEntries() > 0 ||
            h_strip[i][1]->GetEntries() > 0 ||
            h_strip[i][2]->GetEntries() > 0) {
          c1->cd(i + 1);
          int j, jmax = 0;
          for (j = 1; j < 3; j++) {
            if (h_strip[i][j]->GetBinContent(h_strip[i][j]->GetMaximumBin()) >
                h_strip[i][jmax]->GetBinContent(
                    h_strip[i][jmax]->GetMaximumBin())) {
              jmax = j;
            }
          }
          if (i < 4) {
            h_strip[i][jmax]->Draw();
            if (jmax != 0)
              h_strip[i][0]->Draw("same");
            if (jmax != 1)
              h_strip[i][1]->Draw("same");
            if (jmax != 2)
              h_strip[i][2]->Draw("same");
          } else {
            h_strip[i][2]->Draw();
          }
          char hot[64];
          sprintf(hot, "Hot strip %d", h_strip[i][jmax]->GetMaximumBin() - 1);
          label->SetTextColor(h_strip[i][jmax]->GetLineColor());
          label->DrawText(0.2, 0.7, hot);
        }
      }
      c1->Update();
      t0 = t1;
    }
    cout << nhit << endl;
  }
  app.Run();

  return 0;
}
