`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2016 22:46:31
// Design Name: 
// Module Name: binary
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


module binary
#(
parameter LOW_R=200,
parameter HIGH_R=255,
parameter LOW_G=0,
parameter HIGH_G=40,
parameter LOW_B=0,
parameter HIGH_B=40
)
(
input [7:0]in_red,
input [7:0]in_green,
input [7:0]in_blue,
input in_hsync,
input in_vsync,
input in_de,
input in_clk,
//output [7:0]out_red,
//output [7:0]out_green,
//output [7:0]out_blue,
output [7:0]mask,
output out_hsync,
output out_vsync,
output out_de,
output out_clk
    );
    
    wire [7:0]bin;
    
    assign bin = (in_red >= LOW_R && in_red <= HIGH_R && in_green >= LOW_G && in_green <= HIGH_G && in_blue >= LOW_B && in_blue <= HIGH_B) ? 8'd255 : 0;
    assign mask=bin;
    assign out_de=in_de;
    assign out_hsync=~in_hsync;
    assign out_vsync=~in_vsync;
    assign out_clk=in_clk;
    
endmodule