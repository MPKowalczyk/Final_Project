#!/bin/bash -f
# Vivado (TM) v2016.3 (64-bit)
#
# Filename    : zordon.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Sun Dec 18 17:05:12 +0100 2016
# IP Build 1681267 on Mon Oct 10 21:28:31 MDT 2016 
#
# usage: zordon.sh [-help]
# usage: zordon.sh [-lib_map_path]
# usage: zordon.sh [-noclean_files]
# usage: zordon.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'zordon.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
# ********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64"
vhdlan_opts="-full64"
vcs_elab_opts="-load "C:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vcs.dll:xilinx_register_systf" -full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm xbip_utils_v3_0_7 xbip_pipe_v3_0_3 xbip_bram18k_v3_0_3 mult_gen_v12_0_12 c_reg_fd_v12_0_3 xbip_dsp48_wrapper_v3_0_4 xbip_dsp48_addsub_v3_0_3 xbip_addsub_v3_0_3 c_addsub_v12_0_10 processing_system7_bfm_v2_0_5 axi_lite_ipif_v3_0_4 lib_cdc_v1_0_2 interrupt_control_v3_1_4 axi_gpio_v2_0_12 proc_sys_reset_v5_0_10 generic_baseblocks_v2_1_0 axi_infrastructure_v1_1_0 axi_register_slice_v2_1_10 fifo_generator_v13_1_2 axi_data_fifo_v2_1_9 axi_crossbar_v2_1_11 blk_mem_gen_v8_3_4 axi_protocol_converter_v2_1_10)

# Simulation root library directory
sim_lib_dir="vcs"

