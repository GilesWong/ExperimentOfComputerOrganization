`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/09 22:37:03
// Design Name: 
// Module Name: ALU
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
module ALU(A, B, F, ZF, OF, ALU_OP
    );
    input[31:0] A;
    input[31:0] B;
    input[3:0] ALU_OP;
    output reg ZF;
    output reg OF;
    output reg[31:0] F;
	integer i;
	reg C;
	 
	 always @(*)
	 begin
			case(ALU_OP)
				4'b0000:begin F<=A&B; end
				4'b0001:begin F<=A|B;end
				4'b0010:begin F<=A^B;end
				4'b0011:begin F<=~(A|B);end
				4'b0100:begin {C,F} <=A+B;end
				4'b0101:begin {C,F} <=A-B;end
				4'b0110:begin 
				            if (A<B)
				                F<=1;
				            else 
				                F<=0;
				            OF <= 0;
				            end
				4'b0111:begin F = B << A; end
				     default:begin F<=32'hzzzz_zzzz; OF <=1'bz; end
			endcase
			OF <= A[31]^B[31]^F[31]^C;
			if (F == 0)
			     ZF <= 1;
			else 
			     ZF <= 0;
		end
endmodule
