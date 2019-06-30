`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/09 19:44:57
// Design Name: 
// Module Name: Segment_top
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


module Segment_top(
     BUTTON, DATA_IN, DATA_OUT, SEG, which, enable, clk, R_B_DATA
    );
    input[31:0] DATA_IN;
    input[5:0] BUTTON;
    input clk;
    output[7:0] SEG;
    output reg enable = 1;
    output [2:0] which;
    output reg [31:0]DATA_OUT;
    
    wire[31:0] R_A_DATA;
    output wire[31:0] R_B_DATA;
    reg[4:0] R_A_ADDR;
    reg[4:0] R_B_ADDR;
    reg[4:0] W_ADDR;
    wire[31:0] W_DATA;
    reg[31:0] INPUT_DATA;
    reg[31:0] R_B_TEMPDATA;
    wire WRITE_REG;
    wire RESET;
    
    always@(*)
    begin 
        case(BUTTON)
            6'b100000: begin R_A_ADDR <= DATA_IN[31:27]; R_B_ADDR <= DATA_IN[26:22]; W_ADDR <= DATA_IN[21:17]; end //输入三个地址
            6'b010000: begin INPUT_DATA <= DATA_IN; end //接受输入值
            default: begin DATA_OUT <= R_A_DATA; //默认显示两地址的数据
                             R_B_TEMPDATA <= R_B_DATA;
                       end
        endcase
    end
    assign RESET = BUTTON[0];
    assign WRITE_REG = BUTTON[2];
    assign W_DATA = INPUT_DATA;
    Segment seg(.R_Addr_A(R_A_ADDR),.R_Addr_B(R_B_ADDR),.W_Addr(W_ADDR),.W_Data(W_DATA),.Write_Reg(WRITE_REG),.Clk(clk),.Reset(RESET),.R_Data_A(R_A_DATA),.R_Data_B(R_B_DATA));
    
    segControl sc(.data(R_B_DATA),.clk(clk),.which(which),.out(SEG));
    
    
    
endmodule
