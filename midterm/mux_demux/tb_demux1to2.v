// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module tb_demux1to2;
  reg [1:0] in;
  reg sel;
  wire [1:0] out1, out2;
  
  demux1to2 uut(
    .in(in),
    .sel(sel),
    .out2(out2),
    .out1(out1));
  
  initial begin
    $dumpfile("demux1to2.vcd");
    $dumpvars(0, tb_demux1to2);
    
    $display("Time\tin\tsel\tout1\tout2");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, in, sel, out1, out2);
    
    in = 2'b11; sel = 0; #10;
    
    sel = 1; #10;
    
    sel = 0; #10;
    
    $finish;
  end
endmodule