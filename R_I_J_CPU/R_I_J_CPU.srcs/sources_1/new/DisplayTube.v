`timescale 1ns / 1ps

module DisplayTube(data, clk, which, out

    );
    input[31:0] data;
    input clk;
    output reg [2:0] which;
    output reg [7:0] out;
    
    reg [3:0] digit;
    reg [10:0] count = 0;
    always @(posedge clk) count <= count + 1'b1;
    always @(negedge clk) if (&count) which <= which + 1'b1;
    
    always @(*)
    begin 
        case (which) 
            3'h0: digit <= data[31:28];
            3'h1: digit <= data[27:24];
		    3'h2: digit <= data[23:20];
			3'h3: digit <= data[19:16];
			3'h4: digit <= data[15:12];
			3'h5: digit <= data[11:8];
			3'h6: digit <= data[7:4]; 
			3'h7: digit <= data[3:0]; 
			endcase
	end
	
	always @(*)
	begin 
	    case(digit)
	     4'h0: out <= 8'b0000_0011;
         4'h1: out <= 8'b1001_1111;
         4'h2: out <= 8'b0010_0101;
         4'h3: out <= 8'b0000_1101;
         4'h4: out <= 8'b1001_1001;
         4'h5: out <= 8'b0100_1001;
         4'h6: out <= 8'b0100_0001;
         4'h7: out <= 8'b0001_1111;
         4'h8: out <= 8'b0000_0001;
         4'h9: out <= 8'b0000_1001;
         4'hA: out <= 8'b0001_0001;
         4'hB: out <= 8'b1100_0001;
         4'hC: out <= 8'b0110_0011;
         4'hD: out <= 8'b1000_0101;
         4'hE: out <= 8'b0110_0001;
         4'hF: out <= 8'b0111_0001;
		endcase
	end
endmodule
