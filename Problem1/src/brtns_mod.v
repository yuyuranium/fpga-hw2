/* brtns_mod.v
 *
 * Brightness modulation module that modulates the brightness using 1-bit pwm 
 * signal `on_pwm_o`. `timeout_o` is pulled every 32 `timeout_i`, which is from
 * color_mixer.
 */
module brtns_mod (
  input       clk_i,
  input       rst_i,
  input       timeout_i,
  input [4:0] brtns_i,
  output      on_pwm_o,
  output      timeout_o
);

endmodule
