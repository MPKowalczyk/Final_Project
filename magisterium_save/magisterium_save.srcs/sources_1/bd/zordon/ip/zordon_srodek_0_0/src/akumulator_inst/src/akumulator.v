`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2016 18:37:03
// Design Name: 
// Module Name: akumulator
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


module akumulator(
input [10:0]A,
input clk,
input ce,
input rst,
output [29:0]Y
    );
    
    reg [29:0]register=30'b0;
    wire [29:0]fsum;
    
    sum suma(
    .A(A),
    .B(register),
    .S(fsum)
    );
    
    always @(posedge clk)
    begin
        if(rst==1'b1)
        begin
            register<=28'b0;
        end
        else
        begin
            if(ce==1'b1)
            begin
                register<=fsum;
            end
        end
    end
    
    assign Y=register;
    
endmodule
