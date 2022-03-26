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

  reg [4:0] cnt;

  assign on_pwm_o  = cnt < brtns_i;
  assign timeout_o = &cnt;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      cnt <= 5'd0;
    end else begin
      cnt <= (timeout_i)? cnt + 5'd1 : cnt;
    end
  end

endmodule
