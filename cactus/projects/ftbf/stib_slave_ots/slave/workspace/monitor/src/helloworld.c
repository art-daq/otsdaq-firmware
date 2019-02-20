/*
 * helloworld.c: simple test application
 */

#include "platform.h"
// #include "mb_interface.h"
#include "xbasic_types.h"
#include "xiomodule.h"

#define NULL 0

#define MAXLEN 64
#define MAXARG 8
#define MY_IP_ADDR 0xc0a80105
#define MY_NETMASK 0xffffff00
#define GW_IP_ADDR 0xc0a80166

#define N_SENSOR 6

int n_sensor = N_SENSOR;

//  Time taken by slow controls is
//  (# bits)*(BCOCLK period)/(BUSCLK period)*(fac) + overhead
#define TIMEOUT 1024

#define UART_SR (*(volatile unsigned char *)(0x80000008))
#define UART_RX (*(volatile unsigned char *)(0x80000000))
#define UART_TX (*(volatile unsigned char *)(0x80000004))

#define XIN_ISR                                                                \
  (*(volatile unsigned int *)0x80000030) /**< Intr Status Register      - R */
#define XIN_IPR                                                                \
  (*(volatile unsigned int *)0x80000034) /**< Intr Pending Register     - R */
#define XIN_IER                                                                \
  (*(volatile unsigned int *)0x80000038) /**< Intr Enable Register      - W */
#define XIN_IAR                                                                \
  (*(volatile unsigned int *)0x8000003C) /**< Intr Acknowledge Register - W */

#define INTC_INT_MASK 0x00010000

#define CAPTAN_CSR (*(volatile unsigned int *)(0xc0000000))
#define CAPTAN_IACK (*(volatile unsigned int *)(0xc1000040))

#define CAPTAN_GBE_CSR (*(volatile unsigned int *)(0xc1000000))
#define DHCP_BIT 0x00800000

#define CAPTAN_RX_FRAME_COUNTER (*(volatile unsigned int *)(0xc1000100))
#define CAPTAN_RX_ERROR_COUNTER (*(volatile unsigned int *)(0xc1000104))
#define CAPTAN_RX_VALID_COUNTER (*(volatile unsigned int *)(0xc1000108))
#define CAPTAN_RX_ARPREQ_COUNTER (*(volatile unsigned int *)(0xc100010c))
#define CAPTAN_RX_ARPREP_COUNTER (*(volatile unsigned int *)(0xc1000110))
#define CAPTAN_RX_IP_COUNTER (*(volatile unsigned int *)(0xc1000114))
#define CAPTAN_RX_IP_BADCKSUM_COUNTER (*(volatile unsigned int *)(0xc1000118))
#define CAPTAN_RX_ARPREQ_ADDR_COUNTER (*(volatile unsigned int *)(0xc100011c))
#define CAPTAN_RX_ICMPREQ_COUNTER (*(volatile unsigned int *)(0xc1000120))
#define CAPTAN_RX_ICMPREP_COUNTER (*(volatile unsigned int *)(0xc1000124))
#define CAPTAN_RX_UDP_COUNTER (*(volatile unsigned int *)(0xc100012c))

#define CAPTAN_FIFO_STATUS (*(volatile unsigned int *)(0xc1000004))
#define CAPTAN_RX_FIFO_DATA (*(volatile unsigned int *)(0xc1000010))
#define CAPTAN_TX_FIFO_DATA (*(volatile unsigned int *)(0xc1000014))
#define CAPTAN_IP_ADDR (*(volatile unsigned int *)(0xc1000020))
#define CAPTAN_NETMASK (*(volatile unsigned int *)(0xc1000024))
#define CAPTAN_GATEWAY (*(volatile unsigned int *)(0xc1000028))
// #define CAPTAN_HWADDR_HI 0x000000aa
// #define CAPTAN_HWADDR_LO 0xbbcc001f

#define CAPTAN_UDP_LISTEN_PORT (*(volatile unsigned int *)(0xc1000018))
#define CAPTAN_UDP_FIFO_DATA_B ((volatile unsigned int *)(0xc1000030))
#define CAPTAN_UDP_FIFO_DATA_A ((volatile unsigned int *)(0xc1000034))
#define CAPTAN_UDP_FIFO_DATA (*(volatile unsigned int *)(0xc1000034))
#define CAPTAN_UDP_PORTS (*(volatile unsigned int *)(0xc1000038))
#define CAPTAN_UDP_LENGTH (*(volatile unsigned int *)(0xc100003c))
#define CAPTAN_UDP_SADDR (*(volatile unsigned int *)(0xc1000040))

#define CAPTAN_ARP_CSR (*(volatile unsigned int *)(0xc1000044))
#define CAPTAN_ARP_TARGET_IP (*(volatile unsigned int *)(0xc1000048))
#define CAPTAN_ARP_TABLE_IP (*(volatile unsigned int *)(0xc100004c))
#define CAPTAN_ARP_TABLE_HA_LOW (*(volatile unsigned int *)(0xc1000050))
#define CAPTAN_ARP_TABLE_HA_HIGH (*(volatile unsigned int *)(0xc1000054))
#define CAPTAN_ARP_TABLE_REFCOUNT (*(volatile unsigned int *)(0xc1000058))

#define CAPTAN_SENDPKT_CSR (*(volatile unsigned int *)(0xc1000060))
#define CAPTAN_SENDPKT_DADDR (*(volatile unsigned int *)(0xc1000064))
#define CAPTAN_SENDPKT_PORTS (*(volatile unsigned int *)(0xc1000068))

#define CAPTAN_MAC_ADDRESS_HIGH (*(volatile unsigned int *)(0xc1000070))
#define CAPTAN_MAC_ADDRESS_LOW (*(volatile unsigned int *)(0xc1000074))

#define CAPTAN_DEBUG_FLAGS (*(volatile unsigned int *)(0xc1000090))
#define CAPTAN_DEBUG_ARPINPUT (*(volatile unsigned int *)(0xc1000094))
#define CAPTAN_DEBUG_ARPOUTPUT_LO (*(volatile unsigned int *)(0xc1000098))
#define CAPTAN_DEBUG_ARPOUTPUT_HI (*(volatile unsigned int *)(0xc100009c))

#define CAPTAN_CLOCK_CSR (*(volatile unsigned int *)(0xc2000000))
#define CAPTAN_CLOCK_TIME (*(volatile unsigned int *)(0xc2000004))

#define CAPTAN_STRIP_CSR (*(volatile unsigned int *)(0xc4000000))
#define CAPTAN_STRIP_RESET (*(volatile unsigned int *)(0xc4000004))
//
//  Slow controls command word is as follows:
//      bits 4..0 : chip address
//      bits 9..5 : register number
//    bits 12..10 : instruction
//    bits 15..13 : read back channel
//    bits 23..16 : sensor enable mask
//    bits 26..24 : data bit length (0,1,2,3,4)=(0,1,2,8,128)
//     bit 29..27 : unused
//         bit 30 : send raw bits
//         bit 31 : initiate slow control read/write
//
#define CAPTAN_STRIP_SC (*(volatile unsigned int *)(0xc4000008))
#define CAPTAN_STRIP_SCI0 (*(volatile unsigned int *)(0xc4000010))
#define CAPTAN_STRIP_SCI1 (*(volatile unsigned int *)(0xc4000014))
#define CAPTAN_STRIP_SCI2 (*(volatile unsigned int *)(0xc4000018))
#define CAPTAN_STRIP_SCI3 (*(volatile unsigned int *)(0xc400001c))
#define CAPTAN_STRIP_SCO0 (*(volatile unsigned int *)(0xc4000020))
#define CAPTAN_STRIP_SCO1 (*(volatile unsigned int *)(0xc4000024))
#define CAPTAN_STRIP_SCO2 (*(volatile unsigned int *)(0xc4000028))
#define CAPTAN_STRIP_SCO3 (*(volatile unsigned int *)(0xc4000028))
#define CAPTAN_STRIP_SCI ((volatile unsigned int *)(0xc4000010))
#define CAPTAN_STRIP_SCO ((volatile unsigned int *)(0xc4000020))
#define CAPTAN_STRIP_FIFO_CSR (*(volatile unsigned int *)(0xc4000030))
#define CAPTAN_STRIP_FIFO_DATA (*(volatile unsigned int *)(0xc4000034))
#define CAPTAN_STRIP_BCO_LOW (*(volatile unsigned int *)(0xc4000040))
#define CAPTAN_STRIP_BCO_HIGH (*(volatile unsigned int *)(0xc4000044))
#define CAPTAN_STRIP_BCOCLK (*(volatile unsigned int *)(0xc4000048))

#define CAPTAN_STRIP_LINK_STATUS(i, j)                                         \
  (*(volatile unsigned int *)(0xc4000030 + 0x100 * (j) + 0x1000 * (i)))

#define CAPTAN_DAC_SPI (*(volatile unsigned int *)(0xc4000058))
//
//  Bit fields are:
//         31 . . . . invoke the SPI sequence
//     19..16 . . . . DAC CS enable mask
//     15.. 8 . . . . Address
//      7.. 0 . . . . Data to shift out (write) or data shifted in (read)
//

#define CAPTAN_STRIP_DEBUG (*(volatile unsigned int *)(0xc400006c))
#define CAPTAN_STRIP_TRIG_CSR (*(volatile unsigned int *)(0xc4000060))
#define CAPTAN_STRIP_TRIG_DATA (*(volatile unsigned int *)(0xc4000064))
#define CAPTAN_STRIP_TRIGNUM_LOW (*(volatile unsigned int *)(0xc4000080))
#define CAPTAN_STRIP_TRIGNUM_HIGH (*(volatile unsigned int *)(0xc4000084))
#define CAPTAN_STRIP_BCOFREQ (*(volatile unsigned int *)(0xc400008c))
#define CAPTAN_STRIP_CMDCOUNT (*(volatile unsigned int *)(0xc4000090))
#define CAPTAN_STRIP_TRIGCOUNT (*(volatile unsigned int *)(0xc4000094))

#define LOG_ETHIO 0x04
#define LOG_NONE 0x08

