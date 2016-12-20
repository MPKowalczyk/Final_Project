`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2016 07:39:50
// Design Name: 
// Module Name: srodek
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


module srodek(
input [7:0]in_mask,
input in_hsync,
input in_vsync,
input in_de,
input in_clk,
output x_ready,
output y_ready,
output [10:0]x,
output [10:0]y,
output [10:0]x_act,
output [10:0]y_act
//output [7:0]out_mask,
//output out_hsync,
//output out_vsync,
//output out_de,
//output out_clk
    );
    
    reg [10:0]IMG_W=11'd1280;
    reg [10:0]IMG_H=11'd720;
    
    reg [10:0]regx=11'b0;
    reg [10:0]regy=11'b0;
    
    reg eof=1'b0;
    
    reg [19:0]m00=20'b0;
    reg [10:0]xsrreg=11'b0;
    reg [10:0]ysrreg=11'b0;
    reg xvalid=1'b0;
    reg yvalid=1'b0;
    wire [29:0]m10;
    wire [29:0]m01;
    wire [29:0]xsr;
    wire [29:0]ysr;
    wire flagx;
    wire flagy;
    //wire [7:0]delmask;
    //wire deleof;
    
    always @(posedge in_clk)
    begin
        eof<=0;
        if(in_vsync==0)
        begin
            regx<=0;
            regy<=0;
        end
        else
        begin
            if(in_de==1)
            begin
                regx<=regx+1;
                if (regx==IMG_W-1)
                begin
                    regx<=0;
                    regy<=regy+1;
                    if (regy==IMG_H-1)
                    begin
                        regy<=0;
                        eof<=1;
                    end
                end
            end
        end
    end
    
    always @(posedge in_clk)
    begin
        if(eof==1) m00<=0;
        else
        begin
            if(in_mask==8'd255 && in_de==1'b1)
            begin
                m00<=m00+1;
            end
        end
    end
    
    akumulator_inst mm10
    (
    .A((in_mask==8'd255) ? regy:11'b0),
    .clk(in_clk),
    .Y(m10),
    .rst(eof),
    .ce(in_de)
    );
    
    akumulator_inst mm01
    (
    .A((in_mask==8'd255) ? regx:11'b0),
    .clk(in_clk),
    .Y(m01),
    .rst(eof),
    .ce(in_de)
    );
    /*
    delay
    #(
    .N(8),
    .DELAY(1)
    ) dmask
    (
    .clk(in_clk),
    .d(in_mask),
    .q(delmask)
    );
    
    delay
    #(
    .N(1),
    .DELAY(1)
    ) deof
    (
    .clk(in_clk),
    .d(eof),
    .q(deleof)
    );
    */
    /*
    divider y1
    (
    .aclk(in_clk),
    .s_axis_dividend_tvalid(eof),
    .s_axis_divisor_tvalid(eof),
    .s_axis_dividend_tdata(m10),
    .s_axis_divisor_tdata(m00),
    .m_axis_dout_tdata(ysr),
    //.m_axis_dout_tvalid(flagy)
    .m_axis_dout_tvalid(y_ready)
    );
    
    divider x1
    (
    .aclk(in_clk),
    .s_axis_dividend_tvalid(eof),
    .s_axis_divisor_tvalid(eof),
    .s_axis_dividend_tdata(m01),
    .s_axis_divisor_tdata(m00),
    .m_axis_dout_tdata(xsr),
    //.m_axis_dout_tvalid(flagx)
    .m_axis_dout_tvalid(x_ready)
    );
    */
    
    divider_30_20 div_y
    (
    .clk(in_clk),
    .start(eof),
    .dividend(m10),
    .divisor(m00),
    .quotient(ysr),
    .qv(flagy)
    );
    
    divider_30_20 div_x
    (
    .clk(in_clk),
    .start(eof),
    .dividend(m01),
    .divisor(m00),
    .quotient(xsr),
    .qv(flagx)
    );
    
    always @(posedge in_clk)
    begin
        if(flagx)
        begin
            xsrreg<=xsr[10:0];
        end
        if(flagy)
        begin
            ysrreg<=ysr[10:0];
        end
        xvalid<=flagx;
        yvalid<=flagy;
    end
    
    /*
    always @(posedge in_clk)
    begin
    
        if(flagx)
        begin
            xsrreg<=xsr[12:2];
            xvalid<=1'b1;
        end
        else
        begin
            xvalid<=1'b0;
        end
        if(flagy)
        begin
            ysrreg<=ysr[12:2];
            yvalid<=1'b1;
        end
        else
        begin
            yvalid<=1'b0;
        end
    end
    */
    assign x=xsrreg;
    assign y=ysrreg;
    assign x_ready=xvalid;
    assign y_ready=yvalid;
    assign x_act=regx;
    assign y_act=regy;
    
endmodule