`timescale 1ns / 1ps

module R_I_TOP(
    input clk,
    input rst,
    input [1:0] button,
    output reg [31:0] LED
    );
    wire ZF, OF;
    wire [31:0] F;
    wire [31:0] M_R_DATA;
    R_I_CPU cpu(
        .rst(rst),
        .clk(clk),
        .ZF(ZF),
        .OF(OF),
        .F(F),
        .M_R_DATA(M_R_DATA)
    );
    always@(*)
        begin
            case (button)
                2'b01: LED <= M_R_DATA;
                2'b10: begin LED[31:2] <= 0; LED[1] <= ZF; LED[0] <= OF; end
                default: LED <= F;
            endcase
        end

endmodule