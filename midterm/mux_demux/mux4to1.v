module mux4to1
  (
  input wire [3:0] in1, in2, in3, in4,
  input wire [1:0]sel,
  output wire [3:0] out
  );
  
  wire [3:0] out1 , out2;
  
  mux2to1 mux1(in4, in3, sel[1], out1);
  mux2to1 mux2(in2, in1, sel[1], out2);
  mux2to1 mux3(out1, out2, sel[0], out);
  
endmodule