#define ETHIO_NOP 0
#define ETHIO_WRITE 1
#define ETHIO_SET 2
#define ETHIO_RECV 3
#define ETHIO_READ 4
#define ETHIO_RESET 5
#define ETHIO_DEFAULT 6
#define ETHIO_WAITCLR 7
#define ETHIO_WAITSET 8

const char *title_line = "\r\nSlave STIB monitor rev 1.30\r\nBuilt ";

struct s_cmd {
  const char *cmd;
  unsigned int data;
  int (*func)(const struct s_cmd *);
};

unsigned int flags = 0;
volatile unsigned int nint = 0;

#define DAYLIGHT_TIME 0

#ifdef DAYLIGHT_TIME
static char *tzone = "EDT";
static int tzoff = -4 * 3600;
#else
static char *tzone = "EST";
static int tzoff = -5 * 3600;
#endif

unsigned char msglog = LOG_NONE;

unsigned char mask = 0xff;
unsigned int chipid = 0x15;
unsigned char readback = 0x00;

volatile unsigned int dhcp_myaddr = 0;
volatile unsigned int dhcp_saddr = 0;
volatile unsigned int dhcp_netmask = 0;
volatile unsigned int dhcp_router = 0;
volatile unsigned int dhcp_ntpaddr = 0;
char dhcp_hostid[16] = "(unknown)";
volatile unsigned int dhcp_done = 0;

static unsigned char set_number[] = {
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0,
    1,    4,    5,    3,    2,    0xff, 0xff, 12,   13,   8,    9,
    11,   10,   0xff, 0xff, 15,   14,   7,    6,    0xff, 0xff};
static unsigned char strip_number[] = {
    0xff, 0xff, 0xff, 0xff, 0xff, 0, 2, 1, 0xff, 6, 4, 5, 0xff, 7, 3, 0xff};

unsigned short _nextport() {
  static unsigned short next = 0;
  if (next == 0)
    next = 49152;
  return next++;
}

char _getch() {
  unsigned int pint = nint;
  while (!(UART_SR & 0x01)) {
    if (pint != nint)
      return 0;
  }
  return (UART_RX);
}

void _putch(char c) {
  while ((UART_SR & 0x08))
    ;
  UART_TX = c;
}

void _puts(const char *p) {
  while ((*p) != '\0')
    _putch(*p++);
}

void _print_time(unsigned int j) {
  unsigned int t = j + tzoff;
  int h = (t / 3600) % 24;
  int m = (t / 60) % 60;
  int s = t % 60;
  _putch('0' + h / 10);
  _putch('0' + (h % 10));
  _putch(':');
  _putch('0' + m / 10);
  _putch('0' + (m % 10));
  _putch(':');
  _putch('0' + s / 10);
  _putch('0' + (s % 10));
}

char *_gets(char *buf, int n) {
  char c, *p = buf;
  int i, m = n;
  *p = '\0';
  if (m == 0)
    return buf;
  do {
    c = _getch();
    if (c == 0) {
      if (!(msglog & LOG_NONE)) {
        _puts("\r\n$ ");
        if (*buf != '\0')
          _puts(buf);
      }
    } else if (c == 0x15) {
      for (i = m; i < n; i++) {
        _putch('\b');
      }
      for (i = m; i < n; i++) {
        _putch(' ');
      }
      for (i = m; i < n; i++) {
        _putch('\b');
      }
      m = n;
      p = buf;
    } else if (c == 0x08 || c == 0x7f) {
      if (m != n) {
        _putch('\b');
        _putch(' ');
        _putch('\b');
        m++;
        p--;
      }
    } else if (c == 0x03) {
      *buf = '\0';
    } else if (c == 0x04) {
      *buf++ = 0x04;
      *buf = '\0';
    } else if (c == '\r' || c == '\n') {
      *p = '\0';
    } else if (m > 1) {
      _putch(c);
      *p++ = c;
      *p = '\0';
      m--;
    }
  } while (c != '\r' && c != '\n' && c != 0x03);
  return buf;
}
int _isspace(char c) {
  return c == ' ' || c == '\f' || c == '\n' || c == '\r' || c == '\t' ||
         c == '\v';
}

void _print_hex_long(unsigned int w) {
  unsigned char i, n;
  for (i = 0; i < 8; i++) {
    n = (w >> 28) & 0x0f;
    if (n < 10) {
      _putch(n + '0');
    } else {
      _putch(n - 10 + 'a');
    }
    w <<= 4;
  }
}

void _print_hex_short(unsigned int w) {
  unsigned char i, n;
  for (i = 0; i < 4; i++) {
    n = (w >> 12) & 0x0f;
    if (n < 10) {
      _putch(n + '0');
    } else {
      _putch(n - 10 + 'a');
    }
    w <<= 4;
  }
}

void _print_hex_byte(unsigned char w) {
  int i;
  char c;
  for (i = 0; i < 2; i++) {
    c = (w >> ((1 - i) * 4)) & 0x0f;
    if (c < 10) {
      c += '0';
    } else {
      c += 'a' - 10;
    }
    _putch(c);
  }
}

void _print_int(unsigned int i) {
  int a, c = 1000000000;
  do {
    a = i / c;
    if (a == 0)
      c /= 10;
  } while (c != 0 && a == 0);
  if (c == 0) {
    _putch('0');
  } else {
    do {
      _putch(a + '0');
      i -= a * c;
      c /= 10;
      if (c > 0)
        a = i / c;
    } while (c > 0);
  }
}

void _print_float(float f) {
  int j;
  int i = (int)f;
  _print_int(i);
  _putch('.');
  for (j = 0; j < 3; j++) {
    f -= i;
    f *= 10;
    i = (int)f;
    _putch('0' + i);
  }
}

void _print_bits(unsigned int w, int i, int j) {
  while (i >= j) {
    if (((w >> i--) & 1)) {
      _putch('1');
    } else {
      _putch('0');
    }
  }
}

char *_token(char *line) {
  static char *p;
  char *q;

  if (line != NULL)
    p = line;
  while (*p != '\0' && _isspace(*p))
    p++;
  q = p;
  while (*p != '\0' && !_isspace(*p))
    p++;
  if (*p != '\0') {
    *p++ = '\0';
  }
  return *q != '\0' ? q : NULL;
}
int _strcmp(const char *a, const char *b) {
  const char *pa = a, *pb = b;
  while (*pa != '\0' && *pb != '\0' && *pa == *pb) {
    pa++;
    pb++;
  }
  if (*pa == *pb)
    return 0;
  if (*pa == '\0')
    return -1;
  if (*pb == '\0')
    return 1;
  return (*pa < *pb) ? -1 : 1;
}

char _tolower(char c) { return c >= 'A' && c <= 'Z' ? c - 'A' + 'a' : c; }
int _isdigit(char c) { return c >= '0' && c <= '9'; }
int _ishexdigit(char c) {
  char d = _tolower(c);
  return (d >= '0' && d <= '9') || (d >= 'a' && d <= 'f');
}

int _atoi(const char *p) {
  int i = 0, s = 1;
  if (*p == '-') {
    s = -1;
    p++;
  }
  while (_isdigit(*p) && *p != '\0') {
    i = 10 * i + (*p++ - '0');
  }
  return s * i;
}

unsigned int _atoh(const char *p) {
  int i = 0;
  while (_ishexdigit(*p) && *p != '\0') {
    i <<= 4;
    if (*p >= '0' && *p <= '9') {
      i |= *p - '0';
    } else {
      i |= _tolower(*p) - 'a' + 10;
    }
    p++;
  }
  return i;
}

void _print_ip_addr(unsigned int ip) {
  _print_int((ip >> 24) & 0xff);
  _putch('.');
  _print_int((ip >> 16) & 0xff);
  _putch('.');
  _print_int((ip >> 8) & 0xff);
  _putch('.');
  _print_int(ip & 0xff);
}

void _print_mac_addr(unsigned int high, unsigned int low) {
  _print_hex_byte((high >> 8) & 0xff);
  _putch(':');
  _print_hex_byte(high & 0xff);
  _putch(':');
  _print_hex_byte((low >> 24) & 0xff);
  _putch(':');
  _print_hex_byte((low >> 16) & 0xff);
  _putch(':');
  _print_hex_byte((low >> 8) & 0xff);
  _putch(':');
  _print_hex_byte(low & 0xff);
}

unsigned int _parse_ip(const char *p) {
  unsigned int ip = 0;
  int i;
  for (i = 0; i < 4; i++) {
    ip |= _atoi(p) << (8 * (3 - i));
    if (i < 3) {
      while (_isdigit(*p))
        p++;
      if (*p++ != '.') {
        return 0;
      }
    }
  }
  return ip;
}

char line[MAXLEN];
int narg;
const char *args[MAXARG];
const char *on = "on";
const char *off = "off";
const char *unkn = "unknown";

int cmd_peek(const struct s_cmd *c) {
  unsigned int addr, data;
  if (narg != 2)
    return 1;
  _puts("\r\n");
  addr = _atoh(args[1]);
  _print_hex_long(addr);
  _puts(" = ");
  data = *((volatile unsigned int *)addr);
  _print_hex_long(data);
  return 0;
}

int cmd_poke(const struct s_cmd *c) {
  unsigned int addr, data;
  if (narg != 3)
    return 1;
  _puts("\r\n");
  addr = _atoh(args[1]);
  _print_hex_long(addr);
  _puts(" = ");
  data = *((volatile unsigned int *)addr);
  _print_hex_long(data);
  _puts(" <-- ");
  data = _atoh(args[2]);
  _print_hex_long(data);
  *((volatile unsigned int *)addr) = data;
  return 0;
}

int cmd_rx(const struct s_cmd *c) {
  int ierr = 0;
  int addr = 0;
  if (narg == 1) {
    _puts("\r\nrx fifo status = ");
    _print_hex_long(CAPTAN_FIFO_STATUS);
    _puts("\r\nrx fifo contents:");
    while ((CAPTAN_FIFO_STATUS & 0x0004) && !(UART_SR & 0x01)) { // valid flag
      if ((addr & 0x0f) == 0) {
        _puts("\r\n0x");
        _print_hex_long(addr);
        _puts(" : ");
      }
      _print_hex_byte(CAPTAN_RX_FIFO_DATA);
      _puts(" ");
      addr += 1;
    }
    if ((UART_SR & 0x01)) {
      _getch();
    }
  }
  return ierr;
}

