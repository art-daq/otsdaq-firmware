#include "xiomodule_l.h"
#include "xparameters.h"

#ifdef __cplusplus
extern "C" {
#endif
char inbyte(void);
#ifdef __cplusplus
}
#endif

char inbyte(void) { return XIOModule_RecvByte(STDIN_BASEADDRESS); }
