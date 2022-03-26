/* color_mixer.v
 *
 * Color mixer module that reads input 24-bit RGB code and outputs 3-bit RGB pwm
 * signal `rgb_pwm_o`. `timeout_o` is pulled up every 255 clk cycles.
 */
module color_mixer (
  input         clk_i,
  input         rst_i,
  input  [23:0] color_i,
  output [2:0]  rgb_pwm_o,
  output        timeout_o
);

endmodule
