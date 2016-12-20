// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Fri Oct 28 01:33:34 2016
// Host        : Zordon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/OneDrive/mag/MSc_ZYBO/magisterium16/magisterium.srcs/sources_1/ip/mult_17_17/mult_17_17_stub.v
// Design      : mult_17_17
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_12,Vivado 2016.3" *)
module mult_17_17(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[16:0],B[16:0],P[33:0]" */;
  input CLK;
  input [16:0]A;
  input [16:0]B;
  output [33:0]P;
endmodule
