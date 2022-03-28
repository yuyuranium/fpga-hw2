#include <verilated.h>
#include "Vtop.h"

int main(int argc, char *argv[])
{
  VerilatedContext *contextp = new VerilatedContext();
  contextp->debug(0);
  contextp->traceEverOn(true);
  contextp->commandArgs(argc, argv);

  Vtop *top = new Vtop(contextp, "top");
  return 0;
}
