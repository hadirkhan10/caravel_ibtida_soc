# User config
set ::env(DESIGN_NAME) Ibtida_top_dffram_cv 

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/Ibtida_top_dffram_cv.v glob $::env(DESIGN_DIR)/src/DFFRAM*.v ]
#set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/DFFRAM.v]
#set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/lef/DFFRAM.lef]
#set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/gds/DFFRAM.gds]
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2100 2900"
set ::env(PL_TARGET_DENSITY) 0.4
set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg
set ::env(SYNTH_STRATEGY) 2
set ::env(SYNTH_MAX_FANOUT) 4
set ::env(PDN_CFG) $::env(DESIGN_DIR)/pdn.tcl
#set ::env(DESIGN_IS_CORE) 0
set ::env(GLB_RT_MAXLAYER) 5
set ::env(GENERATE_FINAL_SUMMARY_REPORT) 1
set ::env(SYNTH_READ_BLACKBOX_LIB) 1
set ::env(BASE_SDC_FILE) $::env(OPENLANE_ROOT)/designs/ibtida_dffram_synthesized_no_corering/src/Ibtida_top_dffram_cv.sdc
#set ::env(FP_PDN_CORE_RING) 1                                                                             
# Fill this
set ::env(CLOCK_PERIOD) "80"
set ::env(CLOCK_PORT) "wb_clk_i"

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

