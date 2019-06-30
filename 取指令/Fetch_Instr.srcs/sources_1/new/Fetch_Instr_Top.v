`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/09 11:10:30
// Design Name: 
// Module Name: Fetch_Instr_Top
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


module Fetch_Instr_Top(
    input rst,
	input clk,
    input seg_clock,
    output [7:0] SEG,
	output [31:0]LED,
    output [2:0] which,
    output reg enable = 1,
    output reg [31:0]PC
    ); 
    wire [31:0] PC_new;
    //reg [31:0] PC;
	wire [31:0] Inst_code;    
    // assign LED = Inst_code;

	
	blk_mem_gen_0 Inst_addr (
    .clka(clk),
    .addra(PC[7:2]),
    .douta(LED)
    );
	assign PC_new=PC+4;
	always@(negedge clk)
	begin
	 if(rst)
	  PC<=32'h00000000;
	 else
	  PC<={24'h000000,PC_new[7:0]};
	end

    segControl sc(.data(PC),.clk(seg_clock),.which(which),.out(SEG));
endmodule

