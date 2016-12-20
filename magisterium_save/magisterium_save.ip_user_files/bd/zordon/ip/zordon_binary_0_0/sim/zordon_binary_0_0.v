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


// IP VLNV: xilinx.com:user:binary:1.0
// IP Revision: 2

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module zordon_binary_0_0 (
  in_red,
  in_green,
  in_blue,
  in_hsync,
  in_vsync,
  in_de,
  in_clk,
  mask,
  out_hsync,
  out_vsync,
  out_de,
  out_clk
);

input wire [7 : 0] in_red;
input wire [7 : 0] in_green;
input wire [7 : 0] in_blue;
input wire in_hsync;
input wire in_vsync;
input wire in_de;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 in_clk CLK" *)
input wire in_clk;
output wire [7 : 0] mask;
output wire out_hsync;
output wire out_vsync;
output wire out_de;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 out_clk CLK" *)
output wire out_clk;

  binary #(
    .LOW_R(0),
    .HIGH_R(30),
    .LOW_G(40),
    .HIGH_G(255),
    .LOW_B(0),
    .HIGH_B(30)
  ) inst (
    .in_red(in_red),
    .in_green(in_green),
    .in_blue(in_blue),
    .in_hsync(in_hsync),
    .in_vsync(in_vsync),
    .in_de(in_de),
    .in_clk(in_clk),
    .mask(mask),
    .out_hsync(out_hsync),
    .out_vsync(out_vsync),
    .out_de(out_de),
    .out_clk(out_clk)
  );
endmodule
