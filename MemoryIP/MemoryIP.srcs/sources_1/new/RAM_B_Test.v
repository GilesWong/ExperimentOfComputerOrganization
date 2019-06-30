`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 13:58:47
// Design Name: 
// Module Name: RAM_B_Test
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

module RAM_B_Test(switches,C,Mem_Write,Clk,LED);

    input [31:0] switches;//32位开关
    input Mem_Write,Clk;//clk为按键C9，读写使能信号为按键C4，0为读，1为写
    input [1:0]C;//按钮的两位，用于选择32位开关的数据是地址还是写入数据
    output reg [31:0]LED;
    wire [31:0]M_R_Data;//存在存储器里的32位读出数据
    reg [31:0]M_W_Data;//寄存在暂存器的32位写入数据
    reg [5:0]Mem_Addr;//开关的3、4、5、6、7、8位
    RAM_B RAM_TEST (
      .clka(Clk), //输入时钟信号
      .wea(Mem_Write), //输入读写信号
      .addra(Mem_Addr), //输入6位地址信号
      .dina(M_W_Data), //写入32位数据
      .douta(M_R_Data) //读出32位数据
    );

    always@(*)
    begin
      if(!Mem_Write)//读操作
        begin
            LED <= M_R_Data; //读出数据
	   end
	 else
	   begin
	       case(C)
		       2'b01:
              begin M_W_Data <= switches; end//录入写入的数据
		       2'b10:
              begin Mem_Addr <= switches[5:0]; end //录入地址
		       default: begin end //什么也不做
		  endcase
       end
	end
endmodule