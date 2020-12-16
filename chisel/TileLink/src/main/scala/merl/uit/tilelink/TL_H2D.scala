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

// TileLink Host to Device (Channel A ports) TL_H2D
class TL_H2D(implicit val conf: TLConfiguration) extends Bundle {
  val a_valid = Output(Bool())
  val a_opcode = Output(UInt(3.W))
  val a_param = Output(UInt(3.W))
  val a_size = Output(UInt(conf.TL_SZW.W))
  val a_source = Output(UInt(conf.TL_AIW.W))
  val a_address = Output(UInt(conf.TL_AW.W))
  val a_mask = Output(UInt(conf.TL_DBW.W))
  val a_data = Output(UInt(conf.TL_DW.W))
  val d_ready = Output(Bool())
}