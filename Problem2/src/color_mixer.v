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

  reg [7:0] cnt;

  assign rgb_pwm_o = {
    cnt < color_i[23:16],
    cnt < color_i[15:8],
    cnt < color_i[7:0]
  };
  assign timeout_o = &cnt;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      cnt <= 8'd0;
    end else begin
      cnt <= cnt + 8'd1;
    end
  end

endmodule
