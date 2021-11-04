`timescale 1ns / 1ps

module uart(
    input send, // To signal when to send data
    input clk,
    output uart_tx
    );
    /*
     Let's aasume the clock is 100MHz 
     so to send the data at let's say 115200bps 
     we need to, fclk/bps
    */ 
    parameter bit_tmr_max = 868;
    parameter bit_index_max = 10; // [Start bit |data byte |stop bit]
    
    //states 
    parameter rdy = 0, load_bit = 1, send_bit = 2;
    
    //temp
    reg[9:0] bitTmr = 0; //10bits for the counter to reach the bit_tmr_max 
    reg bitDone;
    reg[3:0] bitIndex;  //for 3 chunks of data format Start|data|Stop
    reg txBit = 1'b1;
    reg[9:0] txData;
    reg[1:0] state = rdy;
    
    // Generating Bit rate (Counter)
    always@(posedge clk) begin
        if(state == rdy)
            bitTmr <= 0;
        else begin 
            if(bitTmr == bit_tmr_max) begin
                bitDone <= 1'b1;
                bitTmr <= 0;
            end
            else begin
                bitTmr <= bitTmr + 1;
                bitDone <= 1'b0;
            end
        end
    end     
        
   //Next state Process
   always@(posedge clk) begin
        
        case(state)
            rdy : begin 
                txBit <= 1'b1;
                if(send == 1'b1) begin
                    state <= load_bit;
                            //start | data | stop
                    txData <= {1'b1, 8'h41, 1'b0};
                end
                else 
                    state <= rdy; //Loop untill ready     
                end
                
            load_bit: begin
                bitIndex <= bitIndex + 1;
                txBit <= txData[bitIndex];
                state <= send_bit;
            end
            
            send_bit: begin
                if(bitDone == 1'b1) begin
                    if(bitIndex == bit_index_max)
                        state <= rdy;
                    else
                        state <= load_bit;
                end
            
            end 
            
            default : state <= rdy;
            
        endcase    
        
   end     
        
   assign uart_tx = txBit; 
    
endmodule
