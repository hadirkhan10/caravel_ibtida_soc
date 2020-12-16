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
package uart
import chisel3._

object UartAddressMap {
  val UART_INTR_STATE_OFFSET = 0.U
  val UART_INTR_ENABLE_OFFSET = 4.U
  val UART_INTR_TEST_OFFSET = 8.U
  val UART_CTRL_OFFSET = 12.U
  val UART_STATUS_OFFSET = 16.U
  val UART_RDATA_OFFSET = 20.U
  val UART_WDATA_OFFSET = 24.U
  val UART_FIFO_CTRL_OFFSET = 28.U
  val UART_FIFO_STATUS_OFFSET = 32.U
  val UART_OVRD_OFFSET = 36.U
}
