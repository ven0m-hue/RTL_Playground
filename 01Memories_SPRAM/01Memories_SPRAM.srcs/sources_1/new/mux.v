`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2021 22:30:49
// Design Name: 
// Module Name: mux
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

///Design code 
module mux(
    input a,b,sel,
    output y
    );
    
    wire t1, t2, t3;
    // output input, input..
    not n1 (t1,sel);
    and a1 (t2, a, t1);
    and a2 (t3, b, sel);
    or  o1 (y, t2, t3);
    
endmodule

///Testbench 
module mux_tb();

reg a,b,sel;
wire y;

initial begin
a = 0;
b = 0;
sel = 0;
end 

mux dut(a,b,sel,y);

//Clocks for inputs
always #5 a = ~a;
always #10 b = ~b;
always #25 sel = ~sel;


endmodule





