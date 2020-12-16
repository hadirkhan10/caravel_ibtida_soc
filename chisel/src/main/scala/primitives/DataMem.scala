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
package primitives
import chisel3._


class DataMem extends Module {
  val io = IO(new Bundle {
    val en_i = Input(Bool())   // active high memory enable
    val we_i = Input(Vec(4, Bool()))    // active high write enable which acts as a mask as well
    val addr_i = Input(UInt(6.W))
    val wdata_i = Input(Vec(4, UInt(8.W)))
    //val wmask_i = Input(Vec(4, Bool()))
    val rdata_o = Output(Vec(4, UInt(8.W)))
  })

  val mem = SyncReadMem(64, Vec(4, UInt(8.W)))
  when(io.en_i) {
    io.rdata_o := mem.read(io.addr_i)
    when(io.we_i.contains(true.B).asBool()) {
      mem.write(io.addr_i, io.wdata_i, io.we_i)
    }
  } .otherwise {
    io.rdata_o := DontCare
  }

//  when(io.en_i && io.we_i) {
//    mem.write(io.addr_i, io.wdata_i, io.wmask_i)
//    io.rdata_o := DontCare
//  } .elsewhen(!io.en_i && io.we_i) {
//    io.rdata_o := mem.read(io.addr_i)
//  } .otherwise {
//    io.rdata_o := DontCare
//  }

}