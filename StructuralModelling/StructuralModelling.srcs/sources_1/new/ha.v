`timescale 1ns / 1ps
//Daughter module 
module ha(
    input a,b,
    output s,c
    );
    
    assign s = a ^ b;
    assign c = a & b;
       
endmodule


//Parent module

module fa(
    input a,b,cin,
    output sout,cout
);

wire t1,t2,t3;

ha dut1(a,b,t1,t2);
ha dut2(.s(sout), .c(t3), .a(cin), .b(t1));

assign cout = t3 | t2;

endmodule