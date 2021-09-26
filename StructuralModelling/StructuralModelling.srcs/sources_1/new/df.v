`timescale 1ns / 1ps

module df(
    input clk, clr, d,
    output reg dout
    );
    
    always@(posedge clk)
    begin
    if(clr == 1'b1)
        dout <= 0;
    else 
        dout <= d;    
    end
    
endmodule



//4bit shift register 

module shift_reg(
    input clk, clr, d, 
    output [3:0] dout
);


df d1 (clk, clr, d, dout[3]);
df d2 (clk, clr, dout[3], dout[2]);
df d3 (clk, clr, dout[2], dout[1]);
df d4 (clk, clr, dout[1], dout[0]);


endmodule


module jhonson(
    input clk, clr, 
    input d, 
    output [3:0] dout
);

df d1 (clk, clr, ~dout[0], dout[3]);
df d2 (clk, clr, dout[3], dout[2]);
df d3 (clk, clr, dout[2], dout[1]);
df d4 (clk, clr, dout[1], dout[0]);


endmodule 
