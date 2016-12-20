# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "HIGH_B" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HIGH_G" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HIGH_R" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOW_B" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOW_G" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOW_R" -parent ${Page_0}


}

proc update_PARAM_VALUE.HIGH_B { PARAM_VALUE.HIGH_B } {
	# Procedure called to update HIGH_B when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HIGH_B { PARAM_VALUE.HIGH_B } {
	# Procedure called to validate HIGH_B
	return true
}

proc update_PARAM_VALUE.HIGH_G { PARAM_VALUE.HIGH_G } {
	# Procedure called to update HIGH_G when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HIGH_G { PARAM_VALUE.HIGH_G } {
	# Procedure called to validate HIGH_G
	return true
}

proc update_PARAM_VALUE.HIGH_R { PARAM_VALUE.HIGH_R } {
	# Procedure called to update HIGH_R when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HIGH_R { PARAM_VALUE.HIGH_R } {
	# Procedure called to validate HIGH_R
	return true
}

proc update_PARAM_VALUE.LOW_B { PARAM_VALUE.LOW_B } {
	# Procedure called to update LOW_B when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOW_B { PARAM_VALUE.LOW_B } {
	# Procedure called to validate LOW_B
	return true
}

proc update_PARAM_VALUE.LOW_G { PARAM_VALUE.LOW_G } {
	# Procedure called to update LOW_G when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOW_G { PARAM_VALUE.LOW_G } {
	# Procedure called to validate LOW_G
	return true
}

proc update_PARAM_VALUE.LOW_R { PARAM_VALUE.LOW_R } {
	# Procedure called to update LOW_R when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOW_R { PARAM_VALUE.LOW_R } {
	# Procedure called to validate LOW_R
	return true
}


proc update_MODELPARAM_VALUE.LOW_R { MODELPARAM_VALUE.LOW_R PARAM_VALUE.LOW_R } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOW_R}] ${MODELPARAM_VALUE.LOW_R}
}

proc update_MODELPARAM_VALUE.HIGH_R { MODELPARAM_VALUE.HIGH_R PARAM_VALUE.HIGH_R } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HIGH_R}] ${MODELPARAM_VALUE.HIGH_R}
}

proc update_MODELPARAM_VALUE.LOW_G { MODELPARAM_VALUE.LOW_G PARAM_VALUE.LOW_G } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOW_G}] ${MODELPARAM_VALUE.LOW_G}
}

proc update_MODELPARAM_VALUE.HIGH_G { MODELPARAM_VALUE.HIGH_G PARAM_VALUE.HIGH_G } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HIGH_G}] ${MODELPARAM_VALUE.HIGH_G}
}

proc update_MODELPARAM_VALUE.LOW_B { MODELPARAM_VALUE.LOW_B PARAM_VALUE.LOW_B } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOW_B}] ${MODELPARAM_VALUE.LOW_B}
}

proc update_MODELPARAM_VALUE.HIGH_B { MODELPARAM_VALUE.HIGH_B PARAM_VALUE.HIGH_B } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HIGH_B}] ${MODELPARAM_VALUE.HIGH_B}
}

