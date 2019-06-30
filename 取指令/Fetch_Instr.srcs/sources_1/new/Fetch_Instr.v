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
		.wea(0),
    .addra(PC[7:2]),
    .douta(Inst_code)
    );
	assign PC_new=PC+4;
	always@(negedge rst or negedge clk)
	begin
	 if(rst)
	  PC=32'h00000000;
	 else
	  PC={24'h000000,PC_new[7:0]};
	end
endmodule
