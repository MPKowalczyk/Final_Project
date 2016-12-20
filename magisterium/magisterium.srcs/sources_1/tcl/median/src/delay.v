`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:52 03/06/2016 
// Design Name: 
// Module Name:    delay 
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
module delay
#(
	parameter N=5,
	parameter DELAY=8
)
(
	input clk,
	//input ce,
	input [N-1:0]d,
	output [N-1:0]q
);
wire [N-1:0] chain [DELAY:0];
assign chain[0]=d;
assign q=chain[DELAY];

genvar i;
generate
	for(i=0;i<DELAY;i=i+1)
	begin
		register #(.N(N)) reg_i
		(
			.clk(clk),
			//.ce(ce),
			.d(chain[i]),
			.q(chain[i+1])
		);
	end
endgenerate

endmodule

module register
#(
parameter N=5
)
(
input clk,
//input ce,
input [N-1:0]d,
output [N-1:0]q
);

reg [N-1:0]val=0;

always @(posedge clk)
begin
	/*if(ce)*/ val<=d;
	//else val<=val;
end

assign q=val;

endmodule
