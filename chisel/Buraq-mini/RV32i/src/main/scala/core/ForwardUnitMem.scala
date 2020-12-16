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

class ForwardUnitMem extends Module {
  val io = IO(new Bundle {
    val EX_MEM_RS2SEL = Input(UInt(5.W))
    val MEM_WB_RDSEL = Input(UInt(5.W))
    val EX_MEM_MEMWR = Input(UInt(1.W))
    val MEM_WB_MEMRD = Input(UInt(1.W))
    val forward = Output(UInt(1.W))
  })

  when(io.EX_MEM_MEMWR === "b1".U && io.MEM_WB_RDSEL =/= "b00000".U && io.MEM_WB_MEMRD === "b1".U && (io.EX_MEM_RS2SEL === io.MEM_WB_RDSEL)) {
    io.forward := "b1".U
  } .otherwise {
    io.forward := "b0".U
  }

}
