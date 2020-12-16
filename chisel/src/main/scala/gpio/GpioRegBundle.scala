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
import chisel3._
/**
 * This file contains all the bundles that will be required by the peripheral
 */

// using val in the parameter DW to avoid cloneType error
class GPIOReg2Hw(val DW: Int = 32) extends Bundle {
  val intr_state = new Bundle {
    val q = Output(UInt(DW.W))
  }

  val intr_enable = new Bundle {
    val q = Output(UInt(DW.W))
  }

  val intr_test = new Bundle {
    val q = Output(UInt(DW.W))
    val qe = Output(Bool())
  }

  val direct_out = new Bundle {
    val q = Output(UInt(DW.W))
    val qe = Output(Bool())
  }

  val masked_out_lower = new Bundle {
    val data = new Bundle {
      val q = Output(UInt((DW/2).W))  // half word data
      val qe = Output(Bool())
    }
    val mask = new Bundle {
      val q = Output(UInt((DW/2).W))  // half word mask
      val qe = Output(Bool())
    }
  }

  val masked_out_upper = new Bundle {
    val data = new Bundle {
      val q = Output(UInt((DW/2).W))
      val qe = Output(Bool())
    }
    val mask = new Bundle {
      val q = Output(UInt((DW/2).W))
      val qe = Output(Bool())
    }
  }

  val direct_oe = new Bundle {
    val q = Output(UInt(DW.W))
    val qe = Output(Bool())
  }

  val masked_oe_lower = new Bundle {
    val data = new Bundle {
      val q = Output(UInt((DW/2).W))
      val qe = Output(Bool())
    }
    val mask = new Bundle {
      val q = Output(UInt((DW/2).W))
      val qe = Output(Bool())
    }
  }

  val masked_oe_upper = new Bundle {
    val data = new Bundle {
      val q = Output(UInt((DW/2).W))
      val qe = Output(Bool())
    }
    val mask = new Bundle {
      val q = Output(UInt((DW/2).W))
      val qe = Output(Bool())
    }
  }

  val intr_ctrl_en_rising = new Bundle {
    val q = Output(UInt(DW.W))
  }

  val intr_ctrl_en_falling = new Bundle {
    val q = Output(UInt(DW.W))
  }

  val intr_ctrl_en_lvlHigh = new Bundle {
    val q = Output(UInt(DW.W))
  }

  val intr_ctrl_en_lvlLow = new Bundle {
    val q = Output(UInt(DW.W))
  }

}

// using val in the parameter DW to avoid cloneType error
class GPIOHw2Reg(val DW: Int = 32) extends Bundle {
  val intr_state = new Bundle {
    val d = Input(UInt(DW.W))
    val de = Input(Bool())
  }

  val data_in = new Bundle {
    val d = Input(UInt(DW.W))
    val de = Input(Bool())
  }

  val direct_out = new Bundle {
    val d = Input(UInt(DW.W))
  }

  val masked_out_lower = new Bundle {
    val data = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
    val mask = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
  }

  val masked_out_upper = new Bundle {
    val data = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
    val mask = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
  }

  val direct_oe = new Bundle {
    val d = Input(UInt(DW.W))
  }

  val masked_oe_lower = new Bundle {
    val data = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
    val mask = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
  }

  val masked_oe_upper = new Bundle {
    val data = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
    val mask = new Bundle {
      val d = Input(UInt((DW/2).W))
    }
  }
}


