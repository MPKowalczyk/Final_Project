// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Sat Oct 22 22:36:35 2016
// Host        : DESKTOP-4G87URT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/magisterium/magisterium.srcs/sources_1/ip/mult_19_19/mult_19_19_sim_netlist.v
// Design      : mult_19_19
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_19_19,mult_gen_v12_0_10,{}" *) (* core_generation_info = "mult_19_19,mult_gen_v12_0_10,{x_ipProduct=Vivado 2015.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=10,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=1,C_A_WIDTH=19,C_A_TYPE=0,C_B_WIDTH=19,C_B_TYPE=0,C_OUT_HIGH=37,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0_10,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module mult_19_19
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [18:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [18:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [37:0]P;

  wire [18:0]A;
  wire [18:0]B;
  wire CLK;
  wire [37:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "19" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "19" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "37" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_19_19_mult_gen_v12_0_10 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "19" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "19" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "37" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_10" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_19_19_mult_gen_v12_0_10
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [18:0]A;
  input [18:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [37:0]P;
  output [47:0]PCASC;

  wire [18:0]A;
  wire [18:0]B;
  wire CE;
  wire CLK;
  wire [37:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "19" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "19" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "37" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_19_19_mult_gen_v12_0_10_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
VllxWgRrugvi2fu1Kh4iL+ZkJA5TtZ+LGWCqHHHE1lCRjHiMOz5M3L3abI/BjM/wR5F/V2K65Bhs
texqqBOYvA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
MBYsuh9EGjKBlxR/81kh3KOqi8FbrckSRPHKXnFdQ+xl0tmxawBysww69vxfgtxFNJiAbn7g4XTl
ZKY4IL7I/Xtd8hfbyrNLd91vyaOSjApJ4lvzulVzGXiQnK2HerB/fsbdlHNBia244t0PdPr6F9xO
hHL7LtyvIyJ5GOAsQME=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ZB+/R4dft7sjBtbt9KO0IC7JOAWrN2QUGDgE3tSIfDrQl4/J/iMmI3GwLQ7XorjfXJUQLlhgiEPW
+ugw+Ogpzl70RHSRn9wgBx8DxM5Ks50Auo/f7WTgCjB3kGLNv6mQbSMau1NzNOYVnZl8Rh6tHtUB
bOgS2tSRNq6hoywBzhlOhNF+WAFeAqlCivZUu+PEkHo6E5Tjow/fdsFGqDgxNX7oeLWmPsDpsKJ3
QcctpNHijjAQG5KD1D89K79Bra/gcXsqEUhln1UXEOlRrwotkgtYjLlDPa9a2oR5jbm9OA3sioA3
hmA55rKietj5N1L9Vfefe1hITEgIAfywcKZrYQ==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
4G3TtWY+qMIHXmGANxyz04ejYEVMyDiVta/i/y1q0B2PiS/6o154uUJJtYZ6VwWcRLRFBS+KSUQS
1xM/H/dAMEXDwu6MoUZym3rNyVU2gMZDpStmQOJh5oqpOfWgd+pOZrno4Pu+I5fLHhcoKhrqt+Q2
EW8gZ8651ee7nTJiYJg=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC15_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
QMt+dKNUhNRuG/0VSi/RJghtOHEDAWuXQw6E5JDXlQ+PxklRNo5tNEiJcBcfgCuhCDCJzTxIDZpL
Zl2WXMeL7ut1Y4eRZ+DtqIV3uZkJsDlnZiNL2aV/OG/UVW7kjI0hreqRKfFgsfU5U+hz59Oe8dy/
F/kn0Lm3Jd3tuBZ/cUT+xg0TOmz94aVFbqONwZkaZwyCPsAn9HIeLYFAVy/VcPKduQSMJPBQ7PdH
w52z7LHHlPlI921JzVq774O0fZa3eT3VxX64elGzcrajGaZVnvYHnXYf72axtRbmk6RBrwG4/Wdm
fqtbdWjOojWTqRzPE4EY4JSbY+Rf1P4x2S8noQ==


`pragma protect key_keyowner = "ATRENTA", key_keyname= "ATR-SG-2015-RSA-3", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
S52hBEv73jPEAyMZcPN7R3PqCrzyV5A5nvi4Ta3EFdSf6V7h3OcWhpCvzJxlzMTuMZtXKveuy3Zq
W9cfkWUM11Wf+R5nPff+MWuKk5MueJZyp0EkRBwkDplwASqXoGcn/EZEI7q64lHjwiIUtpjtnml7
JKEMcCxna7gxNb9J2HLVpNoU5Tzc7ivVytTQ3/lZMzNHyYTf1AXOId2TJN2zNXVZI+CyJMx22gz6
BZhUfxy5+fezMv+cSMX2/VIk8lkzVKR0FmReScs4LG8lxvY227btFNDIZGwT3yDmdzGqMabsx6WW
nwWes9N7WA9TVKvqvODIAGKUZzAcKr0sfSeLJw==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
dEk6V7/6ghmU3ckcWxmr6fuObtzyiBfWA8+1LzSKjd876+DttTPuj1lCet1bk9SlJhD0FUgO4ynw
n79kZoB6r6gRk7KL7flK08mBBkz4eW7xYQ1fz8BmsQP0nF8GWFuo/GWGzDvcbPLXU2uSCAkl8cIY
WKmdQBf/jeYDFHTvDVJQJvaDb8W2PAetMjukiDGviYTuSvjwk0LEoO8lttwmmkegE1E1sw3BSqZ8
vhd0Zfdu5ljEnYrsum+FODTSPjzwO4OEztDnkmZYyvwxkHLV56EZ23SExzXoQVMhs4vjuL0ryp49
ngCjs5WpR7oa68T7wIqrmzVRJR5TUltGFAC1kQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
w2+lnT8PqNWgXnlpliy4TaMifwADmt4b9hKX0fZoC0b+Kfh97ulZSeYmFuoX4+ddhO/sXnZZ4zt0
wnpJXFZO3oIwq8goBoJISf9uS4lXI8ItdB4i89uFP1lfZhPWZkMOg0QpWgtPBOu/BHG9Z55W00rj
hxMJa0ZrP301fv82duuU7rZ5CeugWN6bKNTV6eI1/Q7HVupCaxmdsrl4+d4qYhkkdf2RSw1JZi1c
XM5bmJVekqh22oyE12GISNrMrHGLVWO4fOBuPUaL69+EjSSA6qbhx1UL+YvBBo6IEhI1I4ZZpTAo
sO6zr2NXUAaM7fT1a+8YonmpKW/XbSl+vieSng==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13840)
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
