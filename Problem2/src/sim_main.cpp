#include <verilated.h>
#include "Vtop.h"

int main(int argc, char *argv[])
{
  VerilatedContext *contextp = new VerilatedContext();
  contextp->debug(0);
  contextp->traceEverOn(true);
  contextp->commandArgs(argc, argv);

  Vtop *top = new Vtop(contextp, "top");
  top->clk_i = 1;
  top->rst_i = 1;

  for (int i = 0; i < 2; ++i) {
    contextp->timeInc(4);
    top->eval();
    top->clk_i = !top->clk_i;
  }
  top->rst_i = 0;

  for (;;) {
    contextp->timeInc(4);
    top->eval();
    top->clk_i = !top->clk_i;
  }

  top->final();
  return 0;
}
