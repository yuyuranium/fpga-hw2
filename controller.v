module controller (rst, SW,
                   color, brightness,
                   brtns_timeout
                  );

parameter PURPLE = 24'h7F1FFF;
parameter CYAN = 24'h00FFFF;
parameter YELLOW = 24'hFFFF00;
parameter CRIMSON = 24'hFF00FF;


input rst;
input [1:0] SW;
input brtns_timeout;
output reg [23:0] color;
output  [4:0] brightness;


reg [9:0] timeout_cnt;
reg [4:0] brtns_cnt;
reg cnt_mode;
wire timeout_cnt_done;

assign brightness = brtns_cnt;
assign timeout_cnt_done = &timeout_cnt;


always@(*)begin
    case(SW)
        2'b00:color = PURPLE;
        2'b01:color = CYAN;
        2'b10:color = YELLOW;
        2'b11:color = CRIMSON;
        default:color = 24'd0;
    endcase
end

always@(posedge brtns_timeout or posedge rst)begin
    if(rst)begin
        timeout_cnt <= 10'd0;
    end
    else begin
        timeout_cnt <= timeout_cnt + 10'd1;
    end
end

always@(posedge brtns_timeout or posedge rst)begin
    if(rst)begin
        brtns_cnt <= 5'd0;
        cnt_mode <= 1'b0;
    end
    else if(!cnt_mode)begin
        if(&brtns_cnt)begin
            brtns_cnt <= brtns_cnt - {4'd0,timeout_cnt_done};
            cnt_mode <= 1'b1;
        end
        else begin
            brtns_cnt <= brtns_cnt + {4'd0,timeout_cnt_done};
            cnt_mode <= 1'b0;
        end
    end
    else begin
        if(~|brtns_cnt)begin
            brtns_cnt <= brtns_cnt + {4'd0,timeout_cnt_done};
            cnt_mode <= 1'b0;
        end
        else begin
            brtns_cnt <= brtns_cnt - {4'd0,timeout_cnt_done};
            cnt_mode <= 1'b1;
        end
    end
end

endmodule
