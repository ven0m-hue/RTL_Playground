`timescale 1ns / 1ps
//2Process steps for implementation of I2C protocols

//Process 1
module i2c(
    input clk,
    output sclk,
    inout sda,
    input reset
    );
    
//100Mhz internal clock 
//Max clocking rate of eerom is 400Khz
// 100M/400K = 250K, half cycle = 125K

//Generate SCLK clock for the eeprom
integer counter_clk = 0;
reg tclk; //To store the clock value
always@(posedge clk)begin 
if(counter_clk < 125)
    counter_clk <= counter_clk + 1; // non blocking statement
else begin 
    counter_clk = 0; // reinit the clock to 0 
    tclk <= ~tclk; //Textbook method to generate the clock in verilog 
end
end

//Process 2
//Now that we have tclk operating at 125KHz, we  can forget about about the clock
//It takes about 32 clock cycles to complete one transaction based on the i2c protocol addressing 
//3clocks for start 
//8 for address *2 and data 
//3 acks for address and data
//2 for stop
reg data_counter;
always@(posedge tclk or posedge reset)begin
if(reset == 1'b1)
    data_counter <= 0;
    else begin 
    if(data_counter < 32)
        data_counter <= data_counter + 1;
    else
        data_counter <= 0;
    end    
end

//Process 3
reg tdata = 0; // temp data
reg tnclk = 0; // Since start and stop follow different values of clock 
always@(posedge tclk or posedge reset)begin 
if(reset == 1'b1) begin
    tnclk <= 1;
    tdata <= 1;
    end
    else 
        case(data_counter)
         0: begin tnclk <= 1; tdata <= 1; end
      1: tdata <= 0;
      2: tnclk <= 0;
      //Slave Address 8'hA0
      3: tdata <= 1;
      4: tdata <= 0;
      5: tdata <= 1;
      6: tdata <= 0;
      7: tdata <= 0;
      8: tdata <= 0;
      9: tdata <= 0;
      10: tdata <= 0;  
      
      //Wait for ACK
      11: tdata <= 1'bz;
      // Memory Location Address
      12: tdata <= 0;
      13: tdata <= 0;
      14: tdata <= 0;
      15: tdata <= 0;
      16: tdata <= 0;
      17: tdata <= 0;
      18: tdata <= 0;
      19: tdata <= 0;
      //Wait for ACK
      20: tdata <= 1'bz;
      ///Data
       21: tdata <= 1;
       22: tdata <= 0;
       23: tdata <= 1; 
       24: tdata <= 0;
       25: tdata <= 1;
       26: tdata <= 0;
       27: tdata <= 1;
       28: tdata <= 0;
       //Wait for ACK
       29: tdata <= 1'bz;     
       ///Stop bits
       30 : begin tnclk <=1; tdata <= 0; end
       31 : tdata <= 1;
           default : tdata <= 1'bz; 
    
     endcase
    
end


assign sda = tdata;
assign sclk = ((data_counter >=3) & (data_counter < 30)) ? tclk : tnclk;


endmodule
