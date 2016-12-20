`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2016 17:41:34
// Design Name: 
// Module Name: gradient_hessian
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module gradient_hessian
#(parameter H_SIZE=1650
)
(
input [7:0]grey_in,
input hsync_in,
input vsync_in,
input de_in,
input clk_in,
output [7:0]grey_out,
output [7:0]Gx,
output [7:0]Gy,
output [7:0]Hxx,
output [7:0]Hxy,
output [7:0]Hyy,
output hsync_out,
output vsync_out,
output de_out,
output clk_out
);

wire [10:0]stream;
wire [43:0]bram_out;

assign stream={grey_in,de_in,hsync_in,vsync_in};

reg [10:0]D11=11'b0;
reg [10:0]D12=11'b0;
reg [10:0]D13=11'b0;
reg [10:0]D14=11'b0;
reg [10:0]D15=11'b0;

reg [10:0]D21=11'b0;
reg [10:0]D22=11'b0;
reg [10:0]D23=11'b0;
reg [10:0]D24=11'b0;
reg [10:0]D25=11'b0;

reg [10:0]D31=11'b0;
reg [10:0]D32=11'b0;
reg [10:0]D33=11'b0;
reg [10:0]D34=11'b0;
reg [10:0]D35=11'b0;

reg [10:0]D41=11'b0;
reg [10:0]D42=11'b0;
reg [10:0]D43=11'b0;
reg [10:0]D44=11'b0;
reg [10:0]D45=11'b0;

reg [10:0]D51=11'b0;
reg [10:0]D52=11'b0;
reg [10:0]D53=11'b0;
reg [10:0]D54=11'b0;
reg [10:0]D55=11'b0;

reg signed [8:0]Gx_reg=9'b0;
reg signed [8:0]Gy_reg=9'b0;
reg signed [9:0]Hxx_reg=10'b0;
reg signed [9:0]Hxy_reg=10'b0;
reg signed [9:0]Hyy_reg=10'b0;

reg signed [8:0]Gx_reg_del=9'b0;
reg signed [8:0]Gy_reg_del=9'b0;
reg signed [9:0]Hxx_reg_del=10'b0;
reg signed [9:0]Hxy_reg_del=10'b0;
reg signed [9:0]Hyy_reg_del=10'b0;

reg context_valid1=1'b0;
reg context_valid2=1'b0;
reg context_valid3=1'b0;
reg context_valid4=1'b0;
reg context_valid5=1'b0;
reg context_valid=1'b0;

delayLinieBRAM_WP BRAM
(
.clk(clk_in),
.rst(1'b0),
.ce(1'b1),
.din({D45,D35,D25,D15}),
.dout(bram_out),
.h_size(H_SIZE-5)
);

always @(posedge clk_in)
begin
	D11<=stream;
	D12<=D11;
	D13<=D12;
	D14<=D13;
	D15<=D14;
	
	D21<=bram_out[10:0];
	D22<=D21;
	D23<=D22;
	D24<=D23;
	D25<=D24;
	
	D31<=bram_out[21:11];
	D32<=D31;
	D33<=D32;
	D34<=D33;
	D35<=D34;
	
	D41<=bram_out[32:22];
	D42<=D41;
	D43<=D42;
	D44<=D43;
	D45<=D44;
	
	D51<=bram_out[43:33];
	D52<=D51;
	D53<=D52;
	D54<=D53;
	D55<=D54;
	
	Gx_reg<=D32[10:3]-D34[10:3];
	Gy_reg<=D23[10:3]-D43[10:3];
	Hxx_reg<=D31[10:3]+D35[10:3]-2*D33[10:3];
	Hxy_reg<=D22[10:3]+D44[10:3]-D24[10:3]-D42[10:3];
	Hyy_reg<=D13[10:3]+D53[10:3]-2*D33[10:3];
	
	Gx_reg_del<=Gx_reg;
    Gy_reg_del<=Gy_reg;
    Hxx_reg_del<=Hxx_reg;
    Hxy_reg_del<=Hxy_reg;
    Hyy_reg_del<=Hyy_reg;
	
	context_valid1<=D11[2]&&D12[2]&&D13[2]&&D14[2]&&D15[2];
	context_valid2<=D21[2]&&D22[2]&&D23[2]&&D24[2]&&D25[2];
	context_valid3<=D31[2]&&D32[2]&&D33[2]&&D34[2]&&D35[2];
	context_valid4<=D41[2]&&D42[2]&&D43[2]&&D44[2]&&D45[2];
	context_valid5<=D51[2]&&D52[2]&&D53[2]&&D54[2]&&D55[2];
	context_valid<=context_valid1&&context_valid2&&context_valid3&&context_valid4&&context_valid5;

end

assign grey_out=(context_valid==1'b1) ? D35[10:3]:8'b0;
assign de_out=D35[2];
assign hsync_out=D35[1];
assign vsync_out=D35[0];
assign clk_out=clk_in;

assign Gx=(context_valid==1'b1) ? Gx_reg_del[7:0]:8'b0;
assign Gy=(context_valid==1'b1) ? Gy_reg_del[7:0]:8'b0;
assign Hxx=(context_valid==1'b1) ? Hxx_reg_del[8:1]:8'b0;
assign Hxy=(context_valid==1'b1) ? Hxy_reg_del[8:1]:8'b0;
assign Hyy=(context_valid==1'b1) ? Hyy_reg_del[8:1]:8'b0;

endmodule