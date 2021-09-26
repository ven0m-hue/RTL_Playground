`timescale 1ns / 1ps

module and2(
    input a,b,
    output y
    );
    
    wire temp;
    
    supply0 vdd;
    supply1 vss;
    
    pmos p1 (temp, vdd, a);
    pmos p2 (y, temp, b);
    
    nmos n1 (y,vss,a);
    nmos n2 (y,vss,b);
    
    
endmodule
