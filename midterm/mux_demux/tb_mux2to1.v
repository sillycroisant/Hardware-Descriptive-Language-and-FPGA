`timescale 1ns / 1ps

module tb_mux2to1;

  // Khai báo các tín hiệu
  reg [3:0] in1, in2;  // Đầu vào 4 bit
  reg sel;              // Tín hiệu chọn
  wire [3:0] out;      // Đầu ra 4 bit

  // Instantiate module mux2to1
  mux2to1 uut (
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .out(out)
  );

  // Khối khai báo tín hiệu
  initial begin
    // Khởi tạo file dump để xem waveform
    $dumpfile("mux2to1.vcd");
    $dumpvars(0, tb_mux2to1);

    // In ra đầu vào, select và đầu ra
    $display("Time\tin1\tin2\tsel\tout");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, in1, in2, sel, out);

    // Test case 1: sel = 0 => out = in1
    in1 = 4'b0001; in2 = 4'b0010; sel = 0; #10;

    // Test case 2: sel = 1 => out = in2
    in1 = 4'b0101; in2 = 4'b1001; sel = 1; #10;

    // Test case 3: sel = 0 => out = in1
    in1 = 4'b1110; in2 = 4'b0011; sel = 0; #10;

    // Test case 4: sel = 1 => out = in2
    in1 = 4'b1010; in2 = 4'b1100; sel = 1; #10;

    // Kết thúc mô phỏng
    $finish;
  end

endmodule
