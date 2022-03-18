
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
  int ierr, i, s, strip;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;

  if (argc < 3) {
    cerr << "Usage: " << argv[0] << " <addr> <idac>" << endl;
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
  timeout.tv_sec = 1;
  timeout.tv_usec = 0;
  if (setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) < 0) {
    fprintf(stderr, "%s : setsockopt() - %s\n", argv[0], strerror(errno));
    exit(1);
  }

  Stib *msg = new Stib(s, (struct sockaddr *)&daddr, sizeof(daddr));

  int idac = atoi(argv[2]);

  msg->Clear();
  msg->Write(STRIP_CSR, 0x0f000010);   //  Configure spy FIFO's and BCO divisor
  msg->Write(STRIP_RESET, 0x90000003); //  Issue reset
  msg->WaitClear(STRIP_RESET, 0xf8000000); //  Wait for reset to complete
  msg->Write(STRIP_RESET, 0x08000000);     //  Reset the DAC's
  msg->WaitClear(STRIP_RESET, 0xf8000000); //  Wait for reset to complete
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "Receive error..." << endl;
  }
  msg->Clear();
  msg->Write(STRIP_DAC_SPI, 0x80000000 | (1 << (idac + 16)));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  msg->Write(STRIP_DAC_SPI, 0x80000144 | (1 << (idac + 16)));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  msg->Write(STRIP_DAC_SPI, 0x80000240 | (1 << (idac + 16)));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  // msg->Write(STRIP_DAC_INPUT,0xff810700);            //  Positive pulse,
  // about 200 mV amplitude
  msg->Write(STRIP_DAC_INPUT,
             0x10900); //  Positive pulse, about 200 mV amplitude
  msg->Write(STRIP_DAC_CSR, 0x4000ff00); //  Continuous pulses
  // msg->Write(STRIP_DAC_INPUT,0x0);                 //  Stop the DACs
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "Receive error..." << endl;
  }
  msg->Clear();

  //
  //  Data comes out of the DAC on the next clock cycle...
  //
  int ind[12];
  cout << "IDAC: " << idac << endl;
  msg->Write(STRIP_DAC_SPI, 0x80008000 | (1 << (idac + 16)));
  msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
  for (int i = 0; i < 12; i++) {
    msg->Write(STRIP_DAC_SPI, 0x80008000 | ((i + 1) << 8) | (1 << (idac + 16)));
    msg->WaitClear(STRIP_DAC_SPI, 0x80000000); //  Wait for DAC SPI to finish
    ind[i] = msg->Read(STRIP_DAC_SPI);
  }
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "Receive error..." << endl;
  }
  for (int i = 0; i < 12; i++) {
    cout << "DAC " << idac << " addr " << i << " = 0x" << hex
         << (msg->RxData(ind[i], 1) & 0xff) << dec << endl;
  }
  msg->Send();

  return 0;
}
