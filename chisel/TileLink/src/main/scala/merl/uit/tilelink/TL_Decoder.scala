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
package merl.uit.tilelink

import chisel3._

class TL_Decoder(N: Int, addrMap: AddressMap)(implicit val conf: TLConfiguration) extends Module {
  val io = IO(new Bundle {
    val addr_i = Input(UInt(32.W))
    val dev_sel = Output(UInt(N.W))
  })

  io.dev_sel := N.asUInt
  when((io.addr_i & ~addrMap.ADDR_MASK_GPIO) === addrMap.ADDR_SPACE_GPIO) {
    io.dev_sel := TL_Peripherals.deviceMap("gpio")
  } .elsewhen((io.addr_i & ~addrMap.ADDR_MASK_UART) === addrMap.ADDR_SPACE_UART) {
    io.dev_sel := TL_Peripherals.deviceMap("uart")
  }
}
