// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Fri Oct 28 01:33:34 2016
// Host        : Zordon running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/OneDrive/mag/MSc_ZYBO/magisterium16/magisterium.srcs/sources_1/ip/mult_17_17/mult_17_17_sim_netlist.v
// Design      : mult_17_17
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_17_17,mult_gen_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_12,Vivado 2016.3" *) 
(* NotValidForBitStream *)
module mult_17_17
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [16:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [16:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [33:0]P;

  wire [16:0]A;
  wire [16:0]B;
  wire CLK;
  wire [33:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "17" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "17" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "33" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_17_17_mult_gen_v12_0_12 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "17" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "17" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "33" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_12" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_17_17_mult_gen_v12_0_12
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [16:0]A;
  input [16:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [33:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [16:0]A;
  wire [16:0]B;
  wire CLK;
  wire [33:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "17" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "17" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "33" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_17_17_mult_gen_v12_0_12_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
ptQ11ybvPhWFWTGrQo+7aGiIrH8JSyStYCUMOokDd+PPciOFrFMMChXZiWtXJpOf7mbM0kEZiv4j
8DmUfBzUqA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
h7OV9pYIwlKexYbVHsWdzIEKTz/iMtv4WoHaiiFghx8qJgOhdd3wDRYkR/B3E7hVYy2COcm5APup
qDYlt3IyeqL2N2RRoMmBVxAFJV6hCj9YEbUb0otyQAVPBaiI1FPjO5xFS/hWO1jK5vhJcsLkQea9
6DEIF8FtNNea1Mq/r2g=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
yy9Y6935bfig13W64uvBPEigKN5XmZP8d556jHobEKImEuxxAt50ZM5SYJfQ1cgV5QpGyGKq18LA
Ie4kVwsXuT7UsN6x8vh4jEf9eSPrjCkgrPb99+DcdRsMyS00rDCx+sglhqDRhi5OxUEkR5awg1YX
vN35O9p+48WxNYR2UC8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LZ+Jei6Dhl0h8Ft9kcSvaV7R4LftS48PATOUDxiNHixlA4BISf+lTaHLokYqG/GSOnLHxh8j6OxI
CW5SQEIloeTqRLfWEkpRzf9BKkCQOnwQZDJUvuYvW7WYQ6oQjERuGCZQVnkgpor3EtMfWSZ8YsAx
azYt49bgzZfdUTCKUgeEVEMKVshHGMBIhvTs9KkcKPz8JGeMDL5oeYdFzdkVYjPP4aev0U6zPMBs
JZ9E/7nvtBBV2vKhLY7U3X7iTZ1ePFeESc78t32tjGtG0yeSiNZq81Tw6u3srMRLOBkZoVVnCxhr
9QuVk5MuIbODepMZeZdBdNAQI/tre1Gq0gszrw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ngLIkvfW2Uts9POUsqaNJVpzIpWiCvRaKpZydG/SMwUuE3+JnTqAnNfvtZqO6SfqEzFsZu81jGwf
i3H8ALoDKBU2C9TYxmcx8GPDKo7Yp6Kvwm6+7rgm/u3Kwz3nqXCsy9/XYu++7beiX7e7DQVq3SpR
9U6+c/Hvxf1pFrCZZ5syxFGQMW6m7t5l1IO0A29eP4lBomyF+TQfc+IF8gSheDIJBglOjgfGNB6w
5Y8qVfUIS1UEnBiw/87uMLVmf6BpaHABhPRyfJCdqk8lnmkNqRYgn+04VHoeSBQK3RrLON/eSu0R
m8/U44v2OuxzhQtGethkZXEmkn07ZADBgPU1fA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T8B0w4NG7VzeSrv6OfcmA/Seybv/XseY7U8GEUORMIAwScQx2Z03UxA5e8Bhk/8hBThPu3c4qGXU
eoaU8I28PfmXT+H374KJfpPGeml3gk2eoTP/G4knHDpHTMJM8WdxRt8HBkMNrVGCTjNNJJiNL4x4
5MLjx5MIEs4FN84QBEtV7OaK2Db/KUAZVg9taAs96bhLMwoWhqovfFQMq44lVcgN45iFCZSvOMe9
YRTMUjxireq4/GqruP/WKQ3+VOBTyqfeHyw1WEd0W5Ihmbf/LsRlgkVDHAeb1ngltDXSSiOQpOC8
ZwXOYiOCNlJqGiE2Ffd8kQMyoibJpcoCKTzd6w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
aWsxpd+Cy/aUaJ4CUrCQr6ktiCs6V6j5RvEySXG7UG+gRWAQ+A/szbXAfh2EwQCezjjXcXb6UZfD
sneVn4pLp7HXoDMCx8sVvutkHPgvexbif+CaVHbLuIJgs7aWWKU1BX3K0pFWV9d5TRyGtH667YfL
mNXwSYGIzMlxBkPTn05/RClGfQsotUl2vvDY+YdpUww48TjQOnpVUMKym0sO/pNi0+LZK+oRkE4i
6BpB3Y9rbWB8SoD2qGZNhE/+tpPki5g0OeiJvxJYnmUrm3dl8EeXaUH8flsYeGcZQTdsWa7MUo8P
Tlzf5lCIo0k+mPX0gZh5EBEzaQR0kqvsXYYpiA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
DeTZfLH5z062ky61EW21LD+71yBS8Azw+eA5jl4svEVOiFpHHgmhUKNM5Tx+s7OXp9ywQhY6lspL
8zilqRSzQANjCjqLMwBBPVp37RhT6p5o2kLMApMvdlDtw8sDMkzfYl2bRlTFO7RW16J0g6k9XNc+
E3KkOG1J94OWEnWEzsjQQPSXEh4v1iWJuTtAsMJrJ3ldfgdpA5DHAu5TOmwzbiQ0AYw8ZpGbps9p
+DKmqb4liMkRwg4Sh2q4UIMrA1U9S8AWqB3+Jikgq1dzNG6/quMDXG/B/OYRNcoLRWvtejhPeBoZ
VV96BTtesRu9Zhh1L1/IitDfws2T1T/4111ctQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7216)
`pragma protect data_block
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
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
