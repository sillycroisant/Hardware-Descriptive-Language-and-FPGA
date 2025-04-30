// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module tb_mux8to1;
  reg [3:0] in1, in2, in3, in4, in5, in6, in7, in8;
  reg [2:0] sel;
  wire [3:0] out;
  
  mux8to1 uut(
    .in1(in1), .in2(in2), .in3(in3), .in4(in4),
    .in5(in5), .in6(in6), .in7(in7), .in8(in8),
    .sel(sel), .out(out));
  
  initial begin
    $dumpfile("mux8to1.vcd");
    $dumpvars(0, tb_mux8to1);
    
    $display("Time\t sel\t out");
    $monitor("%0t\t %b\t %b", $time, sel, out);

    // Gán dữ liệu cho các ngõ vào
    in1 = 4'b0001; in2 = 4'b0010; in3 = 4'b0011; in4 = 4'b0100;
    in5 = 4'b0101; in6 = 4'b0110; in7 = 4'b0111; in8 = 4'b1000;

    // Test từng giá trị của sel
    sel = 3'b000; #10;  // out = in1
    sel = 3'b001; #10;  // out = in2
    sel = 3'b010; #10;  // out = in3
    sel = 3'b011; #10;  // out = in4
    sel = 3'b100; #10;  // out = in5
    sel = 3'b101; #10;  // out = in6
    sel = 3'b110; #10;  // out = in7
    sel = 3'b111; #10;  // out = in8
    
    $finish;
  end
endmodule