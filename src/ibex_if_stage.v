    module InstructionMem(
  input         clock,
  input  [31:0] io_PC,
  input         io_req_i,
  input         io_fetch_ready_i,
  output        io_fetch_valid_o,
  output [31:0] io_fetch_rdata_o,
  output [31:0] io_fetch_addr_o,
  output        io_busy_o
);
//BindsTo_0_InstructionMem Binds(
//    .clock(clock),
//    .io_PC(io_PC),
//    .io_req_i(io_req_i),
//    .io_fetch_ready_i(io_fetch_ready_i),
//    .io_fetch_valid_o(io_fetch_valid_o),
//    .io_fetch_rdata_o(io_fetch_rdata_o),
//    .io_fetch_addr_o(io_fetch_addr_o),
//    .io_busy_o(io_busy_o)
//);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:1023]; // @[InstructionMem.scala 20:16]
  wire [7:0] mem_io_fetch_rdata_o_hi_hi_data; // @[InstructionMem.scala 20:16]
  wire [6:0] mem_io_fetch_rdata_o_hi_hi_addr; // @[InstructionMem.scala 20:16]
  wire [7:0] mem_io_fetch_rdata_o_hi_lo_data; // @[InstructionMem.scala 20:16]
  wire [6:0] mem_io_fetch_rdata_o_hi_lo_addr; // @[InstructionMem.scala 20:16]
  wire [7:0] mem_io_fetch_rdata_o_lo_hi_data; // @[InstructionMem.scala 20:16]
  wire [6:0] mem_io_fetch_rdata_o_lo_hi_addr; // @[InstructionMem.scala 20:16]
  wire [7:0] mem_io_fetch_rdata_o_lo_lo_data; // @[InstructionMem.scala 20:16]
  wire [6:0] mem_io_fetch_rdata_o_lo_lo_addr; // @[InstructionMem.scala 20:16]
  wire [31:0] _io_fetch_rdata_o_T_2 = io_PC + 32'h1; // @[InstructionMem.scala 25:49]
  wire [31:0] _io_fetch_rdata_o_T_5 = io_PC + 32'h2; // @[InstructionMem.scala 25:67]
  wire [31:0] _io_fetch_rdata_o_T_8 = io_PC + 32'h3; // @[InstructionMem.scala 25:85]
  wire [15:0] io_fetch_rdata_o_lo = {mem_io_fetch_rdata_o_lo_hi_data,mem_io_fetch_rdata_o_lo_lo_data}; // @[Cat.scala 30:58]
  wire [15:0] io_fetch_rdata_o_hi = {mem_io_fetch_rdata_o_hi_hi_data,mem_io_fetch_rdata_o_hi_lo_data}; // @[Cat.scala 30:58]
  /////////////////////
//  always@ (posedge clock) begin
//    mem[0]<=8'h93;
//    mem[1]<=8'h00;
//    mem[2]<=8'h10;
//    mem[3]<=8'h00;
//    mem[3]<=8'h93;
//    mem[2]<=8'h00;
//    mem[1]<=8'h10;
//    mem[0]<=8'h00;
//    mem[3]<=8'h93;
//    mem[2]<=8'h00;
//    mem[1]<=8'h10;
//    mem[0]<=8'h00;
//  end

initial begin
  //$readmemh("./src/test/MemoryofInstruction.txt", InstructionMem.mem);F:\CPU
  $readmemh("F:/CPU/MemoryofInstruction.txt", InstructionMem.mem);
