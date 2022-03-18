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

#include "stib.hh"

using namespace std;
using namespace stib;

int main(int argc, char **argv) {
  int ierr, i, s;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;
  unsigned int mask[4];

  if (argc < 3) {
    cerr << "Usage: " << argv[0] << " <addr> <chan> [<chan> ...]" << endl;
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

  int chan[6] = {0, 0, 0, 0, 0, 0};
  int nchan = 0;
  for (int iarg = 2; iarg < argc; iarg++) {
    chan[nchan++] = atoi(argv[iarg]);
    if (chan[iarg - 2] < 0 || chan[iarg - 2] > 5) {
      cerr << argv[0] << ": invalid channel number." << endl;
      exit(1);
    }
  }

  unsigned char chmask = 0;
  cout << "Configuring channel";
  for (int i = 0; i < nchan; i++) {
    chmask |= 1 << chan[i];
    cout << " " << chan[i];
  }
  cout << " mask = " << hex << (int)chmask << dec << endl;

  Stib *msg = new Stib(s, (struct sockaddr *)&daddr, sizeof(daddr));
  msg->Clear();
  msg->Write(STRIP_CSR, 0x00000000 | (chmask << 8)); //  Reset CSR - reset
                                                     //  trigger counter,
                                                     //  internal clock source
  msg->Write(STRIP_TRIM_CSR, 0x00002000);    //  MCLKB edge for channel 5
  msg->Write(STRIP_BCO_DCM, 0x80500008);     //  Set BCOCLK numerator to 9
  msg->WaitClear(STRIP_BCO_DCM, 0x80000000); //  Wait DCM write to finish
  msg->Write(STRIP_BCO_DCM, 0x80520009);     //  Set BCOCLK denominator to 10
  msg->WaitClear(STRIP_BCO_DCM, 0x80000000); //  Wait DCM write to finish - BCO
                                             //  frequency is now 15.000 MHz.
  msg->Write(
      STRIP_CSR,
      0x80000000 |
          (chmask << 8)); //  Reset the DCM  - this bit is not self-clearing.
  msg->Write(STRIP_CSR, 0x00000000 | (chmask << 8));
  msg->WaitClear(STRIP_CSR, 0x80000000,
                 1024); //  Wait for the reset to complete.
  int ind = msg->Read(STRIP_CSR);
  msg->Write(DATA_DESTINATION_IP,
             0xc0a80166); //  Destination IP address 192.168.1.102
  msg->Write(DATA_SOURCE_DESTINATION_PORT,
             0xbeefb798); //  Source and destination ports - dst port = 47000
  msg->Write(0xc1000018, 0x0000b798); //  Listen port for ethio stuff

  msg->Write(STRIP_RESET, 0xf0000000 | chmask); //  Issue reset
  msg->WaitClear(STRIP_RESET, 0xf0000000);      //  Wait for reset to complete

  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "receive() - timeout." << endl;
    exit(1);
  }
  unsigned int strip_csr = msg->RxData(ind, 1);
  cout << "Strip CSR = 0x" << hex << strip_csr << dec << endl;

  //
  //  Set default registers...
  //
  msg->Clear();
  msg->Write(STRIP_CSR, 0x0f000000 | (chmask << 8)); // Why is this necessary?
  msg->SlowControls(21, chmask, DCR, WRITE,
                    16); // dcr write 16 - mod 256, high gain
  msg->Write(STRIP_SC_CSR, 0x90000b95 | (chmask << 16)); // scr set
  int offset = 40;
  int delta = 24;
  for (int i = 0; i < 8; i++) {
    msg->SlowControls(21, chmask, DTHR0 + i, WRITE, offset + i * delta);
  }
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "receive() - timeout." << endl;
    exit(1);
  }
  //  msg->PrintRx();

  //  Configure non-default registers...
  //
  msg->Clear();
  Stib::MaskBits(mask, CLEAR);
  Stib::MaskBits(mask, SET, 123);
  Stib::MaskBits(mask, SET, 124);
  msg->SlowControls(11, 1, KILL, WRITE, mask); // Hot strip
  cout << "Channel 0, chip 3: kill " << hex << mask[0] << " " << mask[1] << " "
       << mask[2] << " " << mask[3] << endl;

  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "receive() - timeout." << endl;
    exit(1);
  }

  //
  //  Enable readout...
  //
  msg->Clear();
  msg->Write(STRIP_TLK_CSR, 0x0c000001); //  Enable TLK serdes interface
  msg->Write(STRIP_CSR, 0x0f000000 | (chmask << 8)); //  Turn on data readout in
                                                     //  CSR but don't veto
                                                     //  untriggered events.
  msg->Write(STRIP_TRIG_CSR, 0x00000004);            //  BCO offset
  msg->Write(STRIP_TRIG_UNBIASED, 0x1002805c); //  Configure unbiased trigger
  msg->Write(STRIP_TRIG_INPUT_0,
             0x1f440000); //  FSSR2 GOTHIT trigger input channel 0
  msg->Write(STRIP_TRIG_INPUT_2,
             0x2f440000); //  FSSR2 GOTHIT trigger input channel 5
  msg->Write(STRIP_TRIG_INPUT_3,
             0x30301000);             //  External and unbiased trigger input
  msg->Write(0xc400006c, 0x80000010); //  Debug output

  msg->SlowControls(21, chmask, SEND_DATA, SET); //  sdata set
  msg->SlowControls(21, chmask, REJECT_HITS,
                    SET); //  reject set - needs to be enabled to start readout.
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "receive() - timeout." << endl;
    exit(1);
  }

  return 0;
}
