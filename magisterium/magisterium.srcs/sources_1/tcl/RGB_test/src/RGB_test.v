`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2015 10:18:07
// Design Name: 
// Module Name: RGB_test
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


module RGB_test(
    input [7:0] in_R,
    input [7:0] in_G,
    input [7:0] in_B,
    input in_HSync,
    input in_VSync,
    input in_DE,
    input in_PClk,
    input [1:0] switch,
    
    output [7:0] out_R,
    output [7:0] out_G,
    output [7:0] out_B,
    output out_HSync,
    output out_VSync,
    output out_DE,
    output out_PClk
    );
    
    assign out_R = (switch == 2'b00) ? in_R :
                   (switch == 2'b01) ? in_R : 
                   (switch == 2'b10) ? 8'b0 :
                                       8'b0;
                                       
    assign out_G = (switch == 2'b00) ? in_G :
                   (switch == 2'b01) ? 8'b0 : 
                   (switch == 2'b10) ? in_G :
                                       8'b0;    
    
    assign out_B = (switch == 2'b00) ? in_B :
                   (switch == 2'b01) ? 8'b0 : 
                   (switch == 2'b10) ? 8'b0 :
                                       in_B;
                                       
    assign out_HSync = in_HSync;
    assign out_VSync = in_VSync;
    assign out_DE = in_DE;
    assign out_PClk = in_PClk;
    
endmodule

