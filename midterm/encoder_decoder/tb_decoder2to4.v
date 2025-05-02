`timescale 1ns / 1ps
module tb_decoder2to4;
reg [1:0] in;
reg en;
wire [3:0] out;

decoder2to4 uut(
    .in(in), .en(en), .out(out));

initial begin
    $dumpfile("decoder2to4.vcd");
    $dumpvars(0, tb_decoder2to4);

    $display("Time\tin\ten\tout");
    $monitor("\t%b\t%b\t%b", in, en, out);

    in = 2'b00;
    en = 0; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    en = 1; #10;
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    $finish;
    end
endmodule