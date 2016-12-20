`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2016 17:26:26
// Design Name: 
// Module Name: counter_rst_edge
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

module counter_rst_edge
#(
parameter width=13
)
(
input clk,
input rst,
output [width-1:0]Q
);

reg prev_rst;
reg [width-1:0]counter;
reg [width-1:0]out;

always @(posedge(clk))
begin
    if(rst && ~prev_rst)
    begin
        out<=counter;
        counter<=13'b0;
    end
    else counter<=counter+1;
    prev_rst<=rst;
end

assign Q=out;

endmodule