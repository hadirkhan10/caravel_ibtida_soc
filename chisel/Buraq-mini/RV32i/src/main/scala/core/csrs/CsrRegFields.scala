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

object MSTAT_BITS{
  val MIE      = 3
  val MPIE     = 7
  val MPP_LOW  = 11
  val MPP_HIGH = 12
  val MPRV     = 17
  val TW       = 21
}

// machine interrupt enable/pening bits
// X notation is used because both registers mie and mip have
// same bits for interrupt enable/pending
object MIX_BITS{
  val MSIX      = 3
  val MTIX      = 7
  val MEIX      = 11
  //  val M FIX_LOW  = 16
  //  val MFIX_HIGH = 30
}
