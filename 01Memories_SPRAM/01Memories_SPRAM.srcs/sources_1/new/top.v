`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2021 20:14:28
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Implementation of the single port RAM 
// Single port RAM can perform single read or write at a time and not both.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk, cs, we,
    input [7:0] addr,
    input [7:0]datain,
    output [7:0]dataout
    );
    
    // depthxword 
    // data size   no.of data element
    reg [7:0] mem [255:0]; // distributed memory using single port RAM
    
    always@(posedge clk)
    begin : write_process // just gave a process name.  
    if(cs & we)
        mem[addr] <= datain;
    end  
    
    reg[7:0] temp;
    always@(posedge clk)
    begin : read_process // just gave a process name.  
    if(cs & !we)
        temp <= mem[addr];
    end
    
    assign dout = temp;
    
    
endmodule
