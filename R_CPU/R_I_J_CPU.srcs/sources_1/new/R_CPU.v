`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/22 19:34:35
// Design Name: 
// Module Name: R_CPU
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


module R_CPU(
    input rst,
    input clk,
    output ZF,
    output OF,
    output [31:0] F
    );
    reg write_reg;
    wire [31:0] inst_code;
    wire [31:0] R_DATA_A;
    wire [31:0] R_DATA_B;
    reg [3:0] ALU_OP;

    Fetch_Instr pc(
        .rst(rst),
        .clk(clk),
        .Inst_code(inst_code)
        );
    REGS regs(inst_code[25:21],inst_code[20:16],inst_code[15:11],write_reg,F,~clk,rst,R_DATA_A,R_DATA_B);
    ALU alu(R_DATA_A,R_DATA_B,F,ZF,OF,ALU_OP);
    always@(*)
    begin 
        write_reg = 0;
        ALU_OP = 0;
        if (inst_code[31:26] == 0)
            begin
                case(inst_code[5:0])
                6'b100000: ALU_OP <= 4'b0100;
                6'b100010: ALU_OP <= 4'b0101;
                6'b100100: ALU_OP <= 4'b0000;
                6'b100101: ALU_OP <= 4'b0001;
                6'b100110: ALU_OP <= 4'b0010;
                6'b100111: ALU_OP <= 4'b0011;
                6'b101011: ALU_OP <= 4'b0110;
                6'b000100: ALU_OP <= 4'b0111;
                endcase
            write_reg = 1;
            end
    end
endmodule
