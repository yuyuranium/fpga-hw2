//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Mar 28 20:44:00 2022
//Host        : DESKTOP-L6O6JGE running 64-bit major release  (build 9200)
//Command     : generate_target HW2P1.bd
//Design      : HW2P1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "HW2P1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=HW2P1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "HW2P1.hwdef" *) 
module HW2P1
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN HW2P1_clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output [0:0]led4_B;
  output [0:0]led4_G;
  output [0:0]led4_R;
  output [0:0]led5_B;
  output [0:0]led5_G;
  output [0:0]led5_R;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;

  wire [1:0]SW_1;
  wire brtns_mod_0_on_pwm_o;
  wire brtns_mod_0_timeout_o;
  wire clk_1;
  wire [2:0]color_mixer_0_rgb_pwm_o;
  wire color_mixer_0_timeout_o;
  wire [4:0]controller_0_brightness;
  wire [23:0]controller_0_color;
  wire rst_1;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]util_vector_logic_1_Res;
  wire [0:0]util_vector_logic_2_Res;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;

  assign SW_1 = SW[1:0];
  assign clk_1 = clk;
  assign led4_B[0] = xlslice_2_Dout;
  assign led4_G[0] = xlslice_1_Dout;
  assign led4_R[0] = xlslice_0_Dout;
  assign led5_B[0] = util_vector_logic_2_Res;
  assign led5_G[0] = util_vector_logic_1_Res;
  assign led5_R[0] = util_vector_logic_0_Res;
  assign rst_1 = rst;
  HW2P1_brtns_mod_0_0 brtns_mod_0
       (.brtns_i(controller_0_brightness),
        .clk_i(clk_1),
        .on_pwm_o(brtns_mod_0_on_pwm_o),
        .rst_i(rst_1),
        .timeout_i(color_mixer_0_timeout_o),
        .timeout_o(brtns_mod_0_timeout_o));
  HW2P1_color_mixer_0_0 color_mixer_0
       (.clk_i(clk_1),
        .color_i(controller_0_color),
        .rgb_pwm_o(color_mixer_0_rgb_pwm_o),
        .rst_i(rst_1),
        .timeout_o(color_mixer_0_timeout_o));
  HW2P1_controller_0_0 controller_0
       (.SW(SW_1),
        .brightness(controller_0_brightness),
        .brtns_timeout(brtns_mod_0_timeout_o),
        .color(controller_0_color),
        .rst(rst_1));
  HW2P1_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(xlslice_0_Dout),
        .Op2(brtns_mod_0_on_pwm_o),
        .Res(util_vector_logic_0_Res));
  HW2P1_util_vector_logic_0_1 util_vector_logic_1
       (.Op1(xlslice_1_Dout),
        .Op2(brtns_mod_0_on_pwm_o),
        .Res(util_vector_logic_1_Res));
  HW2P1_util_vector_logic_0_2 util_vector_logic_2
       (.Op1(xlslice_2_Dout),
        .Op2(brtns_mod_0_on_pwm_o),
        .Res(util_vector_logic_2_Res));
  HW2P1_xlslice_0_0 xlslice_0
       (.Din(color_mixer_0_rgb_pwm_o),
        .Dout(xlslice_0_Dout));
  HW2P1_xlslice_1_0 xlslice_1
       (.Din(color_mixer_0_rgb_pwm_o),
        .Dout(xlslice_1_Dout));
  HW2P1_xlslice_1_1 xlslice_2
       (.Din(color_mixer_0_rgb_pwm_o),
        .Dout(xlslice_2_Dout));
endmodule
