`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2016 00:14:25
// Design Name: 
// Module Name: magisterium
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


module magisterium (
    inout wire [14:0]DDR_addr,
    inout wire [2:0]DDR_ba,
	inout wire DDR_cas_n,
	inout wire DDR_ck_n,
	inout wire DDR_ck_p,
	inout wire DDR_cke,
	inout wire DDR_cs_n,
	inout wire [3:0]DDR_dm,
	inout wire [31:0]DDR_dq,
	inout wire [3:0]DDR_dqs_n,
	inout wire [3:0]DDR_dqs_p,
	inout wire DDR_odt,
	inout wire DDR_ras_n,
	inout wire DDR_reset_n,
	inout wire DDR_we_n,
	inout wire FIXED_IO_ddr_vrn,
	inout wire FIXED_IO_ddr_vrp,
	inout wire [53:0]FIXED_IO_mio,
	inout wire FIXED_IO_ps_clk,
	inout wire FIXED_IO_ps_porb,
	inout wire FIXED_IO_ps_srstb,
	output wire [0:0]HDMI_OEN,
	input wire TMDS_clk_n,
	input wire TMDS_clk_p,
	input wire [2:0]TMDS_data_n,
	input wire [2:0]TMDS_data_p,
	input wire UART_0_rxd,
	output wire UART_0_txd,
	input wire [3:0]sws_4bits_tri_i,
	input reg clk,
	inout wire ddc_scl_io,
	inout wire ddc_sda_io,
`ifdef SIM
    input wire trigger_algorithm,
    input wire calc_gen_clk,
    input wire pix_gen_clk,
    input wire RGB_hsync,
    input wire RGB_vsync,
    input wire [23:0] RGB_in,
    input wire RGB_de,
    input wire ps_srstb,
    input wire ps_clk,
    input wire ps_porb,
    
`endif
	output wire [0:0]hdmi_hpd,
	output wire [3:0]leds_4bits_tri_o,
	output wire [4:0]vga_b,
	output wire [5:0]vga_g,
	output wire vga_hs,
	output wire [4:0]vga_r,
	output wire vga_vs
);




wire        rgb_active_video_in;
wire [23:0] rgb_data_in;
wire        rgb_hsync_in;
wire        rgb_vsync_in;

wire        converted_hsv_active_video;
wire [24:0] converted_hsv_data;
wire        converted_hsv_hsync;
wire        converted_hsv_vsync;

wire        converted_hsv_active_video_out;
wire        converted_hsv_hsync_out;
wire        converted_hsv_vsync_out;

reg [31:0][31:0] data_to_write;
reg [31:0] address_to_write=32'h80;
reg [31:0] address_to_read=32'h0;
wire [31:0] data_to_read_upper;
wire [31:0] data_to_read_lower;
wire data_valid;

reg [3:0] leds;

assign leds_4bits_tri_o = leds;

wire PixelClk;
wire ps_ddr_aclk;
wire calc_clk;
wire done;

reg ps_ddr_init=0;
reg [3:0] total_writes=0;
reg done_d=0; 
reg [31:0] clk_counter=0;
always @(posedge ps_ddr_aclk) begin
    if((clk_counter==32'd2000000000) & (total_writes<=4'hf)) begin             
        address_to_write<=address_to_write+32'h10;
        address_to_read<=address_to_read+32'h10;
        data_to_write<={256{total_writes}};
        clk_counter<=32'd0;
        leds<=leds+1;
        ps_ddr_init<=1;
    end else begin
        done_d<=done;
        if(({done_d,done}==2'b01) & (total_writes<=4'hf)) begin
            total_writes<=total_writes+1;
        end else begin
            total_writes<=total_writes;
        end
        clk_counter=clk_counter+1;
        ps_ddr_init<=0;
    end
end
 
ps_top ps_top_i(
    .DDR_addr           (DDR_addr         ),
    .DDR_ba             (DDR_ba           ),
    .DDR_cas_n          (DDR_cas_n        ),
    .DDR_ck_n           (DDR_ck_n         ),
    .DDR_ck_p           (DDR_ck_p         ),
    .DDR_cke            (DDR_cke          ),
    .DDR_cs_n           (DDR_cs_n         ),
    .DDR_dm             (DDR_dm           ),
    .DDR_dq             (DDR_dq           ),
    .DDR_dqs_n          (DDR_dqs_n        ),
    .DDR_dqs_p          (DDR_dqs_p        ),
    .DDR_odt            (DDR_odt          ),
    .DDR_ras_n          (DDR_ras_n        ),
    .DDR_reset_n        (DDR_reset_n      ),
    .DDR_we_n           (DDR_we_n         ),
    .FIXED_IO_ddr_vrn   (FIXED_IO_ddr_vrn ),
    .FIXED_IO_ddr_vrp   (FIXED_IO_ddr_vrp ),
    .FIXED_IO_mio       (FIXED_IO_mio     ),
    .FIXED_IO_ps_clk    (FIXED_IO_ps_clk  ),
    .FIXED_IO_ps_porb   (FIXED_IO_ps_porb ),
    .FIXED_IO_ps_srstb  (FIXED_IO_ps_srstb),
    .HDMI_OEN           (HDMI_OEN         ),
    .TMDS_clk_n         (TMDS_clk_n       ),
    .TMDS_clk_p         (TMDS_clk_p       ),
    .TMDS_data_n        (TMDS_data_n      ),
    .TMDS_data_p        (TMDS_data_p      ),
    .UART_0_rxd         (UART_0_rxd       ),
    .UART_0_txd         (UART_0_txd       ),
    .sws_4bits_tri_i    (sws_4bits_tri_i  ),
    .clk                (clk              ),
    .ddc_scl_io         (ddc_scl_io       ),
    .ddc_sda_io         (ddc_sda_io       ),
`ifdef SIM
    .ps_srstb           (ps_srstb         ),
    .ps_clk             (ps_clk           ),
    .ps_porb            (ps_porb          ),
`endif
    .hdmi_hpd           (hdmi_hpd         ),
    .leds_4bits_tri_o   (leds_4bits_tri_o ),
    .vga_b              (vga_b            ),
    .vga_g              (vga_g            ),
    .vga_hs             (vga_hs           ),
    .vga_r              (vga_r            ),
    .vga_vs             (vga_vs           ),

    .PixelClk           (PixelClk         ),
    .ps_ddr_aclk        (ps_ddr_aclk      ),
    .calc_clk           (calc_clk         ),
    .ps_ddr_init_axi_txn(ps_ddr_init      ),
    .done               (done             ),
    .data_to_write      (data_to_write    ),
    .address_to_write   (address_to_write ),    
    .address_to_read    (address_to_read  ),    
    .data_to_read_upper (data_to_read_upper),
    .data_to_read_lower (data_to_read_lower),
    .ps_ddr_rvalid      (data_valid),
    .rgb_active_video_in    (rgb_active_video_in),
    .rgb_data_in            (rgb_data_in),
    .rgb_hsync_in           (rgb_hsync_in),
    .rgb_vsync_in           (rgb_vsync_in)

);
endmodule

