`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/07 16:45:07
// Design Name: 
// Module Name: core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module core(
    input clock,
    input reset,
    input [31:0] boot_addr_i,
    input data_r_i,
    input read_data_vaild_i,
    
    output data_addr_o,
    output data_w_req_o,
    output data_w_o,
    output data_r_req_o,
    output core_busy_o
    );
    
//    wire [31:0] pc_if;
//    wire instr_id_done;
//    wire if_busy;
//    wire ctrl_busy;
    
//    wire [31:0] rf_wdata_id;
//    wire [31:0] rf_wdata_lsu;
    reg [31:0] rf_wdata;
//    wire lsu_valid;
//    wire rf_we_id;
//    wire rf_we_lsu;
    wire rf_we;
    
//    parameter t = 1;
//    parameter f = 0;

    wire t,f;
    assign t=1;
        assign f=0;

    //alu IO
  wire  [5:0]  io_operator_i;
  wire  [31:0] io_operand_a_i;
  wire  [31:0] io_operand_b_i;
  wire         io_instr_first_cycle_i;
  wire [31:0] io_adder_result_o;
  wire [33:0] io_adder_result_ext_o;
  wire [31:0] io_result_o;
  wire        io_comparison_result_o;
  
    //id_stage IO
  wire        io_ctrl_busy_o;
  wire         io_instr_valid_i;
  wire         io_instr_rdata_i;
  wire         io_instr_rdata_alu_i;
  wire        io_instr_req_o;
  wire        io_instr_first_cycle_id_o;
  wire        io_instr_valid_clear_o;
  wire        io_id_in_ready_o = 1;
  wire         io_branch_decision_i;
  wire        io_pc_set_o;
  wire [2:0]  io_pc_mux_o;
  wire  [31:0] io_pc_id_i;
  wire         io_ex_valid_i;
  wire         io_lsu_resp_valid_i;
  wire [5:0]  io_alu_operator_ex_o;
  wire [31:0] io_alu_operand_a_ex_o;
  wire [31:0] io_alu_operand_b_ex_o;
  wire        io_lsu_req_o;
  wire        io_lsu_we_o;
  wire [31:0] io_lsu_wdata_o;
  wire  [31:0] io_result_ex_i;
  wire [4:0]  io_rf_raddr_a_o;
  wire  [31:0] io_rf_rdata_a_i;
  wire [4:0]  io_rf_raddr_b_o;
  wire  [31:0] io_rf_rdata_b_i;
  wire        io_rf_ren_a_o;
  wire        io_rf_ren_b_o;
  wire [4:0]  io_rf_waddr_id_o;
  wire [31:0] io_rf_wdata_id_o;
  wire        io_rf_we_id_o;
  wire        io_instr_id_done_o;
  
  //if_stage IO
  wire         io_req_i;
  wire  [31:0] io_boot_addr_i;
  wire        io_instr_valid_id_o;
  wire [31:0] io_instr_rdata_id_o;
  wire [31:0] io_instr_rdata_alu_id_o;
  wire [31:0] io_pc_if_o;
  wire [31:0] io_pc_id_o;
  wire         io_instr_valid_clear_i;
  wire         io_pc_set_i = 1;
  wire  [2:0]  io_pc_mux_i;
  wire  [31:0] io_branch_target_ex_i;
  wire         io_id_in_ready_i;
  wire        io_if_busy_o;
  
  //LSU IO
  wire  [31:0] io_addr_i;
  wire         io_write_enable;
  wire  [31:0] io_data_w_i;
  wire         io_read_req;
  wire [31:0] io_data_r_o;
  wire        io_lsu_busy;
  wire        io_data_vaild;
  wire [31:0] io_addr_o;
  wire        io_data_w_req;
  wire [31:0] io_data_w_o;
  wire        io_data_r_req;
  wire  [31:0] io_data_r_i;
  wire         io_read_data_vaild;
  
  //RF IO
  wire         io_test_en_i;
  wire         io_dummy_instr_id_i;
  wire  [4:0]  io_raddr_a_i;
  wire [31:0] io_rdata_a_o;
  wire  [4:0]  io_raddr_b_i;
  wire [31:0] io_rdata_b_o;
  wire  [4:0]  io_waddr_a_i;
  wire  [31:0] io_wdata_a_i;
  wire         io_we_a_i;
  
  always@(*) begin
    if(io_rf_we_id_o)
    begin
    rf_wdata = io_rf_wdata_id_o;
    end
    else
    begin
    rf_wdata = data_r_i;
    end
  end 
  
  assign rf_we = io_rf_we_id_o | io_data_vaild;
  
    ibex_alu alu(
    clock,
    reset,
    io_alu_operator_ex_o,
    io_alu_operand_a_ex_o,
    io_alu_operand_b_ex_o,
    io_instr_first_cycle_id_o,
    io_adder_result_o,
    io_adder_result_ext_o,
    io_result_ex_i,
    io_branch_decision_i
    );
    
    ibex_id_stage id_stage(
    clock,
    reset,
    io_ctrl_busy_o,
    io_instr_valid_id_o,
    io_instr_rdata_id_o,
    io_instr_rdata_alu_id_o,
    io_instr_req_o,
    io_instr_first_cycle_id_o,
    io_instr_valid_clear_o,
    io_id_in_ready_o,
    io_comparison_result_o,
    io_pc_set_o,
    io_pc_mux_o,
    io_pc_id_o,
    1, 
    ~io_lsu_busy,
    io_alu_operator_ex_o,
    io_alu_operand_a_ex_o,
    io_alu_operand_b_ex_o,
    io_lsu_req_o,
    io_lsu_we_o,
    io_lsu_wdata_o,
    //io_result_o,
    io_adder_result_o,
    io_rf_raddr_a_o,
    io_rdata_a_o,
    io_rf_raddr_b_o,
    io_rdata_b_o,
    io_rf_ren_a_o,
    io_rf_ren_b_o,
    io_rf_waddr_id_o,
    io_rf_wdata_id_o,
    io_rf_we_id_o,
    io_instr_id_done_o
    );
    
    ibex_if_stage if_stage(
    clock,
    reset,
    io_instr_req_o,
    boot_addr_i,
    io_instr_valid_id_o,
    io_instr_rdata_id_o,
    io_instr_rdata_alu_id_o,
    io_pc_if_o,
    io_pc_id_o,
    io_instr_valid_clear_o,
    io_pc_set_o,
    io_pc_mux_o,
    io_adder_result_o,
    io_id_in_ready_o,
    io_if_busy_o    
    );
    
    LSU lsu(
    clock,
    reset,
    io_adder_result_o,
    io_lsu_we_o,
    io_lsu_wdata_o,
    io_lsu_req_o,
    data_addr_o,
    io_lsu_busy,
    io_data_vaild,
    io_addr_o,
    io_data_w_req,
    io_data_w_o,
    io_data_r_req,
    data_r_i,
    read_data_vaild_i
    );
    
    ibex_register_file_fpga RF(
    clock,
    reset,
    0,
    0,
    io_rf_raddr_a_o,
    io_rdata_a_o,
    io_rf_raddr_b_o,
    io_rdata_b_o,
    io_rf_waddr_id_o,
    io_adder_result_o,
    rf_we
    );
endmodule
