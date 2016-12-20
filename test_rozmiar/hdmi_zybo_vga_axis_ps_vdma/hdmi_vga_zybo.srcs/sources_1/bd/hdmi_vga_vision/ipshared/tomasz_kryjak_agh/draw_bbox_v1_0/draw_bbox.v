`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2016 17:12:34
// Design Name: 
// Module Name: draw_bbox
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
// Rysowanie bbox'ow na obrazie. Jedenk bbox to 64 bity po 16 na kazda skladowa (troche na wyrost, ale nie da się specjalnie mniej)
//////////////////////////////////////////////////////////////////////////////////



module draw_bbox
#( parameter IMAGE_WIDTH = 1280,
   parameter IMAGE_HEIGHT = 720
)
(
    input clk,
    
    input de_in,
    input hsync_in,
    input vsync_in,
            
    input [7:0] r_in,
    input [7:0] g_in,
    input [7:0] b_in,
    
    input [63:0] bbox_0,
    input [63:0] bbox_1,
    input [63:0] bbox_2,
    //input [63:0] bbox_3,
    //input [63:0] bbox_4,
    //input [63:0] bbox_5,
    //input [63:0] bbox_6,
    //input [63:0] bbox_7,
    //input [63:0] bbox_8,
    //input [63:0] bbox_9,
                               
    
    output de_out,
    output hsync_out,
    output vsync_out,
                
    output [7:0] r_out,
    output [7:0] g_out,
    output [7:0] b_out
);


// Macierze na bbox'y
wire [15:0] bbox_xs [9:0];
wire [15:0] bbox_xe [9:0];
wire [15:0] bbox_ys [9:0];
wire [15:0] bbox_ye [9:0];


// counter generation
reg [10:0] frameW [9:0];
reg [10:0] frameH [9:0];
  
always @(posedge clk)
begin
    if (vsync_in == 1'b1)
    begin
        frameW[0] <= 11'b0;
        frameH[0] <= 11'b0;
    end
    
    if(de_in) begin
        frameW[0] <= frameW[0] + 1;
        if(frameW[0] == IMAGE_WIDTH - 1) 
        begin
            frameW[0] <= 11'b0;
            frameH[0] <= frameH[0] + 1;
            if(frameH[0] == IMAGE_HEIGHT - 1) 
            begin
                frameH[0] <= 11'b0;
            end 
        end
     end
end


wire red_blue [9:0];

// Przypisania b-box'ow

assign bbox_xs[0] = bbox_0[15:0];
assign bbox_xe[0] = bbox_0[31:16];
assign bbox_ys[0] = bbox_0[47:32];
assign bbox_ye[0] = bbox_0[62:48];
assign red_blue[0] = bbox_0[63];

assign bbox_xs[1] = bbox_1[15:0];
assign bbox_xe[1] = bbox_1[31:16];
assign bbox_ys[1] = bbox_1[47:32];
assign bbox_ye[1] = bbox_1[62:48];
assign red_blue[1] = bbox_1[63];

assign bbox_xs[2] = bbox_2[15:0];
assign bbox_xe[2] = bbox_2[31:16];
assign bbox_ys[2] = bbox_2[47:32];
assign bbox_ye[2] = bbox_2[62:48];
assign red_blue[2] = bbox_2[63];




reg [7:0] r [9:0];
reg [7:0] g [9:0];
reg [7:0] b [9:0];


reg de [9:0];
reg hsync [9:0];
reg vsync [9:0];


// -------------------------------------------------------------------------------------------------------------------------------
// bbox 0

always @(posedge clk)
begin
    
    if (((frameW[0] == bbox_xs[0] || frameW[0] == bbox_xe[0]) && (frameH[0] > bbox_ys[0] && frameH[0] < bbox_ye[0])) || 
        ((frameH[0] == bbox_ys[0] || frameH[0] == bbox_ye[0]) && (frameW[0] > bbox_xs[0] && frameW[0] < bbox_xe[0]))) 
    begin
        if ( red_blue[0] == 1'b1 )
        begin
            r[0] <= 8'd255;
            g[0] <= 0;
            b[0] <= 0;
        end
        else
        begin
            r[0] <= 0;
            g[0] <= 0;
            b[0] <= 8'd255;            
        end            
    end
    else
    begin
        r[0] <= r_in;
        g[0] <= g_in;
        b[0] <= b_in;  
    end
   
    de[0] <= de_in;
    hsync[0] <= hsync_in;
    vsync[0] <= vsync_in;
    
    frameW[1] <= frameW[0];
    frameH[1] <= frameH[0];
end


// -------------------------------------------------------------------------------------------------------------------------------
// bbox 1

always @(posedge clk)
begin
    
    if (((frameW[1] == bbox_xs[1] || frameW[1] == bbox_xe[1]) && (frameH[1] > bbox_ys[1] && frameH[1] < bbox_ye[1])) || 
        ((frameH[1] == bbox_ys[1] || frameH[1] == bbox_ye[1]) && (frameW[1] > bbox_xs[1] && frameW[1] < bbox_xe[1]))) 
    begin
        if ( red_blue[1] == 1'b1 )
        begin
            r[1] <= 8'd255;
            g[1] <= 0;
            b[1] <= 0;
        end
        else
        begin
            r[1] <= 0;
            g[1] <= 0;
            b[1] <= 8'd255;            
        end            
    end
    else
    begin
        r[1] <= r[0];
        g[1] <= g[0];
        b[1] <= b[0];  
    end
   
    de[1] <= de[0];
    hsync[1] <= hsync[0];
    vsync[1] <= vsync[0];
    
    frameW[2] <= frameW[1];
    frameH[2] <= frameH[1];
end

// -------------------------------------------------------------------------------------------------------------------------------
// bbox 2
always @(posedge clk)
begin
    
    if (((frameW[2] == bbox_xs[2] || frameW[2] == bbox_xe[2]) && (frameH[2] > bbox_ys[2] && frameH[2] < bbox_ye[2])) || 
        ((frameH[2] == bbox_ys[2] || frameH[2] == bbox_ye[2]) && (frameW[2] > bbox_xs[2] && frameW[2] < bbox_xe[2]))) 
    begin
        if ( red_blue[2] == 1'b1 )
        begin
            r[2] <= 8'd255;
            g[2] <= 0;
            b[2] <= 0;
        end
        else
        begin
            r[2] <= 0;
            g[2] <= 0;
            b[2] <= 8'd255;            
        end            
    end
    else
    begin
        r[2] <= r[1];
        g[2] <= g[1];
        b[2] <= b[1];  
    end
   
    de[2] <= de[1];
    hsync[2] <= hsync[1];
    vsync[2] <= vsync[1];
    
    frameW[3] <= frameW[2];
    frameH[3] <= frameH[2];
end






			
assign de_out = de[2];
assign hsync_out = hsync[2];
assign vsync_out = vsync[2];

assign r_out = r[2];
assign g_out = g[2];
assign b_out = b[2];


	

    
    
    
endmodule
