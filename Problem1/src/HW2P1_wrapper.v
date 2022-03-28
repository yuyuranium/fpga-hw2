//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Mar 28 20:44:00 2022
//Host        : DESKTOP-L6O6JGE running 64-bit major release  (build 9200)
//Command     : generate_target HW2P1_wrapper.bd
//Design      : HW2P1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module HW2P1_wrapper
   (SW,
    clk,
    led4_B,
    led4_G,
    led4_R,
    led5_B,
    led5_G,
    led5_R,
    rst);
  input [1:0]SW;
  input clk;
  output [0:0]led4_B;
  output [0:0]led4_G;
  output [0:0]led4_R;
  output [0:0]led5_B;
  output [0:0]led5_G;
  output [0:0]led5_R;
  input rst;

  wire [1:0]SW;
  wire clk;
  wire [0:0]led4_B;
  wire [0:0]led4_G;
  wire [0:0]led4_R;
  wire [0:0]led5_B;
  wire [0:0]led5_G;
  wire [0:0]led5_R;
  wire rst;

  HW2P1 HW2P1_i
       (.SW(SW),
        .clk(clk),
        .led4_B(led4_B),
        .led4_G(led4_G),
        .led4_R(led4_R),
        .led5_B(led5_B),
        .led5_G(led5_G),
        .led5_R(led5_R),
        .rst(rst));
endmodule
