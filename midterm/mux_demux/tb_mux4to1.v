`timescale 1ns / 1ps

module tb_mux4to1;
  reg [3:0] in1, in2, in3, in4;
  reg [1:0] sel;
  wire [3:0] out;

  // Instance của module mux4to1
  mux4to1 uut (
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Tạo file waveform
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, tb_mux4to1);  // <-- Đổi tên chính xác

    $display("Time\tin1\tin2\tin3\tin4\tsel\tout");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", $time, in1, in2, in3, in4, sel, out);

    // Test case 1: sel = 00 => out = in1
    in1 = 4'b0001; in2 = 4'b0010; in3 = 4'b1111; in4 = 4'b1001; sel = 2'b00; #10;

    // Test case 2: sel = 01 => out = in2
    sel = 2'b01; #10;

    // Test case 3: sel = 10 => out = in3
    sel = 2'b10; #10;

    // Test case 4: sel = 11 => out = in4
    sel = 2'b11; #10;

    $finish;
  end
endmodule
