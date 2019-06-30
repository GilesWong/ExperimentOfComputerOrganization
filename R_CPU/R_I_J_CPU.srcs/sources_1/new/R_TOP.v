`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/22 19:52:16
// Design Name: 
// Module Name: R_TOP
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


module R_TOP(
    input rst,
    input clk,
    input button,
    output reg [31:0] LED
    );
    wire ZF, OF;
    wire [31:0] ALU_F;
    R_CPU cpu(rst,clk,ZF,OF,ALU_F);
    always@(*)
    begin
        case(button)
        1'b0: LED <= ALU_F;
        1'b1: begin LED[31:2] <= 0; LED[1] <= OF; LED[0] <= ZF; end
        endcase
    end
endmodule
