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


// IP VLNV: xilinx.com:user:srodek:1.0
// IP Revision: 2

(* X_CORE_INFO = "srodek,Vivado 2016.3" *)
(* CHECK_LICENSE_TYPE = "zordon_srodek_0_0,srodek,{}" *)
(* CORE_GENERATION_INFO = "zordon_srodek_0_0,srodek,{x_ipProduct=Vivado 2016.3,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=srodek,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module zordon_srodek_0_0 (
  in_mask,
  in_hsync,
  in_vsync,
  in_de,
  in_clk,
  x_ready,
  y_ready,
  x,
  y,
  x_act,
  y_act
);

input wire [7 : 0] in_mask;
input wire in_hsync;
input wire in_vsync;
input wire in_de;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 in_clk CLK" *)
input wire in_clk;
output wire x_ready;
output wire y_ready;
output wire [10 : 0] x;
output wire [10 : 0] y;
output wire [10 : 0] x_act;
output wire [10 : 0] y_act;

  srodek inst (
    .in_mask(in_mask),
    .in_hsync(in_hsync),
    .in_vsync(in_vsync),
    .in_de(in_de),
    .in_clk(in_clk),
    .x_ready(x_ready),
    .y_ready(y_ready),
    .x(x),
    .y(y),
    .x_act(x_act),
    .y_act(y_act)
  );
endmodule
