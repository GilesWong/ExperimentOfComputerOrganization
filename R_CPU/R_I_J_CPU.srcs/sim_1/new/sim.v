`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/22 19:57:46
// Design Name: 
// Module Name: sim
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


module sim;
    // Inputs
    reg rst;
    reg clk;
    reg button;
    // Outputs
    wire [31:0] led;
    wire ZF,OF;
    R_CPU uut(
        .rst(rst),
        .clk(clk),
        .F(led),
        .ZF(ZF),
        .OF(OF)
    );

    initial begin
        // Initialize Inputs
		rst = 0;
        clk = 0;
        button = 0;
        
		// Wait 100 ns for global reset to finish
		#100;

        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;
        #20
        clk = 1;
        #20
        clk = 0;


    end
endmodule
