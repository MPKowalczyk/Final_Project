// (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:gradient_hessian:1.0
// IP Revision: 2

(* X_CORE_INFO = "gradient_hessian,Vivado 2016.3" *)
(* CHECK_LICENSE_TYPE = "zordon_gradient_hessian_0_0,gradient_hessian,{}" *)
(* CORE_GENERATION_INFO = "zordon_gradient_hessian_0_0,gradient_hessian,{x_ipProduct=Vivado 2016.3,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=gradient_hessian,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,H_SIZE=1650}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module zordon_gradient_hessian_0_0 (
  grey_in,
  hsync_in,
  vsync_in,
  de_in,
  clk_in,
  grey_out,
  Gx,
  Gy,
  Hxx,
  Hxy,
  Hyy,
  hsync_out,
  vsync_out,
  de_out,
  clk_out
);

input wire [7 : 0] grey_in;
input wire hsync_in;
input wire vsync_in;
input wire de_in;
input wire clk_in;
output wire [7 : 0] grey_out;
output wire [7 : 0] Gx;
output wire [7 : 0] Gy;
output wire [7 : 0] Hxx;
output wire [7 : 0] Hxy;
output wire [7 : 0] Hyy;
output wire hsync_out;
output wire vsync_out;
output wire de_out;
output wire clk_out;

  gradient_hessian #(
    .H_SIZE(1650)
  ) inst (
    .grey_in(grey_in),
    .hsync_in(hsync_in),
    .vsync_in(vsync_in),
    .de_in(de_in),
    .clk_in(clk_in),
    .grey_out(grey_out),
    .Gx(Gx),
    .Gy(Gy),
    .Hxx(Hxx),
    .Hxy(Hxy),
    .Hyy(Hyy),
    .hsync_out(hsync_out),
    .vsync_out(vsync_out),
    .de_out(de_out),
    .clk_out(clk_out)
  );
endmodule
