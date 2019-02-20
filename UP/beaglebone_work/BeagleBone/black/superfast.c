#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
//#include "beaglebone_gpio.h"

#define GPIO0_BASE 0x44E07000
#define GPIO1_BASE 0x4804C000
#define GPIO2_BASE 0x481AC000
#define GPIO3_BASE 0x481AE000

#define GPIO_SIZE 0x00000FFF

// OE: 0 is output, 1 is input
#define GPIO_OE 0x14d
#define GPIO_IN 0x14e
#define GPIO_OUT 0x14f

#define USR0_LED (1 << 21)
#define USR1_LED (1 << 22)
#define USR2_LED (1 << 23)
#define USR3_LED (1 << 24)
#define P8_11 (1 << 13)
#define P8_12 (1 << 12)
#define P8_13 (1 << 23)
#define P8_14 (1 << 26)

//             !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//             !!Right now the reading from a file method will use only gpio1!!
//             !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

int mem_fd;
char *gpio_mem0, *gpio_map0, *gpio_mem1, *gpio_map1;

// I/O access
volatile unsigned *gpio0;
volatile unsigned *gpio1;

static void io_setup(int num_ports, int ports[]) {
  // Enable all GPIO banks
  // Without this, access to deactivated banks (i.e. those with no clock source
  // set up) will (logically) fail with SIGBUS Idea taken from
  // https://groups.google.com/forum/#!msg/beagleboard/OYFp4EXawiI/Mq6s3sg14HoJ
  system("echo 5 > /sys/class/gpio/export");
  system("echo 65 > /sys/class/gpio/export");
  system("echo 105 > /sys/class/gpio/export");

  /* open /dev/mem */
  if ((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
    printf("can't open /dev/mem \n");
    exit(-1);
  }

  /* mmap GPIO */
  gpio_map0 = (char *)mmap(0, GPIO_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
                           mem_fd, GPIO0_BASE);

  gpio_map1 = (char *)mmap(0, GPIO_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
                           mem_fd, GPIO1_BASE);

  if (gpio_map0 == MAP_FAILED) {
    printf("mmap error %d\n", (int)gpio_map0);
    exit(-1);
  }

  if (gpio_map1 == MAP_FAILED) {
    printf("mmap error %d\n", (int)gpio_map1);
    exit(-1);
  }

  // Always use the volatile pointer!
  gpio0 = (volatile unsigned *)gpio_map0;
  gpio1 = (volatile unsigned *)gpio_map1;
  // Get direction control register contents
  unsigned int creg = *(gpio0 + GPIO_OE);

  // Set outputs and
  // Set new direction control register contents

  creg = *(gpio1 + GPIO_OE);
  int iter;
  for (iter = 0; iter < num_ports; iter++) {
    creg = creg & (~ports[iter]);
  }
  *(gpio1 + GPIO_OE) = creg;
}

int main(int argc, char **argv) {
  int n = 1;
  char little_endian = 0;
  // little endian if true
  if (*(char *)&n == 1) {
    little_endian = 1;
  }
  // this section reads data from file
  FILE *fp;
  fp = fopen("pindata.txt", "rb");
  char num_ports;
  int depth;
  // the first byte will be the number of ports
  fread(&num_ports, 1, 1, fp);
  // printf("%d\n",size);
  // the next group of data is the 32 bit port addresses
  int ports[num_ports];
  fread(ports, 4, num_ports, fp);
  // the next datum is the depth
  fread(&depth, 4, 1, fp);

  // reverse bytes if it is little endian
  if (little_endian == 1) {
    depth = (depth >> 24) | (depth >> 8 & 0x0000FF00) |
            (depth << 8 & 0x00FF0000) | (depth << 24);
    int q;
    for (q = 0; q < num_ports; q++) {
      int *this = &ports[q];
      *this = (*this >> 24) | (*this >> 8 & 0x0000FF00) |
              (*this << 8 & 0x00FF0000) | (*this << 24);
    }
  }
  printf("num ports %d\n", num_ports);
  printf("depth %x\n", depth);
  int test;
  for (test = 0; test < num_ports; test++) {
    printf("port num %d, port %x\n", test, ports[test]);
  }
  // the rest of the file is the pin data
  char data[depth];
  fread(data, 1, depth, fp);
  fclose(fp);

  io_setup(num_ports, ports);

  while (1) {
    int index = 0;
    while (index < depth) {
      int port = 0;
      unsigned int ons = 0;
      unsigned int offs = 0xffffffff;
      // go through every port and then update them all at once
      while (port < num_ports) {
        // printf("%d  ",index);
        if (data[index] == 49) { // if bit is the char "1"
          ons ^= ports[port];
          // printf("%u is on\n", ports[port]);
          port++;
        } else if (data[index] ==
                   48) { // if "0" this ignores all other
                         // characters like "\n" (which should not
                         // be there anyway)
          offs ^= ports[port];
          // printf("%u is off\n", ports[port]);
          port++;
        }
        index++; // increase index for every char but for port only if 0 or 1
      }
      // update the register
      int gpio_temp = *(gpio1 + GPIO_OUT);
      gpio_temp |= ons;
      gpio_temp &= offs;
      // now actually set pins
      *(gpio1 + GPIO_OUT) = gpio_temp;
    }

    /*
            // this way just osscilates
            // Set LEDs
    //    	*(gpio0 + GPIO_OUT) = *(gpio0 + GPIO_OUT) | P8_13 | P8_14;
            *(gpio1 + GPIO_OUT) = *(gpio1 + GPIO_OUT) | P8_11 | P8_12;
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) | USR0_LED;
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) | USR1_LED;
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) | USR2_LED;
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) | USR3_LED;
    //
    //        usleep(.05);

            // Clear LEDs
    //        *(gpio0 + GPIO_OUT) = *(gpio0 + GPIO_OUT) & (~P8_13) & (~P8_14);
            *(gpio1 + GPIO_OUT) = *(gpio1 + GPIO_OUT) & (~P8_11) & (~P8_12);
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) & (~USR0_LED);
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) & (~USR1_LED);
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) & (~USR2_LED);
    //        *(gpio + GPIO_OUT) = *(gpio + GPIO_OUT) & (~USR3_LED);

    //        usleep(.05);

    */
  }

  return 0;
}
