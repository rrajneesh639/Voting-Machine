`timescale 1ns/1ps
`include "votingMachine.v"

module vm_tb;
    reg clock;
    reg reset;
    reg mode;
    reg Candidate1;
    reg Candidate2;
    reg Candidate3;
    reg Candidate4;
    wire [7:0]led;

    votingmachine vm(
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .button0(Candidate1),
    .button1(Candidate2),
    .button2(Candidate3),
    .button3(Candidate4),
    .led(led)
    );
    
    initial begin
        clock = 0;
        forever begin
            #5 clock = ~clock;
        end
    end

    initial begin
        reset = 1;
        mode = 0;
        Candidate1 = 0;
        Candidate2 = 0;
        Candidate3 = 0;
        Candidate4 = 0;
        #100;
        #100 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=1;Candidate2=0;Candidate3=0;Candidate4=0;
        #10 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=1;Candidate2=0;Candidate3=0;Candidate4=0;
        #200 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #10 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;

        #5 reset=0;mode=0;Candidate1=0;Candidate2=1;Candidate3=0;Candidate4=0;
        #200 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #10 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;

        #5 reset=0;mode=0;Candidate1=1;Candidate2=1;Candidate3=0;Candidate4=0;
        #200 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #10 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;

        #5 reset=0;mode=1;Candidate1=1;Candidate2=0;Candidate3=0;Candidate4=0;
        #200 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #10 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;

        #5 reset=0;mode=1;Candidate1=0;Candidate2=1;Candidate3=0;Candidate4=0;
        #200 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #10 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;

        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=1;Candidate4=0;
        #200 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #10 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;
        #5 reset=0;mode=0;Candidate1=0;Candidate2=0;Candidate3=0;Candidate4=0;

        $finish;
    end

    initial begin
        $dumpfile("vm.vcd");
        $dumpvars(0,vm_tb);
    end

    initial
      $monitor($time,"mode = %b, Candidate1 = %b, Candidate2 = %b, Candidate3 = %b, Candidate4 = %b, led = %d",mode,Candidate1,Candidate2,Candidate3,Candidate4,led);

endmodule