`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 19:37:57
// Design Name: 
// Module Name: test
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


module test;

	// Inputs
	reg write;
	reg clk;
	reg [5:0] addr;
	reg [31:0] data_in;
	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	RAM_B uut (
		.wea(write),
		.clka(clk),
		.addra(addr),
		.dina(data_in),
		.douta(data_out)
	);

	initial begin
		// Initialize Inputs
		addr = 0;
		data_in = 0;
        write = 0;
        clk = 0;
        
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// #50
		// clk = 0;
		// c = 2'b10;
		// switches = 32'h0000_0002;

        
        // #50
		// c = 0;
        // clk = 1;
        
        // #50
		// c = 2'b10;

        // clk = 0;
        
        #20
        clk = 1;
        #20
        clk = 0;
		//下面两个周期显示的是第0个值
		#20
		addr = 1;
        clk = 1;
        #20
        clk = 0;
		#20
        clk = 1;
        #20
        clk = 0;
		//第1个值自这里显示		
		#20
        clk = 1;
		addr = 2;
		#20
        clk = 0;
		#20
        clk = 1;
        #20
        clk = 0;
		//显示第2个值
		#20
		clk = 1;
		//一个周期后写入值fafafafa
		#20
		write = 1;
		data_in = 32'hfafa_fafa;
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
