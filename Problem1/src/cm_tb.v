`include "color_mixer.v"
`timescale 1ns/1ps

module cm_tb;
  reg         clk, rst;
  reg  [23:0] color;
  wire [2:0]  rgb_pwm;
  wire        timeout;

  color_mixer cm (
    .clk_i    (clk),
    .rst_i    (rst),
    .color_i  (color),
    .rgb_pwm_o(rgb_pwm),
    .timeout_o(timeout)
  );

  initial begin
    clk = 0;
    color = 24'h7f1fff;
    rst = 1;
    #15;
    rst = 0;
    #5000;
    $finish;
  end

  always begin
    clk = #4 ~clk;
  end

  initial begin
    $dumpfile("cm.vcd");
    $dumpvars;
  end

endmodule
