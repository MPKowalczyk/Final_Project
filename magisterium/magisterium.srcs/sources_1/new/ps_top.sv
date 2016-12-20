module ps_top(
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
    output wire vga_vs,

    input wire ps_ddr_init_axi_txn,
    output wire done,

    output wire        rgb_active_video_in,
    output wire [23:0] rgb_data_in,
    output wire        rgb_hsync_in,
    output wire        rgb_vsync_in,
    
    
    input wire [31:0][31:0] data_to_write,
    input wire [31:0] address_to_write,
    input wire [31:0] address_to_read,
    output wire [31:0] data_to_read_upper,
    output wire [31:0] data_to_read_lower,
    output wire ps_ddr_rvalid,

    output wire PixelClk,
    output wire ps_ddr_aclk,
    output wire calc_clk
);
wire          ps_regs_aclk;
wire          ps_regs_aresetn;
wire [31:0]   ps_regs_araddr;
wire [2:0]    ps_regs_arprot;
wire          ps_regs_arready;
wire          ps_regs_arvalid;
wire [31:0]   ps_regs_awaddr;
wire [2:0]    ps_regs_awprot;
wire          ps_regs_awready;
wire          ps_regs_awvalid;
wire          ps_regs_bready;
wire [1:0]    ps_regs_bresp;
wire          ps_regs_bvalid;
wire [31:0]   ps_regs_rdata;
wire          ps_regs_rready;
wire [1:0]    ps_regs_rresp;
wire          ps_regs_rvalid;
wire [31:0]   ps_regs_wdata;
wire          ps_regs_wready;
wire [3:0]    ps_regs_wstrb;
wire          ps_regs_wvalid;

wire          ps_ddr_aresetn;
wire [31:0]   ps_ddr_araddr;
wire [1:0]    ps_ddr_arburst;
wire [5:0]    ps_ddr_arid;
wire [7:0]    ps_ddr_arlen;
wire [0:0]    ps_ddr_arlock;
wire [3:0]    ps_ddr_arqos;
wire          ps_ddr_arready;
wire [3:0]    ps_ddr_arregion;
wire [2:0]    ps_ddr_arsize;
wire          ps_ddr_arvalid;
wire [31:0]   ps_ddr_awaddr;
wire [1:0]    ps_ddr_awburst;

wire [5:0]    ps_ddr_awid;
wire [7:0]    ps_ddr_awlen;
wire [0:0]    ps_ddr_awlock;
wire [3:0]    ps_ddr_awqos;
wire          ps_ddr_awready;
wire [3:0]    ps_ddr_awregion;
wire [2:0]    ps_ddr_awsize;
wire          ps_ddr_awvalid;
wire [5:0]    ps_ddr_bid;
wire          ps_ddr_bready;
wire [1:0]    ps_ddr_bresp;
wire          ps_ddr_bvalid;
wire [63:0]   ps_ddr_rdata;
wire [5:0]    ps_ddr_rid;
wire          ps_ddr_rlast;
wire          ps_ddr_rready;
wire [1:0]    ps_ddr_rresp;
wire [63:0]   ps_ddr_wdata;
wire          ps_ddr_wlast;
wire          ps_ddr_wready;
wire [7:0]    ps_ddr_wstrb;
wire          ps_ddr_wvalid;

