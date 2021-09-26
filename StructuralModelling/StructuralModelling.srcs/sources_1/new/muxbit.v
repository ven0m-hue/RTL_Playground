`timescale 1ns / 1ps
//Daughter 
module muxbit(
    input a,b,sel,
    output y
    );
    
    assign y = (sel == 1'b1)? a: b;
    
endmodule

//Parent module
module mux_eightb(
    input [7:0]a,
    input [2:0]sel,
    
    output y 
);

wire t1,t2,t3,t4,t5,t6;

muxbit m1 (.a(a[0]), .b(a[1]), .sel(sel[2]), .y(t1));
muxbit m2 (.a(a[2]), .b(a[3]), .sel(sel[2]), .y(t2));
muxbit m3 (.a(a[4]), .b(a[5]), .sel(sel[2]), .y(t3));
muxbit m4 (.a(a[6]), .b(a[7]), .sel(sel[2]), .y(t4));

muxbit m5 (.a(t1), .b(t2), .sel(sel[1]), .y(t5));
muxbit m6 (.a(t3), .b(t4), .sel(sel[1]), .y(t6));

muxbit m7 (.a(t5), .b(t6), .sel(sel[0]), .y(y));


endmodule

//Testbench 
module tb();

reg [7:0] a;
reg [2:0] sel;

wire y;

initial begin
 a = 8'b00000000;
 sel = 3'b000;
end 

mux_eightb dut (.a(a), .sel(sel), .y(y));

always #5 a = ~a;
always #30 sel = ~sel;

initial begin
#100;
$finish;
end


endmodule



