vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/xbip_utils_v3_0_7
vlib activehdl/xbip_pipe_v3_0_3
vlib activehdl/xbip_bram18k_v3_0_3
vlib activehdl/mult_gen_v12_0_12
vlib activehdl/c_reg_fd_v12_0_3
vlib activehdl/xbip_dsp48_wrapper_v3_0_4
vlib activehdl/xbip_dsp48_addsub_v3_0_3
vlib activehdl/xbip_addsub_v3_0_3
vlib activehdl/c_addsub_v12_0_10
vlib activehdl/processing_system7_bfm_v2_0_5
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_gpio_v2_0_12
vlib activehdl/proc_sys_reset_v5_0_10
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_10
vlib activehdl/fifo_generator_v13_1_2
vlib activehdl/axi_data_fifo_v2_1_9
vlib activehdl/axi_crossbar_v2_1_11
vlib activehdl/blk_mem_gen_v8_3_4
vlib activehdl/axi_protocol_converter_v2_1_10

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap xbip_utils_v3_0_7 activehdl/xbip_utils_v3_0_7
vmap xbip_pipe_v3_0_3 activehdl/xbip_pipe_v3_0_3
vmap xbip_bram18k_v3_0_3 activehdl/xbip_bram18k_v3_0_3
vmap mult_gen_v12_0_12 activehdl/mult_gen_v12_0_12
vmap c_reg_fd_v12_0_3 activehdl/c_reg_fd_v12_0_3
vmap xbip_dsp48_wrapper_v3_0_4 activehdl/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_3 activehdl/xbip_dsp48_addsub_v3_0_3
vmap xbip_addsub_v3_0_3 activehdl/xbip_addsub_v3_0_3
vmap c_addsub_v12_0_10 activehdl/c_addsub_v12_0_10
vmap processing_system7_bfm_v2_0_5 activehdl/processing_system7_bfm_v2_0_5
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_12 activehdl/axi_gpio_v2_0_12
vmap proc_sys_reset_v5_0_10 activehdl/proc_sys_reset_v5_0_10
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_10 activehdl/axi_register_slice_v2_1_10
vmap fifo_generator_v13_1_2 activehdl/fifo_generator_v13_1_2
vmap axi_data_fifo_v2_1_9 activehdl/axi_data_fifo_v2_1_9
vmap axi_crossbar_v2_1_11 activehdl/axi_crossbar_v2_1_11
vmap blk_mem_gen_v8_3_4 activehdl/blk_mem_gen_v8_3_4
vmap axi_protocol_converter_v2_1_10 activehdl/axi_protocol_converter_v2_1_10

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/zordon/ipshared/69dc/src/rgb2vga.vhd" \
"../../../bd/zordon/ip/zordon_rgb2vga_0_0/sim/zordon_rgb2vga_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ipshared/e147/xlconstant.v" \
"../../../bd/zordon/ip/zordon_xlconstant_0_0/sim/zordon_xlconstant_0_0.v" \
"../../../bd/zordon/ip/zordon_xlconstant_0_1/sim/zordon_xlconstant_0_1.v" \

vcom -work xil_defaultlib -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncBase.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/EEPROM_8b.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TWI_SlaveCtl.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/GlitchFilter.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncAsync.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/DVI_Constants.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncAsyncReset.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/PhaseAlign.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/InputSERDES.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/ChannelBond.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/ResyncToBUFG.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TMDS_Decoder.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TMDS_Clocking.vhd" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/dvi2rgb.vhd" \
"../../../bd/zordon/ip/zordon_dvi2rgb_0_1/sim/zordon_dvi2rgb_0_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ip/zordon_clk_wiz_0_0/zordon_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/zordon/ip/zordon_clk_wiz_0_0/zordon_clk_wiz_0_0.v" \
"../../../bd/zordon/hdl/zordon.v" \
"../../../bd/zordon/ipshared/7bd6/src/RGB_unpack.v" \
"../../../bd/zordon/ip/zordon_RGB_unpack_0_0/sim/zordon_RGB_unpack_0_0.v" \
"../../../bd/zordon/ipshared/31a0/src/RGB_pack.v" \
"../../../bd/zordon/ip/zordon_RGB_pack_0_0/sim/zordon_RGB_pack_0_0.v" \
"../../../bd/zordon/ipshared/0b7b/src/binary.v" \
"../../../bd/zordon/ip/zordon_binary_0_0/sim/zordon_binary_0_0.v" \

