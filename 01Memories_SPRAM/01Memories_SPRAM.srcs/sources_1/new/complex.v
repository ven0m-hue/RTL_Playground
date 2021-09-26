`timescale 1ns / 1ps
//Design
module complex(
    input a,b,c,
    output y1,y2
    );
//Intermediate     
wire t1,t2,t3;

xor x1 (t1,a,b);
xor x2 (y1,c,t1);
and a1 (t2,a,b);    
and a2 (t3,c,t1);
or  o1 (y2,t2,t3);

endmodule

////////////////////////TestBench/////////////
module complex_tb();

reg a,b,c;
wire y1,y2;

initial begin 
a = 0;
b = 0;
c = 0;
end

complex dut(a,b,c,y1,y2);


//Clocks for inputs
always #5  a = ~a;
always #10 b = ~b;
always #15 c = ~c;


endmodule

