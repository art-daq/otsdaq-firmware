#include <arpa/inet.h>
#include <errno.h>
#include <iomanip>
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
  int broadcast_enable = 0;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;
  unsigned int mask[4];

  if (argc < 2) {
    cerr << "Usage: " << argv[0] << " <addr>" << endl;
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

  Stib *msg = new Stib(s, (struct sockaddr *)&daddr, sizeof(daddr));
  msg->Clear();
  int ind1 = msg->Read(STRIP_CSR);
  int ind2 = msg->Read(STRIP_BCO_COUNTER);
  int ind3 = msg->Read(STRIP_BCO_COUNTER + 4);
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "Receive error..." << endl;
  }
  int strip_csr = msg->RxData(ind1, 1);
  cout << "strip_csr = 0x" << setfill('0') << hex << setw(8) << strip_csr << dec
       << endl;
  int bco_low = msg->RxData(ind2, 1);
  int bco_high = msg->RxData(ind3, 1);
  cout << "  BCO = 0x" << setfill('0') << hex << setw(8) << bco_high << setw(8)
       << bco_low << dec << endl;

  strip_csr |= 0x00080000;
  if (!broadcast_enable) {
    msg->Clear();
    msg->Write(STRIP_CSR, strip_csr);
    ind1 = msg->Read(STRIP_CSR);
    msg->Send();
    if ((ierr = msg->Receive()) < 0) {
      cout << "Receive error..." << endl;
    }
    strip_csr = msg->RxData(ind1, 1);
    if ((strip_csr & 0x00400000)) {
      cout << "[" << getpid() << "] No clock!" << endl;
    }
    while ((strip_csr & 0x00080000)) {
      cout << "[" << getpid() << "] Waiting..." << endl;
      sleep(1);
      msg->Clear();
      ind1 = msg->Read(STRIP_CSR);
      msg->Send();
      if ((ierr = msg->Receive()) < 0) {
        cout << "Receive error..." << endl;
      } else {
        strip_csr = msg->RxData(ind1, 1);
      }
    }
    msg->Clear();
    int chmask = (strip_csr >> 8) & 0xff;
    msg->Write(STRIP_SC_CSR, 0x90000b95 | (chmask << 16)); // scr set
    ind2 = msg->Read(STRIP_BCO_COUNTER);
    ind3 = msg->Read(STRIP_BCO_COUNTER + 4);
    msg->Send();
    if ((ierr = msg->Receive()) < 0) {
      cout << "Receive error..." << endl;
    }
    cout << "Done!" << endl;
    bco_low = msg->RxData(ind2, 1);
    bco_high = msg->RxData(ind3, 1);
    cout << "  BCO = 0x" << setfill('0') << hex << setw(8) << bco_high
         << setw(8) << bco_low << dec << endl;
    msg->Clear();
    msg->SlowControls(21, 0x3f, REJECT_HITS, RESET);
    msg->Send();
    if ((ierr = msg->Receive()) < 0) {
      cout << "Receive error..." << endl;
    } else {
      cout << "Readout started." << endl;
    }
  }
  return 0;
}
