// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module tb_demux1to4;
  reg [1:0] in;
  reg [1:0] sel;
  wire [1:0] out1, out2, out3, out4;
  
  demux1to4 uut(
    .in(in),
    .sel(sel),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .out4(out4));
  
  initial begin
    $dumpfile("demux1to4.vcd");
    $dumpvars(0, tb_demux1to4);
    
    $display("Time\tin\tsel\tout1\tout2\tout3\tout4");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", $time, in, sel, out1, out2, out3, out4);

    
    in = 2'b11; sel = 2'b00; #10;
    
    sel = 2'b01; #10;
    
    sel = 2'b10; #10;
    
    sel = 2'b11; #10;
    
    $finish;
  end
endmodule