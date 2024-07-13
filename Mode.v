`timescale 1ns/1ps
module modeControl (
    input clock,
    input reset,
    input mode,
    input valid_vote_casted,
    input [7:0]candidate_vote0,
    input [7:0]candidate_vote1,
    input [7:0]candidate_vote2,
    input [7:0]candidate_vote3,
    input candidate_button_press0,
    input candidate_button_press1,
    input candidate_button_press2,
    input candidate_button_press3,
    output reg [7:0]led
);
  reg [30:0]counter;
  always @(posedge clock) 
  begin
   if(reset)
      counter <= 0;
   else if(valid_vote_casted)
      counter <= counter + 1;
   else if(counter != 0 & counter < 10)
      counter <= counter + 1;
   else
      counter <= 0;        
  end

  always @(posedge clock) 
  begin
    if(reset)
      led <= 0;
    else
    begin
        if(mode == 0 & counter > 0)
           led <= 8'hFF;
        else if(mode == 0)
           led <= 8'h00;
        else if(mode == 1)
        begin
            if(candidate_button_press0)
               led <= candidate_vote0;
            else if(candidate_button_press1)
               led <= candidate_vote1;
            else if(candidate_button_press2)
               led <= candidate_vote2;
            else if(candidate_button_press3)
               led <= candidate_vote3;         
        end      
    end
  end
endmodule