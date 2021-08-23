module ibex_alu(
  input         clock,
  input         reset,
  input  [5:0]  io_operator_i,
  input  [31:0] io_operand_a_i,
  input  [31:0] io_operand_b_i,
  input         io_instr_first_cycle_i,
  output [31:0] io_adder_result_o,
  output [33:0] io_adder_result_ext_o,
  output [31:0] io_result_o,
  output        io_comparison_result_o
);
  wire  adder_op_b_negate = 6'h1c == io_operator_i | (6'h1b == io_operator_i | (6'h1a == io_operator_i | (6'h19 ==
    io_operator_i | (6'h26 == io_operator_i | (6'h25 == io_operator_i | (6'h14 == io_operator_i | (6'h13 ==
    io_operator_i | (6'h16 == io_operator_i | (6'h15 == io_operator_i | (6'h18 == io_operator_i | (6'h17 ==
    io_operator_i | 6'h1 == io_operator_i))))))))))); // @[Mux.scala 80:57]
  wire [32:0] adder_in_a = {io_operand_a_i,1'h1}; // @[Cat.scala 30:58]
  wire [32:0] _operand_b_neg_T = {io_operand_b_i,1'h0}; // @[Cat.scala 30:58]
  wire [32:0] operand_b_neg = _operand_b_neg_T ^ 33'h1ffffffff; // @[ibex_alu.scala 73:53]
  wire [32:0] adder_in_b = adder_op_b_negate ? operand_b_neg : _operand_b_neg_T; // @[ibex_alu.scala 74:38 ibex_alu.scala 75:16 ibex_alu.scala 77:16]
  wire [32:0] _io_adder_result_ext_o_T_1 = adder_in_a + adder_in_b; // @[ibex_alu.scala 81:39]
  wire [31:0] adder_result = io_adder_result_ext_o[32:1]; // @[ibex_alu.scala 82:40]
  wire  cmp_signed = 6'h1b == io_operator_i | (6'h19 == io_operator_i | (6'h25 == io_operator_i | (6'h13 ==
    io_operator_i | 6'h15 == io_operator_i))); // @[Mux.scala 80:57]
  wire  is_equal = adder_result == 32'h0; // @[ibex_alu.scala 102:29]
  wire  is_greater_equal = ~(io_operand_a_i[31] ^ io_operand_b_i[31]) ? ~adder_result[31] : io_operand_a_i[31] ^
    cmp_signed; // @[ibex_alu.scala 106:63 ibex_alu.scala 107:22 ibex_alu.scala 109:22]
  wire  _cmp_result_T_3 = ~is_equal; // @[ibex_alu.scala 117:24]
  wire  _cmp_result_T_9 = ~is_greater_equal; // @[ibex_alu.scala 122:24]
  wire  _cmp_result_T_23 = 6'h18 == io_operator_i ? _cmp_result_T_3 : is_equal; // @[Mux.scala 80:57]
  wire  _cmp_result_T_25 = 6'h15 == io_operator_i ? is_greater_equal : _cmp_result_T_23; // @[Mux.scala 80:57]
  wire  _cmp_result_T_27 = 6'h16 == io_operator_i ? is_greater_equal : _cmp_result_T_25; // @[Mux.scala 80:57]
  wire  _cmp_result_T_29 = 6'h1b == io_operator_i ? is_greater_equal : _cmp_result_T_27; // @[Mux.scala 80:57]
  wire  _cmp_result_T_31 = 6'h1c == io_operator_i ? is_greater_equal : _cmp_result_T_29; // @[Mux.scala 80:57]
  wire  _cmp_result_T_33 = 6'h13 == io_operator_i ? _cmp_result_T_9 : _cmp_result_T_31; // @[Mux.scala 80:57]
  wire  _cmp_result_T_35 = 6'h14 == io_operator_i ? _cmp_result_T_9 : _cmp_result_T_33; // @[Mux.scala 80:57]
  wire  _cmp_result_T_37 = 6'h19 == io_operator_i ? _cmp_result_T_9 : _cmp_result_T_35; // @[Mux.scala 80:57]
  wire  _cmp_result_T_39 = 6'h1a == io_operator_i ? _cmp_result_T_9 : _cmp_result_T_37; // @[Mux.scala 80:57]
  wire  _cmp_result_T_41 = 6'h25 == io_operator_i ? _cmp_result_T_9 : _cmp_result_T_39; // @[Mux.scala 80:57]
  wire  cmp_result = 6'h26 == io_operator_i ? _cmp_result_T_9 : _cmp_result_T_41; // @[Mux.scala 80:57]
  wire [5:0] shift = io_operand_b_i[5:0]; // @[ibex_alu.scala 136:35]
  wire [94:0] _GEN_2 = {{63'd0}, io_operand_a_i}; // @[ibex_alu.scala 140:41]
  wire [94:0] _shift_result_T_2 = _GEN_2 << shift; // @[ibex_alu.scala 140:41]
  wire [31:0] _shift_result_T_6 = $signed(io_operand_a_i) >>> shift; // @[ibex_alu.scala 141:66]
  wire [31:0] _shift_result_T_8 = io_operand_a_i >> shift; // @[ibex_alu.scala 142:41]
  wire [94:0] _shift_result_T_10 = 6'ha == io_operator_i ? _shift_result_T_2 : 95'h0; // @[Mux.scala 80:57]
  wire [94:0] _shift_result_T_12 = 6'h8 == io_operator_i ? {{63'd0}, _shift_result_T_6} : _shift_result_T_10; // @[Mux.scala 80:57]
  wire [94:0] _shift_result_T_14 = 6'h9 == io_operator_i ? {{63'd0}, _shift_result_T_8} : _shift_result_T_12; // @[Mux.scala 80:57]
  wire [31:0] _bwlogic_result_T_2 = io_operand_a_i & io_operand_b_i; // @[ibex_alu.scala 152:41]
  wire [31:0] _bwlogic_result_T_4 = io_operand_a_i | io_operand_b_i; // @[ibex_alu.scala 153:40]
  wire [31:0] _bwlogic_result_T_6 = io_operand_a_i ^ io_operand_b_i; // @[ibex_alu.scala 154:41]
  wire [31:0] _bwlogic_result_T_8 = 6'h4 == io_operator_i ? _bwlogic_result_T_2 : 32'h0; // @[Mux.scala 80:57]
  wire [31:0] _bwlogic_result_T_10 = 6'h3 == io_operator_i ? _bwlogic_result_T_4 : _bwlogic_result_T_8; // @[Mux.scala 80:57]
  wire [31:0] bwlogic_result = 6'h2 == io_operator_i ? _bwlogic_result_T_6 : _bwlogic_result_T_10; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_13 = {31'h0,cmp_result}; // @[Cat.scala 30:58]
  wire [31:0] _io_result_o_T_29 = 6'h2 == io_operator_i ? bwlogic_result : 32'h0; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_31 = 6'h5 == io_operator_i ? bwlogic_result : _io_result_o_T_29; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_33 = 6'h3 == io_operator_i ? bwlogic_result : _io_result_o_T_31; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_35 = 6'h6 == io_operator_i ? bwlogic_result : _io_result_o_T_33; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_37 = 6'h4 == io_operator_i ? bwlogic_result : _io_result_o_T_35; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_39 = 6'h7 == io_operator_i ? bwlogic_result : _io_result_o_T_37; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_41 = 6'h0 == io_operator_i ? adder_result : _io_result_o_T_39; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_43 = 6'h1 == io_operator_i ? adder_result : _io_result_o_T_41; // @[Mux.scala 80:57]
  wire [31:0] shift_result = _shift_result_T_14[31:0]; // @[ibex_alu.scala 135:32 ibex_alu.scala 139:16]
  wire [31:0] _io_result_o_T_45 = 6'ha == io_operator_i ? shift_result : _io_result_o_T_43; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_47 = 6'h9 == io_operator_i ? shift_result : _io_result_o_T_45; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_49 = 6'h8 == io_operator_i ? shift_result : _io_result_o_T_47; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_51 = 6'h17 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_49; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_53 = 6'h18 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_51; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_55 = 6'h15 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_53; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_57 = 6'h16 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_55; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_59 = 6'h13 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_57; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_61 = 6'h14 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_59; // @[Mux.scala 80:57]
  wire [31:0] _io_result_o_T_63 = 6'h25 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_61; // @[Mux.scala 80:57]
  assign io_adder_result_o = io_adder_result_ext_o[32:1]; // @[ibex_alu.scala 82:40]
  assign io_adder_result_ext_o = {{1'd0}, _io_adder_result_ext_o_T_1}; // @[ibex_alu.scala 81:39]
  assign io_result_o = 6'h26 == io_operator_i ? _io_result_o_T_13 : _io_result_o_T_63; // @[Mux.scala 80:57]
  assign io_comparison_result_o = 6'h26 == io_operator_i ? _cmp_result_T_9 : _cmp_result_T_41; // @[Mux.scala 80:57]
endmodule
