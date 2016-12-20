`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:47 05/11/2016 
// Design Name: 
// Module Name:    module5x5 
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
module median
#(parameter H_SIZE=1280
)
(
input [7:0]in_mask,
input hsync,
input vsync,
input de,
input clk,
output [7:0]value,
output hsync_out,
output vsync_out,
output de_out,
output out_clk
);

wire mask;

assign mask=in_mask[7];

wire [3:0]stream;
assign stream={mask,de,hsync,vsync};
reg context_valid;
wire outd;
wire outh;
wire outv;

reg [3:0]D11=4'b0;
reg [3:0]D12=4'b0;
reg [3:0]D13=4'b0;
reg [3:0]D14=4'b0;
reg [3:0]D15=4'b0;

reg [3:0]D21=4'b0;
reg [3:0]D22=4'b0;
reg [3:0]D23=4'b0;
reg [3:0]D24=4'b0;
reg [3:0]D25=4'b0;

reg [3:0]D31=4'b0;
reg [3:0]D32=4'b0;
reg [3:0]D33=4'b0;
reg [3:0]D34=4'b0;
reg [3:0]D35=4'b0;

reg [3:0]D41=4'b0;
reg [3:0]D42=4'b0;
reg [3:0]D43=4'b0;
reg [3:0]D44=4'b0;
reg [3:0]D45=4'b0;

reg [3:0]D51=4'b0;
reg [3:0]D52=4'b0;
reg [3:0]D53=4'b0;
reg [3:0]D54=4'b0;
reg [3:0]D55=4'b0;

reg [2:0]sum1=3'b0;
reg [2:0]sum2=3'b0;
reg [2:0]sum3=3'b0;
reg [2:0]sum4=3'b0;
reg [2:0]sum5=3'b0;

reg de1=1'b0;
reg de2=1'b0;
reg de3=1'b0;
reg de4=1'b0;
reg de5=1'b0;

reg [4:0]sumf=5'b0;

wire [15:0]dlugaout;

delayLinieBRAM_WP dluga
(
.clk(clk),
.rst(1'b0),
.ce(1'b1),
.din({D45,D35,D25,D15}),
.dout(dlugaout),
.h_size(H_SIZE-5)
);

always @(posedge clk)
begin
	D11<=stream;
	D12<=D11;
	D13<=D12;
	D14<=D13;
	D15<=D14;
	
	D21<=dlugaout[3:0];
	D22<=D21;
	D23<=D22;
	D24<=D23;
	D25<=D24;
	
	D31<=dlugaout[7:4];
	D32<=D31;
	D33<=D32;
	D34<=D33;
	D35<=D34;
	
	D41<=dlugaout[11:8];
	D42<=D41;
	D43<=D42;
	D44<=D43;
	D45<=D44;
	
	D51<=dlugaout[15:12];
	D52<=D51;
	D53<=D52;
	D54<=D53;
	D55<=D54;
	
	sum1<=D11[3]+D21[3]+D31[3]+D41[3]+D51[3];
	sum2<=D12[3]+D22[3]+D32[3]+D42[3]+D52[3];
	sum3<=D13[3]+D23[3]+D33[3]+D43[3]+D53[3];
	sum4<=D14[3]+D24[3]+D34[3]+D44[3]+D54[3];
	sum5<=D15[3]+D25[3]+D35[3]+D45[3]+D55[3];
	
    de1<=D11[2]&&D21[2]&&D31[2]&&D41[2]&D51[2];
    de2<=D12[2]&&D22[2]&&D32[2]&&D42[2]&&D52[2];
    de3<=D13[2]&&D23[2]&&D33[2]&&D43[2]&&D53[2];
    de4<=D14[2]&&D24[2]&&D34[2]&&D44[2]&&D54[2];
    de5<=D15[2]&&D25[2]&&D35[2]&&D45[2]&&D55[2];
	
	sumf<=sum1+sum2+sum3+sum4+sum5;
	
	context_valid<=de1&&de2&&de3&&de4&&de5;
end
/*
delay
#(
.N(4),
.DELAY(2)
) del
(
.clk(clk),
.d({D11[2]&&D12[2]&&D13[2]&&D14[2]&&D15[2]&&D21[2]&&D22[2]&&D23[2]&&D24[2]&&D25[2]&&D31[2]&&D32[2]&&D33[2]&&D34[2]&&D35[2]&&D41[2]&&D42[2]&&D43[2]&&D44[2]&&D45[2]&&D51[2]&&D52[2]&&D53[2]&&D54[2]&&D55[2],D33[2],D33[1],D33[0]}),
.q({context_valid,outd,outh,outv})
);
*/

assign value = (sumf > 5'd12) ? 8'd255 : 0;

assign out_clk=clk;
assign hsync_out=D35[1];
assign vsync_out=D35[0];
assign de_out=D35[2];

endmodule
