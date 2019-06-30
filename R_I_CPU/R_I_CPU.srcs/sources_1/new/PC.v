`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/22 19:28:12
// Design Name: 
// Module Name: Fetch_Instr
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


module Fetch_Instr(
    input rst,
	input clk,
	output [31:0]Inst_code,
    output reg [31:0]PC
    );
    wire [31:0]PC_new;
	initial
	  PC=32'h00000000;
	blk_mem_gen_0 Inst_addr (
    .clka(clk),
    .addra(PC[7:2]),
    .douta(Inst_code)
    );
	assign PC_new=PC+4;
	always@(negedge clk)
	begin
	 if(rst)
	  PC=32'h00000000;
	 else
	  PC={24'h000000,PC_new[7:0]};
	end
endmodule
