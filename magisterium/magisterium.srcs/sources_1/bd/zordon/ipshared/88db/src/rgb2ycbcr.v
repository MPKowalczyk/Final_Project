`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:33 04/06/2016 
// Design Name: 
// Module Name:    rgb2ycbcr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module grey_scale
(
input [7:0]red,
input [7:0]green,
input [7:0]blue,
input hsync_in,
input vsync_in,
input de_in,
input clk_in,
output [7:0]grey,
output hsync_out,
output vsync_out,
output de_out,
output clk_out
);

reg [11:0]coefR=12'b001101100111;
reg [11:0]coefG=12'b101101110001;
reg [11:0]coefB=12'b000100101000;

wire [7:0]mR;
wire [7:0]mG;
wire [7:0]mB;
wire [7:0]mB_del;

wire [7:0]s_RG;

//mul latency==2
//sum1 latency==2

mul mulR
(
.a(red),
.b(coefR),
.clk(clk_in),
.p(mR)
);

mul mulG
(
.a(green),
.b(coefG),
.clk(clk_in),
.p(mG)
);

mul mulB
(
.a(blue),
.b(coefB),
.clk(clk_in),
.p(mB)
);

delay
#(
.N(8),
.DELAY(2)
) del_B
(
.clk(clk_in),
.d(mB),
.q(mB_del)
);

sum_grey sumRG
(
.a(mR),
.b(mG),
.clk(clk_in),
.s(s_RG)
);

sum_grey sumRGB
(
.a(s_RG),
.b(mB_del),
.clk(clk_in),
.s(grey)
);

delay
#(
.N(1),
.DELAY(5)
) del_hsync
(
.clk(clk_in),
.d(hsync_in),
.q(hsync_out)
);

delay
#(
.N(1),
.DELAY(5)
) del_vsync
(
.clk(clk_in),
.d(vsync_in),
.q(vsync_out)
);

delay
#(
.N(1),
.DELAY(5)
) del_de
(
.clk(clk_in),
.d(de_in),
.q(de_out)
);

assign clk_out=clk_in;

endmodule