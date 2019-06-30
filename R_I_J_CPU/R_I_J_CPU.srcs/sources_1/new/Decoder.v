`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/29 20:05:48
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [31:0] inst,
    input ZF,
    output reg [3:0] ALU_OP,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg Write_Reg,
    output reg [15:0] imm,
//    output reg rd_rt_s,
    output reg imm_s,
    output reg rt_imm_s,
    output reg Mem_Write,
    output reg [25:0] address,
    output reg [1:0] w_r_s,
    output reg [1:0] wr_data_s,
    output reg [1:0] PC_s
//    output reg alu_mem_s
    );
    always@(*)
    begin
        //Type R instructions
        if (inst[31:26] == 0)
            begin
                rd <= inst[15:11];
                rt <= inst[20:16];
                rs <= inst[25:21];
                //alu_mem_s <= 0;
                //rd_rt_s <= 0;
                wr_data_s <= 2'b00;
                Mem_Write <= 0;
                w_r_s <= 2'b00;
                rt_imm_s <= 0;
                //Write_Reg <= (inst[5:0] == 0) ? 1'b0 : 1'b1;
                case(inst[5:0])
                    6'b100000: begin ALU_OP <= 4'b0100; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b100010: begin ALU_OP <= 4'b0101; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b100100: begin ALU_OP <= 4'b0000; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b100101: begin ALU_OP <= 4'b0001; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b100110: begin ALU_OP <= 4'b0010; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b100111: begin ALU_OP <= 4'b0011; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b101011: begin ALU_OP <= 4'b0110; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b000100: begin ALU_OP <= 4'b0111; Write_Reg <= 1; PC_s <= 2'b00; end
                    6'b001000: begin ALU_OP <= 4'b0100; Write_Reg <= 0; PC_s <= 2'b01; end
                endcase
            end
        //Type I instructions with immediate value
        if (inst[31:29] == 3'b001)
            begin
                imm <= inst[15:0];
                rt <= inst[20:16];
                rs <= inst[25:21];
                Mem_Write <= 0;
                //rd_rt_s <= 1;
                //alu_mem_s <= 0;
                w_r_s <= 2'b01;
                wr_data_s <= 2'b00;
                rt_imm_s <= 1;
                Write_Reg <= 1;
                case(inst[31:26])
                    6'b001000: begin imm_s <= 1; ALU_OP <= 4'b0100; end
                    6'b001100: begin imm_s <= 0; ALU_OP <= 4'b0000; end
                    6'b001110: begin imm_s <= 0; ALU_OP <= 4'b0010; end
                    6'b001011: begin imm_s <= 0; ALU_OP <= 4'b0110; end
                endcase
            end
        //Type I instructions for value reading & saving
        if ((inst[31:30] == 2'b10) && (inst[28:26] == 3'b011))
            begin
                imm <= inst[15:0];
                rt <= inst[20:16];
                rs <= inst[25:21];
                //rd_rt_s <= 1;
                rt_imm_s <= 1;
                imm_s <= 1;
                w_r_s <= 2'b01;
                wr_data_s <= 2'b01;
                PC_s <= 2'b00;
                case(inst[31:26])
                    6'b100011: begin Mem_Write <= 0; Write_Reg <= 1; ALU_OP <= 4'b0100; end
                    6'b101011: begin Mem_Write <= 1; Write_Reg <= 0; ALU_OP <= 4'b0100; end
                endcase
            end
        //Type I instructions for jumping
        if (inst[31:27] == 5'b00010)
            begin 
                imm <= inst[15:0];
                rt <= inst[20:16];
                rs <= inst[25:21];
                case(inst[31:26])
                    6'b000100: begin rt_imm_s <= 0; ALU_OP <= 4'b0101; Write_Reg <= 0; Mem_Write <= 0; PC_s <= (ZF ? 2'b10 : 2'b00); end
                    6'b000101: begin rt_imm_s <= 0; ALU_OP <= 4'b0101; Write_Reg <= 0; Mem_Write <= 0; PC_s <= (ZF ? 2'b00 : 2'b10); end
                endcase
            end
        //Type J instructions for jumping
        if (inst[31:27] == 5'b00001)
            begin 
                address <= inst[25:0];
                case(inst[31:26])
                    6'b000010: begin w_r_s <= 2'b00; Write_Reg <= 0; Mem_Write <= 0; PC_s <= 2'b11; end
                    6'b000011: begin w_r_s <= 2'b10; wr_data_s <= 2'b10; Write_Reg <= 1; Mem_Write <= 0; PC_s <= 2'b11; end
                endcase
            end
    end

endmodule