# Script info
echo -e "zordon.sh - Script generated by export_simulation (Vivado v2016.3 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
    "C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/zordon/ipshared/69dc/src/rgb2vga.vhd" \
    "$ref_dir/../../../bd/zordon/ip/zordon_rgb2vga_0_0/sim/zordon_rgb2vga_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ipshared/e147/xlconstant.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_xlconstant_0_0/sim/zordon_xlconstant_0_0.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_xlconstant_0_1/sim/zordon_xlconstant_0_1.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncBase.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/EEPROM_8b.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TWI_SlaveCtl.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/GlitchFilter.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncAsync.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/DVI_Constants.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/SyncAsyncReset.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/PhaseAlign.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/InputSERDES.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/ChannelBond.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/ResyncToBUFG.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TMDS_Decoder.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/TMDS_Clocking.vhd" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/bb2c/src/dvi2rgb.vhd" \
    "$ref_dir/../../../bd/zordon/ip/zordon_dvi2rgb_0_1/sim/zordon_dvi2rgb_0_1.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ip/zordon_clk_wiz_0_0/zordon_clk_wiz_0_0_clk_wiz.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_clk_wiz_0_0/zordon_clk_wiz_0_0.v" \
    "$ref_dir/../../../bd/zordon/hdl/zordon.v" \
    "$ref_dir/../../../bd/zordon/ipshared/7bd6/src/RGB_unpack.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_RGB_unpack_0_0/sim/zordon_RGB_unpack_0_0.v" \
    "$ref_dir/../../../bd/zordon/ipshared/31a0/src/RGB_pack.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_RGB_pack_0_0/sim/zordon_RGB_pack_0_0.v" \
    "$ref_dir/../../../bd/zordon/ipshared/0b7b/src/binary.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_binary_0_0/sim/zordon_binary_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xbip_utils_v3_0_7 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_pipe_v3_0_3 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_bram18k_v3_0_3 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work mult_gen_v12_0_12 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/hdl/mult_gen_v12_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/zordon/ip/zordon_srodek_0_0/src/mult_30_20_lm/sim/mult_30_20_lm.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work c_reg_fd_v12_0_3 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_dsp48_wrapper_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_dsp48_addsub_v3_0_3 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_addsub_v3_0_3 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work c_addsub_v12_0_10 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/hdl/c_addsub_v12_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/sum/sim/sum.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/src/akumulator.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_srodek_0_0/src/akumulator_inst/sim/akumulator_inst.v" \
    "$ref_dir/../../../bd/zordon/ipshared/ea4a/src/divider_28_20.v" \
    "$ref_dir/../../../bd/zordon/ipshared/ea4a/src/srodek.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_srodek_0_0/sim/zordon_srodek_0_0.v" \
    "$ref_dir/../../../bd/zordon/ipshared/d592/src/proste.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_proste_0_0/sim/zordon_proste_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work processing_system7_bfm_v2_0_5 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ip/zordon_processing_system7_0_0/sim/zordon_processing_system7_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work axi_lite_ipif_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/0ba0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work interrupt_control_v3_1_4 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/e956/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_gpio_v2_0_12 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/475c/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/zordon/ip/zordon_axi_gpio_0_0/sim/zordon_axi_gpio_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work proc_sys_reset_v5_0_10 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/04b4/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/zordon/ip/zordon_rst_ps7_0_50M_0/sim/zordon_rst_ps7_0_50M_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ipshared/f7c7/hdl/AXI_Slave_v1_0_S00_AXI.v" \
    "$ref_dir/../../../bd/zordon/ipshared/f7c7/hdl/AXI_Slave_v1_0.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_AXI_Slave_0_2/sim/zordon_AXI_Slave_0_2.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7ee0/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_10 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7efe/hdl/axi_register_slice_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work fifo_generator_v13_1_2 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/a807/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_1_2 $vhdlan_opts \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/a807/hdl/fifo_generator_v13_1_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_1_2 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/a807/hdl/fifo_generator_v13_1_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_9 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/10b8/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_crossbar_v2_1_11 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/d552/hdl/axi_crossbar_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ip/zordon_xbar_0/sim/zordon_xbar_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/zordon/ip/zordon_grey_scale_0_0_1/src/sum_grey/sim/sum_grey.vhd" \
    "$ref_dir/../../../bd/zordon/ip/zordon_grey_scale_0_0_1/src/mul/sim/mul.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ipshared/e05a/src/delay.v" \
    "$ref_dir/../../../bd/zordon/ipshared/e05a/src/rgb2ycbcr.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_grey_scale_0_0_1/sim/zordon_grey_scale_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work blk_mem_gen_v8_3_4 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ip/zordon_gradient_hessian_0_0/src/delayLineBRAM/simulation/blk_mem_gen_v8_3.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ip/zordon_gradient_hessian_0_0/src/delayLineBRAM/sim/delayLineBRAM.v" \
    "$ref_dir/../../../bd/zordon/ipshared/0b34/src/delayLinieBRAM_WP.v" \
    "$ref_dir/../../../bd/zordon/ipshared/0b34/src/gradient_hessian.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_gradient_hessian_0_0/sim/zordon_gradient_hessian_0_0.v" \
    "$ref_dir/../../../bd/zordon/ipshared/33ba/src/mux_5_1.v" \
    "$ref_dir/../../../bd/zordon/ip/zordon_mux_6_1_0_0/sim/zordon_mux_6_1_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_converter_v2_1_10 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/4a8b/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/db52" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/2527/hdl" +incdir+"$ref_dir/../../../../magisterium_save.srcs/sources_1/bd/zordon/ipshared/7e3a/hdl" \
    "$ref_dir/../../../bd/zordon/ip/zordon_auto_pc_0/sim/zordon_auto_pc_0.v" \
  2>&1 | tee -a vlogan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.zordon xil_defaultlib.glbl -o zordon_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./zordon_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./zordon.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  lib_map_path=""
  if [[ ($1 != "") ]]; then
    lib_map_path="$1"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key zordon_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc zordon_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./zordon.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: zordon.sh [-help]\n\
Usage: zordon.sh [-lib_map_path]\n\
Usage: zordon.sh [-reset_run]\n\
Usage: zordon.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2
