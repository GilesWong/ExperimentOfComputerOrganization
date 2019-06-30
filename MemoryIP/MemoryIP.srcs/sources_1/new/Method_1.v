`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 13:47:56
// Design Name: 
// Module Name: Method_1
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


module Method_1(
    input wire Mem_Read,
    input wire Mem_Write,
    input wire[7:0]Mem_Addr,
    input wire[31:0]M_W_Data,
    output reg[31:0]M_R_Data
    );
	reg[63:0] Memory[0:31];
	always@(*)
		begin
			if(Mem_Read==1&&Mem_Write==0)
				begin
					M_R_Data<=Memory[Mem_Addr];
				end;
			if(Mem_Read==0&&Mem_Write==1)
				begin
					Memory[Mem_Addr]<=M_W_Data;
				end
		end
	

    
endmodule
