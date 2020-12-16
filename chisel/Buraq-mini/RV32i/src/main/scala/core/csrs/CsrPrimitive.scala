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
package main.scala.core.csrs
import chisel3._

class CsrPrimitive(width: Int, ShadowCopy: Boolean, ResetValue: Int) extends Module
{
  val io = IO(new Bundle{
    val i_wrdata  = Input(UInt(width.W))
    val i_wr_en   = Input(Bool())
    val o_rd_data = Output(UInt(width.W))
    val o_rd_error= Output(Bool())
  })

  val rdata_q = RegInit(ResetValue.U(width.W))
  when(io.i_wr_en)
  {
    rdata_q := io.i_wrdata
  }
  io.o_rd_data := rdata_q

  if(ShadowCopy == true)
  {
    val shadow_q = RegInit(~ResetValue.U(width.W))
    when(io.i_wr_en)
    {
      shadow_q := ~io.i_wrdata
    }
    io.o_rd_error := rdata_q =/= ~shadow_q
  }
  else
  {
    io.o_rd_error := "b0".U
  }
}