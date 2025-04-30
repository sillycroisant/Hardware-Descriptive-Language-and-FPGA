module demux1to4(
  input wire [1:0] in,
  input wire [1:0] sel,
  output wire [1:0] out1, out2, out3, out4);
  
  wire [1:0] w1, w2;
  
  demux1to2 dm1(in, sel[1], w1, w2);
  demux1to2 dm2(w1, sel[0], out1, out2);
  demux1to2 dm3(w2, sel[0], out3, out4);
endmodule

// out1, out2, out3, out4 ở đây được đưa vào module demux1to2 sử dụng continuous assignment phải được khai báo là wire