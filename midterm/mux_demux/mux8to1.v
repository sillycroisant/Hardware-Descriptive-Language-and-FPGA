module mux8to1(
  input wire [3:0] in1, in2, in3, in4, in5, in6, in7, in8,
  input wire [2:0] sel,
  output wire [3:0] out );
  
  wire [3:0] w1, w2;
  
  mux4to1 m1(in8, in7, in6, in5, sel[2:1], w1);
  mux4to1 m2(in4, in3, in2, in1, sel[2:1], w2);
  mux2to1 m3(w1, w2, sel[0], out);
  
endmodule