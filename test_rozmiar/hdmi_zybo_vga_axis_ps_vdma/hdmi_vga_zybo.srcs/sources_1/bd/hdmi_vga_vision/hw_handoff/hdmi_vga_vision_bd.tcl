
################################################################
# This is a generated script based on design: hdmi_vga_vision
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source hdmi_vga_vision_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1
#    set_property BOARD_PART digilentinc.com:zybo:part0:1.0 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name hdmi_vga_vision

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC ]
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {125000000} \
 ] $clk
  set hdmi_clk_n [ create_bd_port -dir I hdmi_clk_n ]
  set hdmi_clk_p [ create_bd_port -dir I hdmi_clk_p ]
  set hdmi_d_n [ create_bd_port -dir I -from 2 -to 0 hdmi_d_n ]
  set hdmi_d_p [ create_bd_port -dir I -from 2 -to 0 hdmi_d_p ]
  set hdmi_hpd [ create_bd_port -dir O -from 0 -to 0 hdmi_hpd ]
  set hdmi_out_en [ create_bd_port -dir O -from 0 -to 0 hdmi_out_en ]
  set led [ create_bd_port -dir O -from 2 -to 0 led ]
  set vga_b [ create_bd_port -dir O -from 4 -to 0 vga_b ]
  set vga_g [ create_bd_port -dir O -from 5 -to 0 vga_g ]
  set vga_hs [ create_bd_port -dir O vga_hs ]
  set vga_r [ create_bd_port -dir O -from 4 -to 0 vga_r ]
  set vga_vs [ create_bd_port -dir O vga_vs ]

  # Create instance: GND, and set properties
  set GND [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 GND ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $GND

  # Create instance: RGB_pack_0, and set properties
  set RGB_pack_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:RGB_pack:1.0 RGB_pack_0 ]

  # Create instance: RGB_unpack_0, and set properties
  set RGB_unpack_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:RGB_unpack:1.0 RGB_unpack_0 ]

  # Create instance: VCC, and set properties
  set VCC [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 VCC ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
CONFIG.NUM_MI {1} \
CONFIG.XBAR_DATA_WIDTH {64} \
 ] $axi_mem_intercon

  # Create instance: axi_vdma_0, and set properties
  set axi_vdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.2 axi_vdma_0 ]
  set_property -dict [ list \
CONFIG.c_include_mm2s {0} \
CONFIG.c_include_mm2s_dre {0} \
CONFIG.c_include_s2mm_dre {1} \
CONFIG.c_m_axi_mm2s_data_width {64} \
CONFIG.c_m_axis_mm2s_tdata_width {32} \
CONFIG.c_mm2s_genlock_mode {0} \
CONFIG.c_mm2s_linebuffer_depth {512} \
CONFIG.c_mm2s_max_burst_length {8} \
CONFIG.c_num_fstores {1} \
CONFIG.c_s2mm_genlock_mode {0} \
CONFIG.c_s2mm_linebuffer_depth {2048} \
CONFIG.c_s2mm_max_burst_length {64} \
CONFIG.c_use_mm2s_fsync {0} \
 ] $axi_vdma_0

  # Create instance: bbox_register_0, and set properties
  set bbox_register_0 [ create_bd_cell -type ip -vlnv user.org:user:bbox_register:1.0 bbox_register_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKIN1_JITTER_PS {80.0} \
CONFIG.CLKOUT1_DRIVES {BUFG} \
CONFIG.CLKOUT1_JITTER {109.241} \
CONFIG.CLKOUT1_PHASE_ERROR {96.948} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} \
CONFIG.CLKOUT2_DRIVES {BUFG} \
CONFIG.CLKOUT3_DRIVES {BUFG} \
CONFIG.CLKOUT4_DRIVES {BUFG} \
CONFIG.CLKOUT5_DRIVES {BUFG} \
CONFIG.CLKOUT6_DRIVES {BUFG} \
CONFIG.CLKOUT7_DRIVES {BUFG} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8} \
CONFIG.MMCM_CLKIN1_PERIOD {8.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {5} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIMITIVE {PLL} \
CONFIG.PRIM_IN_FREQ {125.000} \
 ] $clk_wiz_0

  # Create instance: draw_bbox_0, and set properties
  set draw_bbox_0 [ create_bd_cell -type ip -vlnv Tomasz_Kryjak_AGH:EVS:draw_bbox:1.0 draw_bbox_0 ]

  # Create instance: dvi2rgb_0, and set properties
  set dvi2rgb_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:dvi2rgb:1.5 dvi2rgb_0 ]
  set_property -dict [ list \
CONFIG.kClkRange {2} \
 ] $dvi2rgb_0

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {650} \
CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50.000000} \
CONFIG.PCW_ENET0_ENET0_IO {<Select>} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {0} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_ENET0_RESET_ENABLE {0} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_MIO_0_PULLUP {enabled} \
CONFIG.PCW_MIO_10_PULLUP {enabled} \
CONFIG.PCW_MIO_11_PULLUP {enabled} \
CONFIG.PCW_MIO_12_PULLUP {enabled} \
CONFIG.PCW_MIO_16_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_16_PULLUP {disabled} \
CONFIG.PCW_MIO_16_SLEW {fast} \
CONFIG.PCW_MIO_17_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_17_PULLUP {disabled} \
CONFIG.PCW_MIO_17_SLEW {fast} \
CONFIG.PCW_MIO_18_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_18_PULLUP {disabled} \
CONFIG.PCW_MIO_18_SLEW {fast} \
CONFIG.PCW_MIO_19_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_19_PULLUP {disabled} \
CONFIG.PCW_MIO_19_SLEW {fast} \
CONFIG.PCW_MIO_1_PULLUP {disabled} \
CONFIG.PCW_MIO_1_SLEW {fast} \
CONFIG.PCW_MIO_20_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_20_PULLUP {disabled} \
CONFIG.PCW_MIO_20_SLEW {fast} \
CONFIG.PCW_MIO_21_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_21_PULLUP {disabled} \
CONFIG.PCW_MIO_21_SLEW {fast} \
CONFIG.PCW_MIO_22_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_22_PULLUP {disabled} \
CONFIG.PCW_MIO_22_SLEW {fast} \
CONFIG.PCW_MIO_23_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_23_PULLUP {disabled} \
CONFIG.PCW_MIO_23_SLEW {fast} \
CONFIG.PCW_MIO_24_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_24_PULLUP {disabled} \
CONFIG.PCW_MIO_24_SLEW {fast} \
CONFIG.PCW_MIO_25_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_25_PULLUP {disabled} \
CONFIG.PCW_MIO_25_SLEW {fast} \
CONFIG.PCW_MIO_26_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_26_PULLUP {disabled} \
CONFIG.PCW_MIO_26_SLEW {fast} \
CONFIG.PCW_MIO_27_IOTYPE {HSTL 1.8V} \
CONFIG.PCW_MIO_27_PULLUP {disabled} \
CONFIG.PCW_MIO_27_SLEW {fast} \
CONFIG.PCW_MIO_28_PULLUP {disabled} \
CONFIG.PCW_MIO_28_SLEW {fast} \
CONFIG.PCW_MIO_29_PULLUP {disabled} \
CONFIG.PCW_MIO_29_SLEW {fast} \
CONFIG.PCW_MIO_2_SLEW {fast} \
CONFIG.PCW_MIO_30_PULLUP {disabled} \
CONFIG.PCW_MIO_30_SLEW {fast} \
CONFIG.PCW_MIO_31_PULLUP {disabled} \
CONFIG.PCW_MIO_31_SLEW {fast} \
CONFIG.PCW_MIO_32_PULLUP {disabled} \
CONFIG.PCW_MIO_32_SLEW {fast} \
CONFIG.PCW_MIO_33_PULLUP {disabled} \
CONFIG.PCW_MIO_33_SLEW {fast} \
CONFIG.PCW_MIO_34_PULLUP {disabled} \
CONFIG.PCW_MIO_34_SLEW {fast} \
CONFIG.PCW_MIO_35_PULLUP {disabled} \
CONFIG.PCW_MIO_35_SLEW {fast} \
CONFIG.PCW_MIO_36_PULLUP {disabled} \
CONFIG.PCW_MIO_36_SLEW {fast} \
CONFIG.PCW_MIO_37_PULLUP {disabled} \
CONFIG.PCW_MIO_37_SLEW {fast} \
CONFIG.PCW_MIO_38_PULLUP {disabled} \
CONFIG.PCW_MIO_38_SLEW {fast} \
CONFIG.PCW_MIO_39_PULLUP {disabled} \
CONFIG.PCW_MIO_39_SLEW {fast} \
CONFIG.PCW_MIO_3_SLEW {fast} \
CONFIG.PCW_MIO_40_PULLUP {disabled} \
CONFIG.PCW_MIO_40_SLEW {fast} \
CONFIG.PCW_MIO_41_PULLUP {disabled} \
CONFIG.PCW_MIO_41_SLEW {fast} \
CONFIG.PCW_MIO_42_PULLUP {disabled} \
CONFIG.PCW_MIO_42_SLEW {fast} \
CONFIG.PCW_MIO_43_PULLUP {disabled} \
CONFIG.PCW_MIO_43_SLEW {fast} \
CONFIG.PCW_MIO_44_PULLUP {disabled} \
CONFIG.PCW_MIO_44_SLEW {fast} \
CONFIG.PCW_MIO_45_PULLUP {disabled} \
CONFIG.PCW_MIO_45_SLEW {fast} \
CONFIG.PCW_MIO_47_PULLUP {disabled} \
CONFIG.PCW_MIO_48_PULLUP {disabled} \
CONFIG.PCW_MIO_49_PULLUP {disabled} \
CONFIG.PCW_MIO_4_SLEW {fast} \
CONFIG.PCW_MIO_50_DIRECTION {inout} \
CONFIG.PCW_MIO_50_PULLUP {disabled} \
CONFIG.PCW_MIO_51_DIRECTION {inout} \
CONFIG.PCW_MIO_51_PULLUP {disabled} \
CONFIG.PCW_MIO_52_PULLUP {disabled} \
CONFIG.PCW_MIO_52_SLEW {slow} \
CONFIG.PCW_MIO_53_PULLUP {disabled} \
CONFIG.PCW_MIO_53_SLEW {slow} \
CONFIG.PCW_MIO_5_SLEW {fast} \
CONFIG.PCW_MIO_6_SLEW {fast} \
CONFIG.PCW_MIO_8_SLEW {fast} \
CONFIG.PCW_MIO_9_PULLUP {enabled} \
CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {0} \
CONFIG.PCW_SD0_GRP_CD_IO {<Select>} \
CONFIG.PCW_SD0_GRP_WP_ENABLE {0} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {32} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.176} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.159} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.162} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.187} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {-0.073} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {-0.034} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.03} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.082} \
CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {525} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K128M16 JT-125} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_USB0_RESET_ENABLE {0} \
CONFIG.PCW_USB0_RESET_IO {<Select>} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_USE_S_AXI_HP1 {0} \
CONFIG.preset {Default} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $processing_system7_0_axi_periph

  # Create instance: rgb2vga_0, and set properties
  set rgb2vga_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2vga:1.0 rgb2vga_0 ]

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create instance: v_axi4s_vid_out_0, and set properties
  set v_axi4s_vid_out_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 v_axi4s_vid_out_0 ]
  set_property -dict [ list \
CONFIG.C_ADDR_WIDTH {10} \
 ] $v_axi4s_vid_out_0

  # Create instance: v_tc_0, and set properties
  set v_tc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 v_tc_0 ]
  set_property -dict [ list \
CONFIG.GEN_F0_VBLANK_HEND {1280} \
CONFIG.GEN_F0_VBLANK_HSTART {1280} \
CONFIG.GEN_F0_VFRAME_SIZE {750} \
CONFIG.GEN_F0_VSYNC_HEND {1280} \
CONFIG.GEN_F0_VSYNC_HSTART {1280} \
CONFIG.GEN_F0_VSYNC_VEND {729} \
CONFIG.GEN_F0_VSYNC_VSTART {724} \
CONFIG.GEN_F1_VBLANK_HEND {1280} \
CONFIG.GEN_F1_VBLANK_HSTART {1280} \
CONFIG.GEN_F1_VFRAME_SIZE {750} \
CONFIG.GEN_F1_VSYNC_HEND {1280} \
CONFIG.GEN_F1_VSYNC_HSTART {1280} \
CONFIG.GEN_F1_VSYNC_VEND {729} \
CONFIG.GEN_F1_VSYNC_VSTART {724} \
CONFIG.GEN_HACTIVE_SIZE {1280} \
CONFIG.GEN_HFRAME_SIZE {1650} \
CONFIG.GEN_HSYNC_END {1430} \
CONFIG.GEN_HSYNC_START {1390} \
CONFIG.GEN_VACTIVE_SIZE {720} \
CONFIG.HAS_AXI4_LITE {true} \
CONFIG.SYNC_EN {false} \
CONFIG.VIDEO_MODE {720p} \
CONFIG.auto_generation_mode {true} \
CONFIG.horizontal_sync_generation {true} \
CONFIG.max_clocks_per_line {2048} \
CONFIG.max_lines_per_frame {2048} \
CONFIG.vertical_sync_generation {true} \
 ] $v_tc_0

  # Create instance: v_vid_in_axi4s_0, and set properties
  set v_vid_in_axi4s_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_vid_in_axi4s:4.0 v_vid_in_axi4s_0 ]
  set_property -dict [ list \
CONFIG.C_ADDR_WIDTH {5} \
CONFIG.C_HAS_ASYNC_CLK {0} \
 ] $v_vid_in_axi4s_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXI_S2MM [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins axi_vdma_0/M_AXI_S2MM]
  connect_bd_intf_net -intf_net dvi2rgb_0_DDC [get_bd_intf_ports DDC] [get_bd_intf_pins dvi2rgb_0/DDC]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI] [get_bd_intf_pins v_tc_0/ctrl]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins axi_vdma_0/S_AXI_LITE] [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins bbox_register_0/S00_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]

  # Create port connections
  connect_bd_net -net GND_dout [get_bd_ports hdmi_out_en] [get_bd_pins GND/dout]
  connect_bd_net -net RGB_pack_0_out_DE [get_bd_pins RGB_pack_0/out_DE] [get_bd_pins rgb2vga_0/rgb_pVDE]
  connect_bd_net -net RGB_pack_0_out_HSync [get_bd_pins RGB_pack_0/out_HSync] [get_bd_pins rgb2vga_0/rgb_pHSync]
  connect_bd_net -net RGB_pack_0_out_RGB [get_bd_pins RGB_pack_0/out_RGB] [get_bd_pins rgb2vga_0/rgb_pData]
  connect_bd_net -net RGB_pack_0_out_VSync [get_bd_pins RGB_pack_0/out_VSync] [get_bd_pins rgb2vga_0/rgb_pVSync]
  connect_bd_net -net RGB_unpack_0_out_B [get_bd_pins RGB_unpack_0/out_B] [get_bd_pins draw_bbox_0/b_in]
  connect_bd_net -net RGB_unpack_0_out_DE [get_bd_pins RGB_unpack_0/out_DE] [get_bd_pins draw_bbox_0/de_in]
  connect_bd_net -net RGB_unpack_0_out_G [get_bd_pins RGB_unpack_0/out_G] [get_bd_pins draw_bbox_0/g_in]
  connect_bd_net -net RGB_unpack_0_out_HSync [get_bd_pins RGB_unpack_0/out_HSync] [get_bd_pins draw_bbox_0/hsync_in]
  connect_bd_net -net RGB_unpack_0_out_R [get_bd_pins RGB_unpack_0/out_R] [get_bd_pins draw_bbox_0/r_in]
  connect_bd_net -net RGB_unpack_0_out_VSync [get_bd_pins RGB_unpack_0/out_VSync] [get_bd_pins draw_bbox_0/vsync_in]
  connect_bd_net -net VCC_dout [get_bd_ports hdmi_hpd] [get_bd_pins VCC/dout]
  connect_bd_net -net bbox_register_0_bbox_0 [get_bd_pins bbox_register_0/bbox_0] [get_bd_pins draw_bbox_0/bbox_0]
  connect_bd_net -net bbox_register_0_bbox_1 [get_bd_pins bbox_register_0/bbox_1] [get_bd_pins draw_bbox_0/bbox_1]
  connect_bd_net -net bbox_register_0_bbox_2 [get_bd_pins bbox_register_0/bbox_2] [get_bd_pins draw_bbox_0/bbox_2]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins dvi2rgb_0/RefClk]
  connect_bd_net -net draw_bbox_0_b_out [get_bd_pins RGB_pack_0/in_B] [get_bd_pins draw_bbox_0/b_out]
  connect_bd_net -net draw_bbox_0_de_out [get_bd_pins RGB_pack_0/in_DE] [get_bd_pins draw_bbox_0/de_out]
  connect_bd_net -net draw_bbox_0_g_out [get_bd_pins RGB_pack_0/in_G] [get_bd_pins draw_bbox_0/g_out]
  connect_bd_net -net draw_bbox_0_hsync_out [get_bd_pins RGB_pack_0/in_HSync] [get_bd_pins draw_bbox_0/hsync_out]
  connect_bd_net -net draw_bbox_0_r_out [get_bd_pins RGB_pack_0/in_R] [get_bd_pins draw_bbox_0/r_out]
  connect_bd_net -net draw_bbox_0_vsync_out [get_bd_pins RGB_pack_0/in_VSync] [get_bd_pins draw_bbox_0/vsync_out]
  connect_bd_net -net dvi2rgb_0_PixelClk [get_bd_pins RGB_pack_0/in_PClk] [get_bd_pins RGB_unpack_0/in_PClk] [get_bd_pins axi_vdma_0/s_axis_s2mm_aclk] [get_bd_pins draw_bbox_0/clk] [get_bd_pins dvi2rgb_0/PixelClk] [get_bd_pins rgb2vga_0/PixelClk] [get_bd_pins v_axi4s_vid_out_0/aclk] [get_bd_pins v_tc_0/clk] [get_bd_pins v_vid_in_axi4s_0/aclk]
  connect_bd_net -net dvi2rgb_0_vid_pData [get_bd_pins dvi2rgb_0/vid_pData] [get_bd_pins v_vid_in_axi4s_0/vid_data]
  connect_bd_net -net dvi2rgb_0_vid_pHSync [get_bd_pins dvi2rgb_0/vid_pHSync] [get_bd_pins v_vid_in_axi4s_0/vid_hsync]
  connect_bd_net -net dvi2rgb_0_vid_pVDE [get_bd_pins dvi2rgb_0/vid_pVDE] [get_bd_pins v_vid_in_axi4s_0/vid_active_video]
  connect_bd_net -net dvi2rgb_0_vid_pVSync [get_bd_pins dvi2rgb_0/vid_pVSync] [get_bd_pins v_vid_in_axi4s_0/vid_vsync]
  connect_bd_net -net hdmi_clk_n_1 [get_bd_ports hdmi_clk_n] [get_bd_pins dvi2rgb_0/TMDS_Clk_n]
  connect_bd_net -net hdmi_clk_p_1 [get_bd_ports hdmi_clk_p] [get_bd_pins dvi2rgb_0/TMDS_Clk_p]
  connect_bd_net -net hdmi_d_n_1 [get_bd_ports hdmi_d_n] [get_bd_pins dvi2rgb_0/TMDS_Data_n]
  connect_bd_net -net hdmi_d_p_1 [get_bd_ports hdmi_d_p] [get_bd_pins dvi2rgb_0/TMDS_Data_p]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_vdma_0/m_axi_s2mm_aclk] [get_bd_pins axi_vdma_0/s_axi_lite_aclk] [get_bd_pins bbox_register_0/s00_axi_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk] [get_bd_pins v_tc_0/s_axi_aclk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
  connect_bd_net -net rgb2vga_0_vga_pBlue [get_bd_ports vga_b] [get_bd_pins rgb2vga_0/vga_pBlue]
  connect_bd_net -net rgb2vga_0_vga_pGreen [get_bd_ports vga_g] [get_bd_pins rgb2vga_0/vga_pGreen]
  connect_bd_net -net rgb2vga_0_vga_pHSync [get_bd_ports vga_hs] [get_bd_pins rgb2vga_0/vga_pHSync]
  connect_bd_net -net rgb2vga_0_vga_pRed [get_bd_ports vga_r] [get_bd_pins rgb2vga_0/vga_pRed]
  connect_bd_net -net rgb2vga_0_vga_pVSync [get_bd_ports vga_vs] [get_bd_pins rgb2vga_0/vga_pVSync]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_vdma_0/axi_resetn] [get_bd_pins bbox_register_0/s00_axi_aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn] [get_bd_pins v_tc_0/s_axi_aresetn]
  connect_bd_net -net v_axi4s_vid_out_0_s_axis_video_tready [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tready] [get_bd_pins v_vid_in_axi4s_0/m_axis_video_tready]
  connect_bd_net -net v_axi4s_vid_out_0_vid_active_video [get_bd_pins RGB_unpack_0/in_DE] [get_bd_pins v_axi4s_vid_out_0/vid_active_video]
  connect_bd_net -net v_axi4s_vid_out_0_vid_data [get_bd_pins RGB_unpack_0/in_RGB] [get_bd_pins v_axi4s_vid_out_0/vid_data]
  connect_bd_net -net v_axi4s_vid_out_0_vid_hsync [get_bd_pins RGB_unpack_0/in_HSync] [get_bd_pins v_axi4s_vid_out_0/vid_hsync]
  connect_bd_net -net v_axi4s_vid_out_0_vid_vsync [get_bd_pins RGB_unpack_0/in_VSync] [get_bd_pins v_axi4s_vid_out_0/vid_vsync]
  connect_bd_net -net v_axi4s_vid_out_0_vtg_ce [get_bd_pins v_axi4s_vid_out_0/vtg_ce] [get_bd_pins v_tc_0/gen_clken]
  connect_bd_net -net v_tc_0_active_video_out [get_bd_pins v_axi4s_vid_out_0/vtg_active_video] [get_bd_pins v_tc_0/active_video_out]
  connect_bd_net -net v_tc_0_hblank_out [get_bd_pins v_axi4s_vid_out_0/vtg_hblank] [get_bd_pins v_tc_0/hblank_out]
  connect_bd_net -net v_tc_0_hsync_out [get_bd_pins v_axi4s_vid_out_0/vtg_hsync] [get_bd_pins v_tc_0/hsync_out]
  connect_bd_net -net v_tc_0_vblank_out [get_bd_pins v_axi4s_vid_out_0/vtg_vblank] [get_bd_pins v_tc_0/vblank_out]
  connect_bd_net -net v_tc_0_vsync_out [get_bd_pins v_axi4s_vid_out_0/vtg_vsync] [get_bd_pins v_tc_0/vsync_out]
  connect_bd_net -net v_vid_in_axi4s_0_m_axis_video_tdata [get_bd_pins axi_vdma_0/s_axis_s2mm_tdata] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tdata] [get_bd_pins v_vid_in_axi4s_0/m_axis_video_tdata]
  connect_bd_net -net v_vid_in_axi4s_0_m_axis_video_tlast [get_bd_pins axi_vdma_0/s_axis_s2mm_tlast] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tlast] [get_bd_pins v_vid_in_axi4s_0/m_axis_video_tlast]
  connect_bd_net -net v_vid_in_axi4s_0_m_axis_video_tuser [get_bd_pins axi_vdma_0/s_axis_s2mm_tuser] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tuser] [get_bd_pins v_vid_in_axi4s_0/m_axis_video_tuser]
  connect_bd_net -net v_vid_in_axi4s_0_m_axis_video_tvalid [get_bd_pins axi_vdma_0/s_axis_s2mm_tvalid] [get_bd_pins v_axi4s_vid_out_0/s_axis_video_tvalid] [get_bd_pins v_vid_in_axi4s_0/m_axis_video_tvalid]
  connect_bd_net -net v_vid_in_axi4s_0_overflow [get_bd_ports led] [get_bd_pins v_vid_in_axi4s_0/overflow]
  connect_bd_net -net v_vid_in_axi4s_0_vtd_active_video [get_bd_pins v_tc_0/active_video_in] [get_bd_pins v_vid_in_axi4s_0/vtd_active_video]
  connect_bd_net -net v_vid_in_axi4s_0_vtd_hblank [get_bd_pins v_tc_0/hblank_in] [get_bd_pins v_vid_in_axi4s_0/vtd_hblank]
  connect_bd_net -net v_vid_in_axi4s_0_vtd_hsync [get_bd_pins v_tc_0/hsync_in] [get_bd_pins v_vid_in_axi4s_0/vtd_hsync]
  connect_bd_net -net v_vid_in_axi4s_0_vtd_vblank [get_bd_pins v_tc_0/vblank_in] [get_bd_pins v_vid_in_axi4s_0/vtd_vblank]
  connect_bd_net -net v_vid_in_axi4s_0_vtd_vsync [get_bd_pins v_tc_0/vsync_in] [get_bd_pins v_vid_in_axi4s_0/vtd_vsync]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins v_axi4s_vid_out_0/aclken] [get_bd_pins v_axi4s_vid_out_0/aresetn] [get_bd_pins v_axi4s_vid_out_0/vid_io_out_ce] [get_bd_pins v_tc_0/clken] [get_bd_pins v_tc_0/det_clken] [get_bd_pins v_tc_0/resetn] [get_bd_pins v_vid_in_axi4s_0/aclken] [get_bd_pins v_vid_in_axi4s_0/aresetn] [get_bd_pins v_vid_in_axi4s_0/axis_enable] [get_bd_pins v_vid_in_axi4s_0/vid_io_in_ce] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  create_bd_addr_seg -range 0x20000000 -offset 0x0 [get_bd_addr_spaces axi_vdma_0/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x10000 -offset 0x43000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_vdma_0/S_AXI_LITE/Reg] SEG_axi_vdma_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs bbox_register_0/S00_AXI/S00_AXI_reg] SEG_bbox_register_0_S00_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs v_tc_0/ctrl/Reg] SEG_v_tc_0_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port DDR -pg 1 -y 660 -defaultsOSRD
