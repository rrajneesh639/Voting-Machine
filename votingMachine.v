`timescale 1ns/1ps
`include "Button.v"
`include "Mode.v"
`include "votelogger.v"

module votingmachine (
    input clock,
    input reset,
    input mode,
    input button0,
    input button1,
    input button2,
    input button3,
    output [7:0]led
);
 wire valid_vote0;
 wire valid_vote1;
 wire valid_vote2;
 wire valid_vote3;
 wire [7:0] cand_vote_recvd0;
 wire [7:0] cand_vote_recvd1;
 wire [7:0] cand_vote_recvd2;
 wire [7:0] cand_vote_recvd3;
 wire anyvalidvote;

 assign anyvalidvote = valid_vote0|valid_vote1|valid_vote2|valid_vote3;

 buttonControl b0(.clock(clock),.reset(reset),.button(button0),.validVote(valid_vote0));    
 buttonControl b1(.clock(clock),.reset(reset),.button(button1),.validVote(valid_vote1));    
 buttonControl b2(.clock(clock),.reset(reset),.button(button2),.validVote(valid_vote2));    
 buttonControl b3(.clock(clock),.reset(reset),.button(button3),.validVote(valid_vote3));  

 voteCounter v1(
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .cand_valid_vote0(valid_vote0),
    .cand_valid_vote1(valid_vote1),
    .cand_valid_vote2(valid_vote2),
    .cand_valid_vote3(valid_vote3),
    .cand_vote_recvd0(cand_vote_recvd0),
    .cand_vote_recvd1(cand_vote_recvd1),
    .cand_vote_recvd2(cand_vote_recvd2),
    .cand_vote_recvd3(cand_vote_recvd3)
);  
 
 modeControl mc(
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .valid_vote_casted(anyvalidvote),
    .candidate_vote0(cand_vote_recvd0),
    .candidate_vote1(cand_vote_recvd1),
    .candidate_vote2(cand_vote_recvd2),
    .candidate_vote3(cand_vote_recvd3),
    .candidate_button_press0(valid_vote0),
    .candidate_button_press1(valid_vote1),
    .candidate_button_press2(valid_vote2),
    .candidate_button_press3(valid_vote3),
    .led(led)
);
endmodule