module ibex_decoder(
  input         io_instr_first_cycle_i,
  input  [31:0] io_instr_rdata_i,
  input  [31:0] io_instr_rdata_alu_i,
  output [2:0]  io_imm_b_mux_sel_o,
  output [31:0] io_imm_i_type_o,
  output [31:0] io_imm_s_type_o,
  output [31:0] io_imm_b_type_o,
  output [31:0] io_imm_u_type_o,
  output [31:0] io_imm_j_type_o,
  output        io_rf_we_o,
  output [4:0]  io_rf_raddr_a_o,
  output [4:0]  io_rf_raddr_b_o,
  output [4:0]  io_rf_waddr_o,
  output        io_rf_ren_a_o,
  output        io_rf_ren_b_o,
  output [5:0]  io_alu_operator_o,
  output [1:0]  io_alu_op_a_mux_sel_o,
  output        io_alu_op_b_mux_sel_o,
  output        io_data_req_o,
  output        io_data_we_o,
  output        io_branch_in_dec_o
);
  wire [19:0] io_imm_i_type_o_hi = io_instr_rdata_i[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [11:0] io_imm_i_type_o_lo = io_instr_rdata_i[31:20]; // @[ibex_decoder.scala 106:52]
  wire [6:0] io_imm_s_type_o_hi_lo = io_instr_rdata_i[31:25]; // @[ibex_decoder.scala 107:52]
  wire [4:0] io_imm_s_type_o_lo = io_instr_rdata_i[11:7]; // @[ibex_decoder.scala 107:67]
  wire [26:0] io_imm_s_type_o_hi = {io_imm_i_type_o_hi,io_imm_s_type_o_hi_lo}; // @[Cat.scala 30:58]
  wire [18:0] io_imm_b_type_o_hi_hi_hi = io_instr_rdata_i[31] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_b_type_o_hi_lo = io_instr_rdata_i[7]; // @[ibex_decoder.scala 108:63]
  wire [5:0] io_imm_b_type_o_lo_hi_hi = io_instr_rdata_i[30:25]; // @[ibex_decoder.scala 108:73]
  wire [3:0] io_imm_b_type_o_lo_hi_lo = io_instr_rdata_i[11:8]; // @[ibex_decoder.scala 108:88]
  wire [10:0] io_imm_b_type_o_lo = {io_imm_b_type_o_lo_hi_hi,io_imm_b_type_o_lo_hi_lo,1'h0}; // @[Cat.scala 30:58]
  wire [20:0] io_imm_b_type_o_hi = {io_imm_b_type_o_hi_hi_hi,io_instr_rdata_i[31],io_imm_b_type_o_hi_lo}; // @[Cat.scala 30:58]
  wire [19:0] io_imm_u_type_o_hi = io_instr_rdata_i[31:12]; // @[ibex_decoder.scala 109:31]
  wire [11:0] io_imm_j_type_o_hi_hi_hi = io_instr_rdata_i[31] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_imm_j_type_o_hi_hi_lo = io_instr_rdata_i[19:12]; // @[ibex_decoder.scala 110:52]
  wire  io_imm_j_type_o_hi_lo = io_instr_rdata_i[20]; // @[ibex_decoder.scala 110:67]
  wire [9:0] io_imm_j_type_o_lo_hi = io_instr_rdata_i[30:21]; // @[ibex_decoder.scala 110:78]
  wire [10:0] io_imm_j_type_o_lo = {io_imm_j_type_o_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [20:0] io_imm_j_type_o_hi = {io_imm_j_type_o_hi_hi_hi,io_imm_j_type_o_hi_hi_lo,io_imm_j_type_o_hi_lo}; // @[Cat.scala 30:58]
  wire [6:0] opcode = io_instr_rdata_i[6:0]; // @[ibex_decoder.scala 159:29]
  wire  _T_2 = 7'h6f == opcode; // @[Conditional.scala 37:30]
  wire  _GEN_0 = io_instr_first_cycle_i ? 1'h0 : 1'h1; // @[ibex_decoder.scala 168:38 ibex_decoder.scala 170:17 ibex_decoder.scala 174:17]
  wire  _T_5 = 7'h67 == opcode; // @[Conditional.scala 37:30]
  wire  _T_8 = 7'h63 == opcode; // @[Conditional.scala 37:30]
  wire  _T_11 = 7'h23 == opcode; // @[Conditional.scala 37:30]
  wire  _T_14 = 7'h3 == opcode; // @[Conditional.scala 37:30]
  wire  _T_17 = 7'h37 == opcode; // @[Conditional.scala 37:30]
  wire  _T_20 = 7'h17 == opcode; // @[Conditional.scala 37:30]
  wire  _T_23 = 7'h13 == opcode; // @[Conditional.scala 37:30]
  wire  _T_26 = 7'h33 == opcode; // @[Conditional.scala 37:30]
  wire  _GEN_3 = _T_23 | _T_26; // @[Conditional.scala 39:67 ibex_decoder.scala 298:23]
  wire  _GEN_4 = _T_23 ? 1'h0 : _T_26; // @[Conditional.scala 39:67 ibex_decoder.scala 146:19]
  wire  _GEN_5 = _T_20 | _GEN_3; // @[Conditional.scala 39:67 ibex_decoder.scala 295:15]
  wire  _GEN_6 = _T_20 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67 ibex_decoder.scala 145:19]
  wire  _GEN_7 = _T_20 ? 1'h0 : _GEN_4; // @[Conditional.scala 39:67 ibex_decoder.scala 146:19]
  wire  _GEN_8 = _T_17 | _GEN_5; // @[Conditional.scala 39:67 ibex_decoder.scala 292:15]
  wire  _GEN_9 = _T_17 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67 ibex_decoder.scala 145:19]
  wire  _GEN_10 = _T_17 ? 1'h0 : _GEN_7; // @[Conditional.scala 39:67 ibex_decoder.scala 146:19]
  wire  _GEN_11 = _T_14 | _GEN_9; // @[Conditional.scala 39:67 ibex_decoder.scala 261:23]
  wire  _GEN_14 = _T_14 ? 1'h0 : _GEN_8; // @[Conditional.scala 39:67 ibex_decoder.scala 144:11]
  wire  _GEN_15 = _T_14 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67 ibex_decoder.scala 146:19]
  wire  _GEN_16 = _T_11 | _GEN_11; // @[Conditional.scala 39:67 ibex_decoder.scala 234:23]
  wire  _GEN_17 = _T_11 | _GEN_15; // @[Conditional.scala 39:67 ibex_decoder.scala 235:23]
  wire  _GEN_18 = _T_11 | _T_14; // @[Conditional.scala 39:67 ibex_decoder.scala 236:23]
  wire  _GEN_21 = _T_11 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67 ibex_decoder.scala 144:11]
  wire  _GEN_23 = _T_8 | _GEN_16; // @[Conditional.scala 39:67 ibex_decoder.scala 225:23]
  wire  _GEN_24 = _T_8 | _GEN_17; // @[Conditional.scala 39:67 ibex_decoder.scala 226:23]
  wire  _GEN_25 = _T_8 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67 ibex_decoder.scala 151:19]
  wire  _GEN_26 = _T_8 ? 1'h0 : _T_11; // @[Conditional.scala 39:67 ibex_decoder.scala 148:18]
  wire  _GEN_28 = _T_8 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67 ibex_decoder.scala 144:11]
  wire  _GEN_30 = _T_5 ? _GEN_0 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_5 | _GEN_23; // @[Conditional.scala 39:67 ibex_decoder.scala 193:23]
  wire  _GEN_32 = _T_5 ? 1'h0 : _T_8; // @[Conditional.scala 39:67 ibex_decoder.scala 140:24]
  wire  _GEN_33 = _T_5 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67 ibex_decoder.scala 146:19]
  wire  _GEN_34 = _T_5 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67 ibex_decoder.scala 151:19]
  wire  _GEN_35 = _T_5 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67 ibex_decoder.scala 148:18]
  wire [2:0] _GEN_45 = io_instr_first_cycle_i ? 3'h4 : 3'h5; // @[ibex_decoder.scala 525:38 ibex_decoder.scala 527:30 ibex_decoder.scala 530:30]
  wire [1:0] _GEN_46 = io_instr_first_cycle_i ? 2'h0 : 2'h2; // @[ibex_decoder.scala 538:38 ibex_decoder.scala 540:33 ibex_decoder.scala 544:33]
  wire [2:0] _GEN_47 = io_instr_first_cycle_i ? 3'h0 : 3'h5; // @[ibex_decoder.scala 538:38 ibex_decoder.scala 541:30 ibex_decoder.scala 545:30]
  wire  _T_37 = 3'h0 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire  _T_38 = 3'h1 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire  _T_39 = 3'h4 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire  _T_40 = 3'h5 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire  _T_41 = 3'h6 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire  _T_42 = 3'h7 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire [5:0] _GEN_48 = _T_42 ? 6'h16 : 6'h26; // @[Conditional.scala 39:67 ibex_decoder.scala 569:31 ibex_decoder.scala 497:23]
  wire [5:0] _GEN_49 = _T_41 ? 6'h14 : _GEN_48; // @[Conditional.scala 39:67 ibex_decoder.scala 566:31]
  wire [5:0] _GEN_50 = _T_40 ? 6'h15 : _GEN_49; // @[Conditional.scala 39:67 ibex_decoder.scala 563:31]
  wire [5:0] _GEN_51 = _T_39 ? 6'h13 : _GEN_50; // @[Conditional.scala 39:67 ibex_decoder.scala 560:31]
  wire [5:0] _GEN_52 = _T_38 ? 6'h18 : _GEN_51; // @[Conditional.scala 39:67 ibex_decoder.scala 557:31]
  wire [5:0] _GEN_53 = _T_37 ? 6'h17 : _GEN_52; // @[Conditional.scala 40:58 ibex_decoder.scala 554:31]
  wire [5:0] _GEN_55 = io_instr_first_cycle_i ? _GEN_53 : 6'h0; // @[ibex_decoder.scala 576:38 ibex_decoder.scala 586:29]
  wire  _T_62 = 3'h2 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire  _T_63 = 3'h3 == io_instr_rdata_alu_i[14:12]; // @[Conditional.scala 37:30]
  wire [5:0] _GEN_57 = io_instr_rdata_alu_i[31:27] == 5'h8 ? 6'h8 : 6'h26; // @[ibex_decoder.scala 664:59 ibex_decoder.scala 665:33 ibex_decoder.scala 497:23]
  wire [5:0] _GEN_58 = io_instr_rdata_alu_i[31:27] == 5'h0 ? 6'h9 : _GEN_57; // @[ibex_decoder.scala 662:53 ibex_decoder.scala 663:33]
  wire [5:0] _GEN_59 = _T_40 ? _GEN_58 : 6'h26; // @[Conditional.scala 39:67 ibex_decoder.scala 497:23]
  wire [5:0] _GEN_60 = _T_38 ? 6'ha : _GEN_59; // @[Conditional.scala 39:67 ibex_decoder.scala 659:31]
  wire [5:0] _GEN_61 = _T_42 ? 6'h4 : _GEN_60; // @[Conditional.scala 39:67 ibex_decoder.scala 656:31]
  wire [5:0] _GEN_62 = _T_41 ? 6'h3 : _GEN_61; // @[Conditional.scala 39:67 ibex_decoder.scala 653:31]
  wire [5:0] _GEN_63 = _T_39 ? 6'h2 : _GEN_62; // @[Conditional.scala 39:67 ibex_decoder.scala 650:31]
  wire [5:0] _GEN_64 = _T_63 ? 6'h26 : _GEN_63; // @[Conditional.scala 39:67 ibex_decoder.scala 647:31]
  wire [5:0] _GEN_65 = _T_62 ? 6'h25 : _GEN_64; // @[Conditional.scala 39:67 ibex_decoder.scala 644:31]
  wire [5:0] _GEN_66 = _T_37 ? 6'h0 : _GEN_65; // @[Conditional.scala 40:58 ibex_decoder.scala 641:31]
  wire [6:0] io_alu_operator_o_hi = io_instr_rdata_alu_i[31:25]; // @[ibex_decoder.scala 676:64]
  wire [9:0] _io_alu_operator_o_T = {io_alu_operator_o_hi,io_instr_rdata_alu_i[14:12]}; // @[Cat.scala 30:58]
  wire [5:0] _io_alu_operator_o_T_26 = 10'h2 == _io_alu_operator_o_T ? 6'h25 : {{5'd0}, 10'h100 == _io_alu_operator_o_T}
    ; // @[Mux.scala 80:57]
  wire [5:0] _io_alu_operator_o_T_28 = 10'h3 == _io_alu_operator_o_T ? 6'h26 : _io_alu_operator_o_T_26; // @[Mux.scala 80:57]
  wire [5:0] _io_alu_operator_o_T_30 = 10'h4 == _io_alu_operator_o_T ? 6'h2 : _io_alu_operator_o_T_28; // @[Mux.scala 80:57]
  wire [5:0] _io_alu_operator_o_T_32 = 10'h6 == _io_alu_operator_o_T ? 6'h3 : _io_alu_operator_o_T_30; // @[Mux.scala 80:57]
  wire [5:0] _io_alu_operator_o_T_34 = 10'h7 == _io_alu_operator_o_T ? 6'h4 : _io_alu_operator_o_T_32; // @[Mux.scala 80:57]
  wire [5:0] _io_alu_operator_o_T_36 = 10'h1 == _io_alu_operator_o_T ? 6'ha : _io_alu_operator_o_T_34; // @[Mux.scala 80:57]
  wire [5:0] _io_alu_operator_o_T_38 = 10'h5 == _io_alu_operator_o_T ? 6'h9 : _io_alu_operator_o_T_36; // @[Mux.scala 80:57]
  wire [5:0] _io_alu_operator_o_T_40 = 10'h105 == _io_alu_operator_o_T ? 6'h8 : _io_alu_operator_o_T_38; // @[Mux.scala 80:57]
  wire [5:0] _GEN_67 = ~io_instr_rdata_alu_i[26] ? _io_alu_operator_o_T_40 : 6'h26; // @[ibex_decoder.scala 675:30 ibex_decoder.scala 676:29 ibex_decoder.scala 497:23]
  wire [1:0] _GEN_68 = _T_26 ? 2'h0 : 2'h3; // @[Conditional.scala 39:67 ibex_decoder.scala 672:31 ibex_decoder.scala 498:27]
  wire  _GEN_69 = _T_26 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67 ibex_decoder.scala 673:31 ibex_decoder.scala 499:27]
  wire [5:0] _GEN_70 = _T_26 ? _GEN_67 : 6'h26; // @[Conditional.scala 39:67 ibex_decoder.scala 497:23]
  wire [1:0] _GEN_71 = _T_23 ? 2'h0 : _GEN_68; // @[Conditional.scala 39:67 ibex_decoder.scala 635:31]
  wire  _GEN_72 = _T_23 | _GEN_69; // @[Conditional.scala 39:67 ibex_decoder.scala 636:31]
  wire [5:0] _GEN_74 = _T_23 ? _GEN_66 : _GEN_70; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_75 = _T_20 ? 2'h2 : _GEN_71; // @[Conditional.scala 39:67 ibex_decoder.scala 628:31]
  wire  _GEN_76 = _T_20 | _GEN_72; // @[Conditional.scala 39:67 ibex_decoder.scala 629:31]
  wire [1:0] _GEN_77 = _T_20 ? 2'h3 : 2'h0; // @[Conditional.scala 39:67 ibex_decoder.scala 630:28]
  wire [5:0] _GEN_78 = _T_20 ? 6'h0 : _GEN_74; // @[Conditional.scala 39:67 ibex_decoder.scala 631:27]
  wire [1:0] _GEN_79 = _T_17 ? 2'h3 : _GEN_75; // @[Conditional.scala 39:67 ibex_decoder.scala 620:31]
  wire  _GEN_80 = _T_17 | _GEN_76; // @[Conditional.scala 39:67 ibex_decoder.scala 621:31]
  wire [1:0] _GEN_82 = _T_17 ? 2'h3 : _GEN_77; // @[Conditional.scala 39:67 ibex_decoder.scala 623:28]
  wire [5:0] _GEN_83 = _T_17 ? 6'h0 : _GEN_78; // @[Conditional.scala 39:67 ibex_decoder.scala 624:27]
  wire [1:0] _GEN_84 = _T_14 ? 2'h0 : _GEN_79; // @[Conditional.scala 39:67 ibex_decoder.scala 607:31]
  wire [5:0] _GEN_85 = _T_14 ? 6'h0 : _GEN_83; // @[Conditional.scala 39:67 ibex_decoder.scala 610:27]
  wire  _GEN_86 = _T_14 ? 1'h0 : _GEN_80; // @[Conditional.scala 39:67 ibex_decoder.scala 611:31]
  wire [1:0] _GEN_87 = _T_14 ? 2'h0 : _GEN_82; // @[Conditional.scala 39:67 ibex_decoder.scala 612:28]
  wire [1:0] _GEN_89 = _T_11 ? 2'h0 : _GEN_84; // @[Conditional.scala 39:67 ibex_decoder.scala 595:31]
  wire  _GEN_90 = _T_11 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_91 = _T_11 ? 6'h0 : _GEN_85; // @[Conditional.scala 39:67 ibex_decoder.scala 597:27]
  wire [1:0] _GEN_92 = _T_11 ? 2'h0 : _GEN_87; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_94 = _T_8 ? _GEN_55 : _GEN_91; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_95 = _T_8 ? _GEN_46 : _GEN_89; // @[Conditional.scala 39:67]
  wire  _GEN_96 = _T_8 ? _GEN_0 : _GEN_90; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_97 = _T_8 ? 3'h0 : {{1'd0}, _GEN_92}; // @[Conditional.scala 39:67]
  wire  _GEN_99 = _T_5 | _GEN_96; // @[Conditional.scala 39:67 ibex_decoder.scala 536:31]
  wire [5:0] _GEN_100 = _T_5 ? 6'h0 : _GEN_94; // @[Conditional.scala 39:67 ibex_decoder.scala 537:27]
  wire [1:0] _GEN_101 = _T_5 ? _GEN_46 : _GEN_95; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_102 = _T_5 ? _GEN_47 : _GEN_97; // @[Conditional.scala 39:67]
  assign io_imm_b_mux_sel_o = _T_2 ? _GEN_45 : _GEN_102; // @[Conditional.scala 40:58]
  assign io_imm_i_type_o = {io_imm_i_type_o_hi,io_imm_i_type_o_lo}; // @[Cat.scala 30:58]
  assign io_imm_s_type_o = {io_imm_s_type_o_hi,io_imm_s_type_o_lo}; // @[Cat.scala 30:58]
  assign io_imm_b_type_o = {io_imm_b_type_o_hi,io_imm_b_type_o_lo}; // @[Cat.scala 30:58]
  assign io_imm_u_type_o = {io_imm_u_type_o_hi,12'h0}; // @[Cat.scala 30:58]
  assign io_imm_j_type_o = {io_imm_j_type_o_hi,io_imm_j_type_o_lo}; // @[Cat.scala 30:58]
  assign io_rf_we_o = _T_2 ? _GEN_0 : _GEN_30; // @[Conditional.scala 40:58]
  assign io_rf_raddr_a_o = io_instr_rdata_i[19:15]; // @[ibex_decoder.scala 117:21]
  assign io_rf_raddr_b_o = io_instr_rdata_i[24:20]; // @[ibex_decoder.scala 118:21]
  assign io_rf_waddr_o = io_instr_rdata_i[11:7]; // @[ibex_decoder.scala 124:20]
  assign io_rf_ren_a_o = _T_2 ? 1'h0 : _GEN_31; // @[Conditional.scala 40:58 ibex_decoder.scala 145:19]
  assign io_rf_ren_b_o = _T_2 ? 1'h0 : _GEN_33; // @[Conditional.scala 40:58 ibex_decoder.scala 146:19]
  assign io_alu_operator_o = _T_2 ? 6'h0 : _GEN_100; // @[Conditional.scala 40:58 ibex_decoder.scala 524:27]
  assign io_alu_op_a_mux_sel_o = _T_2 ? 2'h2 : _GEN_101; // @[Conditional.scala 40:58 ibex_decoder.scala 522:31]
  assign io_alu_op_b_mux_sel_o = _T_2 | _GEN_99; // @[Conditional.scala 40:58 ibex_decoder.scala 523:31]
  assign io_data_req_o = _T_2 ? 1'h0 : _GEN_34; // @[Conditional.scala 40:58 ibex_decoder.scala 151:19]
  assign io_data_we_o = _T_2 ? 1'h0 : _GEN_35; // @[Conditional.scala 40:58 ibex_decoder.scala 148:18]
  assign io_branch_in_dec_o = _T_2 ? 1'h0 : _GEN_32; // @[Conditional.scala 40:58 ibex_decoder.scala 140:24]
endmodule


/////////////////////////////////////////////
module ibex_controller(
  input        clock,
  input        reset,
  output       io_instr_valid_clear_o,
  output       io_id_in_ready_o,
  output       io_controller_run_o,
  output       io_instr_req_o,
  output       io_pc_set_o,
  output [2:0] io_pc_mux_o,
  input        io_branch_set_i,
  input        io_stall_id_i
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  reset_n = ~reset; // @[ibex_controller.scala 145:45]

  reg [1:0] ctrl_fsm_cs_REG; // @[ibex_controller.scala 149:12]
  wire  _T_2 = 2'h0 == ctrl_fsm_cs_REG; // @[Conditional.scala 37:30]
  wire  _T_5 = 2'h1 == ctrl_fsm_cs_REG; // @[Conditional.scala 37:30]
  wire  _T_8 = 2'h2 == ctrl_fsm_cs_REG; // @[Conditional.scala 37:30]
  wire  _T_11 = 2'h3 == ctrl_fsm_cs_REG; // @[Conditional.scala 37:30]
  wire  _GEN_4 = _T_8 | _T_11; // @[Conditional.scala 39:67 ibex_controller.scala 94:26]
  wire  _GEN_6 = _T_8 ? 1'h0 : _T_11; // @[Conditional.scala 39:67 ibex_controller.scala 69:25]
  wire  _GEN_7 = _T_8 ? 1'h0 : _T_11 & io_branch_set_i; // @[Conditional.scala 39:67 ibex_controller.scala 63:17]
  wire  _GEN_8 = _T_5 | _GEN_4; // @[Conditional.scala 39:67 ibex_controller.scala 86:26]
  wire  _GEN_9 = _T_5 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67 ibex_controller.scala 87:23]
  wire  _GEN_10 = _T_5 | _GEN_7; // @[Conditional.scala 39:67 ibex_controller.scala 88:23]
  wire  _GEN_13 = _T_2 ? 1'h0 : _GEN_9; // @[Conditional.scala 40:58 ibex_controller.scala 79:23]
  assign io_instr_valid_clear_o = ~io_stall_id_i; // @[ibex_controller.scala 143:29]
  assign io_id_in_ready_o = ~io_stall_id_i; // @[ibex_controller.scala 136:23]
  assign io_controller_run_o = _T_2 ? 1'h0 : _GEN_9; // @[Conditional.scala 40:58 ibex_controller.scala 79:23]

  assign io_instr_req_o = _T_2 ? 1'h0 : _GEN_8; // @[Conditional.scala 40:58 ibex_controller.scala 78:26]
  assign io_pc_set_o = _T_2 | _GEN_10; // @[Conditional.scala 40:58 ibex_controller.scala 80:23]
  assign io_pc_mux_o = {{2'd0}, _GEN_13}; // @[Conditional.scala 40:58 ibex_controller.scala 79:23]
  always @(posedge clock or posedge  reset_n) begin
    if (reset_n) begin
      ctrl_fsm_cs_REG <= 2'h0;
    end else if (_T_2) begin
      ctrl_fsm_cs_REG <= 2'h1;
    end else if (_T_5) begin
      ctrl_fsm_cs_REG <= 2'h2;
    end else if (_T_8) begin
      if (io_id_in_ready_o) begin
        ctrl_fsm_cs_REG <= 2'h3;
      end else begin
        ctrl_fsm_cs_REG <= 2'h2;
      end
    end else begin
      ctrl_fsm_cs_REG <= 2'h0;
    end
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
  ctrl_fsm_cs_REG = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset_n) begin
    ctrl_fsm_cs_REG = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ibex_id_stage(
  input         clock,
  input         reset,
  output        io_ctrl_busy_o,
  input         io_instr_valid_i,
  input  [31:0] io_instr_rdata_i,
  input  [31:0]  io_instr_rdata_alu_i,
  output        io_instr_req_o,
  output        io_instr_first_cycle_id_o,
  output        io_instr_valid_clear_o,
  output        io_id_in_ready_o,
  input         io_branch_decision_i,
  output        io_pc_set_o,
  output [2:0]  io_pc_mux_o,
  input  [31:0] io_pc_id_i,
  input         io_ex_valid_i,
  input         io_lsu_resp_valid_i,
  output [5:0]  io_alu_operator_ex_o,
  output [31:0] io_alu_operand_a_ex_o,
  output [31:0] io_alu_operand_b_ex_o,
  output        io_lsu_req_o,
  output        io_lsu_we_o,
  output [31:0] io_lsu_wdata_o,
  input  [31:0] io_result_ex_i,
  output [4:0]  io_rf_raddr_a_o,
  input  [31:0] io_rf_rdata_a_i,
  output [4:0]  io_rf_raddr_b_o,
  input  [31:0] io_rf_rdata_b_i,
  output        io_rf_ren_a_o,
  output        io_rf_ren_b_o,
  output [4:0]  io_rf_waddr_id_o,
  output [31:0] io_rf_wdata_id_o,
  output        io_rf_we_id_o,
  output        io_instr_id_done_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  decoder_io_instr_first_cycle_i; // @[ibex_id_stage.scala 260:37]
  wire [31:0] decoder_io_instr_rdata_i; // @[ibex_id_stage.scala 260:37]
  wire [31:0] decoder_io_instr_rdata_alu_i; // @[ibex_id_stage.scala 260:37]
  wire [2:0] decoder_io_imm_b_mux_sel_o; // @[ibex_id_stage.scala 260:37]
  wire [31:0] decoder_io_imm_i_type_o; // @[ibex_id_stage.scala 260:37]
  wire [31:0] decoder_io_imm_s_type_o; // @[ibex_id_stage.scala 260:37]
  wire [31:0] decoder_io_imm_b_type_o; // @[ibex_id_stage.scala 260:37]
  wire [31:0] decoder_io_imm_u_type_o; // @[ibex_id_stage.scala 260:37]
  wire [31:0] decoder_io_imm_j_type_o; // @[ibex_id_stage.scala 260:37]
  wire  decoder_io_rf_we_o; // @[ibex_id_stage.scala 260:37]
  wire [4:0] decoder_io_rf_raddr_a_o; // @[ibex_id_stage.scala 260:37]
  wire [4:0] decoder_io_rf_raddr_b_o; // @[ibex_id_stage.scala 260:37]
  wire [4:0] decoder_io_rf_waddr_o; // @[ibex_id_stage.scala 260:37]
  wire  decoder_io_rf_ren_a_o; // @[ibex_id_stage.scala 260:37]
  wire  decoder_io_rf_ren_b_o; // @[ibex_id_stage.scala 260:37]
  wire [5:0] decoder_io_alu_operator_o; // @[ibex_id_stage.scala 260:37]
  wire [1:0] decoder_io_alu_op_a_mux_sel_o; // @[ibex_id_stage.scala 260:37]
  wire  decoder_io_alu_op_b_mux_sel_o; // @[ibex_id_stage.scala 260:37]
  wire  decoder_io_data_req_o; // @[ibex_id_stage.scala 260:37]
  wire  decoder_io_data_we_o; // @[ibex_id_stage.scala 260:37]
  wire  decoder_io_branch_in_dec_o; // @[ibex_id_stage.scala 260:37]
  wire  controller_clock; // @[ibex_id_stage.scala 301:43]
  wire  controller_reset; // @[ibex_id_stage.scala 301:43]
  wire  controller_io_instr_valid_clear_o; // @[ibex_id_stage.scala 301:43]
  wire  controller_io_id_in_ready_o; // @[ibex_id_stage.scala 301:43]
  wire  controller_io_controller_run_o; // @[ibex_id_stage.scala 301:43]
  wire  controller_io_instr_req_o; // @[ibex_id_stage.scala 301:43]
  wire  controller_io_pc_set_o; // @[ibex_id_stage.scala 301:43]
  wire [2:0] controller_io_pc_mux_o; // @[ibex_id_stage.scala 301:43]
  wire  controller_io_branch_set_i; // @[ibex_id_stage.scala 301:43]
  wire  controller_io_stall_id_i; // @[ibex_id_stage.scala 301:43]
  wire [1:0] alu_op_a_mux_sel_dec = decoder_io_alu_op_a_mux_sel_o; // @[ibex_id_stage.scala 190:51 ibex_id_stage.scala 284:24]
  wire [31:0] _alu_operand_a_T_5 = 2'h0 == alu_op_a_mux_sel_dec ? io_rf_rdata_a_i : io_pc_id_i; // @[Mux.scala 80:57]
  wire [31:0] _alu_operand_a_T_7 = 2'h2 == alu_op_a_mux_sel_dec ? io_pc_id_i : _alu_operand_a_T_5; // @[Mux.scala 80:57]
  wire [2:0] imm_b_mux_sel_dec = decoder_io_imm_b_mux_sel_o; // @[ibex_id_stage.scala 197:49 ibex_id_stage.scala 268:21]
  wire [31:0] imm_i_type = decoder_io_imm_i_type_o; // @[ibex_id_stage.scala 164:30 ibex_id_stage.scala 269:14]
  wire [31:0] _imm_b_T_9 = 3'h0 == imm_b_mux_sel_dec ? imm_i_type : 32'h4; // @[Mux.scala 80:57]
  wire [31:0] imm_s_type = decoder_io_imm_s_type_o; // @[ibex_id_stage.scala 165:30 ibex_id_stage.scala 270:14]
  wire [31:0] _imm_b_T_11 = 3'h1 == imm_b_mux_sel_dec ? imm_s_type : _imm_b_T_9; // @[Mux.scala 80:57]
  wire [31:0] imm_b_type = decoder_io_imm_b_type_o; // @[ibex_id_stage.scala 166:30 ibex_id_stage.scala 271:14]
  wire [31:0] _imm_b_T_13 = 3'h2 == imm_b_mux_sel_dec ? imm_b_type : _imm_b_T_11; // @[Mux.scala 80:57]
  wire [31:0] imm_u_type = decoder_io_imm_u_type_o; // @[ibex_id_stage.scala 167:30 ibex_id_stage.scala 272:14]
  wire [31:0] _imm_b_T_15 = 3'h3 == imm_b_mux_sel_dec ? imm_u_type : _imm_b_T_13; // @[Mux.scala 80:57]
  wire [31:0] imm_j_type = decoder_io_imm_j_type_o; // @[ibex_id_stage.scala 168:30 ibex_id_stage.scala 273:14]
  wire [31:0] _imm_b_T_17 = 3'h4 == imm_b_mux_sel_dec ? imm_j_type : _imm_b_T_15; // @[Mux.scala 80:57]
  wire [31:0] _imm_b_T_19 = 3'h5 == imm_b_mux_sel_dec ? 32'h4 : _imm_b_T_17; // @[Mux.scala 80:57]
  wire [31:0] imm_b = 3'h6 == imm_b_mux_sel_dec ? 32'h4 : _imm_b_T_19; // @[Mux.scala 80:57]
  wire  alu_op_b_mux_sel_dec = decoder_io_alu_op_b_mux_sel_o; // @[ibex_id_stage.scala 192:51 ibex_id_stage.scala 285:24]
  wire  rf_we_dec = decoder_io_rf_we_o; // @[ibex_id_stage.scala 175:29 ibex_id_stage.scala 276:13]
  wire  controller_run = controller_io_controller_run_o; // @[ibex_id_stage.scala 156:34 ibex_id_stage.scala 305:18]
  wire  instr_executing = io_instr_valid_i & controller_run; // @[ibex_id_stage.scala 430:39]
  wire  reset_n = ~reset; // @[ibex_id_stage.scala 328:45]
  reg  id_fsm_q_REG; // @[ibex_id_stage.scala 349:12]
  wire  _instr_first_cycle_T = ~id_fsm_q_REG; // @[ibex_id_stage.scala 414:53]
  wire  instr_first_cycle = io_instr_valid_i & ~id_fsm_q_REG; // @[ibex_id_stage.scala 414:41]
  wire  lsu_req_dec = decoder_io_data_req_o; // @[ibex_id_stage.scala 202:31 ibex_id_stage.scala 288:15]
  reg  branch_set_q_REG; // @[ibex_id_stage.scala 332:12]
  wire  branch_in_dec = decoder_io_branch_in_dec_o; // @[ibex_id_stage.scala 145:33 ibex_id_stage.scala 295:17]
  wire  _GEN_2 = branch_in_dec & io_branch_decision_i; // @[ibex_id_stage.scala 381:46 ibex_id_stage.scala 385:20]
  wire  _GEN_6 = lsu_req_dec | _GEN_2; // @[ibex_id_stage.scala 379:38 ibex_id_stage.scala 380:20]
  wire  _GEN_7 = lsu_req_dec ? 1'h0 : _GEN_2; // @[ibex_id_stage.scala 379:38 ibex_id_stage.scala 373:18]
  wire  multicycle_done = lsu_req_dec ? io_lsu_resp_valid_i : io_ex_valid_i; // @[ibex_id_stage.scala 420:25]
  wire  _GEN_10 = multicycle_done ? 1'h0 : id_fsm_q_REG; // @[ibex_id_stage.scala 398:31 ibex_id_stage.scala 399:20 ibex_id_stage.scala 370:14]
  wire  _GEN_11 = multicycle_done ? 1'h0 : branch_in_dec; // @[ibex_id_stage.scala 398:31 ibex_id_stage.scala 373:18 ibex_id_stage.scala 401:24]
  wire  _GEN_13 = id_fsm_q_REG & _GEN_10; // @[ibex_id_stage.scala 397:53 ibex_id_stage.scala 405:18]
  wire  _GEN_14 = id_fsm_q_REG & _GEN_11; // @[ibex_id_stage.scala 397:53 ibex_id_stage.scala 373:18]
  wire  _GEN_17 = _instr_first_cycle_T ? _GEN_7 : _GEN_14; // @[ibex_id_stage.scala 378:47]
  wire  _GEN_18 = _instr_first_cycle_T & _GEN_7; // @[ibex_id_stage.scala 378:47 ibex_id_stage.scala 374:18]
  wire  stall_branch = instr_executing & _GEN_17; // @[ibex_id_stage.scala 377:27 ibex_id_stage.scala 373:18]
  wire  tmp = ~io_lsu_resp_valid_i; // @[ibex_id_stage.scala 426:10]
  wire  stall_mem = io_instr_valid_i & (lsu_req_dec & (tmp | instr_first_cycle)); // @[ibex_id_stage.scala 427:33]
  wire  stall_id = stall_mem | stall_branch; // @[ibex_id_stage.scala 412:38]
 

  ibex_decoder decoder ( // @[ibex_id_stage.scala 260:37]
    .io_instr_first_cycle_i(decoder_io_instr_first_cycle_i),
    .io_instr_rdata_i(decoder_io_instr_rdata_i),
    .io_instr_rdata_alu_i(decoder_io_instr_rdata_alu_i),
    .io_imm_b_mux_sel_o(decoder_io_imm_b_mux_sel_o),
    .io_imm_i_type_o(decoder_io_imm_i_type_o),
    .io_imm_s_type_o(decoder_io_imm_s_type_o),
    .io_imm_b_type_o(decoder_io_imm_b_type_o),
    .io_imm_u_type_o(decoder_io_imm_u_type_o),
    .io_imm_j_type_o(decoder_io_imm_j_type_o),
    .io_rf_we_o(decoder_io_rf_we_o),
    .io_rf_raddr_a_o(decoder_io_rf_raddr_a_o),
    .io_rf_raddr_b_o(decoder_io_rf_raddr_b_o),
    .io_rf_waddr_o(decoder_io_rf_waddr_o),
    .io_rf_ren_a_o(decoder_io_rf_ren_a_o),
    .io_rf_ren_b_o(decoder_io_rf_ren_b_o),
    .io_alu_operator_o(decoder_io_alu_operator_o),
    .io_alu_op_a_mux_sel_o(decoder_io_alu_op_a_mux_sel_o),
    .io_alu_op_b_mux_sel_o(decoder_io_alu_op_b_mux_sel_o),
    .io_data_req_o(decoder_io_data_req_o),
    .io_data_we_o(decoder_io_data_we_o),
    .io_branch_in_dec_o(decoder_io_branch_in_dec_o)
  );
  ibex_controller controller ( // @[ibex_id_stage.scala 301:43]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_instr_valid_clear_o(controller_io_instr_valid_clear_o),
    .io_id_in_ready_o(controller_io_id_in_ready_o),
    .io_controller_run_o(controller_io_controller_run_o),
    .io_instr_req_o(controller_io_instr_req_o),
    .io_pc_set_o(controller_io_pc_set_o),
    .io_pc_mux_o(controller_io_pc_mux_o),
    .io_branch_set_i(controller_io_branch_set_i),
    .io_stall_id_i(controller_io_stall_id_i)
  );
  assign io_ctrl_busy_o = 1'h1; // @[ibex_id_stage.scala 302:18]
  assign io_instr_req_o = controller_io_instr_req_o; // @[ibex_id_stage.scala 306:18]
  assign io_instr_first_cycle_id_o = io_instr_valid_i & ~id_fsm_q_REG; // @[ibex_id_stage.scala 414:41]
  assign io_instr_valid_clear_o = controller_io_instr_valid_clear_o; // @[ibex_id_stage.scala 303:26]
 //assign io_id_in_ready_o = controller_io_id_in_ready_o; // @[ibex_id_stage.scala 304:20]
  ///////////////改改改改改改改///////////
  assign io_id_in_ready_o = 1;
  assign io_pc_set_o = controller_io_pc_set_o; // @[ibex_id_stage.scala 307:15]
  assign io_pc_mux_o = controller_io_pc_mux_o; // @[ibex_id_stage.scala 308:15]
  assign io_alu_operator_ex_o = decoder_io_alu_operator_o; // @[ibex_id_stage.scala 188:41 ibex_id_stage.scala 283:16]
  assign io_alu_operand_a_ex_o = 2'h3 == alu_op_a_mux_sel_dec ? 32'h0 : _alu_operand_a_T_7; // @[Mux.scala 80:57]
  assign io_alu_operand_b_ex_o = alu_op_b_mux_sel_dec ? imm_b : io_rf_rdata_b_i; // @[ibex_id_stage.scala 245:23]
  assign io_lsu_req_o = instr_executing & (instr_first_cycle & lsu_req_dec); // @[ibex_id_stage.scala 314:17]
  assign io_lsu_we_o = decoder_io_data_we_o; // @[ibex_id_stage.scala 200:26 ibex_id_stage.scala 289:10]
  assign io_lsu_wdata_o = io_rf_rdata_b_i; // @[ibex_id_stage.scala 185:34 ibex_id_stage.scala 435:18]
  assign io_rf_raddr_a_o = decoder_io_rf_raddr_a_o; // @[ibex_id_stage.scala 277:19]
  assign io_rf_raddr_b_o = decoder_io_rf_raddr_b_o; // @[ibex_id_stage.scala 278:19]
  assign io_rf_ren_a_o = decoder_io_rf_ren_a_o; // @[ibex_id_stage.scala 178:28 ibex_id_stage.scala 280:12]
  assign io_rf_ren_b_o = decoder_io_rf_ren_b_o; // @[ibex_id_stage.scala 179:28 ibex_id_stage.scala 281:12]
  assign io_rf_waddr_id_o = decoder_io_rf_waddr_o[4:0]; // @[ibex_id_stage.scala 279:20]
  assign io_rf_wdata_id_o = io_result_ex_i; // @[ibex_id_stage.scala 254:20]
//  assign io_rf_we_id_o = rf_we_dec & instr_executing; // @[ibex_id_stage.scala 252:30]
  assign io_rf_we_id_o = rf_we_dec; // @[ibex_id_stage.scala 252:30]
  
  assign io_instr_id_done_o = ~stall_id; // @[ibex_id_stage.scala 413:17]
  assign decoder_io_instr_first_cycle_i = io_instr_valid_i & ~id_fsm_q_REG; // @[ibex_id_stage.scala 414:41]
  assign decoder_io_instr_rdata_i = {{31'd0}, io_instr_rdata_i}; // @[ibex_id_stage.scala 264:28]
  assign decoder_io_instr_rdata_alu_i = {{31'd0}, io_instr_rdata_alu_i}; // @[ibex_id_stage.scala 265:32]
  assign controller_clock = clock;
  assign controller_reset = reset;
  assign controller_io_branch_set_i = branch_set_q_REG; // @[ibex_id_stage.scala 330:32 ibex_id_stage.scala 331:16]
  assign controller_io_stall_id_i = stall_mem | stall_branch; // @[ibex_id_stage.scala 412:38]
  always @(posedge clock or posedge reset_n) begin
    if (reset_n) begin
      id_fsm_q_REG <= 1'h0;
    end else if (instr_executing) begin
      if (_instr_first_cycle_T) begin
        id_fsm_q_REG <= _GEN_6;
      end else begin
        id_fsm_q_REG <= _GEN_13;
      end
    end
  end
  always @(posedge clock or posedge reset_n) begin
    if (reset_n) begin
      branch_set_q_REG <= 1'h0;
    end else begin
      branch_set_q_REG <= instr_executing & _GEN_18;
    end
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
  id_fsm_q_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  branch_set_q_REG = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset_n) begin
    id_fsm_q_REG = 1'h0;
  end
  if (reset_n) begin
    branch_set_q_REG = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
