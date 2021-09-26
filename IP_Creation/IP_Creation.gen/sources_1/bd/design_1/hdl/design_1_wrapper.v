//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Sep 23 18:07:38 2021
//Host        : LAPTOP-VOSD4RFJ running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CE,
    CLK,
    L,
    LOAD,
    UP,
    Y);
  input CE;
  input CLK;
  input [15:0]L;
  input LOAD;
  input UP;
  output [15:0]Y;

  wire CE;
  wire CLK;
  wire [15:0]L;
  wire LOAD;
  wire UP;
  wire [15:0]Y;

  design_1 design_1_i
       (.CE(CE),
        .CLK(CLK),
        .L(L),
        .LOAD(LOAD),
        .UP(UP),
        .Y(Y));
endmodule
