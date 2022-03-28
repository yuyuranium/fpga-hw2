module controller (rst,
                   color, brightness,
                   brtns_timeout
                  );


parameter S_IDLE = 3'd0,
          S_RED = 3'd1,
          S_ORANGE = 3'd2,
          S_YELLOW = 3'd3,
          S_GREEN = 3'd4,
          S_BLUE = 3'd5,
          S_PURPLE = 3'd6;

parameter RED = 24'hFF0000;
parameter ORANGE = 24'hFF6100;
parameter YELLOW = 24'hFFFF00;
parameter GREEN = 24'h00FF00;
parameter BLUE = 24'h0000FF;
parameter PURPLE = 24'h7F1FFF;

input rst;
input brtns_timeout;
output reg [23:0] color;
output  [4:0] brightness;

reg [2:0] state, n_state;
reg [9:0] timeout_cnt;
reg [4:0] brtns_cnt;
reg cnt_mode;
wire timeout_cnt_done;
wire change_state;

assign brightness = brtns_cnt;
assign timeout_cnt_done = &timeout_cnt;
assign change_state = (~|brtns_cnt && timeout_cnt_done && cnt_mode )? 1'b1 : 1'b0;

always@(posedge brtns_timeout or posedge rst)begin
    if(rst)begin
        state <= S_IDLE;
    end
    else begin
        state <= n_state;
    end
end
always@(*)begin
    case(state)
        S_IDLE:n_state = S_RED;
        S_RED:begin
            if(change_state)begin
                n_state = S_ORANGE;
            end
            else begin
                n_state = state;
            end
        end
        S_ORANGE:begin
            if(change_state)begin
                n_state = S_YELLOW;
            end
            else begin
                n_state = state;
            end
        end
        S_YELLOW:begin
            if(change_state)begin
                n_state = S_GREEN;
            end
            else begin
                n_state = state;
            end
        end
        S_GREEN:begin
            if(change_state)begin
                n_state = S_BLUE;
            end
            else begin
                n_state = state;
            end
        end
        S_BLUE:begin
            if(change_state)begin
                n_state = S_PURPLE;
            end
            else begin
                n_state = state;
            end
        end
        S_PURPLE:begin
            if(change_state)begin
                n_state = S_RED;
            end
            else begin
                n_state = state;
            end
        end
        default:n_state = S_IDLE;
    endcase
end

always@(*)begin
    case(state)
        S_IDLE: color = 24'd0;
        S_RED: color = RED;
        S_ORANGE: color = ORANGE;
        S_YELLOW: color = YELLOW;
        S_GREEN: color = GREEN;
        S_BLUE: color = BLUE;
        S_PURPLE: color = PURPLE;
        default: color = 24'd0;
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
            brtns_cnt <= brtns_cnt;
            cnt_mode <= (timeout_cnt_done)? 1'b1 : 1'b0;
        end
        else begin
            brtns_cnt <= brtns_cnt + {4'd0,timeout_cnt_done};
            cnt_mode <= 1'b0;
        end
    end
    else begin
        if(~|brtns_cnt)begin
            brtns_cnt <= brtns_cnt;
            cnt_mode <= (timeout_cnt_done)?1'b0:1'b1;
        end
        else begin
            brtns_cnt <= brtns_cnt - {4'd0,timeout_cnt_done};
            cnt_mode <= 1'b1;
        end
    end
end

endmodule