end
  ////////////////////
  assign mem_io_fetch_rdata_o_hi_hi_addr = io_PC[6:0];
  assign mem_io_fetch_rdata_o_hi_hi_data = mem[mem_io_fetch_rdata_o_hi_hi_addr]; // @[InstructionMem.scala 20:16]
  assign mem_io_fetch_rdata_o_hi_lo_addr = _io_fetch_rdata_o_T_2[6:0];  
  assign mem_io_fetch_rdata_o_hi_lo_data = mem[mem_io_fetch_rdata_o_hi_lo_addr]; // @[InstructionMem.scala 20:16]
  assign mem_io_fetch_rdata_o_lo_hi_addr = _io_fetch_rdata_o_T_5[6:0];
  assign mem_io_fetch_rdata_o_lo_hi_data = mem[mem_io_fetch_rdata_o_lo_hi_addr]; // @[InstructionMem.scala 20:16]
  assign mem_io_fetch_rdata_o_lo_lo_addr = _io_fetch_rdata_o_T_8[6:0];
  assign mem_io_fetch_rdata_o_lo_lo_data = mem[mem_io_fetch_rdata_o_lo_lo_addr]; // @[InstructionMem.scala 20:16]
 // assign io_fetch_valid_o = io_req_i & io_fetch_ready_i; // @[InstructionMem.scala 27:18]
 assign io_fetch_valid_o = 1;
  assign io_fetch_rdata_o = {io_fetch_rdata_o_hi,io_fetch_rdata_o_lo}; // @[Cat.scala 30:58]
  assign io_fetch_addr_o = io_PC; // @[InstructionMem.scala 23:19]
  assign io_busy_o = io_req_i & io_fetch_ready_i ? 1'h0 : 1'h1; // @[InstructionMem.scala 27:50 InstructionMem.scala 29:15 InstructionMem.scala 32:15]
// Register and memory initialization
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
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

