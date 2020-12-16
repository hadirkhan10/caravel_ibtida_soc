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
package gpio
import chisel3.util._

object GpioId {
  val gpio_intr_state :: gpio_intr_enable :: gpio_intr_test :: gpio_data_in :: gpio_direct_out :: gpio_masked_out_lower :: gpio_masked_out_upper :: gpio_direct_oe :: gpio_masked_oe_lower :: gpio_masked_oe_upper :: gpio_intr_ctrl_en_rising :: gpio_intr_ctrl_en_falling :: gpio_intr_ctrl_en_lvlHigh :: gpio_intr_ctrl_en_lvlLow = Enum(14)
}