int cmd_ip(const struct s_cmd *c) {
  unsigned int ip, nm, gw;
  //
  //  This really should be fixed... the MAC address should be
  //  either defined in the VHDL, or provided as a configurable
  //  register that can be changed at run time.  Oh well...
  //
  if (narg == 1) {
    _puts("\r\nMAC address ");
    _print_mac_addr(CAPTAN_MAC_ADDRESS_HIGH, CAPTAN_MAC_ADDRESS_LOW);
    _puts("\r\nip addr ");
    _print_ip_addr(CAPTAN_IP_ADDR);
    _puts(" netmask ");
    _print_ip_addr(CAPTAN_NETMASK);
    _puts(" gw ");
    _print_ip_addr(CAPTAN_GATEWAY);
  } else if (narg == 4) {
    if ((ip = _parse_ip(args[1])) == 0)
      return 1;
    if ((nm = _parse_ip(args[2])) == 0)
      return 1;
    if ((gw = _parse_ip(args[3])) == 0)
      return 1;
    CAPTAN_IP_ADDR = ip;
    CAPTAN_NETMASK = nm;
    CAPTAN_GATEWAY = gw;
  } else {
    return 1;
  }
  return 0;
}

int cmd_tx(const struct s_cmd *c) {
  int ierr = 0;
  int addr = 0;
  if (narg == 1) {
    _puts("\r\ntx fifo status = ");
    _print_hex_long(CAPTAN_FIFO_STATUS);
    _puts("\r\ntx fifo contents:");
    while ((CAPTAN_FIFO_STATUS & 0x0040) && !(UART_SR & 0x01)) { // valid flag
      if ((addr & 0x0f) == 0) {
        _puts("\r\n0x");
        _print_hex_long(addr);
        _puts(" : ");
      }
      _print_hex_byte(CAPTAN_TX_FIFO_DATA);
      _puts(" ");
      addr += 1;
    }
    if ((UART_SR & 0x01)) {
      _getch();
    }
  }
  return ierr;
}

int cmd_udp(const struct s_cmd *c) {
  int ierr = 0;
  int addr = 0;
  if (narg == 1) {
    _puts("\r\nudp fifo status = ");
    _print_hex_long(CAPTAN_FIFO_STATUS);
    _puts("\r\ndst port = ");
    _print_int(CAPTAN_UDP_PORTS & 0xffff);
    _puts("\r\nsrc port = ");
    _print_int((CAPTAN_UDP_PORTS >> 16) & 0xffff);
    _puts("\r\nlength = ");
    _print_int(CAPTAN_UDP_LENGTH & 0xffff);
    _puts("\r\nudp fifo contents:");
    while ((CAPTAN_FIFO_STATUS & 0x4000)) { // valid flag
      if ((addr & 0x0f) == 0) {
        _puts("\r\n0x");
        _print_hex_long(addr);
        _puts(" : ");
      }
      _print_hex_byte(CAPTAN_UDP_FIFO_DATA);
      _puts(" ");
      addr += 1;
    }
  }
  return ierr;
}

int cmd_arp(const struct s_cmd *c) {
  unsigned int ip;
  unsigned int csr;
  int i;
  if (narg == 2) {
    ip = _parse_ip(args[1]);
    if (ip == 0)
      return 1;
    CAPTAN_ARP_TARGET_IP = ip;
    CAPTAN_ARP_CSR |= 0x80000000;
    CAPTAN_ARP_CSR &= ~0x80000000;
  } else {
    _puts("\r\narp csr = ");
    csr = CAPTAN_ARP_CSR;
    _print_hex_long(csr);
    for (i = 0; i < ((csr >> 8) & 0xff); i++) {
      CAPTAN_ARP_CSR = i;
      _puts("\r\n");
      _print_int(i);
      _puts("   ");
      _print_ip_addr(CAPTAN_ARP_TABLE_IP);
      _puts("   ");
      _print_mac_addr(CAPTAN_ARP_TABLE_HA_HIGH, CAPTAN_ARP_TABLE_HA_LOW);
      _puts("   ");
      _print_int(CAPTAN_ARP_TABLE_REFCOUNT);
    }
  }
  return 0;
}

int cmd_stat(const struct s_cmd *c) {
  if (narg == 1) {
    _puts("\r\nrx frame counter = ");
    _print_int(CAPTAN_RX_FRAME_COUNTER);
    _puts("\r\nrx error counter = ");
    _print_int(CAPTAN_RX_ERROR_COUNTER);
    _puts("\r\nrx valid counter = ");
    _print_int(CAPTAN_RX_VALID_COUNTER);
    _puts("\r\narp request = ");
    _print_int(CAPTAN_RX_ARPREQ_COUNTER);
    _puts("\r\nmatched arp request = ");
    _print_int(CAPTAN_RX_ARPREQ_ADDR_COUNTER);
    _puts("\r\narp reply = ");
    _print_int(CAPTAN_RX_ARPREP_COUNTER);
    _puts("\r\nrx ip counter = ");
    _print_int(CAPTAN_RX_IP_COUNTER);
    _puts("\r\nrx bad ip header cksum counter = ");
    _print_int(CAPTAN_RX_IP_BADCKSUM_COUNTER);
    _puts("\r\nrx icmpreq counter = ");
    _print_int(CAPTAN_RX_ICMPREQ_COUNTER);
    _puts("\r\nrx icmprep counter = ");
    _print_int(CAPTAN_RX_ICMPREP_COUNTER);
    _puts("\r\nrx udp counter = ");
    _print_int(CAPTAN_RX_UDP_COUNTER);
    _puts("\r\nInterrupt counter = ");
    _print_int(nint);
  }
  return 0;
}

int cmd_eint(const struct s_cmd *c) {
  XIN_IER |= INTC_INT_MASK;
  microblaze_enable_interrupts();
  return 0;
}

int cmd_dint(const struct s_cmd *c) {
  microblaze_disable_interrupts();
  XIN_IER &= ~INTC_INT_MASK;
  return 0;
}

int cmd_send(const struct s_cmd *c) {
  unsigned int daddr;
  unsigned short dport;
  unsigned short sport = 0xbeef; //  Just a random number
  const int len = 32;
  int i;

  daddr = _parse_ip(args[1]);
  if (daddr == 0)
    return 1;
  dport = _atoi(args[2]);
  if (dport == 0)
    return 1;
  CAPTAN_SENDPKT_DADDR = daddr;
  CAPTAN_SENDPKT_PORTS = (sport << 16) | dport;
  CAPTAN_SENDPKT_CSR = 0x20000000; //  Assert clear
  CAPTAN_SENDPKT_CSR =
      0x00000000; //  We need a few clock cycles to let the clear propagate
  CAPTAN_SENDPKT_CSR = 0x00000000;
  CAPTAN_SENDPKT_CSR = 0x00000000;
  for (i = 0; i < len; i++) {
    CAPTAN_SENDPKT_CSR = 0x40000000 + 'A' + i;
  }
  CAPTAN_SENDPKT_CSR = 0x80000000; //  Assert strobe
  CAPTAN_SENDPKT_CSR = 0x00000000; //  Deassert strobe
  return 0;
}

void send_ntp(unsigned int daddr) {
  unsigned short sport;
  const unsigned short dport = 123;
  const int len = 48;
  unsigned char b;
  int i;

  sport = _nextport();
  CAPTAN_SENDPKT_DADDR = daddr;
  CAPTAN_SENDPKT_PORTS = (sport << 16) | dport;
  CAPTAN_SENDPKT_CSR = 0x20000000; //  Assert clear
  CAPTAN_SENDPKT_CSR =
      0x00000000; //  We need a few clock cycles to let the clear propagate
  CAPTAN_SENDPKT_CSR = 0x00000000;
  CAPTAN_SENDPKT_CSR = 0x00000000;
  for (i = 0; i < len; i++) {
    b = (i == 0) ? 010 : 0;
    CAPTAN_SENDPKT_CSR = 0x40000000 + b;
  }
  CAPTAN_SENDPKT_CSR = 0x80000000; //  Assert strobe
  CAPTAN_SENDPKT_CSR = 0x00000000; //  Deassert strobe
}

int cmd_ntp(const struct s_cmd *c) {
  unsigned int daddr = _parse_ip(args[1]);
  if (daddr == 0)
    return 1;
  send_ntp(daddr);
  return 0;
}

int cmd_time(const struct s_cmd *c) {
  _puts("\r\n");
  _print_time(CAPTAN_CLOCK_TIME);
  _putch(' ');
  _puts(tzone);
  return 0;
}

int cmd_state(const struct s_cmd *c) {
  unsigned int flags = CAPTAN_DEBUG_FLAGS;
  _puts("\r\nip address = ");
  _print_ip_addr(CAPTAN_IP_ADDR);
  _puts("\r\nnetmask = ");
  _print_ip_addr(CAPTAN_NETMASK);
  _puts("\r\ngateway = ");
  _print_ip_addr(CAPTAN_GATEWAY);
  _puts("\r\narp table input = ");
  _print_ip_addr(CAPTAN_DEBUG_ARPINPUT);
  _puts(" --> ");
  _print_mac_addr(CAPTAN_DEBUG_ARPOUTPUT_HI, CAPTAN_DEBUG_ARPOUTPUT_LO);
  _puts("\r\narp key = ");
  CAPTAN_ARP_CSR = 4;
  _print_ip_addr(CAPTAN_ARP_TABLE_IP);
  _puts(" --> ");
  _print_mac_addr(CAPTAN_ARP_TABLE_HA_HIGH, CAPTAN_ARP_TABLE_HA_LOW);

  _puts("\r\nflags = ");
  _print_hex_long(flags);
  _puts("\r\n  aprtab_state = ");
  _print_hex_byte((flags >> 24) & 0xff);
  _puts("\r\n  arptab_broadcast = ");
  _print_bits(flags, 20, 20);
  _puts("\r\n  arptab_found = ");
  _print_bits(flags, 19, 19);
  _puts("\r\n  arptab_missing = ");
  _print_bits(flags, 18, 18);
  _puts("\r\n  arptab_read_strobe = ");
  _print_bits(flags, 17, 17);
  _puts("\r\n  arptab_write_strobe = ");
  _print_bits(flags, 16, 16);
  _puts("\r\n  arptab_request_strobe = ");
  _print_bits(flags, 15, 15);
  _puts("\r\n  arptab_reply_strobe = ");
  _print_bits(flags, 14, 14);
  _puts("\r\n  sendpkt_strobe = ");
  _print_bits(flags, 13, 13);
  _puts("\r\n  ip_header_sel = ");
  _print_bits(flags, 12, 12);
  _puts("\r\n  ethernet_sel = ");
  _print_bits(flags, 11, 11);
  _puts("\r\n  crc_sel = ");
  _print_bits(flags, 10, 10);
  _puts("\r\n  eth_tx_sel = ");
  _print_bits(flags, 9, 7);
  _puts("\r\n  eth_tx_request = ");
  _print_bits(flags, 6, 0);

  return 0;
}

