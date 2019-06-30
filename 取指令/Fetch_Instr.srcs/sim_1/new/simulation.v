`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/15 23:27:02
// Design Name: 
// Module Name: simulation
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


module simulation;
    // Inputs
    reg rst;
    reg clk;
    // Outputs
    wire [31:0] out;
    wire [31:0] PC;
    Fetch_Instr_Top uut(
        .rst(rst),
        .clk(clk),
        .LED(out),
        .PC(PC)
    );
    initial begin

        // Initialize Inputs
		rst = 0;
        clk = 0;
        
		// Wait 100 ns for global reset to finish
		#100;

        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        end
endmodule
