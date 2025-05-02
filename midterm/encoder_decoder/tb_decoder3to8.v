`timescale  1ns / 10ps

module tb_decoder3to8;
// signal declaration
reg [2:0] in;
reg en;
wire [7:0] out;

decoder3to8 uut(
    .in(in), .en(en), .out(out));

    initial begin
    $dumpfile("decoder3to8.vcd");
    $dumpvars(0, tb_decoder3to8);

    $display("Time\tin\ten\tout");
    $monitor("\t%b\t%b\t%b", in, en, out);

    in = 3'b001; en = 0; #10;
    in = 8'b100; en = 0; #10;
    in = 8'b100; en = 1; #10;
    in = 8'b000; #10;
    in = 8'b001; #10;
    in = 8'b010; #10;
    in = 8'b110; #10;
    in = 8'b111; #10;

    $finish;
    end
endmodule