static struct s_dhcp {
  unsigned char op;
  unsigned char htype;
  unsigned char hlen;
  unsigned char hops;
  unsigned char xid[4];
  unsigned char secs[2];
  unsigned char flags[2];
  unsigned char ciaddr[4];
  unsigned char yiaddr[4];
  unsigned char siaddr[4];
  unsigned char giaddr[4];
  unsigned char chaddr[16];
} dhcp = {0x01,
          0x01,
          0x06,
          0x00,
          {0x39, 0x03, 0xf3, 0x26},
          {0, 0},
          {0, 0},
          {0, 0, 0, 0},
          {0, 0, 0, 0},
          {0, 0, 0, 0},
          {0, 0, 0, 0},
          {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}};
const unsigned short dhcp_sport = 68;
const unsigned short dhcp_dport = 67;

int send_dhcp_request() {
  static struct s_dhcpdisc {
    unsigned char magic_cookie[4];
    unsigned char opt53[2];
    unsigned char discover[2];
    unsigned char opt54[2];
    unsigned char req[10];
    unsigned char fin;
  } dhcp_disc_opt = {{0x63, 0x82, 0x53, 0x63},
                     {53, 1},
                     {1, 0},
                     {54, 7},
                     {1, 28, 3, 15, 61, 42, 26, 0, 0, 0},
                     0xff};

  int i;
  unsigned int prev_ip_addr = CAPTAN_IP_ADDR;
  CAPTAN_SENDPKT_DADDR = 0xffffffff;
  CAPTAN_IP_ADDR = 0;
  CAPTAN_SENDPKT_PORTS = (dhcp_sport << 16) | dhcp_dport;

  CAPTAN_SENDPKT_CSR = 0x20000000; //  Assert clear
  CAPTAN_SENDPKT_CSR =
      0x00000000; //  We need a few clock cycles to let the clear propagate
  CAPTAN_SENDPKT_CSR = 0x00000000;
  CAPTAN_SENDPKT_CSR = 0x00000000;

  *((unsigned char *)dhcp.siaddr) = 0;
  dhcp.chaddr[0] = (CAPTAN_MAC_ADDRESS_HIGH >> 8) & 0xff;
  dhcp.chaddr[1] = CAPTAN_MAC_ADDRESS_HIGH & 0xff;
  dhcp.chaddr[2] = (CAPTAN_MAC_ADDRESS_LOW >> 24) & 0xff;
  dhcp.chaddr[3] = (CAPTAN_MAC_ADDRESS_LOW >> 16) & 0xff;
  dhcp.chaddr[4] = (CAPTAN_MAC_ADDRESS_LOW >> 8) & 0xff;
  dhcp.chaddr[5] = CAPTAN_MAC_ADDRESS_LOW & 0xff;

  for (i = 0; i < 40; i++) {
    CAPTAN_SENDPKT_CSR = 0x40000000 + ((unsigned char *)&dhcp)[i];
  }
  for (i = 0; i < 196; i++)
    CAPTAN_SENDPKT_CSR = 0x40000000;
  for (i = 0; i < 21; i++) {
    CAPTAN_SENDPKT_CSR = 0x40000000 + ((unsigned char *)&dhcp_disc_opt)[i];
  }
  CAPTAN_SENDPKT_CSR = 0x80000000; //  Assert strobe
  CAPTAN_SENDPKT_CSR = 0x00000000; //  Deassert strobe

  for (i = 0; i < 10000; i++)
    ; // Keep the ip address asserted for a while
  CAPTAN_IP_ADDR = prev_ip_addr;

  return 0;
}

int dhcp_request(unsigned int addr, unsigned int req) {
  static struct s_dhcpreq {
    unsigned char magic_cookie[4];
    unsigned char opt53[2];
    unsigned char request[2];
    unsigned char opt54[2];
    unsigned char saddr[4];
    unsigned char opt50[2];
    unsigned char myaddr[4];
    unsigned char opt55[2];
    unsigned char req[10];
    unsigned char fin;
  } dhcp_req_opt = {{0x63, 0x82, 0x53, 0x63},
                    {53, 1},
                    {3, 0},
                    {54, 4},
                    {0, 0, 0, 0},
                    {50, 4},
                    {0, 0, 0, 0},
                    {54, 7},
                    {1, 28, 3, 15, 61, 42, 26, 0, 0, 0},
                    0xff};

  int i;
  unsigned int prev_ip_addr = CAPTAN_IP_ADDR;
  CAPTAN_SENDPKT_DADDR = 0xffffffff;
  CAPTAN_IP_ADDR = 0;
  CAPTAN_SENDPKT_PORTS = (dhcp_sport << 16) | dhcp_dport;

  CAPTAN_SENDPKT_CSR = 0x20000000; //  Assert clear
  dhcp.siaddr[0] = (addr >> 24) & 0xff;
  dhcp.siaddr[1] = (addr >> 16) & 0xff;
  dhcp.siaddr[2] = (addr >> 8) & 0xff;
  dhcp.siaddr[3] = addr & 0xff;
  dhcp.chaddr[0] = (CAPTAN_MAC_ADDRESS_HIGH >> 8) & 0xff;
  dhcp.chaddr[1] = CAPTAN_MAC_ADDRESS_HIGH & 0xff;
  dhcp.chaddr[2] = (CAPTAN_MAC_ADDRESS_LOW >> 24) & 0xff;
  dhcp.chaddr[3] = (CAPTAN_MAC_ADDRESS_LOW >> 16) & 0xff;
  dhcp.chaddr[4] = (CAPTAN_MAC_ADDRESS_LOW >> 8) & 0xff;
  dhcp.chaddr[5] = CAPTAN_MAC_ADDRESS_LOW & 0xff;

  dhcp_req_opt.saddr[0] = (addr >> 24) & 0xff;
  dhcp_req_opt.saddr[1] = (addr >> 16) & 0xff;
  dhcp_req_opt.saddr[2] = (addr >> 8) & 0xff;
  dhcp_req_opt.saddr[3] = addr & 0xff;
  dhcp_req_opt.myaddr[0] = (req >> 24) & 0xff;
  dhcp_req_opt.myaddr[1] = (req >> 16) & 0xff;
  dhcp_req_opt.myaddr[2] = (req >> 8) & 0xff;
  dhcp_req_opt.myaddr[3] = req & 0xff;

  for (i = 0; i < 40; i++) {
    CAPTAN_SENDPKT_CSR = 0x40000000 + ((unsigned char *)&dhcp)[i];
  }
  for (i = 0; i < 196; i++)
    CAPTAN_SENDPKT_CSR = 0x40000000;
  for (i = 0; i < 33; i++) {
    CAPTAN_SENDPKT_CSR = 0x40000000 + ((unsigned char *)&dhcp_req_opt)[i];
  }
  CAPTAN_SENDPKT_CSR = 0x80000000; //  Assert strobe
  CAPTAN_SENDPKT_CSR = 0x00000000; //  Deassert strobe

  for (i = 0; i < 10000; i++)
    ; // Keep the ip address asserted for a while
  CAPTAN_IP_ADDR = prev_ip_addr;
  return 0;
}

int dhcp_ack(unsigned int myaddr) {
  int i, n;
  unsigned char b;
  unsigned int t;

  dhcp_myaddr = myaddr;
  while ((b = CAPTAN_UDP_FIFO_DATA & 0xff) != 0xff) {
    switch (b) {
    case 0:
      break;
    case 54:
      n = CAPTAN_UDP_FIFO_DATA & 0xff;
      for (i = 0; i < n; i++) {
        b = CAPTAN_UDP_FIFO_DATA & 0xff;
        t = (t << 8) | b;
      }
      dhcp_saddr = t;
      break;
    case 1:
      n = CAPTAN_UDP_FIFO_DATA & 0xff;
      for (i = 0; i < n; i++) {
        b = CAPTAN_UDP_FIFO_DATA & 0xff;
        t = (t << 8) | b;
      }
      dhcp_netmask = t;
      break;
    case 3:
      n = CAPTAN_UDP_FIFO_DATA & 0xff;
      for (i = 0; i < n; i++) {
        b = CAPTAN_UDP_FIFO_DATA & 0xff;
        t = (t << 8) | b;
      }
      dhcp_router = t;
      break;
    case 42:
      n = CAPTAN_UDP_FIFO_DATA & 0xff;
      for (i = 0; i < n; i++) {
        b = CAPTAN_UDP_FIFO_DATA & 0xff;
        t = (t << 8) | b;
      }
      dhcp_ntpaddr = t;
      break;
    case 61:
      n = CAPTAN_UDP_FIFO_DATA & 0xff;
      b = CAPTAN_UDP_FIFO_DATA & 0xff;
      for (i = 0; i < n; i++) {
        b = CAPTAN_UDP_FIFO_DATA & 0xff;
        if (i < 15)
          dhcp_hostid[i] = b;
      }
      dhcp_hostid[i < 15 ? i : 15] = '\0';
      break;
    default:
      n = CAPTAN_UDP_FIFO_DATA & 0xff;
      for (i = 0; i < n; i++) {
        b = CAPTAN_UDP_FIFO_DATA & 0xff;
      }
    }
  }
  _puts("\r\nhost id = '");
  _puts(dhcp_hostid);
  _puts("'");
  _puts("\r\nserver ip = ");
  _print_ip_addr(dhcp_saddr);
  _puts("\r\nmy ip = ");
  _print_ip_addr(dhcp_myaddr);
  _puts("\r\nntp server ip = ");
  _print_ip_addr(dhcp_ntpaddr);
  _puts("\r\nnetmask = ");
  _print_ip_addr(dhcp_netmask);
  _puts("\r\nrouter = ");
  _print_ip_addr(dhcp_router);
  dhcp_done = 1;
  return 0;
}