wire          ps_ddr_txn_done;
wire          ps_ddr_error; 

  
 zordon_wrapper zordon_wrapper_i (
    .ps_regs_aclk           (ps_regs_aclk           ),
    .ps_regs_aresetn        (ps_regs_aresetn        ),
    .ps_regs_araddr         (ps_regs_araddr         ),
    .ps_regs_arprot         (ps_regs_arprot         ),
    .ps_regs_arready        (ps_regs_arready        ),
    .ps_regs_arvalid        (ps_regs_arvalid        ),
    .ps_regs_awaddr         (ps_regs_awaddr         ),
    .ps_regs_awprot         (ps_regs_awprot         ),
    .ps_regs_awready        (ps_regs_awready        ),
    .ps_regs_awvalid        (ps_regs_awvalid        ),
    .ps_regs_bready         (ps_regs_bready         ),
    .ps_regs_bresp          (ps_regs_bresp          ),
    .ps_regs_bvalid         (ps_regs_bvalid         ),
    .ps_regs_rdata          (ps_regs_rdata          ),
    .ps_regs_rready         (ps_regs_rready         ),
    .ps_regs_rresp          (ps_regs_rresp          ),
    .ps_regs_rvalid         (ps_regs_rvalid         ),
    .ps_regs_wdata          (ps_regs_wdata          ),
    .ps_regs_wready         (ps_regs_wready         ),
    .ps_regs_wstrb          (ps_regs_wstrb          ),
    .ps_regs_wvalid         (ps_regs_wvalid         ),
    .DDR_addr               (DDR_addr               ),
    .DDR_ba                 (DDR_ba                 ),
    .DDR_cas_n              (DDR_cas_n              ),
    .DDR_ck_n               (DDR_ck_n               ),
    .DDR_ck_p               (DDR_ck_p               ),
    .DDR_cke                (DDR_cke                ),
    .DDR_cs_n               (DDR_cs_n               ),
    .DDR_dm                 (DDR_dm                 ),
    .DDR_dq                 (DDR_dq                 ),
    .DDR_dqs_n              (DDR_dqs_n              ),
    .DDR_dqs_p              (DDR_dqs_p              ),
    .DDR_odt                (DDR_odt                ),
    .DDR_ras_n              (DDR_ras_n              ),
    .DDR_reset_n            (DDR_reset_n            ),
    .DDR_we_n               (DDR_we_n               ),
    .calc_clk               (calc_clk               ),
    .ps_ddr_aclk            (ps_ddr_aclk            ),
    .ps_ddr_aresetn         (ps_ddr_aresetn         ),    
    .ps_ddr_araddr          (ps_ddr_araddr          ),
    .ps_ddr_arburst         (ps_ddr_arburst         ),
    .ps_ddr_arcache         (4'b0011                ),
    .ps_ddr_arid            (ps_ddr_arid            ),
    .ps_ddr_arlen           (ps_ddr_arlen           ),
    .ps_ddr_arlock          (ps_ddr_arlock          ),
    .ps_ddr_arprot          (3'b000                 ),
    //.ps_ddr_arqos           (ps_ddr_arqos           ),
    .ps_ddr_arready         (ps_ddr_arready         ),
    //.ps_ddr_arregion        (ps_ddr_arregion        ),
    .ps_ddr_arsize          (ps_ddr_arsize          ),
    .ps_ddr_arvalid         (ps_ddr_arvalid         ),
    .ps_ddr_awaddr          (ps_ddr_awaddr          ),
    .ps_ddr_awburst         (ps_ddr_awburst         ),
    .ps_ddr_awcache         (4'b0011                ),
    .ps_ddr_awid            (ps_ddr_awid            ),
    .ps_ddr_awlen           (ps_ddr_awlen           ),
    .ps_ddr_awlock          (ps_ddr_awlock          ),
    .ps_ddr_awprot          (3'b000                 ),
    //.ps_ddr_awqos           (ps_ddr_awqos           ),
    .ps_ddr_awready         (ps_ddr_awready         ),
    //.ps_ddr_awregion        (ps_ddr_awregion        ),
    .ps_ddr_awsize          (ps_ddr_awsize          ),
    .ps_ddr_awvalid         (ps_ddr_awvalid         ),
    .ps_ddr_bid             (ps_ddr_bid             ),
    .ps_ddr_bready          (ps_ddr_bready          ),
    .ps_ddr_bresp           (ps_ddr_bresp           ),
    .ps_ddr_bvalid          (ps_ddr_bvalid          ),
    .ps_ddr_rdata           (ps_ddr_rdata           ),
    .ps_ddr_rid             (ps_ddr_rid             ),
    .ps_ddr_rlast           (ps_ddr_rlast           ),
    .ps_ddr_rready          (ps_ddr_rready          ),
    .ps_ddr_rresp           (ps_ddr_rresp           ),
    .ps_ddr_rvalid          (ps_ddr_rvalid          ),
    .ps_ddr_wdata           (ps_ddr_wdata           ),
    .ps_ddr_wlast           (ps_ddr_wlast           ),
    .ps_ddr_wready          (ps_ddr_wready          ),
    .ps_ddr_wstrb           (ps_ddr_wstrb           ),
    .ps_ddr_wvalid          (ps_ddr_wvalid          ),
    .FIXED_IO_ddr_vrn       (FIXED_IO_ddr_vrn       ),
    .FIXED_IO_ddr_vrp       (FIXED_IO_ddr_vrp       ),
    .FIXED_IO_mio           (FIXED_IO_mio           ),
    .FIXED_IO_ps_clk        (FIXED_IO_ps_clk        ),
    .FIXED_IO_ps_porb       (FIXED_IO_ps_porb       ),
    .FIXED_IO_ps_srstb      (FIXED_IO_ps_srstb      ),
    .HDMI_OEN               (HDMI_OEN               ),
    .PixelClk_in            (PixelClk               ),
    .PixelClk_out           (PixelClk               ),
    .TMDS_clk_n             (TMDS_clk_n             ),
    .TMDS_clk_p             (TMDS_clk_p             ),
    .TMDS_data_n            (TMDS_data_n            ),
    .TMDS_data_p            (TMDS_data_p            ),
    .UART_0_rxd             (UART_0_rxd             ),
    .UART_0_txd             (UART_0_txd             ),
    //.btns_4bits_tri_i     (btns_4bits_tri_i       ),
    .clk                    (clk                    ),
    .ddc_scl_io             (ddc_scl_io             ),
    .ddc_sda_io             (ddc_sda_io             ),
    .hdmi_hpd               (hdmi_hpd               ),
    .leds_4bits_tri_o       (       ),//
    .rgb_in_active_video    (rgb_active_video_in    ),
    .rgb_in_data            (rgb_data_in            ),
    .rgb_in_hsync           (rgb_hsync_in           ),
    .rgb_in_vsync           (rgb_vsync_in           ),
    .rgb_out_active_video   (rgb_active_video_in    ),                          
    .rgb_out_data           (rgb_data_in            ),                                                                                         
    .rgb_out_hsync          (rgb_hsync_in           ),                           
    .rgb_out_vsync          (rgb_vsync_in           ),                           
    .vga_b                  (vga_b                  ),
    .vga_g                  (vga_g                  ),
    .vga_hs                 (vga_hs                 ),
    .vga_r                  (vga_r                  ),
    .vga_vs                 (vga_vs                 )
 );



 Reg_space # ( 
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(9),
    .C_S_AXI_REG_NO(32))
 Reg_space_i (   
    .S_AXI_ACLK(ps_regs_aclk),
    .S_AXI_ARESETN(ps_regs_aresetn),
    .S_AXI_AWADDR(ps_regs_awaddr),
    .S_AXI_AWPROT(ps_regs_awprot),
    .S_AXI_AWVALID(ps_regs_awvalid),
    .S_AXI_AWREADY(ps_regs_awready),
    .S_AXI_WDATA(ps_regs_wdata),
    .S_AXI_WSTRB(ps_regs_wstrb),
    .S_AXI_WVALID(ps_regs_wvalid),
    .S_AXI_WREADY(ps_regs_wready),
    .S_AXI_BRESP(ps_regs_bresp),
    .S_AXI_BVALID(ps_regs_bvalid),
    .S_AXI_BREADY(ps_regs_bready),
    .S_AXI_ARADDR(ps_regs_araddr),
    .S_AXI_ARPROT(ps_regs_arprot),
    .S_AXI_ARVALID(ps_regs_arvalid),
    .S_AXI_ARREADY(ps_regs_arready),
    .S_AXI_RDATA(ps_regs_rdata),
    .S_AXI_RRESP(ps_regs_rresp),
    .S_AXI_RVALID(ps_regs_rvalid),
    .S_AXI_RREADY(ps_regs_rready),
    .reg1(address_to_write),//(counter_h_end_value),
    .reg2(address_to_read),//(counter_v_end_value),
    .reg3(data_to_read_upper),
    .reg4(data_to_read_lower),
    .reg5(data_to_write[0]),
    .U_min(),  //  
    .U_max(),  //(),
    .V_min(),  //(), 
    .V_max()   //()     
 );
 

 DDR_mem DDR_mem_i (
    .done(done),
    .data_to_write(data_to_write),      
    .address_to_write(address_to_write),
    .address_to_read(address_to_read), 
    .data_to_read_upper(data_to_read_upper),
    .data_to_read_lower(data_to_read_lower),

    .INIT_AXI_TXN(ps_ddr_init_axi_txn),
    .wren(1'b1),       
    .rden(1'b1),  
    
    .TXN_DONE(ps_ddr_txn_done),
    .ERROR(ps_ddr_error),
    .M_AXI_ACLK(ps_ddr_aclk),
    .M_AXI_ARESETN(ps_ddr_aresetn),
    .M_AXI_AWID(ps_ddr_awid),
    .M_AXI_AWADDR(ps_ddr_awaddr),
    .M_AXI_AWLEN(ps_ddr_awlen),
    .M_AXI_AWSIZE(ps_ddr_awsize),
    .M_AXI_AWBURST(ps_ddr_awburst),
    .M_AXI_AWLOCK(ps_ddr_awlock),
    .M_AXI_AWCACHE(),
    .M_AXI_AWPROT(),
    .M_AXI_AWQOS(ps_ddr_awqos),
    .M_AXI_AWUSER(ps_ddr_awuser),
    .M_AXI_AWVALID(ps_ddr_awvalid),
    .M_AXI_AWREADY(ps_ddr_awready),
    .M_AXI_WDATA(ps_ddr_wdata),
    .M_AXI_WSTRB(ps_ddr_wstrb),
    .M_AXI_WLAST(ps_ddr_wlast),
    .M_AXI_WUSER(ps_ddr_wuser),
    .M_AXI_WVALID(ps_ddr_wvalid),
    .M_AXI_WREADY(ps_ddr_wready),
    .M_AXI_BID(ps_ddr_bid),
    .M_AXI_BRESP(ps_ddr_bresp),
    .M_AXI_BUSER(ps_ddr_buser),
    .M_AXI_BVALID(ps_ddr_bvalid),
    .M_AXI_BREADY(ps_ddr_bready),
    .M_AXI_ARID(ps_ddr_arid),
    .M_AXI_ARADDR(ps_ddr_araddr),
    .M_AXI_ARLEN(ps_ddr_arlen),
    .M_AXI_ARSIZE(ps_ddr_arsize),
    .M_AXI_ARBURST(ps_ddr_arburst),
    .M_AXI_ARLOCK(ps_ddr_arlock),
    .M_AXI_ARCACHE(),
    .M_AXI_ARPROT(),
    .M_AXI_ARQOS(ps_ddr_arqos),
    .M_AXI_ARUSER(ps_ddr_aruser),
    .M_AXI_ARVALID(ps_ddr_arvalid),
    .M_AXI_ARREADY(ps_ddr_arready),
    .M_AXI_RID(ps_ddr_rid),
    .M_AXI_RDATA(ps_ddr_rdata),
    .M_AXI_RRESP(ps_ddr_rresp),
    .M_AXI_RLAST(ps_ddr_rlast),
    .M_AXI_RUSER(ps_ddr_ruser),
    .M_AXI_RVALID(ps_ddr_rvalid),
    .M_AXI_RREADY(ps_ddr_rready)
 );
endmodule