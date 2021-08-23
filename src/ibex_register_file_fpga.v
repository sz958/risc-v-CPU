module ibex_register_file_fpga(
  input         clock,
  input         reset,
  input         io_test_en_i,
  input         io_dummy_instr_id_i,
  input  [4:0]  io_raddr_a_i,
  output [31:0] io_rdata_a_o,
  input  [4:0]  io_raddr_b_i,
  output [31:0] io_rdata_b_o,
  input  [4:0]  io_waddr_a_i,
  input  [31:0] io_wdata_a_i,
  input         io_we_a_i
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
  reg [31:0] mem_0; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_1; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_2; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_3; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_4; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_5; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_6; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_7; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_8; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_9; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_10; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_11; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_12; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_13; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_14; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_15; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_16; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_17; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_18; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_19; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_20; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_21; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_22; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_23; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_24; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_25; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_26; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_27; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_28; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_29; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_30; // @[ibex_register_file_fpga.scala 28:27]
  reg [31:0] mem_31; // @[ibex_register_file_fpga.scala 28:27]
  wire [31:0] _GEN_1 = 5'h1 == io_raddr_a_i ? mem_1 : mem_0; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_2 = 5'h2 == io_raddr_a_i ? mem_2 : _GEN_1; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_3 = 5'h3 == io_raddr_a_i ? mem_3 : _GEN_2; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_4 = 5'h4 == io_raddr_a_i ? mem_4 : _GEN_3; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_5 = 5'h5 == io_raddr_a_i ? mem_5 : _GEN_4; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_6 = 5'h6 == io_raddr_a_i ? mem_6 : _GEN_5; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_7 = 5'h7 == io_raddr_a_i ? mem_7 : _GEN_6; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_8 = 5'h8 == io_raddr_a_i ? mem_8 : _GEN_7; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_9 = 5'h9 == io_raddr_a_i ? mem_9 : _GEN_8; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_10 = 5'ha == io_raddr_a_i ? mem_10 : _GEN_9; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_11 = 5'hb == io_raddr_a_i ? mem_11 : _GEN_10; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_12 = 5'hc == io_raddr_a_i ? mem_12 : _GEN_11; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_13 = 5'hd == io_raddr_a_i ? mem_13 : _GEN_12; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_14 = 5'he == io_raddr_a_i ? mem_14 : _GEN_13; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_15 = 5'hf == io_raddr_a_i ? mem_15 : _GEN_14; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_16 = 5'h10 == io_raddr_a_i ? mem_16 : _GEN_15; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_17 = 5'h11 == io_raddr_a_i ? mem_17 : _GEN_16; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_18 = 5'h12 == io_raddr_a_i ? mem_18 : _GEN_17; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_19 = 5'h13 == io_raddr_a_i ? mem_19 : _GEN_18; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_20 = 5'h14 == io_raddr_a_i ? mem_20 : _GEN_19; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_21 = 5'h15 == io_raddr_a_i ? mem_21 : _GEN_20; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_22 = 5'h16 == io_raddr_a_i ? mem_22 : _GEN_21; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_23 = 5'h17 == io_raddr_a_i ? mem_23 : _GEN_22; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_24 = 5'h18 == io_raddr_a_i ? mem_24 : _GEN_23; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_25 = 5'h19 == io_raddr_a_i ? mem_25 : _GEN_24; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_26 = 5'h1a == io_raddr_a_i ? mem_26 : _GEN_25; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_27 = 5'h1b == io_raddr_a_i ? mem_27 : _GEN_26; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_28 = 5'h1c == io_raddr_a_i ? mem_28 : _GEN_27; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_29 = 5'h1d == io_raddr_a_i ? mem_29 : _GEN_28; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_30 = 5'h1e == io_raddr_a_i ? mem_30 : _GEN_29; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_31 = 5'h1f == io_raddr_a_i ? mem_31 : _GEN_30; // @[ibex_register_file_fpga.scala 32:22 ibex_register_file_fpga.scala 32:22]
  wire [31:0] _GEN_33 = 5'h1 == io_raddr_b_i ? mem_1 : mem_0; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_34 = 5'h2 == io_raddr_b_i ? mem_2 : _GEN_33; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_35 = 5'h3 == io_raddr_b_i ? mem_3 : _GEN_34; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_36 = 5'h4 == io_raddr_b_i ? mem_4 : _GEN_35; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_37 = 5'h5 == io_raddr_b_i ? mem_5 : _GEN_36; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_38 = 5'h6 == io_raddr_b_i ? mem_6 : _GEN_37; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_39 = 5'h7 == io_raddr_b_i ? mem_7 : _GEN_38; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_40 = 5'h8 == io_raddr_b_i ? mem_8 : _GEN_39; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_41 = 5'h9 == io_raddr_b_i ? mem_9 : _GEN_40; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_42 = 5'ha == io_raddr_b_i ? mem_10 : _GEN_41; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_43 = 5'hb == io_raddr_b_i ? mem_11 : _GEN_42; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_44 = 5'hc == io_raddr_b_i ? mem_12 : _GEN_43; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_45 = 5'hd == io_raddr_b_i ? mem_13 : _GEN_44; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_46 = 5'he == io_raddr_b_i ? mem_14 : _GEN_45; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_47 = 5'hf == io_raddr_b_i ? mem_15 : _GEN_46; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_48 = 5'h10 == io_raddr_b_i ? mem_16 : _GEN_47; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_49 = 5'h11 == io_raddr_b_i ? mem_17 : _GEN_48; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_50 = 5'h12 == io_raddr_b_i ? mem_18 : _GEN_49; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_51 = 5'h13 == io_raddr_b_i ? mem_19 : _GEN_50; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_52 = 5'h14 == io_raddr_b_i ? mem_20 : _GEN_51; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_53 = 5'h15 == io_raddr_b_i ? mem_21 : _GEN_52; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_54 = 5'h16 == io_raddr_b_i ? mem_22 : _GEN_53; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_55 = 5'h17 == io_raddr_b_i ? mem_23 : _GEN_54; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_56 = 5'h18 == io_raddr_b_i ? mem_24 : _GEN_55; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_57 = 5'h19 == io_raddr_b_i ? mem_25 : _GEN_56; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_58 = 5'h1a == io_raddr_b_i ? mem_26 : _GEN_57; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_59 = 5'h1b == io_raddr_b_i ? mem_27 : _GEN_58; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_60 = 5'h1c == io_raddr_b_i ? mem_28 : _GEN_59; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_61 = 5'h1d == io_raddr_b_i ? mem_29 : _GEN_60; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_62 = 5'h1e == io_raddr_b_i ? mem_30 : _GEN_61; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire [31:0] _GEN_63 = 5'h1f == io_raddr_b_i ? mem_31 : _GEN_62; // @[ibex_register_file_fpga.scala 35:22 ibex_register_file_fpga.scala 35:22]
  wire  we = io_waddr_a_i == 5'h0 ? 1'h0 : io_we_a_i; // @[ibex_register_file_fpga.scala 38:12]
  assign io_rdata_a_o = io_raddr_a_i == 5'h0 ? 32'h0 : _GEN_31; // @[ibex_register_file_fpga.scala 32:22]
  assign io_rdata_b_o = io_raddr_b_i == 5'h0 ? 32'h0 : _GEN_63; // @[ibex_register_file_fpga.scala 35:22]
  always@(posedge clock,negedge reset) begin
    if(!reset)
    begin
    mem_0 <= 0;
    mem_1 <= 1;
    mem_2 <= 2;
    mem_3 <= 0;
    mem_4 <= 0;
    mem_5 <= 0;
    mem_6 <= 0;
    mem_7 <= 0;
    mem_8 <= 0;
    mem_9 <= 0;
    mem_10 <= 0;
    mem_11 <= 0;
    mem_12 <= 0;
    mem_13 <= 0;
    mem_14 <= 0;
    mem_15 <= 0;
    mem_16 <= 0;
    mem_17 <= 0;
    mem_18 <= 0;
    mem_19 <= 0;
    mem_20 <= 0;
    mem_21 <= 0;
    mem_22 <= 0;
    mem_23 <= 0;
    mem_24 <= 0;
    mem_25 <= 0;
    mem_26 <= 0;
    mem_27 <= 0;
    mem_28 <= 0;
    mem_29 <= 0;
    mem_30 <= 0;
    mem_31 <= 0;
    end
  end
  always @(posedge clock) begin
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h0 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_0 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h1 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_1 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h2 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_2 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h3 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_3 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h4 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_4 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h5 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_5 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h6 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_6 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h7 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_7 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h8 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_8 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h9 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_9 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'ha == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_10 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'hb == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_11 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'hc == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_12 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'hd == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_13 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'he == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_14 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'hf == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_15 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h10 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_16 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h11 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_17 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h12 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_18 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h13 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_19 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h14 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_20 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h15 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_21 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h16 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_22 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h17 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_23 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h18 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_24 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h19 == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_25 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h1a == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_26 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h1b == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_27 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h1c == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_28 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h1d == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_29 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h1e == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_30 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
    end
    if (we) begin // @[ibex_register_file_fpga.scala 39:25]
      if (5'h1f == io_waddr_a_i) begin // @[ibex_register_file_fpga.scala 40:25]
        mem_31 <= io_wdata_a_i; // @[ibex_register_file_fpga.scala 40:25]
      end
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
  mem_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mem_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mem_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mem_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mem_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  mem_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  mem_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  mem_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mem_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mem_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mem_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mem_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mem_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mem_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mem_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mem_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mem_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mem_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mem_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mem_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  mem_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  mem_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  mem_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  mem_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  mem_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  mem_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  mem_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  mem_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  mem_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
