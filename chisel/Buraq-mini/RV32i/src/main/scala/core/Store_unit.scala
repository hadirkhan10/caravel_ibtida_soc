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
import chisel3.util.Cat
import chisel3.util.Fill
class Store_unit extends Module
{
    val io=IO(new Bundle{
        val func3 = Input(UInt(3.W))
        val MemWrite= Input(UInt(1.W))
        val Rs2  = Input(SInt(32.W))
        val StoreData = Output(SInt(32.W))
})

        val sh = io.Rs2(15,0)
        val sb = io.Rs2(7,0)
        val zero = 0.U
    when(io.func3 === "b001".U && io.MemWrite === 1.U)
    {
        io.StoreData := Cat(Fill(16,zero),sh).asSInt
    }
    .elsewhen(io.func3 === "b000".U && io.MemWrite === 1.U)
    {
         io.StoreData := Cat(Fill(24,zero),sb).asSInt
    }
    .otherwise
    {
         io.StoreData := io.Rs2
    }
    
    
}