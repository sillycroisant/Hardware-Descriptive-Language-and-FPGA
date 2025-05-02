`timescale 1ns / 1ps

module tb_priority_encoder8to3;

    reg [7:0] in;
    wire valid;
    wire [2:0] out;

    // Instantiate your DUT (Design Under Test)
    priority_encoder8to3 uut (
        .in(in),
        .valid(valid),
        .out(out)
    );

    initial begin
        $dumpfile("priority_encoder8to3.vcd");
        $dumpvars(0, tb_priority_encoder8to3);

    	$display("Time\tin\tvalid\tout");
        $monitor("\t%b\t%b\t%b", in, valid, out);

        // Apply test vectors
        in = 8'b00000000; #10; // No valid input
        in = 8'b00000001; #10; // LSB high → out = 000
        in = 8'b00000010; #10; // bit[1] high → out = 001
        in = 8'b00000100; #10; // bit[2] high → out = 010
        in = 8'b00001000; #10; // bit[3] high → out = 011
        in = 8'b00010000; #10; // bit[4] high → out = 100
        in = 8'b00100000; #10; // bit[5] high → out = 101
        in = 8'b01000000; #10; // bit[6] high → out = 110
        in = 8'b10000000; #10; // MSB high → out = 111

        // Multiple bits high → should pick highest priority (MSB)
        in = 8'b10101010; #10;

        $finish;
    end
endmodule
