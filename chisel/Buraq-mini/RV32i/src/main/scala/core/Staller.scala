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

class Staller extends Module{
  val io = IO(new Bundle {
    val isUART = Input(UInt(1.W))
    val isMMIO = Input(UInt(1.W))
    val stall = Output(UInt(1.W))
  })

  when(reset.asBool() === false.B && (io.isUART === 1.U || io.isMMIO === 1.U)) {
    io.stall := 1.U
  } .otherwise {
    io.stall := 0.U
  }

}
