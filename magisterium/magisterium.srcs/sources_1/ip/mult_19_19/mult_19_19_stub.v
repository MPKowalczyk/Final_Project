// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Sat Oct 22 22:36:35 2016
// Host        : DESKTOP-4G87URT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/magisterium/magisterium.srcs/sources_1/ip/mult_19_19/mult_19_19_stub.v
// Design      : mult_19_19
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_10,Vivado 2015.4" *)
module mult_19_19(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[18:0],B[18:0],P[37:0]" */;
  input CLK;
  input [18:0]A;
  input [18:0]B;
  output [37:0]P;
endmodule
