// SPDX-FileCopyrightText: 2020 Muhammad Hadir Khan
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
package core

import chisel3._

class WriteBack extends Module {
    val io = IO(new Bundle {
        val MEM_WB_MemToReg = Input(UInt(1.W))
        val MEM_WB_dataMem_data = Input(SInt(32.W))
        val MEM_WB_alu_output = Input(SInt(32.W))
        val write_data = Output(SInt(32.W))
    })

    when(io.MEM_WB_MemToReg === 1.U) {
        io.write_data := io.MEM_WB_dataMem_data
    } .otherwise {
        io.write_data := io.MEM_WB_alu_output
    }

}