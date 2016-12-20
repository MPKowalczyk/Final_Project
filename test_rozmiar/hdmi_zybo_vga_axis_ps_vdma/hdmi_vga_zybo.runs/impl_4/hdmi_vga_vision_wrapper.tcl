proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -ruleid {2147483647}  -id {IP_Flow 19-1663}  -string {{CRITICAL WARNING: [IP_Flow 19-1663] Duplicate IP found for 'DigilentInc:user:Digi_LED:1.0'. The one found in IP location '/home/marshall/workspace/ip_repo/Digi_LED_1.0' will take precedence over the same IP in location /home/marshall/workspace/ip_repo/edit_Digi_LED_v1_0.srcs/sources_1/imports/Digi_LED_1.0}}  -suppress 

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir D:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.cache/wt [current_project]
  set_property parent.project_path D:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.xpr [current_project]
  set_property ip_repo_paths {
  d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.cache/ip
  D:/zybo/hdmi_zybo_vga_axi_stream/hdmi_library
} [current_project]
  set_property ip_output_repo d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.cache/ip [current_project]
  add_files -quiet D:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.runs/synth_4/hdmi_vga_vision_wrapper.dcp
  read_xdc -ref hdmi_vga_vision_dvi2rgb_0_0 -cells U0 d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_dvi2rgb_0_0/src/dvi2rgb.xdc
  set_property processing_order EARLY [get_files d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_dvi2rgb_0_0/src/dvi2rgb.xdc]
  read_xdc -prop_thru_buffers -ref hdmi_vga_vision_clk_wiz_0_0 -cells inst d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_clk_wiz_0_0/hdmi_vga_vision_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_clk_wiz_0_0/hdmi_vga_vision_clk_wiz_0_0_board.xdc]
  read_xdc -ref hdmi_vga_vision_clk_wiz_0_0 -cells inst d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_clk_wiz_0_0/hdmi_vga_vision_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_clk_wiz_0_0/hdmi_vga_vision_clk_wiz_0_0.xdc]
  read_xdc D:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/constrs_1/imports/Downloads/ZYBO_Master.xdc
  read_xdc -ref hdmi_vga_vision_v_vid_in_axi4s_0_0 -cells inst d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_v_vid_in_axi4s_0_0/hdmi_vga_vision_v_vid_in_axi4s_0_0_clocks.xdc
  set_property processing_order LATE [get_files d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_v_vid_in_axi4s_0_0/hdmi_vga_vision_v_vid_in_axi4s_0_0_clocks.xdc]
  read_xdc -ref hdmi_vga_vision_v_tc_0_0 -cells U0 d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_v_tc_0_0/hdmi_vga_vision_v_tc_0_0_clocks.xdc
  set_property processing_order LATE [get_files d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_v_tc_0_0/hdmi_vga_vision_v_tc_0_0_clocks.xdc]
  read_xdc -ref hdmi_vga_vision_v_axi4s_vid_out_0_0 -cells inst d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_v_axi4s_vid_out_0_0/hdmi_vga_vision_v_axi4s_vid_out_0_0_clocks.xdc
  set_property processing_order LATE [get_files d:/zybo/hdmi_zybo_vga_axi_stream/hdmi_vga_zybo.srcs/sources_1/bd/hdmi_vga_vision/ip/hdmi_vga_vision_v_axi4s_vid_out_0_0/hdmi_vga_vision_v_axi4s_vid_out_0_0_clocks.xdc]
  link_design -top hdmi_vga_vision_wrapper -part xc7z010clg400-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force hdmi_vga_vision_wrapper_opt.dcp
  report_drc -file hdmi_vga_vision_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file hdmi_vga_vision_wrapper.hwdef}
  place_design 
  write_checkpoint -force hdmi_vga_vision_wrapper_placed.dcp
  report_io -file hdmi_vga_vision_wrapper_io_placed.rpt
  report_utilization -file hdmi_vga_vision_wrapper_utilization_placed.rpt -pb hdmi_vga_vision_wrapper_utilization_placed.pb
  report_control_sets -verbose -file hdmi_vga_vision_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force hdmi_vga_vision_wrapper_routed.dcp
  report_drc -file hdmi_vga_vision_wrapper_drc_routed.rpt -pb hdmi_vga_vision_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file hdmi_vga_vision_wrapper_timing_summary_routed.rpt -rpx hdmi_vga_vision_wrapper_timing_summary_routed.rpx
  report_power -file hdmi_vga_vision_wrapper_power_routed.rpt -pb hdmi_vga_vision_wrapper_power_summary_routed.pb
  report_route_status -file hdmi_vga_vision_wrapper_route_status.rpt -pb hdmi_vga_vision_wrapper_route_status.pb
  report_clock_utilization -file hdmi_vga_vision_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force hdmi_vga_vision_wrapper.mmi }
  write_bitstream -force hdmi_vga_vision_wrapper.bit 
  catch { write_sysdef -hwdef hdmi_vga_vision_wrapper.hwdef -bitfile hdmi_vga_vision_wrapper.bit -meminfo hdmi_vga_vision_wrapper.mmi -file hdmi_vga_vision_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

