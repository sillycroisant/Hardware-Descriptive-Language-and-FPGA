`timescale 1ns/1ps

module tb_demux1to8;

  // Inputs
  reg [1:0] in;
  reg [2:0] sel;

  // Outputs
  wire [1:0] out1, out2, out3, out4, out5, out6, out7, out8;

  // Instantiate the DUT (Device Under Test)
  demux1to8 uut (
    .in(in),
    .sel(sel),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .out4(out4),
    .out5(out5),
    .out6(out6),
    .out7(out7),
    .out8(out8)
  );

  initial begin
    // Dump waveform for GTKWave
    $dumpfile("demux1to8.vcd");
    $dumpvars(0, tb_demux1to8);

    $display("Time\tin\tsel\tout1\tout2\tout3\tout4\tout5\tout6\tout7\tout8");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, in, sel, out1, out2, out3, out4, out5, out6, out7, out8);
    // Test all 8 output selections
    in = 2'b11;
    
    sel = 3'b000; #10;
    sel = 3'b001; #10;
    sel = 3'b010; #10;
    sel = 3'b011; #10;
    sel = 3'b100; #10;
    sel = 3'b101; #10;
    sel = 3'b110; #10;
    sel = 3'b111; #10;

    $finish;
  end
endmodule
