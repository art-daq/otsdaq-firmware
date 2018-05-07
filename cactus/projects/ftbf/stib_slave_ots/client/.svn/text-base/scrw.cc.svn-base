
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <netdb.h>
#include <time.h>
#include <sys/time.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>

#include "TROOT.h"
#include "TFile.h"
#include "TH2.h"

#include "stib.hh"

using namespace std;
using namespace stib;

int main(int argc,char **argv) {
  int ierr, i, s, strip;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;

  if ( argc < 4 ) {
    cerr << "Usage: " << argv[0] << " <addr> <first> <last>" << endl;
    exit(1);
  }
  if ( ( s = socket(PF_INET,SOCK_DGRAM,0) ) < 0 ) {
    fprintf( stderr, "%s : socket() - %s\n", argv[0], strerror(errno) );
    exit(1);
  }
  bzero((char *)&saddr,sizeof(saddr));
  saddr.sin_family = AF_INET;
  if ( bind(s,(struct sockaddr *)&saddr,sizeof(saddr)) < 0 ) {
    fprintf( stderr, "%s : bind() - %s\n", argv[0], strerror(errno) );
    exit(1);
  }
  namelen = sizeof(saddr);
  if ( getsockname(s,(struct sockaddr *)&saddr,&namelen) < 0 ) {
    fprintf( stderr, "%s : getsockname() - %s\n", argv[0], strerror(errno) );
    exit(1);
  }
  printf( "Source port = %d (0x%04x)\n", ntohs(saddr.sin_port), ntohs(saddr.sin_port) );

  if ( ( hp = gethostbyname(argv[1]) ) == NULL ) {
    fprintf( stderr, "%s : gethostbyname(%s) - %s\n",
             argv[0], argv[1], strerror(errno) );
    exit(1);
  }
  bcopy(hp->h_addr,&daddr.sin_addr,hp->h_length);
  daddr.sin_family = hp->h_addrtype;
  port = STIB_PORT;
  daddr.sin_port = htons(port);
  if ( (ntohl(daddr.sin_addr.s_addr)&0xff) == 0xff ) {
    broadcast_enable = 1;
    if ( setsockopt(s,SOL_SOCKET,SO_BROADCAST,&broadcast_enable,
                     sizeof(broadcast_enable)) < 0 ) {
      fprintf( stderr, "%s : setsockopt() - %s\n", argv[0], strerror(errno) );
      exit(1);
    }
    printf("Enabled broadcast.\n");
  }

  struct timeval timeout;
  timeout.tv_sec = 2;
  timeout.tv_usec = 0;
  if ( setsockopt(s,SOL_SOCKET,SO_RCVTIMEO,&timeout,sizeof(timeout)) < 0 ) {
    fprintf( stderr, "%s : setsockopt() - %s\n", argv[0], strerror(errno) );
    exit(1);
  }
 
  int first = atoi(argv[2]);
  int last = atoi(argv[3]);

  Stib *msg = new Stib(s,(struct sockaddr *)&daddr,sizeof(daddr));

  msg->Clear();
  msg->Write(STRIP_CSR,0x06160000);                    //  Configure spy FIFO's and BCO divisor
  msg->Write(STRIP_RESET,0x9000003f);                  //  Issue reset
  msg->WaitClear(STRIP_RESET,0xf0000000);              //  Wait for reset to complete
  msg->Write(STRIP_ANALYSIS_CSR,0x4000003f);           //  Clear analysis counters
  msg->Send();
  if ( ( ierr = msg->Receive() ) < 0 ) {
    cout << "Receive error..." << endl;
  }

  for ( int dvtn=first; dvtn<=last; dvtn++ ) {
    cout << "Writing " << dvtn << ", " << 255-dvtn << endl;
    msg->Clear();
    msg->SlowControls(21,0x04,DVTN,WRITE,dvtn);
    msg->SlowControls(21,0x04,DTHR7,WRITE,255-dvtn);
    int ind1 = msg->SlowControls(9,2,DVTN,READ);
    int ind2 = msg->SlowControls(13,2,DTHR7,READ);
    msg->Send();
    if ( ( ierr = msg->Receive() ) < 0 ) {
      cout << "Strip " << strip << ", dvtn = " << dvtn << " - receive error = " << ierr << endl;
      dvtn -= 1;
    }
    else {
      int rdvtn = msg->RxData(ind1,1)&0xff;
      int rdthr = msg->RxData(ind2,1)&0xff;
      cout << "Read " << rdvtn << ", " << rdthr << endl;
      if ( rdvtn != dvtn || rdthr != 255-dvtn ) {
        msg->Clear();
        int ind1 = msg->SlowControls(9,2,DVTN,READ);
        int ind2 = msg->SlowControls(13,2,DTHR7,READ);
        msg->Send();
        if ( ( ierr = msg->Receive() ) < 0 ) {
          cout << "Strip " << strip << ", dvtn = " << dvtn << " - receive error = " << ierr << endl;
          dvtn -= 1;
        }
        else {
          int rdvtn = msg->RxData(ind1,1)&0xff;
          int rdthr = msg->RxData(ind2,1)&0xff;
          cout << "Second read " << rdvtn << ", " << rdthr << endl;
        }
      }
    }
  }
  return 0;
}
