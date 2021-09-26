`timescale 1ns / 1ps

module Or2(
    input a,b,
    output y
    );
    
    wire temp1, temp2;
    
    supply0 vdd;
    supply1 vss;
    //OR section
    //NOR section
    //Pmos section
    pmos p1 (temp1, vdd, a);
    pmos p2 (temp2, temp1, b);
    //Nmos section
    nmos n1 (temp2,vss,a);
    nmos n2 (temp2,vss,b);
    //Not section
    pmos p3 (y, vdd, temp2);
    nmos n3 (y,vss, temp2);
    
    
endmodule
