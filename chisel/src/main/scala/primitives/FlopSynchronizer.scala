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

class FlopSynchronizer(width: Int, resetVal: UInt) extends Module {
  val io = IO(new Bundle {
    val d_in = Input(UInt(width.W))
    val q_out = Output(UInt(width.W))
  })

  val reg1 = RegInit(resetVal)
  val reg2 = RegInit(resetVal)
  reg1 := io.d_in
  reg2 := reg1
  io.q_out := reg2

}
