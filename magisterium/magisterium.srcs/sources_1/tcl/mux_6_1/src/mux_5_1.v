`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2016 01:09:09
// Design Name: 
// Module Name: mux_5_1
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


module mux_6_1(
input [3:0]switch,
input [7:0]grey_in,
input [7:0]Gx,
input [7:0]Gy,
input [7:0]Hxx,
input [7:0]Hxy,
input [7:0]Hyy,
output [7:0]grey_out
);

assign grey_out=(switch==4'd0) ? grey_in:
                (switch==4'd1) ? Gx:
                (switch==4'd2) ? Gy:
                (switch==4'd3) ? Hxx:
                (switch==4'd4) ? Hxy:
                (switch==4'd5) ? Hyy : grey_in;

endmodule