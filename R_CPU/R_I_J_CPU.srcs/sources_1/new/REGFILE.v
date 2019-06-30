`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/09 19:44:57
// Design Name: 
// Module Name: Segment
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


module REGS(
    input wire[4:0]R_Addr_A,
    input wire[4:0]R_Addr_B,
    input wire[4:0]W_Addr,
    input wire Write_Reg,
    input wire[31:0]W_Data,
    input Clk,
	input Reset,
    output wire[31:0]R_Data_A,
    output wire[31:0]R_Data_B
    );
    reg [31:0] REG_Files[0:31];
    integer i;
    
    initial 
        for(i=0;i<32;i=i+1)
				REG_Files[i]<=32'b0;
    always @(posedge Clk or posedge Reset)
    begin 
	if(Reset) 
		begin
			for(i=0;i<32;i=i+1)
				REG_Files[i]<=32'b0;
		end
	else 
		begin
			if(Write_Reg)
				REG_Files[W_Addr]<=W_Data;
		end
    end

assign R_Data_A= REG_Files[R_Addr_A];
assign R_Data_B= REG_Files[R_Addr_B];

endmodule
