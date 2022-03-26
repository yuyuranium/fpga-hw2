module controller (clk,rst,
                   color,brightness
                  );

parameter RGB = 24'h7F6E5D;
parameter BN = 5'd13;


input clk, rst;
output reg [23:0] color;
output reg [4:0] brightness;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        color <= 24'd0;
        brightness <= 5'd0;
    end
    else begin
        color <= RGB;
        brightness <= BN;
    end
end


endmodule
