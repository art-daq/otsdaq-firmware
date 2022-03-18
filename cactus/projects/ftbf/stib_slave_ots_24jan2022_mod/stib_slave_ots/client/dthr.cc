#include <arpa/inet.h>
#include <errno.h>
#include <iostream>
#include <math.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/types.h>
#include <time.h>

#include "TF1.h"
#include "TFile.h"
#include "TGraphErrors.h"
#include "TH2F.h"
#include "TMath.h"
#include "TROOT.h"

#include "stib.hh"

using namespace std;
using namespace stib;

double ferf(double *x, double *p) {
  return p[2] +
         (1 - p[2]) * (0.5 + 0.5 * TMath::Erf((x[0] - p[0]) / p[1] / sqrt(2)));
}

int main(int argc, char **argv) {
  int ierr, i, s, strip;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;
  unsigned int mask[4], inject[4];
  unsigned int dac_word;

  if (argc < 5) {
    cerr << "Usage: " << argv[0] << " <addr> <chan> <first> <last> [dcr]"
         << endl;
    exit(1);
  }
  int dcr = 16;
  if (argc == 6)
    dcr = atoi(argv[5]);
  cout << "Setting DCR = " << dcr << endl;
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
  int idac = 0x04;

  cout << "Analyzing pedestals for channel " << chan << " strips " << first
       << ".." << last << endl;
  TFile *fout = new TFile("dthrscan.root", "RECREATE");
  fout->cd();
  int ndthr = 5;
  int dthrmin = 20;
  int dthrmax = 24;
  TH2F *h_mu = new TH2F("mu", NULL, 640, -0.5, 639.5, ndthr, dthrmin - 0.5,
                        dthrmax + 0.5);
  TH2F *h_sig = new TH2F("sig", NULL, 640, -0.5, 639.5, ndthr, dthrmin - 0.5,
                         dthrmax + 0.5);

  Stib *msg = new Stib(s, (struct sockaddr *)&daddr, sizeof(daddr));
  msg->Clear();
  msg->Write(STRIP_CSR, 0x00000300); //  Reset CSR, enable only channels 0,1
  //  msg->Write(STRIP_BCO_DCM,0x80500002);                //  Set numerator to
  //  6 msg->WaitClear(STRIP_BCO_DCM,0x80000000);            //  Wait DCM write
  //  to finish msg->Write(STRIP_BCO_DCM,0x80520004);                //  Set
  //  denominator to 4 msg->WaitClear(STRIP_BCO_DCM,0x80000000);            //
  //  Wait DCM write to finish msg->Write(STRIP_CSR,0x80000000|(chmask<<8));
  //  //  Reset the DCM  - this bit is not self-clearing.
  msg->Write(STRIP_CSR, 0x0a000000 | (chmask << 8));
  msg->WaitClear(STRIP_CSR, 0x80000000,
                 1024); //  Wait for the reset to complete.
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "Receive error after initial configuration." << endl;
  }

  msg->Clear();
  msg->Write(STRIP_RESET, 0xf000003f);     //  Issue reset
  msg->WaitClear(STRIP_RESET, 0xf0000000); //  Wait for reset to complete
  msg->SlowControls(21, chmask, DCR, WRITE, dcr);
  msg->Write(STRIP_SC_CSR, 0x90000b95 | (chmask << 16)); // scr set
  msg->WaitClear(STRIP_SC_CSR, 0x80000000);

  msg->Write(STRIP_DAC_SPI, 0x80000000 | (idac << 16));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  msg->Write(STRIP_DAC_SPI, 0x80000144 | (idac << 16));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  msg->Write(STRIP_DAC_SPI, 0x80000240 | (idac << 16));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  msg->Write(STRIP_DAC_INPUT, 0x00010000);   //  Don't forget to set the ramp...
  msg->Write(STRIP_DAC_CSR, 0x4080ff00);     //  Continuous pulses
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "Receive error after initial configuration." << endl;
  }

  for (int strip = first; strip <= last; strip++) {
    int ichip = strip / 128;
    int chipid = ichip + 9;
    msg->Clear();
    Stib::MaskBits(mask, SET);
    Stib::MaskBits(inject, CLEAR);
    msg->SlowControls(21, chmask, KILL, WRITE, mask);
    msg->SlowControls(21, chmask, INJECT, WRITE, inject);
    Stib::MaskBits(inject, SET, strip % 128);
    Stib::MaskBits(mask, CLEAR, strip % 128);
    msg->SlowControls(chipid, chmask, KILL, WRITE, mask);
    msg->SlowControls(chipid, chmask, INJECT, WRITE, inject);
    msg->Send();
    if ((ierr = msg->Receive()) < 0) {
      cout << "Receive error after kill/inject bits." << endl;
    }
    for (int dthr = dthrmin; dthr <= dthrmax; dthr++) {
      msg->Clear();
      TGraphErrors *g = new TGraphErrors();
      g->SetMarkerStyle(20 + dthr - dthrmin);
      int imin = 0;
      int imax = 900;
      int index = 0;
      const int n = 50;
      int delta = 20;
      double mu = 0;
      do {
        int vdac;
        if (index == 0) {
          vdac = imin;
        }
        dac_word = 0x00810000 | (((unsigned int)-vdac) & 0x0fff);
        cout << "Vdac = " << dec << vdac << " --> " << hex << dac_word << endl;
        msg->Clear();
        msg->Write(STRIP_DAC_INPUT, dac_word);
        msg->SlowControls(chipid, chmask, DTHR, WRITE,
                          dthr); //  Set discriminator threshold
        msg->Write(STRIP_ANALYSIS_CSR, 0x40000000); //  Clear analysis scalers
        msg->SlowControls(chipid, chmask, REJECT_HITS, RESET);
        msg->SlowControls(chipid, chmask, SEND_DATA, SET);
        msg->Write(STRIP_ANALYSIS_CSR, 0x0000a000 | (chan << 16) |
                                           (Stib::SetNumber(strip) << 4) |
                                           Stib::StripNumber(strip));
        msg->WaitSet(STRIP_ANALYSIS_CSR, 0x80000000, 10000000);
        unsigned char ind[2];
        ind[0] = msg->Read(STRIP_ANALYSIS_BCO_COUNTER);
        ind[1] = msg->Read(STRIP_ANALYSIS_BCO_COUNTER + 0x100 * (ichip + 1));
        msg->SlowControls(21, chmask, REJECT_HITS, SET);
        msg->SlowControls(21, chmask, SEND_DATA, RESET);
        msg->Send();
        if ((ierr = msg->Receive()) < 0) {
          cout << "Strip " << strip << ", vdac = " << vdac
               << " - receive error = " << ierr << endl;
        } else {
          unsigned int den = msg->RxData(ind[0], 1);
          cout << "Denominator = 0x" << hex << den << dec << endl;
          if (den == 0xffffffff)
            continue;
          unsigned int num = msg->RxData(ind[1], 1);
          cout << "Numerator = 0x" << hex << num << dec << endl;
          double frac = (double)num / den * 256;
          if (frac > 1)
            frac = 1;
          double efrac = sqrt(frac * (1 - frac) / (den / 256));
          if (efrac == 0)
            efrac = 0.001;
          cout << "Strip " << strip << ", vdac = " << vdac << ", frac = " << num
               << "/" << den << " = " << frac << endl;
          int npt = g->GetN();
          g->SetPoint(npt, vdac, frac);
          if (mu < 1 && frac > 0.5)
            mu = vdac;
          g->SetPointError(npt, 0, efrac);
        }
        vdac += delta;
        index += 1;
      } while (index < n);
      char label[16];
      sprintf(label, "fit_%d_%d", strip, dthr);
      TF1 *func = new TF1(label, ferf, 0, 1024, 3);
      func->SetLineColor(2);
      func->SetLineWidth(2);
      func->SetParameters(mu, 45.0, 0.01);
      g->Fit(func);
      h_mu->SetBinContent(strip + 1, dthr - dthrmin + 1, func->GetParameter(0));
      h_mu->SetBinError(strip + 1, dthr - dthrmin + 1, func->GetParError(0));
      h_sig->SetBinContent(strip + 1, dthr - dthrmin + 1,
                           func->GetParameter(1));
      h_sig->SetBinError(strip + 1, dthr - dthrmin + 1, func->GetParError(1));
      sprintf(label, "gth_%d_%d", strip, dthr);
      g->Write(label);
    }
  }

  msg->Clear();
  msg->Write(STRIP_DAC_CSR, 0x0000ff00); // Turn off the pulser
  msg->Write(STRIP_DAC_SPI, 0x8000001c | (idac << 16));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "Receive error after turning off pulser." << endl;
  }
  fout->Write();
  fout->Close();

  return 0;
}
