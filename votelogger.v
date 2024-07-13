`timescale 1ns/1ps
module voteCounter (
    input clock,
    input reset,
    input mode,
    input cand_valid_vote0,
    input cand_valid_vote1,
    input cand_valid_vote2,
    input cand_valid_vote3,
    output reg [7:0]cand_vote_recvd0,
    output reg [7:0]cand_vote_recvd1,
    output reg [7:0]cand_vote_recvd2,
    output reg [7:0]cand_vote_recvd3
);
  
  always @(posedge clock) 
  begin
    if(reset)
    begin
      cand_vote_recvd0 <= 0;
      cand_vote_recvd1 <= 0;
      cand_vote_recvd2 <= 0;
      cand_vote_recvd3 <= 0;
    end
    else
    begin
        if (cand_valid_vote0 & mode == 0) 
            cand_vote_recvd0 <= cand_vote_recvd0 + 1;
        else if(cand_valid_vote1 & mode == 0)
            cand_vote_recvd1 <= cand_vote_recvd1 + 1;
        else if(cand_valid_vote2 & mode == 0)
            cand_vote_recvd2 <= cand_vote_recvd2 + 1;
        else if(cand_valid_vote3 & mode == 0)
            cand_vote_recvd3 <= cand_vote_recvd3 + 1;            
    end
  end  
endmodule