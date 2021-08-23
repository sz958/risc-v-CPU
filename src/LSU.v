module LSU(
  input         clock,
  input         reset,
  input  [31:0] io_addr_i,
  input         io_write_enable,
  input  [31:0] io_data_w_i,
  input         io_read_req,
  output [31:0] io_data_r_o,
  output        io_lsu_busy,
  output        io_data_vaild,
  output [31:0] io_addr_o,
  output        io_data_w_req,
  output [31:0] io_data_w_o,
  output        io_data_r_req,
  input  [31:0] io_data_r_i,
  input         io_read_data_vaild
);
  assign io_data_r_o = io_data_r_i; // @[LSU.scala 30:15]
  assign io_lsu_busy = io_data_r_req & ~io_read_data_vaild; // @[LSU.scala 33:32]
  assign io_data_vaild = io_read_data_vaild; // @[LSU.scala 31:17]
  assign io_addr_o = io_addr_i; // @[LSU.scala 25:13]
  assign io_data_w_req = io_write_enable; // @[LSU.scala 26:17]
  assign io_data_w_o = io_data_w_i; // @[LSU.scala 27:15]
  assign io_data_r_req = io_read_req; // @[LSU.scala 29:17]
endmodule
