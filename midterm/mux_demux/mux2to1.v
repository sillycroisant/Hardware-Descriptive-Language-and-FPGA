module mux2to1
  (
    input wire [3:0]in1, in2, 
    input wire sel,
    output wire [3:0] out
  );
  
  assign out = sel ? in2 : in1;
  
endmodule

// OKE