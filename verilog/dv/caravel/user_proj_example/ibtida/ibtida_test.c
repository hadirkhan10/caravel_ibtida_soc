#include "../../defs.h"

void main()
{
 
   reg_mprj_io_8  = GPIO_MODE_USER_STD_OUTPUT;
   reg_mprj_io_9  = GPIO_MODE_USER_STD_OUTPUT;
   reg_mprj_io_10 = GPIO_MODE_USER_STD_OUTPUT;
   reg_mprj_io_11 = GPIO_MODE_USER_STD_OUTPUT;

   reg_mprj_io_5 = GPIO_MODE_USER_STD_INPUT_NOPULL;
   reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;

  reg_mprj_xfer = 1;
  while(reg_mprj_xfer == 1);

  reg_la1_ena = 0x00000000;
  reg_la1_data = 0x00000057;

  reg_la0_ena = 0x00000000;
  reg_la0_data = 0x00000001;
  reg_la0_data = 0x00000000;
  reg_mprj_datah = 0x20;
  reg_mprj_datah = 0x0;
  

}
