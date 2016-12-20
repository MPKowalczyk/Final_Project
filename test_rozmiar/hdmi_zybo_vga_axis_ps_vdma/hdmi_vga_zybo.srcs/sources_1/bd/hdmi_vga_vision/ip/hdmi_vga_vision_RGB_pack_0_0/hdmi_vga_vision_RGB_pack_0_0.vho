-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:RGB_pack:1.0
-- IP Revision: 2

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT hdmi_vga_vision_RGB_pack_0_0
  PORT (
    in_R : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    in_G : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    in_B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    in_HSync : IN STD_LOGIC;
    in_VSync : IN STD_LOGIC;
    in_DE : IN STD_LOGIC;
    in_PClk : IN STD_LOGIC;
    out_RGB : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    out_HSync : OUT STD_LOGIC;
    out_VSync : OUT STD_LOGIC;
    out_DE : OUT STD_LOGIC;
    out_PClk : OUT STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : hdmi_vga_vision_RGB_pack_0_0
  PORT MAP (
    in_R => in_R,
    in_G => in_G,
    in_B => in_B,
    in_HSync => in_HSync,
    in_VSync => in_VSync,
    in_DE => in_DE,
    in_PClk => in_PClk,
    out_RGB => out_RGB,
    out_HSync => out_HSync,
    out_VSync => out_VSync,
    out_DE => out_DE,
    out_PClk => out_PClk
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file hdmi_vga_vision_RGB_pack_0_0.vhd when simulating
-- the core, hdmi_vga_vision_RGB_pack_0_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