int cmd_dhcp(const struct s_cmd *c) { return send_dhcp_request(); }

int cmd_reset(const struct s_cmd *c) {
  unsigned int mask = 0;
  int i;
  if (narg < 2)
    return 1;
  for (i = 1; i < narg; i++) {
    if (_strcmp(args[i], "phy") == 0) {
      mask |= 0x80000000;
    }
    if (_strcmp(args[i], "gbe") == 0) {
      mask |= 0x40000000;
    }
  }
  _puts("\r\nReset mask = ");
  _print_hex_long(mask);
  CAPTAN_GBE_CSR |= mask;
  CAPTAN_GBE_CSR &= ~0xc0000000;
  return 0;
}

int cmd_focus(const struct s_cmd *c) {
  if (narg == 1) {
    _puts("\r\n  Sensor=0x");
    _print_hex_byte(mask);
    _puts(",  ChipId=");
    _print_int(chipid);
    _puts(",  Readback=");
    _print_int(readback);
  } else if (narg == 4) {
    if (*args[1] == '*') {
      mask = (1 << n_sensor) - 1;
    } else {
      mask = _atoi(args[1]);
    }
    if (*args[2] == '*') {
      chipid = 0x15;
    } else {
      chipid = _atoi(args[2]);
    }
    readback = _atoi(args[3]);
  } else {
    _puts("\r\nfocus <mask> <chipid> <readback>");
  }
  return 0;
}

int cmd_scraw(const struct s_cmd *c) {
  unsigned int w[4];
  const char *p;
  int i, ibit, iword;

  if (narg != 2)
    return -1;
  for (i = 0; i < 4; i++)
    w[i] = 0;
  p = args[1];
  i = 0;
  while (*p != '\0') {
    ibit = i % 32;
    iword = i / 32;
    if (*p == '0') {
      w[iword] &= ~(1 << ibit);
    } else if (*p == '1') {
      w[iword] |= (1 << ibit);
    } else if (*p == ',') {
      p += 1;
      continue;
    } else {
      return -1;
    }
    i += 1;
    p += 1;
  }
  CAPTAN_STRIP_SCI[0] = w[0];
  CAPTAN_STRIP_SCI[1] = w[1];
  CAPTAN_STRIP_SCI[2] = w[2];
  CAPTAN_STRIP_SCI[3] = w[3];
  CAPTAN_STRIP_SC = 0xc0010000 | i;
  return 0;
}

int cmd_bco(const struct s_cmd *c) {
  int ierr = 1;
  if (narg == 1) {
    _puts("\r\n BCO = ");
    _print_hex_long(CAPTAN_STRIP_BCO_HIGH);
    _print_hex_long(CAPTAN_STRIP_BCO_LOW);
    ierr = 0;
  } else if (narg == 2) {
    if (_strcmp(args[1], "clear") == 0) {
      CAPTAN_STRIP_CSR |= 0x00400000;
      CAPTAN_STRIP_CSR &= ~0x00400000;
      ierr = 0;
    }
  }
  return ierr;
}

int cmd_bcoclk(const struct s_cmd *c) {
  int i, ierr = 1;
  unsigned char n, d;
  int t;
  float f;
  const char *p;
  if (narg == 1) {
    ierr = 0;
    CAPTAN_STRIP_BCOCLK = 0x00500000;
    n = ((CAPTAN_STRIP_BCOCLK)&0x1f) + 1;
    CAPTAN_STRIP_BCOCLK = 0x00520000;
    d = ((CAPTAN_STRIP_BCOCLK)&0x1f) + 1;
    if ((CAPTAN_STRIP_CSR & 0x00010000)) {
      //      t = 25;       //  This is for a 40 MHz external clock
      t = 37; //  This is for a 27 MHz accelerator clock
      _puts("\r\nExternal");
    } else {
      t = 15;
      _puts("\r\nInternal");
    }
    _puts(" T=");
    _print_int(t);
    _puts(" ns, f=");
    f = 1000.0 / t;
    _print_float(f);
    _puts(" MHz nominal\r\nBCOCLK = f*");
    _print_int(n);
    _puts("/");
    _print_int(d);
    _puts("/4 = ");
    f = 250.0 * n / (t * d);
    _print_float(f);
    _puts(" MHz expected, ");
    f = CAPTAN_STRIP_BCOFREQ * 0.000001;
    _print_float(f);
    _puts(" MHz measured -");
    if (!(CAPTAN_STRIP_CSR & 0x20000000))
      _puts(" not");
    _puts(" locked");
  } else if (narg > 1) {
    for (i = 1; i < narg; i++) {
      if (_strcmp(args[i], "reset") == 0) {
        CAPTAN_STRIP_CSR |= 0x80000000;
        for (i = 0; i < 1000; i++)
          ;
        CAPTAN_STRIP_CSR &= ~0x80000000;
        continue;
      } else if (_strcmp(args[i], "int") == 0) {
        CAPTAN_STRIP_CSR &= ~0x00010000;
        continue;
      } else if (_strcmp(args[i], "ext") == 0) {
        CAPTAN_STRIP_CSR |= 0x00010000;
        continue;
      } else if (_strcmp(args[i], "slow") == 0) {
        CAPTAN_STRIP_CSR &= ~0x00020000;
        continue;
      } else if (_strcmp(args[i], "fast") == 0) {
        CAPTAN_STRIP_CSR |= 0x00020000;
        continue;
      } else if (_isdigit(*args[i])) {
        n = _atoi(args[i]);
        p = args[i];
        while (*p != '\0' && _isdigit(*p))
          p++;
        if (*p == '/') {
          p++;
          if (_isdigit(*p)) {
            d = _atoi(p);
            CAPTAN_STRIP_BCOCLK = 0x80500000 | (n - 1);
            while ((CAPTAN_STRIP_BCOCLK & 0x80000000))
              ;
            CAPTAN_STRIP_BCOCLK = 0x80520000 | (d - 1);
            while ((CAPTAN_STRIP_BCOCLK & 0x80000000))
              ;
            continue;
          } else {
            return ierr;
          }
        } else {
          return ierr;
        }
      } else {
        return ierr;
      }
    }
    ierr = 0;
  }
  return ierr;
}

int cmd_log(const struct s_cmd *c) {
  int onoff;
  if (narg == 1) {
    _puts("\r\nlog level = ");
    _print_bits(msglog, 7, 0);
  } else if (narg == 3) {
    if (_strcmp(args[2], "on") == 0) {
      onoff = 1;
    } else if (_strcmp(args[2], "off") == 0) {
      onoff = 0;
    } else if (_strcmp(args[2], "none") == 0) {
      onoff = 2;
    } else {
      return 1;
    }
    if (_strcmp(args[1], "ethio") == 0) {
      if (onoff == 1) {
        msglog |= LOG_ETHIO;
        msglog &= ~LOG_NONE;
      } else if (onoff == 0) {
        msglog &= ~LOG_ETHIO;
        msglog &= ~LOG_NONE;
      } else {
        msglog &= ~LOG_ETHIO;
        msglog |= LOG_NONE;
      }
    } else {
      return 1;
    }
  }
  return 0;
}

int cmd_dac(const struct s_cmd *c) {
  int mask, addr, data, loop;
  if (narg == 4) {
    if (_strcmp(args[1], "read") == 0) {
      mask = _atoh(args[2]);
      if (mask < 0 || mask > 3)
        return 1;
      addr = _atoh(args[3]);
      if (addr < 0 || addr > 0x0b)
        return 1;
      CAPTAN_DAC_SPI = 0x80008000 | (1 << (16 + mask)) | (addr << 8);
      loop = 0;
      while ((CAPTAN_DAC_SPI & 0x80000000))
        loop += 1;

      //
      //  We need to do this twice because there is one cycle of latency
      //  between when the data is requested and when it is delivered.
      //  See figure 2 of the MAX5893 data sheet.
      //
      CAPTAN_DAC_SPI = 0x80008000 | (1 << (16 + mask)) | (addr << 8);
      loop = 0;
      while ((CAPTAN_DAC_SPI & 0x80000000))
        loop += 1;

      data = CAPTAN_DAC_SPI & 0xff;
      _puts("\r\nDAC ");
      _print_int(mask);
      _puts(" reg 0x");
      _print_hex_byte(addr);
      _puts(" = ");
      _print_hex_byte(data);
    }
  } else if (narg == 5) {
    if (_strcmp(args[1], "write") == 0) {
      mask = _atoh(args[2]);
      if (mask < 0 || mask > 16)
        return 1;
      addr = _atoh(args[3]);
      if (addr < 0 || addr > 0x0b)
        return 1;
      data = _atoh(args[4]);
      CAPTAN_DAC_SPI =
          0x80000000 | (mask << 16) | ((addr & 0x0f) << 8) | (data & 0xff);
    }
  }
  return 0;
}

