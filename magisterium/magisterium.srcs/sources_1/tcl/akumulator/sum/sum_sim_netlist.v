// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Tue Nov 22 07:20:18 2016
// Host        : KomputerMarcina running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top sum -prefix
//               sum_ sum_sim_netlist.v
// Design      : sum
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sum,c_addsub_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_10,Vivado 2016.3" *) 
(* NotValidForBitStream *)
module sum
   (A,
    B,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [10:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [29:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [29:0]S;

  wire [10:0]A;
  wire [29:0]B;
  wire [29:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "000000000000000000000000000000" *) 
  (* C_B_WIDTH = "30" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "30" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  sum_c_addsub_v12_0_10 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "11" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "000000000000000000000000000000" *) 
(* C_B_WIDTH = "30" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "30" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module sum_c_addsub_v12_0_10
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [10:0]A;
  input [29:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [29:0]S;

  wire \<const0> ;
  wire [10:0]A;
  wire [29:0]B;
  wire [29:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "11" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "000000000000000000000000000000" *) 
  (* C_B_WIDTH = "30" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "30" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  sum_c_addsub_v12_0_10_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
EgsHeoOxdUxsX5gIKiaj0rabVidhYZrAC1ccO7uW1WWUY+5F26NMKfuRo2RbzpHAhKg6YWmehafX
vTPGaJRKHw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Z34YzyhCkqWVBd+wfHLLkUW/H60lDZ7DBcaAzQK4qK/8LgoJdsH6DZ43BtKjfZhNz/T8CrFXpTq4
lXACmrJsvh8DNPmvB7LaQhnP9Q1UWB/2BUP3fAUHMA2d2pKOqEj3XF5pbikvIPiyQENN7Kn513bC
CvwAQIx2bzxkiYX1MZc=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SSMUY5NrZw2M/7w7U4gsSjNRmWfRCxfALTKD8+8C1h91c8RWo9X4x7A5m9YG0Pa491k6Lxf7I0eD
goajxjfLKNI+buWpvfZlHEcU7678iPGqz4g94c5n80sa3TKcwpV6f+p7C93Rto4JgUHSigA3gLBN
DzpD+6xOS6P2mkrRsQs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Tbb//X7l5IJljgHR/Q0swC7OpOr9LwQv6rxLgPXOMJNm5TebIkTTeQKZBlg96/x0gqqgFX19ZASr
qWxh3YL/aoYejZTUMHYF7ktggRgHydykFFfRo8xGrq33bJ1LOeuIQOZyZjZTB9zCoo8CMX8wCtcA
0ovBA4GCY5VFNLy/1whSrZs8R7CLSdrlxUJTTCXjF0f+Tf8OyjSS2VGyZfJbmSNnFJJuItoBbUO0
6qdcZfL3eQrA6y/AWPiFhGILWhBAvVGEahvuOHYDa8S1IUccHMOxQJtq0Y1UqRNB/qNmlHUKL/iH
IEr89vPUXnsfHTV4I+xFieSKz2LwzLXsAys4Yw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kfJNFYIhzZvlPwb4KI2aCH6Fx40tZkxF1Q5EfJSPdq2JohdV53Dn2x9HbgUIqvISu5UuFwT8R+oV
/B66+AOKivg+iSCvhh+HSv/oQNtgHeIG5xMgV8d3jXD9G4abV/g3jySuWrjXT9Z0IqvTQjqmKOR2
9nVDANRSJiSyM0Y275L4ylvrdjL8Yim0M/e9k+N+kNYfcQAzQYd/lfTmcdkn74/0qt030HQ2LxSy
A+NwqYXBuB4VkkCPvigd/s63XQNHxeHfRZs7q0iWos8Jgu9uI1zA6ZN4O4Cts2V9BF+SRqJdzrLy
1t5mzK/i0gmdsb8ds3y4b3AMet8PeT7w9sZc/A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MzDVqgEdc7DZdlm2cItrUQlry/9kVuVoApPpWX7zga11t+tLgAqain8Fhjl9Q1hFV6Rwv6WUUyOW
dL6uK1Pj4Tc0mqHyEMvAW2tHA/QcK0pphBofEd8Sd2oRBJ0l+XghTz/o5eIVzoxDF0h6fERIgAw6
PZK1iaI5d5osnKGqaJVhxQWf/M3XiOn9jCOGskyvtqNiiXNki/oAWPJNgm3Hb599C3ugMxNKGT5x
H76UXyZbcrmrFSkYz6XydewUEOb2eruDdZtf4QmJWyJ+WqAHgjSB7kcn3UfysW1iW59u7oxSpMgU
oLKWKFtXGSzN2+DVJ91qu7hIDmX5Q2X//JK4Cg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
K/zPLEhXpnRI2/6/9TRKWb3DUU+y3sEsmSsc/1avZxkXxIV/ydlWeRb3LZ94J02iLELPd9BoUHPi
cskfzwhwD/yJ0Cyne1fW8vewsSC+sdKyV2GzycEnmCbJK9/BpmBWjrBo/CST7BO4SebU3QgQeN94
k1qlxIHV+k0iNrbgN6FABNSPM6KRq8IWisUhsZWY5/9sOlOezjUlTvr760ClHx+Fz7GNZjxfLxAv
JKopjBZd4Cvq1liYbx7uxfPCKWJ4gWqRVmrS1h1kUJq832PqfDYmDn0R87v3/qBdYS7LEPYw/s10
n0p4LJpnY3/Dm85xRlaFBzhEAtRoh/jyoYOcsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
w0F6kex50xpJ1Y6Ueuz/fEZ0pG9GU8nuI033fEGIdMWncr3jfjPMDvKvEcnyd9fyddY4t3KaMDum
8VRWO4vshw6xVKiE2mTm2/i78XiQdTxccskO22DdQTJig9WrNYm5ydbRXCAef8u6CUCU2gyR2DK2
Qc6gSiGFr3lESnjTr0EPmt1VUa+0O8j7U7NP6Uhz75d0B2F1+R2xEGGbJzOyTAUC8NwI7r+9Abaj
hmxHmpBc0GCJeKEACxiAOvCqTaEFAd/dwLsW13N6q79E9JIm0hVQH4tYRpEoevBdoz3FQsLWzJoJ
ZEGCmpVNqkBR+jVlT0d8ElY3KJFJClvCtUo4BQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11120)
`pragma protect data_block
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
Bycwx91j3MnDpZ8=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