module ibex_if_stage(
  input         clock,
  input         reset,
  input         io_req_i,
  input  [31:0] io_boot_addr_i,
  output        io_instr_valid_id_o,
  output [31:0] io_instr_rdata_id_o,
  output [31:0] io_instr_rdata_alu_id_o,
  output [31:0] io_pc_if_o,
  output [31:0] io_pc_id_o,
  input         io_instr_valid_clear_i,
  input         io_pc_set_i,
  input  [2:0]  io_pc_mux_i,
  input  [31:0] io_branch_target_ex_i,
  input         io_id_in_ready_i,
  output        io_if_busy_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  instruction_mem_clock; // @[ibex_if_stage.scala 60:31]
  wire [31:0] instruction_mem_io_PC; // @[ibex_if_stage.scala 60:31]
  wire  instruction_mem_io_req_i; // @[ibex_if_stage.scala 60:31]
  wire  instruction_mem_io_fetch_ready_i; // @[ibex_if_stage.scala 60:31]
  wire  instruction_mem_io_fetch_valid_o; // @[ibex_if_stage.scala 60:31]
  wire [31:0] instruction_mem_io_fetch_rdata_o; // @[ibex_if_stage.scala 60:31]
  wire [31:0] instruction_mem_io_fetch_addr_o; // @[ibex_if_stage.scala 60:31]
  wire  instruction_mem_io_busy_o; // @[ibex_if_stage.scala 60:31]
  wire [23:0] fetch_addr_n_hi = io_boot_addr_i[31:8]; // @[ibex_if_stage.scala 54:69]
  wire [31:0] _fetch_addr_n_T_1 = {fetch_addr_n_hi,8'h80}; // @[Cat.scala 30:58]
  wire [31:0] _fetch_addr_n_T_6 = 3'h0 == io_pc_mux_i ? _fetch_addr_n_T_1 : _fetch_addr_n_T_1; // @[Mux.scala 80:57]
  wire  fetch_valid = instruction_mem_io_fetch_valid_o; // @[ibex_if_stage.scala 41:31 ibex_if_stage.scala 66:15]
  wire  _tmp1_T = fetch_valid & io_id_in_ready_i; // @[ibex_if_stage.scala 78:35]
  wire  tmp1 = fetch_valid & io_id_in_ready_i & ~io_pc_set_i; // @[ibex_if_stage.scala 78:54]
  reg  instr_valid_id_q_REG; // @[ibex_if_stage.scala 94:30]
  wire  tmp2 = instr_valid_id_q_REG & ~io_instr_valid_clear_i; // @[ibex_if_stage.scala 81:28]
  wire  instr_valid_id_d = tmp1 | tmp2; // @[ibex_if_stage.scala 82:38]
  reg [31:0] io_instr_rdata_id_o_REG; // @[ibex_if_stage.scala 102:35]
  reg [31:0] io_instr_rdata_alu_id_o_REG; // @[ibex_if_stage.scala 104:39]
  reg [31:0] io_pc_id_o_REG; // @[ibex_if_stage.scala 105:26]
  InstructionMem instruction_mem ( // @[ibex_if_stage.scala 60:31]
    .clock(instruction_mem_clock),
    .io_PC(instruction_mem_io_PC),
    .io_req_i(instruction_mem_io_req_i),
    .io_fetch_ready_i(instruction_mem_io_fetch_ready_i),
    .io_fetch_valid_o(instruction_mem_io_fetch_valid_o),
    .io_fetch_rdata_o(instruction_mem_io_fetch_rdata_o),
    .io_fetch_addr_o(instruction_mem_io_fetch_addr_o),
    .io_busy_o(instruction_mem_io_busy_o)
  );
 // assign io_instr_valid_id_o = instr_valid_id_q_REG; // @[ibex_if_stage.scala 35:36 ibex_if_stage.scala 94:20]
 assign io_instr_valid_id_o = 1;
  assign io_instr_rdata_id_o = _tmp1_T ? io_instr_rdata_id_o_REG : 32'h0; // @[ibex_if_stage.scala 101:27 ibex_if_stage.scala 102:25 ibex_if_stage.scala 96:23]
  assign io_instr_rdata_alu_id_o = _tmp1_T ? io_instr_rdata_alu_id_o_REG : 32'h0; // @[ibex_if_stage.scala 101:27 ibex_if_stage.scala 104:29 ibex_if_stage.scala 97:27]
  assign io_pc_if_o = instruction_mem_io_fetch_addr_o; // @[ibex_if_stage.scala 43:30 ibex_if_stage.scala 65:14]
  assign io_pc_id_o = _tmp1_T ? io_pc_id_o_REG : 32'h0; // @[ibex_if_stage.scala 101:27 ibex_if_stage.scala 105:16 ibex_if_stage.scala 98:14]
  assign io_if_busy_o = instruction_mem_io_busy_o; // @[ibex_if_stage.scala 37:40 ibex_if_stage.scala 67:24]
  assign instruction_mem_clock = clock;
  assign instruction_mem_io_PC = 3'h1 == io_pc_mux_i ? io_branch_target_ex_i : _fetch_addr_n_T_6; // @[Mux.scala 80:57]
  assign instruction_mem_io_req_i = io_req_i; // @[ibex_if_stage.scala 62:28]
  assign instruction_mem_io_fetch_ready_i = io_id_in_ready_i; // @[ibex_if_stage.scala 63:36]
  

  always @(posedge clock) begin
    instr_valid_id_q_REG <= reset & instr_valid_id_d; // @[ibex_if_stage.scala 94:30 ibex_if_stage.scala 94:30 ibex_if_stage.scala 94:30]
    io_instr_rdata_id_o_REG <= instruction_mem_io_fetch_rdata_o; // @[ibex_if_stage.scala 51:29 ibex_if_stage.scala 68:13]
    io_instr_rdata_alu_id_o_REG <= instruction_mem_io_fetch_rdata_o; // @[ibex_if_stage.scala 51:29 ibex_if_stage.scala 68:13]
    io_pc_id_o_REG <= io_pc_if_o; // @[ibex_if_stage.scala 105:26]
  end
// Register and memory initialization
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
  instr_valid_id_q_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_instr_rdata_id_o_REG = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  io_instr_rdata_alu_id_o_REG = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  io_pc_id_o_REG = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
