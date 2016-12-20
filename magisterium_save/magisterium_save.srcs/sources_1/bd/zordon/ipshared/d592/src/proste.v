`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:49 05/09/2016 
// Design Name: 
// Module Name:    proste 
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
module proste
(
input [10:0]xsr,
input [10:0]ysr,
input [10:0]xact,
input [10:0]yact,
input [7:0]mask,
input in_hsync,
input in_vsync,
input in_de,
input in_clk,
output [7:0]outred,
output [7:0]outgreen,
output [7:0]outblue,
output out_hsync,
output out_vsync,
output out_de,
output out_clk
);

assign outred=((xact==xsr || yact==ysr) ? 8'hff:mask);
assign outgreen=((xact==xsr || yact==ysr) ? 8'd0:mask);
assign outblue=((xact==xsr || yact==ysr) ? 8'd0:mask);
assign out_hsync=~in_hsync;
assign out_vsync=~in_vsync;
assign out_de=in_de;
assign out_clk=in_clk;

endmodule