# 
# Copyright 2020 Muhammad Hadir Khan
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# User config
set ::env(DESIGN_NAME) Ibtida_top_dffram_cv 

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/../../verilog/rtl/defines.v  $::env(DESIGN_DIR)/../../verilog/rtl/ibtida-soc/Ibtida_top_dffram_cv.v $::env(DESIGN_DIR)/src/DFFRAM*.v ]
#set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/DFFRAM.v]
#set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/lef/DFFRAM.lef]
#set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/gds/DFFRAM.gds]
#set ::env(FP_SIZING) absolute
#set ::env(DIE_AREA) "0 0 2100 2500"

set ::env(FP_CORE_UTIL) 50
set ::env(PL_TARGET_DENSITY) 0.6
set ::env(DESIGN_IS_CORE) 0
set ::env(GLB_RT_MAXLAYER) 5
set ::env(GLB_RT_ADJUSTMENT) 0.3
set ::env(FP_PDN_CORE_RING) 0
set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg
set ::env(SYNTH_STRATEGY) 2
set ::env(SYNTH_MAX_FANOUT) 4
set ::env(PDN_CFG) $::env(DESIGN_DIR)/pdn.tcl

set ::env(GENERATE_FINAL_SUMMARY_REPORT) 1
set ::env(SYNTH_READ_BLACKBOX_LIB) 1
set ::env(BASE_SDC_FILE) $::env(DESIGN_DIR)/src/Ibtida_top_dffram_cv.sdc
                                                                             
# Fill this
set ::env(CLOCK_PERIOD) "80"
set ::env(CLOCK_PORT) "wb_clk_i"

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

