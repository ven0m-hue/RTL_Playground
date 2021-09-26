`timescale 1ns / 1ps

module bitadder(
    input a,b,cin,
    output s,cout
    );
    
    wire t,t1,t2,t3,t4;
    
    xor x1 (t, a,b);
    xor x2 (s,t,cin);
    
    and a1 (t1,a,b);
    and a2 (t2,b,cin);
    and a3 (t3,cin,a);
    
    or o1 (t4, t1,t2);
    or o2 (cout, t4,t3);
    
    
    
endmodule


module rip_adder(
    input [3:0] a,
    input [3:0] b,
    input [3:0] cin,
    output [3:0] s,
    output [3:0] cout
);

bitadder a0 (a[0], b[0], cin[0], s[0], cout[0]);
bitadder a1 (a[1], b[1], cout[0], s[1], cout[1]);
bitadder a2 (a[2], b[2], cout[1], s[2], cout[2]);
bitadder a3 (a[3], b[3], cout[2], s[3], cout[3]);


endmodule 