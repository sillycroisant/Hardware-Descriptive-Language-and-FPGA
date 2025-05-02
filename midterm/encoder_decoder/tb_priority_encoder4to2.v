// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module tb_priority_encoder4to2;
  reg [3:0] in;
  wire val;
  wire [1:0] out;
  
  priority_encoder4to2 uut(
    .in(in), .valid(valid), .out(out));
  
  initial begin
    $dumpfile("priority_encoder4to2.vcd");
    $dumpvars(0, tb_priority_encoder4to2);
    
	$display("Time\tin\tvalid\tout");
    $monitor("\t%b\t%b\t%b", in, valid, out);
    
    // Apply all 16 combinations
    in = 4'b0000; #10;
    in = 4'b0001; #10;
    in = 4'b0010; #10;
    in = 4'b0011; #10;
    in = 4'b0100; #10;
    in = 4'b0101; #10;
    in = 4'b0110; #10;
    in = 4'b0111; #10;
    in = 4'b1000; #10;
    in = 4'b1001; #10;
    in = 4'b1010; #10;
    in = 4'b1011; #10;
    in = 4'b1100; #10;
    in = 4'b1101; #10;
    in = 4'b1110; #10;
    in = 4'b1111; #10;

    $finish;
  end
endmodule