int cmd_link(const struct s_cmd *c) {
  unsigned char status[N_SENSOR * 5];
  int i, j, k;
  unsigned int w;
  static int ichan = -1;
  //  static int ichip = -1;
  static const char *bits[8] = {"   Aligned", "Sync error", "  SendData",
                                "RejectHits", "   Alines0", "AcquireBCO",
                                "   Pulsing", "Valid data"};
  if (narg == 2) {
    if (_strcmp(args[1], "status") == 0) {
      for (i = 0; i < n_sensor; i++) {
        for (j = 0; j < 5; j++) {
          status[5 * i + j] = (CAPTAN_STRIP_LINK_STATUS(i, j + 1) >> 24) & 0xff;
        }
      }
      _puts("\r\n          ");
      for (i = 0; i < n_sensor; i++) {
        _puts("  --");
        _putch(i + '0');
        _puts("--");
      }
      for (k = 0; k < 8; k++) {
        _puts("\r\n");
        _puts(bits[k]);
        for (i = 0; i < n_sensor; i++) {
          _puts("  ");
          for (j = 0; j < 5; j++) {
            _putch((status[5 * i + j] & (1 << (7 - k))) ? '1' : '0');
          }
        }
      }
    }
    return 0;
  } else if (narg >= 2) {
    if (_strcmp(args[1], "fifo") == 0) {
      if (narg > 2)
        ichan = _atoi(args[2]);
      if (ichan < 0 || ichan > 7)
        return 1;
      CAPTAN_STRIP_FIFO_CSR = (ichan << 16);
      while (!(CAPTAN_STRIP_FIFO_CSR & (1 << ichan)) && !(UART_SR & 0x01)) {
        w = CAPTAN_STRIP_FIFO_DATA;
        _puts("\r\n  ");
        _print_hex_long(w);
        _puts(" : ");
        _putch((w & 0x80000000) ? ' ' : '!');
        _putch((w & 0x40000000) ? ' ' : '*');
        _putch(' ');
        _print_int((w >> 27) & 0x07);
        _putch(',');
        _print_int((w >> 24) & 0x07);
        _putch(';');
        _print_bits(w, 20, 17);
        _putch(',');
        _print_bits(w, 16, 12);
        _putch(',');
        _print_hex_byte((w >> 4) & 0xff);
        _putch(',');
        _print_bits(w, 3, 1);
        _putch('=');
        _print_int(128 * (((w >> 24) & 0x07) - 1) +
                   strip_number[(w >> 17) & 0x0f] +
                   8 * set_number[(w >> 12) & 0x1f]);
      }
      if ((UART_SR & 0x01)) {
        _getch();
      }
    }
    return 0;
  }
  return 1;
}

int cmd_spy(const struct s_cmd *c) {
  unsigned int w;
  unsigned char b, d;
  int done;
  if (narg == 1) {
    _puts("\r\nspy fifo: ");
    _print_int(CAPTAN_STRIP_FIFO_CSR & 0x0f);
    if ((CAPTAN_STRIP_FIFO_CSR & 0x10)) {
      _puts("  A=empty");
    }
    if ((CAPTAN_STRIP_FIFO_CSR & 0x20)) {
      _puts("  A=full");
    }
    if ((CAPTAN_STRIP_FIFO_CSR & 0x40)) {
      _puts("  B=empty");
    }
    if ((CAPTAN_STRIP_FIFO_CSR & 0x80)) {
      _puts("  B=full");
    }
    if ((CAPTAN_STRIP_FIFO_CSR & 0x100)) {
      _puts("  C=empty");
    }
    if ((CAPTAN_STRIP_FIFO_CSR & 0x400)) {
      _puts("  C=full");
    }
  } else if (_strcmp(args[1], "fifo") == 0) {
    do {
      d = CAPTAN_STRIP_FIFO_CSR & 0x0f;
      if (d < 6) {
        done = ((CAPTAN_STRIP_FIFO_CSR & 0x10) || (UART_SR & 0x01));
      } else if (d > 7 && d < 12) {
        done = ((CAPTAN_STRIP_FIFO_CSR & 0x40) || (UART_SR & 0x01));
      } else if (d == 12) {
        done = ((CAPTAN_STRIP_FIFO_CSR & 0x100) || (UART_SR & 0x01));
      } else {
        done = 1;
      }
      if (!done) {
        w = CAPTAN_STRIP_FIFO_DATA;
        if (d < 6) {
          b = (CAPTAN_STRIP_FIFO_CSR & 0xf000) >> 12;
        } else if (d > 7 && d < 12) {
          b = (CAPTAN_STRIP_FIFO_CSR & 0xf0000) >> 16;
        } else if (d == 12) {
          b = (CAPTAN_STRIP_FIFO_CSR & 0xf00000) >> 20;
        } else {
          b = 0xff;
        }
        _puts("\r\n  ");
        _print_hex_byte(b);
        _puts("  ");
        _print_hex_long(w);
        if (b < 6) {
          //  Format hit strip word
          _puts(" strip ");
          _print_int(128 * (((w >> 24) & 0x07) - 1) +
                     strip_number[(w >> 17) & 0x0f] +
                     8 * set_number[(w >> 12) & 0x1f]);
        } else if (b == 7) {
          //  Format TBM status word
        } else if (b >= 8 && b <= 11) {
          //  Format trigger primitive words
        } else if (b == 12) {
          //  Format trigger number words
        }
      }
    } while (!done);
    if ((UART_SR & 0x01)) {
      _getch();
    }
  } else if (_strcmp(args[1], "reset") == 0) {
    CAPTAN_STRIP_FIFO_CSR |= 0x80000000;
    CAPTAN_STRIP_FIFO_CSR &= ~0x80000000;
  } else if (_isdigit(*args[1])) {
    CAPTAN_STRIP_FIFO_CSR = (CAPTAN_STRIP_FIFO_CSR & ~0x0f) | _atoi(args[1]);
  } else {
    return 1;
  }
  return 0;
}

int cmd_mon(const struct s_cmd *c) {
  int i, ion = -1, ichan = -1, ichip = -1;
  unsigned int w;
  if (narg == 1) {
    _puts("\r\nmonitor channel ");
    _print_int(CAPTAN_STRIP_DEBUG & 0x0f);
    _puts(" chip ");
    _print_int((CAPTAN_STRIP_DEBUG & 0xf0) >> 4);
    if ((CAPTAN_STRIP_DEBUG & 0x80000000)) {
      _puts(" on");
    } else {
      _puts(" off");
    }
  } else {
    for (i = 1; i < narg; i++) {
      if (_strcmp(args[i], "on") == 0) {
        ion = 1;
      } else if (_strcmp(args[i], "off") == 0) {
        ion = 0;
      } else if (_isdigit(*args[i])) {
        if (ichan < 0) {
          ichan = _atoi(args[i]);
          if (ichan < 0 || ichan > 5)
            return 1;
        } else if (ichip < 0) {
          ichip = _atoi(args[i]);
          if (ichip < 1 || ichip > 5)
            return 1;
        }
      } else {
        return 1;
      }
    }
    w = CAPTAN_STRIP_DEBUG;
    if (ion == 0)
      w &= 0x7fffffff;
    if (ion == 1)
      w |= 0x80000000;
    if (ichip >= 0)
      w = ((w & 0xffffff0f) | (ichip << 4));
    if (ichan >= 0)
      w = ((w & 0xfffffff0) | ichan);
    CAPTAN_STRIP_DEBUG = w;
  }
  return 0;
}

int cmd_trig(const struct s_cmd *c) {
  int i, j, ierr = 1;
  int chan = 0;
  unsigned int w;

  if (narg == 1) {
    _puts("\r\n TRIG = ");
    _print_hex_byte(CAPTAN_STRIP_TRIGNUM_HIGH);
    _print_hex_long(CAPTAN_STRIP_TRIGNUM_LOW);
    ierr = 0;
  } else if (narg >= 2) {
    if (_strcmp(args[1], "clear") == 0) {
      CAPTAN_STRIP_CSR |= 0x00200000;
      CAPTAN_STRIP_CSR &= ~0x00200000;
      ierr = 0;
    } else if (_strcmp(args[1], "fifo") == 0) {
      if (narg == 3) {
        chan = _atoi(args[2]);
      }
      w = CAPTAN_STRIP_TRIG_CSR;
      w &= ~0x000000f0;
      w |= (chan & 0x03) << 4;
      CAPTAN_STRIP_TRIG_CSR = w;
      for (i = 0; i < 16; i++) {
        if (!(CAPTAN_STRIP_TRIG_CSR & (1 << ((2 * chan) + 24)))) {
          w = CAPTAN_STRIP_TRIG_DATA;
          _puts("\r\n  ");
          _print_hex_long(w);
          _puts(" : ");
          for (j = 7; j >= 0; j--) { // High bits are earlier in time.
            if ((w & (1 << (24 + j)))) {
              _putch('#');
            } else {
              _putch('_');
            }
          }
          _puts("  ");
          for (j = 7; j >= 0; j--) {
            if ((w & (1 << (16 + j)))) {
              _putch('#');
            } else {
              _putch('_');
            }
          }
          _puts("  ");
          _print_hex_byte((w >> 8) & 0xff);
        }
      }
    }
    ierr = 0;
  }
  return ierr;
}

int cmd_sc(const struct s_cmd *c) {
  unsigned int word;
  unsigned char data;
  word = (chipid & 0x1f) | (((c->data >> 8) & 0x1f) << 5) |
         ((mask & 0xff) << 16) | ((readback & 0x07) << 13);
  unsigned char inst = 0;
  unsigned char len = 0;
  unsigned char sync = (c->data >> 4) & 0x0f;
  int i;
  if (c->data == 0) {
    _puts("\r\n  Cmd word : ");
    word = CAPTAN_STRIP_SC;
    _print_hex_long(word);
    _puts("\r\n  ChipID=");
    _print_int(word & 0x1f);
    _puts(", Addr=");
    _print_int((word >> 5) & 0x1f);
    _puts(", Inst=");
    _print_int((word >> 10) & 0x07);
    _puts(", Readback=");
    _print_int((word >> 13) & 0x07);
    _puts(", Mask=0x");
    _print_hex_byte((word >> 16) & 0xff);
    _puts(", Length=");
    _print_int((word >> 24) & 0x7f);
    _puts(", Busy=");
    _print_int((word >> 31) & 0x01);
    _puts("\r\n  Sc_out[3..0] = ");
    for (i = 0; i < 4; i++) {
      _print_hex_long(CAPTAN_STRIP_SCO[3 - i]);
      _putch(' ');
    }
    _puts("\r\n   Sc_in[3..0] = ");
    for (i = 0; i < 4; i++) {
      _print_hex_long(CAPTAN_STRIP_SCI[3 - i]);
      _putch(' ');
    }
    return 0;
  }
  if (narg < 2)
    return -1;
  if (_strcmp(args[1], "set") == 0) {
    inst = 0x02;
  } else if (_strcmp(args[1], "reset") == 0) {
    inst = 0x05;
  } else if (_strcmp(args[1], "default") == 0) {
    inst = 0x06;
  } else if (_strcmp(args[1], "read") == 0) {
    inst = 0x04;
    len = c->data & 0x07;
  } else if (_strcmp(args[1], "write") == 0) {
    inst = 0x01;
    len = c->data & 0x07;
    if (len < 4) {
      if (narg < 3)
        return -1;
      data = _atoi(args[2]);
      CAPTAN_STRIP_SCI[0] = data;
      CAPTAN_STRIP_SCI[1] = 0;
      CAPTAN_STRIP_SCI[2] = 0;
      CAPTAN_STRIP_SCI[3] = 0;
    } else if (len == 4) {
      for (i = 0; i < 4 && i + 2 < narg; i++) {
        CAPTAN_STRIP_SCI[i] = _atoh(args[2 + i]);
      }
    }
  } else {
    return -1;
  }
  word |= (inst & 0x07) << 10;
  word |= (len & 0x7f) << 24;
  word |= (sync & 0x0f) << 28;
  word |= 0x80000000;
  CAPTAN_STRIP_SC = word;
  if (inst == 0x04) {
    i = 0;
    do {
      word = CAPTAN_STRIP_SC;
      i += 1;
    } while (i < TIMEOUT && (word & 0x80000000));
    _puts("\r\n  Mask=");
    _print_hex_byte((word >> 16) & 0xff);
    _puts("  Readback=");
    _print_int((word >> 13) & 0x07);
    _puts(", ChipID=");
    _print_int(word & 0x1f);
    _puts(", Loop=");
    _print_int(i);
    _puts("\r\n  ");
    _puts(c->cmd);
    _puts(" = ");
    if (len == 1) {
      _print_int(CAPTAN_STRIP_SCO[0] & 1);
    } else if (len == 2) {
      _print_int(CAPTAN_STRIP_SCO[0] & 3);
    } else if (len == 3) {
      _print_int(CAPTAN_STRIP_SCO[0] & 0xff);
      _puts(" = 0x");
      _print_hex_byte(CAPTAN_STRIP_SCO[0] & 0xff);
    } else {
      _print_hex_long(CAPTAN_STRIP_SCO[0]);
      _putch(' ');
      _print_hex_long(CAPTAN_STRIP_SCO[1]);
      _putch(' ');
      _print_hex_long(CAPTAN_STRIP_SCO[2]);
      _putch(' ');
      _print_hex_long(CAPTAN_STRIP_SCO[3]);
    }
  }
  return 0;
}

