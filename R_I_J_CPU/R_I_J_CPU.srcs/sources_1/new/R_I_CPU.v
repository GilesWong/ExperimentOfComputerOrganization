`timescale 1ns / 1ps

module R_I_J_CPU(
    input rst,
    input clk,
    output ZF,
    output OF,
    output [31:0] F,
    output [31:0] M_R_DATA,
    output [31:0] PC
    );
    wire write_reg;
    wire [31:0] inst_code;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [31:0] rs_data;
    wire [31:0] rt_data;
    wire [31:0] rd_data;
    wire [31:0] imm_data;
    wire [15:0] imm;
    //wire rd_rt_s;
    wire [1:0] w_r_s;
    wire rt_imm_s;
    wire imm_s;
    wire Mem_Write;
    //wire alu_mem_s;
    wire [1:0] wr_data_s;
    wire [31:0] W_ADDR;
    wire [31:0] W_DATA;
    wire [31:0] R_DATA_A;
    wire [31:0] R_DATA_B;
    wire [31:0] ALU_B;
    wire [3:0] ALU_OP;
    wire [1:0] PC_s;
    wire [31:0] PC_new;
    wire [25:0] address;
    Fetch_Instr pc(
        .rst(rst),
        .clk(clk),
        .Inst_code(inst_code),
        .PC_s(PC_s),
        .imm_data(imm_data),
        .address(address),
        .R_DATA_A(R_DATA_A),
        .PC(PC)
    );
    Decoder dec(
        .inst(inst_code),
        .ALU_OP(ALU_OP),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .Write_Reg(write_reg),
        .imm(imm),
        .imm_s(imm_s),
        .rt_imm_s(rt_imm_s),
        .Mem_Write(Mem_Write),
        .address(address),
        .w_r_s(w_r_s),
        .wr_data_s(wr_data_s),
        .PC_s(PC_s),
        .ZF(ZF)
    );
    assign W_ADDR = (w_r_s[1]) ? 5'b11111: ((w_r_s[0]) ? rt : rd);
    assign imm_data = (imm_s) ? {{16{imm[15]}}, imm} : {{16{1'b0}}, imm};
    REGS REG_F(rs,rt,W_ADDR,write_reg,W_DATA,~clk,rst,R_DATA_A,R_DATA_B);
    assign ALU_B = (rt_imm_s) ? imm_data : R_DATA_B;
    ALU alu(R_DATA_A, ALU_B, F, ZF, OF, ALU_OP);

    blk_mem_gen_1 DATA_RAM(
        .clka(clk),
        .wea(Mem_Write),
        .addra(F[5:0]),
        .dina(R_DATA_B),
        .douta(M_R_DATA)
    );
    assign W_DATA = (wr_data_s[1]) ? PC_new : ((wr_data_s[0]) ? M_R_DATA : F);
   
endmodule