`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 20:15:04
// Design Name: 
// Module Name: siim_1
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


module sim_1;
    // Inputs
    reg [31:0]in;
    reg [5:0]button;
    reg clk;
    // Outputs
    wire [31:0] outA;
	wire [31:0] outB;
    Segment_top uut(
                    .BUTTON(button),
                    .DATA_IN(in),
                    .DATA_OUT(outA),
                    .clk(clk),
					.R_B_DATA(outB)
                    );
    initial begin
        // Initialize Inputs
		in = 0;
		button = 0;
        clk = 0;
        
		// Wait 100 ns for global reset to finish
		#100;
		
		//输入三个地址
		#50
		in = 32'b00000_00001_00000_00000000000000000;
		button = 6'b100000;
		//输入数值
		#50
		button = 6'b010000;
		in = 32'h0000_000A;
		//写入
		#50
		button = 6'b000110;
		clk = 1;
		in = 0;
		//读数据
		#50
		clk = 0;
		button = 6'b000000;
		in = 32'h0000_0000;

		//输入三个地址
		#50
		in = 32'b00000_00001_00001_00000000000000000;
		button = 6'b100000;
		//输入数值
		#50
		button = 6'b010000;
		in = 32'h0000_0AAA;
		//写入
		#50
		button = 6'b000110;
		clk = 1;
		in = 0;
		//读数据
		#50
		clk = 0;
		button = 6'b000000;
		in = 32'h0000_0000;

		//输入三个地址
		#50
		in = 32'b00001_00010_00010_00000000000000000;
		button = 6'b100000;
		//输入数值
		#50
		button = 6'b010000;
		in = 32'h1234_5AAA;
		//写入
		#50
		button = 6'b000110;
		clk = 1;
		in = 0;
		//读数据
		#50
		clk = 0;
		button = 6'b000000;
		in = 32'h0000_0000;

		//输入三个地址
		#50
		in = 32'b000010_00011_00011_00000000000000000;
		button = 6'b100000;
		//输入数值
		#50
		button = 6'b010000;
		in = 32'h8765_4AAA;
		//写入
		#50
		button = 6'b000110;
		clk = 1;
		in = 0;
		//读数据
		#50
		clk = 0;
		button = 6'b000000;
		in = 32'h0000_0000;
		end
endmodule