preplace port vga_hs -pg 1 -y 990 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y 680 -defaultsOSRD
preplace port hdmi_clk_n -pg 1 -y 180 -defaultsOSRD
preplace port vga_vs -pg 1 -y 1010 -defaultsOSRD
preplace port clk -pg 1 -y 270 -defaultsOSRD
preplace port hdmi_clk_p -pg 1 -y 160 -defaultsOSRD
preplace port DDC -pg 1 -lvl 2:140 -defaultsOSRD -top
preplace portBus vga_b -pg 1 -y 970 -defaultsOSRD
preplace portBus hdmi_d_n -pg 1 -y 220 -defaultsOSRD
preplace portBus hdmi_hpd -pg 1 -y 740 -defaultsOSRD
preplace portBus hdmi_out_en -pg 1 -y 830 -defaultsOSRD
preplace portBus hdmi_d_p -pg 1 -y 200 -defaultsOSRD
preplace portBus vga_r -pg 1 -y 930 -defaultsOSRD
preplace portBus led -pg 1 -lvl 3:160 -defaultsOSRD -bot
preplace portBus vga_g -pg 1 -y 950 -defaultsOSRD
preplace inst v_axi4s_vid_out_0 -pg 1 -lvl 5 -y 360 -defaultsOSRD
preplace inst RGB_unpack_0 -pg 1 -lvl 6 -y 960 -defaultsOSRD
preplace inst axi_vdma_0 -pg 1 -lvl 4 -y 770 -defaultsOSRD
preplace inst v_tc_0 -pg 1 -lvl 4 -y 390 -defaultsOSRD
preplace inst rst_processing_system7_0_100M -pg 1 -lvl 2 -y 970 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 2 -y 420 -defaultsOSRD
preplace inst GND -pg 1 -lvl 9 -y 830 -defaultsOSRD
preplace inst v_vid_in_axi4s_0 -pg 1 -lvl 3 -y 280 -defaultsOSRD
preplace inst draw_bbox_0 -pg 1 -lvl 7 -y 1010 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -y 280 -defaultsOSRD
preplace inst axi_mem_intercon -pg 1 -lvl 5 -y 730 -defaultsOSRD
preplace inst dvi2rgb_0 -pg 1 -lvl 2 -y 210 -defaultsOSRD
preplace inst VCC -pg 1 -lvl 9 -y 740 -defaultsOSRD
preplace inst bbox_register_0 -pg 1 -lvl 4 -y 1010 -defaultsOSRD
preplace inst RGB_pack_0 -pg 1 -lvl 8 -y 980 -defaultsOSRD
preplace inst processing_system7_0_axi_periph -pg 1 -lvl 3 -y 790 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 6 -y 730 -defaultsOSRD
preplace inst rgb2vga_0 -pg 1 -lvl 9 -y 970 -defaultsOSRD
preplace netloc draw_bbox_0_g_out 1 7 1 2650
preplace netloc v_axi4s_vid_out_0_s_axis_video_tready 1 3 2 NJ 170 1470
preplace netloc processing_system7_0_FIXED_IO 1 6 4 NJ 680 NJ 680 NJ 680 NJ
preplace netloc axi_vdma_0_M_AXI_S2MM 1 4 1 1470
preplace netloc hdmi_clk_p_1 1 0 2 NJ 160 NJ
preplace netloc hdmi_clk_n_1 1 0 2 NJ 180 NJ
preplace netloc v_tc_0_active_video_out 1 4 1 N
preplace netloc RGB_pack_0_out_RGB 1 8 1 N
preplace netloc dvi2rgb_0_vid_pVSync 1 2 1 540
preplace netloc processing_system7_0_DDR 1 6 4 NJ 660 NJ 660 NJ 660 NJ
preplace netloc rgb2vga_0_vga_pBlue 1 9 1 NJ
preplace netloc v_vid_in_axi4s_0_m_axis_video_tdata 1 3 2 980 160 1490
preplace netloc v_tc_0_hblank_out 1 4 1 N
preplace netloc v_vid_in_axi4s_0_vtd_vblank 1 3 1 N
preplace netloc dvi2rgb_0_DDC 1 2 1 560
preplace netloc v_vid_in_axi4s_0_overflow 1 3 1 940
preplace netloc v_vid_in_axi4s_0_m_axis_video_tlast 1 3 2 970 180 1460
preplace netloc rgb2vga_0_vga_pVSync 1 9 1 NJ
preplace netloc processing_system7_0_FCLK_RESET0_N 1 1 6 180 1110 NJ 1110 NJ 1110 NJ 1110 NJ 1110 2370
preplace netloc dvi2rgb_0_vid_pVDE 1 2 1 530
preplace netloc VCC_dout 1 9 1 NJ
preplace netloc processing_system7_0_axi_periph_M02_AXI 1 3 1 960
preplace netloc RGB_pack_0_out_VSync 1 8 1 N
preplace netloc draw_bbox_0_vsync_out 1 7 1 N
preplace netloc v_vid_in_axi4s_0_vtd_active_video 1 3 1 N
preplace netloc rgb2vga_0_vga_pHSync 1 9 1 NJ
preplace netloc draw_bbox_0_r_out 1 7 1 2640
preplace netloc RGB_unpack_0_out_HSync 1 6 1 N
preplace netloc draw_bbox_0_b_out 1 7 1 2680
preplace netloc processing_system7_0_axi_periph_M01_AXI 1 3 1 1040
preplace netloc dvi2rgb_0_PixelClk 1 2 7 530 470 1000 610 1480 610 1870 1090 2410 870 NJ 1090 NJ
preplace netloc RGB_unpack_0_out_B 1 6 1 2380
preplace netloc RGB_pack_0_out_HSync 1 8 1 N
preplace netloc RGB_pack_0_out_DE 1 8 1 N
preplace netloc draw_bbox_0_hsync_out 1 7 1 N
preplace netloc RGB_unpack_0_out_VSync 1 6 1 N
preplace netloc hdmi_d_p_1 1 0 2 NJ 200 NJ
preplace netloc rgb2vga_0_vga_pRed 1 9 1 NJ
preplace netloc processing_system7_0_FCLK_CLK0 1 1 6 180 870 540 620 1010 910 1490 850 1880 850 2410
preplace netloc rgb2vga_0_vga_pGreen 1 9 1 NJ
preplace netloc hdmi_d_n_1 1 0 2 NJ 220 NJ
preplace netloc v_vid_in_axi4s_0_m_axis_video_tvalid 1 3 2 950 140 1480
preplace netloc GND_dout 1 9 1 NJ
preplace netloc rst_processing_system7_0_100M_interconnect_aresetn 1 2 3 530 630 NJ 630 NJ
preplace netloc dvi2rgb_0_vid_pData 1 2 1 560
preplace netloc RGB_unpack_0_out_G 1 6 1 2400
preplace netloc processing_system7_0_axi_periph_M00_AXI 1 3 1 960
preplace netloc dvi2rgb_0_vid_pHSync 1 2 1 550
preplace netloc v_axi4s_vid_out_0_vid_active_video 1 5 1 1910
preplace netloc v_axi4s_vid_out_0_vid_data 1 5 1 1920
preplace netloc v_vid_in_axi4s_0_vtd_hsync 1 3 1 N
preplace netloc v_tc_0_hsync_out 1 4 1 N
preplace netloc v_tc_0_vsync_out 1 4 1 N
preplace netloc v_axi4s_vid_out_0_vtg_ce 1 3 3 1040 130 NJ 130 1870
preplace netloc v_axi4s_vid_out_0_vid_hsync 1 5 1 1900
preplace netloc v_axi4s_vid_out_0_vid_vsync 1 5 1 1890
preplace netloc clk_wiz_0_clk_out1 1 1 1 NJ
preplace netloc draw_bbox_0_de_out 1 7 1 2660
preplace netloc bbox_register_0_bbox_0 1 4 3 NJ 990 NJ 1070 2420
preplace netloc processing_system7_0_M_AXI_GP0 1 2 5 560 590 NJ 590 NJ 590 NJ 590 2370
preplace netloc RGB_unpack_0_out_DE 1 6 1 2390
preplace netloc bbox_register_0_bbox_1 1 4 3 NJ 1010 NJ 1080 N
preplace netloc xlconstant_0_dout 1 2 3 550 480 1030 600 1460
preplace netloc v_vid_in_axi4s_0_vtd_hblank 1 3 1 N
preplace netloc axi_mem_intercon_M00_AXI 1 5 1 1880
preplace netloc bbox_register_0_bbox_2 1 4 3 NJ 1030 NJ 1100 N
preplace netloc v_tc_0_vblank_out 1 4 1 N
preplace netloc v_vid_in_axi4s_0_vtd_vsync 1 3 1 N
preplace netloc rst_processing_system7_0_100M_peripheral_aresetn 1 2 3 550 950 1020 620 1480
preplace netloc RGB_unpack_0_out_R 1 6 1 2420
preplace netloc clk_1 1 0 1 NJ
preplace netloc v_vid_in_axi4s_0_m_axis_video_tuser 1 3 2 990 190 1450
levelinfo -pg 1 0 100 360 750 1250 1670 2150 2530 2790 3050 3220 -top 0 -bot 1260
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


