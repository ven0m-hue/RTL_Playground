`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2021 21:11:15
// Design Name: 
// Module Name: tb
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


module tb();

reg clk, cs, we;
reg [7:0] datain, addr;
wire [7:0] dataout;

integer i = 0;

top dut (
.clk(clk),
.cs(cs),
.we(we),
.addr(addr),
.datain(datain),
.dataout(dataout)
);


always #5 clk = ~clk;
initial begin 
clk = 1'b0;
cs = 1'b0;
addr = 0;
datain = 0;
#20 cs = 1'b1;

//write process 
for(i = 0; i<5; i = i +1) begin 
@(posedge clk);
write();
end

//read process
for(i = 0; i<5; i = i +1) begin 
@(posedge clk);
read();
end


end

//Write task defination 
task write();
begin
addr = addr + 1;
we = 1'b1;
datain = $random;
end
endtask 

//Read task defination 
task read();
begin
addr = addr - 1;
we = 1'b0;
end
endtask 


endmodule
