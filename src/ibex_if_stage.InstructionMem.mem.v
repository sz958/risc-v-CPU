//module BindsTo_0_InstructionMem(
//  input         clock,
//  input  [31:0] io_PC ,
//  input         io_req_i,
//  input         io_fetch_ready_i,
//  output        io_fetch_valid_o,
//  output [31:0] io_fetch_rdata_o,
//  output [31:0] io_fetch_addr_o,
//  output        io_busy_o
//);

//initial begin
//  //$readmemh("./src/test/MemoryofInstruction.txt", InstructionMem.mem);F:\CPU
//  $readmemh("F:\\CPU\\MemoryofInstruction.txt", InstructionMem.mem);
//end
//                      endmodule

//bind InstructionMem BindsTo_0_InstructionMem BindsTo_0_InstructionMem_Inst(.*);