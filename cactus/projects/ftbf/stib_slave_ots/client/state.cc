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
  int broadcast_enable;
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
  int ind0 = msg->Read(STRIP_CSR);
  int ind1 = msg->Read(STRIP_STREAM_STATUS);
  int ind2 = msg->Read(GBE_STREAMPKT_CSR);
  int ind3 = msg->Read(STRIP_BCO_COUNTER_HIGH);
  int ind4 = msg->Read(STRIP_BCO_COUNTER_LOW);
  msg->Send();
  if ((ierr = msg->Receive()) < 0) {
    cout << "receive() - timeout." << endl;
    exit(1);
  }
  unsigned int strip_csr = msg->RxData(ind0, 1);
  unsigned int stream_status = msg->RxData(ind1, 1);
  unsigned int streampkt_csr = msg->RxData(ind2, 1);
  uint64_t bco_counter = ((uint64_t)msg->RxData(ind3, 1)) << 32;
  bco_counter |= (uint64_t)msg->RxData(ind4, 1);
  cout << "IP Address: " << inet_ntoa(daddr.sin_addr) << endl;
  cout << "  strip CSR = 0x" << hex << setfill('0') << setw(8) << strip_csr
       << dec << endl;
  int nchan = strip_csr & 0x07;
  cout << "    Number of channels = " << nchan << endl;
  for (int i = 0; i < nchan; i++) {
    cout << "    channels " << i << " : ";
    if ((strip_csr & (0x100 << i))) {
      cout << "enabled" << endl;
    } else {
      cout << "disabled" << endl;
    }
  }
  int ipkt = (strip_csr >> 3) & 0x1f;
  int nword = 16 * (ipkt + 1);
  cout << "    streaming packet size = " << nword << " words (" << nword * 4
       << " bytes)" << endl;
  cout << "    clock source : ";
  if ((strip_csr & 0x10000)) {
    cout << "external" << endl;
  } else {
    cout << "internal" << endl;
  }
  cout << "    halted : ";
  if ((strip_csr & 0x20000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "    BCO reset armed : ";
  if ((strip_csr & 0x80000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }

  cout << "    trigger veto : ";
  if ((strip_csr & 0x00800000)) {
    cout << "enabled" << endl;
  } else {
    cout << "disabled" << endl;
  }
  cout << "    streamed data :" << endl;
  cout << "         FSSR2 hits : ";
  if ((strip_csr & 0x08000000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "        BCO counter : ";
  if ((strip_csr & 0x04000000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "        Trig number : ";
  if ((strip_csr & 0x02000000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << " Trigger primitives : ";
  if ((strip_csr & 0x01000000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }

  cout << "     BCO DCM locked : ";
  if ((strip_csr & 0x40000000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << " readoutDCM locked : ";
  if ((strip_csr & 0x20000000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << " Reset status : ";
  if ((strip_csr & 0x80000000)) {
    cout << "in reset state" << endl;
  } else {
    cout << "ok" << endl;
  }
  cout << endl;

  cout << "  stream status = 0x" << hex << setfill('0') << setw(8)
       << stream_status << dec << endl;
  cout << "    write count = " << (stream_status & 0xff) << endl;
  cout << "     idle count = " << ((stream_status >> 8) & 0xff) << endl;
  cout << "      packet fifo empty : ";
  if ((stream_status & 0x00010000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "       packet fifo full : ";
  if ((stream_status & 0x00020000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "           stream ready : ";
  if ((stream_status & 0x00040000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "         packet strobe : ";
  if ((stream_status & 0x00080000)) {
    cout << "asserted" << endl;
  } else {
    cout << "not asserted" << endl;
  }
  cout << "     data fifo empty : ";
  if ((stream_status & 0x00100000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "      data fifo full : ";
  if ((stream_status & 0x00200000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "data fifo almost full : ";
  if ((stream_status & 0x00400000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "   ever stuffed : ";
  if ((stream_status & 0x00800000)) {
    cout << "yes" << endl;
  } else {
    cout << "no" << endl;
  }
  cout << "   state word = 0x" << setfill('0') << hex << setw(2)
       << (stream_status >> 24) << dec << endl;
  cout << endl;

  cout << "  streampkt CSR = 0x" << hex << setfill('0') << setw(8)
       << streampkt_csr << dec << endl;

  cout << endl;
  cout << "BCO = " << hex << bco_counter << dec << endl;

  return 0;
}
