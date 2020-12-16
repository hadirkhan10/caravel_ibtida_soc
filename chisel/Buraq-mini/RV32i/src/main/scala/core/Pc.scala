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

class Pc extends Module {
    val io = IO(new Bundle {
        val in = Input(SInt(32.W))
        val out = Output(SInt(32.W))
        val pc4 = Output(SInt(32.W))
    })

//    val reg = RegInit(256.S(32.W) - 4.S(32.W))
val reg = RegInit(48.S(32.W) - 4.S(32.W))   // 44 -> 0x30 is base address of program memory
    reg := io.in
    io.pc4 := reg + 4.S
    io.out := reg
//    when(io.instr_gnt_i)
//    {
//      io.pc4 := reg + 4.S
//    }
//    .otherwise
//    {
//      io.pc4 := reg
//
//    }

    
}