#include <iostream>
#include <stdio.h>

using namespace std;

int main() {

  unsigned int cs = 0;

  unsigned int vals[] = {0x3579, // id
                         0x4500, // vers/header
                         0x8011, // tts/protocol
                         0x001C, // header length

                         0xC0A8, // ip 192.168.133
                         0x8500, 0xC0A8, 0x8500};

  for (int i = 0; i < 4; ++i)
  // for(int i=0;i<8;++i) //if using the prefix ip
  {
    cs += vals[i];
    if ((cs >> 16) & 1)
      ++cs;
    cs &= 0xFFFF;
    printf("+ %4.4X = %4.4X\n", vals[i], cs);
  }

  return 0;
}
