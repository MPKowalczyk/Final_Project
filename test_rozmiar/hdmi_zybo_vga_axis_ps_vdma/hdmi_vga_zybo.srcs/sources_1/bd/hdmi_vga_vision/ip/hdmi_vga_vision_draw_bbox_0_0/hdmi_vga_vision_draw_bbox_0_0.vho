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

-- IP VLNV: Tomasz_Kryjak_AGH:EVS:draw_bbox:1.0
-- IP Revision: 3

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT hdmi_vga_vision_draw_bbox_0_0
  PORT (
    clk : IN STD_LOGIC;
    de_in : IN STD_LOGIC;
    hsync_in : IN STD_LOGIC;
    vsync_in : IN STD_LOGIC;
    r_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    g_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    b_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    bbox_0 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    bbox_1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    bbox_2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    de_out : OUT STD_LOGIC;
    hsync_out : OUT STD_LOGIC;
    vsync_out : OUT STD_LOGIC;
    r_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    g_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    b_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : hdmi_vga_vision_draw_bbox_0_0
  PORT MAP (
    clk => clk,
    de_in => de_in,
    hsync_in => hsync_in,
    vsync_in => vsync_in,
    r_in => r_in,
    g_in => g_in,
    b_in => b_in,
    bbox_0 => bbox_0,
    bbox_1 => bbox_1,
    bbox_2 => bbox_2,
    de_out => de_out,
    hsync_out => hsync_out,
    vsync_out => vsync_out,
    r_out => r_out,
    g_out => g_out,
    b_out => b_out
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

