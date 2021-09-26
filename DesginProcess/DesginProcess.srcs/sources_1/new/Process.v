`timescale 1ns / 1ps

module Process(
    input clk,rst,din,
    output reg dout
    );

//3 Process design 
parameter state0 = 0, state1 = 1;
//Single bit variable
reg state = 0,next_state = 0;

//Reset logic ->synchronous
always@(posedge clk or posedge rst)
begin
if(rst)
state <= state0;
else
state <= next_state;
end

//Next state decoder 
always@(state or din)
begin
case (state)
state0:
begin
if(din)
next_state = state1;
else
next_state = state0;
end

state1:
begin
if(din)
next_state = state0;
else
next_state = state1;
end

endcase
end


//Ouput decoder logic 
always@(state)
begin 
case(state)
state0: dout = 1'b0;
state1: dout = 1'b1;
endcase
end 

endmodule

///testbench

module tb();

reg clk,rst,din;
wire dout;

Process dut(clk, rst,din, dout);

initial begin
clk = 0;
rst = 1;
din = 0;
end

always #5 clk = ~clk;

initial begin
#20;
rst = 0;
din = 1;
#200;
$finish;
end
endmodule




















