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

class BranchLogic extends Module {
  val io = IO(new Bundle {
    val in_rs1 = Input(SInt(32.W))
    val in_rs2 = Input(SInt(32.W))
    val in_func3 = Input(UInt(3.W))
    val output = Output(UInt(1.W))
  })

  when(io.in_func3 === "b000".U) {
    // BEQ
    when(io.in_rs1 === io.in_rs2) {
      io.output := 1.U
    } .otherwise {
      io.output := 0.U
    }
  } .elsewhen(io.in_func3 === "b001".U) {
    // BNE
    when(io.in_rs1 =/= io.in_rs2) {
      io.output := 1.U
    } .otherwise {
      io.output := 0.U
    }
  } .elsewhen(io.in_func3 === "b100".U) {
    // BLT
    when(io.in_rs1 < io.in_rs2) {
      io.output := 1.U
    } .otherwise {
      io.output := 0.U
    }
  } .elsewhen(io.in_func3 === "b101".U) {
    // BGE
    when(io.in_rs1 >= io.in_rs2) {
      io.output := 1.U
    } .otherwise {
      io.output := 0.U
    }
  } .elsewhen(io.in_func3 === "b110".U) {
    // BLTU
    when(io.in_rs1.asUInt < io.in_rs2.asUInt) {
      io.output := 1.U
    } .otherwise {
      io.output := 0.U
    }
  } .elsewhen(io.in_func3 === "b111".U) {
    // BGEU
    when(io.in_rs1.asUInt >= io.in_rs2.asUInt) {
      io.output := 1.U
    } .otherwise {
      io.output := 0.U
    }
  } .otherwise {
    io.output := 0.U
  }

}
