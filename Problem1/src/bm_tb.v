`include "brtns_mod.v"
`timescale 1ns/1ps

module bm_tb;
  reg        clk, rst, timeout_cm;
  reg  [4:0] brtns;
  wire on_pwm, timeout_bm;

  brtns_mod cm (
    .clk_i    (clk),
    .rst_i    (rst),
    .brtns_i  (brtns),
    .timeout_i(timeout_cm),
    .on_pwm_o (on_pwm),
    .timeout_o(timeout_bm)
  );

  initial begin
    clk = 1;
    brtns = 5'd10;
    rst = 1;
    #10;
    rst = 0;
    #5000;
    $finish;
  end

  always begin
    clk = #4 ~clk;
  end

  always begin
    timeout_cm = 0;
    #80;  // actually it is 256 clock cycles
    timeout_cm = 1;
    #8;
  end

  initial begin
    $dumpfile("bm.vcd");
    $dumpvars;
  end

endmodule