int cmd_mask(const struct s_cmd *c) {
  int i, j;
  int chan = _atoi(args[1]);
  int chip;
  int strip;
  unsigned int word;
  int chipmask = 0;
  unsigned int bits[5][4];
  for (i = 0; i < 5; i++) {
    for (j = 0; j < 4; j++) {
      bits[i][j] = 0;
    }
  }
  for (i = 2; i < narg; i++) {
    strip = _atoi(args[i]);
    chip = strip / 128;
    strip = 127 - (strip % 128);
    bits[chip][strip / 32] |= (1 << (strip % 32));
    chipmask |= (1 << chip);
  }
  for (i = 0; i < 5; i++) {
    if ((chipmask & (1 << i))) {
      _puts("\r\nChannel ");
      _print_int(chan);
      _puts(" chip ");
      _print_int(i);
      _puts(" mask =");
      for (j = 0; j < 4; j++) {
        CAPTAN_STRIP_SCI[j] = bits[i][j];
        _putch(' ');
        _print_hex_long(bits[i][j]);
      }
      CAPTAN_STRIP_SC = 0x84000620 | (0x10000 << chan) | (9 + i);
      j = 0;
      do {
        word = CAPTAN_STRIP_SC;
        j += 1;
      } while (j < TIMEOUT && (word & 0x80000000));
      if ((word & 0x80000000)) {
        _puts("\r\ntimeout.");
        return 0;
      }
    }
  }
  return 0;
}

void print_version() {
  _puts(title_line);
  _puts(__DATE__);
  _putch(' ');
  _puts(__TIME__);
  _puts("\r\n");
}

int cmd_ver(const struct s_cmd *c) {
  print_version();
  return 0;
}

struct s_cmd cmds[] = {{"peek", 1, cmd_peek},       {"poke", 2, cmd_poke},
                       {"rx", 0, cmd_rx},           {"tx", 0, cmd_tx},
                       {"ip", 0, cmd_ip},           {"eint", 0, cmd_eint},
                       {"dint", 0, cmd_dint},       {"udp", 0, cmd_udp},
                       {"arp", 0, cmd_arp},         {"ntp", 1, cmd_ntp},
                       {"dhcp", 0, cmd_dhcp},       {"time", 0, cmd_time},
                       {"send", 2, cmd_send},       {"focus", 0, cmd_focus},
                       {"sc", 0, cmd_sc},           {"bco", 0, cmd_bco},
                       {"bcoclk", 0, cmd_bcoclk},   {"link", 0, cmd_link},
                       {"trig", 0, cmd_trig},       {"mon", 0, cmd_mon},
                       {"spy", 0, cmd_spy},         {"log", 0, cmd_log},
                       {"dac", 4, cmd_dac},         {"scraw", 1, cmd_scraw},
                       {"pdata", 0x0103, cmd_sc},   {"pctrl", 0x0203, cmd_sc},
                       {"vbn", 0x0303, cmd_sc},     {"shpvbp2", 0x0403, cmd_sc},
                       {"shpvbp1", 0x0503, cmd_sc}, {"blrvbp1", 0x0603, cmd_sc},
                       {"dvtn", 0x0703, cmd_sc},    {"dthr0", 0x0803, cmd_sc},
                       {"dthr1", 0x0903, cmd_sc},   {"dthr2", 0x0a03, cmd_sc},
                       {"dthr3", 0x0b03, cmd_sc},   {"dthr4", 0x0c03, cmd_sc},
                       {"dthr5", 0x0d03, cmd_sc},   {"dthr6", 0x0e03, cmd_sc},
                       {"dthr7", 0x0f03, cmd_sc},   {"aline", 0x1002, cmd_sc},
                       {"kill", 0x1104, cmd_sc},    {"inject", 0x1204, cmd_sc},
                       {"sdata", 0x1301, cmd_sc},   {"reject", 0x1401, cmd_sc},
                       {"spr", 0x1800, cmd_sc},     {"dcr", 0x1b03, cmd_sc},
                       {"scr", 0x1c10, cmd_sc},     {"aqbco", 0x1e23, cmd_sc},
                       {"mask", 2, cmd_mask},       {"stat", 0, cmd_stat},
                       {"state", 0, cmd_state},     {"ver", 0, cmd_ver},
                       {"reset", 1, cmd_reset},     {"bye", NULL}};
#define NCMD sizeof(cmds) / sizeof(struct s_cmd)

void handler(void) __attribute__((interrupt_handler));