vcom -work xbip_utils_v3_0_7 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_3 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_3 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_12 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/sim/mult_30_20_lm.vhd" \

vcom -work c_reg_fd_v12_0_3 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_3 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_3 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_10 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/sim/sum.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/akumulator.v" \
"../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/sim/akumulator_inst.v" \
"../../../bd/zordon/ipshared/ea4a/src/divider_28_20.v" \
"../../../bd/zordon/ipshared/ea4a/src/srodek.v" \
"../../../bd/zordon/ip/zordon_srodek_0_0/sim/zordon_srodek_0_0.v" \
"../../../bd/zordon/ipshared/d592/src/proste.v" \
"../../../bd/zordon/ip/zordon_proste_0_0/sim/zordon_proste_0_0.v" \

vlog -work processing_system7_bfm_v2_0_5  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ip/zordon_processing_system7_0_0/sim/zordon_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/0ba0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/e956/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_12 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/475c/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/zordon/ip/zordon_axi_gpio_0_0/sim/zordon_axi_gpio_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_10 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/04b4/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/zordon/ip/zordon_rst_ps7_0_50M_0/sim/zordon_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ipshared/f7c7/hdl/AXI_Slave_v1_0_S00_AXI.v" \
"../../../bd/zordon/ipshared/f7c7/hdl/AXI_Slave_v1_0.v" \
"../../../bd/zordon/ip/zordon_AXI_Slave_0_2/sim/zordon_AXI_Slave_0_2.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7ee0/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_10  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7efe/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_1_2  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/a807/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_2 -93 \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/a807/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_2  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/a807/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work axi_data_fifo_v2_1_9  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/10b8/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_11  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/d552/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ip/zordon_xbar_0/sim/zordon_xbar_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/zordon/ip/zordon_grey_scale_0_0_1/src/sum_grey/sim/sum_grey.vhd" \
"../../../bd/zordon/ip/zordon_grey_scale_0_0_1/src/mul/sim/mul.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ipshared/e05a/src/delay.v" \
"../../../bd/zordon/ipshared/e05a/src/rgb2ycbcr.v" \
"../../../bd/zordon/ip/zordon_grey_scale_0_0_1/sim/zordon_grey_scale_0_0.v" \

vlog -work blk_mem_gen_v8_3_4  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_gradient_hessian_0_0/src/delayLineBRAM/simulation/blk_mem_gen_v8_3.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ip/zordon_gradient_hessian_0_0/src/delayLineBRAM/sim/delayLineBRAM.v" \
"../../../bd/zordon/ipshared/0b34/src/delayLinieBRAM_WP.v" \
"../../../bd/zordon/ipshared/0b34/src/gradient_hessian.v" \
"../../../bd/zordon/ip/zordon_gradient_hessian_0_0/sim/zordon_gradient_hessian_0_0.v" \
"../../../bd/zordon/ipshared/33ba/src/mux_5_1.v" \
"../../../bd/zordon/ip/zordon_mux_6_1_0_0/sim/zordon_mux_6_1_0_0.v" \

vlog -work axi_protocol_converter_v2_1_10  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/4a8b/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" "+incdir+../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
"../../../bd/zordon/ip/zordon_auto_pc_0/sim/zordon_auto_pc_0.v" \

vlog -work xil_defaultlib "glbl.v"

