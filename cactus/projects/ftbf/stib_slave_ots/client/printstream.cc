
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

#include "stib.hh"

#define BUFLEN 1024

static unsigned char recvbuf[BUFLEN];

using namespace std;
using namespace stib;

int main(int argc,char **argv) {
  int ierr, i, s, strip, dlen;
  socklen_t namelen;
  int broadcast_enable;
  unsigned short port;
  struct sockaddr_in saddr, daddr;
  struct hostent *hp;
  unsigned char *p;
  unsigned int word;
  unsigned int mask[4];
  FILE *fout;

  uint64_t bco_counter = 0ULL;
  uint64_t last_bco = 0ULL;
  fout = NULL;

  if ( argc < 2 ) {
    cerr << "Usage: " << argv[0] << " <port>" << endl;
    exit(1);
  }
  if ( argc > 2 ) {
    fout = fopen(argv[2],"w");
  }
  if ( ( s = socket(PF_INET,SOCK_DGRAM,0) ) < 0 ) {
    fprintf( stderr, "%s : socket() - %s\n", argv[0], strerror(errno) );
    exit(1);
  }
  bzero((char *)&saddr,sizeof(saddr));
  saddr.sin_family = AF_INET;
  //saddr.sin_addr.s_addr = INADDR_ANY;
  port = atoi(argv[1]);
  saddr.sin_port = htons(port);

  if ( bind(s,(struct sockaddr *)&saddr,sizeof(saddr)) < 0 ) {
    fprintf( stderr, "%s : bind() - %s\n", argv[0], strerror(errno) );
    exit(1);
  }
  printf("Listening on port %d.\n", port );

  int nhit = 0;
  int lasthit = -1;
  while(1) 
  {
    dlen = sizeof(daddr);
    int len;
    cout << "Reading... " << endl;
    if ( ( len = recvfrom(s,recvbuf,BUFLEN,0,(struct sockaddr *)&daddr,(socklen_t *)&dlen) ) < 0 ) {
      fprintf( stderr, "%s : recvfrom() - %s\n", argv[0], strerror(errno) );
      exit(1);
    }
    if ( fout != NULL ) fwrite(recvbuf,sizeof(unsigned char),len,fout);
    for ( int i=0; i<len/4; i++ ) {
      word = ntohl(((unsigned int *)recvbuf)[i]);
      int type     = word&0x0f;
      int datatype = (word>>4)&0x0f;
      
      unsigned int data = word>>8;
      int chan   = (word>>27)&0x07;
      int chipid = (word>>24)&0x07;
      int set    = (word>>12)&0x1f;
      int strip  = (word>>17)&0x0f;
      int bco    = (word>>4 )&0xff;
      int adc    = (word>>1 )&0x7;
      int istrip = Stib::SensorStrip(chipid,set,strip);
      if ( type == 8 ) {
        if ( datatype == 2 ) {
          bco_counter &= 0x0000000000ffffffULL;
          bco_counter |= ((uint64_t)data)<<24;
          cout << "BCO = " << hex << bco_counter << dec << " (" << bco_counter-last_bco << ")" << endl;
          if ( bco_counter - last_bco > 256 ) {
            nhit = 0;
          }
        }
        if ( datatype == 1 ) {
          last_bco = bco_counter;
          bco_counter &= 0xffffffffff000000ULL;
          bco_counter |= (uint64_t)data;
        }
        if ( datatype <= 0x0f && datatype >= 0x0c ) {
          int trig0 = (word>>16)&0xff;
          int trig1 = (word>>24)&0xff;
          int bco = (word>>8)&0xff;
          cout << "Trigger word " << 15-datatype << " : ";
          for ( int k=7; k>=0; k-- ) {
            if ( (trig1&(1<<k)) ) {
              cout << "#";
            }
            else {
              cout << "_";
            }
          }
          cout << "  ";
          for ( int k=7; k>=0; k-- ) {
            if ( (trig0&(1<<k)) ) {
              cout << "#";
            }
            else {
              cout << "_";
            }
          }
          cout << "  " << hex << bco << dec << endl;
        }
        if ( datatype == 0x0a ) {
          int bco = (word>>8)&0xff;
          int trignum_low = word>>16;
          cout << "Trigger low = " << trignum_low << ", bco = " << hex << bco << dec << endl;
        }
        if ( datatype == 0x0b ) {
          int trignum_high = word>>8;
          cout << "Trigger high = " << trignum_high << endl;
        }
      }
      else if ( (type&1) == 1 ) {
        cout << "Channel: " << chan << " chipid: " << chipid << " set: " << set << " strip: " << strip << " adc: " << adc << " bco: " << hex << bco << dec << " istrip: " << istrip << endl;
        if ( chan > 6 || istrip > 639 ) {
          cout << "Bad word " << i << " = " << hex << word << dec << " = " << chan << "," << chipid << "," << set << "," << strip << " = " << istrip << endl; 
        }
        nhit += 1;
      }
    }
    cout << nhit << endl;
  }

  return 0;
}
