module controller (clk, rst, SW,
                   rgb_pwm, on_pwm, 
                   color, brightness,
                   brtns_timeout,
                   led4, led5
                  );

parameter PURPLE = 24'h7F1FFF;
parameter CYAN = 24'h00FFFF;
parameter YELLOW = 24'hFFFF00;
parameter CRIMSON = 24'hFF00FF;


input clk, rst;
input [1:0] SW;
input [2:0] rgb_pwm;
input on_pwm;
input brtns_timeout;
output [2:0] led4, led5;
output reg [23:0] color;
output  [4:0] brightness;


reg [9:0] timeout_cnt, ntimeout_cnt;
reg [4:0] brtns_cnt, nbrtns_cnt;
reg cnt_mode;
wire timeout_cnt_done;


assign led4 = rgb_pwm;
assign led5[2] = rgb_pwm[2] & on_pwm;
assign led5[1] = rgb_pwm[1] & on_pwm;
assign led5[0] = rgb_pwm[0] & on_pwm;
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
/*always@(*)begin   
    if(brtns_timeout)begin
        if(timeout_cnt_done)begin
            ntimeout_cnt = 10'd0;
        end
        else begin
            ntimeout_cnt = timeout_cnt + 10'd1;
        end
    end
    else begin
        ntimeout_cnt = timeout_cnt;
    end
end*/

/*always@(posedge clk or posedge rst)begin
    if(rst)begin
        brtns_cnt <= 5'd0;
    end
    else begin
        brtns_cnt <= nbrtns_cnt;
    end
end
always@(*)begin
    if(timeout_cnt_done)begin
        if(cnt_mode)begin
            nbrtns_cnt = brtns_cnt - 5'd1;
        end
        else begin
            nbrtns_cnt = brtns_cnt + 5'd1;
        end
    end
    else begin
        nbrtns_cnt = brtns_cnt;
    end
end

always@(posedge clk or posedge rst)begin
    if(rst)begin
        cnt_mode <= 1'b1;
    end
    else if(timeout_cnt == 10'd1022)begin
        if( &brtns_cnt || ~|brtns_cnt )begin
            cnt_mode <= !cnt_mode;
        end
        else begin
        end
    end
    else begin
    end
end
*/

always@(posedge brtns_timeout or posedge rst)begin
    if(rst)begin
        brtns_cnt <= 5'd0;
        cnt_mode <= 1'b0;
    end
    else if(!cnt_mode)begin
        if(&brtns_cnt)begin
            brtns_cnt <= brtns_cnt - timeout_cnt_done;
            cnt_mode <= 1'b1;
        end
        else begin
            brtns_cnt <= brtns_cnt + timeout_cnt_done;
            cnt_mode <= 1'b0;
        end
    end
    else begin
        if(~|brtns_cnt)begin
            brtns_cnt <= brtns_cnt + timeout_cnt_done;
            cnt_mode <= 1'b0;
        end
        else begin
            brtns_cnt <= brtns_cnt - timeout_cnt_done;
            cnt_mode <= 1'b1;
        end
    end
end

endmodule
