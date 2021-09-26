`timescale 1ns / 1ps

module counter_tb();

/*
input CE;
  input CLK;
  input [15:0]L;
  input LOAD;
  input UP;
  output [15:0]Y;

*/

reg CE, CLK, LOAD, UP;
reg [15:0] L;
wire [15:0] Y;

design_1_wrapper dut(CE, CLK, L, LOAD, UP, Y);

initial begin
CE = 0;
CLK = 0;
LOAD = 0;
UP = 0;
L = 0;
end

always #5 CLK = ~CLK;  //clock signal 

initial begin
#20
CE = 1;
LOAD = 1;
L = 1;
#20
LOAD = 0;
UP = 1;
#140
UP = 0;
#140;
CE =  0;
end

initial begin
#500
$finish;
end

endmodule
