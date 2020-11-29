module ID_EX(
  input         clock,
  input         reset,
  input  [31:0] io_pc_in,
  input  [31:0] io_pc4_in,
  input  [4:0]  io_rs1_sel_in,
  input  [4:0]  io_rs2_sel_in,
  input  [31:0] io_rs1_in,
  input  [31:0] io_rs2_in,
  input  [31:0] io_imm,
  input  [4:0]  io_rd_sel_in,
  input  [2:0]  io_func3_in,
  input  [6:0]  io_func7_in,
  input         io_ctrl_MemWr_in,
  input         io_ctrl_MemRd_in,
  input         io_ctrl_RegWr_in,
  input         io_ctrl_MemToReg_in,
  input  [3:0]  io_ctrl_AluOp_in,
  input  [1:0]  io_ctrl_OpA_sel_in,
  input         io_ctrl_OpB_sel_in,
  input         io_stall,
  output [31:0] io_pc_out,
  output [31:0] io_pc4_out,
  output [31:0] io_rs1_out,
  output [31:0] io_rs2_out,
  output [31:0] io_imm_out,
  output [2:0]  io_func3_out,
  output [6:0]  io_func7_out,
  output [4:0]  io_rd_sel_out,
  output [4:0]  io_rs1_sel_out,
  output [4:0]  io_rs2_sel_out,
  output        io_ctrl_MemWr_out,
  output        io_ctrl_MemRd_out,
  output        io_ctrl_RegWr_out,
  output        io_ctrl_MemToReg_out,
  output [3:0]  io_ctrl_AluOp_out,
  output [1:0]  io_ctrl_OpA_sel_out,
  output        io_ctrl_OpB_sel_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc_reg; // @[ID_EX.scala 51:25]
  reg [31:0] pc4_reg; // @[ID_EX.scala 52:26]
  reg [31:0] rs1_reg; // @[ID_EX.scala 53:26]
  reg [31:0] rs2_reg; // @[ID_EX.scala 54:26]
  reg [31:0] imm_reg; // @[ID_EX.scala 55:26]
  reg [4:0] rd_sel_reg; // @[ID_EX.scala 56:29]
  reg [4:0] rs1_sel_reg; // @[ID_EX.scala 57:30]
  reg [4:0] rs2_sel_reg; // @[ID_EX.scala 58:30]
  reg [2:0] func3_reg; // @[ID_EX.scala 59:28]
  reg [6:0] func7_reg; // @[ID_EX.scala 60:28]
  reg  ctrl_MemWr_reg; // @[ID_EX.scala 63:33]
  reg  ctrl_MemRd_reg; // @[ID_EX.scala 64:33]
  reg  ctrl_RegWr_reg; // @[ID_EX.scala 66:33]
  reg  ctrl_MemToReg_reg; // @[ID_EX.scala 67:36]
  reg [3:0] ctrl_AluOp_reg; // @[ID_EX.scala 68:33]
  reg [1:0] ctrl_OpA_sel_reg; // @[ID_EX.scala 69:35]
  reg  ctrl_OpB_sel_reg; // @[ID_EX.scala 70:35]
  wire  _T = ~io_stall; // @[ID_EX.scala 74:19]
  assign io_pc_out = pc_reg; // @[ID_EX.scala 98:19 ID_EX.scala 121:19]
  assign io_pc4_out = pc4_reg; // @[ID_EX.scala 99:20 ID_EX.scala 122:20]
  assign io_rs1_out = rs1_reg; // @[ID_EX.scala 100:20 ID_EX.scala 123:20]
  assign io_rs2_out = rs2_reg; // @[ID_EX.scala 101:20 ID_EX.scala 124:20]
  assign io_imm_out = imm_reg; // @[ID_EX.scala 102:20 ID_EX.scala 125:20]
  assign io_func3_out = func3_reg; // @[ID_EX.scala 106:22 ID_EX.scala 129:22]
  assign io_func7_out = func7_reg; // @[ID_EX.scala 107:22 ID_EX.scala 130:22]
  assign io_rd_sel_out = rd_sel_reg; // @[ID_EX.scala 103:23 ID_EX.scala 126:23]
  assign io_rs1_sel_out = rs1_sel_reg; // @[ID_EX.scala 104:24 ID_EX.scala 127:24]
  assign io_rs2_sel_out = rs2_sel_reg; // @[ID_EX.scala 105:24 ID_EX.scala 128:24]
  assign io_ctrl_MemWr_out = ctrl_MemWr_reg; // @[ID_EX.scala 109:27 ID_EX.scala 132:27]
  assign io_ctrl_MemRd_out = ctrl_MemRd_reg; // @[ID_EX.scala 110:27 ID_EX.scala 133:27]
  assign io_ctrl_RegWr_out = ctrl_RegWr_reg; // @[ID_EX.scala 112:27 ID_EX.scala 135:27]
  assign io_ctrl_MemToReg_out = ctrl_MemToReg_reg; // @[ID_EX.scala 113:30 ID_EX.scala 136:30]
  assign io_ctrl_AluOp_out = ctrl_AluOp_reg; // @[ID_EX.scala 114:27 ID_EX.scala 137:27]
  assign io_ctrl_OpA_sel_out = ctrl_OpA_sel_reg; // @[ID_EX.scala 115:29 ID_EX.scala 138:29]
  assign io_ctrl_OpB_sel_out = ctrl_OpB_sel_reg; // @[ID_EX.scala 116:29 ID_EX.scala 139:29]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc_reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pc4_reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  rs1_reg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rs2_reg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  imm_reg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  rd_sel_reg = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  rs1_sel_reg = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  rs2_sel_reg = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  func3_reg = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  func7_reg = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  ctrl_MemWr_reg = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ctrl_MemRd_reg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ctrl_RegWr_reg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  ctrl_MemToReg_reg = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ctrl_AluOp_reg = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  ctrl_OpA_sel_reg = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  ctrl_OpB_sel_reg = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pc_reg <= 32'sh0;
    end else if (_T) begin
      pc_reg <= io_pc_in;
    end
    if (reset) begin
      pc4_reg <= 32'sh0;
    end else if (_T) begin
      pc4_reg <= io_pc4_in;
    end
    if (reset) begin
      rs1_reg <= 32'sh0;
    end else if (_T) begin
      rs1_reg <= io_rs1_in;
    end
    if (reset) begin
      rs2_reg <= 32'sh0;
    end else if (_T) begin
      rs2_reg <= io_rs2_in;
    end
    if (reset) begin
      imm_reg <= 32'sh0;
    end else if (_T) begin
      imm_reg <= io_imm;
    end
    if (reset) begin
      rd_sel_reg <= 5'h0;
    end else if (_T) begin
      rd_sel_reg <= io_rd_sel_in;
    end
    if (reset) begin
      rs1_sel_reg <= 5'h0;
    end else if (_T) begin
      rs1_sel_reg <= io_rs1_sel_in;
    end
    if (reset) begin
      rs2_sel_reg <= 5'h0;
    end else if (_T) begin
      rs2_sel_reg <= io_rs2_sel_in;
    end
    if (reset) begin
      func3_reg <= 3'h0;
    end else if (_T) begin
      func3_reg <= io_func3_in;
    end
    if (reset) begin
      func7_reg <= 7'h0;
    end else if (_T) begin
      func7_reg <= io_func7_in;
    end
    if (reset) begin
      ctrl_MemWr_reg <= 1'h0;
    end else if (_T) begin
      ctrl_MemWr_reg <= io_ctrl_MemWr_in;
    end
    if (reset) begin
      ctrl_MemRd_reg <= 1'h0;
    end else if (_T) begin
      ctrl_MemRd_reg <= io_ctrl_MemRd_in;
    end
    if (reset) begin
      ctrl_RegWr_reg <= 1'h0;
    end else if (_T) begin
      ctrl_RegWr_reg <= io_ctrl_RegWr_in;
    end
    if (reset) begin
      ctrl_MemToReg_reg <= 1'h0;
    end else if (_T) begin
      ctrl_MemToReg_reg <= io_ctrl_MemToReg_in;
    end
    if (reset) begin
      ctrl_AluOp_reg <= 4'h0;
    end else if (_T) begin
      ctrl_AluOp_reg <= io_ctrl_AluOp_in;
    end
    if (reset) begin
      ctrl_OpA_sel_reg <= 2'h0;
    end else if (_T) begin
      ctrl_OpA_sel_reg <= io_ctrl_OpA_sel_in;
    end
    if (reset) begin
      ctrl_OpB_sel_reg <= 1'h0;
    end else if (_T) begin
      ctrl_OpB_sel_reg <= io_ctrl_OpB_sel_in;
    end
  end
endmodule
module EX_MEM(
  input         clock,
  input         reset,
  input         io_ctrl_MemWr_in,
  input         io_ctrl_MemRd_in,
  input         io_ctrl_RegWr_in,
  input         io_ctrl_MemToReg_in,
  input  [31:0] io_rs2_in,
  input  [4:0]  io_rd_sel_in,
  input  [31:0] io_alu_in,
  input  [2:0]  io_EX_MEM_func3,
  input         io_stall,
  output        io_ctrl_MemWr_out,
  output        io_ctrl_MemRd_out,
  output        io_ctrl_RegWr_out,
  output        io_ctrl_MemToReg_out,
  output [31:0] io_rs2_out,
  output [4:0]  io_rd_sel_out,
  output [31:0] io_alu_output,
  output [2:0]  io_EX_MEM_func3_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  reg_memWr; // @[EX_MEM.scala 30:32]
  reg  reg_memRd; // @[EX_MEM.scala 31:32]
  reg  reg_regWr; // @[EX_MEM.scala 32:32]
  reg  reg_memToReg; // @[EX_MEM.scala 33:35]
  reg [31:0] reg_rs2; // @[EX_MEM.scala 34:30]
  reg [4:0] reg_rd_sel; // @[EX_MEM.scala 35:33]
  reg [31:0] reg_alu_output; // @[EX_MEM.scala 37:37]
  reg [2:0] reg_func3; // @[EX_MEM.scala 38:37]
  wire  _T = ~io_stall; // @[EX_MEM.scala 40:19]
  assign io_ctrl_MemWr_out = reg_memWr; // @[EX_MEM.scala 64:23]
  assign io_ctrl_MemRd_out = reg_memRd; // @[EX_MEM.scala 65:23]
  assign io_ctrl_RegWr_out = reg_regWr; // @[EX_MEM.scala 66:23]
  assign io_ctrl_MemToReg_out = reg_memToReg; // @[EX_MEM.scala 67:26]
  assign io_rs2_out = reg_rs2; // @[EX_MEM.scala 68:16]
  assign io_rd_sel_out = reg_rd_sel; // @[EX_MEM.scala 69:19]
  assign io_alu_output = reg_alu_output; // @[EX_MEM.scala 71:19]
  assign io_EX_MEM_func3_out = reg_func3; // @[EX_MEM.scala 72:25]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_memWr = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg_memRd = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_regWr = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_memToReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg_rs2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_rd_sel = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  reg_alu_output = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_func3 = _RAND_7[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_memWr <= 1'h0;
    end else if (_T) begin
      reg_memWr <= io_ctrl_MemWr_in;
    end
    if (reset) begin
      reg_memRd <= 1'h0;
    end else if (_T) begin
      reg_memRd <= io_ctrl_MemRd_in;
    end
    if (reset) begin
      reg_regWr <= 1'h0;
    end else if (_T) begin
      reg_regWr <= io_ctrl_RegWr_in;
    end
    if (reset) begin
      reg_memToReg <= 1'h0;
    end else if (_T) begin
      reg_memToReg <= io_ctrl_MemToReg_in;
    end
    if (reset) begin
      reg_rs2 <= 32'sh0;
    end else if (_T) begin
      reg_rs2 <= io_rs2_in;
    end
    if (reset) begin
      reg_rd_sel <= 5'h0;
    end else if (_T) begin
      reg_rd_sel <= io_rd_sel_in;
    end
    if (reset) begin
      reg_alu_output <= 32'sh0;
    end else if (_T) begin
      reg_alu_output <= io_alu_in;
    end
    if (reset) begin
      reg_func3 <= 3'h0;
    end else if (_T) begin
      reg_func3 <= io_EX_MEM_func3;
    end
  end
endmodule
module MEM_WB(
  input         clock,
  input         reset,
  input         io_ctrl_RegWr_in,
  input         io_ctrl_MemToReg_in,
  input  [4:0]  io_rd_sel_in,
  input         io_ctrl_MemRd_in,
  input  [31:0] io_dmem_data_in,
  input  [31:0] io_alu_in,
  input         io_stall,
  output        io_ctrl_RegWr_out,
  output        io_ctrl_MemToReg_out,
  output        io_ctrl_MemRd_out,
  output [4:0]  io_rd_sel_out,
  output [31:0] io_dmem_data_out,
  output [31:0] io_alu_output
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  reg_regWr; // @[MEM_WB.scala 24:28]
  reg  reg_memToReg; // @[MEM_WB.scala 26:31]
  reg  reg_memRd; // @[MEM_WB.scala 28:28]
  reg [4:0] reg_rdSel; // @[MEM_WB.scala 30:28]
  reg [31:0] reg_dataMem_data; // @[MEM_WB.scala 32:35]
  reg [31:0] reg_alu_output; // @[MEM_WB.scala 34:33]
  wire  _T = ~io_stall; // @[MEM_WB.scala 36:19]
  assign io_ctrl_RegWr_out = reg_regWr; // @[MEM_WB.scala 45:27 MEM_WB.scala 52:27]
  assign io_ctrl_MemToReg_out = reg_memToReg; // @[MEM_WB.scala 44:30 MEM_WB.scala 51:30]
  assign io_ctrl_MemRd_out = reg_memRd; // @[MEM_WB.scala 46:27 MEM_WB.scala 53:27]
  assign io_rd_sel_out = reg_rdSel; // @[MEM_WB.scala 47:23 MEM_WB.scala 54:23]
  assign io_dmem_data_out = reg_dataMem_data; // @[MEM_WB.scala 48:26 MEM_WB.scala 55:26]
  assign io_alu_output = reg_alu_output; // @[MEM_WB.scala 49:23 MEM_WB.scala 56:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_regWr = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg_memToReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_memRd = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_rdSel = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  reg_dataMem_data = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_alu_output = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_regWr <= 1'h0;
    end else if (_T) begin
      reg_regWr <= io_ctrl_RegWr_in;
    end
    if (reset) begin
      reg_memToReg <= 1'h0;
    end else if (_T) begin
      reg_memToReg <= io_ctrl_MemToReg_in;
    end
    if (reset) begin
      reg_memRd <= 1'h0;
    end else if (_T) begin
      reg_memRd <= io_ctrl_MemRd_in;
    end
    if (reset) begin
      reg_rdSel <= 5'h0;
    end else if (_T) begin
      reg_rdSel <= io_rd_sel_in;
    end
    if (reset) begin
      reg_dataMem_data <= 32'sh0;
    end else if (_T) begin
      reg_dataMem_data <= io_dmem_data_in;
    end
    if (reset) begin
      reg_alu_output <= 32'sh0;
    end else if (_T) begin
      reg_alu_output <= io_alu_in;
    end
  end
endmodule
module Pc(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [31:0] io_out,
  output [31:0] io_pc4
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] _T_2 = 32'sh0 - 32'sh4; // @[Pc.scala 12:33]
  reg [31:0] reg_; // @[Pc.scala 12:22]
  assign io_out = reg_; // @[Pc.scala 15:12]
  assign io_pc4 = $signed(reg_) + 32'sh4; // @[Pc.scala 14:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_ <= _T_2;
    end else begin
      reg_ <= io_in;
    end
  end
endmodule
module Fetch(
  input         clock,
  input         reset,
  input         io_instr_gnt_i,
  input         io_instr_rvalid_i,
  input  [31:0] io_instr_rdata_i,
  input  [31:0] io_sb_imm,
  input  [31:0] io_uj_imm,
  input  [31:0] io_jalr_imm,
  input  [1:0]  io_ctrl_next_pc_sel,
  input         io_ctrl_out_branch,
  input         io_branchLogic_output,
  input  [31:0] io_hazardDetection_pc_out,
  input  [31:0] io_hazardDetection_inst_out,
  input  [31:0] io_hazardDetection_current_pc_out,
  input         io_hazardDetection_pc_forward,
  input         io_hazardDetection_inst_forward,
  input         io_stall,
  output [31:0] io_instr_addr_o,
  output        io_instr_req_o,
  output [31:0] io_pc_out,
  output [31:0] io_pc4_out,
  output [31:0] io_inst_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  pc_clock; // @[Fetch.scala 36:18]
  wire  pc_reset; // @[Fetch.scala 36:18]
  wire [31:0] pc_io_in; // @[Fetch.scala 36:18]
  wire [31:0] pc_io_out; // @[Fetch.scala 36:18]
  wire [31:0] pc_io_pc4; // @[Fetch.scala 36:18]
  reg [31:0] pc_reg; // @[Fetch.scala 39:19]
  reg [31:0] pc4_reg; // @[Fetch.scala 40:20]
  reg [31:0] inst_reg; // @[Fetch.scala 41:25]
  wire  _T_2 = ~io_stall; // @[Fetch.scala 53:8]
  wire [31:0] _GEN_0 = _T_2 ? $signed(pc_io_out) : $signed(pc_reg); // @[Fetch.scala 53:19]
  wire  _T_7 = io_ctrl_next_pc_sel == 2'h1; // @[Fetch.scala 90:32]
  wire  _T_10 = io_branchLogic_output & io_ctrl_out_branch; // @[Fetch.scala 91:44]
  wire [31:0] _GEN_6 = _T_10 ? $signed(io_sb_imm) : $signed(pc_io_pc4); // @[Fetch.scala 91:75]
  wire  _T_11 = io_ctrl_next_pc_sel == 2'h2; // @[Fetch.scala 99:38]
  wire  _T_12 = io_ctrl_next_pc_sel == 2'h3; // @[Fetch.scala 104:38]
  wire [31:0] _GEN_10 = _T_12 ? $signed(io_jalr_imm) : $signed(pc_io_pc4); // @[Fetch.scala 104:51]
  wire [31:0] _GEN_14 = _T_11 ? $signed(io_uj_imm) : $signed(_GEN_10); // @[Fetch.scala 99:51]
  wire [31:0] _GEN_18 = _T_7 ? $signed(_GEN_6) : $signed(_GEN_14); // @[Fetch.scala 90:45]
  wire [31:0] _GEN_22 = io_hazardDetection_pc_forward ? $signed(io_hazardDetection_pc_out) : $signed(_GEN_18); // @[Fetch.scala 86:49]
  Pc pc ( // @[Fetch.scala 36:18]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_in(pc_io_in),
    .io_out(pc_io_out),
    .io_pc4(pc_io_pc4)
  );
  assign io_instr_addr_o = {{18'd0}, pc_io_in[13:0]}; // @[Fetch.scala 47:19]
  assign io_instr_req_o = io_instr_gnt_i; // @[Fetch.scala 49:18]
  assign io_pc_out = pc_reg; // @[Fetch.scala 119:13]
  assign io_pc4_out = pc4_reg; // @[Fetch.scala 120:13]
  assign io_inst_out = inst_reg; // @[Fetch.scala 121:15]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_in = _T_2 ? $signed(_GEN_22) : $signed(pc_io_out); // @[Fetch.scala 87:16 Fetch.scala 92:20 Fetch.scala 97:20 Fetch.scala 100:18 Fetch.scala 105:18 Fetch.scala 110:18 Fetch.scala 114:14]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc_reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pc4_reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  inst_reg = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T_2) begin
      if (io_hazardDetection_pc_forward) begin
        if (_T_2) begin
          if (io_hazardDetection_inst_forward) begin
            pc_reg <= io_hazardDetection_current_pc_out;
          end else if (_T_2) begin
            pc_reg <= pc_io_out;
          end
        end else if (_T_2) begin
          pc_reg <= pc_io_out;
        end
      end else if (_T_7) begin
        if (_T_10) begin
          pc_reg <= 32'sh0;
        end else if (_T_2) begin
          if (io_hazardDetection_inst_forward) begin
            pc_reg <= io_hazardDetection_current_pc_out;
          end else if (_T_2) begin
            pc_reg <= pc_io_out;
          end
        end else if (_T_2) begin
          pc_reg <= pc_io_out;
        end
      end else if (_T_11) begin
        pc_reg <= 32'sh0;
      end else if (_T_12) begin
        pc_reg <= 32'sh0;
      end else if (_T_2) begin
        if (io_hazardDetection_inst_forward) begin
          pc_reg <= io_hazardDetection_current_pc_out;
        end else begin
          pc_reg <= _GEN_0;
        end
      end else begin
        pc_reg <= _GEN_0;
      end
    end else if (_T_2) begin
      if (io_hazardDetection_inst_forward) begin
        pc_reg <= io_hazardDetection_current_pc_out;
      end else begin
        pc_reg <= _GEN_0;
      end
    end else begin
      pc_reg <= _GEN_0;
    end
    if (_T_2) begin
      if (io_hazardDetection_pc_forward) begin
        if (_T_2) begin
          pc4_reg <= pc_io_pc4;
        end
      end else if (_T_7) begin
        if (_T_10) begin
          pc4_reg <= 32'sh0;
        end else if (_T_2) begin
          pc4_reg <= pc_io_pc4;
        end
      end else if (_T_11) begin
        pc4_reg <= 32'sh0;
      end else if (_T_12) begin
        pc4_reg <= 32'sh0;
      end else if (_T_2) begin
        pc4_reg <= pc_io_pc4;
      end
    end else if (_T_2) begin
      pc4_reg <= pc_io_pc4;
    end
    if (reset) begin
      inst_reg <= 32'h13;
    end else if (_T_2) begin
      if (io_hazardDetection_pc_forward) begin
        if (_T_2) begin
          if (io_hazardDetection_inst_forward) begin
            inst_reg <= io_hazardDetection_inst_out;
          end else if (io_instr_rvalid_i) begin
            inst_reg <= io_instr_rdata_i;
          end else begin
            inst_reg <= 32'h13;
          end
        end
      end else if (_T_7) begin
        if (_T_10) begin
          inst_reg <= 32'h13;
        end else if (_T_2) begin
          if (io_hazardDetection_inst_forward) begin
            inst_reg <= io_hazardDetection_inst_out;
          end else if (io_instr_rvalid_i) begin
            inst_reg <= io_instr_rdata_i;
          end else begin
            inst_reg <= 32'h13;
          end
        end
      end else if (_T_11) begin
        inst_reg <= 32'h13;
      end else if (_T_12) begin
        inst_reg <= 32'h13;
      end else if (_T_2) begin
        if (io_hazardDetection_inst_forward) begin
          inst_reg <= io_hazardDetection_inst_out;
        end else if (io_instr_rvalid_i) begin
          inst_reg <= io_instr_rdata_i;
        end else begin
          inst_reg <= 32'h13;
        end
      end
    end else if (_T_2) begin
      if (io_hazardDetection_inst_forward) begin
        inst_reg <= io_hazardDetection_inst_out;
      end else if (io_instr_rvalid_i) begin
        inst_reg <= io_instr_rdata_i;
      end else begin
        inst_reg <= 32'h13;
      end
    end
  end
endmodule
module HazardDetection(
  input  [31:0] io_IF_ID_INST,
  input         io_ID_EX_MEMREAD,
  input  [4:0]  io_ID_EX_REGRD,
  input  [31:0] io_pc_in,
  input  [31:0] io_current_pc,
  input         io_IF_ID_MEMREAD,
  output        io_inst_forward,
  output        io_pc_forward,
  output        io_ctrl_forward,
  output [31:0] io_inst_out,
  output [31:0] io_pc_out,
  output [31:0] io_current_pc_out
);
  wire [4:0] rs1_sel = io_IF_ID_INST[19:15]; // @[HazardDetection.scala 20:30]
  wire [4:0] rs2_sel = io_IF_ID_INST[24:20]; // @[HazardDetection.scala 21:30]
  wire  _T_2 = io_ID_EX_REGRD == rs1_sel; // @[HazardDetection.scala 24:59]
  wire  _T_3 = io_ID_EX_MEMREAD & _T_2; // @[HazardDetection.scala 24:40]
  wire  _T_6 = io_ID_EX_REGRD == rs2_sel; // @[HazardDetection.scala 35:90]
  wire  _T_7 = _T_2 | _T_6; // @[HazardDetection.scala 35:71]
  wire  _T_8 = io_ID_EX_MEMREAD & _T_7; // @[HazardDetection.scala 35:38]
  assign io_inst_forward = io_IF_ID_MEMREAD ? _T_3 : _T_8; // @[HazardDetection.scala 48:23 HazardDetection.scala 57:21 HazardDetection.scala 48:23 HazardDetection.scala 57:21]
  assign io_pc_forward = io_IF_ID_MEMREAD ? _T_3 : _T_8; // @[HazardDetection.scala 49:21 HazardDetection.scala 58:19 HazardDetection.scala 49:21 HazardDetection.scala 58:19]
  assign io_ctrl_forward = io_IF_ID_MEMREAD ? _T_3 : _T_8; // @[HazardDetection.scala 50:23 HazardDetection.scala 59:21 HazardDetection.scala 50:23 HazardDetection.scala 59:21]
  assign io_inst_out = io_IF_ID_INST; // @[HazardDetection.scala 51:19 HazardDetection.scala 60:17 HazardDetection.scala 51:19 HazardDetection.scala 60:17]
  assign io_pc_out = io_pc_in; // @[HazardDetection.scala 52:17 HazardDetection.scala 61:15 HazardDetection.scala 52:17 HazardDetection.scala 61:15]
  assign io_current_pc_out = io_current_pc; // @[HazardDetection.scala 53:25 HazardDetection.scala 62:23 HazardDetection.scala 53:25 HazardDetection.scala 62:23]
endmodule
module InstructionTypeDecode(
  input  [6:0] io_func7,
  input  [6:0] io_opcode,
  output       io_r_type,
  output       io_load_type,
  output       io_s_type,
  output       io_sb_type,
  output       io_i_type,
  output       io_jalr_type,
  output       io_jal_type,
  output       io_lui_type,
  output       io_Auipc
);
  wire  _T = io_opcode == 7'h33; // @[InstructionTypeDecode.scala 23:20]
  wire  _T_1 = io_func7 == 7'h1; // @[InstructionTypeDecode.scala 25:23]
  wire  _GEN_0 = _T_1 ? 1'h0 : 1'h1; // @[InstructionTypeDecode.scala 26:9]
  wire  _T_2 = io_opcode == 7'h3; // @[InstructionTypeDecode.scala 42:25]
  wire  _T_3 = io_opcode == 7'h23; // @[InstructionTypeDecode.scala 44:27]
  wire  _T_4 = io_opcode == 7'h63; // @[InstructionTypeDecode.scala 46:27]
  wire  _T_5 = io_opcode == 7'h13; // @[InstructionTypeDecode.scala 48:27]
  wire  _T_6 = io_opcode == 7'h67; // @[InstructionTypeDecode.scala 50:27]
  wire  _T_7 = io_opcode == 7'h6f; // @[InstructionTypeDecode.scala 52:27]
  wire  _T_8 = io_opcode == 7'h37; // @[InstructionTypeDecode.scala 54:27]
  wire  _T_9 = io_opcode == 7'h17; // @[InstructionTypeDecode.scala 57:26]
  wire  _GEN_4 = _T_8 ? 1'h0 : _T_9; // @[InstructionTypeDecode.scala 54:45]
  wire  _GEN_7 = _T_7 ? 1'h0 : _T_8; // @[InstructionTypeDecode.scala 52:45]
  wire  _GEN_8 = _T_7 ? 1'h0 : _GEN_4; // @[InstructionTypeDecode.scala 52:45]
  wire  _GEN_11 = _T_6 ? 1'h0 : _T_7; // @[InstructionTypeDecode.scala 50:45]
  wire  _GEN_12 = _T_6 ? 1'h0 : _GEN_7; // @[InstructionTypeDecode.scala 50:45]
  wire  _GEN_13 = _T_6 ? 1'h0 : _GEN_8; // @[InstructionTypeDecode.scala 50:45]
  wire  _GEN_16 = _T_5 ? 1'h0 : _T_6; // @[InstructionTypeDecode.scala 48:45]
  wire  _GEN_17 = _T_5 ? 1'h0 : _GEN_11; // @[InstructionTypeDecode.scala 48:45]
  wire  _GEN_18 = _T_5 ? 1'h0 : _GEN_12; // @[InstructionTypeDecode.scala 48:45]
  wire  _GEN_19 = _T_5 ? 1'h0 : _GEN_13; // @[InstructionTypeDecode.scala 48:45]
  wire  _GEN_22 = _T_4 ? 1'h0 : _T_5; // @[InstructionTypeDecode.scala 46:45]
  wire  _GEN_23 = _T_4 ? 1'h0 : _GEN_16; // @[InstructionTypeDecode.scala 46:45]
  wire  _GEN_24 = _T_4 ? 1'h0 : _GEN_17; // @[InstructionTypeDecode.scala 46:45]
  wire  _GEN_25 = _T_4 ? 1'h0 : _GEN_18; // @[InstructionTypeDecode.scala 46:45]
  wire  _GEN_26 = _T_4 ? 1'h0 : _GEN_19; // @[InstructionTypeDecode.scala 46:45]
  wire  _GEN_29 = _T_3 ? 1'h0 : _T_4; // @[InstructionTypeDecode.scala 44:45]
  wire  _GEN_30 = _T_3 ? 1'h0 : _GEN_22; // @[InstructionTypeDecode.scala 44:45]
  wire  _GEN_31 = _T_3 ? 1'h0 : _GEN_23; // @[InstructionTypeDecode.scala 44:45]
  wire  _GEN_32 = _T_3 ? 1'h0 : _GEN_24; // @[InstructionTypeDecode.scala 44:45]
  wire  _GEN_33 = _T_3 ? 1'h0 : _GEN_25; // @[InstructionTypeDecode.scala 44:45]
  wire  _GEN_34 = _T_3 ? 1'h0 : _GEN_26; // @[InstructionTypeDecode.scala 44:45]
  wire  _GEN_37 = _T_2 ? 1'h0 : _T_3; // @[InstructionTypeDecode.scala 42:43]
  wire  _GEN_38 = _T_2 ? 1'h0 : _GEN_29; // @[InstructionTypeDecode.scala 42:43]
  wire  _GEN_39 = _T_2 ? 1'h0 : _GEN_30; // @[InstructionTypeDecode.scala 42:43]
  wire  _GEN_40 = _T_2 ? 1'h0 : _GEN_31; // @[InstructionTypeDecode.scala 42:43]
  wire  _GEN_41 = _T_2 ? 1'h0 : _GEN_32; // @[InstructionTypeDecode.scala 42:43]
  wire  _GEN_42 = _T_2 ? 1'h0 : _GEN_33; // @[InstructionTypeDecode.scala 42:43]
  wire  _GEN_43 = _T_2 ? 1'h0 : _GEN_34; // @[InstructionTypeDecode.scala 42:43]
  assign io_r_type = _T & _GEN_0; // @[InstructionTypeDecode.scala 67:19 InstructionTypeDecode.scala 35:29 InstructionTypeDecode.scala 39:23 InstructionTypeDecode.scala 67:19]
  assign io_load_type = _T ? 1'h0 : _T_2; // @[InstructionTypeDecode.scala 68:22 InstructionTypeDecode.scala 43:22 InstructionTypeDecode.scala 68:22]
  assign io_s_type = _T ? 1'h0 : _GEN_37; // @[InstructionTypeDecode.scala 69:19 InstructionTypeDecode.scala 45:19 InstructionTypeDecode.scala 69:19]
  assign io_sb_type = _T ? 1'h0 : _GEN_38; // @[InstructionTypeDecode.scala 70:20 InstructionTypeDecode.scala 47:20 InstructionTypeDecode.scala 70:20]
  assign io_i_type = _T ? 1'h0 : _GEN_39; // @[InstructionTypeDecode.scala 71:19 InstructionTypeDecode.scala 49:19 InstructionTypeDecode.scala 71:19]
  assign io_jalr_type = _T ? 1'h0 : _GEN_40; // @[InstructionTypeDecode.scala 72:22 InstructionTypeDecode.scala 51:22 InstructionTypeDecode.scala 72:22]
  assign io_jal_type = _T ? 1'h0 : _GEN_41; // @[InstructionTypeDecode.scala 73:21 InstructionTypeDecode.scala 53:21 InstructionTypeDecode.scala 73:21]
  assign io_lui_type = _T ? 1'h0 : _GEN_42; // @[InstructionTypeDecode.scala 74:21 InstructionTypeDecode.scala 55:21 InstructionTypeDecode.scala 74:21]
  assign io_Auipc = _T ? 1'h0 : _GEN_43; // @[InstructionTypeDecode.scala 75:21 InstructionTypeDecode.scala 58:18 InstructionTypeDecode.scala 75:21]
endmodule
module ControlDecode(
  input        io_in_r_type,
  input        io_in_load_type,
  input        io_in_s_type,
  input        io_in_sb_type,
  input        io_in_i_type,
  input        io_in_jalr_type,
  input        io_in_jal_type,
  input        io_in_lui_type,
  input        io_Auipc,
  output       io_memWrite,
  output       io_memRead,
  output       io_branch,
  output       io_regWrite,
  output       io_memToReg,
  output [3:0] io_aluOperation,
  output [1:0] io_operand_a_sel,
  output       io_operand_b_sel,
  output [1:0] io_extend_sel,
  output [1:0] io_next_pc_sel
);
  wire [4:0] _GEN_5 = io_Auipc ? 5'h7 : 5'h1c; // @[ControlDecode.scala 130:5]
  wire [1:0] _GEN_7 = io_Auipc ? 2'h2 : 2'h0; // @[ControlDecode.scala 130:5]
  wire  _GEN_9 = io_in_lui_type | io_Auipc; // @[ControlDecode.scala 117:5]
  wire [4:0] _GEN_10 = io_in_lui_type ? 5'h6 : _GEN_5; // @[ControlDecode.scala 117:5]
  wire [1:0] _GEN_11 = io_in_lui_type ? 2'h3 : {{1'd0}, io_Auipc}; // @[ControlDecode.scala 117:5]
  wire [1:0] _GEN_13 = io_in_lui_type ? 2'h2 : _GEN_7; // @[ControlDecode.scala 117:5]
  wire  _GEN_15 = io_in_jal_type | _GEN_9; // @[ControlDecode.scala 104:41]
  wire [4:0] _GEN_16 = io_in_jal_type ? 5'h3 : _GEN_10; // @[ControlDecode.scala 104:41]
  wire [1:0] _GEN_17 = io_in_jal_type ? 2'h2 : _GEN_11; // @[ControlDecode.scala 104:41]
  wire  _GEN_18 = io_in_jal_type ? 1'h0 : _GEN_9; // @[ControlDecode.scala 104:41]
  wire [1:0] _GEN_19 = io_in_jal_type ? 2'h0 : _GEN_13; // @[ControlDecode.scala 104:41]
  wire [1:0] _GEN_20 = io_in_jal_type ? 2'h2 : 2'h0; // @[ControlDecode.scala 104:41]
  wire  _GEN_22 = io_in_jalr_type | _GEN_15; // @[ControlDecode.scala 93:42]
  wire [4:0] _GEN_23 = io_in_jalr_type ? 5'h3 : _GEN_16; // @[ControlDecode.scala 93:42]
  wire [1:0] _GEN_24 = io_in_jalr_type ? 2'h2 : _GEN_17; // @[ControlDecode.scala 93:42]
  wire  _GEN_25 = io_in_jalr_type ? 1'h0 : _GEN_18; // @[ControlDecode.scala 93:42]
  wire [1:0] _GEN_26 = io_in_jalr_type ? 2'h0 : _GEN_19; // @[ControlDecode.scala 93:42]
  wire [1:0] _GEN_27 = io_in_jalr_type ? 2'h3 : _GEN_20; // @[ControlDecode.scala 93:42]
  wire  _GEN_29 = io_in_i_type | _GEN_22; // @[ControlDecode.scala 82:39]
  wire [4:0] _GEN_30 = io_in_i_type ? 5'h1 : _GEN_23; // @[ControlDecode.scala 82:39]
  wire [1:0] _GEN_31 = io_in_i_type ? 2'h0 : _GEN_24; // @[ControlDecode.scala 82:39]
  wire  _GEN_32 = io_in_i_type | _GEN_25; // @[ControlDecode.scala 82:39]
  wire [1:0] _GEN_33 = io_in_i_type ? 2'h0 : _GEN_26; // @[ControlDecode.scala 82:39]
  wire [1:0] _GEN_34 = io_in_i_type ? 2'h0 : _GEN_27; // @[ControlDecode.scala 82:39]
  wire  _GEN_37 = io_in_sb_type ? 1'h0 : _GEN_29; // @[ControlDecode.scala 71:40]
  wire [4:0] _GEN_38 = io_in_sb_type ? 5'h2 : _GEN_30; // @[ControlDecode.scala 71:40]
  wire [1:0] _GEN_39 = io_in_sb_type ? 2'h0 : _GEN_31; // @[ControlDecode.scala 71:40]
  wire  _GEN_40 = io_in_sb_type ? 1'h0 : _GEN_32; // @[ControlDecode.scala 71:40]
  wire [1:0] _GEN_41 = io_in_sb_type ? 2'h0 : _GEN_33; // @[ControlDecode.scala 71:40]
  wire [1:0] _GEN_42 = io_in_sb_type ? 2'h1 : _GEN_34; // @[ControlDecode.scala 71:40]
  wire  _GEN_45 = io_in_s_type ? 1'h0 : io_in_sb_type; // @[ControlDecode.scala 59:39]
  wire  _GEN_46 = io_in_s_type ? 1'h0 : _GEN_37; // @[ControlDecode.scala 59:39]
  wire [4:0] _GEN_47 = io_in_s_type ? 5'h5 : _GEN_38; // @[ControlDecode.scala 59:39]
  wire [1:0] _GEN_48 = io_in_s_type ? 2'h0 : _GEN_39; // @[ControlDecode.scala 59:39]
  wire  _GEN_49 = io_in_s_type | _GEN_40; // @[ControlDecode.scala 59:39]
  wire [1:0] _GEN_50 = io_in_s_type ? 2'h1 : _GEN_41; // @[ControlDecode.scala 59:39]
  wire [1:0] _GEN_51 = io_in_s_type ? 2'h0 : _GEN_42; // @[ControlDecode.scala 59:39]
  wire  _GEN_52 = io_in_load_type ? 1'h0 : io_in_s_type; // @[ControlDecode.scala 47:40]
  wire  _GEN_54 = io_in_load_type ? 1'h0 : _GEN_45; // @[ControlDecode.scala 47:40]
  wire  _GEN_55 = io_in_load_type | _GEN_46; // @[ControlDecode.scala 47:40]
  wire [4:0] _GEN_56 = io_in_load_type ? 5'h4 : _GEN_47; // @[ControlDecode.scala 47:40]
  wire [1:0] _GEN_57 = io_in_load_type ? 2'h0 : _GEN_48; // @[ControlDecode.scala 47:40]
  wire  _GEN_58 = io_in_load_type | _GEN_49; // @[ControlDecode.scala 47:40]
  wire [1:0] _GEN_59 = io_in_load_type ? 2'h0 : _GEN_50; // @[ControlDecode.scala 47:40]
  wire [1:0] _GEN_60 = io_in_load_type ? 2'h0 : _GEN_51; // @[ControlDecode.scala 47:40]
  wire [4:0] _GEN_65 = io_in_r_type ? 5'h0 : _GEN_56; // @[ControlDecode.scala 34:32]
  assign io_memWrite = io_in_r_type ? 1'h0 : _GEN_52; // @[ControlDecode.scala 161:21 ControlDecode.scala 35:21 ControlDecode.scala 49:21 ControlDecode.scala 61:21 ControlDecode.scala 72:21 ControlDecode.scala 83:21 ControlDecode.scala 94:21 ControlDecode.scala 105:21 ControlDecode.scala 118:21 ControlDecode.scala 131:21 ControlDecode.scala 143:21 ControlDecode.scala 161:21]
  assign io_memRead = io_in_r_type ? 1'h0 : io_in_load_type; // @[ControlDecode.scala 162:21 ControlDecode.scala 36:21 ControlDecode.scala 50:21 ControlDecode.scala 62:21 ControlDecode.scala 73:21 ControlDecode.scala 84:21 ControlDecode.scala 95:21 ControlDecode.scala 106:21 ControlDecode.scala 119:21 ControlDecode.scala 132:21 ControlDecode.scala 144:21 ControlDecode.scala 162:21]
  assign io_branch = io_in_r_type ? 1'h0 : _GEN_54; // @[ControlDecode.scala 163:19 ControlDecode.scala 37:19 ControlDecode.scala 51:19 ControlDecode.scala 63:19 ControlDecode.scala 74:19 ControlDecode.scala 85:19 ControlDecode.scala 96:19 ControlDecode.scala 107:19 ControlDecode.scala 120:19 ControlDecode.scala 133:19 ControlDecode.scala 145:19 ControlDecode.scala 163:19]
  assign io_regWrite = io_in_r_type | _GEN_55; // @[ControlDecode.scala 164:21 ControlDecode.scala 38:21 ControlDecode.scala 52:21 ControlDecode.scala 64:21 ControlDecode.scala 75:21 ControlDecode.scala 86:21 ControlDecode.scala 97:21 ControlDecode.scala 108:21 ControlDecode.scala 121:21 ControlDecode.scala 134:21 ControlDecode.scala 146:21 ControlDecode.scala 164:21]
  assign io_memToReg = io_in_r_type ? 1'h0 : io_in_load_type; // @[ControlDecode.scala 165:21 ControlDecode.scala 39:21 ControlDecode.scala 53:21 ControlDecode.scala 65:21 ControlDecode.scala 76:21 ControlDecode.scala 87:21 ControlDecode.scala 98:21 ControlDecode.scala 109:21 ControlDecode.scala 122:21 ControlDecode.scala 135:21 ControlDecode.scala 147:21 ControlDecode.scala 165:21]
  assign io_aluOperation = _GEN_65[3:0]; // @[ControlDecode.scala 166:25 ControlDecode.scala 40:25 ControlDecode.scala 54:25 ControlDecode.scala 66:25 ControlDecode.scala 77:25 ControlDecode.scala 88:25 ControlDecode.scala 99:25 ControlDecode.scala 110:25 ControlDecode.scala 123:25 ControlDecode.scala 136:25 ControlDecode.scala 148:25 ControlDecode.scala 166:25]
  assign io_operand_a_sel = io_in_r_type ? 2'h0 : _GEN_57; // @[ControlDecode.scala 167:26 ControlDecode.scala 41:26 ControlDecode.scala 55:26 ControlDecode.scala 67:26 ControlDecode.scala 78:26 ControlDecode.scala 89:26 ControlDecode.scala 100:26 ControlDecode.scala 111:26 ControlDecode.scala 124:26 ControlDecode.scala 137:26 ControlDecode.scala 149:26 ControlDecode.scala 167:26]
  assign io_operand_b_sel = io_in_r_type ? 1'h0 : _GEN_58; // @[ControlDecode.scala 168:26 ControlDecode.scala 42:26 ControlDecode.scala 56:26 ControlDecode.scala 68:26 ControlDecode.scala 79:26 ControlDecode.scala 90:26 ControlDecode.scala 101:26 ControlDecode.scala 112:26 ControlDecode.scala 125:26 ControlDecode.scala 138:26 ControlDecode.scala 150:26 ControlDecode.scala 168:26]
  assign io_extend_sel = io_in_r_type ? 2'h0 : _GEN_59; // @[ControlDecode.scala 169:23 ControlDecode.scala 43:23 ControlDecode.scala 57:23 ControlDecode.scala 69:23 ControlDecode.scala 80:23 ControlDecode.scala 91:23 ControlDecode.scala 102:23 ControlDecode.scala 113:23 ControlDecode.scala 126:23 ControlDecode.scala 139:23 ControlDecode.scala 151:23 ControlDecode.scala 169:23]
  assign io_next_pc_sel = io_in_r_type ? 2'h0 : _GEN_60; // @[ControlDecode.scala 170:24 ControlDecode.scala 44:24 ControlDecode.scala 58:24 ControlDecode.scala 70:24 ControlDecode.scala 81:24 ControlDecode.scala 92:24 ControlDecode.scala 103:24 ControlDecode.scala 114:24 ControlDecode.scala 127:24 ControlDecode.scala 140:24 ControlDecode.scala 152:24 ControlDecode.scala 170:24]
endmodule
module Control(
  input  [6:0] io_in_opcode,
  input  [6:0] io_func7,
  output       io_out_memWrite,
  output       io_out_branch,
  output       io_out_memRead,
  output       io_out_regWrite,
  output       io_out_memToReg,
  output [3:0] io_out_aluOp,
  output [1:0] io_out_operand_a_sel,
  output       io_out_operand_b_sel,
  output [1:0] io_out_extend_sel,
  output [1:0] io_out_next_pc_sel
);
  wire [6:0] instruction_type_decode_io_func7; // @[Control.scala 22:41]
  wire [6:0] instruction_type_decode_io_opcode; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_r_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_load_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_s_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_sb_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_i_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_jalr_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_jal_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_lui_type; // @[Control.scala 22:41]
  wire  instruction_type_decode_io_Auipc; // @[Control.scala 22:41]
  wire  control_decode_io_in_r_type; // @[Control.scala 23:32]
  wire  control_decode_io_in_load_type; // @[Control.scala 23:32]
  wire  control_decode_io_in_s_type; // @[Control.scala 23:32]
  wire  control_decode_io_in_sb_type; // @[Control.scala 23:32]
  wire  control_decode_io_in_i_type; // @[Control.scala 23:32]
  wire  control_decode_io_in_jalr_type; // @[Control.scala 23:32]
  wire  control_decode_io_in_jal_type; // @[Control.scala 23:32]
  wire  control_decode_io_in_lui_type; // @[Control.scala 23:32]
  wire  control_decode_io_Auipc; // @[Control.scala 23:32]
  wire  control_decode_io_memWrite; // @[Control.scala 23:32]
  wire  control_decode_io_memRead; // @[Control.scala 23:32]
  wire  control_decode_io_branch; // @[Control.scala 23:32]
  wire  control_decode_io_regWrite; // @[Control.scala 23:32]
  wire  control_decode_io_memToReg; // @[Control.scala 23:32]
  wire [3:0] control_decode_io_aluOperation; // @[Control.scala 23:32]
  wire [1:0] control_decode_io_operand_a_sel; // @[Control.scala 23:32]
  wire  control_decode_io_operand_b_sel; // @[Control.scala 23:32]
  wire [1:0] control_decode_io_extend_sel; // @[Control.scala 23:32]
  wire [1:0] control_decode_io_next_pc_sel; // @[Control.scala 23:32]
  InstructionTypeDecode instruction_type_decode ( // @[Control.scala 22:41]
    .io_func7(instruction_type_decode_io_func7),
    .io_opcode(instruction_type_decode_io_opcode),
    .io_r_type(instruction_type_decode_io_r_type),
    .io_load_type(instruction_type_decode_io_load_type),
    .io_s_type(instruction_type_decode_io_s_type),
    .io_sb_type(instruction_type_decode_io_sb_type),
    .io_i_type(instruction_type_decode_io_i_type),
    .io_jalr_type(instruction_type_decode_io_jalr_type),
    .io_jal_type(instruction_type_decode_io_jal_type),
    .io_lui_type(instruction_type_decode_io_lui_type),
    .io_Auipc(instruction_type_decode_io_Auipc)
  );
  ControlDecode control_decode ( // @[Control.scala 23:32]
    .io_in_r_type(control_decode_io_in_r_type),
    .io_in_load_type(control_decode_io_in_load_type),
    .io_in_s_type(control_decode_io_in_s_type),
    .io_in_sb_type(control_decode_io_in_sb_type),
    .io_in_i_type(control_decode_io_in_i_type),
    .io_in_jalr_type(control_decode_io_in_jalr_type),
    .io_in_jal_type(control_decode_io_in_jal_type),
    .io_in_lui_type(control_decode_io_in_lui_type),
    .io_Auipc(control_decode_io_Auipc),
    .io_memWrite(control_decode_io_memWrite),
    .io_memRead(control_decode_io_memRead),
    .io_branch(control_decode_io_branch),
    .io_regWrite(control_decode_io_regWrite),
    .io_memToReg(control_decode_io_memToReg),
    .io_aluOperation(control_decode_io_aluOperation),
    .io_operand_a_sel(control_decode_io_operand_a_sel),
    .io_operand_b_sel(control_decode_io_operand_b_sel),
    .io_extend_sel(control_decode_io_extend_sel),
    .io_next_pc_sel(control_decode_io_next_pc_sel)
  );
  assign io_out_memWrite = control_decode_io_memWrite; // @[Control.scala 37:21]
  assign io_out_branch = control_decode_io_branch; // @[Control.scala 38:19]
  assign io_out_memRead = control_decode_io_memRead; // @[Control.scala 39:20]
  assign io_out_regWrite = control_decode_io_regWrite; // @[Control.scala 40:21]
  assign io_out_memToReg = control_decode_io_memToReg; // @[Control.scala 41:21]
  assign io_out_aluOp = control_decode_io_aluOperation; // @[Control.scala 42:18]
  assign io_out_operand_a_sel = control_decode_io_operand_a_sel; // @[Control.scala 43:26]
  assign io_out_operand_b_sel = control_decode_io_operand_b_sel; // @[Control.scala 44:26]
  assign io_out_extend_sel = control_decode_io_extend_sel; // @[Control.scala 45:23]
  assign io_out_next_pc_sel = control_decode_io_next_pc_sel; // @[Control.scala 46:24]
  assign instruction_type_decode_io_func7 = io_func7; // @[Control.scala 50:38]
  assign instruction_type_decode_io_opcode = io_in_opcode; // @[Control.scala 24:39]
  assign control_decode_io_in_r_type = instruction_type_decode_io_r_type; // @[Control.scala 25:33]
  assign control_decode_io_in_load_type = instruction_type_decode_io_load_type; // @[Control.scala 26:36]
  assign control_decode_io_in_s_type = instruction_type_decode_io_s_type; // @[Control.scala 27:33]
  assign control_decode_io_in_sb_type = instruction_type_decode_io_sb_type; // @[Control.scala 28:34]
  assign control_decode_io_in_i_type = instruction_type_decode_io_i_type; // @[Control.scala 29:33]
  assign control_decode_io_in_jalr_type = instruction_type_decode_io_jalr_type; // @[Control.scala 30:36]
  assign control_decode_io_in_jal_type = instruction_type_decode_io_jal_type; // @[Control.scala 31:35]
  assign control_decode_io_in_lui_type = instruction_type_decode_io_lui_type; // @[Control.scala 32:35]
  assign control_decode_io_Auipc = instruction_type_decode_io_Auipc; // @[Control.scala 33:35]
endmodule
module DecodeForwardUnit(
  input  [4:0] io_ID_EX_REGRD,
  input        io_ID_EX_MEMRD,
  input  [4:0] io_EX_MEM_REGRD,
  input        io_EX_MEM_MEMRD,
  input  [4:0] io_MEM_WB_REGRD,
  input        io_MEM_WB_MEMRD,
  input        io_execute_regwrite,
  input        io_mem_regwrite,
  input        io_wb_regwrite,
  input  [4:0] io_rs1_sel,
  input  [4:0] io_rs2_sel,
  input        io_ctrl_branch,
  output [3:0] io_forward_rs1,
  output [3:0] io_forward_rs2
);
  wire  _T_1 = io_ID_EX_REGRD != 5'h0; // @[DecodeForwardUnit.scala 29:27]
  wire  _T_2 = ~io_ID_EX_MEMRD; // @[DecodeForwardUnit.scala 29:60]
  wire  _T_3 = _T_1 & _T_2; // @[DecodeForwardUnit.scala 29:42]
  wire  _T_4 = io_ID_EX_REGRD == io_rs1_sel; // @[DecodeForwardUnit.scala 29:87]
  wire  _T_5 = _T_3 & _T_4; // @[DecodeForwardUnit.scala 29:68]
  wire  _T_6 = io_ID_EX_REGRD == io_rs2_sel; // @[DecodeForwardUnit.scala 29:122]
  wire  _T_7 = _T_5 & _T_6; // @[DecodeForwardUnit.scala 29:103]
  wire  _T_17 = _T_3 & _T_6; // @[DecodeForwardUnit.scala 34:75]
  wire  _GEN_2 = _T_5 ? 1'h0 : _T_17; // @[DecodeForwardUnit.scala 32:111]
  wire  _GEN_3 = _T_7 | _T_5; // @[DecodeForwardUnit.scala 29:139]
  wire  _GEN_4 = _T_7 | _GEN_2; // @[DecodeForwardUnit.scala 29:139]
  wire  _T_18 = io_EX_MEM_REGRD != 5'h0; // @[DecodeForwardUnit.scala 39:28]
  wire  _T_19 = ~io_EX_MEM_MEMRD; // @[DecodeForwardUnit.scala 39:62]
  wire  _T_20 = _T_18 & _T_19; // @[DecodeForwardUnit.scala 39:43]
  wire  _T_23 = _T_1 & _T_4; // @[DecodeForwardUnit.scala 40:43]
  wire  _T_25 = _T_23 & _T_6; // @[DecodeForwardUnit.scala 40:78]
  wire  _T_26 = ~_T_25; // @[DecodeForwardUnit.scala 40:9]
  wire  _T_27 = _T_20 & _T_26; // @[DecodeForwardUnit.scala 39:70]
  wire  _T_28 = io_EX_MEM_REGRD == io_rs1_sel; // @[DecodeForwardUnit.scala 41:26]
  wire  _T_29 = _T_27 & _T_28; // @[DecodeForwardUnit.scala 40:114]
  wire  _T_30 = io_EX_MEM_REGRD == io_rs2_sel; // @[DecodeForwardUnit.scala 41:62]
  wire  _T_31 = _T_29 & _T_30; // @[DecodeForwardUnit.scala 41:42]
  wire  _T_37 = _T_1 & _T_6; // @[DecodeForwardUnit.scala 47:43]
  wire  _T_38 = ~_T_37; // @[DecodeForwardUnit.scala 47:9]
  wire  _T_39 = _T_20 & _T_38; // @[DecodeForwardUnit.scala 46:77]
  wire  _T_41 = _T_39 & _T_30; // @[DecodeForwardUnit.scala 47:79]
  wire  _T_48 = ~_T_23; // @[DecodeForwardUnit.scala 53:9]
  wire  _T_49 = _T_20 & _T_48; // @[DecodeForwardUnit.scala 52:77]
  wire  _T_51 = _T_49 & _T_28; // @[DecodeForwardUnit.scala 53:79]
  wire  _T_54 = _T_18 & io_EX_MEM_MEMRD; // @[DecodeForwardUnit.scala 58:50]
  wire  _T_61 = _T_54 & _T_26; // @[DecodeForwardUnit.scala 58:77]
  wire  _T_63 = _T_61 & _T_28; // @[DecodeForwardUnit.scala 59:114]
  wire  _T_65 = _T_63 & _T_30; // @[DecodeForwardUnit.scala 60:42]
  wire  _T_73 = _T_54 & _T_38; // @[DecodeForwardUnit.scala 65:77]
  wire  _T_75 = _T_73 & _T_30; // @[DecodeForwardUnit.scala 66:79]
  wire  _T_78 = io_ctrl_branch & _T_18; // @[DecodeForwardUnit.scala 71:42]
  wire  _T_80 = _T_78 & io_EX_MEM_MEMRD; // @[DecodeForwardUnit.scala 71:76]
  wire  _T_85 = _T_80 & _T_48; // @[DecodeForwardUnit.scala 71:103]
  wire  _T_87 = _T_85 & _T_28; // @[DecodeForwardUnit.scala 72:79]
  wire [2:0] _GEN_5 = _T_87 ? 3'h4 : {{2'd0}, _GEN_3}; // @[DecodeForwardUnit.scala 73:43]
  wire [2:0] _GEN_6 = _T_75 ? 3'h4 : {{2'd0}, _GEN_4}; // @[DecodeForwardUnit.scala 67:43]
  wire [2:0] _GEN_7 = _T_75 ? {{2'd0}, _GEN_3} : _GEN_5; // @[DecodeForwardUnit.scala 67:43]
  wire [2:0] _GEN_8 = _T_65 ? 3'h4 : _GEN_7; // @[DecodeForwardUnit.scala 60:79]
  wire [2:0] _GEN_9 = _T_65 ? 3'h4 : _GEN_6; // @[DecodeForwardUnit.scala 60:79]
  wire [2:0] _GEN_10 = _T_51 ? 3'h2 : _GEN_8; // @[DecodeForwardUnit.scala 54:43]
  wire [2:0] _GEN_11 = _T_51 ? {{2'd0}, _GEN_4} : _GEN_9; // @[DecodeForwardUnit.scala 54:43]
  wire [2:0] _GEN_12 = _T_41 ? 3'h2 : _GEN_11; // @[DecodeForwardUnit.scala 48:43]
  wire [2:0] _GEN_13 = _T_41 ? {{2'd0}, _GEN_3} : _GEN_10; // @[DecodeForwardUnit.scala 48:43]
  wire [2:0] _GEN_14 = _T_31 ? 3'h2 : _GEN_13; // @[DecodeForwardUnit.scala 41:79]
  wire [2:0] _GEN_15 = _T_31 ? 3'h2 : _GEN_12; // @[DecodeForwardUnit.scala 41:79]
  wire  _T_88 = io_MEM_WB_REGRD != 5'h0; // @[DecodeForwardUnit.scala 80:28]
  wire  _T_89 = ~io_MEM_WB_MEMRD; // @[DecodeForwardUnit.scala 80:62]
  wire  _T_90 = _T_88 & _T_89; // @[DecodeForwardUnit.scala 80:43]
  wire  _T_97 = _T_90 & _T_26; // @[DecodeForwardUnit.scala 80:70]
  wire  _T_100 = _T_18 & _T_28; // @[DecodeForwardUnit.scala 84:44]
  wire  _T_102 = _T_100 & _T_30; // @[DecodeForwardUnit.scala 84:80]
  wire  _T_103 = ~_T_102; // @[DecodeForwardUnit.scala 84:9]
  wire  _T_104 = _T_97 & _T_103; // @[DecodeForwardUnit.scala 82:114]
  wire  _T_105 = io_MEM_WB_REGRD == io_rs1_sel; // @[DecodeForwardUnit.scala 85:26]
  wire  _T_106 = _T_104 & _T_105; // @[DecodeForwardUnit.scala 84:117]
  wire  _T_107 = io_MEM_WB_REGRD == io_rs2_sel; // @[DecodeForwardUnit.scala 85:62]
  wire  _T_108 = _T_106 & _T_107; // @[DecodeForwardUnit.scala 85:42]
  wire  _T_116 = _T_90 & _T_38; // @[DecodeForwardUnit.scala 91:77]
  wire  _T_119 = _T_18 & _T_30; // @[DecodeForwardUnit.scala 95:46]
  wire  _T_120 = ~_T_119; // @[DecodeForwardUnit.scala 95:11]
  wire  _T_121 = _T_116 & _T_120; // @[DecodeForwardUnit.scala 93:81]
  wire  _T_123 = _T_121 & _T_107; // @[DecodeForwardUnit.scala 95:83]
  wire  _T_131 = _T_90 & _T_48; // @[DecodeForwardUnit.scala 101:77]
  wire  _T_135 = ~_T_100; // @[DecodeForwardUnit.scala 105:11]
  wire  _T_136 = _T_131 & _T_135; // @[DecodeForwardUnit.scala 103:81]
  wire  _T_138 = _T_136 & _T_105; // @[DecodeForwardUnit.scala 105:83]
  wire  _T_141 = _T_88 & io_MEM_WB_MEMRD; // @[DecodeForwardUnit.scala 110:52]
  wire  _T_148 = _T_141 & _T_26; // @[DecodeForwardUnit.scala 110:79]
  wire  _T_155 = _T_148 & _T_103; // @[DecodeForwardUnit.scala 112:114]
  wire  _T_157 = _T_155 & _T_105; // @[DecodeForwardUnit.scala 114:117]
  wire  _T_159 = _T_157 & _T_107; // @[DecodeForwardUnit.scala 115:42]
  wire  _T_167 = _T_141 & _T_38; // @[DecodeForwardUnit.scala 121:77]
  wire  _T_172 = _T_167 & _T_120; // @[DecodeForwardUnit.scala 123:81]
  wire  _T_174 = _T_172 & _T_107; // @[DecodeForwardUnit.scala 125:83]
  wire  _T_182 = _T_141 & _T_48; // @[DecodeForwardUnit.scala 131:77]
  wire  _T_187 = _T_182 & _T_135; // @[DecodeForwardUnit.scala 133:81]
  wire  _T_189 = _T_187 & _T_105; // @[DecodeForwardUnit.scala 135:82]
  wire [2:0] _GEN_16 = _T_189 ? 3'h5 : _GEN_14; // @[DecodeForwardUnit.scala 136:45]
  wire [2:0] _GEN_17 = _T_174 ? 3'h5 : _GEN_15; // @[DecodeForwardUnit.scala 126:45]
  wire [2:0] _GEN_18 = _T_174 ? _GEN_14 : _GEN_16; // @[DecodeForwardUnit.scala 126:45]
  wire [2:0] _GEN_19 = _T_159 ? 3'h5 : _GEN_18; // @[DecodeForwardUnit.scala 115:79]
  wire [2:0] _GEN_20 = _T_159 ? 3'h5 : _GEN_17; // @[DecodeForwardUnit.scala 115:79]
  wire [2:0] _GEN_21 = _T_138 ? 3'h3 : _GEN_19; // @[DecodeForwardUnit.scala 106:45]
  wire [2:0] _GEN_22 = _T_138 ? _GEN_15 : _GEN_20; // @[DecodeForwardUnit.scala 106:45]
  wire [2:0] _GEN_23 = _T_123 ? 3'h3 : _GEN_22; // @[DecodeForwardUnit.scala 96:45]
  wire [2:0] _GEN_24 = _T_123 ? _GEN_14 : _GEN_21; // @[DecodeForwardUnit.scala 96:45]
  wire [2:0] _GEN_25 = _T_108 ? 3'h3 : _GEN_24; // @[DecodeForwardUnit.scala 85:79]
  wire [2:0] _GEN_26 = _T_108 ? 3'h3 : _GEN_23; // @[DecodeForwardUnit.scala 85:79]
  wire  _T_190 = ~io_ctrl_branch; // @[DecodeForwardUnit.scala 144:32]
  wire  _T_193 = io_execute_regwrite & _T_1; // @[DecodeForwardUnit.scala 146:42]
  wire  _T_195 = _T_193 & _T_2; // @[DecodeForwardUnit.scala 146:75]
  wire  _T_197 = _T_195 & _T_4; // @[DecodeForwardUnit.scala 146:101]
  wire [2:0] _GEN_27 = _T_197 ? 3'h6 : 3'h0; // @[DecodeForwardUnit.scala 146:136]
  wire  _T_200 = io_mem_regwrite & _T_18; // @[DecodeForwardUnit.scala 151:38]
  wire  _T_202 = _T_200 & _T_19; // @[DecodeForwardUnit.scala 151:72]
  wire  _T_207 = _T_202 & _T_48; // @[DecodeForwardUnit.scala 151:99]
  wire  _T_209 = _T_207 & _T_28; // @[DecodeForwardUnit.scala 152:81]
  wire  _T_214 = _T_200 & io_EX_MEM_MEMRD; // @[DecodeForwardUnit.scala 158:79]
  wire  _T_219 = _T_214 & _T_48; // @[DecodeForwardUnit.scala 158:106]
  wire  _T_221 = _T_219 & _T_28; // @[DecodeForwardUnit.scala 159:83]
  wire [3:0] _GEN_28 = _T_221 ? 4'h9 : {{1'd0}, _GEN_27}; // @[DecodeForwardUnit.scala 160:47]
  wire [3:0] _GEN_29 = _T_209 ? 4'h7 : _GEN_28; // @[DecodeForwardUnit.scala 153:45]
  wire  _T_224 = io_wb_regwrite & _T_88; // @[DecodeForwardUnit.scala 168:37]
  wire  _T_226 = _T_224 & _T_89; // @[DecodeForwardUnit.scala 168:71]
  wire  _T_231 = _T_226 & _T_48; // @[DecodeForwardUnit.scala 168:98]
  wire  _T_236 = _T_231 & _T_135; // @[DecodeForwardUnit.scala 170:81]
  wire  _T_238 = _T_236 & _T_105; // @[DecodeForwardUnit.scala 172:83]
  wire  _T_243 = _T_224 & io_MEM_WB_MEMRD; // @[DecodeForwardUnit.scala 178:79]
  wire  _T_248 = _T_243 & _T_48; // @[DecodeForwardUnit.scala 178:106]
  wire  _T_253 = _T_248 & _T_135; // @[DecodeForwardUnit.scala 180:81]
  wire  _T_255 = _T_253 & _T_105; // @[DecodeForwardUnit.scala 182:83]
  wire [3:0] _GEN_30 = _T_255 ? 4'ha : _GEN_29; // @[DecodeForwardUnit.scala 183:45]
  wire [3:0] _GEN_31 = _T_238 ? 4'h8 : _GEN_30; // @[DecodeForwardUnit.scala 173:45]
  wire [3:0] _GEN_32 = _T_190 ? _GEN_31 : 4'h0; // @[DecodeForwardUnit.scala 144:41]
  wire [2:0] _GEN_34 = io_ctrl_branch ? _GEN_26 : 3'h0; // @[DecodeForwardUnit.scala 27:34]
  assign io_forward_rs1 = io_ctrl_branch ? {{1'd0}, _GEN_25} : _GEN_32; // @[DecodeForwardUnit.scala 23:20 DecodeForwardUnit.scala 30:24 DecodeForwardUnit.scala 33:24 DecodeForwardUnit.scala 43:24 DecodeForwardUnit.scala 56:24 DecodeForwardUnit.scala 62:24 DecodeForwardUnit.scala 75:24 DecodeForwardUnit.scala 87:24 DecodeForwardUnit.scala 108:26 DecodeForwardUnit.scala 117:24 DecodeForwardUnit.scala 138:26 DecodeForwardUnit.scala 147:26 DecodeForwardUnit.scala 155:26 DecodeForwardUnit.scala 162:28 DecodeForwardUnit.scala 175:26 DecodeForwardUnit.scala 185:26]
  assign io_forward_rs2 = {{1'd0}, _GEN_34}; // @[DecodeForwardUnit.scala 24:20 DecodeForwardUnit.scala 31:24 DecodeForwardUnit.scala 35:24 DecodeForwardUnit.scala 44:24 DecodeForwardUnit.scala 50:24 DecodeForwardUnit.scala 63:24 DecodeForwardUnit.scala 69:24 DecodeForwardUnit.scala 88:24 DecodeForwardUnit.scala 98:26 DecodeForwardUnit.scala 118:24 DecodeForwardUnit.scala 128:26]
endmodule
module BranchLogic(
  input  [31:0] io_in_rs1,
  input  [31:0] io_in_rs2,
  input  [2:0]  io_in_func3,
  output        io_output
);
  wire  _T = io_in_func3 == 3'h0; // @[BranchLogic.scala 13:20]
  wire  _T_1 = $signed(io_in_rs1) == $signed(io_in_rs2); // @[BranchLogic.scala 15:20]
  wire  _T_2 = io_in_func3 == 3'h1; // @[BranchLogic.scala 20:27]
  wire  _T_3 = $signed(io_in_rs1) != $signed(io_in_rs2); // @[BranchLogic.scala 22:20]
  wire  _T_4 = io_in_func3 == 3'h4; // @[BranchLogic.scala 27:27]
  wire  _T_5 = $signed(io_in_rs1) < $signed(io_in_rs2); // @[BranchLogic.scala 29:20]
  wire  _T_6 = io_in_func3 == 3'h5; // @[BranchLogic.scala 34:27]
  wire  _T_7 = $signed(io_in_rs1) >= $signed(io_in_rs2); // @[BranchLogic.scala 36:20]
  wire  _T_8 = io_in_func3 == 3'h6; // @[BranchLogic.scala 41:27]
  wire  _T_11 = io_in_rs1 < io_in_rs2; // @[BranchLogic.scala 43:27]
  wire  _T_12 = io_in_func3 == 3'h7; // @[BranchLogic.scala 48:27]
  wire  _T_15 = io_in_rs1 >= io_in_rs2; // @[BranchLogic.scala 50:27]
  wire  _GEN_6 = _T_12 & _T_15; // @[BranchLogic.scala 48:41]
  wire  _GEN_7 = _T_8 ? _T_11 : _GEN_6; // @[BranchLogic.scala 41:41]
  wire  _GEN_8 = _T_6 ? _T_7 : _GEN_7; // @[BranchLogic.scala 34:41]
  wire  _GEN_9 = _T_4 ? _T_5 : _GEN_8; // @[BranchLogic.scala 27:41]
  wire  _GEN_10 = _T_2 ? _T_3 : _GEN_9; // @[BranchLogic.scala 20:41]
  assign io_output = _T ? _T_1 : _GEN_10; // @[BranchLogic.scala 16:17 BranchLogic.scala 18:17 BranchLogic.scala 23:17 BranchLogic.scala 25:17 BranchLogic.scala 30:17 BranchLogic.scala 32:17 BranchLogic.scala 37:17 BranchLogic.scala 39:17 BranchLogic.scala 44:17 BranchLogic.scala 46:17 BranchLogic.scala 51:17 BranchLogic.scala 53:17 BranchLogic.scala 56:15]
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input         io_regWrite,
  input  [4:0]  io_rd_sel,
  input  [4:0]  io_rs1_sel,
  input  [4:0]  io_rs2_sel,
  input  [31:0] io_writeData,
  output [31:0] io_rs1,
  output [31:0] io_rs2,
  output [31:0] io_reg_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] registers_0; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_1; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_2; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_3; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_4; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_5; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_6; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_7; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_8; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_9; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_10; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_11; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_12; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_13; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_14; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_15; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_16; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_17; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_18; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_19; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_20; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_21; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_22; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_23; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_24; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_25; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_26; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_27; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_28; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_29; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_30; // @[RegisterFile.scala 20:28]
  reg [31:0] registers_31; // @[RegisterFile.scala 20:28]
  wire [31:0] _GEN_1 = 5'h1 == io_rs1_sel ? $signed(registers_1) : $signed(registers_0); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_2 = 5'h2 == io_rs1_sel ? $signed(registers_2) : $signed(_GEN_1); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_3 = 5'h3 == io_rs1_sel ? $signed(registers_3) : $signed(_GEN_2); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_4 = 5'h4 == io_rs1_sel ? $signed(registers_4) : $signed(_GEN_3); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_5 = 5'h5 == io_rs1_sel ? $signed(registers_5) : $signed(_GEN_4); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_6 = 5'h6 == io_rs1_sel ? $signed(registers_6) : $signed(_GEN_5); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_7 = 5'h7 == io_rs1_sel ? $signed(registers_7) : $signed(_GEN_6); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_8 = 5'h8 == io_rs1_sel ? $signed(registers_8) : $signed(_GEN_7); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_9 = 5'h9 == io_rs1_sel ? $signed(registers_9) : $signed(_GEN_8); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_10 = 5'ha == io_rs1_sel ? $signed(registers_10) : $signed(_GEN_9); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_11 = 5'hb == io_rs1_sel ? $signed(registers_11) : $signed(_GEN_10); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_12 = 5'hc == io_rs1_sel ? $signed(registers_12) : $signed(_GEN_11); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_13 = 5'hd == io_rs1_sel ? $signed(registers_13) : $signed(_GEN_12); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_14 = 5'he == io_rs1_sel ? $signed(registers_14) : $signed(_GEN_13); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_15 = 5'hf == io_rs1_sel ? $signed(registers_15) : $signed(_GEN_14); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_16 = 5'h10 == io_rs1_sel ? $signed(registers_16) : $signed(_GEN_15); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_17 = 5'h11 == io_rs1_sel ? $signed(registers_17) : $signed(_GEN_16); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_18 = 5'h12 == io_rs1_sel ? $signed(registers_18) : $signed(_GEN_17); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_19 = 5'h13 == io_rs1_sel ? $signed(registers_19) : $signed(_GEN_18); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_20 = 5'h14 == io_rs1_sel ? $signed(registers_20) : $signed(_GEN_19); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_21 = 5'h15 == io_rs1_sel ? $signed(registers_21) : $signed(_GEN_20); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_22 = 5'h16 == io_rs1_sel ? $signed(registers_22) : $signed(_GEN_21); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_23 = 5'h17 == io_rs1_sel ? $signed(registers_23) : $signed(_GEN_22); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_24 = 5'h18 == io_rs1_sel ? $signed(registers_24) : $signed(_GEN_23); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_25 = 5'h19 == io_rs1_sel ? $signed(registers_25) : $signed(_GEN_24); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_26 = 5'h1a == io_rs1_sel ? $signed(registers_26) : $signed(_GEN_25); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_27 = 5'h1b == io_rs1_sel ? $signed(registers_27) : $signed(_GEN_26); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_28 = 5'h1c == io_rs1_sel ? $signed(registers_28) : $signed(_GEN_27); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_29 = 5'h1d == io_rs1_sel ? $signed(registers_29) : $signed(_GEN_28); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_30 = 5'h1e == io_rs1_sel ? $signed(registers_30) : $signed(_GEN_29); // @[RegisterFile.scala 25:12]
  wire [31:0] _GEN_33 = 5'h1 == io_rs2_sel ? $signed(registers_1) : $signed(registers_0); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_34 = 5'h2 == io_rs2_sel ? $signed(registers_2) : $signed(_GEN_33); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_35 = 5'h3 == io_rs2_sel ? $signed(registers_3) : $signed(_GEN_34); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_36 = 5'h4 == io_rs2_sel ? $signed(registers_4) : $signed(_GEN_35); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_37 = 5'h5 == io_rs2_sel ? $signed(registers_5) : $signed(_GEN_36); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_38 = 5'h6 == io_rs2_sel ? $signed(registers_6) : $signed(_GEN_37); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_39 = 5'h7 == io_rs2_sel ? $signed(registers_7) : $signed(_GEN_38); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_40 = 5'h8 == io_rs2_sel ? $signed(registers_8) : $signed(_GEN_39); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_41 = 5'h9 == io_rs2_sel ? $signed(registers_9) : $signed(_GEN_40); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_42 = 5'ha == io_rs2_sel ? $signed(registers_10) : $signed(_GEN_41); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_43 = 5'hb == io_rs2_sel ? $signed(registers_11) : $signed(_GEN_42); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_44 = 5'hc == io_rs2_sel ? $signed(registers_12) : $signed(_GEN_43); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_45 = 5'hd == io_rs2_sel ? $signed(registers_13) : $signed(_GEN_44); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_46 = 5'he == io_rs2_sel ? $signed(registers_14) : $signed(_GEN_45); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_47 = 5'hf == io_rs2_sel ? $signed(registers_15) : $signed(_GEN_46); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_48 = 5'h10 == io_rs2_sel ? $signed(registers_16) : $signed(_GEN_47); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_49 = 5'h11 == io_rs2_sel ? $signed(registers_17) : $signed(_GEN_48); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_50 = 5'h12 == io_rs2_sel ? $signed(registers_18) : $signed(_GEN_49); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_51 = 5'h13 == io_rs2_sel ? $signed(registers_19) : $signed(_GEN_50); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_52 = 5'h14 == io_rs2_sel ? $signed(registers_20) : $signed(_GEN_51); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_53 = 5'h15 == io_rs2_sel ? $signed(registers_21) : $signed(_GEN_52); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_54 = 5'h16 == io_rs2_sel ? $signed(registers_22) : $signed(_GEN_53); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_55 = 5'h17 == io_rs2_sel ? $signed(registers_23) : $signed(_GEN_54); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_56 = 5'h18 == io_rs2_sel ? $signed(registers_24) : $signed(_GEN_55); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_57 = 5'h19 == io_rs2_sel ? $signed(registers_25) : $signed(_GEN_56); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_58 = 5'h1a == io_rs2_sel ? $signed(registers_26) : $signed(_GEN_57); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_59 = 5'h1b == io_rs2_sel ? $signed(registers_27) : $signed(_GEN_58); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_60 = 5'h1c == io_rs2_sel ? $signed(registers_28) : $signed(_GEN_59); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_61 = 5'h1d == io_rs2_sel ? $signed(registers_29) : $signed(_GEN_60); // @[RegisterFile.scala 26:12]
  wire [31:0] _GEN_62 = 5'h1e == io_rs2_sel ? $signed(registers_30) : $signed(_GEN_61); // @[RegisterFile.scala 26:12]
  wire  _T_2 = io_rd_sel == 5'h0; // @[RegisterFile.scala 28:24]
  assign io_rs1 = 5'h1f == io_rs1_sel ? $signed(registers_31) : $signed(_GEN_30); // @[RegisterFile.scala 25:12]
  assign io_rs2 = 5'h1f == io_rs2_sel ? $signed(registers_31) : $signed(_GEN_62); // @[RegisterFile.scala 26:12]
  assign io_reg_7 = registers_7; // @[RegisterFile.scala 22:14]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  registers_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registers_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registers_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registers_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registers_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registers_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registers_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registers_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registers_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registers_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registers_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registers_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registers_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  registers_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  registers_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  registers_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  registers_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  registers_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  registers_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  registers_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  registers_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  registers_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  registers_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  registers_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  registers_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  registers_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  registers_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  registers_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  registers_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      registers_0 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        registers_0 <= 32'sh0;
      end else if (5'h0 == io_rd_sel) begin
        registers_0 <= io_writeData;
      end else begin
        registers_0 <= 32'sh0;
      end
    end else begin
      registers_0 <= 32'sh0;
    end
    if (reset) begin
      registers_1 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h1 == io_rd_sel) begin
          registers_1 <= 32'sh0;
        end
      end else if (5'h1 == io_rd_sel) begin
        registers_1 <= io_writeData;
      end
    end
    if (reset) begin
      registers_2 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h2 == io_rd_sel) begin
          registers_2 <= 32'sh0;
        end
      end else if (5'h2 == io_rd_sel) begin
        registers_2 <= io_writeData;
      end
    end
    if (reset) begin
      registers_3 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h3 == io_rd_sel) begin
          registers_3 <= 32'sh0;
        end
      end else if (5'h3 == io_rd_sel) begin
        registers_3 <= io_writeData;
      end
    end
    if (reset) begin
      registers_4 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h4 == io_rd_sel) begin
          registers_4 <= 32'sh0;
        end
      end else if (5'h4 == io_rd_sel) begin
        registers_4 <= io_writeData;
      end
    end
    if (reset) begin
      registers_5 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h5 == io_rd_sel) begin
          registers_5 <= 32'sh0;
        end
      end else if (5'h5 == io_rd_sel) begin
        registers_5 <= io_writeData;
      end
    end
    if (reset) begin
      registers_6 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h6 == io_rd_sel) begin
          registers_6 <= 32'sh0;
        end
      end else if (5'h6 == io_rd_sel) begin
        registers_6 <= io_writeData;
      end
    end
    if (reset) begin
      registers_7 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h7 == io_rd_sel) begin
          registers_7 <= 32'sh0;
        end
      end else if (5'h7 == io_rd_sel) begin
        registers_7 <= io_writeData;
      end
    end
    if (reset) begin
      registers_8 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h8 == io_rd_sel) begin
          registers_8 <= 32'sh0;
        end
      end else if (5'h8 == io_rd_sel) begin
        registers_8 <= io_writeData;
      end
    end
    if (reset) begin
      registers_9 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h9 == io_rd_sel) begin
          registers_9 <= 32'sh0;
        end
      end else if (5'h9 == io_rd_sel) begin
        registers_9 <= io_writeData;
      end
    end
    if (reset) begin
      registers_10 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'ha == io_rd_sel) begin
          registers_10 <= 32'sh0;
        end
      end else if (5'ha == io_rd_sel) begin
        registers_10 <= io_writeData;
      end
    end
    if (reset) begin
      registers_11 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'hb == io_rd_sel) begin
          registers_11 <= 32'sh0;
        end
      end else if (5'hb == io_rd_sel) begin
        registers_11 <= io_writeData;
      end
    end
    if (reset) begin
      registers_12 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'hc == io_rd_sel) begin
          registers_12 <= 32'sh0;
        end
      end else if (5'hc == io_rd_sel) begin
        registers_12 <= io_writeData;
      end
    end
    if (reset) begin
      registers_13 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'hd == io_rd_sel) begin
          registers_13 <= 32'sh0;
        end
      end else if (5'hd == io_rd_sel) begin
        registers_13 <= io_writeData;
      end
    end
    if (reset) begin
      registers_14 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'he == io_rd_sel) begin
          registers_14 <= 32'sh0;
        end
      end else if (5'he == io_rd_sel) begin
        registers_14 <= io_writeData;
      end
    end
    if (reset) begin
      registers_15 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'hf == io_rd_sel) begin
          registers_15 <= 32'sh0;
        end
      end else if (5'hf == io_rd_sel) begin
        registers_15 <= io_writeData;
      end
    end
    if (reset) begin
      registers_16 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h10 == io_rd_sel) begin
          registers_16 <= 32'sh0;
        end
      end else if (5'h10 == io_rd_sel) begin
        registers_16 <= io_writeData;
      end
    end
    if (reset) begin
      registers_17 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h11 == io_rd_sel) begin
          registers_17 <= 32'sh0;
        end
      end else if (5'h11 == io_rd_sel) begin
        registers_17 <= io_writeData;
      end
    end
    if (reset) begin
      registers_18 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h12 == io_rd_sel) begin
          registers_18 <= 32'sh0;
        end
      end else if (5'h12 == io_rd_sel) begin
        registers_18 <= io_writeData;
      end
    end
    if (reset) begin
      registers_19 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h13 == io_rd_sel) begin
          registers_19 <= 32'sh0;
        end
      end else if (5'h13 == io_rd_sel) begin
        registers_19 <= io_writeData;
      end
    end
    if (reset) begin
      registers_20 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h14 == io_rd_sel) begin
          registers_20 <= 32'sh0;
        end
      end else if (5'h14 == io_rd_sel) begin
        registers_20 <= io_writeData;
      end
    end
    if (reset) begin
      registers_21 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h15 == io_rd_sel) begin
          registers_21 <= 32'sh0;
        end
      end else if (5'h15 == io_rd_sel) begin
        registers_21 <= io_writeData;
      end
    end
    if (reset) begin
      registers_22 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h16 == io_rd_sel) begin
          registers_22 <= 32'sh0;
        end
      end else if (5'h16 == io_rd_sel) begin
        registers_22 <= io_writeData;
      end
    end
    if (reset) begin
      registers_23 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h17 == io_rd_sel) begin
          registers_23 <= 32'sh0;
        end
      end else if (5'h17 == io_rd_sel) begin
        registers_23 <= io_writeData;
      end
    end
    if (reset) begin
      registers_24 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h18 == io_rd_sel) begin
          registers_24 <= 32'sh0;
        end
      end else if (5'h18 == io_rd_sel) begin
        registers_24 <= io_writeData;
      end
    end
    if (reset) begin
      registers_25 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h19 == io_rd_sel) begin
          registers_25 <= 32'sh0;
        end
      end else if (5'h19 == io_rd_sel) begin
        registers_25 <= io_writeData;
      end
    end
    if (reset) begin
      registers_26 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h1a == io_rd_sel) begin
          registers_26 <= 32'sh0;
        end
      end else if (5'h1a == io_rd_sel) begin
        registers_26 <= io_writeData;
      end
    end
    if (reset) begin
      registers_27 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h1b == io_rd_sel) begin
          registers_27 <= 32'sh0;
        end
      end else if (5'h1b == io_rd_sel) begin
        registers_27 <= io_writeData;
      end
    end
    if (reset) begin
      registers_28 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h1c == io_rd_sel) begin
          registers_28 <= 32'sh0;
        end
      end else if (5'h1c == io_rd_sel) begin
        registers_28 <= io_writeData;
      end
    end
    if (reset) begin
      registers_29 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h1d == io_rd_sel) begin
          registers_29 <= 32'sh0;
        end
      end else if (5'h1d == io_rd_sel) begin
        registers_29 <= io_writeData;
      end
    end
    if (reset) begin
      registers_30 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h1e == io_rd_sel) begin
          registers_30 <= 32'sh0;
        end
      end else if (5'h1e == io_rd_sel) begin
        registers_30 <= io_writeData;
      end
    end
    if (reset) begin
      registers_31 <= 32'sh0;
    end else if (io_regWrite) begin
      if (_T_2) begin
        if (5'h1f == io_rd_sel) begin
          registers_31 <= 32'sh0;
        end
      end else if (5'h1f == io_rd_sel) begin
        registers_31 <= io_writeData;
      end
    end
  end
endmodule
module ImmediateGeneration(
  input  [31:0] io_instruction,
  input  [31:0] io_pc,
  output [31:0] io_s_imm,
  output [31:0] io_sb_imm,
  output [31:0] io_u_imm,
  output [31:0] io_uj_imm,
  output [31:0] io_i_imm
);
  wire [4:0] s_lower_half = io_instruction[11:7]; // @[ImmediateGeneration.scala 19:38]
  wire [6:0] s_upper_half = io_instruction[31:25]; // @[ImmediateGeneration.scala 20:38]
  wire [11:0] s_imm_12 = {s_upper_half,s_lower_half}; // @[Cat.scala 29:58]
  wire [19:0] _T_2 = s_imm_12[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [3:0] sb_lower_half = io_instruction[11:8]; // @[ImmediateGeneration.scala 28:39]
  wire [5:0] sb_upper_half = io_instruction[30:25]; // @[ImmediateGeneration.scala 29:39]
  wire  sb_11thbit = io_instruction[7]; // @[ImmediateGeneration.scala 30:36]
  wire  sb_12thbit = io_instruction[31]; // @[ImmediateGeneration.scala 31:36]
  wire [12:0] sb_imm_13 = {sb_12thbit,sb_11thbit,sb_upper_half,sb_lower_half,1'h0}; // @[Cat.scala 29:58]
  wire [18:0] _T_10 = sb_imm_13[12] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] sb_imm_32 = {_T_10,sb_12thbit,sb_11thbit,sb_upper_half,sb_lower_half,1'h0}; // @[ImmediateGeneration.scala 33:61]
  wire [19:0] u_imm_20 = io_instruction[31:12]; // @[ImmediateGeneration.scala 39:34]
  wire [11:0] _T_17 = u_imm_20[19] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [31:0] u_imm_32 = {_T_17,u_imm_20}; // @[Cat.scala 29:58]
  wire [43:0] _GEN_0 = {u_imm_32, 12'h0}; // @[ImmediateGeneration.scala 42:37]
  wire [46:0] _T_18 = {{3'd0}, _GEN_0}; // @[ImmediateGeneration.scala 43:34]
  wire [9:0] uj_lower_half = io_instruction[30:21]; // @[ImmediateGeneration.scala 48:39]
  wire  uj_11thbit = io_instruction[20]; // @[ImmediateGeneration.scala 49:36]
  wire [7:0] uj_upper_half = io_instruction[19:12]; // @[ImmediateGeneration.scala 50:39]
  wire [20:0] uj_imm_21 = {sb_12thbit,uj_upper_half,uj_11thbit,uj_lower_half,1'h0}; // @[Cat.scala 29:58]
  wire [10:0] _T_25 = uj_imm_21[20] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [31:0] uj_imm_32 = {_T_25,sb_12thbit,uj_upper_half,uj_11thbit,uj_lower_half,1'h0}; // @[ImmediateGeneration.scala 53:61]
  wire [11:0] i_imm_12 = io_instruction[31:20]; // @[ImmediateGeneration.scala 59:34]
  wire [19:0] _T_32 = i_imm_12[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  assign io_s_imm = {_T_2,s_upper_half,s_lower_half}; // @[ImmediateGeneration.scala 23:14]
  assign io_sb_imm = $signed(sb_imm_32) + $signed(io_pc); // @[ImmediateGeneration.scala 34:15]
  assign io_u_imm = _T_18[31:0]; // @[ImmediateGeneration.scala 43:14]
  assign io_uj_imm = $signed(uj_imm_32) + $signed(io_pc); // @[ImmediateGeneration.scala 54:15]
  assign io_i_imm = {_T_32,i_imm_12}; // @[ImmediateGeneration.scala 61:14]
endmodule
module StructuralDetector(
  input  [4:0] io_rs1_sel,
  input  [4:0] io_rs2_sel,
  input        io_MEM_WB_regWr,
  input  [4:0] io_MEM_WB_REGRD,
  output       io_fwd_rs1,
  output       io_fwd_rs2
);
  wire  _T_1 = io_MEM_WB_REGRD != 5'h0; // @[StructuralDetector.scala 17:51]
  wire  _T_2 = io_MEM_WB_regWr & _T_1; // @[StructuralDetector.scala 17:32]
  wire  _T_3 = io_MEM_WB_REGRD == io_rs1_sel; // @[StructuralDetector.scala 17:86]
  wire  _T_8 = io_MEM_WB_REGRD == io_rs2_sel; // @[StructuralDetector.scala 23:86]
  assign io_fwd_rs1 = _T_2 & _T_3; // @[StructuralDetector.scala 18:16 StructuralDetector.scala 20:16]
  assign io_fwd_rs2 = _T_2 & _T_8; // @[StructuralDetector.scala 24:16 StructuralDetector.scala 26:16]
endmodule
module Jalr(
  input  [31:0] io_input_a,
  input  [31:0] io_input_b,
  output [31:0] io_output
);
  wire [31:0] sum = $signed(io_input_a) + $signed(io_input_b); // @[Jalr.scala 12:26]
  wire [32:0] _GEN_0 = {{1{sum[31]}},sum}; // @[Jalr.scala 13:22]
  wire [32:0] _T_3 = $signed(_GEN_0) & 33'shfffffffe; // @[Jalr.scala 13:22]
  assign io_output = _T_3[31:0]; // @[Jalr.scala 13:15]
endmodule
module Decode(
  input         clock,
  input         reset,
  input  [31:0] io_IF_ID_inst,
  input  [31:0] io_IF_ID_pc,
  input  [31:0] io_IF_ID_pc4,
  input         io_MEM_WB_ctrl_regWr,
  input  [4:0]  io_MEM_WB_rd_sel,
  input         io_ID_EX_ctrl_MemRd,
  input  [4:0]  io_ID_EX_rd_sel,
  input  [4:0]  io_EX_MEM_rd_sel,
  input         io_EX_MEM_ctrl_MemRd,
  input         io_MEM_WB_ctrl_MemRd,
  input  [31:0] io_alu_output,
  input  [31:0] io_EX_MEM_alu_output,
  input  [31:0] io_dmem_memOut,
  input  [31:0] io_writeback_write_data,
  input         io_execute_regwrite,
  input         io_mem_regwrite,
  input         io_wb_regwrite,
  output [31:0] io_pc_out,
  output [31:0] io_pc4_out,
  output [2:0]  io_func3_out,
  output [6:0]  io_func7_out,
  output [4:0]  io_rd_sel_out,
  output [4:0]  io_rs1_sel_out,
  output [4:0]  io_rs2_sel_out,
  output [31:0] io_rs1_out,
  output [31:0] io_rs2_out,
  output [31:0] io_imm_out,
  output [31:0] io_sb_imm,
  output [31:0] io_uj_imm,
  output [31:0] io_jalr_output,
  output        io_branchLogic_output,
  output [31:0] io_hazardDetection_pc_out,
  output [31:0] io_hazardDetection_inst_out,
  output [31:0] io_hazardDetection_current_pc_out,
  output        io_hazardDetection_pc_forward,
  output        io_hazardDetection_inst_forward,
  output        io_ctrl_MemWr_out,
  output        io_ctrl_MemRd_out,
  output        io_ctrl_Branch_out,
  output        io_ctrl_RegWr_out,
  output        io_ctrl_MemToReg_out,
  output [3:0]  io_ctrl_AluOp_out,
  output [1:0]  io_ctrl_OpA_sel_out,
  output        io_ctrl_OpB_sel_out,
  output [1:0]  io_ctrl_next_pc_sel_out,
  output [31:0] io_reg_7_out
);
  wire [31:0] hazardDetection_io_IF_ID_INST; // @[Decode.scala 62:31]
  wire  hazardDetection_io_ID_EX_MEMREAD; // @[Decode.scala 62:31]
  wire [4:0] hazardDetection_io_ID_EX_REGRD; // @[Decode.scala 62:31]
  wire [31:0] hazardDetection_io_pc_in; // @[Decode.scala 62:31]
  wire [31:0] hazardDetection_io_current_pc; // @[Decode.scala 62:31]
  wire  hazardDetection_io_IF_ID_MEMREAD; // @[Decode.scala 62:31]
  wire  hazardDetection_io_inst_forward; // @[Decode.scala 62:31]
  wire  hazardDetection_io_pc_forward; // @[Decode.scala 62:31]
  wire  hazardDetection_io_ctrl_forward; // @[Decode.scala 62:31]
  wire [31:0] hazardDetection_io_inst_out; // @[Decode.scala 62:31]
  wire [31:0] hazardDetection_io_pc_out; // @[Decode.scala 62:31]
  wire [31:0] hazardDetection_io_current_pc_out; // @[Decode.scala 62:31]
  wire [6:0] control_io_in_opcode; // @[Decode.scala 63:23]
  wire [6:0] control_io_func7; // @[Decode.scala 63:23]
  wire  control_io_out_memWrite; // @[Decode.scala 63:23]
  wire  control_io_out_branch; // @[Decode.scala 63:23]
  wire  control_io_out_memRead; // @[Decode.scala 63:23]
  wire  control_io_out_regWrite; // @[Decode.scala 63:23]
  wire  control_io_out_memToReg; // @[Decode.scala 63:23]
  wire [3:0] control_io_out_aluOp; // @[Decode.scala 63:23]
  wire [1:0] control_io_out_operand_a_sel; // @[Decode.scala 63:23]
  wire  control_io_out_operand_b_sel; // @[Decode.scala 63:23]
  wire [1:0] control_io_out_extend_sel; // @[Decode.scala 63:23]
  wire [1:0] control_io_out_next_pc_sel; // @[Decode.scala 63:23]
  wire [4:0] decodeForwardUnit_io_ID_EX_REGRD; // @[Decode.scala 64:33]
  wire  decodeForwardUnit_io_ID_EX_MEMRD; // @[Decode.scala 64:33]
  wire [4:0] decodeForwardUnit_io_EX_MEM_REGRD; // @[Decode.scala 64:33]
  wire  decodeForwardUnit_io_EX_MEM_MEMRD; // @[Decode.scala 64:33]
  wire [4:0] decodeForwardUnit_io_MEM_WB_REGRD; // @[Decode.scala 64:33]
  wire  decodeForwardUnit_io_MEM_WB_MEMRD; // @[Decode.scala 64:33]
  wire  decodeForwardUnit_io_execute_regwrite; // @[Decode.scala 64:33]
  wire  decodeForwardUnit_io_mem_regwrite; // @[Decode.scala 64:33]
  wire  decodeForwardUnit_io_wb_regwrite; // @[Decode.scala 64:33]
  wire [4:0] decodeForwardUnit_io_rs1_sel; // @[Decode.scala 64:33]
  wire [4:0] decodeForwardUnit_io_rs2_sel; // @[Decode.scala 64:33]
  wire  decodeForwardUnit_io_ctrl_branch; // @[Decode.scala 64:33]
  wire [3:0] decodeForwardUnit_io_forward_rs1; // @[Decode.scala 64:33]
  wire [3:0] decodeForwardUnit_io_forward_rs2; // @[Decode.scala 64:33]
  wire [31:0] branchLogic_io_in_rs1; // @[Decode.scala 65:27]
  wire [31:0] branchLogic_io_in_rs2; // @[Decode.scala 65:27]
  wire [2:0] branchLogic_io_in_func3; // @[Decode.scala 65:27]
  wire  branchLogic_io_output; // @[Decode.scala 65:27]
  wire  reg_file_clock; // @[Decode.scala 66:24]
  wire  reg_file_reset; // @[Decode.scala 66:24]
  wire  reg_file_io_regWrite; // @[Decode.scala 66:24]
  wire [4:0] reg_file_io_rd_sel; // @[Decode.scala 66:24]
  wire [4:0] reg_file_io_rs1_sel; // @[Decode.scala 66:24]
  wire [4:0] reg_file_io_rs2_sel; // @[Decode.scala 66:24]
  wire [31:0] reg_file_io_writeData; // @[Decode.scala 66:24]
  wire [31:0] reg_file_io_rs1; // @[Decode.scala 66:24]
  wire [31:0] reg_file_io_rs2; // @[Decode.scala 66:24]
  wire [31:0] reg_file_io_reg_7; // @[Decode.scala 66:24]
  wire [31:0] imm_generation_io_instruction; // @[Decode.scala 67:30]
  wire [31:0] imm_generation_io_pc; // @[Decode.scala 67:30]
  wire [31:0] imm_generation_io_s_imm; // @[Decode.scala 67:30]
  wire [31:0] imm_generation_io_sb_imm; // @[Decode.scala 67:30]
  wire [31:0] imm_generation_io_u_imm; // @[Decode.scala 67:30]
  wire [31:0] imm_generation_io_uj_imm; // @[Decode.scala 67:30]
  wire [31:0] imm_generation_io_i_imm; // @[Decode.scala 67:30]
  wire [4:0] structuralDetector_io_rs1_sel; // @[Decode.scala 68:34]
  wire [4:0] structuralDetector_io_rs2_sel; // @[Decode.scala 68:34]
  wire  structuralDetector_io_MEM_WB_regWr; // @[Decode.scala 68:34]
  wire [4:0] structuralDetector_io_MEM_WB_REGRD; // @[Decode.scala 68:34]
  wire  structuralDetector_io_fwd_rs1; // @[Decode.scala 68:34]
  wire  structuralDetector_io_fwd_rs2; // @[Decode.scala 68:34]
  wire [31:0] jalr_io_input_a; // @[Decode.scala 69:20]
  wire [31:0] jalr_io_input_b; // @[Decode.scala 69:20]
  wire [31:0] jalr_io_output; // @[Decode.scala 69:20]
  wire  _T_5 = decodeForwardUnit_io_forward_rs1 == 4'h0; // @[Decode.scala 115:41]
  wire  _T_6 = decodeForwardUnit_io_forward_rs1 == 4'h1; // @[Decode.scala 119:48]
  wire  _T_7 = decodeForwardUnit_io_forward_rs1 == 4'h2; // @[Decode.scala 123:48]
  wire  _T_8 = decodeForwardUnit_io_forward_rs1 == 4'h3; // @[Decode.scala 127:48]
  wire  _T_9 = decodeForwardUnit_io_forward_rs1 == 4'h4; // @[Decode.scala 131:48]
  wire  _T_10 = decodeForwardUnit_io_forward_rs1 == 4'h5; // @[Decode.scala 135:48]
  wire  _T_11 = decodeForwardUnit_io_forward_rs1 == 4'h6; // @[Decode.scala 145:48]
  wire  _T_12 = decodeForwardUnit_io_forward_rs1 == 4'h7; // @[Decode.scala 149:50]
  wire  _T_13 = decodeForwardUnit_io_forward_rs1 == 4'h8; // @[Decode.scala 153:48]
  wire  _T_14 = decodeForwardUnit_io_forward_rs1 == 4'h9; // @[Decode.scala 157:48]
  wire  _T_15 = decodeForwardUnit_io_forward_rs1 == 4'ha; // @[Decode.scala 161:48]
  wire [31:0] _GEN_0 = _T_15 ? $signed(reg_file_io_writeData) : $signed(reg_file_io_rs1); // @[Decode.scala 161:63]
  wire [31:0] _GEN_1 = reg_file_io_rs1; // @[Decode.scala 161:63]
  wire [31:0] _GEN_2 = _T_14 ? $signed(io_dmem_memOut) : $signed(_GEN_0); // @[Decode.scala 157:63]
  wire [31:0] _GEN_3 = _T_14 ? $signed(reg_file_io_rs1) : $signed(_GEN_1); // @[Decode.scala 157:63]
  wire [31:0] _GEN_4 = _T_13 ? $signed(reg_file_io_writeData) : $signed(_GEN_2); // @[Decode.scala 153:63]
  wire [31:0] _GEN_5 = _T_13 ? $signed(reg_file_io_rs1) : $signed(_GEN_3); // @[Decode.scala 153:63]
  wire [31:0] _GEN_6 = _T_12 ? $signed(io_EX_MEM_alu_output) : $signed(_GEN_4); // @[Decode.scala 149:65]
  wire [31:0] _GEN_7 = _T_12 ? $signed(reg_file_io_rs1) : $signed(_GEN_5); // @[Decode.scala 149:65]
  wire [31:0] _GEN_8 = _T_11 ? $signed(io_alu_output) : $signed(_GEN_6); // @[Decode.scala 145:63]
  wire [31:0] _GEN_9 = _T_11 ? $signed(reg_file_io_rs1) : $signed(_GEN_7); // @[Decode.scala 145:63]
  wire [31:0] _GEN_10 = _T_10 ? $signed(reg_file_io_writeData) : $signed(_GEN_9); // @[Decode.scala 135:63]
  wire [31:0] _GEN_11 = _T_10 ? $signed(reg_file_io_rs1) : $signed(_GEN_8); // @[Decode.scala 135:63]
  wire [31:0] _GEN_12 = _T_9 ? $signed(io_dmem_memOut) : $signed(_GEN_10); // @[Decode.scala 131:63]
  wire [31:0] _GEN_13 = _T_9 ? $signed(reg_file_io_rs1) : $signed(_GEN_11); // @[Decode.scala 131:63]
  wire [31:0] _GEN_14 = _T_8 ? $signed(reg_file_io_writeData) : $signed(_GEN_12); // @[Decode.scala 127:63]
  wire [31:0] _GEN_15 = _T_8 ? $signed(reg_file_io_rs1) : $signed(_GEN_13); // @[Decode.scala 127:63]
  wire [31:0] _GEN_16 = _T_7 ? $signed(io_EX_MEM_alu_output) : $signed(_GEN_14); // @[Decode.scala 123:63]
  wire [31:0] _GEN_17 = _T_7 ? $signed(reg_file_io_rs1) : $signed(_GEN_15); // @[Decode.scala 123:63]
  wire [31:0] _GEN_18 = _T_6 ? $signed(io_alu_output) : $signed(_GEN_16); // @[Decode.scala 119:63]
  wire [31:0] _GEN_19 = _T_6 ? $signed(reg_file_io_rs1) : $signed(_GEN_17); // @[Decode.scala 119:63]
  wire  _T_16 = decodeForwardUnit_io_forward_rs2 == 4'h0; // @[Decode.scala 173:41]
  wire  _T_17 = decodeForwardUnit_io_forward_rs2 == 4'h1; // @[Decode.scala 176:48]
  wire  _T_18 = decodeForwardUnit_io_forward_rs2 == 4'h2; // @[Decode.scala 179:48]
  wire  _T_19 = decodeForwardUnit_io_forward_rs2 == 4'h3; // @[Decode.scala 182:48]
  wire  _T_20 = decodeForwardUnit_io_forward_rs2 == 4'h4; // @[Decode.scala 185:48]
  wire  _T_21 = decodeForwardUnit_io_forward_rs2 == 4'h5; // @[Decode.scala 188:48]
  wire [31:0] _GEN_22 = _T_21 ? $signed(reg_file_io_writeData) : $signed(reg_file_io_rs2); // @[Decode.scala 188:63]
  wire [31:0] _GEN_23 = _T_20 ? $signed(io_dmem_memOut) : $signed(_GEN_22); // @[Decode.scala 185:63]
  wire [31:0] _GEN_24 = _T_19 ? $signed(reg_file_io_writeData) : $signed(_GEN_23); // @[Decode.scala 182:63]
  wire [31:0] _GEN_25 = _T_18 ? $signed(io_EX_MEM_alu_output) : $signed(_GEN_24); // @[Decode.scala 179:63]
  wire [31:0] _GEN_26 = _T_17 ? $signed(io_alu_output) : $signed(_GEN_25); // @[Decode.scala 176:63]
  wire  _T_22 = hazardDetection_io_ctrl_forward; // @[Decode.scala 204:40]
  wire  _T_27 = structuralDetector_io_fwd_rs1; // @[Decode.scala 237:38]
  wire  _T_28 = structuralDetector_io_fwd_rs2; // @[Decode.scala 244:38]
  wire  _T_29 = control_io_out_extend_sel == 2'h0; // @[Decode.scala 250:34]
  wire  _T_30 = control_io_out_extend_sel == 2'h1; // @[Decode.scala 253:41]
  wire  _T_31 = control_io_out_extend_sel == 2'h2; // @[Decode.scala 256:41]
  wire [31:0] _GEN_39 = _T_31 ? $signed(imm_generation_io_u_imm) : $signed(32'sh0); // @[Decode.scala 256:54]
  wire [31:0] _GEN_40 = _T_30 ? $signed(imm_generation_io_s_imm) : $signed(_GEN_39); // @[Decode.scala 253:54]
  HazardDetection hazardDetection ( // @[Decode.scala 62:31]
    .io_IF_ID_INST(hazardDetection_io_IF_ID_INST),
    .io_ID_EX_MEMREAD(hazardDetection_io_ID_EX_MEMREAD),
    .io_ID_EX_REGRD(hazardDetection_io_ID_EX_REGRD),
    .io_pc_in(hazardDetection_io_pc_in),
    .io_current_pc(hazardDetection_io_current_pc),
    .io_IF_ID_MEMREAD(hazardDetection_io_IF_ID_MEMREAD),
    .io_inst_forward(hazardDetection_io_inst_forward),
    .io_pc_forward(hazardDetection_io_pc_forward),
    .io_ctrl_forward(hazardDetection_io_ctrl_forward),
    .io_inst_out(hazardDetection_io_inst_out),
    .io_pc_out(hazardDetection_io_pc_out),
    .io_current_pc_out(hazardDetection_io_current_pc_out)
  );
  Control control ( // @[Decode.scala 63:23]
    .io_in_opcode(control_io_in_opcode),
    .io_func7(control_io_func7),
    .io_out_memWrite(control_io_out_memWrite),
    .io_out_branch(control_io_out_branch),
    .io_out_memRead(control_io_out_memRead),
    .io_out_regWrite(control_io_out_regWrite),
    .io_out_memToReg(control_io_out_memToReg),
    .io_out_aluOp(control_io_out_aluOp),
    .io_out_operand_a_sel(control_io_out_operand_a_sel),
    .io_out_operand_b_sel(control_io_out_operand_b_sel),
    .io_out_extend_sel(control_io_out_extend_sel),
    .io_out_next_pc_sel(control_io_out_next_pc_sel)
  );
  DecodeForwardUnit decodeForwardUnit ( // @[Decode.scala 64:33]
    .io_ID_EX_REGRD(decodeForwardUnit_io_ID_EX_REGRD),
    .io_ID_EX_MEMRD(decodeForwardUnit_io_ID_EX_MEMRD),
    .io_EX_MEM_REGRD(decodeForwardUnit_io_EX_MEM_REGRD),
    .io_EX_MEM_MEMRD(decodeForwardUnit_io_EX_MEM_MEMRD),
    .io_MEM_WB_REGRD(decodeForwardUnit_io_MEM_WB_REGRD),
    .io_MEM_WB_MEMRD(decodeForwardUnit_io_MEM_WB_MEMRD),
    .io_execute_regwrite(decodeForwardUnit_io_execute_regwrite),
    .io_mem_regwrite(decodeForwardUnit_io_mem_regwrite),
    .io_wb_regwrite(decodeForwardUnit_io_wb_regwrite),
    .io_rs1_sel(decodeForwardUnit_io_rs1_sel),
    .io_rs2_sel(decodeForwardUnit_io_rs2_sel),
    .io_ctrl_branch(decodeForwardUnit_io_ctrl_branch),
    .io_forward_rs1(decodeForwardUnit_io_forward_rs1),
    .io_forward_rs2(decodeForwardUnit_io_forward_rs2)
  );
  BranchLogic branchLogic ( // @[Decode.scala 65:27]
    .io_in_rs1(branchLogic_io_in_rs1),
    .io_in_rs2(branchLogic_io_in_rs2),
    .io_in_func3(branchLogic_io_in_func3),
    .io_output(branchLogic_io_output)
  );
  RegisterFile reg_file ( // @[Decode.scala 66:24]
    .clock(reg_file_clock),
    .reset(reg_file_reset),
    .io_regWrite(reg_file_io_regWrite),
    .io_rd_sel(reg_file_io_rd_sel),
    .io_rs1_sel(reg_file_io_rs1_sel),
    .io_rs2_sel(reg_file_io_rs2_sel),
    .io_writeData(reg_file_io_writeData),
    .io_rs1(reg_file_io_rs1),
    .io_rs2(reg_file_io_rs2),
    .io_reg_7(reg_file_io_reg_7)
  );
  ImmediateGeneration imm_generation ( // @[Decode.scala 67:30]
    .io_instruction(imm_generation_io_instruction),
    .io_pc(imm_generation_io_pc),
    .io_s_imm(imm_generation_io_s_imm),
    .io_sb_imm(imm_generation_io_sb_imm),
    .io_u_imm(imm_generation_io_u_imm),
    .io_uj_imm(imm_generation_io_uj_imm),
    .io_i_imm(imm_generation_io_i_imm)
  );
  StructuralDetector structuralDetector ( // @[Decode.scala 68:34]
    .io_rs1_sel(structuralDetector_io_rs1_sel),
    .io_rs2_sel(structuralDetector_io_rs2_sel),
    .io_MEM_WB_regWr(structuralDetector_io_MEM_WB_regWr),
    .io_MEM_WB_REGRD(structuralDetector_io_MEM_WB_REGRD),
    .io_fwd_rs1(structuralDetector_io_fwd_rs1),
    .io_fwd_rs2(structuralDetector_io_fwd_rs2)
  );
  Jalr jalr ( // @[Decode.scala 69:20]
    .io_input_a(jalr_io_input_a),
    .io_input_b(jalr_io_input_b),
    .io_output(jalr_io_output)
  );
  assign io_pc_out = io_IF_ID_pc; // @[Decode.scala 263:13]
  assign io_pc4_out = io_IF_ID_pc4; // @[Decode.scala 264:14]
  assign io_func3_out = io_IF_ID_inst[14:12]; // @[Decode.scala 266:16]
  assign io_func7_out = io_IF_ID_inst[31:25]; // @[Decode.scala 267:16]
  assign io_rd_sel_out = io_IF_ID_inst[11:7]; // @[Decode.scala 268:17]
  assign io_rs1_sel_out = io_IF_ID_inst[19:15]; // @[Decode.scala 269:18]
  assign io_rs2_sel_out = io_IF_ID_inst[24:20]; // @[Decode.scala 270:18]
  assign io_rs1_out = _T_27 ? $signed(reg_file_io_writeData) : $signed(reg_file_io_rs1); // @[Decode.scala 238:16 Decode.scala 240:16]
  assign io_rs2_out = _T_28 ? $signed(reg_file_io_writeData) : $signed(reg_file_io_rs2); // @[Decode.scala 245:16 Decode.scala 247:16]
  assign io_imm_out = _T_29 ? $signed(imm_generation_io_i_imm) : $signed(_GEN_40); // @[Decode.scala 252:16 Decode.scala 255:16 Decode.scala 258:16 Decode.scala 260:16]
  assign io_sb_imm = imm_generation_io_sb_imm; // @[Decode.scala 226:13]
  assign io_uj_imm = imm_generation_io_uj_imm; // @[Decode.scala 227:13]
  assign io_jalr_output = jalr_io_output; // @[Decode.scala 228:18]
  assign io_branchLogic_output = branchLogic_io_output; // @[Decode.scala 199:25]
  assign io_hazardDetection_pc_out = hazardDetection_io_pc_out; // @[Decode.scala 82:29]
  assign io_hazardDetection_inst_out = hazardDetection_io_inst_out; // @[Decode.scala 85:31]
  assign io_hazardDetection_current_pc_out = hazardDetection_io_current_pc_out; // @[Decode.scala 83:37]
  assign io_hazardDetection_pc_forward = hazardDetection_io_pc_forward; // @[Decode.scala 84:33]
  assign io_hazardDetection_inst_forward = hazardDetection_io_inst_forward; // @[Decode.scala 86:35]
  assign io_ctrl_MemWr_out = _T_22 ? 1'h0 : control_io_out_memWrite; // @[Decode.scala 273:23 Decode.scala 286:23]
  assign io_ctrl_MemRd_out = _T_22 ? 1'h0 : control_io_out_memRead; // @[Decode.scala 274:23 Decode.scala 287:23]
  assign io_ctrl_Branch_out = _T_22 ? 1'h0 : control_io_out_branch; // @[Decode.scala 275:24 Decode.scala 288:24]
  assign io_ctrl_RegWr_out = _T_22 ? 1'h0 : control_io_out_regWrite; // @[Decode.scala 276:23 Decode.scala 289:23]
  assign io_ctrl_MemToReg_out = _T_22 ? 1'h0 : control_io_out_memToReg; // @[Decode.scala 277:26 Decode.scala 290:26]
  assign io_ctrl_AluOp_out = _T_22 ? 4'h0 : control_io_out_aluOp; // @[Decode.scala 278:23 Decode.scala 291:23]
  assign io_ctrl_OpA_sel_out = _T_22 ? 2'h0 : control_io_out_operand_a_sel; // @[Decode.scala 279:25 Decode.scala 292:25]
  assign io_ctrl_OpB_sel_out = _T_22 ? 1'h0 : control_io_out_operand_b_sel; // @[Decode.scala 280:25 Decode.scala 293:25]
  assign io_ctrl_next_pc_sel_out = _T_22 ? 2'h0 : control_io_out_next_pc_sel; // @[Decode.scala 281:29 Decode.scala 294:29]
  assign io_reg_7_out = reg_file_io_reg_7; // @[Decode.scala 298:16]
  assign hazardDetection_io_IF_ID_INST = io_IF_ID_inst; // @[Decode.scala 74:33]
  assign hazardDetection_io_ID_EX_MEMREAD = io_ID_EX_ctrl_MemRd; // @[Decode.scala 75:36]
  assign hazardDetection_io_ID_EX_REGRD = io_ID_EX_rd_sel; // @[Decode.scala 76:34]
  assign hazardDetection_io_pc_in = io_IF_ID_pc4; // @[Decode.scala 77:28]
  assign hazardDetection_io_current_pc = io_IF_ID_pc; // @[Decode.scala 78:33]
  assign hazardDetection_io_IF_ID_MEMREAD = control_io_out_memRead; // @[Decode.scala 79:36]
  assign control_io_in_opcode = io_IF_ID_inst[6:0]; // @[Decode.scala 89:24]
  assign control_io_func7 = io_IF_ID_inst[31:25]; // @[Decode.scala 91:25]
  assign decodeForwardUnit_io_ID_EX_REGRD = io_ID_EX_rd_sel; // @[Decode.scala 94:36]
  assign decodeForwardUnit_io_ID_EX_MEMRD = io_ID_EX_ctrl_MemRd; // @[Decode.scala 95:36]
  assign decodeForwardUnit_io_EX_MEM_REGRD = io_EX_MEM_rd_sel; // @[Decode.scala 96:37]
  assign decodeForwardUnit_io_EX_MEM_MEMRD = io_EX_MEM_ctrl_MemRd; // @[Decode.scala 98:37]
  assign decodeForwardUnit_io_MEM_WB_REGRD = io_MEM_WB_rd_sel; // @[Decode.scala 97:37]
  assign decodeForwardUnit_io_MEM_WB_MEMRD = io_MEM_WB_ctrl_MemRd; // @[Decode.scala 99:37]
  assign decodeForwardUnit_io_execute_regwrite = io_execute_regwrite; // @[Decode.scala 104:41]
  assign decodeForwardUnit_io_mem_regwrite = io_mem_regwrite; // @[Decode.scala 105:37]
  assign decodeForwardUnit_io_wb_regwrite = io_wb_regwrite; // @[Decode.scala 106:36]
  assign decodeForwardUnit_io_rs1_sel = io_IF_ID_inst[19:15]; // @[Decode.scala 100:32]
  assign decodeForwardUnit_io_rs2_sel = io_IF_ID_inst[24:20]; // @[Decode.scala 101:32]
  assign decodeForwardUnit_io_ctrl_branch = control_io_out_branch; // @[Decode.scala 102:36]
  assign branchLogic_io_in_rs1 = _T_5 ? $signed(reg_file_io_rs1) : $signed(_GEN_18); // @[Decode.scala 117:27 Decode.scala 121:27 Decode.scala 125:27 Decode.scala 129:27 Decode.scala 133:27 Decode.scala 137:27 Decode.scala 148:29 Decode.scala 152:27 Decode.scala 156:27 Decode.scala 160:27 Decode.scala 164:27 Decode.scala 167:29]
  assign branchLogic_io_in_rs2 = _T_16 ? $signed(reg_file_io_rs2) : $signed(_GEN_26); // @[Decode.scala 175:27 Decode.scala 178:27 Decode.scala 181:27 Decode.scala 184:27 Decode.scala 187:27 Decode.scala 190:27 Decode.scala 193:29]
  assign branchLogic_io_in_func3 = io_IF_ID_inst[14:12]; // @[Decode.scala 108:27]
  assign reg_file_clock = clock;
  assign reg_file_reset = reset;
  assign reg_file_io_regWrite = io_MEM_WB_ctrl_regWr; // @[Decode.scala 215:24]
  assign reg_file_io_rd_sel = io_MEM_WB_rd_sel; // @[Decode.scala 217:22]
  assign reg_file_io_rs1_sel = io_IF_ID_inst[19:15]; // @[Decode.scala 213:23]
  assign reg_file_io_rs2_sel = io_IF_ID_inst[24:20]; // @[Decode.scala 214:23]
  assign reg_file_io_writeData = io_writeback_write_data; // @[Decode.scala 218:25]
  assign imm_generation_io_instruction = io_IF_ID_inst; // @[Decode.scala 222:33]
  assign imm_generation_io_pc = io_IF_ID_pc; // @[Decode.scala 223:24]
  assign structuralDetector_io_rs1_sel = io_IF_ID_inst[19:15]; // @[Decode.scala 231:33]
  assign structuralDetector_io_rs2_sel = io_IF_ID_inst[24:20]; // @[Decode.scala 232:33]
  assign structuralDetector_io_MEM_WB_regWr = io_MEM_WB_ctrl_regWr; // @[Decode.scala 234:38]
  assign structuralDetector_io_MEM_WB_REGRD = io_MEM_WB_rd_sel; // @[Decode.scala 233:38]
  assign jalr_io_input_a = _T_5 ? $signed(reg_file_io_rs1) : $signed(_GEN_19); // @[Decode.scala 118:21 Decode.scala 122:21 Decode.scala 126:21 Decode.scala 130:21 Decode.scala 134:21 Decode.scala 138:21 Decode.scala 147:23 Decode.scala 151:21 Decode.scala 155:21 Decode.scala 159:21 Decode.scala 163:21 Decode.scala 168:23]
  assign jalr_io_input_b = imm_generation_io_i_imm; // @[Decode.scala 196:19]
endmodule
module ForwardUnit(
  input  [4:0] io_EX_MEM_REGRD,
  input  [4:0] io_MEM_WB_REGRD,
  input  [4:0] io_ID_EX_REGRS1,
  input  [4:0] io_ID_EX_REGRS2,
  input        io_EX_MEM_REGWR,
  input        io_MEM_WB_REGWR,
  output [1:0] io_forward_a,
  output [1:0] io_forward_b
);
  wire  _T_1 = io_EX_MEM_REGRD != 5'h0; // @[ForwardUnit.scala 21:56]
  wire  _T_2 = io_EX_MEM_REGWR & _T_1; // @[ForwardUnit.scala 21:37]
  wire  _T_3 = io_EX_MEM_REGRD == io_ID_EX_REGRS1; // @[ForwardUnit.scala 21:91]
  wire  _T_4 = _T_2 & _T_3; // @[ForwardUnit.scala 21:71]
  wire  _T_5 = io_EX_MEM_REGRD == io_ID_EX_REGRS2; // @[ForwardUnit.scala 21:132]
  wire  _T_6 = _T_4 & _T_5; // @[ForwardUnit.scala 21:112]
  wire  _T_11 = _T_2 & _T_5; // @[ForwardUnit.scala 29:78]
  wire  _GEN_2 = _T_11 ? 1'h0 : _T_4; // @[ForwardUnit.scala 29:120]
  wire  _GEN_3 = _T_6 | _GEN_2; // @[ForwardUnit.scala 21:154]
  wire  _GEN_4 = _T_6 | _T_11; // @[ForwardUnit.scala 21:154]
  wire  _T_18 = io_MEM_WB_REGRD != 5'h0; // @[ForwardUnit.scala 40:56]
  wire  _T_19 = io_MEM_WB_REGWR & _T_18; // @[ForwardUnit.scala 40:37]
  wire  _T_27 = ~_T_6; // @[ForwardUnit.scala 40:74]
  wire  _T_28 = _T_19 & _T_27; // @[ForwardUnit.scala 40:71]
  wire  _T_29 = io_MEM_WB_REGRD == io_ID_EX_REGRS1; // @[ForwardUnit.scala 40:244]
  wire  _T_30 = _T_28 & _T_29; // @[ForwardUnit.scala 40:224]
  wire  _T_31 = io_MEM_WB_REGRD == io_ID_EX_REGRS2; // @[ForwardUnit.scala 40:285]
  wire  _T_32 = _T_30 & _T_31; // @[ForwardUnit.scala 40:265]
  wire  _T_41 = ~_T_11; // @[ForwardUnit.scala 43:81]
  wire  _T_42 = _T_19 & _T_41; // @[ForwardUnit.scala 43:78]
  wire  _T_44 = _T_42 & _T_31; // @[ForwardUnit.scala 43:190]
  wire  _T_53 = ~_T_4; // @[ForwardUnit.scala 46:81]
  wire  _T_54 = _T_19 & _T_53; // @[ForwardUnit.scala 46:78]
  wire  _T_56 = _T_54 & _T_29; // @[ForwardUnit.scala 46:191]
  wire [1:0] _GEN_5 = _T_56 ? 2'h2 : {{1'd0}, _GEN_3}; // @[ForwardUnit.scala 46:233]
  wire [1:0] _GEN_6 = _T_44 ? 2'h2 : {{1'd0}, _GEN_4}; // @[ForwardUnit.scala 43:232]
  wire [1:0] _GEN_7 = _T_44 ? {{1'd0}, _GEN_3} : _GEN_5; // @[ForwardUnit.scala 43:232]
  assign io_forward_a = _T_32 ? 2'h2 : _GEN_7; // @[ForwardUnit.scala 16:18 ForwardUnit.scala 27:22 ForwardUnit.scala 33:22 ForwardUnit.scala 41:22 ForwardUnit.scala 47:22]
  assign io_forward_b = _T_32 ? 2'h2 : _GEN_6; // @[ForwardUnit.scala 17:18 ForwardUnit.scala 28:22 ForwardUnit.scala 30:22 ForwardUnit.scala 42:22 ForwardUnit.scala 44:22]
endmodule
module Alu(
  input  [31:0] io_oper_a,
  input  [31:0] io_oper_b,
  input  [4:0]  io_aluCtrl,
  output [31:0] io_output
);
  wire  _T = io_aluCtrl == 5'h0; // @[Alu.scala 17:21]
  wire [31:0] _T_3 = $signed(io_oper_a) + $signed(io_oper_b); // @[Alu.scala 19:32]
  wire  _T_4 = io_aluCtrl == 5'h1; // @[Alu.scala 20:28]
  wire [62:0] _GEN_31 = {{31{io_oper_a[31]}},io_oper_a}; // @[Alu.scala 23:32]
  wire [62:0] _T_6 = $signed(_GEN_31) << io_oper_b[4:0]; // @[Alu.scala 23:32]
  wire  _T_7 = io_aluCtrl == 5'h2; // @[Alu.scala 24:28]
  wire  _T_8 = $signed(io_oper_a) < $signed(io_oper_b); // @[Alu.scala 26:24]
  wire [1:0] _GEN_0 = _T_8 ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 26:37]
  wire  _T_9 = io_aluCtrl == 5'h3; // @[Alu.scala 31:28]
  wire  _T_10 = io_aluCtrl == 5'h16; // @[Alu.scala 31:57]
  wire  _T_11 = _T_9 | _T_10; // @[Alu.scala 31:43]
  wire  _T_14 = io_oper_a < io_oper_b; // @[Alu.scala 33:31]
  wire [1:0] _GEN_1 = _T_14 ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 33:51]
  wire  _T_15 = io_aluCtrl == 5'h4; // @[Alu.scala 38:28]
  wire [31:0] _T_17 = $signed(io_oper_a) ^ $signed(io_oper_b); // @[Alu.scala 40:32]
  wire  _T_18 = io_aluCtrl == 5'h5; // @[Alu.scala 41:28]
  wire  _T_19 = io_aluCtrl == 5'hd; // @[Alu.scala 41:57]
  wire  _T_20 = _T_18 | _T_19; // @[Alu.scala 41:43]
  wire [31:0] _T_22 = $signed(io_oper_a) >>> io_oper_b[4:0]; // @[Alu.scala 49:32]
  wire  _T_23 = io_aluCtrl == 5'h6; // @[Alu.scala 50:28]
  wire [31:0] _T_25 = $signed(io_oper_a) | $signed(io_oper_b); // @[Alu.scala 52:32]
  wire  _T_26 = io_aluCtrl == 5'h7; // @[Alu.scala 53:28]
  wire [31:0] _T_28 = $signed(io_oper_a) & $signed(io_oper_b); // @[Alu.scala 55:32]
  wire  _T_29 = io_aluCtrl == 5'h8; // @[Alu.scala 56:28]
  wire [31:0] _T_32 = $signed(io_oper_a) - $signed(io_oper_b); // @[Alu.scala 58:32]
  wire  _T_33 = io_aluCtrl == 5'h10; // @[Alu.scala 60:28]
  wire  _T_34 = $signed(io_oper_a) == $signed(io_oper_b); // @[Alu.scala 62:24]
  wire [1:0] _GEN_2 = _T_34 ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 62:39]
  wire  _T_35 = io_aluCtrl == 5'h11; // @[Alu.scala 67:28]
  wire  _T_37 = ~_T_34; // @[Alu.scala 69:14]
  wire [1:0] _GEN_3 = _T_37 ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 69:42]
  wire  _T_38 = io_aluCtrl == 5'h14; // @[Alu.scala 74:28]
  wire  _T_40 = io_aluCtrl == 5'h15; // @[Alu.scala 81:28]
  wire  _T_41 = $signed(io_oper_a) >= $signed(io_oper_b); // @[Alu.scala 83:24]
  wire [1:0] _GEN_5 = _T_41 ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 83:38]
  wire  _T_42 = io_aluCtrl == 5'h17; // @[Alu.scala 88:28]
  wire  _T_45 = io_oper_a >= io_oper_b; // @[Alu.scala 90:31]
  wire [1:0] _GEN_6 = _T_45 ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 90:52]
  wire  _T_46 = io_aluCtrl == 5'h1f; // @[Alu.scala 95:28]
  wire  _T_47 = io_aluCtrl == 5'hb; // @[Alu.scala 99:26]
  wire  _T_48 = io_aluCtrl == 5'h1e; // @[Alu.scala 104:26]
  wire [63:0] _T_49 = $signed(io_oper_a) * $signed(io_oper_b); // @[Alu.scala 106:32]
  wire  _T_50 = io_aluCtrl == 5'h1d; // @[Alu.scala 108:26]
  wire [32:0] _T_51 = $signed(io_oper_a) / $signed(io_oper_b); // @[Alu.scala 110:32]
  wire  _T_52 = io_aluCtrl == 5'h1b; // @[Alu.scala 112:26]
  wire [31:0] _T_56 = io_oper_a / io_oper_b; // @[Alu.scala 114:64]
  wire  _T_57 = io_aluCtrl == 5'h1a; // @[Alu.scala 116:26]
  wire [31:0] _GEN_4 = $signed(io_oper_a) % $signed(io_oper_b); // @[Alu.scala 118:32]
  wire [31:0] _T_58 = _GEN_4[31:0]; // @[Alu.scala 118:32]
  wire  _T_59 = io_aluCtrl == 5'h19; // @[Alu.scala 120:26]
  wire [31:0] _T_63 = io_oper_a % io_oper_b; // @[Alu.scala 122:64]
  wire  _T_64 = io_aluCtrl == 5'h18; // @[Alu.scala 124:26]
  wire [31:0] _T_67 = _T_49[63:32]; // @[Alu.scala 127:51]
  wire  _T_68 = io_aluCtrl == 5'h13; // @[Alu.scala 129:26]
  wire [32:0] _T_70 = {1'b0,$signed(io_oper_b)}; // @[Alu.scala 131:49]
  wire [32:0] _GEN_32 = {{1{io_oper_a[31]}},io_oper_a}; // @[Alu.scala 131:49]
  wire [64:0] _T_71 = $signed(_GEN_32) * $signed(_T_70); // @[Alu.scala 131:49]
  wire [63:0] _T_73 = _T_71[63:0]; // @[Alu.scala 131:49]
  wire [31:0] _T_75 = _T_73[63:32]; // @[Alu.scala 132:53]
  wire [63:0] _T_79 = io_oper_a * io_oper_b; // @[Alu.scala 136:55]
  wire [31:0] _T_81 = _T_79[63:32]; // @[Alu.scala 137:52]
  wire [31:0] _GEN_8 = _T_68 ? $signed(_T_75) : $signed(_T_81); // @[Alu.scala 130:5]
  wire [31:0] _GEN_9 = _T_64 ? $signed(_T_67) : $signed(_GEN_8); // @[Alu.scala 125:5]
  wire [31:0] _GEN_10 = _T_59 ? $signed(_T_63) : $signed(_GEN_9); // @[Alu.scala 121:5]
  wire [31:0] _GEN_11 = _T_57 ? $signed(_T_58) : $signed(_GEN_10); // @[Alu.scala 117:5]
  wire [31:0] _GEN_12 = _T_52 ? $signed(_T_56) : $signed(_GEN_11); // @[Alu.scala 113:5]
  wire [32:0] _GEN_13 = _T_50 ? $signed(_T_51) : $signed({{1{_GEN_12[31]}},_GEN_12}); // @[Alu.scala 109:5]
  wire [63:0] _GEN_14 = _T_48 ? $signed(_T_49) : $signed({{31{_GEN_13[32]}},_GEN_13}); // @[Alu.scala 105:5]
  wire [63:0] _GEN_15 = _T_47 ? $signed({{32{io_oper_b[31]}},io_oper_b}) : $signed(_GEN_14); // @[Alu.scala 100:5]
  wire [63:0] _GEN_16 = _T_46 ? $signed({{32{io_oper_a[31]}},io_oper_a}) : $signed(_GEN_15); // @[Alu.scala 95:44]
  wire [63:0] _GEN_17 = _T_42 ? $signed({{62{_GEN_6[1]}},_GEN_6}) : $signed(_GEN_16); // @[Alu.scala 88:44]
  wire [63:0] _GEN_18 = _T_40 ? $signed({{62{_GEN_5[1]}},_GEN_5}) : $signed(_GEN_17); // @[Alu.scala 81:44]
  wire [63:0] _GEN_19 = _T_38 ? $signed({{62{_GEN_0[1]}},_GEN_0}) : $signed(_GEN_18); // @[Alu.scala 74:44]
  wire [63:0] _GEN_20 = _T_35 ? $signed({{62{_GEN_3[1]}},_GEN_3}) : $signed(_GEN_19); // @[Alu.scala 67:44]
  wire [63:0] _GEN_21 = _T_33 ? $signed({{62{_GEN_2[1]}},_GEN_2}) : $signed(_GEN_20); // @[Alu.scala 60:44]
  wire [63:0] _GEN_22 = _T_29 ? $signed({{32{_T_32[31]}},_T_32}) : $signed(_GEN_21); // @[Alu.scala 56:44]
  wire [63:0] _GEN_23 = _T_26 ? $signed({{32{_T_28[31]}},_T_28}) : $signed(_GEN_22); // @[Alu.scala 53:44]
  wire [63:0] _GEN_24 = _T_23 ? $signed({{32{_T_25[31]}},_T_25}) : $signed(_GEN_23); // @[Alu.scala 50:44]
  wire [63:0] _GEN_25 = _T_20 ? $signed({{32{_T_22[31]}},_T_22}) : $signed(_GEN_24); // @[Alu.scala 41:73]
  wire [63:0] _GEN_26 = _T_15 ? $signed({{32{_T_17[31]}},_T_17}) : $signed(_GEN_25); // @[Alu.scala 38:44]
  wire [63:0] _GEN_27 = _T_11 ? $signed({{62{_GEN_1[1]}},_GEN_1}) : $signed(_GEN_26); // @[Alu.scala 31:73]
  wire [63:0] _GEN_28 = _T_7 ? $signed({{62{_GEN_0[1]}},_GEN_0}) : $signed(_GEN_27); // @[Alu.scala 24:44]
  wire [63:0] _GEN_29 = _T_4 ? $signed({{1{_T_6[62]}},_T_6}) : $signed(_GEN_28); // @[Alu.scala 20:44]
  wire [63:0] _GEN_30 = _T ? $signed({{32{_T_3[31]}},_T_3}) : $signed(_GEN_29); // @[Alu.scala 17:37]
  assign io_output = _GEN_30[31:0]; // @[Alu.scala 19:19 Alu.scala 23:19 Alu.scala 27:23 Alu.scala 29:23 Alu.scala 34:23 Alu.scala 36:23 Alu.scala 40:19 Alu.scala 49:19 Alu.scala 52:19 Alu.scala 55:19 Alu.scala 58:19 Alu.scala 63:23 Alu.scala 65:23 Alu.scala 70:23 Alu.scala 72:23 Alu.scala 77:23 Alu.scala 79:23 Alu.scala 84:23 Alu.scala 86:23 Alu.scala 91:23 Alu.scala 93:23 Alu.scala 97:19 Alu.scala 101:19 Alu.scala 106:19 Alu.scala 110:19 Alu.scala 114:19 Alu.scala 118:19 Alu.scala 122:19 Alu.scala 127:19 Alu.scala 132:19 Alu.scala 137:19]
endmodule
module AluControl(
  input  [3:0] io_aluOp,
  input  [6:0] io_func7,
  input  [2:0] io_func3,
  output [4:0] io_output
);
  wire  _T = io_func3 == 3'h0; // @[ALU_operations_Sel.scala 37:35]
  wire  _T_1 = io_aluOp == 4'h0; // @[ALU_operations_Sel.scala 37:57]
  wire  _T_2 = _T & _T_1; // @[ALU_operations_Sel.scala 37:49]
  wire  _T_3 = io_func7 == 7'h0; // @[ALU_operations_Sel.scala 37:80]
  wire  _T_4 = _T_2 & _T_3; // @[ALU_operations_Sel.scala 37:71]
  wire  _T_6 = io_aluOp == 4'h1; // @[ALU_operations_Sel.scala 12:57]
  wire  _T_7 = _T & _T_6; // @[ALU_operations_Sel.scala 12:49]
  wire  _T_8 = _T_4 | _T_7; // @[AluControl.scala 19:20]
  wire  _T_9 = io_func3 == 3'h2; // @[ALU_operations_Sel.scala 33:35]
  wire  _T_10 = io_aluOp == 4'h5; // @[ALU_operations_Sel.scala 33:57]
  wire  _T_11 = _T_9 & _T_10; // @[ALU_operations_Sel.scala 33:49]
  wire  _T_12 = _T_8 | _T_11; // @[AluControl.scala 19:34]
  wire  _T_15 = _T & _T_10; // @[ALU_operations_Sel.scala 31:49]
  wire  _T_16 = _T_12 | _T_15; // @[AluControl.scala 19:46]
  wire  _T_17 = io_func3 == 3'h1; // @[ALU_operations_Sel.scala 32:35]
  wire  _T_19 = _T_17 & _T_10; // @[ALU_operations_Sel.scala 32:49]
  wire  _T_20 = _T_16 | _T_19; // @[AluControl.scala 19:58]
  wire  _T_22 = io_aluOp == 4'h4; // @[ALU_operations_Sel.scala 27:57]
  wire  _T_23 = _T_9 & _T_22; // @[ALU_operations_Sel.scala 27:49]
  wire  _T_24 = _T_20 | _T_23; // @[AluControl.scala 19:70]
  wire  _T_27 = _T & _T_22; // @[ALU_operations_Sel.scala 25:49]
  wire  _T_28 = _T_24 | _T_27; // @[AluControl.scala 19:82]
  wire  _T_31 = _T_17 & _T_22; // @[ALU_operations_Sel.scala 26:49]
  wire  _T_32 = _T_28 | _T_31; // @[AluControl.scala 19:94]
  wire  _T_33 = io_func3 == 3'h4; // @[ALU_operations_Sel.scala 28:35]
  wire  _T_35 = _T_33 & _T_22; // @[ALU_operations_Sel.scala 28:49]
  wire  _T_36 = _T_32 | _T_35; // @[AluControl.scala 19:106]
  wire  _T_37 = io_func3 == 3'h5; // @[ALU_operations_Sel.scala 29:35]
  wire  _T_39 = _T_37 & _T_22; // @[ALU_operations_Sel.scala 29:49]
  wire  _T_40 = _T_36 | _T_39; // @[AluControl.scala 19:119]
  wire  _T_41 = io_func3 == 3'h6; // @[ALU_operations_Sel.scala 30:35]
  wire  _T_43 = _T_41 & _T_22; // @[ALU_operations_Sel.scala 30:49]
  wire  _T_44 = _T_40 | _T_43; // @[AluControl.scala 19:132]
  wire  _T_45 = io_aluOp == 4'h6; // @[ALU_operations_Sel.scala 10:35]
  wire  _T_46 = _T_44 | _T_45; // @[AluControl.scala 19:145]
  wire  _T_47 = io_aluOp == 4'h7; // @[ALU_operations_Sel.scala 11:35]
  wire  _T_48 = _T_46 | _T_47; // @[AluControl.scala 19:158]
  wire  _T_51 = _T_17 & _T_1; // @[ALU_operations_Sel.scala 39:49]
  wire  _T_53 = _T_51 & _T_3; // @[ALU_operations_Sel.scala 39:71]
  wire  _T_56 = _T_17 & _T_6; // @[ALU_operations_Sel.scala 34:49]
  wire  _T_58 = _T_56 & _T_3; // @[ALU_operations_Sel.scala 34:71]
  wire  _T_59 = _T_53 | _T_58; // @[AluControl.scala 21:25]
  wire  _T_62 = _T_9 & _T_1; // @[ALU_operations_Sel.scala 40:49]
  wire  _T_64 = _T_62 & _T_3; // @[ALU_operations_Sel.scala 40:71]
  wire  _T_67 = _T_9 & _T_6; // @[ALU_operations_Sel.scala 13:49]
  wire  _T_68 = _T_64 | _T_67; // @[AluControl.scala 22:25]
  wire  _T_69 = io_func3 == 3'h3; // @[ALU_operations_Sel.scala 41:35]
  wire  _T_71 = _T_69 & _T_1; // @[ALU_operations_Sel.scala 41:49]
  wire  _T_73 = _T_71 & _T_3; // @[ALU_operations_Sel.scala 41:71]
  wire  _T_76 = _T_69 & _T_6; // @[ALU_operations_Sel.scala 14:49]
  wire  _T_77 = _T_73 | _T_76; // @[AluControl.scala 23:25]
  wire  _T_79 = io_aluOp == 4'h2; // @[ALU_operations_Sel.scala 22:57]
  wire  _T_80 = _T_41 & _T_79; // @[ALU_operations_Sel.scala 22:49]
  wire  _T_81 = _T_77 | _T_80; // @[AluControl.scala 23:40]
  wire  _T_84 = _T_33 & _T_1; // @[ALU_operations_Sel.scala 42:49]
  wire  _T_86 = _T_84 & _T_3; // @[ALU_operations_Sel.scala 42:71]
  wire  _T_89 = _T_33 & _T_6; // @[ALU_operations_Sel.scala 15:49]
  wire  _T_90 = _T_86 | _T_89; // @[AluControl.scala 24:25]
  wire  _T_93 = _T_37 & _T_1; // @[ALU_operations_Sel.scala 43:49]
  wire  _T_95 = _T_93 & _T_3; // @[ALU_operations_Sel.scala 43:71]
  wire  _T_98 = _T_37 & _T_6; // @[ALU_operations_Sel.scala 35:49]
  wire  _T_100 = _T_98 & _T_3; // @[ALU_operations_Sel.scala 35:71]
  wire  _T_101 = _T_95 | _T_100; // @[AluControl.scala 25:25]
  wire  _T_105 = io_func7 == 7'h20; // @[ALU_operations_Sel.scala 44:80]
  wire  _T_106 = _T_93 & _T_105; // @[ALU_operations_Sel.scala 44:71]
  wire  _T_107 = _T_101 | _T_106; // @[AluControl.scala 25:39]
  wire  _T_112 = _T_98 & _T_105; // @[ALU_operations_Sel.scala 36:71]
  wire  _T_113 = _T_107 | _T_112; // @[AluControl.scala 25:52]
  wire  _T_116 = _T_41 & _T_1; // @[ALU_operations_Sel.scala 45:49]
  wire  _T_118 = _T_116 & _T_3; // @[ALU_operations_Sel.scala 45:71]
  wire  _T_121 = _T_41 & _T_6; // @[ALU_operations_Sel.scala 16:49]
  wire  _T_122 = _T_118 | _T_121; // @[AluControl.scala 26:25]
  wire  _T_123 = io_func3 == 3'h7; // @[ALU_operations_Sel.scala 46:35]
  wire  _T_125 = _T_123 & _T_1; // @[ALU_operations_Sel.scala 46:49]
  wire  _T_127 = _T_125 & _T_3; // @[ALU_operations_Sel.scala 46:71]
  wire  _T_130 = _T_123 & _T_6; // @[ALU_operations_Sel.scala 17:49]
  wire  _T_131 = _T_127 | _T_130; // @[AluControl.scala 27:25]
  wire  _T_136 = _T_2 & _T_105; // @[ALU_operations_Sel.scala 38:71]
  wire  _T_139 = _T & _T_79; // @[ALU_operations_Sel.scala 18:49]
  wire  _T_142 = _T_17 & _T_79; // @[ALU_operations_Sel.scala 19:49]
  wire  _T_145 = _T_33 & _T_79; // @[ALU_operations_Sel.scala 20:49]
  wire  _T_148 = _T_37 & _T_79; // @[ALU_operations_Sel.scala 21:49]
  wire  _T_151 = _T_123 & _T_79; // @[ALU_operations_Sel.scala 23:49]
  wire  _T_152 = io_aluOp == 4'h3; // @[ALU_operations_Sel.scala 9:35]
  wire  _T_155 = _T & _T_152; // @[ALU_operations_Sel.scala 24:49]
  wire  _T_156 = _T_152 | _T_155; // @[AluControl.scala 34:25]
  wire  _T_158 = io_aluOp == 4'h9; // @[ALU_operations_Sel.scala 47:57]
  wire  _T_159 = _T & _T_158; // @[ALU_operations_Sel.scala 47:49]
  wire  _T_160 = io_func7 == 7'h1; // @[ALU_operations_Sel.scala 47:80]
  wire  _T_161 = _T_159 & _T_160; // @[ALU_operations_Sel.scala 47:71]
  wire  _T_164 = _T_33 & _T_158; // @[ALU_operations_Sel.scala 51:49]
  wire  _T_166 = _T_164 & _T_160; // @[ALU_operations_Sel.scala 51:71]
  wire  _T_169 = _T_37 & _T_158; // @[ALU_operations_Sel.scala 52:49]
  wire  _T_171 = _T_169 & _T_160; // @[ALU_operations_Sel.scala 52:71]
  wire  _T_174 = _T_41 & _T_158; // @[ALU_operations_Sel.scala 53:49]
  wire  _T_176 = _T_174 & _T_160; // @[ALU_operations_Sel.scala 53:71]
  wire  _T_179 = _T_123 & _T_158; // @[ALU_operations_Sel.scala 54:49]
  wire  _T_181 = _T_179 & _T_160; // @[ALU_operations_Sel.scala 54:71]
  wire  _T_184 = _T_17 & _T_158; // @[ALU_operations_Sel.scala 48:49]
  wire  _T_186 = _T_184 & _T_160; // @[ALU_operations_Sel.scala 48:71]
  wire  _T_189 = _T_9 & _T_158; // @[ALU_operations_Sel.scala 49:49]
  wire  _T_191 = _T_189 & _T_160; // @[ALU_operations_Sel.scala 49:71]
  wire [4:0] _GEN_1 = _T_191 ? 5'h13 : 5'h12; // @[AluControl.scala 41:29]
  wire [4:0] _GEN_2 = _T_186 ? 5'h18 : _GEN_1; // @[AluControl.scala 40:26]
  wire [4:0] _GEN_3 = _T_181 ? 5'h19 : _GEN_2; // @[AluControl.scala 39:26]
  wire [4:0] _GEN_4 = _T_176 ? 5'h1a : _GEN_3; // @[AluControl.scala 38:26]
  wire [4:0] _GEN_5 = _T_171 ? 5'h1b : _GEN_4; // @[AluControl.scala 37:26]
  wire [4:0] _GEN_6 = _T_166 ? 5'h1d : _GEN_5; // @[AluControl.scala 36:26]
  wire [4:0] _GEN_7 = _T_161 ? 5'h1e : _GEN_6; // @[AluControl.scala 35:26]
  wire [4:0] _GEN_8 = _T_156 ? 5'h1f : _GEN_7; // @[AluControl.scala 34:40]
  wire [4:0] _GEN_9 = _T_151 ? 5'h17 : _GEN_8; // @[AluControl.scala 33:26]
  wire [4:0] _GEN_10 = _T_148 ? 5'h15 : _GEN_9; // @[AluControl.scala 32:26]
  wire [4:0] _GEN_11 = _T_145 ? 5'h14 : _GEN_10; // @[AluControl.scala 31:26]
  wire [4:0] _GEN_12 = _T_142 ? 5'h11 : _GEN_11; // @[AluControl.scala 30:26]
  wire [4:0] _GEN_13 = _T_139 ? 5'h10 : _GEN_12; // @[AluControl.scala 29:26]
  wire [4:0] _GEN_14 = _T_136 ? 5'h8 : _GEN_13; // @[AluControl.scala 28:26]
  wire [4:0] _GEN_15 = _T_131 ? 5'h7 : _GEN_14; // @[AluControl.scala 27:40]
  wire [4:0] _GEN_16 = _T_122 ? 5'h6 : _GEN_15; // @[AluControl.scala 26:40]
  wire [4:0] _GEN_17 = _T_113 ? 5'h5 : _GEN_16; // @[AluControl.scala 25:67]
  wire [4:0] _GEN_18 = _T_90 ? 5'h4 : _GEN_17; // @[AluControl.scala 24:40]
  wire [4:0] _GEN_19 = _T_81 ? 5'h3 : _GEN_18; // @[AluControl.scala 23:55]
  wire [4:0] _GEN_20 = _T_68 ? 5'h2 : _GEN_19; // @[AluControl.scala 22:40]
  wire [4:0] _GEN_21 = _T_59 ? 5'h1 : _GEN_20; // @[AluControl.scala 21:40]
  assign io_output = _T_48 ? 5'h0 : _GEN_21; // @[AluControl.scala 20:17 AluControl.scala 21:52 AluControl.scala 22:52 AluControl.scala 23:67 AluControl.scala 24:52 AluControl.scala 25:79 AluControl.scala 26:52 AluControl.scala 27:52 AluControl.scala 28:38 AluControl.scala 29:38 AluControl.scala 30:38 AluControl.scala 31:38 AluControl.scala 32:38 AluControl.scala 33:38 AluControl.scala 34:52 AluControl.scala 35:38 AluControl.scala 36:38 AluControl.scala 37:38 AluControl.scala 38:38 AluControl.scala 39:38 AluControl.scala 40:38 AluControl.scala 41:41 AluControl.scala 42:40]
endmodule
module Execute(
  input  [4:0]  io_EX_MEM_rd_sel,
  input  [4:0]  io_MEM_WB_rd_sel,
  input  [4:0]  io_ID_EX_rs1_sel,
  input  [4:0]  io_ID_EX_rs2_sel,
  input         io_EX_MEM_ctrl_RegWr,
  input         io_MEM_WB_ctrl_RegWr,
  input  [1:0]  io_ID_EX_ctrl_OpA_sel,
  input         io_ID_EX_ctrl_OpB_sel,
  input  [31:0] io_ID_EX_pc4,
  input  [31:0] io_ID_EX_pc_out,
  input  [31:0] io_ID_EX_rs1,
  input  [31:0] io_ID_EX_rs2,
  input  [31:0] io_EX_MEM_alu_output,
  input  [31:0] io_writeback_write_data,
  input  [31:0] io_ID_EX_imm,
  input  [3:0]  io_ID_EX_ctrl_AluOp,
  input  [6:0]  io_ID_EX_func7,
  input  [2:0]  io_ID_EX_func3,
  input  [4:0]  io_ID_EX_rd_sel,
  input         io_ID_EX_ctrl_MemWr,
  input         io_ID_EX_ctrl_MemRd,
  input         io_ID_EX_ctrl_RegWr,
  input         io_ID_EX_ctrl_MemToReg,
  output [31:0] io_rs2_out,
  output [31:0] io_alu_output,
  output [4:0]  io_rd_sel_out,
  output        io_ctrl_MemWr_out,
  output        io_ctrl_MemRd_out,
  output        io_ctrl_RegWr_out,
  output        io_ctrl_MemToReg_out,
  output [2:0]  io_func3_out
);
  wire [4:0] forwardUnit_io_EX_MEM_REGRD; // @[Execute.scala 45:27]
  wire [4:0] forwardUnit_io_MEM_WB_REGRD; // @[Execute.scala 45:27]
  wire [4:0] forwardUnit_io_ID_EX_REGRS1; // @[Execute.scala 45:27]
  wire [4:0] forwardUnit_io_ID_EX_REGRS2; // @[Execute.scala 45:27]
  wire  forwardUnit_io_EX_MEM_REGWR; // @[Execute.scala 45:27]
  wire  forwardUnit_io_MEM_WB_REGWR; // @[Execute.scala 45:27]
  wire [1:0] forwardUnit_io_forward_a; // @[Execute.scala 45:27]
  wire [1:0] forwardUnit_io_forward_b; // @[Execute.scala 45:27]
  wire [31:0] alu_io_oper_a; // @[Execute.scala 46:19]
  wire [31:0] alu_io_oper_b; // @[Execute.scala 46:19]
  wire [4:0] alu_io_aluCtrl; // @[Execute.scala 46:19]
  wire [31:0] alu_io_output; // @[Execute.scala 46:19]
  wire [3:0] alu_control_io_aluOp; // @[Execute.scala 47:27]
  wire [6:0] alu_control_io_func7; // @[Execute.scala 47:27]
  wire [2:0] alu_control_io_func3; // @[Execute.scala 47:27]
  wire [4:0] alu_control_io_output; // @[Execute.scala 47:27]
  wire  _T = io_ID_EX_ctrl_OpA_sel == 2'h2; // @[Execute.scala 58:31]
  wire  _T_1 = io_ID_EX_ctrl_OpA_sel == 2'h1; // @[Execute.scala 61:35]
  wire  _T_2 = forwardUnit_io_forward_a == 2'h0; // @[Execute.scala 66:35]
  wire  _T_3 = forwardUnit_io_forward_a == 2'h1; // @[Execute.scala 68:42]
  wire  _T_4 = forwardUnit_io_forward_a == 2'h2; // @[Execute.scala 70:42]
  wire [31:0] _GEN_0 = _T_4 ? $signed(io_writeback_write_data) : $signed(io_ID_EX_rs1); // @[Execute.scala 70:55]
  wire [31:0] _GEN_1 = _T_3 ? $signed(io_EX_MEM_alu_output) : $signed(_GEN_0); // @[Execute.scala 68:55]
  wire [31:0] _GEN_2 = _T_2 ? $signed(io_ID_EX_rs1) : $signed(_GEN_1); // @[Execute.scala 66:48]
  wire [31:0] _GEN_3 = _T_1 ? $signed(io_ID_EX_pc_out) : $signed(_GEN_2); // @[Execute.scala 62:4]
  wire  _T_6 = forwardUnit_io_forward_b == 2'h0; // @[Execute.scala 80:35]
  wire  _T_7 = forwardUnit_io_forward_b == 2'h1; // @[Execute.scala 82:42]
  wire  _T_8 = forwardUnit_io_forward_b == 2'h2; // @[Execute.scala 84:42]
  wire [31:0] _GEN_5 = _T_8 ? $signed(io_writeback_write_data) : $signed(io_ID_EX_rs2); // @[Execute.scala 84:55]
  wire [31:0] _GEN_6 = _T_7 ? $signed(io_EX_MEM_alu_output) : $signed(_GEN_5); // @[Execute.scala 82:55]
  wire [31:0] _GEN_7 = _T_6 ? $signed(io_ID_EX_rs2) : $signed(_GEN_6); // @[Execute.scala 80:48]
  ForwardUnit forwardUnit ( // @[Execute.scala 45:27]
    .io_EX_MEM_REGRD(forwardUnit_io_EX_MEM_REGRD),
    .io_MEM_WB_REGRD(forwardUnit_io_MEM_WB_REGRD),
    .io_ID_EX_REGRS1(forwardUnit_io_ID_EX_REGRS1),
    .io_ID_EX_REGRS2(forwardUnit_io_ID_EX_REGRS2),
    .io_EX_MEM_REGWR(forwardUnit_io_EX_MEM_REGWR),
    .io_MEM_WB_REGWR(forwardUnit_io_MEM_WB_REGWR),
    .io_forward_a(forwardUnit_io_forward_a),
    .io_forward_b(forwardUnit_io_forward_b)
  );
  Alu alu ( // @[Execute.scala 46:19]
    .io_oper_a(alu_io_oper_a),
    .io_oper_b(alu_io_oper_b),
    .io_aluCtrl(alu_io_aluCtrl),
    .io_output(alu_io_output)
  );
  AluControl alu_control ( // @[Execute.scala 47:27]
    .io_aluOp(alu_control_io_aluOp),
    .io_func7(alu_control_io_func7),
    .io_func3(alu_control_io_func3),
    .io_output(alu_control_io_output)
  );
  assign io_rs2_out = io_ID_EX_ctrl_OpB_sel ? $signed(_GEN_7) : $signed(_GEN_7); // @[Execute.scala 81:18 Execute.scala 83:18 Execute.scala 85:18 Execute.scala 87:18 Execute.scala 94:18 Execute.scala 97:18 Execute.scala 100:18 Execute.scala 103:18]
  assign io_alu_output = alu_io_output; // @[Execute.scala 117:17]
  assign io_rd_sel_out = io_ID_EX_rd_sel; // @[Execute.scala 120:17]
  assign io_ctrl_MemWr_out = io_ID_EX_ctrl_MemWr; // @[Execute.scala 124:21]
  assign io_ctrl_MemRd_out = io_ID_EX_ctrl_MemRd; // @[Execute.scala 125:21]
  assign io_ctrl_RegWr_out = io_ID_EX_ctrl_RegWr; // @[Execute.scala 126:21]
  assign io_ctrl_MemToReg_out = io_ID_EX_ctrl_MemToReg; // @[Execute.scala 127:24]
  assign io_func3_out = io_ID_EX_func3; // @[Execute.scala 122:16]
  assign forwardUnit_io_EX_MEM_REGRD = io_EX_MEM_rd_sel; // @[Execute.scala 50:31]
  assign forwardUnit_io_MEM_WB_REGRD = io_MEM_WB_rd_sel; // @[Execute.scala 51:31]
  assign forwardUnit_io_ID_EX_REGRS1 = io_ID_EX_rs1_sel; // @[Execute.scala 52:31]
  assign forwardUnit_io_ID_EX_REGRS2 = io_ID_EX_rs2_sel; // @[Execute.scala 53:31]
  assign forwardUnit_io_EX_MEM_REGWR = io_EX_MEM_ctrl_RegWr; // @[Execute.scala 54:31]
  assign forwardUnit_io_MEM_WB_REGWR = io_MEM_WB_ctrl_RegWr; // @[Execute.scala 55:31]
  assign alu_io_oper_a = _T ? $signed(io_ID_EX_pc4) : $signed(_GEN_3); // @[Execute.scala 59:19 Execute.scala 63:21 Execute.scala 67:21 Execute.scala 69:21 Execute.scala 71:21 Execute.scala 73:21]
  assign alu_io_oper_b = io_ID_EX_ctrl_OpB_sel ? $signed(io_ID_EX_imm) : $signed(_GEN_7); // @[Execute.scala 79:19 Execute.scala 93:21 Execute.scala 96:21 Execute.scala 99:21 Execute.scala 102:21]
  assign alu_io_aluCtrl = alu_control_io_output; // @[Execute.scala 114:18]
  assign alu_control_io_aluOp = io_ID_EX_ctrl_AluOp; // @[Execute.scala 108:24]
  assign alu_control_io_func7 = io_ID_EX_func7; // @[Execute.scala 109:24]
  assign alu_control_io_func3 = io_ID_EX_func3; // @[Execute.scala 110:24]
endmodule
module MemoryStage(
  input  [31:0] io_EX_MEM_alu_output,
  input  [4:0]  io_EX_MEM_rd_sel,
  input         io_EX_MEM_RegWr,
  input         io_EX_MEM_MemRd,
  input         io_EX_MEM_MemToReg,
  input         io_EX_MEM_MemWr,
  input  [31:0] io_EX_MEM_rs2,
  input  [2:0]  io_func3,
  input         io_data_gnt_i,
  input         io_data_rvalid_i,
  input  [31:0] io_data_rdata_i,
  output        io_data_req_o,
  output        io_data_be_o_0,
  output        io_data_be_o_1,
  output        io_data_be_o_2,
  output        io_data_be_o_3,
  output        io_ctrl_MemWr_out,
  output [7:0]  io_data_wdata_o_0,
  output [7:0]  io_data_wdata_o_1,
  output [7:0]  io_data_wdata_o_2,
  output [7:0]  io_data_wdata_o_3,
  output [31:0] io_memAddress,
  output [31:0] io_data_out,
  output [31:0] io_alu_output,
  output [4:0]  io_rd_sel_out,
  output        io_ctrl_RegWr_out,
  output        io_ctrl_MemRd_out,
  output        io_ctrl_MemToReg_out,
  output        io_stall
);
  wire [1:0] data_offset = io_EX_MEM_alu_output[1:0]; // @[MemoryStage.scala 40:41]
  wire  _T_2 = io_EX_MEM_MemWr | io_EX_MEM_MemRd; // @[MemoryStage.scala 48:40]
  wire  _T_3 = ~io_data_rvalid_i; // @[MemoryStage.scala 48:71]
  wire  _T_5 = io_func3 == 3'h2; // @[MemoryStage.scala 62:17]
  wire  _T_7 = _T_5 & io_EX_MEM_MemWr; // @[MemoryStage.scala 62:30]
  wire  _T_8 = data_offset == 2'h0; // @[MemoryStage.scala 64:22]
  wire  _T_9 = data_offset == 2'h1; // @[MemoryStage.scala 70:29]
  wire  _T_10 = data_offset == 2'h2; // @[MemoryStage.scala 77:29]
  wire  _T_11 = data_offset == 2'h3; // @[MemoryStage.scala 86:29]
  wire  _GEN_0 = _T_11 ? 1'h0 : 1'h1; // @[MemoryStage.scala 86:42]
  wire  _GEN_2 = _T_10 ? 1'h0 : _GEN_0; // @[MemoryStage.scala 77:42]
  wire  _GEN_3 = _T_10 | _GEN_0; // @[MemoryStage.scala 77:42]
  wire  _GEN_5 = _T_9 ? 1'h0 : _GEN_2; // @[MemoryStage.scala 70:42]
  wire  _GEN_6 = _T_9 | _GEN_2; // @[MemoryStage.scala 70:42]
  wire  _GEN_7 = _T_9 | _GEN_3; // @[MemoryStage.scala 70:42]
  wire  _GEN_9 = _T_8 | _GEN_5; // @[MemoryStage.scala 64:35]
  wire  _GEN_10 = _T_8 | _GEN_6; // @[MemoryStage.scala 64:35]
  wire  _GEN_11 = _T_8 | _GEN_7; // @[MemoryStage.scala 64:35]
  wire  _T_12 = io_func3 == 3'h1; // @[MemoryStage.scala 99:24]
  wire  _T_14 = _T_12 & io_EX_MEM_MemWr; // @[MemoryStage.scala 99:37]
  wire  _GEN_21 = _T_9 ? 1'h0 : 1'h1; // @[MemoryStage.scala 110:42]
  wire  _GEN_24 = _T_8 ? 1'h0 : _GEN_7; // @[MemoryStage.scala 101:35]
  wire  _GEN_25 = _T_8 ? 1'h0 : _GEN_21; // @[MemoryStage.scala 101:35]
  wire  _GEN_30 = _T_10 ? 1'h0 : 1'h1; // @[MemoryStage.scala 156:42]
  wire  _GEN_33 = _T_9 ? 1'h0 : _GEN_3; // @[MemoryStage.scala 148:42]
  wire  _GEN_34 = _T_9 ? 1'h0 : _GEN_30; // @[MemoryStage.scala 148:42]
  wire  _GEN_36 = _T_8 ? 1'h0 : _GEN_6; // @[MemoryStage.scala 141:35]
  wire  _GEN_37 = _T_8 ? 1'h0 : _GEN_33; // @[MemoryStage.scala 141:35]
  wire  _GEN_38 = _T_8 ? 1'h0 : _GEN_34; // @[MemoryStage.scala 141:35]
  wire  _GEN_43 = _T_14 ? _GEN_9 : _GEN_9; // @[MemoryStage.scala 99:65]
  wire  _GEN_44 = _T_14 ? _GEN_10 : _GEN_36; // @[MemoryStage.scala 99:65]
  wire  _GEN_45 = _T_14 ? _GEN_24 : _GEN_37; // @[MemoryStage.scala 99:65]
  wire  _GEN_46 = _T_14 ? _GEN_25 : _GEN_38; // @[MemoryStage.scala 99:65]
  wire [7:0] _T_28 = io_EX_MEM_rs2[7:0]; // @[MemoryStage.scala 189:47]
  wire [7:0] _T_30 = io_EX_MEM_rs2[15:8]; // @[MemoryStage.scala 190:48]
  wire [7:0] _T_32 = io_EX_MEM_rs2[23:16]; // @[MemoryStage.scala 191:49]
  wire [7:0] _T_34 = io_EX_MEM_rs2[31:24]; // @[MemoryStage.scala 192:49]
  wire [7:0] _GEN_51 = _T_11 ? $signed(_T_34) : $signed(_T_28); // @[MemoryStage.scala 203:40]
  wire [7:0] _GEN_52 = _T_11 ? $signed(_T_32) : $signed(_T_30); // @[MemoryStage.scala 203:40]
  wire [7:0] _GEN_53 = _T_11 ? $signed(_T_30) : $signed(_T_32); // @[MemoryStage.scala 203:40]
  wire [7:0] _GEN_54 = _T_11 ? $signed(_T_28) : $signed(_T_34); // @[MemoryStage.scala 203:40]
  wire [7:0] _GEN_55 = _T_10 ? $signed(_T_34) : $signed(_GEN_51); // @[MemoryStage.scala 198:40]
  wire [7:0] _GEN_56 = _T_10 ? $signed(_T_32) : $signed(_GEN_52); // @[MemoryStage.scala 198:40]
  wire [7:0] _GEN_57 = _T_10 ? $signed(_T_28) : $signed(_GEN_53); // @[MemoryStage.scala 198:40]
  wire [7:0] _GEN_58 = _T_10 ? $signed(_T_30) : $signed(_GEN_54); // @[MemoryStage.scala 198:40]
  wire [7:0] _GEN_59 = _T_9 ? $signed(_T_34) : $signed(_GEN_55); // @[MemoryStage.scala 193:40]
  wire [7:0] _GEN_60 = _T_9 ? $signed(_T_28) : $signed(_GEN_56); // @[MemoryStage.scala 193:40]
  wire [7:0] _GEN_61 = _T_9 ? $signed(_T_30) : $signed(_GEN_57); // @[MemoryStage.scala 193:40]
  wire [7:0] _GEN_62 = _T_9 ? $signed(_T_32) : $signed(_GEN_58); // @[MemoryStage.scala 193:40]
  wire  _T_71 = io_data_gnt_i & io_EX_MEM_MemWr; // @[MemoryStage.scala 217:22]
  wire [13:0] _T_73 = io_EX_MEM_alu_output[13:0]; // @[MemoryStage.scala 220:50]
  wire  _T_75 = io_data_gnt_i & io_EX_MEM_MemRd; // @[MemoryStage.scala 223:29]
  wire [13:0] _GEN_70 = _T_71 ? $signed(_T_73) : $signed(_T_73); // @[MemoryStage.scala 218:3]
  assign io_data_req_o = _T_71 | _T_75; // @[MemoryStage.scala 219:19 MemoryStage.scala 224:19 MemoryStage.scala 229:21]
  assign io_data_be_o_0 = _T_7 ? _GEN_9 : _GEN_43; // @[MemoryStage.scala 67:25 MemoryStage.scala 72:23 MemoryStage.scala 80:25 MemoryStage.scala 89:25 MemoryStage.scala 95:25 MemoryStage.scala 104:25 MemoryStage.scala 112:23 MemoryStage.scala 121:25 MemoryStage.scala 130:25 MemoryStage.scala 136:25 MemoryStage.scala 143:23 MemoryStage.scala 150:23 MemoryStage.scala 159:25 MemoryStage.scala 167:25 MemoryStage.scala 173:25]
  assign io_data_be_o_1 = _T_7 ? _GEN_10 : _GEN_44; // @[MemoryStage.scala 67:25 MemoryStage.scala 74:25 MemoryStage.scala 80:25 MemoryStage.scala 89:25 MemoryStage.scala 95:25 MemoryStage.scala 104:25 MemoryStage.scala 114:25 MemoryStage.scala 121:25 MemoryStage.scala 130:25 MemoryStage.scala 136:25 MemoryStage.scala 145:25 MemoryStage.scala 151:23 MemoryStage.scala 159:25 MemoryStage.scala 167:25 MemoryStage.scala 173:25]
  assign io_data_be_o_2 = _T_7 ? _GEN_11 : _GEN_45; // @[MemoryStage.scala 67:25 MemoryStage.scala 74:25 MemoryStage.scala 83:25 MemoryStage.scala 89:25 MemoryStage.scala 95:25 MemoryStage.scala 107:25 MemoryStage.scala 114:25 MemoryStage.scala 124:25 MemoryStage.scala 130:25 MemoryStage.scala 136:25 MemoryStage.scala 145:25 MemoryStage.scala 153:25 MemoryStage.scala 161:23 MemoryStage.scala 167:25 MemoryStage.scala 173:25]
  assign io_data_be_o_3 = _T_7 | _GEN_46; // @[MemoryStage.scala 67:25 MemoryStage.scala 74:25 MemoryStage.scala 83:25 MemoryStage.scala 91:23 MemoryStage.scala 95:25 MemoryStage.scala 107:25 MemoryStage.scala 116:23 MemoryStage.scala 124:25 MemoryStage.scala 132:23 MemoryStage.scala 136:25 MemoryStage.scala 145:25 MemoryStage.scala 153:25 MemoryStage.scala 162:23 MemoryStage.scala 169:23 MemoryStage.scala 173:25]
  assign io_ctrl_MemWr_out = io_EX_MEM_MemWr; // @[MemoryStage.scala 244:21]
  assign io_data_wdata_o_0 = _T_8 ? $signed(_T_28) : $signed(_GEN_59); // @[MemoryStage.scala 222:21]
  assign io_data_wdata_o_1 = _T_8 ? $signed(_T_30) : $signed(_GEN_60); // @[MemoryStage.scala 222:21]
  assign io_data_wdata_o_2 = _T_8 ? $signed(_T_32) : $signed(_GEN_61); // @[MemoryStage.scala 222:21]
  assign io_data_wdata_o_3 = _T_8 ? $signed(_T_34) : $signed(_GEN_62); // @[MemoryStage.scala 222:21]
  assign io_memAddress = {{18{_GEN_70[13]}},_GEN_70}; // @[MemoryStage.scala 220:19 MemoryStage.scala 225:19]
  assign io_data_out = io_data_rdata_i; // @[MemoryStage.scala 236:21]
  assign io_alu_output = io_EX_MEM_alu_output; // @[MemoryStage.scala 245:17]
  assign io_rd_sel_out = io_EX_MEM_rd_sel; // @[MemoryStage.scala 247:17]
  assign io_ctrl_RegWr_out = io_EX_MEM_RegWr; // @[MemoryStage.scala 248:21]
  assign io_ctrl_MemRd_out = io_EX_MEM_MemRd; // @[MemoryStage.scala 249:21]
  assign io_ctrl_MemToReg_out = io_EX_MEM_MemToReg; // @[MemoryStage.scala 250:24]
  assign io_stall = _T_2 & _T_3; // @[MemoryStage.scala 48:12]
endmodule
module WriteBack(
  input         io_MEM_WB_MemToReg,
  input  [31:0] io_MEM_WB_dataMem_data,
  input  [31:0] io_MEM_WB_alu_output,
  output [31:0] io_write_data
);
  assign io_write_data = io_MEM_WB_MemToReg ? $signed(io_MEM_WB_dataMem_data) : $signed(io_MEM_WB_alu_output); // @[WriteBack.scala 14:23 WriteBack.scala 16:23]
endmodule
module Core(
  input         clock,
  input         reset,
  input         io_data_gnt_i,
  input         io_data_rvalid_i,
  input  [31:0] io_data_rdata_i,
  output        io_data_req_o,
  output        io_data_we_o,
  output        io_data_be_o_0,
  output        io_data_be_o_1,
  output        io_data_be_o_2,
  output        io_data_be_o_3,
  output [31:0] io_data_addr_o,
  output [7:0]  io_data_wdata_o_0,
  output [7:0]  io_data_wdata_o_1,
  output [7:0]  io_data_wdata_o_2,
  output [7:0]  io_data_wdata_o_3,
  input         io_instr_gnt_i,
  input         io_instr_rvalid_i,
  input  [31:0] io_instr_rdata_i,
  output        io_instr_req_o,
  output [31:0] io_instr_addr_o,
  output [31:0] io_reg_7
);
  wire  ID_EX_clock; // @[Core.scala 32:22]
  wire  ID_EX_reset; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_pc_in; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_pc4_in; // @[Core.scala 32:22]
  wire [4:0] ID_EX_io_rs1_sel_in; // @[Core.scala 32:22]
  wire [4:0] ID_EX_io_rs2_sel_in; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_rs1_in; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_rs2_in; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_imm; // @[Core.scala 32:22]
  wire [4:0] ID_EX_io_rd_sel_in; // @[Core.scala 32:22]
  wire [2:0] ID_EX_io_func3_in; // @[Core.scala 32:22]
  wire [6:0] ID_EX_io_func7_in; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_MemWr_in; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_MemRd_in; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_RegWr_in; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_MemToReg_in; // @[Core.scala 32:22]
  wire [3:0] ID_EX_io_ctrl_AluOp_in; // @[Core.scala 32:22]
  wire [1:0] ID_EX_io_ctrl_OpA_sel_in; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_OpB_sel_in; // @[Core.scala 32:22]
  wire  ID_EX_io_stall; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_pc_out; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_pc4_out; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_rs1_out; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_rs2_out; // @[Core.scala 32:22]
  wire [31:0] ID_EX_io_imm_out; // @[Core.scala 32:22]
  wire [2:0] ID_EX_io_func3_out; // @[Core.scala 32:22]
  wire [6:0] ID_EX_io_func7_out; // @[Core.scala 32:22]
  wire [4:0] ID_EX_io_rd_sel_out; // @[Core.scala 32:22]
  wire [4:0] ID_EX_io_rs1_sel_out; // @[Core.scala 32:22]
  wire [4:0] ID_EX_io_rs2_sel_out; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_MemWr_out; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_MemRd_out; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_RegWr_out; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_MemToReg_out; // @[Core.scala 32:22]
  wire [3:0] ID_EX_io_ctrl_AluOp_out; // @[Core.scala 32:22]
  wire [1:0] ID_EX_io_ctrl_OpA_sel_out; // @[Core.scala 32:22]
  wire  ID_EX_io_ctrl_OpB_sel_out; // @[Core.scala 32:22]
  wire  EX_MEM_clock; // @[Core.scala 33:23]
  wire  EX_MEM_reset; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_MemWr_in; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_MemRd_in; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_RegWr_in; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_MemToReg_in; // @[Core.scala 33:23]
  wire [31:0] EX_MEM_io_rs2_in; // @[Core.scala 33:23]
  wire [4:0] EX_MEM_io_rd_sel_in; // @[Core.scala 33:23]
  wire [31:0] EX_MEM_io_alu_in; // @[Core.scala 33:23]
  wire [2:0] EX_MEM_io_EX_MEM_func3; // @[Core.scala 33:23]
  wire  EX_MEM_io_stall; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_MemWr_out; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_MemRd_out; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_RegWr_out; // @[Core.scala 33:23]
  wire  EX_MEM_io_ctrl_MemToReg_out; // @[Core.scala 33:23]
  wire [31:0] EX_MEM_io_rs2_out; // @[Core.scala 33:23]
  wire [4:0] EX_MEM_io_rd_sel_out; // @[Core.scala 33:23]
  wire [31:0] EX_MEM_io_alu_output; // @[Core.scala 33:23]
  wire [2:0] EX_MEM_io_EX_MEM_func3_out; // @[Core.scala 33:23]
  wire  MEM_WB_clock; // @[Core.scala 34:23]
  wire  MEM_WB_reset; // @[Core.scala 34:23]
  wire  MEM_WB_io_ctrl_RegWr_in; // @[Core.scala 34:23]
  wire  MEM_WB_io_ctrl_MemToReg_in; // @[Core.scala 34:23]
  wire [4:0] MEM_WB_io_rd_sel_in; // @[Core.scala 34:23]
  wire  MEM_WB_io_ctrl_MemRd_in; // @[Core.scala 34:23]
  wire [31:0] MEM_WB_io_dmem_data_in; // @[Core.scala 34:23]
  wire [31:0] MEM_WB_io_alu_in; // @[Core.scala 34:23]
  wire  MEM_WB_io_stall; // @[Core.scala 34:23]
  wire  MEM_WB_io_ctrl_RegWr_out; // @[Core.scala 34:23]
  wire  MEM_WB_io_ctrl_MemToReg_out; // @[Core.scala 34:23]
  wire  MEM_WB_io_ctrl_MemRd_out; // @[Core.scala 34:23]
  wire [4:0] MEM_WB_io_rd_sel_out; // @[Core.scala 34:23]
  wire [31:0] MEM_WB_io_dmem_data_out; // @[Core.scala 34:23]
  wire [31:0] MEM_WB_io_alu_output; // @[Core.scala 34:23]
  wire  fetch_clock; // @[Core.scala 35:22]
  wire  fetch_reset; // @[Core.scala 35:22]
  wire  fetch_io_instr_gnt_i; // @[Core.scala 35:22]
  wire  fetch_io_instr_rvalid_i; // @[Core.scala 35:22]
  wire [31:0] fetch_io_instr_rdata_i; // @[Core.scala 35:22]
  wire [31:0] fetch_io_sb_imm; // @[Core.scala 35:22]
  wire [31:0] fetch_io_uj_imm; // @[Core.scala 35:22]
  wire [31:0] fetch_io_jalr_imm; // @[Core.scala 35:22]
  wire [1:0] fetch_io_ctrl_next_pc_sel; // @[Core.scala 35:22]
  wire  fetch_io_ctrl_out_branch; // @[Core.scala 35:22]
  wire  fetch_io_branchLogic_output; // @[Core.scala 35:22]
  wire [31:0] fetch_io_hazardDetection_pc_out; // @[Core.scala 35:22]
  wire [31:0] fetch_io_hazardDetection_inst_out; // @[Core.scala 35:22]
  wire [31:0] fetch_io_hazardDetection_current_pc_out; // @[Core.scala 35:22]
  wire  fetch_io_hazardDetection_pc_forward; // @[Core.scala 35:22]
  wire  fetch_io_hazardDetection_inst_forward; // @[Core.scala 35:22]
  wire  fetch_io_stall; // @[Core.scala 35:22]
  wire [31:0] fetch_io_instr_addr_o; // @[Core.scala 35:22]
  wire  fetch_io_instr_req_o; // @[Core.scala 35:22]
  wire [31:0] fetch_io_pc_out; // @[Core.scala 35:22]
  wire [31:0] fetch_io_pc4_out; // @[Core.scala 35:22]
  wire [31:0] fetch_io_inst_out; // @[Core.scala 35:22]
  wire  decode_clock; // @[Core.scala 36:23]
  wire  decode_reset; // @[Core.scala 36:23]
  wire [31:0] decode_io_IF_ID_inst; // @[Core.scala 36:23]
  wire [31:0] decode_io_IF_ID_pc; // @[Core.scala 36:23]
  wire [31:0] decode_io_IF_ID_pc4; // @[Core.scala 36:23]
  wire  decode_io_MEM_WB_ctrl_regWr; // @[Core.scala 36:23]
  wire [4:0] decode_io_MEM_WB_rd_sel; // @[Core.scala 36:23]
  wire  decode_io_ID_EX_ctrl_MemRd; // @[Core.scala 36:23]
  wire [4:0] decode_io_ID_EX_rd_sel; // @[Core.scala 36:23]
  wire [4:0] decode_io_EX_MEM_rd_sel; // @[Core.scala 36:23]
  wire  decode_io_EX_MEM_ctrl_MemRd; // @[Core.scala 36:23]
  wire  decode_io_MEM_WB_ctrl_MemRd; // @[Core.scala 36:23]
  wire [31:0] decode_io_alu_output; // @[Core.scala 36:23]
  wire [31:0] decode_io_EX_MEM_alu_output; // @[Core.scala 36:23]
  wire [31:0] decode_io_dmem_memOut; // @[Core.scala 36:23]
  wire [31:0] decode_io_writeback_write_data; // @[Core.scala 36:23]
  wire  decode_io_execute_regwrite; // @[Core.scala 36:23]
  wire  decode_io_mem_regwrite; // @[Core.scala 36:23]
  wire  decode_io_wb_regwrite; // @[Core.scala 36:23]
  wire [31:0] decode_io_pc_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_pc4_out; // @[Core.scala 36:23]
  wire [2:0] decode_io_func3_out; // @[Core.scala 36:23]
  wire [6:0] decode_io_func7_out; // @[Core.scala 36:23]
  wire [4:0] decode_io_rd_sel_out; // @[Core.scala 36:23]
  wire [4:0] decode_io_rs1_sel_out; // @[Core.scala 36:23]
  wire [4:0] decode_io_rs2_sel_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_rs1_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_rs2_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_imm_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_sb_imm; // @[Core.scala 36:23]
  wire [31:0] decode_io_uj_imm; // @[Core.scala 36:23]
  wire [31:0] decode_io_jalr_output; // @[Core.scala 36:23]
  wire  decode_io_branchLogic_output; // @[Core.scala 36:23]
  wire [31:0] decode_io_hazardDetection_pc_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_hazardDetection_inst_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_hazardDetection_current_pc_out; // @[Core.scala 36:23]
  wire  decode_io_hazardDetection_pc_forward; // @[Core.scala 36:23]
  wire  decode_io_hazardDetection_inst_forward; // @[Core.scala 36:23]
  wire  decode_io_ctrl_MemWr_out; // @[Core.scala 36:23]
  wire  decode_io_ctrl_MemRd_out; // @[Core.scala 36:23]
  wire  decode_io_ctrl_Branch_out; // @[Core.scala 36:23]
  wire  decode_io_ctrl_RegWr_out; // @[Core.scala 36:23]
  wire  decode_io_ctrl_MemToReg_out; // @[Core.scala 36:23]
  wire [3:0] decode_io_ctrl_AluOp_out; // @[Core.scala 36:23]
  wire [1:0] decode_io_ctrl_OpA_sel_out; // @[Core.scala 36:23]
  wire  decode_io_ctrl_OpB_sel_out; // @[Core.scala 36:23]
  wire [1:0] decode_io_ctrl_next_pc_sel_out; // @[Core.scala 36:23]
  wire [31:0] decode_io_reg_7_out; // @[Core.scala 36:23]
  wire [4:0] execute_io_EX_MEM_rd_sel; // @[Core.scala 37:24]
  wire [4:0] execute_io_MEM_WB_rd_sel; // @[Core.scala 37:24]
  wire [4:0] execute_io_ID_EX_rs1_sel; // @[Core.scala 37:24]
  wire [4:0] execute_io_ID_EX_rs2_sel; // @[Core.scala 37:24]
  wire  execute_io_EX_MEM_ctrl_RegWr; // @[Core.scala 37:24]
  wire  execute_io_MEM_WB_ctrl_RegWr; // @[Core.scala 37:24]
  wire [1:0] execute_io_ID_EX_ctrl_OpA_sel; // @[Core.scala 37:24]
  wire  execute_io_ID_EX_ctrl_OpB_sel; // @[Core.scala 37:24]
  wire [31:0] execute_io_ID_EX_pc4; // @[Core.scala 37:24]
  wire [31:0] execute_io_ID_EX_pc_out; // @[Core.scala 37:24]
  wire [31:0] execute_io_ID_EX_rs1; // @[Core.scala 37:24]
  wire [31:0] execute_io_ID_EX_rs2; // @[Core.scala 37:24]
  wire [31:0] execute_io_EX_MEM_alu_output; // @[Core.scala 37:24]
  wire [31:0] execute_io_writeback_write_data; // @[Core.scala 37:24]
  wire [31:0] execute_io_ID_EX_imm; // @[Core.scala 37:24]
  wire [3:0] execute_io_ID_EX_ctrl_AluOp; // @[Core.scala 37:24]
  wire [6:0] execute_io_ID_EX_func7; // @[Core.scala 37:24]
  wire [2:0] execute_io_ID_EX_func3; // @[Core.scala 37:24]
  wire [4:0] execute_io_ID_EX_rd_sel; // @[Core.scala 37:24]
  wire  execute_io_ID_EX_ctrl_MemWr; // @[Core.scala 37:24]
  wire  execute_io_ID_EX_ctrl_MemRd; // @[Core.scala 37:24]
  wire  execute_io_ID_EX_ctrl_RegWr; // @[Core.scala 37:24]
  wire  execute_io_ID_EX_ctrl_MemToReg; // @[Core.scala 37:24]
  wire [31:0] execute_io_rs2_out; // @[Core.scala 37:24]
  wire [31:0] execute_io_alu_output; // @[Core.scala 37:24]
  wire [4:0] execute_io_rd_sel_out; // @[Core.scala 37:24]
  wire  execute_io_ctrl_MemWr_out; // @[Core.scala 37:24]
  wire  execute_io_ctrl_MemRd_out; // @[Core.scala 37:24]
  wire  execute_io_ctrl_RegWr_out; // @[Core.scala 37:24]
  wire  execute_io_ctrl_MemToReg_out; // @[Core.scala 37:24]
  wire [2:0] execute_io_func3_out; // @[Core.scala 37:24]
  wire [31:0] memory_stage_io_EX_MEM_alu_output; // @[Core.scala 38:29]
  wire [4:0] memory_stage_io_EX_MEM_rd_sel; // @[Core.scala 38:29]
  wire  memory_stage_io_EX_MEM_RegWr; // @[Core.scala 38:29]
  wire  memory_stage_io_EX_MEM_MemRd; // @[Core.scala 38:29]
  wire  memory_stage_io_EX_MEM_MemToReg; // @[Core.scala 38:29]
  wire  memory_stage_io_EX_MEM_MemWr; // @[Core.scala 38:29]
  wire [31:0] memory_stage_io_EX_MEM_rs2; // @[Core.scala 38:29]
  wire [2:0] memory_stage_io_func3; // @[Core.scala 38:29]
  wire  memory_stage_io_data_gnt_i; // @[Core.scala 38:29]
  wire  memory_stage_io_data_rvalid_i; // @[Core.scala 38:29]
  wire [31:0] memory_stage_io_data_rdata_i; // @[Core.scala 38:29]
  wire  memory_stage_io_data_req_o; // @[Core.scala 38:29]
  wire  memory_stage_io_data_be_o_0; // @[Core.scala 38:29]
  wire  memory_stage_io_data_be_o_1; // @[Core.scala 38:29]
  wire  memory_stage_io_data_be_o_2; // @[Core.scala 38:29]
  wire  memory_stage_io_data_be_o_3; // @[Core.scala 38:29]
  wire  memory_stage_io_ctrl_MemWr_out; // @[Core.scala 38:29]
  wire [7:0] memory_stage_io_data_wdata_o_0; // @[Core.scala 38:29]
  wire [7:0] memory_stage_io_data_wdata_o_1; // @[Core.scala 38:29]
  wire [7:0] memory_stage_io_data_wdata_o_2; // @[Core.scala 38:29]
  wire [7:0] memory_stage_io_data_wdata_o_3; // @[Core.scala 38:29]
  wire [31:0] memory_stage_io_memAddress; // @[Core.scala 38:29]
  wire [31:0] memory_stage_io_data_out; // @[Core.scala 38:29]
  wire [31:0] memory_stage_io_alu_output; // @[Core.scala 38:29]
  wire [4:0] memory_stage_io_rd_sel_out; // @[Core.scala 38:29]
  wire  memory_stage_io_ctrl_RegWr_out; // @[Core.scala 38:29]
  wire  memory_stage_io_ctrl_MemRd_out; // @[Core.scala 38:29]
  wire  memory_stage_io_ctrl_MemToReg_out; // @[Core.scala 38:29]
  wire  memory_stage_io_stall; // @[Core.scala 38:29]
  wire  writeback_io_MEM_WB_MemToReg; // @[Core.scala 39:26]
  wire [31:0] writeback_io_MEM_WB_dataMem_data; // @[Core.scala 39:26]
  wire [31:0] writeback_io_MEM_WB_alu_output; // @[Core.scala 39:26]
  wire [31:0] writeback_io_write_data; // @[Core.scala 39:26]
  ID_EX ID_EX ( // @[Core.scala 32:22]
    .clock(ID_EX_clock),
    .reset(ID_EX_reset),
    .io_pc_in(ID_EX_io_pc_in),
    .io_pc4_in(ID_EX_io_pc4_in),
    .io_rs1_sel_in(ID_EX_io_rs1_sel_in),
    .io_rs2_sel_in(ID_EX_io_rs2_sel_in),
    .io_rs1_in(ID_EX_io_rs1_in),
    .io_rs2_in(ID_EX_io_rs2_in),
    .io_imm(ID_EX_io_imm),
    .io_rd_sel_in(ID_EX_io_rd_sel_in),
    .io_func3_in(ID_EX_io_func3_in),
    .io_func7_in(ID_EX_io_func7_in),
    .io_ctrl_MemWr_in(ID_EX_io_ctrl_MemWr_in),
    .io_ctrl_MemRd_in(ID_EX_io_ctrl_MemRd_in),
    .io_ctrl_RegWr_in(ID_EX_io_ctrl_RegWr_in),
    .io_ctrl_MemToReg_in(ID_EX_io_ctrl_MemToReg_in),
    .io_ctrl_AluOp_in(ID_EX_io_ctrl_AluOp_in),
    .io_ctrl_OpA_sel_in(ID_EX_io_ctrl_OpA_sel_in),
    .io_ctrl_OpB_sel_in(ID_EX_io_ctrl_OpB_sel_in),
    .io_stall(ID_EX_io_stall),
    .io_pc_out(ID_EX_io_pc_out),
    .io_pc4_out(ID_EX_io_pc4_out),
    .io_rs1_out(ID_EX_io_rs1_out),
    .io_rs2_out(ID_EX_io_rs2_out),
    .io_imm_out(ID_EX_io_imm_out),
    .io_func3_out(ID_EX_io_func3_out),
    .io_func7_out(ID_EX_io_func7_out),
    .io_rd_sel_out(ID_EX_io_rd_sel_out),
    .io_rs1_sel_out(ID_EX_io_rs1_sel_out),
    .io_rs2_sel_out(ID_EX_io_rs2_sel_out),
    .io_ctrl_MemWr_out(ID_EX_io_ctrl_MemWr_out),
    .io_ctrl_MemRd_out(ID_EX_io_ctrl_MemRd_out),
    .io_ctrl_RegWr_out(ID_EX_io_ctrl_RegWr_out),
    .io_ctrl_MemToReg_out(ID_EX_io_ctrl_MemToReg_out),
    .io_ctrl_AluOp_out(ID_EX_io_ctrl_AluOp_out),
    .io_ctrl_OpA_sel_out(ID_EX_io_ctrl_OpA_sel_out),
    .io_ctrl_OpB_sel_out(ID_EX_io_ctrl_OpB_sel_out)
  );
  EX_MEM EX_MEM ( // @[Core.scala 33:23]
    .clock(EX_MEM_clock),
    .reset(EX_MEM_reset),
    .io_ctrl_MemWr_in(EX_MEM_io_ctrl_MemWr_in),
    .io_ctrl_MemRd_in(EX_MEM_io_ctrl_MemRd_in),
    .io_ctrl_RegWr_in(EX_MEM_io_ctrl_RegWr_in),
    .io_ctrl_MemToReg_in(EX_MEM_io_ctrl_MemToReg_in),
    .io_rs2_in(EX_MEM_io_rs2_in),
    .io_rd_sel_in(EX_MEM_io_rd_sel_in),
    .io_alu_in(EX_MEM_io_alu_in),
    .io_EX_MEM_func3(EX_MEM_io_EX_MEM_func3),
    .io_stall(EX_MEM_io_stall),
    .io_ctrl_MemWr_out(EX_MEM_io_ctrl_MemWr_out),
    .io_ctrl_MemRd_out(EX_MEM_io_ctrl_MemRd_out),
    .io_ctrl_RegWr_out(EX_MEM_io_ctrl_RegWr_out),
    .io_ctrl_MemToReg_out(EX_MEM_io_ctrl_MemToReg_out),
    .io_rs2_out(EX_MEM_io_rs2_out),
    .io_rd_sel_out(EX_MEM_io_rd_sel_out),
    .io_alu_output(EX_MEM_io_alu_output),
    .io_EX_MEM_func3_out(EX_MEM_io_EX_MEM_func3_out)
  );
  MEM_WB MEM_WB ( // @[Core.scala 34:23]
    .clock(MEM_WB_clock),
    .reset(MEM_WB_reset),
    .io_ctrl_RegWr_in(MEM_WB_io_ctrl_RegWr_in),
    .io_ctrl_MemToReg_in(MEM_WB_io_ctrl_MemToReg_in),
    .io_rd_sel_in(MEM_WB_io_rd_sel_in),
    .io_ctrl_MemRd_in(MEM_WB_io_ctrl_MemRd_in),
    .io_dmem_data_in(MEM_WB_io_dmem_data_in),
    .io_alu_in(MEM_WB_io_alu_in),
    .io_stall(MEM_WB_io_stall),
    .io_ctrl_RegWr_out(MEM_WB_io_ctrl_RegWr_out),
    .io_ctrl_MemToReg_out(MEM_WB_io_ctrl_MemToReg_out),
    .io_ctrl_MemRd_out(MEM_WB_io_ctrl_MemRd_out),
    .io_rd_sel_out(MEM_WB_io_rd_sel_out),
    .io_dmem_data_out(MEM_WB_io_dmem_data_out),
    .io_alu_output(MEM_WB_io_alu_output)
  );
  Fetch fetch ( // @[Core.scala 35:22]
    .clock(fetch_clock),
    .reset(fetch_reset),
    .io_instr_gnt_i(fetch_io_instr_gnt_i),
    .io_instr_rvalid_i(fetch_io_instr_rvalid_i),
    .io_instr_rdata_i(fetch_io_instr_rdata_i),
    .io_sb_imm(fetch_io_sb_imm),
    .io_uj_imm(fetch_io_uj_imm),
    .io_jalr_imm(fetch_io_jalr_imm),
    .io_ctrl_next_pc_sel(fetch_io_ctrl_next_pc_sel),
    .io_ctrl_out_branch(fetch_io_ctrl_out_branch),
    .io_branchLogic_output(fetch_io_branchLogic_output),
    .io_hazardDetection_pc_out(fetch_io_hazardDetection_pc_out),
    .io_hazardDetection_inst_out(fetch_io_hazardDetection_inst_out),
    .io_hazardDetection_current_pc_out(fetch_io_hazardDetection_current_pc_out),
    .io_hazardDetection_pc_forward(fetch_io_hazardDetection_pc_forward),
    .io_hazardDetection_inst_forward(fetch_io_hazardDetection_inst_forward),
    .io_stall(fetch_io_stall),
    .io_instr_addr_o(fetch_io_instr_addr_o),
    .io_instr_req_o(fetch_io_instr_req_o),
    .io_pc_out(fetch_io_pc_out),
    .io_pc4_out(fetch_io_pc4_out),
    .io_inst_out(fetch_io_inst_out)
  );
  Decode decode ( // @[Core.scala 36:23]
    .clock(decode_clock),
    .reset(decode_reset),
    .io_IF_ID_inst(decode_io_IF_ID_inst),
    .io_IF_ID_pc(decode_io_IF_ID_pc),
    .io_IF_ID_pc4(decode_io_IF_ID_pc4),
    .io_MEM_WB_ctrl_regWr(decode_io_MEM_WB_ctrl_regWr),
    .io_MEM_WB_rd_sel(decode_io_MEM_WB_rd_sel),
    .io_ID_EX_ctrl_MemRd(decode_io_ID_EX_ctrl_MemRd),
    .io_ID_EX_rd_sel(decode_io_ID_EX_rd_sel),
    .io_EX_MEM_rd_sel(decode_io_EX_MEM_rd_sel),
    .io_EX_MEM_ctrl_MemRd(decode_io_EX_MEM_ctrl_MemRd),
    .io_MEM_WB_ctrl_MemRd(decode_io_MEM_WB_ctrl_MemRd),
    .io_alu_output(decode_io_alu_output),
    .io_EX_MEM_alu_output(decode_io_EX_MEM_alu_output),
    .io_dmem_memOut(decode_io_dmem_memOut),
    .io_writeback_write_data(decode_io_writeback_write_data),
    .io_execute_regwrite(decode_io_execute_regwrite),
    .io_mem_regwrite(decode_io_mem_regwrite),
    .io_wb_regwrite(decode_io_wb_regwrite),
    .io_pc_out(decode_io_pc_out),
    .io_pc4_out(decode_io_pc4_out),
    .io_func3_out(decode_io_func3_out),
    .io_func7_out(decode_io_func7_out),
    .io_rd_sel_out(decode_io_rd_sel_out),
    .io_rs1_sel_out(decode_io_rs1_sel_out),
    .io_rs2_sel_out(decode_io_rs2_sel_out),
    .io_rs1_out(decode_io_rs1_out),
    .io_rs2_out(decode_io_rs2_out),
    .io_imm_out(decode_io_imm_out),
    .io_sb_imm(decode_io_sb_imm),
    .io_uj_imm(decode_io_uj_imm),
    .io_jalr_output(decode_io_jalr_output),
    .io_branchLogic_output(decode_io_branchLogic_output),
    .io_hazardDetection_pc_out(decode_io_hazardDetection_pc_out),
    .io_hazardDetection_inst_out(decode_io_hazardDetection_inst_out),
    .io_hazardDetection_current_pc_out(decode_io_hazardDetection_current_pc_out),
    .io_hazardDetection_pc_forward(decode_io_hazardDetection_pc_forward),
    .io_hazardDetection_inst_forward(decode_io_hazardDetection_inst_forward),
    .io_ctrl_MemWr_out(decode_io_ctrl_MemWr_out),
    .io_ctrl_MemRd_out(decode_io_ctrl_MemRd_out),
    .io_ctrl_Branch_out(decode_io_ctrl_Branch_out),
    .io_ctrl_RegWr_out(decode_io_ctrl_RegWr_out),
    .io_ctrl_MemToReg_out(decode_io_ctrl_MemToReg_out),
    .io_ctrl_AluOp_out(decode_io_ctrl_AluOp_out),
    .io_ctrl_OpA_sel_out(decode_io_ctrl_OpA_sel_out),
    .io_ctrl_OpB_sel_out(decode_io_ctrl_OpB_sel_out),
    .io_ctrl_next_pc_sel_out(decode_io_ctrl_next_pc_sel_out),
    .io_reg_7_out(decode_io_reg_7_out)
  );
  Execute execute ( // @[Core.scala 37:24]
    .io_EX_MEM_rd_sel(execute_io_EX_MEM_rd_sel),
    .io_MEM_WB_rd_sel(execute_io_MEM_WB_rd_sel),
    .io_ID_EX_rs1_sel(execute_io_ID_EX_rs1_sel),
    .io_ID_EX_rs2_sel(execute_io_ID_EX_rs2_sel),
    .io_EX_MEM_ctrl_RegWr(execute_io_EX_MEM_ctrl_RegWr),
    .io_MEM_WB_ctrl_RegWr(execute_io_MEM_WB_ctrl_RegWr),
    .io_ID_EX_ctrl_OpA_sel(execute_io_ID_EX_ctrl_OpA_sel),
    .io_ID_EX_ctrl_OpB_sel(execute_io_ID_EX_ctrl_OpB_sel),
    .io_ID_EX_pc4(execute_io_ID_EX_pc4),
    .io_ID_EX_pc_out(execute_io_ID_EX_pc_out),
    .io_ID_EX_rs1(execute_io_ID_EX_rs1),
    .io_ID_EX_rs2(execute_io_ID_EX_rs2),
    .io_EX_MEM_alu_output(execute_io_EX_MEM_alu_output),
    .io_writeback_write_data(execute_io_writeback_write_data),
    .io_ID_EX_imm(execute_io_ID_EX_imm),
    .io_ID_EX_ctrl_AluOp(execute_io_ID_EX_ctrl_AluOp),
    .io_ID_EX_func7(execute_io_ID_EX_func7),
    .io_ID_EX_func3(execute_io_ID_EX_func3),
    .io_ID_EX_rd_sel(execute_io_ID_EX_rd_sel),
    .io_ID_EX_ctrl_MemWr(execute_io_ID_EX_ctrl_MemWr),
    .io_ID_EX_ctrl_MemRd(execute_io_ID_EX_ctrl_MemRd),
    .io_ID_EX_ctrl_RegWr(execute_io_ID_EX_ctrl_RegWr),
    .io_ID_EX_ctrl_MemToReg(execute_io_ID_EX_ctrl_MemToReg),
    .io_rs2_out(execute_io_rs2_out),
    .io_alu_output(execute_io_alu_output),
    .io_rd_sel_out(execute_io_rd_sel_out),
    .io_ctrl_MemWr_out(execute_io_ctrl_MemWr_out),
    .io_ctrl_MemRd_out(execute_io_ctrl_MemRd_out),
    .io_ctrl_RegWr_out(execute_io_ctrl_RegWr_out),
    .io_ctrl_MemToReg_out(execute_io_ctrl_MemToReg_out),
    .io_func3_out(execute_io_func3_out)
  );
  MemoryStage memory_stage ( // @[Core.scala 38:29]
    .io_EX_MEM_alu_output(memory_stage_io_EX_MEM_alu_output),
    .io_EX_MEM_rd_sel(memory_stage_io_EX_MEM_rd_sel),
    .io_EX_MEM_RegWr(memory_stage_io_EX_MEM_RegWr),
    .io_EX_MEM_MemRd(memory_stage_io_EX_MEM_MemRd),
    .io_EX_MEM_MemToReg(memory_stage_io_EX_MEM_MemToReg),
    .io_EX_MEM_MemWr(memory_stage_io_EX_MEM_MemWr),
    .io_EX_MEM_rs2(memory_stage_io_EX_MEM_rs2),
    .io_func3(memory_stage_io_func3),
    .io_data_gnt_i(memory_stage_io_data_gnt_i),
    .io_data_rvalid_i(memory_stage_io_data_rvalid_i),
    .io_data_rdata_i(memory_stage_io_data_rdata_i),
    .io_data_req_o(memory_stage_io_data_req_o),
    .io_data_be_o_0(memory_stage_io_data_be_o_0),
    .io_data_be_o_1(memory_stage_io_data_be_o_1),
    .io_data_be_o_2(memory_stage_io_data_be_o_2),
    .io_data_be_o_3(memory_stage_io_data_be_o_3),
    .io_ctrl_MemWr_out(memory_stage_io_ctrl_MemWr_out),
    .io_data_wdata_o_0(memory_stage_io_data_wdata_o_0),
    .io_data_wdata_o_1(memory_stage_io_data_wdata_o_1),
    .io_data_wdata_o_2(memory_stage_io_data_wdata_o_2),
    .io_data_wdata_o_3(memory_stage_io_data_wdata_o_3),
    .io_memAddress(memory_stage_io_memAddress),
    .io_data_out(memory_stage_io_data_out),
    .io_alu_output(memory_stage_io_alu_output),
    .io_rd_sel_out(memory_stage_io_rd_sel_out),
    .io_ctrl_RegWr_out(memory_stage_io_ctrl_RegWr_out),
    .io_ctrl_MemRd_out(memory_stage_io_ctrl_MemRd_out),
    .io_ctrl_MemToReg_out(memory_stage_io_ctrl_MemToReg_out),
    .io_stall(memory_stage_io_stall)
  );
  WriteBack writeback ( // @[Core.scala 39:26]
    .io_MEM_WB_MemToReg(writeback_io_MEM_WB_MemToReg),
    .io_MEM_WB_dataMem_data(writeback_io_MEM_WB_dataMem_data),
    .io_MEM_WB_alu_output(writeback_io_MEM_WB_alu_output),
    .io_write_data(writeback_io_write_data)
  );
  assign io_data_req_o = memory_stage_io_data_req_o; // @[Core.scala 181:19]
  assign io_data_we_o = memory_stage_io_ctrl_MemWr_out; // @[Core.scala 183:19]
  assign io_data_be_o_0 = memory_stage_io_data_be_o_0; // @[Core.scala 182:19]
  assign io_data_be_o_1 = memory_stage_io_data_be_o_1; // @[Core.scala 182:19]
  assign io_data_be_o_2 = memory_stage_io_data_be_o_2; // @[Core.scala 182:19]
  assign io_data_be_o_3 = memory_stage_io_data_be_o_3; // @[Core.scala 182:19]
  assign io_data_addr_o = memory_stage_io_memAddress; // @[Core.scala 185:20]
  assign io_data_wdata_o_0 = memory_stage_io_data_wdata_o_0; // @[Core.scala 184:21]
  assign io_data_wdata_o_1 = memory_stage_io_data_wdata_o_1; // @[Core.scala 184:21]
  assign io_data_wdata_o_2 = memory_stage_io_data_wdata_o_2; // @[Core.scala 184:21]
  assign io_data_wdata_o_3 = memory_stage_io_data_wdata_o_3; // @[Core.scala 184:21]
  assign io_instr_req_o = fetch_io_instr_req_o; // @[Core.scala 71:20]
  assign io_instr_addr_o = fetch_io_instr_addr_o; // @[Core.scala 72:20]
  assign io_reg_7 = decode_io_reg_7_out; // @[Core.scala 224:14]
  assign ID_EX_clock = clock;
  assign ID_EX_reset = reset;
  assign ID_EX_io_pc_in = decode_io_pc_out; // @[Core.scala 110:20]
  assign ID_EX_io_pc4_in = decode_io_pc4_out; // @[Core.scala 111:21]
  assign ID_EX_io_rs1_sel_in = decode_io_rs1_sel_out; // @[Core.scala 115:25]
  assign ID_EX_io_rs2_sel_in = decode_io_rs2_sel_out; // @[Core.scala 116:25]
  assign ID_EX_io_rs1_in = decode_io_rs1_out; // @[Core.scala 106:21]
  assign ID_EX_io_rs2_in = decode_io_rs2_out; // @[Core.scala 107:21]
  assign ID_EX_io_imm = decode_io_imm_out; // @[Core.scala 108:18]
  assign ID_EX_io_rd_sel_in = decode_io_rd_sel_out; // @[Core.scala 114:24]
  assign ID_EX_io_func3_in = decode_io_func3_out; // @[Core.scala 112:23]
  assign ID_EX_io_func7_in = decode_io_func7_out; // @[Core.scala 113:23]
  assign ID_EX_io_ctrl_MemWr_in = decode_io_ctrl_MemWr_out; // @[Core.scala 95:28]
  assign ID_EX_io_ctrl_MemRd_in = decode_io_ctrl_MemRd_out; // @[Core.scala 96:28]
  assign ID_EX_io_ctrl_RegWr_in = decode_io_ctrl_RegWr_out; // @[Core.scala 98:28]
  assign ID_EX_io_ctrl_MemToReg_in = decode_io_ctrl_MemToReg_out; // @[Core.scala 99:31]
  assign ID_EX_io_ctrl_AluOp_in = decode_io_ctrl_AluOp_out; // @[Core.scala 100:28]
  assign ID_EX_io_ctrl_OpA_sel_in = decode_io_ctrl_OpA_sel_out; // @[Core.scala 101:30]
  assign ID_EX_io_ctrl_OpB_sel_in = decode_io_ctrl_OpB_sel_out; // @[Core.scala 102:30]
  assign ID_EX_io_stall = memory_stage_io_stall; // @[Core.scala 94:20]
  assign EX_MEM_clock = clock;
  assign EX_MEM_reset = reset;
  assign EX_MEM_io_ctrl_MemWr_in = execute_io_ctrl_MemWr_out; // @[Core.scala 160:29]
  assign EX_MEM_io_ctrl_MemRd_in = execute_io_ctrl_MemRd_out; // @[Core.scala 161:29]
  assign EX_MEM_io_ctrl_RegWr_in = execute_io_ctrl_RegWr_out; // @[Core.scala 162:29]
  assign EX_MEM_io_ctrl_MemToReg_in = execute_io_ctrl_MemToReg_out; // @[Core.scala 163:32]
  assign EX_MEM_io_rs2_in = execute_io_rs2_out; // @[Core.scala 156:22]
  assign EX_MEM_io_rd_sel_in = execute_io_rd_sel_out; // @[Core.scala 154:25]
  assign EX_MEM_io_alu_in = execute_io_alu_output; // @[Core.scala 151:22]
  assign EX_MEM_io_EX_MEM_func3 = execute_io_func3_out; // @[Core.scala 157:32]
  assign EX_MEM_io_stall = memory_stage_io_stall; // @[Core.scala 149:21]
  assign MEM_WB_clock = clock;
  assign MEM_WB_reset = reset;
  assign MEM_WB_io_ctrl_RegWr_in = memory_stage_io_ctrl_RegWr_out; // @[Core.scala 204:29]
  assign MEM_WB_io_ctrl_MemToReg_in = memory_stage_io_ctrl_MemToReg_out; // @[Core.scala 206:32]
  assign MEM_WB_io_rd_sel_in = memory_stage_io_rd_sel_out; // @[Core.scala 202:25]
  assign MEM_WB_io_ctrl_MemRd_in = memory_stage_io_ctrl_MemRd_out; // @[Core.scala 205:29]
  assign MEM_WB_io_dmem_data_in = memory_stage_io_data_out; // @[Core.scala 200:28]
  assign MEM_WB_io_alu_in = memory_stage_io_alu_output; // @[Core.scala 198:22]
  assign MEM_WB_io_stall = memory_stage_io_stall; // @[Core.scala 197:21]
  assign fetch_clock = clock;
  assign fetch_reset = reset;
  assign fetch_io_instr_gnt_i = io_instr_gnt_i; // @[Core.scala 48:26]
  assign fetch_io_instr_rvalid_i = io_instr_rvalid_i; // @[Core.scala 49:29]
  assign fetch_io_instr_rdata_i = io_instr_rdata_i; // @[Core.scala 50:28 Core.scala 52:28]
  assign fetch_io_sb_imm = decode_io_sb_imm; // @[Core.scala 53:21]
  assign fetch_io_uj_imm = decode_io_uj_imm; // @[Core.scala 54:21]
  assign fetch_io_jalr_imm = decode_io_jalr_output; // @[Core.scala 55:23]
  assign fetch_io_ctrl_next_pc_sel = decode_io_ctrl_next_pc_sel_out; // @[Core.scala 56:31]
  assign fetch_io_ctrl_out_branch = decode_io_ctrl_Branch_out; // @[Core.scala 57:30]
  assign fetch_io_branchLogic_output = decode_io_branchLogic_output; // @[Core.scala 58:33]
  assign fetch_io_hazardDetection_pc_out = decode_io_hazardDetection_pc_out; // @[Core.scala 59:37]
  assign fetch_io_hazardDetection_inst_out = decode_io_hazardDetection_inst_out; // @[Core.scala 60:39]
  assign fetch_io_hazardDetection_current_pc_out = decode_io_hazardDetection_current_pc_out; // @[Core.scala 61:45]
  assign fetch_io_hazardDetection_pc_forward = decode_io_hazardDetection_pc_forward; // @[Core.scala 62:41]
  assign fetch_io_hazardDetection_inst_forward = decode_io_hazardDetection_inst_forward; // @[Core.scala 63:43]
  assign fetch_io_stall = memory_stage_io_stall; // @[Core.scala 46:20]
  assign decode_clock = clock;
  assign decode_reset = reset;
  assign decode_io_IF_ID_inst = fetch_io_inst_out; // @[Core.scala 75:26]
  assign decode_io_IF_ID_pc = fetch_io_pc_out; // @[Core.scala 76:24]
  assign decode_io_IF_ID_pc4 = fetch_io_pc4_out; // @[Core.scala 77:25]
  assign decode_io_MEM_WB_ctrl_regWr = MEM_WB_io_ctrl_RegWr_out; // @[Core.scala 78:33]
  assign decode_io_MEM_WB_rd_sel = MEM_WB_io_rd_sel_out; // @[Core.scala 79:29]
  assign decode_io_ID_EX_ctrl_MemRd = ID_EX_io_ctrl_MemRd_out; // @[Core.scala 80:32]
  assign decode_io_ID_EX_rd_sel = ID_EX_io_rd_sel_out; // @[Core.scala 81:28]
  assign decode_io_EX_MEM_rd_sel = EX_MEM_io_rd_sel_out; // @[Core.scala 82:29]
  assign decode_io_EX_MEM_ctrl_MemRd = EX_MEM_io_ctrl_MemRd_out; // @[Core.scala 83:33]
  assign decode_io_MEM_WB_ctrl_MemRd = MEM_WB_io_ctrl_MemRd_out; // @[Core.scala 84:33]
  assign decode_io_alu_output = execute_io_alu_output; // @[Core.scala 86:26]
  assign decode_io_EX_MEM_alu_output = EX_MEM_io_alu_output; // @[Core.scala 87:33]
  assign decode_io_dmem_memOut = io_data_rdata_i; // @[Core.scala 88:27]
  assign decode_io_writeback_write_data = writeback_io_write_data; // @[Core.scala 85:36]
  assign decode_io_execute_regwrite = ID_EX_io_ctrl_RegWr_out; // @[Core.scala 118:32]
  assign decode_io_mem_regwrite = EX_MEM_io_ctrl_RegWr_out; // @[Core.scala 119:32]
  assign decode_io_wb_regwrite = MEM_WB_io_ctrl_RegWr_out; // @[Core.scala 120:32]
  assign execute_io_EX_MEM_rd_sel = EX_MEM_io_rd_sel_out; // @[Core.scala 125:30]
  assign execute_io_MEM_WB_rd_sel = MEM_WB_io_rd_sel_out; // @[Core.scala 126:30]
  assign execute_io_ID_EX_rs1_sel = ID_EX_io_rs1_sel_out; // @[Core.scala 127:30]
  assign execute_io_ID_EX_rs2_sel = ID_EX_io_rs2_sel_out; // @[Core.scala 128:30]
  assign execute_io_EX_MEM_ctrl_RegWr = EX_MEM_io_ctrl_RegWr_out; // @[Core.scala 129:34]
  assign execute_io_MEM_WB_ctrl_RegWr = MEM_WB_io_ctrl_RegWr_out; // @[Core.scala 130:34]
  assign execute_io_ID_EX_ctrl_OpA_sel = ID_EX_io_ctrl_OpA_sel_out; // @[Core.scala 131:35]
  assign execute_io_ID_EX_ctrl_OpB_sel = ID_EX_io_ctrl_OpB_sel_out; // @[Core.scala 132:35]
  assign execute_io_ID_EX_pc4 = ID_EX_io_pc4_out; // @[Core.scala 133:26]
  assign execute_io_ID_EX_pc_out = ID_EX_io_pc_out; // @[Core.scala 124:30]
  assign execute_io_ID_EX_rs1 = ID_EX_io_rs1_out; // @[Core.scala 134:26]
  assign execute_io_ID_EX_rs2 = ID_EX_io_rs2_out; // @[Core.scala 135:26]
  assign execute_io_EX_MEM_alu_output = EX_MEM_io_alu_output; // @[Core.scala 136:34]
  assign execute_io_writeback_write_data = writeback_io_write_data; // @[Core.scala 137:37]
  assign execute_io_ID_EX_imm = ID_EX_io_imm_out; // @[Core.scala 138:26]
  assign execute_io_ID_EX_ctrl_AluOp = ID_EX_io_ctrl_AluOp_out; // @[Core.scala 139:33]
  assign execute_io_ID_EX_func7 = ID_EX_io_func7_out; // @[Core.scala 140:28]
  assign execute_io_ID_EX_func3 = ID_EX_io_func3_out; // @[Core.scala 141:28]
  assign execute_io_ID_EX_rd_sel = ID_EX_io_rd_sel_out; // @[Core.scala 142:29]
  assign execute_io_ID_EX_ctrl_MemWr = ID_EX_io_ctrl_MemWr_out; // @[Core.scala 143:33]
  assign execute_io_ID_EX_ctrl_MemRd = ID_EX_io_ctrl_MemRd_out; // @[Core.scala 144:33]
  assign execute_io_ID_EX_ctrl_RegWr = ID_EX_io_ctrl_RegWr_out; // @[Core.scala 145:33]
  assign execute_io_ID_EX_ctrl_MemToReg = ID_EX_io_ctrl_MemToReg_out; // @[Core.scala 146:36]
  assign memory_stage_io_EX_MEM_alu_output = EX_MEM_io_alu_output; // @[Core.scala 169:39]
  assign memory_stage_io_EX_MEM_rd_sel = EX_MEM_io_rd_sel_out; // @[Core.scala 170:35]
  assign memory_stage_io_EX_MEM_RegWr = EX_MEM_io_ctrl_RegWr_out; // @[Core.scala 171:34]
  assign memory_stage_io_EX_MEM_MemRd = EX_MEM_io_ctrl_MemRd_out; // @[Core.scala 172:34]
  assign memory_stage_io_EX_MEM_MemToReg = EX_MEM_io_ctrl_MemToReg_out; // @[Core.scala 173:37]
  assign memory_stage_io_EX_MEM_MemWr = EX_MEM_io_ctrl_MemWr_out; // @[Core.scala 174:34]
  assign memory_stage_io_EX_MEM_rs2 = EX_MEM_io_rs2_out; // @[Core.scala 175:32]
  assign memory_stage_io_func3 = EX_MEM_io_EX_MEM_func3_out; // @[Core.scala 176:32]
  assign memory_stage_io_data_gnt_i = io_data_gnt_i; // @[Core.scala 178:32]
  assign memory_stage_io_data_rvalid_i = io_data_rvalid_i; // @[Core.scala 179:35]
  assign memory_stage_io_data_rdata_i = io_data_rdata_i; // @[Core.scala 180:35]
  assign writeback_io_MEM_WB_MemToReg = MEM_WB_io_ctrl_MemToReg_out; // @[Core.scala 213:34]
  assign writeback_io_MEM_WB_dataMem_data = MEM_WB_io_dmem_data_out; // @[Core.scala 217:38]
  assign writeback_io_MEM_WB_alu_output = MEM_WB_io_alu_output; // @[Core.scala 218:36]
endmodule
module InstMem(
  input         clock,
  input  [13:0] io_instr_addr_i,
  output [31:0] io_instr_rdata_o
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:16383]; // @[InstMem.scala 12:24]
  initial begin
    $readmemh("/home/hadirkhan10/Desktop/ibtida-soc/verilog/rtl/program.hex", mem);
  end
  wire [31:0] mem__T_data; // @[InstMem.scala 12:24]
  wire [13:0] mem__T_addr; // @[InstMem.scala 12:24]
  reg [13:0] mem__T_addr_pipe_0;
  assign mem__T_addr = mem__T_addr_pipe_0;
  assign mem__T_data = mem[mem__T_addr]; // @[InstMem.scala 12:24]
  assign io_instr_rdata_o = mem__T_data; // @[InstMem.scala 17:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem__T_addr_pipe_0 = _RAND_1[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    mem__T_addr_pipe_0 <= io_instr_addr_i;
  end
endmodule
module DataMem(
  input         clock,
  input         io_we_i,
  input  [13:0] io_addr_i,
  input  [7:0]  io_wdata_i_0,
  input  [7:0]  io_wdata_i_1,
  input  [7:0]  io_wdata_i_2,
  input  [7:0]  io_wdata_i_3,
  input         io_wmask_i_0,
  input         io_wmask_i_1,
  input         io_wmask_i_2,
  input         io_wmask_i_3,
  output [7:0]  io_rdata_o_0,
  output [7:0]  io_rdata_o_1,
  output [7:0]  io_rdata_o_2,
  output [7:0]  io_rdata_o_3
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0 [0:16383]; // @[DataMem.scala 13:24]
  wire [7:0] mem_0__T_1_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_0__T_1_addr; // @[DataMem.scala 13:24]
  wire [7:0] mem_0__T_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_0__T_addr; // @[DataMem.scala 13:24]
  wire  mem_0__T_mask; // @[DataMem.scala 13:24]
  wire  mem_0__T_en; // @[DataMem.scala 13:24]
  reg  mem_0__T_1_en_pipe_0;
  reg [13:0] mem_0__T_1_addr_pipe_0;
  reg [7:0] mem_1 [0:16383]; // @[DataMem.scala 13:24]
  wire [7:0] mem_1__T_1_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_1__T_1_addr; // @[DataMem.scala 13:24]
  wire [7:0] mem_1__T_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_1__T_addr; // @[DataMem.scala 13:24]
  wire  mem_1__T_mask; // @[DataMem.scala 13:24]
  wire  mem_1__T_en; // @[DataMem.scala 13:24]
  reg  mem_1__T_1_en_pipe_0;
  reg [13:0] mem_1__T_1_addr_pipe_0;
  reg [7:0] mem_2 [0:16383]; // @[DataMem.scala 13:24]
  wire [7:0] mem_2__T_1_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_2__T_1_addr; // @[DataMem.scala 13:24]
  wire [7:0] mem_2__T_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_2__T_addr; // @[DataMem.scala 13:24]
  wire  mem_2__T_mask; // @[DataMem.scala 13:24]
  wire  mem_2__T_en; // @[DataMem.scala 13:24]
  reg  mem_2__T_1_en_pipe_0;
  reg [13:0] mem_2__T_1_addr_pipe_0;
  reg [7:0] mem_3 [0:16383]; // @[DataMem.scala 13:24]
  wire [7:0] mem_3__T_1_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_3__T_1_addr; // @[DataMem.scala 13:24]
  wire [7:0] mem_3__T_data; // @[DataMem.scala 13:24]
  wire [13:0] mem_3__T_addr; // @[DataMem.scala 13:24]
  wire  mem_3__T_mask; // @[DataMem.scala 13:24]
  wire  mem_3__T_en; // @[DataMem.scala 13:24]
  reg  mem_3__T_1_en_pipe_0;
  reg [13:0] mem_3__T_1_addr_pipe_0;
  assign mem_0__T_1_addr = mem_0__T_1_addr_pipe_0;
  assign mem_0__T_1_data = mem_0[mem_0__T_1_addr]; // @[DataMem.scala 13:24]
  assign mem_0__T_data = io_wdata_i_0;
  assign mem_0__T_addr = io_addr_i;
  assign mem_0__T_mask = io_wmask_i_0;
  assign mem_0__T_en = io_we_i;
  assign mem_1__T_1_addr = mem_1__T_1_addr_pipe_0;
  assign mem_1__T_1_data = mem_1[mem_1__T_1_addr]; // @[DataMem.scala 13:24]
  assign mem_1__T_data = io_wdata_i_1;
  assign mem_1__T_addr = io_addr_i;
  assign mem_1__T_mask = io_wmask_i_1;
  assign mem_1__T_en = io_we_i;
  assign mem_2__T_1_addr = mem_2__T_1_addr_pipe_0;
  assign mem_2__T_1_data = mem_2[mem_2__T_1_addr]; // @[DataMem.scala 13:24]
  assign mem_2__T_data = io_wdata_i_2;
  assign mem_2__T_addr = io_addr_i;
  assign mem_2__T_mask = io_wmask_i_2;
  assign mem_2__T_en = io_we_i;
  assign mem_3__T_1_addr = mem_3__T_1_addr_pipe_0;
  assign mem_3__T_1_data = mem_3[mem_3__T_1_addr]; // @[DataMem.scala 13:24]
  assign mem_3__T_data = io_wdata_i_3;
  assign mem_3__T_addr = io_addr_i;
  assign mem_3__T_mask = io_wmask_i_3;
  assign mem_3__T_en = io_we_i;
  assign io_rdata_o_0 = mem_0__T_1_data; // @[DataMem.scala 18:16]
  assign io_rdata_o_1 = mem_1__T_1_data; // @[DataMem.scala 18:16]
  assign io_rdata_o_2 = mem_2__T_1_data; // @[DataMem.scala 18:16]
  assign io_rdata_o_3 = mem_3__T_1_data; // @[DataMem.scala 18:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem_3[initvar] = _RAND_9[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0__T_1_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0__T_1_addr_pipe_0 = _RAND_2[13:0];
  _RAND_4 = {1{`RANDOM}};
  mem_1__T_1_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mem_1__T_1_addr_pipe_0 = _RAND_5[13:0];
  _RAND_7 = {1{`RANDOM}};
  mem_2__T_1_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mem_2__T_1_addr_pipe_0 = _RAND_8[13:0];
  _RAND_10 = {1{`RANDOM}};
  mem_3__T_1_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_3__T_1_addr_pipe_0 = _RAND_11[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(mem_0__T_en & mem_0__T_mask) begin
      mem_0[mem_0__T_addr] <= mem_0__T_data; // @[DataMem.scala 13:24]
    end
    if (io_we_i) begin
      mem_0__T_1_en_pipe_0 <= 1'h0;
    end else begin
      mem_0__T_1_en_pipe_0 <= 1'h1;
    end
    if (io_we_i ? 1'h0 : 1'h1) begin
      mem_0__T_1_addr_pipe_0 <= io_addr_i;
    end
    if(mem_1__T_en & mem_1__T_mask) begin
      mem_1[mem_1__T_addr] <= mem_1__T_data; // @[DataMem.scala 13:24]
    end
    if (io_we_i) begin
      mem_1__T_1_en_pipe_0 <= 1'h0;
    end else begin
      mem_1__T_1_en_pipe_0 <= 1'h1;
    end
    if (io_we_i ? 1'h0 : 1'h1) begin
      mem_1__T_1_addr_pipe_0 <= io_addr_i;
    end
    if(mem_2__T_en & mem_2__T_mask) begin
      mem_2[mem_2__T_addr] <= mem_2__T_data; // @[DataMem.scala 13:24]
    end
    if (io_we_i) begin
      mem_2__T_1_en_pipe_0 <= 1'h0;
    end else begin
      mem_2__T_1_en_pipe_0 <= 1'h1;
    end
    if (io_we_i ? 1'h0 : 1'h1) begin
      mem_2__T_1_addr_pipe_0 <= io_addr_i;
    end
    if(mem_3__T_en & mem_3__T_mask) begin
      mem_3[mem_3__T_addr] <= mem_3__T_data; // @[DataMem.scala 13:24]
    end
    if (io_we_i) begin
      mem_3__T_1_en_pipe_0 <= 1'h0;
    end else begin
      mem_3__T_1_en_pipe_0 <= 1'h1;
    end
    if (io_we_i ? 1'h0 : 1'h1) begin
      mem_3__T_1_addr_pipe_0 <= io_addr_i;
    end
  end
endmodule
module TL_HostAdapter(
  input         io_req_i,
  output        io_gnt_o,
  input  [31:0] io_addr_i,
  input         io_we_i,
  input  [31:0] io_wdata_i,
  input  [3:0]  io_be_i,
  output        io_valid_o,
  output [31:0] io_rdata_o,
  output        io_tl_o_a_valid,
  output [2:0]  io_tl_o_a_opcode,
  output [31:0] io_tl_o_a_address,
  output [3:0]  io_tl_o_a_mask,
  output [31:0] io_tl_o_a_data,
  input         io_tl_i_d_valid,
  input  [31:0] io_tl_i_d_data,
  input         io_tl_i_a_ready
);
  wire  _T_3 = &io_be_i; // @[TL_HostAdapter.scala 35:48]
  wire [2:0] _T_4 = _T_3 ? 3'h0 : 3'h1; // @[TL_HostAdapter.scala 35:39]
  assign io_gnt_o = io_tl_i_a_ready; // @[TL_HostAdapter.scala 44:12]
  assign io_valid_o = io_tl_i_d_valid; // @[TL_HostAdapter.scala 45:14]
  assign io_rdata_o = io_tl_i_d_data; // @[TL_HostAdapter.scala 46:14]
  assign io_tl_o_a_valid = io_req_i; // @[TL_HostAdapter.scala 24:21 TL_HostAdapter.scala 34:19]
  assign io_tl_o_a_opcode = io_we_i ? _T_4 : 3'h4; // @[TL_HostAdapter.scala 35:20]
  assign io_tl_o_a_address = {io_addr_i[31:2],2'h0}; // @[TL_HostAdapter.scala 40:21]
  assign io_tl_o_a_mask = io_we_i ? io_be_i : 4'hf; // @[TL_HostAdapter.scala 38:18]
  assign io_tl_o_a_data = io_wdata_i; // @[TL_HostAdapter.scala 41:18]
endmodule
module TL_Err(
  input         io_tl_i_a_valid,
  input  [2:0]  io_tl_i_a_opcode,
  input  [31:0] io_tl_i_a_address,
  input  [3:0]  io_tl_i_a_mask,
  output        io_err_o
);
  wire  op_get = io_tl_i_a_opcode == 3'h4; // @[TL_Err.scala 19:30]
  wire  op_partial = io_tl_i_a_opcode == 3'h1; // @[TL_Err.scala 20:34]
  wire  _T_5 = op_get | op_partial; // @[TL_Err.scala 23:28]
  wire  op_full = io_tl_i_a_opcode == 3'h0; // @[TL_Err.scala 21:31]
  wire  opcode_allowed = _T_5 | op_full; // @[TL_Err.scala 23:42]
  wire  _T_35 = |io_tl_i_a_address[1:0]; // @[TL_Err.scala 48:61]
  wire  _T_36 = ~_T_35; // @[TL_Err.scala 48:24]
  wire  addr_size_chk = io_tl_i_a_valid & _T_36; // @[TL_Err.scala 38:25]
  wire  _T_39 = addr_size_chk & io_tl_i_a_valid; // @[TL_Err.scala 58:37]
  wire  _T_38 = &io_tl_i_a_mask; // @[TL_Err.scala 50:43]
  wire  fulldata_chk = io_tl_i_a_valid & _T_38; // @[TL_Err.scala 38:25]
  wire  _T_41 = _T_5 | fulldata_chk; // @[TL_Err.scala 58:74]
  wire  a_config_allowed = _T_39 & _T_41; // @[TL_Err.scala 58:49]
  wire  _T = opcode_allowed & a_config_allowed; // @[TL_Err.scala 17:32]
  assign io_err_o = ~_T; // @[TL_Err.scala 17:12 TL_Err.scala 60:12]
endmodule
module TL_SramAdapter(
  input         clock,
  input         reset,
  input         io_tl_i_a_valid,
  input  [2:0]  io_tl_i_a_opcode,
  input  [31:0] io_tl_i_a_address,
  input  [3:0]  io_tl_i_a_mask,
  output        io_tl_o_d_valid,
  output [31:0] io_tl_o_d_data,
  output        io_tl_o_a_ready,
  output [13:0] io_addr_o,
  input  [31:0] io_rdata_i
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  tlErr_io_tl_i_a_valid; // @[TL_SramAdapter.scala 93:21]
  wire [2:0] tlErr_io_tl_i_a_opcode; // @[TL_SramAdapter.scala 93:21]
  wire [31:0] tlErr_io_tl_i_a_address; // @[TL_SramAdapter.scala 93:21]
  wire [3:0] tlErr_io_tl_i_a_mask; // @[TL_SramAdapter.scala 93:21]
  wire  tlErr_io_err_o; // @[TL_SramAdapter.scala 93:21]
  reg  outstanding; // @[TL_SramAdapter.scala 42:28]
  wire  a_ack = io_tl_i_a_valid & io_tl_o_a_ready; // @[TL_SramAdapter.scala 45:28]
  wire  _GEN_0 = io_tl_o_d_valid ? 1'h0 : outstanding; // @[TL_SramAdapter.scala 64:22]
  wire  _GEN_1 = a_ack | _GEN_0; // @[TL_SramAdapter.scala 58:15]
  TL_Err tlErr ( // @[TL_SramAdapter.scala 93:21]
    .io_tl_i_a_valid(tlErr_io_tl_i_a_valid),
    .io_tl_i_a_opcode(tlErr_io_tl_i_a_opcode),
    .io_tl_i_a_address(tlErr_io_tl_i_a_address),
    .io_tl_i_a_mask(tlErr_io_tl_i_a_mask),
    .io_err_o(tlErr_io_err_o)
  );
  assign io_tl_o_d_valid = outstanding; // @[TL_SramAdapter.scala 75:19]
  assign io_tl_o_d_data = io_rdata_i; // @[TL_SramAdapter.scala 81:18]
  assign io_tl_o_a_ready = 1'h1; // @[TL_SramAdapter.scala 74:19]
  assign io_addr_o = {io_tl_i_a_address[13:2],2'h0}; // @[TL_SramAdapter.scala 52:13]
  assign tlErr_io_tl_i_a_valid = io_tl_i_a_valid; // @[TL_SramAdapter.scala 94:17]
  assign tlErr_io_tl_i_a_opcode = io_tl_i_a_opcode; // @[TL_SramAdapter.scala 94:17]
  assign tlErr_io_tl_i_a_address = io_tl_i_a_address; // @[TL_SramAdapter.scala 94:17]
  assign tlErr_io_tl_i_a_mask = io_tl_i_a_mask; // @[TL_SramAdapter.scala 94:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  outstanding = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      outstanding <= 1'h0;
    end else begin
      outstanding <= _GEN_1;
    end
  end
endmodule
module TL_SramAdapter_1(
  input         clock,
  input         reset,
  input         io_tl_i_a_valid,
  input  [2:0]  io_tl_i_a_opcode,
  input  [31:0] io_tl_i_a_address,
  input  [3:0]  io_tl_i_a_mask,
  input  [31:0] io_tl_i_a_data,
  output        io_tl_o_d_valid,
  output [31:0] io_tl_o_d_data,
  output        io_tl_o_a_ready,
  output        io_we_o,
  output [13:0] io_addr_o,
  output [31:0] io_wdata_o,
  output        io_wmask_o_0,
  output        io_wmask_o_1,
  output        io_wmask_o_2,
  output        io_wmask_o_3,
  input  [31:0] io_rdata_i
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  tlErr_io_tl_i_a_valid; // @[TL_SramAdapter.scala 93:21]
  wire [2:0] tlErr_io_tl_i_a_opcode; // @[TL_SramAdapter.scala 93:21]
  wire [31:0] tlErr_io_tl_i_a_address; // @[TL_SramAdapter.scala 93:21]
  wire [3:0] tlErr_io_tl_i_a_mask; // @[TL_SramAdapter.scala 93:21]
  wire  tlErr_io_err_o; // @[TL_SramAdapter.scala 93:21]
  reg  error; // @[TL_SramAdapter.scala 29:22]
  reg  outstanding; // @[TL_SramAdapter.scala 42:28]
  wire  a_ack = io_tl_i_a_valid & io_tl_o_a_ready; // @[TL_SramAdapter.scala 45:28]
  wire  _T_2 = io_tl_i_a_opcode == 3'h0; // @[TL_SramAdapter.scala 48:41]
  wire  _T_3 = io_tl_i_a_opcode == 3'h1; // @[TL_SramAdapter.scala 48:91]
  wire  _T_4 = _T_2 | _T_3; // @[TL_SramAdapter.scala 48:70]
  wire  wr_req = a_ack & _T_4; // @[TL_SramAdapter.scala 48:19]
  wire  _T_30 = |io_tl_i_a_address[1:0]; // @[TL_SramAdapter.scala 87:46]
  wire  addr_align_err = wr_req & _T_30; // @[TL_SramAdapter.scala 86:16]
  wire  tl_err = tlErr_io_err_o; // @[TL_SramAdapter.scala 33:20 TL_SramAdapter.scala 95:10]
  wire  err_internal = addr_align_err | tl_err; // @[TL_SramAdapter.scala 84:34]
  wire  _T_8 = ~err_internal; // @[TL_SramAdapter.scala 51:24]
  wire  _GEN_0 = io_tl_o_d_valid ? 1'h0 : outstanding; // @[TL_SramAdapter.scala 64:22]
  wire  _GEN_1 = a_ack | _GEN_0; // @[TL_SramAdapter.scala 58:15]
  wire [31:0] _T_24 = error ? 32'hffffffff : io_rdata_i; // @[TL_SramAdapter.scala 69:17]
  TL_Err tlErr ( // @[TL_SramAdapter.scala 93:21]
    .io_tl_i_a_valid(tlErr_io_tl_i_a_valid),
    .io_tl_i_a_opcode(tlErr_io_tl_i_a_opcode),
    .io_tl_i_a_address(tlErr_io_tl_i_a_address),
    .io_tl_i_a_mask(tlErr_io_tl_i_a_mask),
    .io_err_o(tlErr_io_err_o)
  );
  assign io_tl_o_d_valid = outstanding; // @[TL_SramAdapter.scala 75:19]
  assign io_tl_o_d_data = outstanding ? _T_24 : 32'h0; // @[TL_SramAdapter.scala 81:18]
  assign io_tl_o_a_ready = ~outstanding; // @[TL_SramAdapter.scala 74:19]
  assign io_we_o = wr_req & _T_8; // @[TL_SramAdapter.scala 51:11]
  assign io_addr_o = {io_tl_i_a_address[13:2],2'h0}; // @[TL_SramAdapter.scala 52:13]
  assign io_wdata_o = io_tl_i_a_data; // @[TL_SramAdapter.scala 53:14]
  assign io_wmask_o_0 = io_tl_i_a_mask[0]; // @[TL_SramAdapter.scala 55:18]
  assign io_wmask_o_1 = io_tl_i_a_mask[1]; // @[TL_SramAdapter.scala 55:18]
  assign io_wmask_o_2 = io_tl_i_a_mask[2]; // @[TL_SramAdapter.scala 55:18]
  assign io_wmask_o_3 = io_tl_i_a_mask[3]; // @[TL_SramAdapter.scala 55:18]
  assign tlErr_io_tl_i_a_valid = io_tl_i_a_valid; // @[TL_SramAdapter.scala 94:17]
  assign tlErr_io_tl_i_a_opcode = io_tl_i_a_opcode; // @[TL_SramAdapter.scala 94:17]
  assign tlErr_io_tl_i_a_address = io_tl_i_a_address; // @[TL_SramAdapter.scala 94:17]
  assign tlErr_io_tl_i_a_mask = io_tl_i_a_mask; // @[TL_SramAdapter.scala 94:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  error = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  outstanding = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      error <= 1'h0;
    end else if (a_ack) begin
      error <= err_internal;
    end
    if (reset) begin
      outstanding <= 1'h0;
    end else begin
      outstanding <= _GEN_1;
    end
  end
endmodule
module IbtidaTop(
  input         clock,
  input         reset,
  output [31:0] io_result
);
  wire  core_clock; // @[IbtidaTop.scala 12:20]
  wire  core_reset; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_gnt_i; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_rvalid_i; // @[IbtidaTop.scala 12:20]
  wire [31:0] core_io_data_rdata_i; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_req_o; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_we_o; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_be_o_0; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_be_o_1; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_be_o_2; // @[IbtidaTop.scala 12:20]
  wire  core_io_data_be_o_3; // @[IbtidaTop.scala 12:20]
  wire [31:0] core_io_data_addr_o; // @[IbtidaTop.scala 12:20]
  wire [7:0] core_io_data_wdata_o_0; // @[IbtidaTop.scala 12:20]
  wire [7:0] core_io_data_wdata_o_1; // @[IbtidaTop.scala 12:20]
  wire [7:0] core_io_data_wdata_o_2; // @[IbtidaTop.scala 12:20]
  wire [7:0] core_io_data_wdata_o_3; // @[IbtidaTop.scala 12:20]
  wire  core_io_instr_gnt_i; // @[IbtidaTop.scala 12:20]
  wire  core_io_instr_rvalid_i; // @[IbtidaTop.scala 12:20]
  wire [31:0] core_io_instr_rdata_i; // @[IbtidaTop.scala 12:20]
  wire  core_io_instr_req_o; // @[IbtidaTop.scala 12:20]
  wire [31:0] core_io_instr_addr_o; // @[IbtidaTop.scala 12:20]
  wire [31:0] core_io_reg_7; // @[IbtidaTop.scala 12:20]
  wire  iccm_clock; // @[IbtidaTop.scala 13:20]
  wire [13:0] iccm_io_instr_addr_i; // @[IbtidaTop.scala 13:20]
  wire [31:0] iccm_io_instr_rdata_o; // @[IbtidaTop.scala 13:20]
  wire  dccm_clock; // @[IbtidaTop.scala 14:20]
  wire  dccm_io_we_i; // @[IbtidaTop.scala 14:20]
  wire [13:0] dccm_io_addr_i; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_wdata_i_0; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_wdata_i_1; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_wdata_i_2; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_wdata_i_3; // @[IbtidaTop.scala 14:20]
  wire  dccm_io_wmask_i_0; // @[IbtidaTop.scala 14:20]
  wire  dccm_io_wmask_i_1; // @[IbtidaTop.scala 14:20]
  wire  dccm_io_wmask_i_2; // @[IbtidaTop.scala 14:20]
  wire  dccm_io_wmask_i_3; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_rdata_o_0; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_rdata_o_1; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_rdata_o_2; // @[IbtidaTop.scala 14:20]
  wire [7:0] dccm_io_rdata_o_3; // @[IbtidaTop.scala 14:20]
  wire  core_iccm_tl_host_io_req_i; // @[IbtidaTop.scala 15:33]
  wire  core_iccm_tl_host_io_gnt_o; // @[IbtidaTop.scala 15:33]
  wire [31:0] core_iccm_tl_host_io_addr_i; // @[IbtidaTop.scala 15:33]
  wire  core_iccm_tl_host_io_we_i; // @[IbtidaTop.scala 15:33]
  wire [31:0] core_iccm_tl_host_io_wdata_i; // @[IbtidaTop.scala 15:33]
  wire [3:0] core_iccm_tl_host_io_be_i; // @[IbtidaTop.scala 15:33]
  wire  core_iccm_tl_host_io_valid_o; // @[IbtidaTop.scala 15:33]
  wire [31:0] core_iccm_tl_host_io_rdata_o; // @[IbtidaTop.scala 15:33]
  wire  core_iccm_tl_host_io_tl_o_a_valid; // @[IbtidaTop.scala 15:33]
  wire [2:0] core_iccm_tl_host_io_tl_o_a_opcode; // @[IbtidaTop.scala 15:33]
  wire [31:0] core_iccm_tl_host_io_tl_o_a_address; // @[IbtidaTop.scala 15:33]
  wire [3:0] core_iccm_tl_host_io_tl_o_a_mask; // @[IbtidaTop.scala 15:33]
  wire [31:0] core_iccm_tl_host_io_tl_o_a_data; // @[IbtidaTop.scala 15:33]
  wire  core_iccm_tl_host_io_tl_i_d_valid; // @[IbtidaTop.scala 15:33]
  wire [31:0] core_iccm_tl_host_io_tl_i_d_data; // @[IbtidaTop.scala 15:33]
  wire  core_iccm_tl_host_io_tl_i_a_ready; // @[IbtidaTop.scala 15:33]
  wire  core_dccm_tl_host_io_req_i; // @[IbtidaTop.scala 16:33]
  wire  core_dccm_tl_host_io_gnt_o; // @[IbtidaTop.scala 16:33]
  wire [31:0] core_dccm_tl_host_io_addr_i; // @[IbtidaTop.scala 16:33]
  wire  core_dccm_tl_host_io_we_i; // @[IbtidaTop.scala 16:33]
  wire [31:0] core_dccm_tl_host_io_wdata_i; // @[IbtidaTop.scala 16:33]
  wire [3:0] core_dccm_tl_host_io_be_i; // @[IbtidaTop.scala 16:33]
  wire  core_dccm_tl_host_io_valid_o; // @[IbtidaTop.scala 16:33]
  wire [31:0] core_dccm_tl_host_io_rdata_o; // @[IbtidaTop.scala 16:33]
  wire  core_dccm_tl_host_io_tl_o_a_valid; // @[IbtidaTop.scala 16:33]
  wire [2:0] core_dccm_tl_host_io_tl_o_a_opcode; // @[IbtidaTop.scala 16:33]
  wire [31:0] core_dccm_tl_host_io_tl_o_a_address; // @[IbtidaTop.scala 16:33]
  wire [3:0] core_dccm_tl_host_io_tl_o_a_mask; // @[IbtidaTop.scala 16:33]
  wire [31:0] core_dccm_tl_host_io_tl_o_a_data; // @[IbtidaTop.scala 16:33]
  wire  core_dccm_tl_host_io_tl_i_d_valid; // @[IbtidaTop.scala 16:33]
  wire [31:0] core_dccm_tl_host_io_tl_i_d_data; // @[IbtidaTop.scala 16:33]
  wire  core_dccm_tl_host_io_tl_i_a_ready; // @[IbtidaTop.scala 16:33]
  wire  iccm_tl_device_clock; // @[IbtidaTop.scala 17:30]
  wire  iccm_tl_device_reset; // @[IbtidaTop.scala 17:30]
  wire  iccm_tl_device_io_tl_i_a_valid; // @[IbtidaTop.scala 17:30]
  wire [2:0] iccm_tl_device_io_tl_i_a_opcode; // @[IbtidaTop.scala 17:30]
  wire [31:0] iccm_tl_device_io_tl_i_a_address; // @[IbtidaTop.scala 17:30]
  wire [3:0] iccm_tl_device_io_tl_i_a_mask; // @[IbtidaTop.scala 17:30]
  wire  iccm_tl_device_io_tl_o_d_valid; // @[IbtidaTop.scala 17:30]
  wire [31:0] iccm_tl_device_io_tl_o_d_data; // @[IbtidaTop.scala 17:30]
  wire  iccm_tl_device_io_tl_o_a_ready; // @[IbtidaTop.scala 17:30]
  wire [13:0] iccm_tl_device_io_addr_o; // @[IbtidaTop.scala 17:30]
  wire [31:0] iccm_tl_device_io_rdata_i; // @[IbtidaTop.scala 17:30]
  wire  dccm_tl_device_clock; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_reset; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_tl_i_a_valid; // @[IbtidaTop.scala 18:30]
  wire [2:0] dccm_tl_device_io_tl_i_a_opcode; // @[IbtidaTop.scala 18:30]
  wire [31:0] dccm_tl_device_io_tl_i_a_address; // @[IbtidaTop.scala 18:30]
  wire [3:0] dccm_tl_device_io_tl_i_a_mask; // @[IbtidaTop.scala 18:30]
  wire [31:0] dccm_tl_device_io_tl_i_a_data; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_tl_o_d_valid; // @[IbtidaTop.scala 18:30]
  wire [31:0] dccm_tl_device_io_tl_o_d_data; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_tl_o_a_ready; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_we_o; // @[IbtidaTop.scala 18:30]
  wire [13:0] dccm_tl_device_io_addr_o; // @[IbtidaTop.scala 18:30]
  wire [31:0] dccm_tl_device_io_wdata_o; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_wmask_o_0; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_wmask_o_1; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_wmask_o_2; // @[IbtidaTop.scala 18:30]
  wire  dccm_tl_device_io_wmask_o_3; // @[IbtidaTop.scala 18:30]
  wire [31:0] dccm_tl_device_io_rdata_i; // @[IbtidaTop.scala 18:30]
  wire [15:0] _T_6 = {core_io_data_wdata_o_1,core_io_data_wdata_o_0}; // @[IbtidaTop.scala 43:62]
  wire [15:0] _T_7 = {core_io_data_wdata_o_3,core_io_data_wdata_o_2}; // @[IbtidaTop.scala 43:62]
  wire [1:0] _T_9 = {core_io_data_be_o_1,core_io_data_be_o_0}; // @[Cat.scala 29:58]
  wire [1:0] _T_10 = {core_io_data_be_o_3,core_io_data_be_o_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_12 = {dccm_io_rdata_o_1,dccm_io_rdata_o_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_13 = {dccm_io_rdata_o_3,dccm_io_rdata_o_2}; // @[Cat.scala 29:58]
  Core core ( // @[IbtidaTop.scala 12:20]
    .clock(core_clock),
    .reset(core_reset),
    .io_data_gnt_i(core_io_data_gnt_i),
    .io_data_rvalid_i(core_io_data_rvalid_i),
    .io_data_rdata_i(core_io_data_rdata_i),
    .io_data_req_o(core_io_data_req_o),
    .io_data_we_o(core_io_data_we_o),
    .io_data_be_o_0(core_io_data_be_o_0),
    .io_data_be_o_1(core_io_data_be_o_1),
    .io_data_be_o_2(core_io_data_be_o_2),
    .io_data_be_o_3(core_io_data_be_o_3),
    .io_data_addr_o(core_io_data_addr_o),
    .io_data_wdata_o_0(core_io_data_wdata_o_0),
    .io_data_wdata_o_1(core_io_data_wdata_o_1),
    .io_data_wdata_o_2(core_io_data_wdata_o_2),
    .io_data_wdata_o_3(core_io_data_wdata_o_3),
    .io_instr_gnt_i(core_io_instr_gnt_i),
    .io_instr_rvalid_i(core_io_instr_rvalid_i),
    .io_instr_rdata_i(core_io_instr_rdata_i),
    .io_instr_req_o(core_io_instr_req_o),
    .io_instr_addr_o(core_io_instr_addr_o),
    .io_reg_7(core_io_reg_7)
  );
  InstMem iccm ( // @[IbtidaTop.scala 13:20]
    .clock(iccm_clock),
    .io_instr_addr_i(iccm_io_instr_addr_i),
    .io_instr_rdata_o(iccm_io_instr_rdata_o)
  );
  DataMem dccm ( // @[IbtidaTop.scala 14:20]
    .clock(dccm_clock),
    .io_we_i(dccm_io_we_i),
    .io_addr_i(dccm_io_addr_i),
    .io_wdata_i_0(dccm_io_wdata_i_0),
    .io_wdata_i_1(dccm_io_wdata_i_1),
    .io_wdata_i_2(dccm_io_wdata_i_2),
    .io_wdata_i_3(dccm_io_wdata_i_3),
    .io_wmask_i_0(dccm_io_wmask_i_0),
    .io_wmask_i_1(dccm_io_wmask_i_1),
    .io_wmask_i_2(dccm_io_wmask_i_2),
    .io_wmask_i_3(dccm_io_wmask_i_3),
    .io_rdata_o_0(dccm_io_rdata_o_0),
    .io_rdata_o_1(dccm_io_rdata_o_1),
    .io_rdata_o_2(dccm_io_rdata_o_2),
    .io_rdata_o_3(dccm_io_rdata_o_3)
  );
  TL_HostAdapter core_iccm_tl_host ( // @[IbtidaTop.scala 15:33]
    .io_req_i(core_iccm_tl_host_io_req_i),
    .io_gnt_o(core_iccm_tl_host_io_gnt_o),
    .io_addr_i(core_iccm_tl_host_io_addr_i),
    .io_we_i(core_iccm_tl_host_io_we_i),
    .io_wdata_i(core_iccm_tl_host_io_wdata_i),
    .io_be_i(core_iccm_tl_host_io_be_i),
    .io_valid_o(core_iccm_tl_host_io_valid_o),
    .io_rdata_o(core_iccm_tl_host_io_rdata_o),
    .io_tl_o_a_valid(core_iccm_tl_host_io_tl_o_a_valid),
    .io_tl_o_a_opcode(core_iccm_tl_host_io_tl_o_a_opcode),
    .io_tl_o_a_address(core_iccm_tl_host_io_tl_o_a_address),
    .io_tl_o_a_mask(core_iccm_tl_host_io_tl_o_a_mask),
    .io_tl_o_a_data(core_iccm_tl_host_io_tl_o_a_data),
    .io_tl_i_d_valid(core_iccm_tl_host_io_tl_i_d_valid),
    .io_tl_i_d_data(core_iccm_tl_host_io_tl_i_d_data),
    .io_tl_i_a_ready(core_iccm_tl_host_io_tl_i_a_ready)
  );
  TL_HostAdapter core_dccm_tl_host ( // @[IbtidaTop.scala 16:33]
    .io_req_i(core_dccm_tl_host_io_req_i),
    .io_gnt_o(core_dccm_tl_host_io_gnt_o),
    .io_addr_i(core_dccm_tl_host_io_addr_i),
    .io_we_i(core_dccm_tl_host_io_we_i),
    .io_wdata_i(core_dccm_tl_host_io_wdata_i),
    .io_be_i(core_dccm_tl_host_io_be_i),
    .io_valid_o(core_dccm_tl_host_io_valid_o),
    .io_rdata_o(core_dccm_tl_host_io_rdata_o),
    .io_tl_o_a_valid(core_dccm_tl_host_io_tl_o_a_valid),
    .io_tl_o_a_opcode(core_dccm_tl_host_io_tl_o_a_opcode),
    .io_tl_o_a_address(core_dccm_tl_host_io_tl_o_a_address),
    .io_tl_o_a_mask(core_dccm_tl_host_io_tl_o_a_mask),
    .io_tl_o_a_data(core_dccm_tl_host_io_tl_o_a_data),
    .io_tl_i_d_valid(core_dccm_tl_host_io_tl_i_d_valid),
    .io_tl_i_d_data(core_dccm_tl_host_io_tl_i_d_data),
    .io_tl_i_a_ready(core_dccm_tl_host_io_tl_i_a_ready)
  );
  TL_SramAdapter iccm_tl_device ( // @[IbtidaTop.scala 17:30]
    .clock(iccm_tl_device_clock),
    .reset(iccm_tl_device_reset),
    .io_tl_i_a_valid(iccm_tl_device_io_tl_i_a_valid),
    .io_tl_i_a_opcode(iccm_tl_device_io_tl_i_a_opcode),
    .io_tl_i_a_address(iccm_tl_device_io_tl_i_a_address),
    .io_tl_i_a_mask(iccm_tl_device_io_tl_i_a_mask),
    .io_tl_o_d_valid(iccm_tl_device_io_tl_o_d_valid),
    .io_tl_o_d_data(iccm_tl_device_io_tl_o_d_data),
    .io_tl_o_a_ready(iccm_tl_device_io_tl_o_a_ready),
    .io_addr_o(iccm_tl_device_io_addr_o),
    .io_rdata_i(iccm_tl_device_io_rdata_i)
  );
  TL_SramAdapter_1 dccm_tl_device ( // @[IbtidaTop.scala 18:30]
    .clock(dccm_tl_device_clock),
    .reset(dccm_tl_device_reset),
    .io_tl_i_a_valid(dccm_tl_device_io_tl_i_a_valid),
    .io_tl_i_a_opcode(dccm_tl_device_io_tl_i_a_opcode),
    .io_tl_i_a_address(dccm_tl_device_io_tl_i_a_address),
    .io_tl_i_a_mask(dccm_tl_device_io_tl_i_a_mask),
    .io_tl_i_a_data(dccm_tl_device_io_tl_i_a_data),
    .io_tl_o_d_valid(dccm_tl_device_io_tl_o_d_valid),
    .io_tl_o_d_data(dccm_tl_device_io_tl_o_d_data),
    .io_tl_o_a_ready(dccm_tl_device_io_tl_o_a_ready),
    .io_we_o(dccm_tl_device_io_we_o),
    .io_addr_o(dccm_tl_device_io_addr_o),
    .io_wdata_o(dccm_tl_device_io_wdata_o),
    .io_wmask_o_0(dccm_tl_device_io_wmask_o_0),
    .io_wmask_o_1(dccm_tl_device_io_wmask_o_1),
    .io_wmask_o_2(dccm_tl_device_io_wmask_o_2),
    .io_wmask_o_3(dccm_tl_device_io_wmask_o_3),
    .io_rdata_i(dccm_tl_device_io_rdata_i)
  );

  assign io_result = core_io_reg_7; // @[IbtidaTop.scala 64:13]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_data_gnt_i = core_dccm_tl_host_io_gnt_o; // @[IbtidaTop.scala 59:22]
  assign core_io_data_rvalid_i = core_dccm_tl_host_io_valid_o; // @[IbtidaTop.scala 60:25]
  assign core_io_data_rdata_i = core_dccm_tl_host_io_rdata_o; // @[IbtidaTop.scala 61:24]
  assign core_io_instr_gnt_i = core_iccm_tl_host_io_gnt_o; // @[IbtidaTop.scala 35:23]
  assign core_io_instr_rvalid_i = core_iccm_tl_host_io_valid_o; // @[IbtidaTop.scala 36:26]
  assign core_io_instr_rdata_i = core_iccm_tl_host_io_rdata_o; // @[IbtidaTop.scala 34:25]
  assign iccm_clock = clock;
  assign iccm_io_instr_addr_i = {{2'd0}, iccm_tl_device_io_addr_o[13:2]}; // @[IbtidaTop.scala 31:24]
  assign dccm_clock = clock;
  assign dccm_io_we_i = dccm_tl_device_io_we_o; // @[IbtidaTop.scala 56:16]
  assign dccm_io_addr_i = {{2'd0}, dccm_tl_device_io_addr_o[13:2]}; // @[IbtidaTop.scala 50:18]
  assign dccm_io_wdata_i_0 = dccm_tl_device_io_wdata_o[7:0]; // @[IbtidaTop.scala 52:22]
  assign dccm_io_wdata_i_1 = dccm_tl_device_io_wdata_o[15:8]; // @[IbtidaTop.scala 53:22]
  assign dccm_io_wdata_i_2 = dccm_tl_device_io_wdata_o[23:16]; // @[IbtidaTop.scala 54:22]
  assign dccm_io_wdata_i_3 = dccm_tl_device_io_wdata_o[31:24]; // @[IbtidaTop.scala 55:22]
  assign dccm_io_wmask_i_0 = dccm_tl_device_io_wmask_o_0; // @[IbtidaTop.scala 57:19]
  assign dccm_io_wmask_i_1 = dccm_tl_device_io_wmask_o_1; // @[IbtidaTop.scala 57:19]
  assign dccm_io_wmask_i_2 = dccm_tl_device_io_wmask_o_2; // @[IbtidaTop.scala 57:19]
  assign dccm_io_wmask_i_3 = dccm_tl_device_io_wmask_o_3; // @[IbtidaTop.scala 57:19]
  assign core_iccm_tl_host_io_req_i = core_io_instr_req_o; // @[IbtidaTop.scala 22:30]
  assign core_iccm_tl_host_io_addr_i = core_io_instr_addr_o; // @[IbtidaTop.scala 23:31]
  assign core_iccm_tl_host_io_we_i = 1'h0; // @[IbtidaTop.scala 24:29]
  assign core_iccm_tl_host_io_wdata_i = 32'h0; // @[IbtidaTop.scala 25:32]
  assign core_iccm_tl_host_io_be_i = 4'hf; // @[IbtidaTop.scala 26:29]
  assign core_iccm_tl_host_io_tl_i_d_valid = iccm_tl_device_io_tl_o_d_valid; // @[IbtidaTop.scala 29:29]
  assign core_iccm_tl_host_io_tl_i_d_data = iccm_tl_device_io_tl_o_d_data; // @[IbtidaTop.scala 29:29]
  assign core_iccm_tl_host_io_tl_i_a_ready = 1'h1; // @[IbtidaTop.scala 29:29]
  assign core_dccm_tl_host_io_req_i = core_io_data_req_o; // @[IbtidaTop.scala 40:30]
  assign core_dccm_tl_host_io_addr_i = core_io_data_addr_o; // @[IbtidaTop.scala 41:31]
  assign core_dccm_tl_host_io_we_i = core_io_data_we_o; // @[IbtidaTop.scala 42:29]
  assign core_dccm_tl_host_io_wdata_i = {_T_7,_T_6}; // @[IbtidaTop.scala 43:32]
  assign core_dccm_tl_host_io_be_i = {_T_10,_T_9}; // @[IbtidaTop.scala 44:29]
  assign core_dccm_tl_host_io_tl_i_d_valid = dccm_tl_device_io_tl_o_d_valid; // @[IbtidaTop.scala 47:29]
  assign core_dccm_tl_host_io_tl_i_d_data = dccm_tl_device_io_tl_o_d_data; // @[IbtidaTop.scala 47:29]
  assign core_dccm_tl_host_io_tl_i_a_ready = dccm_tl_device_io_tl_o_a_ready; // @[IbtidaTop.scala 47:29]
  assign iccm_tl_device_clock = clock;
  assign iccm_tl_device_reset = reset;
  assign iccm_tl_device_io_tl_i_a_valid = core_iccm_tl_host_io_tl_o_a_valid; // @[IbtidaTop.scala 28:26]
  assign iccm_tl_device_io_tl_i_a_opcode = core_iccm_tl_host_io_tl_o_a_opcode; // @[IbtidaTop.scala 28:26]
  assign iccm_tl_device_io_tl_i_a_address = core_iccm_tl_host_io_tl_o_a_address; // @[IbtidaTop.scala 28:26]
  assign iccm_tl_device_io_tl_i_a_mask = core_iccm_tl_host_io_tl_o_a_mask; // @[IbtidaTop.scala 28:26]
  assign iccm_tl_device_io_rdata_i = iccm_io_instr_rdata_o; // @[IbtidaTop.scala 32:29]
  assign dccm_tl_device_clock = clock;
  assign dccm_tl_device_reset = reset;
  assign dccm_tl_device_io_tl_i_a_valid = core_dccm_tl_host_io_tl_o_a_valid; // @[IbtidaTop.scala 46:26]
  assign dccm_tl_device_io_tl_i_a_opcode = core_dccm_tl_host_io_tl_o_a_opcode; // @[IbtidaTop.scala 46:26]
  assign dccm_tl_device_io_tl_i_a_address = core_dccm_tl_host_io_tl_o_a_address; // @[IbtidaTop.scala 46:26]
  assign dccm_tl_device_io_tl_i_a_mask = core_dccm_tl_host_io_tl_o_a_mask; // @[IbtidaTop.scala 46:26]
  assign dccm_tl_device_io_tl_i_a_data = core_dccm_tl_host_io_tl_o_a_data; // @[IbtidaTop.scala 46:26]
  assign dccm_tl_device_io_rdata_i = {_T_13,_T_12}; // @[IbtidaTop.scala 48:29]
endmodule