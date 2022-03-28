`timescale 1ns/1ns
`include "color_mixer.v"
`include "brtns_mod.v"
`include "controller.v"

module top (
  input        clk_i,
  input        rst_i,
  output [2:0] rgb4
);

  wire [23:0] color;
  wire [4:0] brtns;
  wire [2:0] rgb_pwm;
  wire brtns_timeout, mixer_timeout, on_pwm;

  assign rgb4 = rgb_pwm & {on_pwm, on_pwm, on_pwm};

  controller ctrl (
    .rst          (rst_i),
    .color        (color),
    .brightness   (brtns),
    .brtns_timeout(brtns_timeout)
  );

  color_mixer mixer (
    .clk_i    (clk_i),
    .rst_i    (rst_i),
    .color_i  (color),
    .rgb_pwm_o(rgb_pwm),
    .timeout_o(mixer_timeout)
  );

  brtns_mod mod (
    .clk_i    (clk_i),
    .rst_i    (rst_i),
    .timeout_i(mixer_timeout),
    .brtns_i  (brtns),
    .on_pwm_o (on_pwm),
    .timeout_o(brtns_timeout)
  );

  initial begin
    $monitor("color = 0x%x, brtns = %d", color, brtns);
    $dumpfile("top.vcd");
    $dumpvars;
  end

endmodule
