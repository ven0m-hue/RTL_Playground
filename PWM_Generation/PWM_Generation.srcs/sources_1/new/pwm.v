`timescale 1ns / 1ps

module pwm(
    input clk,
    output out
    );
    
 reg dt = 0;
 parameter total_period = 5000;
 integer step_size = 50;
 integer i = 0;
 reg data = 0;
 
 always@ (posedge clk) begin
    
    if( i <= step_size)begin
        i = i + 1;
        dt <= 1;
        data <= 0;
    end
    else if(i > step_size && i<= total_period) begin
        i =  i + 1;
        dt <= 0;
    end
    else begin
        i = 0;
        data = 1;
    end
    
 end    
    
 always@ (posedge clk) begin
    
    if(data)
        if( step_size < total_period)
            step_size = step_size + 50;
        else 
        step_size = 0;
   end 
   
   
   assign out = dt;
    
    
endmodule
