`timescale 1ns/1ps
module buttonControl (
    input clock,
    input reset,
    input button,
    output reg validVote 
);
  reg [30:0]counter;
  
  always @(posedge clock) 
  begin
    if (reset) 
      counter <= 0;
    else
    begin
        if (button & counter < 11) 
          counter <= counter + 1;  
        else if(!button)
          counter <= 0;
    end
  end

  always @(posedge clock) 
  begin
    if(reset)
      validVote <= 1'b0;
    else 
    begin
        if(counter == 10)
          validVote <= 1'b1;
        else
          validVote <= 1'b0;  
    end    
  end
endmodule