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
    reg [1:0] button;
    // Outputs
    wire [31:0] led;
    R_I_J_TOP uut(
        .rst(rst),
        .clk(clk),
        .button(button),
        .LED(led)
    );
    initial begin
        // Initialize Inputs
		rst = 0;
        clk = 0;
        button = 0;
        
		// Wait 100 ns for global reset to finish
		#100;

        forever

        #10 clk = ~clk;


    end
endmodule
