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

set_cmd_units -time ns -capacitance pF -current mA -voltage V -resistance kOhm -distance um
#set SCL		/home/merlproj/backend-tools/pdks/sky130A/libs.ref/sky130_fd_sc_hd/verilog/
set SCL         /home/merlproj/backend-tools/openlane_rc4/designs/aireen_dffram/syn/sky130_fd_sc_hd__tt_025C_1v80.lib
set IO_PCT          0.2     
set CLOCK_PERIOD    80
create_clock [get_ports CLK]  -name clk  -period $CLOCK_PERIOD
set input_delay_value [expr $CLOCK_PERIOD * $IO_PCT]
set output_delay_value [expr $CLOCK_PERIOD * $IO_PCT]

set_input_delay $input_delay_value  -clock clk [get_port A]
set_input_delay $input_delay_value  -clock clk [get_port EN]
set_input_delay $input_delay_value  -clock clk [get_port Di]
set_input_delay $input_delay_value  -clock clk [get_port WE]

set_load  0.0136390000 [all_outputs] 

