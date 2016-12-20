-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ipshared/69dc/src/rgb2vga.vhd" \
  "../../../bd/zordon/ip/zordon_rgb2vga_0_0/sim/zordon_rgb2vga_0_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ipshared/e147/xlconstant.v" \
  "../../../bd/zordon/ip/zordon_xlconstant_0_0/sim/zordon_xlconstant_0_0.v" \
  "../../../bd/zordon/ip/zordon_xlconstant_0_1/sim/zordon_xlconstant_0_1.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncBase.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/EEPROM_8b.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TWI_SlaveCtl.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/GlitchFilter.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncAsync.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/DVI_Constants.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncAsyncReset.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/PhaseAlign.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/InputSERDES.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/ChannelBond.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/ResyncToBUFG.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TMDS_Decoder.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TMDS_Clocking.vhd" \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/bb2c/src/dvi2rgb.vhd" \
  "../../../bd/zordon/ip/zordon_dvi2rgb_0_1/sim/zordon_dvi2rgb_0_1.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_clk_wiz_0_0/zordon_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/zordon/ip/zordon_clk_wiz_0_0/zordon_clk_wiz_0_0.v" \
  "../../../bd/zordon/hdl/zordon.v" \
  "../../../bd/zordon/ipshared/7bd6/src/RGB_unpack.v" \
  "../../../bd/zordon/ip/zordon_RGB_unpack_0_0/sim/zordon_RGB_unpack_0_0.v" \
  "../../../bd/zordon/ipshared/31a0/src/RGB_pack.v" \
  "../../../bd/zordon/ip/zordon_RGB_pack_0_0/sim/zordon_RGB_pack_0_0.v" \
  "../../../bd/zordon/ipshared/0b7b/src/binary.v" \
  "../../../bd/zordon/ip/zordon_binary_0_0/sim/zordon_binary_0_0.v" \
-endlib
-makelib ies/xbip_utils_v3_0_7 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_pipe_v3_0_3 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_bram18k_v3_0_3 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/mult_gen_v12_0_12 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/sim/mult_30_20_lm.vhd" \
-endlib
-makelib ies/c_reg_fd_v12_0_3 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_dsp48_addsub_v3_0_3 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_addsub_v3_0_3 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/c_addsub_v12_0_10 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/c_addsub_v12_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/sim/sum.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/akumulator.v" \
  "../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/sim/akumulator_inst.v" \
  "../../../bd/zordon/ipshared/ea4a/src/divider_28_20.v" \
  "../../../bd/zordon/ipshared/ea4a/src/srodek.v" \
  "../../../bd/zordon/ip/zordon_srodek_0_0/sim/zordon_srodek_0_0.v" \
  "../../../bd/zordon/ipshared/d592/src/proste.v" \
  "../../../bd/zordon/ip/zordon_proste_0_0/sim/zordon_proste_0_0.v" \
-endlib
-makelib ies/processing_system7_bfm_v2_0_5 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_processing_system7_0_0/sim/zordon_processing_system7_0_0.v" \
-endlib
-makelib ies/axi_lite_ipif_v3_0_4 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/0ba0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/interrupt_control_v3_1_4 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/e956/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib ies/axi_gpio_v2_0_12 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/475c/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_axi_gpio_0_0/sim/zordon_axi_gpio_0_0.vhd" \
-endlib
-makelib ies/proc_sys_reset_v5_0_10 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/04b4/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_rst_ps7_0_50M_0/sim/zordon_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ipshared/f7c7/hdl/AXI_Slave_v1_0_S00_AXI.v" \
  "../../../bd/zordon/ipshared/f7c7/hdl/AXI_Slave_v1_0.v" \
  "../../../bd/zordon/ip/zordon_AXI_Slave_0_2/sim/zordon_AXI_Slave_0_2.v" \
-endlib
-makelib ies/generic_baseblocks_v2_1_0 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/7ee0/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_infrastructure_v1_1_0 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies/axi_register_slice_v2_1_10 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/7efe/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies/fifo_generator_v13_1_2 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/a807/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies/fifo_generator_v13_1_2 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/a807/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_2 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/a807/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies/axi_data_fifo_v2_1_9 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/10b8/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_crossbar_v2_1_11 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/d552/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_xbar_0/sim/zordon_xbar_0.v" \
  "../../../bd/zordon/ip/zordon_ila_0_0/sim/zordon_ila_0_0.v" \
-endlib
-makelib ies/axi_protocol_converter_v2_1_10 \
  "../../../../magisterium.srcs/sources_1/bd/zordon/ipshared/4a8b/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/zordon/ip/zordon_auto_pc_0/sim/zordon_auto_pc_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

