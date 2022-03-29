//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Tue Mar 29 17:53:58 2022
//Host        : DESKTOP-L6O6JGE running 64-bit major release  (build 9200)
//Command     : generate_target HW2P2_wrapper.bd
//Design      : HW2P2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module HW2P2_wrapper
   (clk,
    led4_B,
    led4_G,
    led4_R,
    rst);
  input clk;
  output [0:0]led4_B;
  output [0:0]led4_G;
  output [0:0]led4_R;
  input rst;

  wire clk;
  wire [0:0]led4_B;
  wire [0:0]led4_G;
  wire [0:0]led4_R;
  wire rst;

  HW2P2 HW2P2_i
       (.clk(clk),
        .led4_B(led4_B),
        .led4_G(led4_G),
        .led4_R(led4_R),
        .rst(rst));
endmodule
