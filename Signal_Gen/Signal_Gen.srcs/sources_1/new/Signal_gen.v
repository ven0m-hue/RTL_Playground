`timescale 1ns / 1ps

module Signal_gen(
 input clk,
 input [1:0] sel,
 output [3:0] dout
    );
    
   reg [3:0] temp;
   integer i, j;
   
   initial begin
   temp = 0;
   i = 0;
   j = 0;
   end
   
   always@(posedge clk) begin
    
    case(sel)
    2'b00 : begin
    temp <= temp + 1;
    end
    
    2'b01 : begin 
    if(i < 15) begin 
        temp <= temp + 1;
        i <= i + 1;
        end
    else if(i>=15 && i<30) begin
        temp <= temp - 1;
        i <= i + 1;
        end
    else begin
    i <= 0;
    temp <= 0;
    end    
    end    
    
    2'b10 : begin
    if(j < 5) begin
        temp <= 4'b0000;
        j = j + 1;
        end
    else if(j>=5 && j<10)begin
        temp <= 4'b1111;
        j = j + 1;
        end    
        
    else begin 
    j <= 0;
    temp <= 4'b0000;    
    end
    end
    
    default : temp <= 4'bxxxx;

    endcase
   
   end
    
    
endmodule