void handler(void) {
  unsigned int t, ip_addr;
  unsigned char tag, b, cmd;
  unsigned short len, dport, sport;
  unsigned int addr, data, count;
  static const char *cmdname[] = {"nop",     "write  ", "set    ",
                                  "recv   ", "read   ", "reset  ",
                                  "default", "waitclr", "waitset"};
  volatile unsigned int *read_addr;
  int i;

  CAPTAN_GBE_CSR |= 1; // Acknowledge GBE interrupt
  dport = CAPTAN_UDP_PORTS & 0xffff;
  sport = (CAPTAN_UDP_PORTS >> 16) & 0xffff;
  ip_addr = CAPTAN_UDP_SADDR;
  len = CAPTAN_UDP_LENGTH & 0xffff;
  if (sport == 123) {
    for (i = 0; i < 36; i++) {
      b = CAPTAN_UDP_FIFO_DATA & 0xff;
      t = (t << 8) | b;
    }
    t -= 2208988800U;
    CAPTAN_CLOCK_TIME = t;
    _puts("\r\nNTP from ");
    _print_ip_addr(ip_addr);
    _puts(" - ");
    _print_time(t);
    _putch(' ');
    _puts(tzone);
    _putch('\r');
  } else if (sport == 67) {
    for (i = 0; i < 20; i++) {
      b = CAPTAN_UDP_FIFO_DATA & 0xff;
      t = (t << 8) | b;
    }
    ip_addr = t;
    _puts("DHCP from ");
    _print_ip_addr(CAPTAN_UDP_SADDR);
    _puts(" --> ");
    _print_ip_addr(t);
    _puts(" ");
    for (i = 0; i < 220; i++)
      b = CAPTAN_UDP_FIFO_DATA & 0xff;
    b = CAPTAN_UDP_FIFO_DATA & 0xff;
    if (b != 53) {
      _print_hex_byte(b);
      _puts(" != 53 ");
    } else {
      b = CAPTAN_UDP_FIFO_DATA & 0xff;
      b = CAPTAN_UDP_FIFO_DATA & 0xff;
      if (b == 2) {
        _puts("OFFER");
        dhcp_request(CAPTAN_UDP_SADDR, ip_addr);
      } else if (b == 5) {
        _puts("ACK");
        dhcp_ack(ip_addr);
      }
    }
    _puts("\r\n");
  } else if (dport == 47000) { // Ethernet IOBUS interface
    read_addr = 0;
    if ((CAPTAN_UDP_LISTEN_PORT & 0xffff) == 47000) {
      read_addr = CAPTAN_UDP_FIFO_DATA_B;
    } else if ((CAPTAN_UDP_LISTEN_PORT >> 16) == 47000) {
      read_addr = CAPTAN_UDP_FIFO_DATA_A;
    } else if ((CAPTAN_UDP_LISTEN_PORT & 0xffff) == 0) {
      read_addr = CAPTAN_UDP_FIFO_DATA_B;
    } else if ((CAPTAN_UDP_LISTEN_PORT >> 16) == 0) {
      read_addr = CAPTAN_UDP_FIFO_DATA_A;
    }
    if (!(msglog & LOG_NONE)) {
      _puts("\r\nETHIO from ");
      _print_ip_addr(CAPTAN_UDP_SADDR);
      _puts(" port ");
      _print_int(sport);
      _puts(" --> ");
      _print_int(dport);
      _puts(" length ");
      _print_int(len);
      _putch(' ');
      if (read_addr == 0) {
        _puts(" not listening.");
      } else if (read_addr == CAPTAN_UDP_FIFO_DATA_A) {
        _puts(" port A.");
      } else if (read_addr == CAPTAN_UDP_FIFO_DATA_B) {
        _puts(" port B.");
      }
    }

    CAPTAN_SENDPKT_DADDR = CAPTAN_UDP_SADDR;
    CAPTAN_SENDPKT_PORTS = (47000 << 16) | sport;
    CAPTAN_SENDPKT_CSR = 0x20000000; //  Assert clear
    CAPTAN_SENDPKT_CSR =
        0x00000000; //  We need a few clock cycles to let the clear propagate
    CAPTAN_SENDPKT_CSR = 0x00000000;
    CAPTAN_SENDPKT_CSR = 0x00000000;
    do {
      tag = (*read_addr) & 0xff;
      if (tag != 0x00) {
        if ((msglog & LOG_ETHIO)) {
          _puts("\r\n  ");
          _print_int(tag);
          _puts("  (");
        }
        cmd = (*read_addr) & 0xff;
        len = ((*read_addr) & 0xff) << 8;
        len |= (*read_addr) & 0xff;
        if ((msglog & LOG_ETHIO)) {
          _print_int(len);
          _puts(") ");
          _puts(cmdname[cmd]);
        }
        if (cmd == ETHIO_NOP) { // NOP
          count = 0;
          for (i = 0; i < len; i++) {
            count <<= 8;
            count |= (*read_addr) & 0xff;
          }

          //   Make sure this doesn't get optimized away.
          //   Better to replace it with a calibrated time delay.
          for (i = 0; i < count; i++)
            ;

          CAPTAN_SENDPKT_CSR = 0x40000000 + tag;
          CAPTAN_SENDPKT_CSR = 0x40000000 + (cmd | 0x80);
          CAPTAN_SENDPKT_CSR = 0x40000000 + 0;
          CAPTAN_SENDPKT_CSR = 0x40000000 + 0;
        } else if (cmd == ETHIO_WRITE || cmd == ETHIO_WAITCLR ||
                   cmd == ETHIO_WAITSET) {
          addr = 0;
          for (i = 0; i < 4; i++) {
            addr <<= 8;
            addr |= (*read_addr) & 0xff;
          }
          data = 0;
          for (i = 0; i < 4; i++) {
            data <<= 8;
            data |= (*read_addr) & 0xff;
          }
          if (cmd == ETHIO_WAITCLR || cmd == ETHIO_WAITSET) {
            count = 0;
            for (i = 0; i < 4; i++) {
              count <<= 8;
              count |= (*read_addr) & 0xff;
            }
          }
          if ((msglog & LOG_ETHIO)) {
            _puts(" 0x");
            _print_hex_long(addr);
            if (cmd == ETHIO_WRITE) {
              _puts(" <-- ");
            } else if (cmd == ETHIO_WAITCLR) {
              _puts(" & ");
            } else if (cmd == ETHIO_WAITSET) {
              _puts(" & ~");
            }
            _print_hex_long(data);
            if (cmd == ETHIO_WAITCLR) {
              _puts("  ");
            }
          }
          if (cmd == ETHIO_WRITE) {
            if (addr < 0xc0000000 || addr > 0xcfffffff) {
              _puts("\r\nBad address: ");
              _print_hex_long(addr);
            } else {
              *((volatile unsigned int *)addr) = data;
              CAPTAN_SENDPKT_CSR = 0x40000000 + tag;
              CAPTAN_SENDPKT_CSR = 0x40000000 + (cmd | 0x80);
              CAPTAN_SENDPKT_CSR = 0x40000000 + 0;
              CAPTAN_SENDPKT_CSR = 0x40000000 + 0;
            }
          } else if (cmd == ETHIO_WAITCLR || cmd == ETHIO_WAITSET) {
            i = 0;
            do {
              i += 1;
              if (cmd == ETHIO_WAITCLR &&
                  (*((volatile unsigned int *)addr) & data) == 0)
                break;
              if (cmd == ETHIO_WAITSET &&
                  (*((volatile unsigned int *)addr) & data) != 0)
                break;
              if ((i % 100000) == 0)
                _putch('.');
            } while (i < count);
            if ((msglog & LOG_ETHIO)) {
              _puts("  loop=");
              _print_int(i);
            }
            CAPTAN_SENDPKT_CSR = 0x40000000 + tag;
            CAPTAN_SENDPKT_CSR = 0x40000000 + (cmd | 0x80);
            CAPTAN_SENDPKT_CSR = 0x40000000 + 0;
            CAPTAN_SENDPKT_CSR = 0x40000000 + 4;
            CAPTAN_SENDPKT_CSR = 0x40000000 + ((i >> 24) & 0xff);
            CAPTAN_SENDPKT_CSR = 0x40000000 + ((i >> 16) & 0xff);
            CAPTAN_SENDPKT_CSR = 0x40000000 + ((i >> 8) & 0xff);
            CAPTAN_SENDPKT_CSR = 0x40000000 + (i & 0xff);
          }
        } else if (cmd == ETHIO_READ) {
          addr = 0;
          for (i = 0; i < 4; i++) {
            addr <<= 8;
            addr |= (*read_addr) & 0xff;
          }
          data = *((volatile unsigned int *)addr);
          if ((msglog & LOG_ETHIO)) {
            _puts(" 0x");
            _print_hex_long(addr);
            _puts(" = ");
            _print_hex_long(data);
          }
          CAPTAN_SENDPKT_CSR = 0x40000000 + tag;
          CAPTAN_SENDPKT_CSR = 0x40000000 + (cmd | 0x80);
          CAPTAN_SENDPKT_CSR = 0x40000000 + 0;
          CAPTAN_SENDPKT_CSR = 0x40000000 + 8;
          CAPTAN_SENDPKT_CSR = 0x40000000 + ((addr >> 24) & 0xff);
          CAPTAN_SENDPKT_CSR = 0x40000000 + ((addr >> 16) & 0xff);
          CAPTAN_SENDPKT_CSR = 0x40000000 + ((addr >> 8) & 0xff);
          CAPTAN_SENDPKT_CSR = 0x40000000 + (addr & 0xff);
          CAPTAN_SENDPKT_CSR = 0x40000000 + ((data >> 24) & 0xff);
          CAPTAN_SENDPKT_CSR = 0x40000000 + ((data >> 16) & 0xff);
          CAPTAN_SENDPKT_CSR = 0x40000000 + ((data >> 8) & 0xff);
          CAPTAN_SENDPKT_CSR = 0x40000000 + (data & 0xff);
        }
      }
    } while (tag != 0x00);
    if ((msglog & LOG_ETHIO)) {
      _puts("\r\nSending reply.");
    }
    CAPTAN_SENDPKT_CSR = 0x40000000;

    CAPTAN_SENDPKT_CSR = 0x40000000;
    CAPTAN_SENDPKT_CSR = 0x40000000;
    CAPTAN_SENDPKT_CSR = 0x40000000;
    CAPTAN_SENDPKT_CSR = 0x40000000;
    CAPTAN_SENDPKT_CSR =
        0x40000000; //  Extra padding in case the payload isn't big enough

    CAPTAN_SENDPKT_CSR = 0x80000000; //  Assert strobe
    CAPTAN_SENDPKT_CSR = 0x80000000; //  Assert strobe
    CAPTAN_SENDPKT_CSR = 0x00000000; //  Deassert strobe
    if (!(msglog & LOG_NONE)) {
      _putch('\r');
    }
  } else {
    _puts("\r\nUDP from ");
    _print_ip_addr(ip_addr);
    _puts(" port ");
    _print_int(sport);
    _puts(" --> ");
    _print_int(dport);
    _puts(" length ");
    _print_int(len);
    _putch('\r');
  }
  nint += 1;
  XIN_IAR = 0x00010000;
}

int main() {
  char *p;
  int i, j, ierr;

  init_platform();
  print_version();

  CAPTAN_DAC_SPI = 0x800f001c; //  Disable DAC's to reduce power
  CAPTAN_GBE_CSR = 0;          // Deassert reset, wait for clock to start

  /*
    i = 0;
    j = 0;
    while ( i++ < 100000000 && j < 2 ) {
      if ( CAPTAN_RX_FRAME_COUNTER != j ) {
        _puts("#");
        j = CAPTAN_RX_FRAME_COUNTER;
      }
    }
  */

  XIN_IER |= INTC_INT_MASK;
  microblaze_enable_interrupts();
  _puts("\r\nInterrupts enabled.");
  if ((msglog & LOG_NONE)) {
    _puts("\r\nETHIO logging disabled.");
  }

  if (CAPTAN_GBE_CSR & DHCP_BIT) {
    _puts("\r\nMAC address ");
    _print_mac_addr(CAPTAN_MAC_ADDRESS_HIGH, CAPTAN_MAC_ADDRESS_LOW);

    _puts("\r\nInvoking DHCP");
    i = 0;
    do {
      _putch('.');
      send_dhcp_request();
      j = 0;
      while (j < 20000000 && dhcp_done == 0)
        j++;
    } while (i++ < 10 && dhcp_done == 0);

    if (dhcp_done) {
      CAPTAN_IP_ADDR = dhcp_myaddr;
      CAPTAN_NETMASK = dhcp_netmask;
      CAPTAN_GATEWAY = dhcp_router;
    } else {
      _puts("\r\nTimeout.");
    }
  }
  _puts("\r\nip addr ");
  _print_ip_addr(CAPTAN_IP_ADDR);
  _puts(" netmask ");
  _print_ip_addr(CAPTAN_NETMASK);
  _puts(" gw ");
  _print_ip_addr(CAPTAN_GATEWAY);
  for (i = 0; i < 1000; i++)
    ;
  if (dhcp_ntpaddr != 0)
    send_ntp(dhcp_ntpaddr);

  n_sensor = CAPTAN_STRIP_CSR & 0x07;

  _puts("\r\nReady...");
  do {
    _puts("\r\n$ ");
    p = _gets(line, sizeof(line));
    if (p == NULL)
      continue;
    p = _token(line);
    narg = 0;
    while (narg < MAXARG && p != NULL && p[0] != '-' && p[1] != '-') {
      args[narg++] = p;
      p = _token(NULL);
    }
    if (narg == 0)
      continue;
    ierr = -1;
    for (i = 0; i < NCMD; i++) {
      if (_strcmp(args[0], cmds[i].cmd) == 0) {
        if (cmds[i].func == NULL) {
          ierr = 0;
          break;
        }
        ierr = cmds[i].func(cmds + i);
        break;
      }
    }
    if (ierr != 0) {
      _puts("\r\n???");
    }
  } while (1);
  _puts("\r\nGoodbye");
  return 0;
}
