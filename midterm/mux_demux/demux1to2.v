// Code your design here
module demux1to2(
  input wire [1:0] in,
  input wire sel,
  output reg [1:0] out2, out1
);
  
  always@ * begin
    if(sel) begin
      out1 = in; 
      out2 = 2'b00;
    end else begin
      out1 = 2'b00;
      out2 = in;
    end
  end
endmodule