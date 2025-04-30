module demux1to8(
  input wire [1:0] in,
  input wire [2:0] sel,
  output wire [1:0] out1, out2, out3, out4, out5, out6, out7, out8);
  
  wire [1:0] w1, w2;
  
  demux1to2 dm1(in, sel[2], w1, w2);
  demux1to4 dm2(w1, sel[1:0], out1, out2, out3, out4);
  demux1to4 dm3(w2, sel[1:0], out5, out6, out7, out8);
  
endmodule